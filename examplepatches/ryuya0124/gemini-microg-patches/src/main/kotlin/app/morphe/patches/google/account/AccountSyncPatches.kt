package app.morphe.patches.google.account

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Google アプリ内のアカウント切り替えロックおよびアカウント同期サービスの安定化パッチ
 *
 * 1. AccountSwitchLockBypass:
 *    マルチプロセス環境で account_switch_lock.lock の FileLock 取得がタイムアウトし、
 *    スプラッシュ画面で長時間待機した末にアカウント同期がスキップされる問題を解消。
 *    ロック取得コルーチン（Leasv.invokeSuspend）を即時 Boolean.TRUE 完了させることで、
 *    タイムアウトなしで直ちにアシスタント UI の初期化を続行させます。
 *
 * 2. AccountSyncLoopFix:
 *    TikTok AccountSyncService の bindService 失敗時に SecurityException が Completer に設定され、
 *    同期マネージャが無限再試行を行って Binder 接続上限（3000接続）に達し SIGKILL される問題を解消。
 *    bindService 判定レジスタを true (0x1) に固定し、バインド例外の無限ループを遮断します。
 */
val accountSwitchLockBypassPatch = bytecodePatch(
    name = "Account Switch Lock Bypass",
    description = "アカウント切り替えロックのタイムアウトをスキップし、スプラッシュ画面からの即時初期化を可能にします。",
    default = false
) {
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val lockMutexString = VersionHookRegistry.target(HookId.ACCOUNT_SWITCH_LOCK_BYPASS, packageMetadata).anchorStrings.single()
        val candidateClasses = getAllClassesWithString(lockMutexString)
        println("[AccountSwitchLockBypass] Found ${candidateClasses.size} candidate classes with '$lockMutexString'")

        var patchedCount = 0
        for (classDef in candidateClasses) {
            // Leasw 等のクラスから、呼び出されているコルーチンクラス（Leasv）を探索
            // または "accounts" / "account_switch_lock.lock" を参照しているクラスを探索
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                val insList = method.instructions.toList()
                for (ins in insList) {
                    if (ins.opcode == Opcode.NEW_INSTANCE) {
                        val ref = (ins as? ReferenceInstruction)?.reference?.toString() ?: ""
                        if (ref.startsWith("L") && ref.endsWith(";")) {
                            val helperClassDef = classDefByOrNull(ref) ?: continue
                            val helperMutable = mutableClassDefBy(helperClassDef)
                            for (hMethod in helperMutable.methods) {
                                if (hMethod.name == "invokeSuspend" && hMethod.implementation != null) {
                                    // この invokeSuspend が Boolean.TRUE を返すように先頭で短絡
                                    val hInsList = hMethod.instructions.toList()
                                    val hasFileChannelOrLock = hInsList.any { hIns ->
                                        val s = (hIns as? ReferenceInstruction)?.reference?.toString() ?: ""
                                        s.contains("FileChannel") || s.contains("tryLock") || s.contains("RandomAccessFile")
                                    }
                                    if (hasFileChannelOrLock) {
                                        println("[AccountSwitchLockBypass] Found lock coroutine: ${helperClassDef.type}->invokeSuspend")
                                        hMethod.addInstructions(
                                            0,
                                            """
                                                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                                return-object v0
                                            """
                                        )
                                        patchedCount++
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // 直接 "account_switch_lock.lock" を持つクラスの親クラスのコルーチンも念のため探索
        val lockFileCandidates = getAllClassesWithString("account_switch_lock.lock")
        for (classDef in lockFileCandidates) {
            println("[AccountSwitchLockBypass] Lock file referencing class: ${classDef.type}")
        }

        if (patchedCount > 0) {
            VersionHookRegistry.logHook(
                HookId.ACCOUNT_SWITCH_LOCK_BYPASS,
                "AccountLock",
                "SUCCESS",
                "Bypassed account switch lock wait in $patchedCount coroutines"
            )
        } else {
            println("[AccountSwitchLockBypass] Warning: No lock coroutines matched")
        }
    }
}

val accountSyncLoopFixPatch = bytecodePatch(
    name = "Account Sync Binder Loop Fix",
    description = "AccountSyncService へのバインド失敗による無限リトライと Binder リミットクラッシュを防止します。",
    default = false
) {
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        val targetString = VersionHookRegistry.target(HookId.ACCOUNT_SYNC_LOOP_FIX, packageMetadata).anchorStrings.single()
        val candidateClasses = getAllClassesWithString(targetString)
        println("[AccountSyncLoopFix] Found ${candidateClasses.size} candidate classes with '$targetString'")

        var patchedCount = 0
        for (classDef in candidateClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                val insList = method.instructions.toList()

                val bindStrIndex = insList.indexOfFirst { ins ->
                    (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((ins as? ReferenceInstruction)?.reference as? StringReference)?.string == targetString
                }

                if (bindStrIndex > 0) {
                    // "Binding to service" の直前にある IF_EQZ を探す
                    for (i in (bindStrIndex - 1) downTo maxOf(0, bindStrIndex - 5)) {
                        val ins = insList[i]
                        if (ins.opcode == Opcode.IF_EQZ) {
                            val reg = (ins as OneRegisterInstruction).registerA
                            println("[AccountSyncLoopFix] Found IF_EQZ at instruction $i with register v$reg in ${classDef.type}->${method.name}")
                            // IF_EQZ の直前で reg を 0x1 (true) に強制設定
                            method.addInstructions(
                                i,
                                """
                                    const/4 v$reg, 0x1
                                """
                            )
                            patchedCount++
                            break
                        }
                    }
                }
            }
        }

        if (patchedCount > 0) {
            VersionHookRegistry.logHook(
                HookId.ACCOUNT_SYNC_LOOP_FIX,
                "AccountSync",
                "SUCCESS",
                "Patched $patchedCount bindService failure branches"
            )
        } else {
            println("[AccountSyncLoopFix] Warning: No bindService branches patched")
        }
    }
}

val accountConvertFallbackPatch = bytecodePatch(
    name = "Account ID Fallback for Clone",
    description = "AGSA アカウント名から Account ID への変換失敗例外（flgu）を防止し、デフォルト AccountId でフォールバックします。",
    default = false
) {
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        VersionHookRegistry.requireProfile(packageMetadata)
        fun ensureRegisters(impl: Any?, minRegs: Int) {
            if (impl == null) return
            try {
                val field = impl.javaClass.getDeclaredField("registerCount")
                field.isAccessible = true
                val cur = field.getInt(impl)
                if (cur < minRegs) {
                    field.setInt(impl, minRegs)
                    println("[AccountConvertFallback] Expanded registerCount from $cur to $minRegs")
                }
            } catch (e: Exception) {
                println("[AccountConvertFallback] Note expanding registerCount: ${e.message}")
            }
        }

        // 1. ImmediateSuccessfulFuture クラス (Lfyca;) の検証
        val fallbackSpec = VersionHookRegistry.target(HookId.ACCOUNT_CONVERT_FALLBACK, packageMetadata)
        val immediateFutureClass = requireNotNull(fallbackSpec.className)
        println("[AccountConvertFallback] Target ImmediateSuccessfulFuture class: $immediateFutureClass")

        // 2. flia クラス（アカウントリゾルバ）を特定
        // "Found google email address as the old primary email address" を持つ flhx から特定
        val anchorStr = fallbackSpec.anchorStrings[0]
        val flhxCandidates = getAllClassesWithString(anchorStr)
        println("[AccountConvertFallback] Found ${flhxCandidates.size} candidate classes with '$anchorStr'")

        var patchedCount = 0
        val targetClassesToPatch = mutableSetOf<String>()

        for (classDef in flhxCandidates) {
            for (field in classDef.fields) {
                val fType = field.type
                if (fType.startsWith("L") && fType.endsWith(";") && !fType.startsWith("Ljava/")) {
                    targetClassesToPatch.add(fType)
                }
            }
        }

        // eass（Failed to convert AGSA account name to account id. を持つクラス）からも探索
        val eassCandidates = getAllClassesWithString(fallbackSpec.anchorStrings[1])
        for (classDef in eassCandidates) {
            for (field in classDef.fields) {
                val fType = field.type
                if (fType.startsWith("L") && fType.endsWith(";") && !fType.startsWith("Ljava/")) {
                    targetClassesToPatch.add(fType)
                }
            }
        }

        println("[AccountConvertFallback] Inspecting ${targetClassesToPatch.size} candidate target classes for account resolution")

        for (classType in targetClassesToPatch) {
            val classDef = classDefByOrNull(classType) ?: continue
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                // (String) -> ListenableFuture メソッド（flia.b）を探索
                if (method.parameterTypes == listOf("Ljava/lang/String;") &&
                    method.returnType == "Lcom/google/common/util/concurrent/ListenableFuture;" &&
                    method.implementation != null
                ) {
                    println("[AccountConvertFallback] Patching account resolver: ${classDef.type}->${method.name}")
                    ensureRegisters(method.implementation, 4)
                    method.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            invoke-static {v0}, Lcom/google/apps/tiktok/account/AccountId;->b(I)Lcom/google/apps/tiktok/account/AutoValue_AccountId;
                            move-result-object v0
                            new-instance v1, $immediateFutureClass
                            invoke-direct {v1, v0}, $immediateFutureClass-><init>(Ljava/lang/Object;)V
                            return-object v1
                        """
                    )
                    patchedCount++
                }
            }
        }

        if (patchedCount > 0) {
            VersionHookRegistry.logHook(
                HookId.ACCOUNT_CONVERT_FALLBACK,
                "AccountResolver",
                "SUCCESS",
                "Short-circuited $patchedCount account resolver methods with valid immediate AccountId"
            )
        } else {
            println("[AccountConvertFallback] Warning: No account resolver methods patched")
        }
    }
}
