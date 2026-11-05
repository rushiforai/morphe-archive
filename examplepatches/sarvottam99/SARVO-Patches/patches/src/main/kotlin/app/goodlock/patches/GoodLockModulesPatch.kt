package app.goodlock.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val GOODLOCK_CLASS = "Lwe/w;"
private const val STATIC_PLUGIN_CLASS = "Lbf/m;"
private const val STORE_PLUGIN_CLASS = "Lcf/f;"

private val COMPATIBILITY_GOODLOCK = Compatibility(
    name = "Samsung Good Lock",
    packageName = "com.samsung.android.goodlock",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "3.0.16.6"))
)

/**
 * One fixed StorePlugin record per documented Good Lock module.
 *
 * Package IDs are taken from Good Lock 3.0.16.6's own manual catalogue
 * (assets/goodlock_manual_v9.csv). Version names and version codes are the
 * latest APKMirror entries verified on 2026-11-04.
 *
 * Do not add multiple historical StorePlugin records for the same package:
 * this repository list is keyed by appId and represents one module row, not
 * a release-history list. Update the single record when a newer APKMirror
 * release is verified.
 */
private data class GoodLockModule(
    val packageName: String,
    val displayName: String,
    val versionName: String,
    val versionCode: Int
)

private val GOODLOCK_MODULES = listOf(
    GoodLockModule(
        "com.samsung.android.qstuner",
        "QuickStar",
        "11.0.03.15",
        1100315000
    ),
    GoodLockModule(
        "com.samsung.android.app.homestar",
        "Home Up",
        "18.0.00.38",
        1800005038
    ),
    GoodLockModule(
        "com.samsung.android.multistar",
        "MultiStar",
        "11.2.03",
        1120300000
    ),
    GoodLockModule(
        "com.samsung.android.soundassistant",
        "Sound Assistant",
        "9.0.00.11",
        900000011
    ),
    GoodLockModule(
        "com.samsung.systemui.lockstar",
        "LockStar",
        "9.0.00.5",
        900005000
    ),
    GoodLockModule(
        "com.samsung.systemui.notilus",
        "NotiStar",
        "9.0.79.0",
        907900000
    ),
    GoodLockModule(
        "com.samsung.systemui.navillera",
        "NavStar",
        "9.0.00.16",
        900016000
    ),
    GoodLockModule(
        "com.samsung.android.app.clockface",
        "ClockFace",
        "3.4.01.3",
        340103000
    ),
    GoodLockModule(
        "com.samsung.android.themedesigner",
        "Theme Park",
        "1.1.02.2",
        110202000
    ),
    GoodLockModule(
        "com.samsung.android.wonderland.wallpaper",
        "Wonderland",
        "1.6.22",
        162200000
    ),
    GoodLockModule(
        "com.samsung.android.pentastic",
        "Pentastic",
        "3.0.01",
        300100000
    ),
    GoodLockModule(
        "com.samsung.android.app.galaxyregistry",
        "RegiStar",
        "1.0.73",
        107300000
    ),
    GoodLockModule(
        "com.samsung.android.sidegesturepad",
        "One Hand Operation +",
        "9.3.13.0",
        931300000
    ),
    GoodLockModule(
        "com.samsung.android.app.captureplugin",
        "Nice Shot",
        "2.3.09",
        230900000
    ),
    GoodLockModule(
        "com.samsung.android.app.cameraassistant",
        "Camera Assistant",
        "4.5.00.20",
        450020000
    ),
    GoodLockModule(
        "com.samsung.android.app.routineplus",
        "Routines +",
        "1.1.23",
        112307000
    ),
    GoodLockModule(
        "com.samsung.android.keyscafe",
        "Keys Cafe",
        "1.8.05.4",
        180500004
    ),
    GoodLockModule(
        "com.samsung.android.app.goodcatch",
        "Nice Catch",
        "9.0.00.0",
        900000000
    ),
    GoodLockModule(
        "com.samsung.android.displayassistant",
        "Display Assistant",
        "8.5.20",
        852000000
    ),
    GoodLockModule(
        "com.samsung.dropship_client",
        "Dropship",
        "1.2.7",
        40
    ),
    GoodLockModule(
        "com.samsung.android.edgelightingplus",
        "Edge lighting+",
        "8.0.00.1",
        800000001
    ),
    GoodLockModule(
        "com.samsung.android.app.edgetouch",
        "Edge Touch",
        "1.3.16",
        131600000
    ),
    GoodLockModule(
        "com.samsung.android.gts",
        "Galaxy To Share",
        "1.0.79.0",
        107900000
    ),
    GoodLockModule(
        "com.samsung.android.gallery.assistant.app",
        "Gallery Assistant",
        "2.0.01.5",
        200100005
    ),
    GoodLockModule(
        "com.samsung.android.game.honeyplayplus",
        "Game Booster +",
        "2.0.00.33",
        200033000
    )
)

/**
 * Good Lock 3.0.16.6 plugin repository:
 * Lwe/w;->e(List<StaticPlugin>, List<StorePlugin>, Policy): ArrayList
 *
 * It discards static plugin entries when the second list does not contain a
 * StorePlugin whose appId (Lcf/f;->c) matches the static plugin package name
 * (Lbf/m;->g). This patch adds a small, explicit allowlist to a COPY of that
 * StorePlugin list and leaves Samsung's original filtering logic in place.
 */
private object GoodLockPluginListFingerprint : Fingerprint(
    definingClass = GOODLOCK_CLASS,
    name = "e",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Lff/n;"
    ),
    strings = listOf(
        "Plugin filtered: ",
        ", not found in store",
        "PluginsRepository"
    )
)

@Suppress("unused")
val showPopularGoodLockModulesPatch = bytecodePatch(
    name = "Unlock all Samsung Good Lock modules",
    description = "Show all Good Lock modules irrespective of Samsung official device compatibility. They may or may not work depending on your device Android and/or UI version or other factors. You need to install unsupported modules separately from apk files from the internet.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOODLOCK)

    execute {
        val method = GoodLockPluginListFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("Good Lock plugin repository method has no implementation")
        val instructions = implementation.instructions

        val hasStaticPluginPackage = instructions.any { instruction ->
            if (instruction.opcode != Opcode.IGET_OBJECT) {
                false
            } else {
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? FieldReference
                reference?.definingClass == STATIC_PLUGIN_CLASS &&
                    reference.name == "g" &&
                    reference.type == "Ljava/lang/String;"
            }
        }

        val hasStorePluginAppId = instructions.any { instruction ->
            if (instruction.opcode != Opcode.IGET_OBJECT) {
                false
            } else {
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? FieldReference
                reference?.definingClass == STORE_PLUGIN_CLASS &&
                    reference.name == "c" &&
                    reference.type == "Ljava/lang/String;"
            }
        }

        if (!hasStaticPluginPackage || !hasStorePluginAppId) {
            throw PatchException(
                "Unexpected Good Lock plugin filtering layout; expected StaticPlugin.pkgName and StorePlugin.appId"
            )
        }

        // Keep the exact register assumptions used by the previously working
        // QuickStar patch. Refuse to patch an APK with a different layout.
        if (implementation.registerCount < 19) {
            throw PatchException(
                "Unexpected Good Lock plugin repository register layout; at least 19 registers are required"
            )
        }

        val injectedInstructions = buildString {
            // p2 is the original StorePlugin list. Always work on a mutable copy.
            appendLine("move-object/from16 v1, p2")
            appendLine("new-instance v0, Ljava/util/ArrayList;")
            appendLine(
                "invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V"
            )

            GOODLOCK_MODULES.forEachIndexed { index, module ->
                val label = "sarvo_goodlock_module_$index"
                val versionCodeHex = module.versionCode.toString(16)

                // Do not duplicate a module already supplied by Samsung's store list.
                appendLine("const-string v4, \"${module.packageName}\"")
                appendLine(
                    "invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;"
                )
                appendLine("move-result-object v1")
                appendLine(":${label}_scan")
                appendLine(
                    "invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z"
                )
                appendLine("move-result v2")
                appendLine("if-eqz v2, :${label}_add")
                appendLine(
                    "invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;"
                )
                appendLine("move-result-object v3")
                appendLine("check-cast v3, Lcf/f;")
                appendLine("iget-object v5, v3, Lcf/f;->c:Ljava/lang/String;")
                appendLine(
                    "invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z"
                )
                appendLine("move-result v2")
                appendLine("if-eqz v2, :${label}_scan")
                appendLine("goto :${label}_done")

                // Synthetic record fields follow the known-working QuickStar constructor.
                appendLine(":${label}_add")
                appendLine("new-instance v6, Lcf/f;")
                appendLine("const-string v7, \"${module.packageName}\"")
                appendLine("const-string v8, \"${module.displayName}\"")
                appendLine("const-string v9, \"${module.packageName}\"")
                appendLine("const-string v10, \"\"")
                appendLine("const-string v11, \"${module.versionName}\"")
                appendLine("const v12, 0x$versionCodeHex")
                appendLine(
                    "invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"
                )
                appendLine("move-result-object v12")
                appendLine("const-wide/16 v13, 0x0")
                appendLine("const-string v15, \"\"")
                appendLine("const-string v16, \"\"")
                appendLine(
                    "sget-object v17, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
                )
                appendLine("sget-object v18, Lcf/c0;->m:Lcf/c0;")
                appendLine(
                    "invoke-direct/range {v6 .. v18}, Lcf/f;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;JLjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcf/c0;)V"
                )
                appendLine(
                    "invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z"
                )
                appendLine("move-result v2")
                appendLine(":${label}_done")
            }

            // Hand the augmented copy to the original repository method.
            appendLine("move-object/from16 p2, v0")
        }

        method.addInstructions(0, injectedInstructions)
    }
}
