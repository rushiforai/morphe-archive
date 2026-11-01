package patches.podimo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The typed success result `Sc.b$b(E.a)` that the validator's FREE branch already returns.
 * Every register window of the four gates has at least two free local registers.
 */
internal val ALLOWED = """
    new-instance v0, LSc/b${'$'}b;
    sget-object v1, Lid/E${'$'}a;->a:Lid/E${'$'}a;
    invoke-direct {v0, v1}, LSc/b${'$'}b;-><init>(Ljava/lang/Object;)V
    return-object v0
""".trim()

/**
 * The invisible banner `Xe.a(visible=false, text="")` the app already constructs for
 * unknown promotion states (`Ze/b.h` `:cond_2`). Returning it for every state removes
 * the top-left "Start free trial" promotion pill and its sibling upsell labels.
 */
internal val HIDDEN_BANNER = """
    new-instance v0, LXe/a;
    const/4 v1, 0x0
    const-string v2, ""
    invoke-direct {v0, v1, v2}, LXe/a;-><init>(ZLjava/lang/String;)V
    return-object v0
""".trim()

@Suppress("unused")
val unlockPremiumPlayback = bytecodePatch(
    name = "Unlock Premium playback",
    description = "Replaces every Premium button with the app's existing play button and lets its normal play " +
        "action run for Premium, Premium Plus, Premium-only episodes and exclusive podcasts, including without " +
        "an account. The app derives the button, the paywall navigation and the playback permission from one " +
        "user access validator; this patch returns its typed success result at that single boundary, so the " +
        "episode rows render the standard play button and the play action reaches the app's own signed " +
        "playback query. The server still decides whether to return a playback URL, and account data, profile " +
        "fields and subscription states are not modified. The top-left \"Start free trial\" promotion pill and " +
        "its sibling upsell labels are hidden with the app's own invisible banner.",
    default = true,
) {
    compatibleWith(podimo)
    dependsOn(originalInput)
    execute {
        // PREMIUM, PREMIUM_ONLY and PREMIUM_PLUS episode gates: always allowed now.
        // Register counts are dexlib2 totals: locals plus parameters plus `this`.
        exact("Lid/h0;", "m()LSc/b;", 5, 21).addInstructions(0, ALLOWED)
        exact("Lid/h0;", "n(Z)LSc/b;", 6, 34).addInstructions(0, ALLOWED)
        exact("Lid/h0;", "p(Z)LSc/b;", 6, 44).addInstructions(0, ALLOWED)
        // Exclusive/premium podcast gate used when a whole show is played.
        exact("Lid/h0;", "f(LKq/x;)LSc/b;", 5, 39).addInstructions(0, ALLOWED)
        // Top-left profile-menu promotion pill ("Start free trial" and siblings).
        exact("LZe/b;", "h(LUe/d;)LXe/a;", 6, 37).addInstructions(0, HIDDEN_BANNER)
    }
}

@Suppress("unused")
val guestSessionPlaybackHost = bytecodePatch(
    name = "Guest session playback host",
    description = "Points the app's production GraphQL API at Podimo's website host " +
        "(https://graphql.podimo.com/graphql). The Android gateway host (https://graphql.pdm-gateway.com) " +
        "rejected guest-session playback requests with HTTP 403 in the supplied analysis, while the website " +
        "host served the app's own guest registration, profile and single-episode playback operations and " +
        "returned signed full-length audio for Premium-labelled episodes to a fresh, unregistered guest with a " +
        "FREE subscription. With this patch the app registers its guest session and requests playback URLs " +
        "through the verified host; transport security, authentication headers, request signing and error " +
        "handling stay untouched. Staging and localhost routes are not affected.",
    default = true,
) {
    compatibleWith(podimo)
    dependsOn(originalInput)
    execute {
        val constructor = exact("LTc/c\$c;", "<init>(Ljava/util/Map;ILkotlin/jvm/internal/k;)V", 5, 20)
        val production = constructor.instructions.withIndex()
            .filter { it.value.opcode == Opcode.CONST_STRING }
            .filter { (it.value as ReferenceInstruction).reference is StringReference }
            .filter { ((it.value as ReferenceInstruction).reference as StringReference).string == GATEWAY_HOST }
            .map { it.index }
            .single()
        val register = constructor.getInstruction<OneRegisterInstruction>(production).registerA
        constructor.replaceInstruction(production, "const-string v$register, \"$WEBSITE_HOST\"")
    }
}

internal const val GATEWAY_HOST = "https://graphql.pdm-gateway.com/graphql"
internal const val WEBSITE_HOST = "https://graphql.podimo.com/graphql"
