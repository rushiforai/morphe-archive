package dev.rikunode.hatenabookmark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Preserve the stock drawer item IDs and click routing. */
@Suppress("unused")
val hoshioriDrawerPatch = bytecodePatch(
    name = "Customize the Hoshiori navigation drawer",
    description = "Reorder or hide existing drawer items; the settings item always remains visible.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Hatena Bookmark", packageName = "com.hatena.android.bookmark",
        apkFileType = ApkFileType.APK, appIconColor = 0x2A9BD6,
        targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
    ))
    dependsOn(hoshioriSettingsEntryPatch)
    execute {
        val main = "Lcom/hatena/android/bookmark/presentation/activity/MainActivity;"
        val method = classDefBy(main).methods.singleOrNull {
            it.name == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V"
        } ?: throw PatchException("Hatena 5.80 MainActivity.onResume signature guard failed")
        val impl = method.implementation ?: throw PatchException("Missing drawer onResume code")
        val insns = impl.instructions.toList()
        val expected =
            "Lcom/hatena/android/bookmark/presentation/activity/BookmarkBaseActivity;->onResume()V"
        if (impl.registerCount != 8 || insns.sumOf { it.codeUnits } != 28 ||
            insns.firstOrNull()?.opcode != Opcode.INVOKE_SUPER ||
            (insns.first() as? ReferenceInstruction)?.reference?.toString() != expected
        ) throw PatchException("Hatena 5.80 drawer onResume DEX guard failed")
        mutableClassDefBy(main).methods.single {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        }.addInstructions(1,
            "invoke-static { p0 }, Ldev/rikunode/settings/HoshioriDrawerBridge;->apply(Landroid/app/Activity;)V")
    }
}
