package app.template.patches.opera.analytics

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import app.template.patches.opera.OPERA_GX_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue

/**
 * Rewrites third-party ad/measurement endpoint constants to a dead host, so
 * the tracker SDKs Opera bundles can never phone home - not even the code
 * paths that are not covered by "Disable ad modules".
 *
 * Endpoints verified present in the dex constant pools of Opera
 * 103.3.5234.91185 / Beta 104.0.5262.91143: `app-measurement.com` (Firebase
 * Analytics collector), `googleadservices.com`, `doubleclick.net`,
 * `pagead2.googlesyndication.com`, `imasdk.googleapis.com` (Google IMA) and
 * `api.leanplum.com`. Opera GX carries `app-measurement.com`,
 * `googleadservices.com` and `pagead2.googlesyndication.com`. Additional
 * well-known tracker hosts (GA legacy, GTM, Adjust, AppsFlyer, Kochava) are
 * kept in the list so future Opera builds that embed them are covered too.
 *
 * Deliberately NOT touched (breaking these breaks functionality):
 * `firebaseinstallations.googleapis.com` / `firebaseremoteconfig`
 * (push notifications and feature flags), `firebasestorage.googleapis.com`
 * (GX fetches its internal filter list from there), and all of Opera's own
 * hosts (`*.opera.software`, `*.opera-api.com`).
 *
 * The dead host is substituted INSIDE the original constant, so a constant
 * like `https://app-measurement.com/a?x=1` becomes
 * `https://0.0.0.0/a?x=1`: unrelated payload around the host survives, and
 * the connection fails immediately. SDKs treat an unreachable endpoint like
 * an offline device - which they are built for.
 *
 * The scan runs on the patcher's prebuilt string index
 * (`matchAllMethodIndicesForEach`). Since Morphe Patcher 2.0, fingerprint strings
 * default to EXACT matching, so the endpoints are matched with an explicit
 * CONTAINS comparison - a constant like
 * `https://googleads.g.doubleclick.net/mads/gma` contains the host and is
 * rewritten host-only (`https://0.0.0.0/mads/gma`), leaving the rest of the
 * constant intact. Only matched methods are materialized as mutable classes
 * (see README "Memory usage").
 */
@Suppress("unused")
val operaDisableAnalyticsPatch = patch(
    name = "Disable analytics & tracking",
    description = "Stops Firebase Analytics, Google Ads/Doubleclick/IMA and " +
        "Leanplum from collecting or sending usage data by rewriting their " +
        "endpoint constants to a dead host. Firebase infrastructure that " +
        "features depend on (push notifications, feature flags) is left intact.",
    default = true,
) {
    compatibleWith(
        OPERA_COMPATIBILITY,
        OPERA_DIRECT_COMPATIBILITY,
        OPERA_BETA_COMPATIBILITY,
        OPERA_GX_COMPATIBILITY,
    )

    execute {
        val deadHost = "0.0.0.0"

        val trackerEndpoints = listOf(
            // Firebase Analytics collector (present: stable, beta, GX)
            "app-measurement.com",
            // Google Ads / Doubleclick / IMA (present: stable, beta, GX)
            "googleadservices.com",
            "doubleclick.net",
            "pagead2.googlesyndication.com",
            "imasdk.googleapis.com",
            // Leanplum (present: stable, beta)
            "api.leanplum.com",
            // Legacy Google Analytics (kept for future builds)
            "www.google-analytics.com",
            "ssl.google-analytics.com",
            "googletagmanager.com",
            // Attribution trackers (kept for future builds; not present today)
            "app.adjust.com",
            "app.appsflyer.com",
            "api2.appsflyer.com",
            "register.appsflyer.com",
            "control.kochava.com",
            "kvinit-prod.api.kochava.com",
        )

        val rewrittenPerEndpoint = mutableMapOf<String, Int>()
        for (endpoint in trackerEndpoints) {
            var hits = 0
            string(endpoint, StringComparisonType.CONTAINS).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val instruction = getInstruction<ReferenceInstruction>(index)
                if (instruction.opcode != Opcode.CONST_STRING &&
                    instruction.opcode != Opcode.CONST_STRING_JUMBO
                ) {
                    return@matchAllMethodIndicesForEach
                }
                val original = (instruction.reference as StringReference).string
                if (!original.contains(endpoint)) return@matchAllMethodIndicesForEach

                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(original.replace(endpoint, deadHost)),
                    ),
                )
                hits++
            }
            if (hits > 0) rewrittenPerEndpoint[endpoint] = (rewrittenPerEndpoint[endpoint] ?: 0) + hits
        }

        // Second pass: tracker hosts that live in STATIC FIELD initial values
        // instead of code. Leanplum, for example, ships its endpoint as the
        // static final String Lcom/leanplum/internal/Constants;->API_HOST_NAME,
        // which no instruction fingerprint can see. The scan below iterates
        // immutable class definitions (cheap) and only materializes the few
        // classes whose static String fields hold a tracker host.
        var fieldHits = 0
        val rewrittenFields = mutableListOf<String>()
        classDefForEach { classDef ->
            val hasTrackerField = classDef.fields.any { field ->
                (field.initialValue as? StringEncodedValue)?.value?.let { value ->
                    trackerEndpoints.any { value.contains(it) }
                } == true
            }
            if (!hasTrackerField) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            for (field in mutableClass.fields) {
                val initialValue = field.initialValue as? MutableStringEncodedValue ?: continue
                val original = initialValue.value
                var rewritten = original
                for (endpoint in trackerEndpoints) {
                    if (rewritten.contains(endpoint)) {
                        rewritten = rewritten.replace(endpoint, deadHost)
                    }
                }
                if (rewritten != original) {
                    initialValue.setValue(rewritten)
                    fieldHits++
                    rewrittenFields += "${classDef.type.substringBeforeLast(';')}->${field.name}"
                }
            }
        }

        val total = rewrittenPerEndpoint.values.sum() + fieldHits
        if (total == 0) {
            throw PatchException(
                "No analytics/tracker endpoint constants were found. " +
                    "Is this an unsupported Opera version?",
            )
        }

        println(
            "Opera analytics: neutralized $total endpoint constant(s): " +
                rewrittenPerEndpoint.entries.joinToString(", ") { "${it.key} (x${it.value})" } +
                if (fieldHits > 0) " + field(s) " + rewrittenFields.joinToString(", ") else "",
        )
    }
}
