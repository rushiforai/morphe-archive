package dev.rikunode.hatenabookmark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val PREF_FRAGMENT = "Lcom/hatena/android/bookmark/presentation/fragment/PreferenceFragment;"
private const val SETTINGS_ACTIVITY = "dev.rikunode.settings.HoshioriSettingsActivity"

/** Register the opt-in settings Activity before the PreferenceFragment link is installed. */
@Suppress("unused")
val hoshioriSettingsManifestPatch = resourcePatch(
    name = "Hoshiori settings Activity registration",
    description = "Register the private in-app settings screen used by Hoshiori.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Hatena Bookmark", packageName = "com.hatena.android.bookmark",
        apkFileType = ApkFileType.APK, appIconColor = 0x2A9BD6,
        targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
    ))
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("application")
            require(nodes.length == 1) { "Hatena 5.80 application manifest guard failed" }
            val application = nodes.item(0) as Element
            for (name in listOf(SETTINGS_ACTIVITY,
                "dev.rikunode.settings.HoshioriDrawerSettingsActivity")) {
                val existing = doc.getElementsByTagName("activity")
                require((0 until existing.length).none {
                    (existing.item(it) as Element).getAttribute("android:name") == name
                }) { "Hoshiori settings activity already registered: $name" }
                val activity = doc.createElement("activity")
                activity.setAttribute("android:name", name)
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:label",
                    if (name == SETTINGS_ACTIVITY) "Hoshiori" else "ドロワーの設定")
                application.appendChild(activity)
            }
        }
    }
}

/** Add one Preference item dynamically, keeping all original preferences intact. */
@Suppress("unused")
val hoshioriSettingsEntryPatch = bytecodePatch(
    name = "Hoshiori in-app settings",
    description = "Add a Hoshiori entry to the original settings and store app toggles locally.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Hatena Bookmark", packageName = "com.hatena.android.bookmark",
        apkFileType = ApkFileType.APK, appIconColor = 0x2A9BD6,
        targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
    ))
    dependsOn(hoshioriSettingsManifestPatch)
    extendWith("extensions/settings.mpe")
    execute {
        val method = classDefBy(PREF_FRAGMENT).methods.singleOrNull {
            it.name == "onCreatePreferences" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroid/os/Bundle;", "Ljava/lang/String;") &&
                it.returnType == "V"
        } ?: throw PatchException("Hatena 5.80 PreferenceFragment signature guard failed")
        val impl = method.implementation ?: throw PatchException("Missing settings code")
        val instructions = impl.instructions.toList()
        var offset = 0
        val returns = instructions.mapIndexedNotNull { index, instruction ->
            val at = offset
            offset += instruction.codeUnits
            if (instruction.opcode == Opcode.RETURN_VOID) index to at else null
        }
        if (impl.registerCount != 7 || offset != 847 ||
            returns.size != 1 || returns.single().second != 0x2cc
        ) throw PatchException("Hatena 5.80 PreferenceFragment code/return guard failed")
        mutableClassDefBy(PREF_FRAGMENT).methods.single {
            it.name == "onCreatePreferences" && it.parameterTypes.size == 2
        }.addInstructions(returns.single().first,
            "invoke-static { p0 }, Ldev/rikunode/settings/HoshioriSettingsBridge;->attach(Ljava/lang/Object;)V")

        // MainActivity is created before its normal article feeds, supplying the
        // application Context even when Hoshiori settings have not been opened yet.
        val mainClass = "Lcom/hatena/android/bookmark/presentation/activity/MainActivity;"
        val onCreate = classDefBy(mainClass).methods.singleOrNull {
            it.name == "onCreate" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") &&
                it.returnType == "V"
        } ?: throw PatchException("Hatena 5.80 MainActivity bootstrap signature guard failed")
        val mainImpl = onCreate.implementation ?: throw PatchException("Missing main code")
        val mainInsns = mainImpl.instructions.toList()
        val expectedSuper =
            "Lcom/hatena/android/bookmark/presentation/activity/BookmarkBaseActivity;->onCreate(Landroid/os/Bundle;)V"
        if (mainImpl.registerCount != 11 || mainInsns.sumOf { it.codeUnits } != 412 ||
            mainInsns.firstOrNull()?.opcode != Opcode.INVOKE_SUPER ||
            (mainInsns.first() as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                ?.reference?.toString() != expectedSuper
        ) throw PatchException("Hatena 5.80 MainActivity bootstrap guard failed")
        mutableClassDefBy(mainClass).methods.single {
            it.name == "onCreate" && it.parameterTypes.size == 1
        }.addInstructions(1,
            "invoke-static { p0 }, Ldev/rikunode/settings/HoshioriRuntime;->init(Landroid/content/Context;)V")
    }
}
