package app.template.patches.onedm

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_ONEDM
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/onedm/OnedmCloudSync;"
private const val BUFFERED_RAF_DESCRIPTOR =
    "Lapp/template/extension/onedm/BufferedRandomAccessFile;"

private const val MODE_CLOUD_SYNC = "cloud_sync"
private const val MODE_LOCAL_TURBO = "local_turbo"
private const val MODE_STOCK = "stock"

private fun MethodReference.toSmali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.toSmali() =
    "$definingClass->$name:$type"

private fun Method.hasSignature(returnType: String, vararg params: String): Boolean =
    this.returnType == returnType && parameterTypes.map { it.toString() } == params.toList()

private fun Method.containsStringLiteral(expected: String): Boolean =
    implementation?.instructions?.any { insn ->
        (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
            insn.getReference<StringReference>()?.string == expected
    } == true

private fun MutableClass.requireMutableMethod(
    name: String,
    returnType: String,
    vararg params: String,
): MutableMethod =
    methods.firstOrNull { it.name == name && it.hasSignature(returnType, *params) }
        ?: throw PatchException("Missing method $name(${params.joinToString("")})$returnType on $type")

private fun MutableMethod.replaceBody(smali: String) {
    val count = instructions.size
    if (count > 0) {
        removeInstructions(0, count)
    }
    addInstructions(0, smali.trimIndent())
}

@Suppress("unused")
val adblockAndUserscriptPatch = bytecodePatch(
    name = "AdBlocker turbo & userscript bundle",
    description = "Syncs SHA-256-verified pre-compiled AdBlocker binary engines + per-list filter archives " +
        "(28 default lists, ~1.22M active rules) automatically in the background with instant Hosts & filters " +
        "hydration, accelerates on-device filter compilation via 64 KB write buffering + foreground thread " +
        "scheduling, and optionally seeds and auto-updates the mobile-adapted Bypass All Shortlinks userscript.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ONEDM)

    extendWith("extensions/onedm.mpe")

    val adblockerMode by stringOption(
        key = "adblockerMode",
        default = MODE_CLOUD_SYNC,
        values = linkedMapOf(
            "Cloud Pre-Built + Auto-Sync (Recommended)" to MODE_CLOUD_SYNC,
            "Local Turbo Parser + Auto-Rebuild" to MODE_LOCAL_TURBO,
            "Stock 1DM" to MODE_STOCK,
        ),
        title = "AdBlocker engine mode",
        description = "Cloud Pre-Built downloads SHA-256-verified pre-compiled binary filter engines and " +
            "per-list archives from GitHub automatically in the background (zero on-device compilation lag " +
            "and full Hosts & filters counts/sizes/dates), falling back automatically to Local Turbo if you " +
            "customize filter lists. Local Turbo keeps all compilation on-device with 64 KB buffered I/O, " +
            "foreground CPU scheduling, and 7-day auto-update.",
        required = true,
    )

    val bundleBypassShortlinks by booleanOption(
        key = "bundleBypassShortlinks",
        default = true,
        title = "Bundle Bypass All Shortlinks userscript",
        description = "Seeds and auto-updates the mobile-adapted Bypass All Shortlinks Debloated " +
            "userscript (.1dmus with offline-cached MonkeyConfig, explicit @connect hosts, and zero warnings). " +
            "Preserves your enabled/disabled state and never re-installs if deleted.",
        required = true,
    )

    execute {
        val selectedMode = adblockerMode?.trim()?.lowercase()
            ?: throw PatchException("adblockerMode option must not be null")
        if (selectedMode !in setOf(MODE_CLOUD_SYNC, MODE_LOCAL_TURBO, MODE_STOCK)) {
            throw PatchException(
                "Invalid adblockerMode \"$selectedMode\". Expected one of: " +
                    "$MODE_CLOUD_SYNC, $MODE_LOCAL_TURBO, $MODE_STOCK"
            )
        }

        val enableCloudAdblock = selectedMode == MODE_CLOUD_SYNC
        val enableLocalTurbo = selectedMode == MODE_CLOUD_SYNC || selectedMode == MODE_LOCAL_TURBO
        val enableBypassScript = bundleBypassShortlinks == true

        // ---------------------------------------------------------------------
        // 1. Resolve dynamic 1DM method references via collision-safe fingerprints
        // ---------------------------------------------------------------------
        val validateBinsMethod = AdblockBinaryEngineValidateFingerprint.originalMethod

        val setAdblockLastUpdatedMethod = SettingsSetAdblockLastUpdatedFingerprint.originalMethod
        val settingsClassDef = SettingsSetAdblockLastUpdatedFingerprint.originalClassDef
        val settingsClassType = settingsClassDef.type

        val resolveAdblockZipPathMethod = settingsClassDef.methods.firstOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.hasSignature("Ljava/lang/String;", "Ljava/lang/String;") &&
                method.containsStringLiteral(".adblocker_1dm")
        } ?: throw PatchException("Could not resolve .adblocker_1dm zip path helper on $settingsClassType")

        val adblockUpdateOriginal = CheckAppVersionAdblockUpdateFingerprint.originalMethod
        val getSettingsSingletonMethod = adblockUpdateOriginal.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
            val ref = insn.getReference<MethodReference>() ?: return@firstNotNullOfOrNull null
            ref.takeIf {
                it.returnType == settingsClassType &&
                    it.parameterTypes.map { p -> p.toString() } == listOf(CONTEXT)
            }
        } ?: throw PatchException("Could not resolve settings singleton getter in $adblockUpdateOriginal")

        val adblockRebuildOriginal = CheckAppVersionAdblockRebuildFingerprint.originalMethod
        val getAllAdblockSourcesMethod = adblockRebuildOriginal.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_VIRTUAL) return@firstNotNullOfOrNull null
            val ref = insn.getReference<MethodReference>() ?: return@firstNotNullOfOrNull null
            ref.takeIf {
                it.returnType == "Ljava/util/ArrayList;" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf(ATOMIC_INTEGER)
            }
        } ?: throw PatchException("Could not resolve getAllAdblockSources on a61 in $adblockRebuildOriginal")

        val adblockDbClassType = getAllAdblockSourcesMethod.definingClass
        val getAdblockDbSingletonMethod = adblockRebuildOriginal.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
            val ref = insn.getReference<MethodReference>() ?: return@firstNotNullOfOrNull null
            ref.takeIf {
                it.returnType == adblockDbClassType &&
                    it.parameterTypes.map { p -> p.toString() } == listOf(CONTEXT)
            }
        } ?: throw PatchException("Could not resolve a61 singleton getter in $adblockRebuildOriginal")

        val adblockDbClassDef = mutableClassDefBy(adblockDbClassType)
        val saveAdblockSourcesMethod = adblockDbClassDef.methods.firstOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.hasSignature("V", "Ljava/util/Collection;") &&
                method.implementation?.instructions?.any { insn ->
                    insn.opcode == Opcode.CHECK_CAST &&
                        insn.getReference<TypeReference>()?.type == ADBLOCKER_LIST_SOURCE
                } == true
        } ?: throw PatchException("Could not resolve saveAdblockSources(Collection) on $adblockDbClassType")

        val trayGetLongMethod = adblockRebuildOriginal.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_VIRTUAL) return@firstNotNullOfOrNull null
            val ref = insn.getReference<MethodReference>() ?: return@firstNotNullOfOrNull null
            ref.takeIf {
                it.returnType == "J" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "J")
            }
        } ?: throw PatchException("Could not resolve Tray getLong(String, J)J in $adblockRebuildOriginal")

        val trayClassType = trayGetLongMethod.definingClass
        val getTraySingletonMethod = adblockRebuildOriginal.instructions.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_STATIC) return@firstNotNullOfOrNull null
            val ref = insn.getReference<MethodReference>() ?: return@firstNotNullOfOrNull null
            ref.takeIf {
                it.returnType == trayClassType &&
                    it.parameterTypes.map { p -> p.toString() } == listOf(CONTEXT)
            }
        } ?: throw PatchException("Could not resolve Tray singleton getter in $adblockRebuildOriginal")

        val rebuildDoneHelperMethod = CheckAppVersionAdblockRebuildFingerprint.originalClassDef.methods.firstOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.hasSignature("V", "J") &&
                it.containsStringLiteral("ab_rebuild_done")
        } ?: throw PatchException("Could not resolve ab_rebuild_done helper on CheckAppVersion")

        val trayPutLongMethod = rebuildDoneHelperMethod.implementation?.instructions?.firstNotNullOfOrNull { insn ->
            if (insn.opcode != Opcode.INVOKE_VIRTUAL) return@firstNotNullOfOrNull null
            val ref = insn.getReference<MethodReference>() ?: return@firstNotNullOfOrNull null
            ref.takeIf {
                it.definingClass == trayClassType &&
                    it.returnType == "Z" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("J", "Ljava/lang/String;")
            }
        } ?: throw PatchException("Could not resolve Tray putLong(J, String)Z in $rebuildDoneHelperMethod")

        // Resolve w53.abauShown boolean field + uc1.putBoolean(String, Z)Z from InitData
        val initDataOriginal = AdblockerSourceManagementInitDataFingerprint.originalMethod
        val initDataInsns = initDataOriginal.instructions.toList()
        val abauKeyIdx = initDataInsns.indexOfFirst { insn ->
            (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) &&
                insn.getReference<StringReference>()?.string == "abau_shown"
        }
        if (abauKeyIdx < 0) {
            throw PatchException("Could not locate abau_shown literal in $initDataOriginal")
        }
        val abauShownFieldRef = (abauKeyIdx - 1 downTo maxOf(0, abauKeyIdx - 12))
            .firstNotNullOfOrNull { idx ->
                val insn = initDataInsns[idx]
                if (insn.opcode != Opcode.IPUT_BOOLEAN) return@firstNotNullOfOrNull null
                val ref = insn.getReference<FieldReference>() ?: return@firstNotNullOfOrNull null
                if (ref.definingClass == settingsClassType && ref.type == "Z") ref else null
            } ?: throw PatchException("Could not resolve abau_shown field on $settingsClassType")

        val trayPutBooleanMethod = (abauKeyIdx + 1 until minOf(initDataInsns.size, abauKeyIdx + 5))
            .firstNotNullOfOrNull { idx ->
                val ref = initDataInsns[idx].getReference<MethodReference>()
                    ?: return@firstNotNullOfOrNull null
                ref.takeIf {
                    it.definingClass == trayClassType &&
                        it.returnType == "Z" &&
                        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Z")
                }
            } ?: throw PatchException("Could not resolve Tray putBoolean(String, Z)Z in $initDataOriginal")

        // Resolve Hosts & filters (AdblockerSourceManagementActivity) reload bridge
        val adblockerMgmtOriginalClass = AdblockerSourceManagementGetSourcesFingerprint.originalClassDef
        val rebuildingFieldRef = adblockerMgmtOriginalClass.fields.firstOrNull { field ->
            field.name == "rebuilding" && field.type == "Z"
        } ?: throw PatchException("Could not find rebuilding:Z on ${adblockerMgmtOriginalClass.type}")

        val checkRebuildBridgeMethod = adblockerMgmtOriginalClass.methods.firstOrNull { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.hasSignature("V", ADBLOCKER_SOURCE_MGMT_ACTIVITY) &&
                method.implementation?.instructions?.any { insn ->
                    val ref = insn.getReference<MethodReference>() ?: return@any false
                    ref.definingClass == ADBLOCKER_SOURCE_MGMT_ACTIVITY &&
                        ref.name == "checkRebuildState"
                } == true
        } ?: throw PatchException("Could not resolve checkRebuildState synthetic bridge on ${adblockerMgmtOriginalClass.type}")

        val ug7OriginalClass = UserscriptManagerInitFingerprint.originalClassDef
        val ug7GetInstanceMethod = ug7OriginalClass.methods.firstOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.hasSignature(ug7OriginalClass.type, CONTEXT)
        } ?: throw PatchException("Could not resolve static getInstance(Context) on ${ug7OriginalClass.type}")

        val ug7EnsureLoadedMethod = ug7OriginalClass.methods.firstOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.hasSignature("Z") &&
                it.containsStringLiteral("Error loading scripts cache")
        } ?: throw PatchException("Could not resolve ensureCacheLoaded()Z on ${ug7OriginalClass.type}")

        val ug7GetByIdMethod = ug7OriginalClass.methods.firstOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.hasSignature(USER_SCRIPT, "Ljava/lang/String;")
        } ?: throw PatchException("Could not resolve getById(String)UserScript on ${ug7OriginalClass.type}")

        val ug7ImportScriptsMethod = ug7OriginalClass.methods.firstOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.hasSignature("Z", "Ljava/util/List;")
        } ?: throw PatchException("Could not resolve importScripts(List)Z on ${ug7OriginalClass.type}")

        // ---------------------------------------------------------------------
        // 2. Wire OnedmCloudSync configuration flags and 1DM runtime bridges
        // ---------------------------------------------------------------------
        val extClass = mutableClassDefBy(EXTENSION_CLASS_DESCRIPTOR)

        extClass.requireMutableMethod("isCloudAdblockEnabled", "Z").replaceBody(
            """
                const/4 v0, ${if (enableCloudAdblock) "0x1" else "0x0"}
                return v0
            """
        )

        extClass.requireMutableMethod("isBypassUserscriptEnabled", "Z").replaceBody(
            """
                const/4 v0, ${if (enableBypassScript) "0x1" else "0x0"}
                return v0
            """
        )

        extClass.requireMutableMethod(
            "bridgeGetAllAdblockSources",
            "Ljava/util/ArrayList;",
            CONTEXT,
            ATOMIC_INTEGER,
        ).replaceBody(
            """
                invoke-static {p0}, ${getAdblockDbSingletonMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1}, ${getAllAdblockSourcesMethod.toSmali()}
                move-result-object p0
                return-object p0
            """
        )

        val saveAdblockSourcesSmali =
            "$adblockDbClassType->${saveAdblockSourcesMethod.name}(Ljava/util/Collection;)V"
        extClass.requireMutableMethod(
            "bridgeSaveAdblockSources",
            "V",
            CONTEXT,
            "Ljava/util/Collection;",
        ).replaceBody(
            """
                invoke-static {p0}, ${getAdblockDbSingletonMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1}, $saveAdblockSourcesSmali
                return-void
            """
        )

        val resolveZipPathSmali =
            "$settingsClassType->${resolveAdblockZipPathMethod.name}(Ljava/lang/String;)Ljava/lang/String;"
        extClass.requireMutableMethod(
            "bridgeResolveAdblockZipPath",
            "Ljava/lang/String;",
            CONTEXT,
            "Ljava/lang/String;",
        ).replaceBody(
            """
                invoke-static {p0}, ${getSettingsSingletonMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1}, $resolveZipPathSmali
                move-result-object p0
                return-object p0
            """
        )

        extClass.requireMutableMethod(
            "bridgeMarkAutoUpdateDialogShown",
            "V",
            CONTEXT,
            CONTEXT,
            "Ljava/lang/String;",
            "Z",
        ).replaceBody(
            """
                invoke-static {p0}, ${getSettingsSingletonMethod.toSmali()}
                move-result-object p0
                iput-boolean p3, p0, ${abauShownFieldRef.toSmali()}
                invoke-static {p1}, ${getTraySingletonMethod.toSmali()}
                move-result-object p1
                invoke-virtual {p1, p2, p3}, ${trayPutBooleanMethod.toSmali()}
                return-void
            """
        )

        val checkRebuildBridgeSmali =
            "${adblockerMgmtOriginalClass.type}->${checkRebuildBridgeMethod.name}($ADBLOCKER_SOURCE_MGMT_ACTIVITY)V"
        extClass.requireMutableMethod(
            "bridgeReloadAdblockerActivity",
            "V",
            "Landroid/app/Activity;",
            "Z",
        ).replaceBody(
            """
                check-cast p0, $ADBLOCKER_SOURCE_MGMT_ACTIVITY
                iput-boolean p1, p0, ${rebuildingFieldRef.toSmali()}
                invoke-static {p0}, $checkRebuildBridgeSmali
                return-void
            """
        )

        extClass.requireMutableMethod(
            "bridgeValidateAdblockBins",
            "Z",
            CONTEXT,
        ).replaceBody(
            """
                invoke-static {p0}, ${validateBinsMethod.toSmali()}
                move-result p0
                return p0
            """
        )

        extClass.requireMutableMethod(
            "bridgeRecordAdblockUpdatedTimestamp",
            "V",
            CONTEXT,
            "J",
        ).replaceBody(
            """
                invoke-static {p0}, ${getSettingsSingletonMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1, p2}, ${setAdblockLastUpdatedMethod.toSmali()}
                return-void
            """
        )

        extClass.requireMutableMethod(
            "bridgeGetTrayLong",
            "J",
            CONTEXT,
            "Ljava/lang/String;",
            "J",
        ).replaceBody(
            """
                invoke-static {p0}, ${getTraySingletonMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1, p2, p3}, ${trayGetLongMethod.toSmali()}
                move-result-wide p0
                return-wide p0
            """
        )

        extClass.requireMutableMethod(
            "bridgePutTrayLong",
            "Z",
            CONTEXT,
            "J",
            "Ljava/lang/String;",
        ).replaceBody(
            """
                invoke-static {p0}, ${getTraySingletonMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1, p2, p3}, ${trayPutLongMethod.toSmali()}
                move-result p0
                return p0
            """
        )

        extClass.requireMutableMethod(
            "bridgeGetUserscriptById",
            USER_SCRIPT,
            CONTEXT,
            "Ljava/lang/String;",
        ).replaceBody(
            """
                invoke-static {p0}, ${ug7GetInstanceMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0}, ${ug7EnsureLoadedMethod.toSmali()}
                invoke-virtual {p0, p1}, ${ug7GetByIdMethod.toSmali()}
                move-result-object p0
                return-object p0
            """
        )

        extClass.requireMutableMethod(
            "bridgeImportUserscript",
            "Z",
            CONTEXT,
            "Ljava/util/List;",
        ).replaceBody(
            """
                invoke-static {p0}, ${ug7GetInstanceMethod.toSmali()}
                move-result-object p0
                invoke-virtual {p0, p1}, ${ug7ImportScriptsMethod.toSmali()}
                move-result p0
                return p0
            """
        )

        // ---------------------------------------------------------------------
        // 3. Local Turbo optimizations (active in both cloud_sync & local_turbo)
        // ---------------------------------------------------------------------
        if (enableLocalTurbo) {
            // (a) Enable 7-day automatic AdBlocker filter updates by default in AdblockerSettingsInfo.<init>()
            val settingsInit = AdblockerSettingsInfoInitFingerprint.method
            val enableAutoUpdatePutIdx = settingsInit.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.IPUT_BOOLEAN &&
                    insn.getReference<FieldReference>()?.let {
                        it.definingClass == ADBLOCKER_SETTINGS_INFO && it.name == "enableAutoUpdate"
                    } == true
            }
            if (enableAutoUpdatePutIdx <= 0) {
                throw PatchException("Could not find enableAutoUpdate field init in $settingsInit")
            }
            val putReg = (settingsInit.getInstruction(enableAutoUpdatePutIdx) as TwoRegisterInstruction).registerA
            val prevInsn = settingsInit.getInstruction(enableAutoUpdatePutIdx - 1)
            if (prevInsn.opcode != Opcode.CONST_4 ||
                (prevInsn as OneRegisterInstruction).registerA != putReg ||
                (prevInsn as NarrowLiteralInstruction).narrowLiteral != 0
            ) {
                throw PatchException("Unexpected instruction before enableAutoUpdate init in $settingsInit")
            }
            settingsInit.replaceInstruction(enableAutoUpdatePutIdx - 1, "const/4 v$putReg, 0x1")

            // (b) Replace 4x 1-byte RandomAccessFile.write(I)V syscalls in j12's int32 writer
            //     with ThreadLocal-reused single 4-byte OS write (zero per-call byte[] allocation).
            val j12Class = AdblockBinaryEngineValidateFingerprint.classDef
            val writeInt32Method = j12Class.methods.firstOrNull {
                AccessFlags.STATIC.isSet(it.accessFlags) &&
                    it.hasSignature("V", "Ljava/io/RandomAccessFile;", "I", "I")
            } ?: throw PatchException("Could not find static (RandomAccessFile, int, int)V writer on ${j12Class.type}")

            writeInt32Method.replaceBody(
                """
                    invoke-static {p0, p1, p2}, $BUFFERED_RAF_DESCRIPTOR->writeIntAtIndex(Ljava/io/RandomAccessFile;II)V
                    return-void
                """
            )

            // (c) Swap unbuffered RandomAccessFile -> 64 KB BufferedRandomAccessFile strictly on
            //     j12's 3 `.bin.tmp` writers (`abcfp.bin`, `abnhp.bin`, `abnfp.bin`), leaving
            //     `ab_bucket_index_*.tmp` (`file5`) and `ab_filter_compile.lock` untouched.
            val binWriterMethods = j12Class.methods.filter { method ->
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "V" &&
                    method.parameterTypes.firstOrNull()?.toString() == "Ljava/io/File;" &&
                    method.implementation?.instructions?.any { insn ->
                        insn.opcode == Opcode.NEW_INSTANCE &&
                            insn.getReference<TypeReference>()?.type == "Ljava/io/RandomAccessFile;"
                    } == true
            }
            if (binWriterMethods.size != 3) {
                throw PatchException(
                    "Expected 3 .bin.tmp RandomAccessFile writers on ${j12Class.type}, found ${binWriterMethods.size}"
                )
            }
            for (writerMethod in binWriterMethods) {
                val insns = writerMethod.instructions.toList()
                val newRafIdx = insns.indexOfFirst { insn ->
                    insn.opcode == Opcode.NEW_INSTANCE &&
                        insn.getReference<TypeReference>()?.type == "Ljava/io/RandomAccessFile;"
                }
                val initRafIdx = insns.indexOfFirst { insn ->
                    if (insn.opcode != Opcode.INVOKE_DIRECT) return@indexOfFirst false
                    val ref = insn.getReference<MethodReference>() ?: return@indexOfFirst false
                    ref.definingClass == "Ljava/io/RandomAccessFile;" &&
                        ref.name == "<init>" &&
                        ref.parameterTypes.map { p -> p.toString() } == listOf("Ljava/io/File;", "Ljava/lang/String;")
                }
                if (newRafIdx < 0 || initRafIdx < 0) {
                    throw PatchException("Unexpected RandomAccessFile init layout in $writerMethod")
                }
                val rafInstanceReg = (insns[newRafIdx] as OneRegisterInstruction).registerA
                val initInsn = insns[initRafIdx] as FiveRegisterInstruction
                // Singular replaceInstruction preserves try_item start/end labels 1:1.
                writerMethod.replaceInstruction(
                    newRafIdx,
                    "new-instance v$rafInstanceReg, $BUFFERED_RAF_DESCRIPTOR"
                )
                writerMethod.replaceInstruction(
                    initRafIdx,
                    "invoke-direct {v${initInsn.registerC}, v${initInsn.registerD}, v${initInsn.registerE}}, " +
                        "$BUFFERED_RAF_DESCRIPTOR-><init>(Ljava/io/File;Ljava/lang/String;)V"
                )
            }

            // (d) Keep j12's compiler worker thread at priority 1 (out of priority >= 10
            //     `/dev/cpuset/background` little-core throttling on MIUI/Android) while
            //     preserving v3 = 0 and mutating try_item #0 in-place via singular replaceInstruction.
            val compileWorker = j12Class.methods.firstOrNull { method ->
                method.implementation?.instructions?.any { insn ->
                    val ref = insn.getReference<MethodReference>() ?: return@any false
                    ref.definingClass == "Landroid/os/Process;" && ref.name == "setThreadPriority"
                } == true
            } ?: throw PatchException("Could not find Process.setThreadPriority worker on ${j12Class.type}")

            val prioIdx = compileWorker.instructions.indexOfFirst { insn ->
                val ref = insn.getReference<MethodReference>() ?: return@indexOfFirst false
                ref.definingClass == "Landroid/os/Process;" && ref.name == "setThreadPriority"
            }
            if (prioIdx <= 0) {
                throw PatchException("Unexpected setThreadPriority position $prioIdx in $compileWorker")
            }
            val afterPrio = compileWorker.instructions.drop(prioIdx + 1).take(3)
            val v0OverwrittenCleanly = afterPrio.any { insn ->
                insn.opcode == Opcode.IGET_OBJECT && (insn as OneRegisterInstruction).registerA == 0
            }
            if (!v0OverwrittenCleanly) {
                throw PatchException("Expected dead v0 before IGET_OBJECT in $compileWorker")
            }
            compileWorker.replaceInstruction(
                prioIdx,
                "invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V"
            )
            compileWorker.addInstruction(
                prioIdx,
                "const/16 v0, 0x1"
            )
        }

        // ---------------------------------------------------------------------
        // 4. UI-Process Startup Sync + Hosts & Filters Hooks + CheckAppVersion Hooks
        // ---------------------------------------------------------------------
        if (enableCloudAdblock || enableBypassScript) {
            // (a) Automatic background sync on UI-process launch (`MyAppCompatActivity.onCreate`),
            //     immediately after `BrowserApp.initApp(Application, Context)` completes.
            val myAppOnCreate = MyAppOnCreateFingerprint.method
            val initAppCallIdx = myAppOnCreate.instructions.indexOfFirst { insn ->
                if (insn.opcode != Opcode.INVOKE_STATIC) return@indexOfFirst false
                val ref = insn.getReference<MethodReference>() ?: return@indexOfFirst false
                ref.definingClass == BROWSER_APP && ref.name == "initApp"
            }
            if (initAppCallIdx < 0) {
                throw PatchException("Could not find BrowserApp.initApp call in $myAppOnCreate")
            }
            val appCtxReg = (myAppOnCreate.getInstruction(initAppCallIdx) as FiveRegisterInstruction).registerD
            myAppOnCreate.addInstruction(
                initAppCallIdx + 1,
                "invoke-static {v$appCtxReg}, $EXTENSION_CLASS_DESCRIPTOR->onAppBackgroundInit($CONTEXT)V"
            )

            // (b) Scheduled background AdBlocker update check in `:CheckAppVersion`.
            val abUpdateMethod = CheckAppVersionAdblockUpdateFingerprint.method
            abUpdateMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onAdblockCheckHook($CONTEXT)Z
                    move-result v0
                    if-eqz v0, :onedm_ab_local_path
                    return-void
                """.trimIndent(),
                ExternalLabel("onedm_ab_local_path", abUpdateMethod.getInstruction(0))
            )
        }

        if (enableCloudAdblock) {
            // (c) `Hosts & filters` (`AdblockerSourceManagementActivity.getSourcesFromDataBase`)
            //     background hook — syncs/hydrates SQLite + source `.zip`s before list render.
            val getSourcesMethod = AdblockerSourceManagementGetSourcesFingerprint.method
            getSourcesMethod.addInstruction(
                0,
                "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onBeforeLoadAdblockerSources($CONTEXT)V"
            )

            // (d) `Hosts & filters` global Update button intercept (`showUpdateFiltersDialog`).
            val showUpdateDialogMethod = AdblockerSourceManagementShowUpdateDialogFingerprint.method
            showUpdateDialogMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $EXTENSION_CLASS_DESCRIPTOR->onUpdateFiltersDialogRequested(Landroid/app/Activity;Ljava/util/Collection;)Z
                    move-result v0
                    if-eqz v0, :onedm_proceed_stock_update_dialog
                    return-void
                """.trimIndent(),
                ExternalLabel(
                    "onedm_proceed_stock_update_dialog",
                    showUpdateDialogMethod.getInstruction(0)
                )
            )

            // (e) AdBlocker rebuild worker (`ab_rebuild_wanted` in `:CheckAppVersion`).
            val abRebuildMethod = CheckAppVersionAdblockRebuildFingerprint.method
            abRebuildMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onAdblockRebuildHook($CONTEXT)Z
                    move-result v0
                    if-eqz v0, :onedm_ab_rebuild_local
                    return-void
                """.trimIndent(),
                ExternalLabel("onedm_ab_rebuild_local", abRebuildMethod.getInstruction(0))
            )
        }

        if (enableBypassScript) {
            // (f) Scheduled Userscript update check (`us_update_last_run`).
            val usUpdateMethod = CheckAppVersionUserscriptUpdateFingerprint.method
            usUpdateMethod.addInstructions(
                0,
                "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onUserscriptCheckHook($CONTEXT)V"
            )

            // (g) Per-script update fetcher (`Li/kh7;`).
            val singleScriptUpdateMethod = UserscriptSingleUpdateCheckFingerprint.method
            singleScriptUpdateMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->shouldInterceptUserscriptUpdate($USER_SCRIPT)Z
                    move-result v0
                    if-eqz v0, :onedm_us_stock_update
                    invoke-static {p0, p1}, $EXTENSION_CLASS_DESCRIPTOR->fetchUpdatedBypassUserscript($CONTEXT$USER_SCRIPT)$USER_SCRIPT
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
                ExternalLabel("onedm_us_stock_update", singleScriptUpdateMethod.getInstruction(0))
            )
        }
    }
}
