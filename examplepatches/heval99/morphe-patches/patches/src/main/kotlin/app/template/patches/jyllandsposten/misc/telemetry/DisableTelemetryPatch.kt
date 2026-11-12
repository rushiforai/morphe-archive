package app.template.patches.jyllandsposten.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_JYLLANDSPOSTEN
import app.template.patches.shared.misc.telemetry.forceFirebaseManifestSwitches
import app.template.patches.shared.telemetry.disableGemiusAudience
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The JPPol Snowplow tracker is built for this endpoint; the wrapper class is R8-renamed, the
// endpoint string is not.
private const val SNOWPLOW_ENDPOINT = "https://c.jyllands-posten.dk"

/**
 * Jyllands-Posten is built on the shared JP/Politikens platform. Its telemetry is Gemius audience
 * measurement (three sendEvent() overrides), the JPPol Snowplow tracker and Firebase Crashlytics.
 *
 * The Gemius events are no-opped by the shared helper. The Snowplow wrapper is found by the tracker
 * endpoint it builds. It has three non-static app-typed fields; the tracker is the one whose type
 * the wrapper instantiates itself (the others are injected collaborators), and both event methods
 * call the tracker's single void (payload) method, which returns at once. Crashlytics and Firebase
 * Sessions are switched off where they read their manifest switches; the app bundles no Firebase
 * Analytics or Performance. AdOcean ads and the web paywall are separate and not part of this
 * patch.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_JYLLANDSPOSTEN)

    execute {
        // Crashlytics and Sessions off, as the manifest switches would set them but in the
        // bytecode (no resource re-encode, rule 12). There is no Firebase Analytics (so no ad-ID
        // switch either) and no Performance in this app.
        forceFirebaseManifestSwitches(
            app = "Jyllands-Posten",
            analytics = false,
            crashlytics = true,
            sessions = true,
            performance = false,
        )

        disableGemiusAudience()

        val wrapper = classDefByStrings(SNOWPLOW_ENDPOINT).singleOrNull()
            ?: throw PatchException("Snowplow wrapper ($SNOWPLOW_ENDPOINT) not found")
        // The tracker is the one app-typed instance field whose type the wrapper builds itself
        // (new-instance); its other app-typed fields are injected collaborators.
        val instantiated = wrapper.methods.asSequence()
            .flatMap { method -> method.implementation?.instructions?.asSequence() ?: emptySequence() }
            .filter { insn -> insn.opcode == Opcode.NEW_INSTANCE }
            .mapNotNull { insn -> ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type }
            .toSet()
        val trackerType = wrapper.fields.singleOrNull { field ->
            !AccessFlags.STATIC.isSet(field.accessFlags) && classDefByOrNull(field.type) != null &&
                field.type in instantiated
        }?.type ?: throw PatchException("${wrapper.type} has no Snowplow tracker field")
        val trackCall = wrapper.methods.asSequence()
            .flatMap { method -> method.implementation?.instructions?.asSequence() ?: emptySequence() }
            .mapNotNull { insn -> (insn as? ReferenceInstruction)?.reference as? MethodReference }
            .firstOrNull { call ->
                call.definingClass == trackerType && call.returnType == "V" && call.parameterTypes.size == 1
            } ?: throw PatchException("${wrapper.type} never calls a Snowplow track method")
        val emit = mutableClassDefBy(trackerType).methods.singleOrNull { method ->
            method.name == trackCall.name && method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == trackCall.parameterTypes.map(CharSequence::toString)
        } ?: throw PatchException("$trackerType.${trackCall.name} not found")
        emit.returnEarly()
    }
}
