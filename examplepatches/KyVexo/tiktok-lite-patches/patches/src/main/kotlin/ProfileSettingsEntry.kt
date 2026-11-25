package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.patch.bytecodePatch

private object SparkResume : Fingerprint(
    definingClass = "Lcom/bytedance/hybrid/spark/page/SparkActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

private object BindNavigationTab4782 : Fingerprint(
    definingClass = "LX/JnK;",
    name = "LCI",
    returnType = "V",
    parameters = listOf("LX/KV2;", "LX/KPf;", "Z", "I"),
)

private object BindNavigationTab : Fingerprint(
    definingClass = "LX/GIu;",
    name = "LCI",
    returnType = "V",
    parameters = listOf("LX/H3b;", "LX/Gwq;", "Z", "I"),
)

@Suppress("unused")
val profileSettingsEntry = bytecodePatch(
    name = "Open mod settings from profile",
    description = "Adds a separate entry to open mod settings from the native settings page.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(modSettingsSupport)
    execute {
        enableModSetting("profileGestureAvailable")
        if (packageMetadata.versionName == "47.8.15") {
            // In the split build the full feed model is patched in df_edit_filter.
            filterFeedAccessor(fullFeedList, "getItems")
            val bind = BindNavigationTab.method
            check(bind.implementation!!.registerCount in 6..16)
            bind.addInstructions(0, """
                iget-object v0, p2, LX/Gwq;->L:Ljava/lang/String;
                invoke-static {p1, v0}, Lapp/tiktoklitepatches/extension/ModSettings;->bindProfileGesture(Landroid/view/View;Ljava/lang/String;)V
            """)
        } else if (packageMetadata.versionName == "47.8.2") {
            val bind = BindNavigationTab4782.method
            val end = bind.instructions.indices.single { bind.instructions[it].opcode == Opcode.RETURN_VOID }
            bind.addInstructions(end, """
                iget-object v0, p2, LX/KPf;->L:Ljava/lang/String;
                invoke-static {p1, v0}, Lapp/tiktoklitepatches/extension/ModSettings;->bindProfileGesture(Landroid/view/View;Ljava/lang/String;)V
            """)
        }

        val method = SparkResume.method
        val returns = method.instructions.indices.filter { method.instructions[it].opcode == Opcode.RETURN_VOID }
        check(returns.isNotEmpty())
        for (index in returns.asReversed()) {
            method.addInstructions(index,
                "invoke-static/range {p0 .. p0}, Lapp/tiktoklitepatches/extension/SettingsPageEntry;->attach(Landroid/app/Activity;)V"
            )
        }
    }
}