/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * ads/audiencenetwork, itself forked from
 * https://github.com/andrewliang25/morphe-patches (Copyright 2026 Andrew Liang, GPL-3.0).
 *
 * Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.ads.audiencenetwork

import app.fbpatches.patches.facebook.shared.EXTENSION_PACKAGE
import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.facebook.shared.handleTargets
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val AN_PATCH = "Disable Audience Network"

/** The bridge through which Facebook serves its ads inside *other* apps. */
internal val AUDIENCE_NETWORK_COMPONENTS = listOf(
    "com.facebook.ads.internal.ipc.AudienceNetworkRemoteService",
    "com.facebook.ads.internal.ipc.AudienceNetworkRemoteActivity",
    "com.facebook.ads.internal.ipc.AudienceNetworkExportedActivity",
    "com.facebook.ads.AudienceNetworkActivity",
    "com.facebook.audiencenetwork.AudienceNetworkService",
)

private val COMPONENT_TAGS = setOf("activity", "activity-alias", "service", "receiver", "provider")

/** The meta-data Facebook's AppComponentManager reads to leave a manifest-disabled component off. */
private const val DEFAULT_STATE = "default-state"

/** Facebook's startup task that turns the ipc components on. */
private const val REMOTE_APIS_SETUP = "Lcom/facebook/audiencenetwork/AudienceNetworkRemoteAPIsSetup;"

private const val SET_COMPONENT_STATE =
    "Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V"
private const val COMPONENT_STATE =
    "$EXTENSION_PACKAGE/ads/AudienceNetwork;->componentState(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;II)V"

private fun keepOffByDefault(component: Element) {
    val children = component.getElementsByTagName("meta-data")
    for (index in 0 until children.length) {
        val child = children.item(index) as? Element ?: continue
        if (child.getAttribute("android:name") == DEFAULT_STATE) {
            child.setAttribute("android:value", "false")
            return
        }
    }
    val meta = component.ownerDocument.createElement("meta-data")
    meta.setAttribute("android:name", DEFAULT_STATE)
    meta.setAttribute("android:value", "false")
    component.appendChild(meta)
}

private fun disableAudienceNetwork(manifest: Document) {
    val disabled = mutableSetOf<String>()
    COMPONENT_TAGS.forEach { tag ->
        val nodes = manifest.getElementsByTagName(tag)
        for (index in 0 until nodes.length) {
            val element = nodes.item(index) as? Element ?: continue
            val name = element.getAttribute("android:name")
            if (name !in AUDIENCE_NETWORK_COMPONENTS) continue
            element.setAttribute("android:enabled", "false")
            keepOffByDefault(element)
            disabled += name
        }
    }
    handleTargets(AN_PATCH, "Audience Network components", AUDIENCE_NETWORK_COMPONENTS) { name ->
        if (name in disabled) null else "$name isn't in the manifest"
    }
}

private val disableAudienceNetworkResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document -> disableAudienceNetwork(document) }
    }
}

private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun componentStateCalls(method: Method): List<Int> {
    val code = method.implementation?.instructions?.toList() ?: return emptyList()
    return code.indices.filter { index ->
        code[index].opcode == Opcode.INVOKE_VIRTUAL &&
            ((code[index] as ReferenceInstruction).reference as? MethodReference)?.signature() == SET_COMPONENT_STATE
    }
}

private fun MutableMethod.passComponentState(index: Int) {
    val call = getInstruction(index) as? FiveRegisterInstruction
    if (call == null || getInstruction(index).opcode != Opcode.INVOKE_VIRTUAL || call.registerCount != 4) {
        throw PatchException("$AN_PATCH: instruction $index of $definingClass->$name isn't a component state call")
    }
    replaceInstruction(
        index,
        "invoke-static { v${call.registerC}, v${call.registerD}, v${call.registerE}, v${call.registerF} }, $COMPONENT_STATE",
    )
}

@Suppress("unused")
val disableAudienceNetworkPatch = bytecodePatch(
    name = "Disable Audience Network",
    description = "Stops Facebook serving its ads inside other apps on your phone.",
    default = true,
) {
    dependsOn(disableAudienceNetworkResourcePatch, extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        val setup = mutableClassDefByOrNull(REMOTE_APIS_SETUP)
            ?: throw PatchException("$AN_PATCH: this Facebook has no $REMOTE_APIS_SETUP")
        val calls = setup.methods.flatMap { method -> componentStateCalls(method).map { method to it } }
        if (calls.isEmpty()) throw PatchException("$AN_PATCH: $REMOTE_APIS_SETUP turns no component on")
        calls.forEach { (method, index) -> method.passComponentState(index) }
    }
}
