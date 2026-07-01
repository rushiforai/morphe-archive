package app.pepper.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import app.pepper.patches.shared.clearBody

/**
 * Kill the runtime URLs that Datatransport (Google's batched-event delivery
 * library used by Crashlytics and Firelog) builds at runtime — namely
 * `crashlyticsreports-pa.googleapis.com/v1/firelog/legacy/batchlog` and
 * `firebaselogging-pa.googleapis.com/...` — by neutering the JobScheduler /
 * AlarmManager service entry points that drive the upload work.
 *
 * Why this is a different problem from URL redirects:
 *   The two backend hostnames live as Base64-encoded byte[] inside the
 *   bundled `CctTransportBackend` (obfuscated to `n51` in 8.13.00) and are
 *   decoded on demand to strings the SDK never holds in plain text in dex.
 *   `RedirectTrackerUrlsPatch` cannot rewrite them — they are not
 *   `const-string` instructions, not static-field initial values, just bytes.
 *   The author of patchinfo.txt §6 went looking for the plain hostnames and
 *   missed them on the same grounds, then concluded "none present" — empirical
 *   mitm capture proved that wrong: hits to both crashlyticsreports-pa and
 *   firebaselogging-pa during a single ad-rendering session.
 *
 * What we patch:
 *   - `com.google.android.datatransport.runtime.scheduling.jobscheduling
 *      .JobInfoSchedulerService.onStartJob(JobParameters)Z`
 *      → return false. Tells the OS the upload job is already done, so it
 *        never executes the SyncTaskRunnable that would call CctTransportBackend
 *        and POST the encoded events to the runtime URL. Returning false also
 *        skips reschedule.
 *
 *   - `com.google.android.datatransport.runtime.scheduling.jobscheduling
 *      .AlarmManagerSchedulerBroadcastReceiver.onReceive(Context, Intent)V`
 *      → empty body (return-void only). Same purpose for the AlarmManager
 *        scheduling path that pre-Android-O devices use; even on newer Android
 *        the receiver may still be hit on certain wakelock callbacks.
 *
 * Why this is safe:
 *   The Firebase ComponentRegistrar entry for TransportRegistrar stays alive
 *   — removing it crashes PepperApplication.onCreate. Cutting off only
 *   Datatransport's outbound pipe keeps the Firebase init graph happy while
 *   preventing any upload from reaching the network.
 *
 * Both target classes are in the `com.google.android.datatransport.runtime`
 * package which is preserved through R8 (NOT obfuscated), so we hit them
 * directly by their fully-qualified name. Method names `onStartJob`,
 * `onStopJob`, `onReceive` are framework callbacks and survive obfuscation.
 */
@Suppress("unused")
val killDatatransportPatch = bytecodePatch(
    name = "Kill Datatransport upload pipeline",
    description = "Blocks Crashlytics report and Firebase log uploads from " +
        "leaving the device.",
) {
    compatibleWith(*PEPPER_FAMILY)

    // T1 + T2 must run first — without them the GMA mediation Runnable
    // still reaches the main Looper through tracker URLs and provider
    // auto-init, and the partially-cut graph crashes at boot.
    dependsOn(redirectTrackerUrlsPatch, neuterTrackerProvidersPatch)

    val jobSchedulerServiceType =
        "Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;"
    val alarmReceiverType =
        "Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;"

    execute {
        classDefForEach { classDef ->
            when (classDef.type) {
                jobSchedulerServiceType -> {
                    val mutableClass = mutableClassDefBy(classDef)
                    mutableClass.methods.forEach { method ->
                        when {
                            method.name == "onStartJob" &&
                                method.parameterTypes.size == 1 &&
                                method.parameterTypes[0] == "Landroid/app/job/JobParameters;" &&
                                method.returnType == "Z" -> {
                                method.clearBody()
                                method.addInstructions(
                                    0,
                                    """
                                    const/4 v0, 0x0
                                    return v0
                                    """.trimIndent(),
                                )
                            }
                            method.name == "onStopJob" &&
                                method.parameterTypes.size == 1 &&
                                method.parameterTypes[0] == "Landroid/app/job/JobParameters;" &&
                                method.returnType == "Z" -> {
                                method.clearBody()
                                method.addInstructions(
                                    0,
                                    """
                                    const/4 v0, 0x0
                                    return v0
                                    """.trimIndent(),
                                )
                            }
                        }
                    }
                }

                alarmReceiverType -> {
                    val mutableClass = mutableClassDefBy(classDef)
                    mutableClass.methods.forEach { method ->
                        if (method.name == "onReceive" &&
                            method.parameterTypes.size == 2 &&
                            method.returnType == "V"
                        ) {
                            method.clearBody()
                            method.addInstructions(0, "return-void")
                        }
                    }
                }
            }
        }
    }
}
