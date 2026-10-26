package io.github.pengusto.patches.infinity

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.net.URI

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

internal fun ResourcePatchContext.patchOAuthRedirectManifest(redirect: String) {
    val uri = URI(redirect)
    val host = uri.host ?: uri.rawAuthority?.takeIf { it.matches(Regex("[A-Za-z0-9_.-]+")) }
    require(!uri.isOpaque && uri.scheme != null && host != null) { "Expected a hierarchical OAuth redirect URI" }
    document("AndroidManifest.xml").use { doc ->
        val activities = doc.getElementsByTagName("activity")
        val activity = (0 until activities.length).map { activities.item(it) as org.w3c.dom.Element }
            .single { it.getAttributeNS(ANDROID_NS, "name") == "ml.docilealligator.infinityforreddit.activities.LoginChromeCustomTabActivity" }
        val data = activity.getElementsByTagName("data")
        check(data.length == 1) { "Infinity browser redirect contract changed" }
        val node = data.item(0) as org.w3c.dom.Element
        node.setAttributeNS(ANDROID_NS, "android:scheme", uri.scheme)
        node.setAttributeNS(ANDROID_NS, "android:host", host)
        for (name in listOf("path", "pathPrefix", "pathPattern", "port")) node.removeAttributeNS(ANDROID_NS, name)
        if (!uri.path.isNullOrEmpty()) node.setAttributeNS(ANDROID_NS, "android:path", uri.path)
        if (uri.port >= 0) node.setAttributeNS(ANDROID_NS, "android:port", uri.port.toString())
    }
}

internal fun BytecodePatchContext.patchAuthTabRedirectScheme(redirect: String) {
    val scheme = URI(redirect).scheme
    require(scheme.matches(Regex("[A-Za-z][A-Za-z0-9+.-]*")))
    val cls = mutableClassDefByOrNull("Lml/docilealligator/infinityforreddit/activities/AppAuthLoginActivity;") ?: return
    val matches = cls.methods.flatMap { method ->
        method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
            val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
            if (text == "infinity") Triple(method, index, (instruction as OneRegisterInstruction).registerA) else null
        } ?: emptyList()
    }
    check(matches.size == 1) { "Infinity AuthTab redirect scheme contract changed" }
    for ((method, index, register) in matches) method.replaceInstruction(index, "const-string v$register, \"$scheme\"")
}
