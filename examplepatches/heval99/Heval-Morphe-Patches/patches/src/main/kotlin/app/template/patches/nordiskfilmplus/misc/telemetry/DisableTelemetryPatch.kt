package app.template.patches.nordiskfilmplus.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NORDISKFILMPLUS
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

/**
 * Sentry's documented auto-init switch plus the Firebase switches (analytics, Crashlytics,
 * Sessions, Performance and the advertising ID). Firebase Messaging (push) is not touched.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_NORDISKFILMPLUS)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "io.sentry.auto-init" to "false",
                "firebase_analytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_sessions_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )) {
                // The app already declares io.sentry.dsn; the auto-init switch is new.
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

/**
 * Nordisk Film+ starts Sentry twice: from SentryInitProvider.onCreate (auto-init) and from
 * MobileNFApplication.onCreate. Both call one static init method, whose class R8 renamed. The patch
 * locates that method from the provider's onCreate - the provider keeps its library class name and
 * the call shape is (Context, io.sentry.android.core.*) -> void - and makes it return at once, so
 * neither path initialises Sentry. The player, DRM and the subscription session are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_NORDISKFILMPLUS)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        val provider = mutableClassDefBy(SENTRY_INIT_PROVIDER)
        val onCreate = provider.methods.singleOrNull {
            it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.implementation != null
        } ?: throw PatchException("$SENTRY_INIT_PROVIDER->onCreate()Z not found")

        val init = onCreate.implementation!!.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .singleOrNull { ref ->
                ref.returnType == "V" &&
                    ref.parameterTypes.size == 2 &&
                    ref.parameterTypes[0].toString() == "Landroid/content/Context;" &&
                    ref.parameterTypes[1].toString().startsWith("Lio/sentry/android/core/")
            } ?: throw PatchException("no Sentry init call in $SENTRY_INIT_PROVIDER->onCreate")

        val target = mutableClassDefBy(init.definingClass).methods.singleOrNull { method ->
            method.name == init.name && method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) ==
                init.parameterTypes.map(CharSequence::toString)
        } ?: throw PatchException("Sentry init ${init.definingClass}->${init.name} not found")
        target.returnEarly()
    }
}
