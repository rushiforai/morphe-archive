package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_XML_NAMESPACE =
    "http://schemas.android.com/apk/res/android"

private const val DAILY_REWARD_CHECK_ACTION =
    "app.danielthemaniel.pokeraid.CHECK_DAILY_REWARD"

private const val DAILY_REWARD_STATUS_ACTION =
    "app.danielthemaniel.pokeraid.DAILY_REWARD_STATUS"

private const val DAILY_REWARD_CLAIM_ACTION =
    "app.danielthemaniel.pokeraid.DAILY_REWARD_CLAIM"

private val dailyRewardBackgroundStatusManifestPatchV4 = resourcePatch {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        document("AndroidManifest.xml").use { document ->
            val receivers = document.getElementsByTagName("receiver")
            var target: Element? = null

            for (i in 0 until receivers.length) {
                val receiver = receivers.item(i) as? Element ?: continue

                val receiverName =
                    receiver.getAttribute("android:name").ifEmpty {
                        receiver.getAttributeNS(
                            ANDROID_XML_NAMESPACE,
                            "name",
                        )
                    }

                if (
                    receiverName ==
                    "androidx.work.impl.diagnostics.DiagnosticsReceiver"
                ) {
                    target = receiver
                    break
                }
            }

            requireNotNull(target) {
                "Could not locate WorkManager DiagnosticsReceiver"
            }

            target.removeAttribute("android:permission")
            target.removeAttributeNS(
                ANDROID_XML_NAMESPACE,
                "permission",
            )

            target.setAttributeNS(
                ANDROID_XML_NAMESPACE,
                "android:enabled",
                "true",
            )
            target.setAttributeNS(
                ANDROID_XML_NAMESPACE,
                "android:exported",
                "true",
            )

            val filters = target.getElementsByTagName("intent-filter")

            for (i in 0 until filters.length) {
                val filter = filters.item(i) as? Element ?: continue
                val actions = filter.getElementsByTagName("action")

                for (j in actions.length - 1 downTo 0) {
                    val action = actions.item(j)
                    filter.removeChild(action)
                }
            }

            val filter = if (filters.length > 0) {
                filters.item(0) as Element
            } else {
                document.createElement("intent-filter").also {
                    target.appendChild(it)
                }
            }

            val action = document.createElement("action")
            action.setAttributeNS(
                ANDROID_XML_NAMESPACE,
                "android:name",
                DAILY_REWARD_CHECK_ACTION,
            )
            filter.appendChild(action)
        }
    }
}

@Suppress("unused")
val dailyRewardBackgroundStatusPatchV4 = bytecodePatch(
    name = "Daily Reward Background Auto-Claim",
    description = "Checks daily reward eligibility and automatically claims it (bypassing ads) if available. Invoke by sending intent as broadcast, with action app.danielthemaniel.pokeraid.CHECK_DAILY_REWARD, and package me.pokeraid.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)
    dependsOn(dailyRewardBackgroundStatusManifestPatchV4)

    execute {
        val receiverClass = mutableClassDefBy(
            "Landroidx/work/impl/diagnostics/DiagnosticsReceiver;"
        )

        val onReceive = receiverClass.methods.first {
            it.name == "onReceive" &&
                it.parameterTypes.size == 2 &&
                it.parameterTypes[0] == "Landroid/content/Context;" &&
                it.parameterTypes[1] == "Landroid/content/Intent;"
        }

        onReceive.addInstructions(
            0,
            """
            const-string v0, "DanielDailyReward"
            const-string v1, "Receiver invoked"
            invoke-static { v0, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
            """.trimIndent()
        )

        val workerClass = mutableClassDefBy(
            "Landroidx/work/impl/workers/DiagnosticsWorker;"
        )

        val doWork = workerClass.methods.first {
            it.name == "doWork" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "Landroidx/work/ListenableWorker\$Result;"
        }

        doWork.addInstructions(
            0,
            """
            move-object/from16 v5, p0

            const-string v3, "DanielDailyReward"
            const-string v4, "Worker started"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            const-wide/16 v0, 0xbb8
            invoke-static { v0, v1 }, Landroid/os/SystemClock;->sleep(J)V

            const-string v3, "DanielDailyReward"
            const-string v4, "Cold-start readiness delay complete"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            const-string v3, "DanielDailyReward"
            const-string v4, "Building daily reward repository"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            invoke-static { }, Lji/b;->c()Lcom/google/firebase/storage/d;
            move-result-object v0

            const-string v3, "DanielDailyReward"
            const-string v4, "Repository built"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            const-string v3, "DanielDailyReward"
            const-string v4, "Starting eligibility request"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            :try_start_daily_reward_first
            new-instance v1, Lli/e;
            const/4 v2, 0x0
            invoke-direct { v1, v0, v2 }, Lli/e;-><init>(Lcom/google/firebase/storage/d;I)V

            invoke-virtual { v1 }, Lli/e;->invoke()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lme/pokelounge/network/model/DailyRewardResponse;
            :try_end_daily_reward_first
            .catch Ljava/lang/Throwable; {:try_start_daily_reward_first .. :try_end_daily_reward_first} :catch_daily_reward_first

            const-string v3, "DanielDailyReward"
            const-string v4, "Eligibility request completed on first attempt"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            goto :daily_reward_request_ok

            :catch_daily_reward_first
            move-exception v0

            const-string v3, "DanielDailyReward"
            const-string v4, "Eligibility request first attempt FAILED; retrying"
            invoke-static { v3, v4, v0 }, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

            const-wide/16 v0, 0x5dc
            invoke-static { v0, v1 }, Landroid/os/SystemClock;->sleep(J)V

            const-string v3, "DanielDailyReward"
            const-string v4, "Retry backoff complete"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            invoke-static { }, Lji/b;->c()Lcom/google/firebase/storage/d;
            move-result-object v0

            :try_start_daily_reward_second
            new-instance v1, Lli/e;
            const/4 v2, 0x0
            invoke-direct { v1, v0, v2 }, Lli/e;-><init>(Lcom/google/firebase/storage/d;I)V

            invoke-virtual { v1 }, Lli/e;->invoke()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lme/pokelounge/network/model/DailyRewardResponse;
            :try_end_daily_reward_second
            .catch Ljava/lang/Throwable; {:try_start_daily_reward_second .. :try_end_daily_reward_second} :catch_daily_reward_second

            const-string v3, "DanielDailyReward"
            const-string v4, "Eligibility request completed on retry"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            goto :daily_reward_request_ok

            :catch_daily_reward_second
            move-exception v0

            const-string v3, "DanielDailyReward"
            const-string v4, "Eligibility request FAILED after retry"
            invoke-static { v3, v4, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

            invoke-static { }, Landroidx/work/ListenableWorker${'$'}Result;->failure()Landroidx/work/ListenableWorker${'$'}Result;
            move-result-object v0
            return-object v0

            :daily_reward_request_ok
            nop

            # ==============================================================
            # STAGE 5 — BUILD RESULT BROADCAST (STATUS)
            # ==============================================================
            invoke-virtual { v5 }, Landroidx/work/ListenableWorker;->getApplicationContext()Landroid/content/Context;
            move-result-object v1

            new-instance v2, Landroid/content/Intent;
            const-string v3, "$DAILY_REWARD_STATUS_ACTION"
            invoke-direct { v2, v3 }, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

            const-string v3, "requestSucceeded"
            iget-boolean v4, v0, Lme/pokelounge/network/model/DailyRewardResponse;->a:Z
            invoke-virtual { v2, v3, v4 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

            invoke-static { v4 }, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
            move-result-object v4
            const-string v3, "requestSucceeded="
            invoke-virtual { v3, v4 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v4
            const-string v3, "DanielDailyReward"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

            const-string v3, "eligible"
            iget-object v1, v0, Lme/pokelounge/network/model/DailyRewardResponse;->c:Ljava/lang/Boolean;
            invoke-virtual { v4, v1 }, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z
            move-result v1
            invoke-virtual { v2, v3, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

            invoke-static { v1 }, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
            move-result-object v1
            const-string v3, "eligible="
            invoke-virtual { v3, v1 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            const-string v3, "DanielDailyReward"
            invoke-static { v3, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            const-string v3, "adRequired"
            iget-object v1, v0, Lme/pokelounge/network/model/DailyRewardResponse;->h:Ljava/lang/Boolean;
            invoke-virtual { v4, v1 }, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z
            move-result v1
            invoke-virtual { v2, v3, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

            invoke-static { v1 }, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
            move-result-object v1
            const-string v3, "adRequired="
            invoke-virtual { v3, v1 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            const-string v3, "DanielDailyReward"
            invoke-static { v3, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            const-string v3, "message"
            iget-object v1, v0, Lme/pokelounge/network/model/DailyRewardResponse;->b:Ljava/lang/String;
            invoke-virtual { v2, v3, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

            invoke-static { v1 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v1
            const-string v3, "message="
            invoke-virtual { v3, v1 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            const-string v3, "DanielDailyReward"
            invoke-static { v3, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            const-string v3, "rawResponse"
            invoke-virtual { v0 }, Lme/pokelounge/network/model/DailyRewardResponse;->toString()Ljava/lang/String;
            move-result-object v1
            invoke-virtual { v2, v3, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

            invoke-static { v1 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v1
            const-string v3, "rawResponse="
            invoke-virtual { v3, v1 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            const-string v3, "DanielDailyReward"
            invoke-static { v3, v1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            invoke-virtual { v5 }, Landroidx/work/ListenableWorker;->getApplicationContext()Landroid/content/Context;
            move-result-object v1
            invoke-virtual { v1, v2 }, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

            const-string v3, "DanielDailyReward"
            const-string v4, "Result broadcast sent"
            invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            # ==============================================================
            # STAGE 6 — AUTO-CLAIM REWARD IF ELIGIBLE
            # ==============================================================
            # RELOAD Boolean.TRUE into v4 (it was overwritten by the log string above)
            sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            
            # v0 is DailyRewardResponse. Check isNewRewardAvailable (field c)
            iget-object v1, v0, Lme/pokelounge/network/model/DailyRewardResponse;->c:Ljava/lang/Boolean;
            invoke-virtual { v4, v1 }, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z
            move-result v1
            
            # v1 is 1 if eligible, 0 if not
            if-eqz v1, :daily_reward_claim_done

            const-string v2, "DanielDailyReward"
            const-string v3, "Eligible! Starting auto-claim"
            invoke-static { v2, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            # Re-fetch repository into v1
            invoke-static { }, Lji/b;->c()Lcom/google/firebase/storage/d;
            move-result-object v1

            # li.g constructor: (com.google.firebase.storage.d, String, int)
            const-string v2, ""
            const/4 v3, 0x1
            new-instance v4, Lli/g;
            invoke-direct { v4, v1, v2, v3 }, Lli/g;-><init>(Lcom/google/firebase/storage/d;Ljava/lang/String;I)V

            :try_start_daily_claim
            invoke-virtual { v4 }, Lli/g;->invoke()Ljava/lang/Object;
            move-result-object v1
            check-cast v1, Lme/pokelounge/network/model/BaseResultCodeResponse;
            :try_end_daily_claim
            .catch Ljava/lang/Throwable; {:try_start_daily_claim .. :try_end_daily_claim} :catch_daily_claim

            const-string v2, "DanielDailyReward"
            const-string v3, "Auto-claim completed"
            invoke-static { v2, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            # Parse claim result. v1 is BaseResultCodeResponse
            iget-boolean v2, v1, Lme/pokelounge/network/model/BaseResultCodeResponse;->a:Z
            
            new-instance v3, Landroid/content/Intent;
            const-string v4, "$DAILY_REWARD_CLAIM_ACTION"
            invoke-direct { v3, v4 }, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

            const-string v4, "claimSucceeded"
            invoke-virtual { v3, v4, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

            invoke-static { v2 }, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
            move-result-object v4
            const-string v2, "claimSucceeded="
            invoke-virtual { v2, v4 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v4
            const-string v2, "DanielDailyReward"
            invoke-static { v2, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            # v1 is BaseResultCodeResponse. Get message (field b)
            iget-object v4, v1, Lme/pokelounge/network/model/BaseResultCodeResponse;->b:Ljava/lang/String;
            const-string v2, "claimMessage"
            invoke-virtual { v3, v2, v4 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

            invoke-static { v4 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v4
            const-string v2, "claimMessage="
            invoke-virtual { v2, v4 }, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v4
            const-string v2, "DanielDailyReward"
            invoke-static { v2, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            # Send broadcast. p0 is the Worker.
            invoke-virtual { p0 }, Landroidx/work/ListenableWorker;->getApplicationContext()Landroid/content/Context;
            move-result-object v2
            invoke-virtual { v2, v3 }, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

            const-string v2, "DanielDailyReward"
            const-string v3, "Claim broadcast sent"
            invoke-static { v2, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

            goto :daily_reward_claim_done

            :catch_daily_claim
            move-exception v1
            const-string v2, "DanielDailyReward"
            const-string v3, "Auto-claim FAILED"
            invoke-static { v2, v3, v1 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

            new-instance v3, Landroid/content/Intent;
            const-string v4, "$DAILY_REWARD_CLAIM_ACTION"
            invoke-direct { v3, v4 }, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

            const-string v4, "claimSucceeded"
            const/4 v2, 0x0
            invoke-virtual { v3, v4, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
            
            const-string v4, "claimMessage"
            const-string v2, "Exception"
            invoke-virtual { v3, v4, v2 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

            invoke-virtual { p0 }, Landroidx/work/ListenableWorker;->getApplicationContext()Landroid/content/Context;
            move-result-object v4
            invoke-virtual { v4, v3 }, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

            :daily_reward_claim_done
            nop

            # Finish WorkManager successfully.
            invoke-static { }, Landroidx/work/ListenableWorker${'$'}Result;->success()Landroidx/work/ListenableWorker${'$'}Result;
            move-result-object v0
            return-object v0
            """.trimIndent()
        )
    }
}