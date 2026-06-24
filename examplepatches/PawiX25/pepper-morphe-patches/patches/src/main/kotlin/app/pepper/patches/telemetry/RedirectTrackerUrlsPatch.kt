package app.pepper.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue

/**
 * Redirect every tracker URL constant in the dex to https://127.0.0.1:1
 * (which fails to connect — port 1 is unused) so any HTTP client built from
 * those constants cannot reach the real backend.
 *
 * Some tracker hosts are not covered here because their URLs are built at
 * runtime (no string constant in dex) — Liftoff/Vungle backend paths,
 * Crashlytics/Firebase logging — those are handled by
 * [neuterTrackerProvidersPatch] (kills Vungle SDK init) and
 * [killDatatransportPatch] (kills the Crashlytics/Firebase upload pipe).
 */
@Suppress("unused")
val redirectTrackerUrlsPatch = bytecodePatch(
    name = "Redirect tracker URLs to localhost",
    description = "Redirects every known tracker and analytics URL in the app " +
        "to localhost so it cannot reach the network.",
) {
    compatibleWith(*PEPPER_FAMILY)

    val replacements = mapOf(
        // Pepper-internal trackers — Ocular pixel endpoints. Each regional
        // sister app of the Pepper family has its own ocular host with the
        // brand's TLD; the const-string is independent per build, so we
        // enumerate all of them here. Verified against the dex string-pool
        // of every package in pepperFamilyPackages.
        "https://ocular.pepper.pl/"            to "https://127.0.0.1:1/",  // Pepper PL
        "https://ocular-nl.pepper.com/"        to "https://127.0.0.1:1/",  // Pepper NL
        "https://ocular.mydealz.de/"           to "https://127.0.0.1:1/",  // Mydealz DE
        "https://ocular.hotukdeals.com/"       to "https://127.0.0.1:1/",  // HotUKDeals UK
        "https://ocular.dealabs.com/"          to "https://127.0.0.1:1/",  // Dealabs FR
        "https://ocular.promodescuentos.com/"  to "https://127.0.0.1:1/",  // PromoDescuentos MX
        "https://ocular.chollometro.com/"      to "https://127.0.0.1:1/",  // Chollometros ES
        "https://ocular.preisjaeger.at/"       to "https://127.0.0.1:1/",  // Preisjäger AT
        "https://ocular.pepperdeals.se/"       to "https://127.0.0.1:1/",  // Pepper SE
        "https://ocular.pepperdeals.com/"      to "https://127.0.0.1:1/",  // Pepper.com (US)

        // Pepper-internal — Recombee recommendation API. Path is
        // "<region-slot>/<brand-tenant>/" and depends on the package.
        // chollometro / preisjaeger / pepperdeals.{se,com} don't ship a
        // Recombee const-string in their dex (no recommendation API used).
        "https://client-rapi-eu-west.recombee.com/pepper-pl/"   to "https://127.0.0.1:1/",
        "https://client-rapi-eu-west.recombee.com/pepper-nl/"   to "https://127.0.0.1:1/",
        "https://client-rapi-eu-west.recombee.com/pepper-de/"   to "https://127.0.0.1:1/",
        "https://client-rapi-eu-west.recombee.com/pepper-uk/"   to "https://127.0.0.1:1/",
        "https://client-rapi-eu-west.recombee.com/pepper-prod/" to "https://127.0.0.1:1/",  // Dealabs FR
        "https://client-rapi-us-west.recombee.com/pepper-mx/"   to "https://127.0.0.1:1/",  // PromoDescuentos MX

        // Iterable
        "https://api.iterable.com/api/" to "https://127.0.0.1:1/api/",

        // Usercentrics — empirically verified that the app falls back to "reject all"
        // when these are unreachable, so we cut every host (tracking + CMP-core).
        "https://app.eu.usercentrics.eu/session/1px.png" to "https://127.0.0.1:1/1px.png",
        "https://app.usercentrics.eu/session/1px.png" to "https://127.0.0.1:1/1px.png",
        "https://uct.eu.usercentrics.eu" to "https://127.0.0.1:1",
        "https://uct.service.usercentrics.eu" to "https://127.0.0.1:1",
        "https://aggregator.service.usercentrics.eu" to "https://127.0.0.1:1",
        "https://api.usercentrics.eu" to "https://127.0.0.1:1",
        "https://consent-api.service.consent.usercentrics.eu" to "https://127.0.0.1:1",

        // Adjust BASE_URLs
        "https://app.adjust.com" to "https://127.0.0.1:1",
        "https://gdpr.adjust.com" to "https://127.0.0.1:1",
        "https://ssrv.adjust.com" to "https://127.0.0.1:1",
        "https://subscription.adjust.com" to "https://127.0.0.1:1",
        "https://app.adjust.io" to "https://127.0.0.1:1",
        "https://gdpr.adjust.io" to "https://127.0.0.1:1",
        "https://ssrv.adjust.io" to "https://127.0.0.1:1",
        "https://subscription.adjust.io" to "https://127.0.0.1:1",
        "https://app.%s" to "https://127.0.0.1:1",
        "https://gdpr.%s" to "https://127.0.0.1:1",
        "https://ssrv.%s" to "https://127.0.0.1:1",
        "https://subscription.%s" to "https://127.0.0.1:1",
        "https://%s" to "https://127.0.0.1:1",

        // Vungle
        "https://config.ads.vungle.com/" to "https://127.0.0.1:1/",
        "https://adx.ads.vungle.com/api/v7/ads" to "https://127.0.0.1:1",
        "https://adx.ads.vungle.com/api/v7/csb" to "https://127.0.0.1:1",
        "https://events.ads.vungle.com/rtadebugging" to "https://127.0.0.1:1",
        "https://logs.ads.vungle.com/sdk/error_logs" to "https://127.0.0.1:1",
        "https://logs.ads.vungle.com/sdk/metrics" to "https://127.0.0.1:1",

        // Pubmatic
        "https://ow.pubmatic.com/openrtb/2.5" to "https://127.0.0.1:1",
        // Pepper PL bundles Pubmatic SDK with the HTTPS endpoint above, but
        // every other regional pepper-family build (NL/DE/UK/FR/MX/ES/AT/SE/.com)
        // ships an OLDER Pubmatic build that talks plain HTTP. Same host, same
        // path, just `http://` — distinct const-string so we redirect both.
        "http://ow.pubmatic.com/openrtb/2.5"  to "http://127.0.0.1:1",
        "https://owsdk.pubmatic.com/crashanalytics" to "https://127.0.0.1:1",
        "https://ads.pubmatic.com" to "https://127.0.0.1:1",
        // Pubmatic config URL (full template) — leaks because the URL is held
        // as a `static final String CONFIG_URL` in POBCommonConstants with the
        // FULL template, which the exact-match map didn't reach until it was
        // added explicitly. Retains the path so any 127.0.0.1:1 stub stood up
        // later parses the request cleanly.
        "https://ads.pubmatic.com/AdServer/js/pwt/%s/%d/config.json"
            to "https://127.0.0.1:1/AdServer/js/pwt/config.json",
        "https://ads.pubmatic.com/openbidsdk/monitor/app.html"
            to "https://127.0.0.1:1/openbidsdk/monitor/app.html",
        // Pubmatic SDK (POBUtils) holds the BASE prefix as its own const-string
        // and concatenates `<sid>/<pid>/config.json` at runtime, dodging the
        // POBCommonConstants.CONFIG_URL field redirect we already do. Catching
        // the prefix here means the runtime concat lands on 127.0.0.1:1.
        "https://ads.pubmatic.com/AdServer/js/pwt/" to "https://127.0.0.1:1/AdServer/js/pwt/",

        // Firebase Analytics
        "https://app-measurement.com/a" to "https://127.0.0.1:1/a",
        "https://app-measurement.com/s/d" to "https://127.0.0.1:1/s/d",
        "app-measurement.com" to "127.0.0.1",

        // Firebase Remote Config
        "https://firebaseremoteconfig.googleapis.com/v1/projects/"
            to "https://127.0.0.1:1/v1/projects/",
        "https://firebaseremoteconfigrealtime.googleapis.com/v1/projects/"
            to "https://127.0.0.1:1/v1/projects/",

        // Crashlytics settings
        "firebase-settings.crashlytics.com" to "127.0.0.1:1",
        "https://firebase-settings.crashlytics.com/spi/v2/platforms/android/gmp/"
            to "https://127.0.0.1:1/spi/v2/platforms/android/gmp/",

        // LiveRamp
        "https://api.rlcdn.com/api/identity/v2/" to "https://127.0.0.1:1/api/identity/v2/",

        // Confiant
        "https://protected-by.clarium.io/" to "https://127.0.0.1:1/",
        "https://cdn.confiant-integrations.net/" to "https://127.0.0.1:1/",

        // Moloco
        "https://sdkapi.dsp-api.moloco.com/v2/init" to "https://127.0.0.1:1",
        "https://sdkapi.dsp-api.moloco.com/v3/bidtoken" to "https://127.0.0.1:1",
        "https://sdkopmetrics-us.dsp-api.moloco.com/v1/tracking/init" to "https://127.0.0.1:1",
        "https://sdkopmetrics-us.dsp-api.moloco.com/v1/sdk/send/metrics/operational"
            to "https://127.0.0.1:1",
        "https://cdn-f.adsmoloco.com/moloco-cdn/privacy.html"
            to "https://127.0.0.1:1/moloco-cdn/privacy.html",

        // Facebook Audience Network logging
        "https://www.facebook.com/adnw_logging/" to "https://127.0.0.1:1/adnw_logging/",

        // Facebook Login + Core SDK telemetry. The SDK fires
        // /v16.0/app, /v16.0/app/mobile_sdk_gk and /v16.0/app/model_asset
        // every cold start (gatekeeper / model-config fetch). We CAN'T
        // disable the SDK init — `LoginManager.logIn` calls
        // `Validate.sdkInitialized()` and crashes otherwise (see
        // [neuterTrackerProvidersPatch] note about FacebookInitProvider).
        // Redirecting the host is safe: the SDK treats a network failure
        // as "no remote settings, use defaults" and Login still works
        // (auth itself runs in the system browser via Custom Tabs).
        //
        // The SDK does not store `https://graph.facebook.com` as a literal
        // const-string — instead it stores `https://graph.%s` and
        // `String.format`s the host suffix in at runtime. Same pattern as
        // Adjust above. Replacing the format string here drops the `%s`
        // placeholder so the final URL is just `https://127.0.0.1:1` —
        // OkHttp connects locally and gets refused, the SDK swallows the
        // IOException and falls back to its bundled default settings.
        "https://graph.%s" to "https://127.0.0.1:1",
        "https://graph-video.%s" to "https://127.0.0.1:1",

        // Google Mobile Ads / AdMob
        "https://pagead2.googlesyndication.com/pagead/ping?e=2&f=1"
            to "https://127.0.0.1:1/pagead/ping",
        "https://pagead2.googlesyndication.com/mads/asp" to "https://127.0.0.1:1/mads/asp",
        "//pagead2.googlesyndication.com/pagead/gen_204"
            to "//127.0.0.1:1/pagead/gen_204",
        "https://www.googleadservices.com/pagead/conversion/app/deeplink?id_type=adid&sdk_version="
            to "https://127.0.0.1:1/pagead/conversion/app/deeplink?id_type=adid&sdk_version=",
        "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/sdk-core-v40-loader.html"
            to "https://127.0.0.1:1/native/sdk-core-v40-loader.html",
        // GMA SDK base URL — used by zzbie's `webview_cookie_url` flag default
        // and concatenated by the SDK with runtime paths (/getconfig/pubsetting,
        // /favicon.ico, /mads/static/.../sdk-core-v40-{loader,impl}.{js,appcache},
        // /mads/static/.../native_ads.html, /mads/static/sdk/native/sdk-core-v40.html).
        // Every variant we can't enumerate as a const-string falls under this
        // base; with the host neutered the runtime concat lands on 127.0.0.1:1.
        "https://googleads.g.doubleclick.net" to "https://127.0.0.1:1",
        // Two GMA HTML resource variants that leak in practice and weren't
        // listed in patchinfo §3 — the SDK pre-fetches several v40 HTML files
        // on init.
        "https://googleads.g.doubleclick.net/mads/static/sdk/native/sdk-core-v40.html"
            to "https://127.0.0.1:1/sdk-core-v40.html",
        "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/native_ads.html"
            to "https://127.0.0.1:1/native_ads.html",
        "https://imasdk.googleapis.com/admob/sdkloader/native_video.html"
            to "https://127.0.0.1:1/admob/sdkloader/native_video.html",
        "https://csi.gstatic.com/csi" to "https://127.0.0.1:1/csi",

        // GMA / AdMob — additional hosts NOT in patchinfo §3, identified
        // during a real ad-render mitm capture.
        "https://pubads.g.doubleclick.net" to "https://127.0.0.1:1",
        "https://mediation.goog/mads/static/sdk/native/sdk-core-v40.html"
            to "https://127.0.0.1:1/sdk-core-v40.html",
        "https://admob-gmats.uc.r.appspot.com/" to "https://127.0.0.1:1/",
        "https://obplaceholder.click.com/" to "https://127.0.0.1:1/",
        "https://fundingchoicesmessages.google.com/a/consent"
            to "https://127.0.0.1:1/a/consent",

        // Pepper dev endpoint that should never fire in production
        "https://beta4-dev.eu-central-1.dealsix-aws.pepper.com/" to "https://127.0.0.1:1/",
    )

    execute {
        // Snapshot classDefs to a list before iterating — getOrReplaceMutable
        // mutates the live collection (replaces ImmutableClassDef with
        // MutableClassDef), which would throw ConcurrentModificationException
        // mid-iteration if we walked the live view directly.
        //
        // For each class we do TWO passes of work:
        //
        //   Pass A (instructions): every `const-string` / `const-string/jumbo`
        //     whose StringReference matches a tracker URL is rewritten to point
        //     to the `127.0.0.1:1` replacement.
        //
        //   Pass B (static fields): every `static final String` field whose
        //     `initialValue` is a tracker URL is rewritten to the localhost
        //     replacement. R8 stores these as encoded values in the dex
        //     static_values table; smali decompilation often shows them as a
        //     `.field … = "url"` directive that is NOT a `const-string`
        //     instruction in <clinit>, so Pass A on its own misses them and
        //     the URL leaks at runtime when the SDK reads the field. The
        //     pubmatic / vungle / GMA SDKs all keep their primary base URLs
        //     in this form (POBCommonConstants.SECURE_BASE_URL,
        //     POBCommonConstants.CONFIG_URL, cj9.RTA_DEBUG_ENDPOINT, etc.),
        //     so without Pass B the patch silently degrades to "URL still
        //     present in dex, sometimes redirected sometimes not".
        classDefForEach { classDef ->
            // Quick filter: any matching const-string OR matching static field
            // initial value in this class?
            val instructionMatch = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instr ->
                    if (instr.opcode != Opcode.CONST_STRING && instr.opcode != Opcode.CONST_STRING_JUMBO) {
                        return@any false
                    }
                    val ref = (instr as? ReferenceInstruction)?.reference as? StringReference
                    ref?.string in replacements
                } ?: false
            }
            val fieldMatch = classDef.fields.any { f ->
                (f.initialValue as? StringEncodedValue)?.value in replacements
            }
            if (!instructionMatch && !fieldMatch) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)

            // Pass B: static field initial values.
            mutableClass.fields.forEach fieldLoop@{ mutableField ->
                val current = (mutableField.initialValue as? StringEncodedValue)?.value
                    ?: return@fieldLoop
                val replacement = replacements[current] ?: return@fieldLoop
                mutableField.setInitialValue(
                    MutableStringEncodedValue(ImmutableStringEncodedValue(replacement)),
                )
            }
            mutableClass.methods.forEach methodLoop@{ mutableMethod ->
                val impl = mutableMethod.implementation ?: return@methodLoop

                // Snapshot instructions to a list so the index stays meaningful
                // even after we mutate.
                data class Hit(
                    val index: Int,
                    val register: Int,
                    val opcode: Opcode,
                    val replacement: String,
                )
                val snapshot = impl.instructions.toList()
                val hits = ArrayList<Hit>()
                snapshot.forEachIndexed { idx, instr ->
                    if (instr.opcode != Opcode.CONST_STRING && instr.opcode != Opcode.CONST_STRING_JUMBO) {
                        return@forEachIndexed
                    }
                    val ref = (instr as? ReferenceInstruction)?.reference as? StringReference
                        ?: return@forEachIndexed
                    val replacement = replacements[ref.string] ?: return@forEachIndexed
                    hits.add(
                        Hit(
                            index = idx,
                            register = (instr as OneRegisterInstruction).registerA,
                            opcode = instr.opcode,
                            replacement = replacement,
                        ),
                    )
                }
                if (hits.isEmpty()) return@methodLoop

                // Walk descending so each replaceInstruction at higher idx
                // doesn't shift indices of pending hits below.
                //
                // We use replaceInstruction with an explicitly-constructed
                // BuilderInstruction (preserving the original opcode form —
                // const-string vs const-string/jumbo) instead of the smali
                // compiler path. Reasoning:
                //   1. const-string is 4 bytes, const-string/jumbo is 6 bytes.
                //      If the smali compiler picks a different form than the
                //      original (driven by the new string's index in the dex
                //      string pool, which is sort-order dependent), the
                //      method byte-stream shifts and downstream branch / try-
                //      catch offsets reference wrong code → the dalvik
                //      verifier rejects the class with a Conflict register-
                //      type error at the first inconsistent jump target.
                //   2. We DO need to keep the same opcode the original had:
                //      replacing const-string/jumbo with const-string saves 2
                //      bytes (or vice-versa adds 2). MutableMethodImplementation
                //      uses a label-based builder, so the BUILDER recomputes
                //      label offsets correctly when an instruction's encoded
                //      size changes — but only when we do replaceInstruction
                //      with a Builder... typed object whose declared opcode
                //      matches what would have been emitted. By echoing the
                //      original opcode we guarantee zero size delta.
                hits.sortedByDescending { it.index }.forEach hitLoop@{ hit ->
                    val newRef = ImmutableStringReference(hit.replacement)
                    val newInstruction = when (hit.opcode) {
                        Opcode.CONST_STRING ->
                            BuilderInstruction21c(Opcode.CONST_STRING, hit.register, newRef)
                        Opcode.CONST_STRING_JUMBO ->
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, hit.register, newRef)
                        else -> return@hitLoop
                    }
                    impl.replaceInstruction(hit.index, newInstruction)
                }
            }
        }
    }
}
