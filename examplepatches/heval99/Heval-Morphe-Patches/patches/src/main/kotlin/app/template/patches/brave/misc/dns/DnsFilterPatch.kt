package app.template.patches.brave.misc.dns

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_BRAVE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.misc.dns.DNS_FILTER_DESCRIPTION
import app.template.patches.shared.misc.dns.DNS_FILTER_PATCH_NAME
import app.template.patches.shared.misc.dns.dnsFilterOptions
import com.android.tools.smali.dexlib2.AccessFlags

// Chromium enterprise policies (Android since Chrome 85). With both set, the Secure DNS screen
// shows the managed value and cannot be changed.
private const val DOH_MODE_POLICY = "DnsOverHttpsMode"
private const val DOH_TEMPLATES_POLICY = "DnsOverHttpsTemplates"

@Suppress("unused")
val dnsFilterPatch = bytecodePatch(
    name = DNS_FILTER_PATCH_NAME,
    description = DNS_FILTER_DESCRIPTION,
    default = false,
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    val options = dnsFilterOptions()

    execute {
        val url = options.url
        val mode = if (options.strict) "secure" else "automatic"

        // Every policy bundle gets the two DoH policies before Chromium reads it, so they hold
        // whatever the app restrictions say. The restriction getters themselves are not touched,
        // so the first run does not take the managed-device path. A null bundle is left alone.
        val notify = PolicyProviderNotifySettingsFingerprint.method
        val parameterRegisters = notify.parameterTypes.size + if (AccessFlags.STATIC.isSet(notify.accessFlags)) 0 else 1
        if (notify.implementation!!.registerCount - parameterRegisters < 3) {
            throw PatchException("${notify.definingClass}->${notify.name}(Bundle) has fewer than 3 local registers")
        }
        val bundle = if (AccessFlags.STATIC.isSet(notify.accessFlags)) "p0" else "p1"
        notify.addInstructionsWithLabelsChecked(
            0,
            """
                move-object/from16 v0, $bundle
                if-eqz v0, :no_bundle
                const-string v1, "$DOH_MODE_POLICY"
                const-string v2, "$mode"
                invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
                const-string v1, "$DOH_TEMPLATES_POLICY"
                const-string v2, "$url"
                invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
            """,
            ExternalLabel("no_bundle", notify.getInstruction(0)),
        )
    }
}
