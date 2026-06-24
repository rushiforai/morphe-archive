package app.pepper.patches.telemetry

import app.morphe.patcher.util.proxy.mutableTypes.MutableAnnotation
import app.morphe.patcher.util.proxy.mutableTypes.MutableAnnotationElement
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue

/**
 * Block Pepper's first-party `/rest_api/v2/analytics-event-report` behavioural
 * tracker by rewriting the Retrofit `@POST` paths declared on its interface
 * methods so every call lands on a stub the server returns 404 for, instead
 * of the real telemetry endpoint.
 *
 * What this thing collects:
 *   - `event=thread_visit`                   → every deal opened
 *   - `event=thread_share`                   → every share tap
 *   - `event=mobile_push_notification_click` → every push opened
 *   - `event=mobile_app_search_suggestion_click` and a generic
 *     `analytics-event-report` dispatcher for ad-hoc events
 *
 *   Each event carries `thread_id`, `time`, and an `ocular_context` JSON
 *   blob with `screen_name`, sort order, `group_id` and source `utm`.
 *
 *   The "ocular_context" naming matches the third-party `ocular.pepper.pl`
 *   batch tracker neutered by [killFirstPartyPixelTrackingPatch] — same
 *   surveillance product, two different intake endpoints. T5 takes out the
 *   batch firehose; this patch closes the synchronous-event sibling.
 *
 * Where the calls come from:
 *   The endpoint is exposed as four Retrofit `@POST` methods declared on
 *   two interfaces (obfuscated `Lui;` and `Ld08;` in stock 8.13.00),
 *   wired in from four call sites:
 *     - `PostShareThreadWorker.doWork()` (background WorkManager)
 *     - `PostVisitThreadWorker.doWork()` (background WorkManager)
 *     - push-notification click handler (anonymous lambda)
 *     - generic event dispatcher (anonymous coroutine continuation)
 *
 *   NOPping the four call sites means tracking down obfuscated lambda /
 *   continuation classes per Pepper release, and patching coroutine state
 *   machines is fragile. Editing the Retrofit `@POST` value once kills
 *   the path at source — every existing and future call site that wires
 *   through these interfaces lands on the stub.
 *
 * How the rewrite works:
 *   For each method in the dex, scan its annotations for a single-element
 *   `value` of `StringEncodedValue` whose string starts with
 *   `analytics-event-report` (matches the bare path and every `?event=…`
 *   variant). Replace that element with the literal stub
 *   `revanced-disabled-pepper-telemetry`. Retrofit will build
 *   `https://www.pepper.pl/rest_api/v2/revanced-disabled-pepper-telemetry`,
 *   the server returns 404, and Pepper's fire-and-forget caller swallows
 *   the failure. No further reachability handling needed because nothing
 *   in the app inspects the response.
 *
 *   We deliberately don't gate on the annotation type (it's R8-obfuscated;
 *   in 8.13.00 it shows as `Ln78;`, which rotates per build). Matching by
 *   the unique path-prefix string is unambiguous — no other Retrofit `@POST`
 *   in the apk shares that prefix, so collateral matches are impossible.
 *
 *   Trade-off: the request itself still leaves the device, just with the
 *   wrong path. The `Pepper-Hardware-Id` header [killFirstPartyPixelTracking]
 *   already mocks rides along, but that header rides along on every other
 *   pepper.pl call too, so it isn't extra exposure. The win is that the
 *   server never sees the event payload (`thread_id`, `ocular_context`,
 *   etc.) — which is the actual surveillance data.
 */
@Suppress("unused")
val killPepperAnalyticsReportPatch = bytecodePatch(
    name = "Block Pepper analytics-event-report tracker",
    description = "Stops Pepper's own behavioural tracker (thread visits, " +
        "shares, push clicks, search suggestions) from reaching the server.",
) {
    compatibleWith(*PEPPER_FAMILY)

    val targetPathPrefix = "analytics-event-report"
    // Absolute URL — leading `http://` makes Retrofit replace its base URL,
    // so the request goes to localhost:1 (kernel-rejected) instead of
    // pepper.pl/<stub>. The surveillance payload never leaves the device.
    val stubPath = "http://127.0.0.1:1/revanced-blocked-pepper-ocular"

    execute {

        classDefForEach { classDef ->
            // Only enter `getOrReplaceMutable` if there's at least one match
            // — otherwise the cost of materialising every class as mutable
            // would dwarf the actual edit work.
            val classMatches = classDef.methods.any { method ->
                method.annotations.any { ann ->
                    ann.elements.any { el ->
                        val v = el.value
                        v is StringEncodedValue && v.value.startsWith(targetPathPrefix)
                    }
                }
            }
            if (!classMatches) return@classDefForEach

            val mutClass = mutableClassDefBy(classDef)
            mutClass.methods.forEach { method ->
                method.annotations.forEach annLoop@{ ann ->
                    // `MutableAnnotation.elements` is a mutable Set. Find the
                    // single element whose String value carries the
                    // analytics-event-report path, swap it out for the
                    // disabled stub. Annotation type stays untouched so
                    // Retrofit's reflection lookup still finds it.
                    val target = ann.elements.firstOrNull { el ->
                        val v = el.value
                        v is StringEncodedValue && v.value.startsWith(targetPathPrefix)
                    } ?: return@annLoop

                    val replacement = MutableAnnotationElement(
                        ImmutableAnnotationElement(
                            target.name,
                            ImmutableStringEncodedValue(stubPath),
                        ),
                    )
                    ann.elements.remove(target)
                    ann.elements.add(replacement)
                }
            }
        }
    }
}
