package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml

private object MainWindowFocus : Fingerprint(
    definingClass = "Lcom/zhiliaoapp/musically/go/mini/MainActivity;",
    name = "onWindowFocusChanged",
    returnType = "V",
    parameters = listOf("Z"),
)


private val settingsManifest = resourcePatch {
    execute {
        resourceXml("AndroidManifest.xml").use { xml ->
            xml.root.children("application").single().appendChild("activity") {
                setAttribute("android:name", "app.tiktoklitepatches.extension.ModSettingsActivity")
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
            }
        }
    }
}

internal val modSettingsSupport = bytecodePatch {
    dependsOn(settingsManifest, nativeAccent)
    execute {
        MainWindowFocus.method.addInstructions(0, """
            invoke-static/range {p0 .. p1}, Lapp/tiktoklitepatches/extension/ModSettings;->onWindowFocus(Landroid/app/Activity;Z)V
        """)
    }
}

internal fun BytecodePatchContext.enableModSetting(name: String) {
    Fingerprint(
        definingClass = "Lapp/tiktoklitepatches/extension/ModSettings;",
        name = name,
        parameters = emptyList(),
        returnType = "Z",
    ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}
