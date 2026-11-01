package patches.videoland

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import patches.atv.exact

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Includes tracking controls. Saves OneTrust's real Reject All choice after SDK readiness and skips automatic notification setup. Notifications default off; manual privacy and notification settings remain available.",
    default = true,
) {
    compatibleWith(videolandMobile)
    dependsOn(originalInput, disableTrackingPatch)
    execute {
        // The real SDK has loaded its categories here. Save the same choice as
        // the banner's Reject All button before publishing the original ready SDK.
        // Apply the first migration or genuine SDK reconsent only; preserve later manual choices.
        exact("LB2/c;", "onSuccess(Lcom/onetrust/otpublishers/headless/Public/Response/OTResponse;)V", 4, 17).apply {
            val anchors = instructions.withIndex().filter { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.definingClass == "LB2/c;" && field.name == "f" && field.type == "Ljava/lang/Object;"
            }
            check(anchors.size == 1) { "Changed Videoland OneTrust ready callback" }
            val start = anchors.single().index
            addInstructions(start, """
                iget-object v0, p0, LB2/c;->g:Ljava/lang/Object;
                check-cast v0, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;
                iget-object v1, v0, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;->a:Landroid/content/Context;
                const-string p1, "patches.videoland.onboarding"
                const/4 v0, 0x0
                invoke-virtual {v1, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                move-result-object v1
                const-string p1, "necessary_consent_policy_v1"
                const/4 v0, 0x0
                invoke-interface {v1, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
                move-result v0
                nop # migration branch installed below
                iget-object v0, p0, LB2/c;->g:Ljava/lang/Object;
                check-cast v0, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;
                invoke-virtual {v0}, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;->shouldShowBanner()Z
                move-result v0
                nop # existing-choice branch installed below
                iget-object v0, p0, LB2/c;->g:Ljava/lang/Object;
                check-cast v0, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;
                const-string p1, "Banner - Reject All"
                invoke-virtual {v0, p1}, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;->saveConsent(Ljava/lang/String;)V
                invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v1
                const-string p1, "necessary_consent_policy_v1"
                const/4 v0, 0x1
                invoke-interface {v1, p1, v0}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v1
                invoke-interface {v1}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
                nop
            """.trimIndent())
            // Bind labels to the inserted instruction locations, not the temporary
            // assembler method's code addresses at this nonzero insertion offset.
            val reject = implementation!!.newLabelForIndex(start + 17)
            val complete = implementation!!.newLabelForIndex(start + 28)
            replaceInstruction(start + 11, BuilderInstruction21t(Opcode.IF_EQZ, 0, reject))
            replaceInstruction(start + 16, BuilderInstruction21t(Opcode.IF_EQZ, 0, complete))
        }

        // This task produces startup UI effects, not OS permission results.
        // Return its original no-UI ready value after the real Result check.
        // Keep the Activity and its request timestamp bookkeeping entirely original.
        exact("Lcom/bedrockstreaming/feature/splash/domain/usecase/tasks/e;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 16, 115).apply {
            val anchors = instructions.withIndex().filter { (_, instruction) ->
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/bedrockstreaming/feature/splash/domain/usecase/tasks/NotificationPermissionTask;->c:Lhi/h;"
            }
            check(anchors.size == 1) { "Changed Videoland startup notification task" }
            check((instructions.elementAt(anchors.single().index - 1) as? ReferenceInstruction)?.reference?.toString() ==
                "Lk4/M;->p(Ljava/lang/Object;)V") { "Changed Videoland notification Result check" }
            addInstructions(anchors.single().index, """
                new-instance v0, Lri/o;
                const/4 v1, 0x1
                const/4 v2, 0x1
                const/4 v3, 0x0
                invoke-direct {v0, v1, v2, v3}, Lri/o;-><init>(ZZLcom/bedrockstreaming/feature/splash/domain/usecase/tasks/f;)V
                return-object v0
            """.trimIndent())
        }

        // Start off while the real preference coroutine loads. Its original
        // persistence and observable-state updates restore explicit OPT_IN.
        subscribedState("Lcom/bedrockstreaming/feature/pushnotification/data/PushStateManagerImpl;",
            "<init>(Landroid/app/Application;Lhi/a;Lhi/d;Lhi/f;Lhi/g;Lvq/a;)V", 8, 49, "f")
        subscribedState("Lcom/bedrockstreaming/feature/pushnotification/data/LegacyPushStateManagerImpl;",
            "<init>(Lhi/a;Lhi/f;Lhi/g;Lvq/a;)V", 6, 40, "f")
        subscribedState("Lcom/bedrockstreaming/feature/pushnotification/data/PushStateManagerImpl;",
            "d(Lcom/bedrockstreaming/feature/pushnotification/data/PushStateManagerImpl;Lwy/c;)Ljava/lang/Object;",
            11, 95, "f")

        // Legacy Android normally treats OS permission as an implicit app
        // subscription. Convert that state through the original store/update
        // continuation, including absent/invalid preferences, while keeping OPT_IN.
        subscribedState("Lgi/a;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 9, 52, "f").apply {
            val anchors = instructions.withIndex().filter { (_, instruction) ->
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                    "Lwt/d;->L(${PUSH_STATUS})Z"
            }
            check(anchors.size == 1) { "Changed Videoland legacy notification normalization" }
            val move = instructions.elementAt(anchors.single().index + 3)
            check(move.opcode == Opcode.MOVE_OBJECT && (move as TwoRegisterInstruction).registerA == 0 &&
                move.registerB == 8) { "Changed Videoland stored notification state" }
            val start = anchors.single().index + 4
            addInstructions(start, """
                sget-object v4, $PUSH_STATUS->e:$PUSH_STATUS
                nop # explicit-choice branch installed below
                sget-object v0, $PUSH_STATUS->f:$PUSH_STATUS
                nop
            """.trimIndent())
            val explicit = implementation!!.newLabelForIndex(start + 3)
            replaceInstruction(start + 1, BuilderInstruction22t(Opcode.IF_NE, 0, 4, explicit))
        }

        // A genuine manual toggle is explicit OPT_IN, not the old implicit
        // SUBSCRIBED default. This survives the next initialization on API24-32.
        subscribedState("LH9/b;", "call()Ljava/lang/Object;", 10, 519, "d")
    }
}

private const val PUSH_STATUS = "Lcom/bedrockstreaming/feature/pushnotification/domain/PushPermissionStatus;"

context(context: BytecodePatchContext)
private fun subscribedState(owner: String, signature: String, registers: Int, count: Int, replacement: String) =
    exact(owner, signature, registers, count).also { method ->
        val anchors = method.instructions.withIndex().filter { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            field?.definingClass == PUSH_STATUS && field.name == "e" && field.type == PUSH_STATUS
        }
        check(anchors.size == 1) { "Changed Videoland implicit notification state: $owner->$signature" }
        val anchor = anchors.single()
        val register = (anchor.value as OneRegisterInstruction).registerA
        method.replaceInstruction(anchor.index, "sget-object v$register, $PUSH_STATUS->$replacement:$PUSH_STATUS")
    }
