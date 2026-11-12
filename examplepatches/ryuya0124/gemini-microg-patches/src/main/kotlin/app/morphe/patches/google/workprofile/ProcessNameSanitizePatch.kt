package app.morphe.patches.google.workprofile

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * クローン環境下で Google アプリのプロセス名取得 API の戻り値を偽装・正規化するパッチ
 *
 * Google アプリはマルチプロセスで各機能（:googleapp, :search 等）を実行し、
 * Java の switch(processName) で Dagger Component を切り替えています。
 * コンパイラは switch 文を各プロセス名の hashCode 定数（例: :googleapp は 0xf159c4e4）で比較するため、
 * クローン化でプロセス名に .morphe が付くと hashCode が不一致となり、
 * メインプロセス用コンポーネント (wuf) が誤生成されて ClassCastException でクラッシュします。
 *
 * 本パッチはプロセス名プロバイダ（Leacx.b()）の戻り値から ".morphe" を除去して元のプロセス名に
 * 正規化することで、コンパイル時 hashCode および equals 判定を完全に一致させ、クラッシュを根絶します。
 */
val processNameSanitizePatch = bytecodePatch(
    name = "Process Name Spoofing for Clone Support",
    description = "クローン環境下でプロセス名から .morphe を自動除去し、Dagger DI コンポーネントの初期化クラッシュを防止します。",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")

    execute {
        val spec = VersionHookRegistry.target(HookId.PROCESS_NAME_REDIRECT, packageMetadata)
        val mainSpec = VersionHookRegistry.target(HookId.MAIN_PROCESS_CHECK, packageMetadata)
        val targetProcessKey = spec.anchorStrings.single()
        val candidateClasses = getAllClassesWithString(targetProcessKey)
        println("[ProcessNameSanitizePatch] Found ${candidateClasses.size} candidate classes with '$targetProcessKey'")

        val targetMethodsToPatch = mutableSetOf<String>()

        // 1. targetProcessKey を参照しているクラス（gplh 等）からプロセス名取得メソッドを特定
        for (classDef in candidateClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (method.implementation == null) continue
                val insList = method.instructions.toList()

                val hasProcessString = insList.any { ins ->
                    (ins.opcode == Opcode.CONST_STRING || ins.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((ins as ReferenceInstruction).reference as? StringReference)?.string == targetProcessKey
                }

                if (hasProcessString) {
                    for (i in 0 until insList.size - 1) {
                        val ins = insList[i]
                        if (ins.opcode == Opcode.INVOKE_STATIC) {
                            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                            if (ref != null && ref.returnType == "Ljava/lang/String;" && ref.parameterTypes.isEmpty() && spec.matches(ref)) {
                                targetMethodsToPatch.add("${ref.definingClass}->${ref.name}")
                                println("[ProcessNameSanitizePatch] Identified process name provider: ${ref.definingClass}->${ref.name}")
                            }
                        }
                    }
                }
            }
        }

        check(targetMethodsToPatch == setOf("${spec.className}->${spec.methodName}")) { "Unexpected process provider: $targetMethodsToPatch" }

        // 2. プロセス名取得メソッド（Leacx;->b()）自体の戻り値直前にサニタイズ命令を注入
        var patchedProviderCount = 0
        for (methodSignature in targetMethodsToPatch) {
            val parts = methodSignature.split("->")
            val classType = parts[0]
            val methodName = parts[1]

            val classDef = classDefByOrNull(classType)
            if (classDef != null) {
                val mutableClass = mutableClassDefBy(classDef)
                val helperName = "morpheNormalizeProcessName"
                check(mutableClass.methods.none { it.name == helperName }) { "Use an unpatched original APK" }
                // Construct a new method with a declared register layout. Mutating dexlib's
                // private final registerCount field is not portable to Android Manager.
                val helper = MutableMethod(ImmutableMethod(
                    classType, helperName,
                    listOf<MethodParameter>(ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)),
                    "Ljava/lang/String;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                    emptySet(), emptySet(),
                    ImmutableMethodImplementation(3, emptyList<Instruction>(), emptyList(), emptyList())
                ))
                helper.addInstructions("""
                    const-string v0, ".morphe"
                    const-string v1, ""
                    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                    move-result-object v0
                    return-object v0
                """)
                check(helper.implementation!!.registerCount == 3)
                mutableClass.methods.add(helper)
                for (method in mutableClass.methods) {
                    if (method.name == methodName && spec.matches(method) && method.implementation != null) {
                        check(AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty())
                        val originalRegisters = method.implementation!!.registerCount
                        val insList = method.instructions.toList()
                        for (idx in insList.indices.reversed()) {
                            val ins = insList[idx]
                            if (ins.opcode == Opcode.RETURN_OBJECT) {
                                val reg = (ins as OneRegisterInstruction).registerA
                                check(reg in 0 until originalRegisters && reg <= 15)
                                // Keep the original return's labels on the first normalization instruction.
                                // Inserting before a labelled return lets cached branches skip the insertion.
                                method.replaceInstruction(idx,
                                    "invoke-static {v$reg}, $classType->$helperName(Ljava/lang/String;)Ljava/lang/String;")
                                method.addInstructions(
                                    idx + 1,
                                    """
                                        move-result-object v$reg
                                        return-object v$reg
                                    """
                                )
                                println("[ProcessNameSanitizePatch] Injected sanitization before return-object in $methodSignature at instruction $idx")
                                patchedProviderCount++
                            }
                        }
                        check(method.implementation!!.registerCount == originalRegisters)
                    }
                }
            }
        }

        // Dagger's compiled process-name switch needs the original name, but
        // TikTok's main-process check compares against Context.getPackageName().
        // Give that check the real process name so :search uses its local account
        // store instead of recursively binding AccountSyncService to itself.
        val mainProcessClasses = getAllClassesWithString(mainSpec.anchorStrings.single())
        var fixedMainProcessChecks = 0
        for (classDef in mainProcessClasses) {
            val mutableClass = mutableClassDefBy(classDef)
            for (method in mutableClass.methods) {
                if (!mainSpec.matches(method) || method.implementation == null) continue
                for ((index, instruction) in method.instructions.toList().withIndex()) {
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (instruction.opcode == Opcode.INVOKE_STATIC &&
                        "${ref.definingClass}->${ref.name}" in targetMethodsToPatch &&
                        ref.parameterTypes.isEmpty() && ref.returnType == "Ljava/lang/String;") {
                        method.replaceInstruction(index,
                            "invoke-static {}, Landroid/app/Application;->getProcessName()Ljava/lang/String;")
                        fixedMainProcessChecks++
                    }
                }
            }
        }
        check(patchedProviderCount == spec.expectedMatches) { "Unexpected provider return count: $patchedProviderCount" }
        check(fixedMainProcessChecks == mainSpec.expectedMatches) {
            "Expected exactly one TikTok main-process check; found $fixedMainProcessChecks"
        }
        println("[ProcessNameSanitizePatch] Restored real process name for TikTok account store selection")
        VersionHookRegistry.logHook(
            HookId.PROCESS_NAME_REDIRECT,
            "Sanitize",
            "SUCCESS",
            "Injected process name sanitization in $patchedProviderCount provider return sites"
        )
    }
}
