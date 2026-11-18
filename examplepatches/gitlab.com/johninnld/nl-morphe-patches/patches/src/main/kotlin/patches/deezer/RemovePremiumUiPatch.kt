package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * Deezer keeps subscription upsells in its native UI even when the Premium
 * surfaces are blocked: the Premium item in the bottom navigation bar, the
 * "Get Premium" button on the user profile, the conversion banner and the Plan
 * management row in Settings. Remove those surfaces and show the free plan as
 * Deezer Premium so the app no longer advertises a plan the patched account
 * cannot buy.
 */
@Suppress("unused")
val deezerRemovePremiumUi = bytecodePatch(
    name = "Remove premium upsell UI",
    description = "Removes the Premium tab from the bottom navigation bar, the Get Premium button on the " +
        "user profile, the conversion banner and Plan management row in Settings, and shows the free " +
        "account plan as Deezer Premium. Account, catalogue, playback and the remaining Settings items " +
        "are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(originalInput, deezerKeepSessionOnColdStart)

    execute {
        // Build the tab list without PREMIUM. The old menu.removeItem(5) call sits
        // after the loop's exit branch and is never executed, so remove the tab
        // from the model before the bottom bar, rail and drawer consume it.
        val buildTabs = exact(
            "LlIlllIlIlllIIll;",
            "build",
            "LIlllIIlllIIlIll;",
        ).method
        val buildInstructions = buildTabs.implementation?.instructions
            ?: error("Deezer tab model has no body")
        val tabConfigNewInstance = buildInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                (instruction as? ReferenceInstruction)?.reference?.toString() == "LIlllIIlllIIlIll;"
        }
        check(tabConfigNewInstance >= 0) { "Deezer tab model builder changed" }
        buildTabs.addInstructions(
            tabConfigNewInstance,
            """
                sget-object v0, LIllIllIlIIIIIIlI;->IllIllIIIIllIlll:LIllIllIlIIIIIIlI;
                invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
            """,
        )

        // The Settings subscription section renders Plan management only when
        // SubscriptionData.subscriptionVisible is true. Force that flag off while
        // preserving the offer badge, referral state and banner state fields.
        exact(
            "LIllIIlIllIlIIll;",
            "<init>",
            "V",
            "Z",
            "Z",
            "LIIlIIlllIllIlIl;",
            "LIIIllllllIlllII;",
            "Z",
        ).method.addInstructions(1, "const/4 p1, 0x0")

        // Visually list the free account as Deezer Premium. Exact matches only, so
        // unrelated copy that happens to contain "Deezer Free" is left alone.
        exact(
            "LlIIIIIIlIIIlIl;",
            "<init>",
            "V",
            "Ljava/lang/CharSequence;",
        ).method.addInstructions(
            0,
            """
                invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;
                move-result-object v0
                const-string v1, "Deezer Free"
                invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_keep_plan_name
                const-string p1, "Deezer Premium"
                :morphe_keep_plan_name
            """,
        )

        // User profile header: the diamond "Get Premium" button is its own
        // composable. Return before it emits the button; Edit profile and the
        // rest of the header are rendered by neighbouring composables.
        exact(
            "LIlIllIIIlIlllIlI;",
            "IllllIllIIIlII",
            "V",
            "LllIIlllIlIIIl;",
            "Lkotlin/jvm/functions/Function0;",
            "LIllIIIIllIIIllII;",
            "LIlIIlllIIllIIlII;",
            "I",
        ).method.addInstructions(0, "return-void")

        // Settings subscription section: this composable renders the purple
        // "Choose what you listen to" conversion banner. An early return leaves
        // the section header, current plan and the rest of the settings list intact.
        exact(
            "LIlIIllIIIIllIIlI;",
            "IllIIIlIIII",
            "V",
            "LIIIllllllIlllII;",
            "Lkotlin/jvm/functions/Function0;",
            "LIllIIIIllIIIllII;",
            "LIlIIlllIIllIIlII;",
            "I",
        ).method.addInstructions(0, "return-void")
    }
}
