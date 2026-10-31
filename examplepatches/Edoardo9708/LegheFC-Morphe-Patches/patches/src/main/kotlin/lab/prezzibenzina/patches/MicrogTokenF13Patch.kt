package lab.prezzibenzina.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val F13_APP = "Lit/prezzibenzina/pb3/PBApplication;"
private const val F13_GMS = "app.revanced.android.gms"
private const val F13_META = "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE"
// Public certificate SHA-1 verified against the original APK. No private key.
private const val F13_SHA1 = "0aec957e6c2cc81381867dd0d94c7396d8285185"

private val pbMicrogTokenF13Resources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val ns = "http://schemas.android.com/apk/res/android"
            val root = manifest.documentElement
            val apps = root.getElementsByTagName("application")
            require(apps.length == 1) { "F13: application non univoca" }
            val app = apps.item(0) as Element
            val metadata = app.getElementsByTagName("meta-data")
            require((0 until metadata.length).none {
                (metadata.item(it) as Element).getAttributeNS(ns, "name") == F13_META
            }) { "F13: metadata firma alternativa gia' presente" }
            val certificate = manifest.createElement("meta-data")
            certificate.setAttributeNS(ns, "android:name", F13_META)
            certificate.setAttributeNS(ns, "android:value", F13_SHA1)
            app.appendChild(certificate)

            val queryNodes = root.getElementsByTagName("queries")
            require(queryNodes.length <= 1) { "F13: queries non univoco" }
            val queries = if (queryNodes.length == 1) queryNodes.item(0) as Element
                else manifest.createElement("queries").also { root.insertBefore(it, app) }
            val packages = queries.getElementsByTagName("package")
            if ((0 until packages.length).none {
                (packages.item(it) as Element).getAttributeNS(ns, "name") == F13_GMS
            }) {
                val pkg = manifest.createElement("package")
                pkg.setAttributeNS(ns, "android:name", F13_GMS)
                queries.appendChild(pkg)
            }
        }
    }
}

/**
 * F13: route only the Maps API-token binding, using the client application
 * context observed in the installed Maps module. No Frida, ART hooks,
 * native library injection, API-key replacement or global GMS rewriting.
 */
@Suppress("unused")
val prezziBenzinaMicrogTokenF13Patch = bytecodePatch(
    name = "Prezzi Benzina - microG token routing F13",
    description = "Local test: route only Maps ApiTokenService to the existing app.revanced.android.gms and declare the original public certificate digest. No Frida; use alone, not with F5-F12.",
    default = false
) {
    compatibleWith(Compatibility(
        name = "Prezzi Benzina",
        packageName = "org.vernazza.androidfuel",
        targets = listOf(AppTarget(version = "3.26.10.10"))
    ))
    dependsOn(pbMicrogTokenF13Resources)
    execute {
        val app = mutableClassDefBy(F13_APP)
        require(app.superclass == "Landroid/app/Application;") { "F13: superclass differente" }
        val params = listOf("Landroid/content/Intent;", "Landroid/content/ServiceConnection;", "I")
        require(app.methods.none { it.name == "bindService" && it.parameterTypes == params }) {
            "F13: override bindService gia' presente"
        }
        val bind = ImmutableMethod(
            F13_APP, "bindService", params.map { ImmutableMethodParameter(it, null, null) },
            "Z", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(8)
        ).toMutable()
        bind.addInstructions(0, """
            const/4 v3, 0x0
            if-eqz p1, :original
            invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;
            move-result-object v0
            if-eqz v0, :original
            invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;
            move-result-object v1
            const-string v2, "com.google.android.gms"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :original
            invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;
            move-result-object v1
            const-string v2, "com.google.android.gms.maps.auth.ApiTokenService"
            invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-eqz v1, :original
            new-instance v0, Landroid/content/Intent;
            invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
            const-string v1, "app.revanced.android.gms"
            invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
            move-object p1, v0
            const/4 v3, 0x1
            const-string v0, "PB-F13"
            const-string v1, "PB-F13 TOKEN BIND ROUTED to app.revanced.android.gms; original certificate metadata"
            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            :original
            invoke-super {p0, p1, p2, p3}, Landroid/app/Application;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
            move-result v2
            if-eqz v3, :done
            const-string v0, "PB-F13"
            if-eqz v2, :failed
            const-string v1, "PB-F13 TOKEN BIND ACCEPTED; awaiting service response"
            goto :log_result
            :failed
            const-string v1, "PB-F13 TOKEN BIND FAILED"
            :log_result
            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            :done
            return v2
        """.trimIndent())
        app.methods.add(bind)
    }
}
