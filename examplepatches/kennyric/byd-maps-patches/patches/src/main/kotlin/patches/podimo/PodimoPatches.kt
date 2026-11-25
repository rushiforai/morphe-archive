package patches.podimo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The typed success result `ur.j(ks.k)` that the validator's allowed branches
 * already return. Every register window of the four gates has two free locals.
 */
internal val ALLOWED = """
    new-instance v0, Lur/j;
    sget-object v1, Lks/k;->a:Lks/k;
    invoke-direct {v0, v1}, Lur/j;-><init>(Ljava/lang/Object;)V
    return-object v0
""".trim()

/**
 * The invisible promotion pill `wv.a(visible=false, text="")` the profile pill
 * builder already constructs for unknown promotion states. The unlock patch
 * forces the banner register to it right before the pill row is assembled, so
 * every promotion state renders the app's own invisible banner.
 */
internal val HIDDEN_BANNER = """
    new-instance v9, Lwv/a;
    const/4 v0, 0x0
    const-string p1, ""
    invoke-direct {v9, v0, p1}, Lwv/a;-><init>(ZLjava/lang/String;)V
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
        exact("Lks/w;", "e()Lur/k;", 5, 21).addInstructions(0, ALLOWED)
        exact("Lks/w;", "f(Z)Lur/k;", 5, 34).addInstructions(0, ALLOWED)
        exact("Lks/w;", "g(Z)Lur/k;", 7, 49).addInstructions(0, ALLOWED)
        // Exclusive/premium podcast gate used when a whole show is played.
        exact("Lks/w;", "d(Lfi0/y0;)Lur/k;", 5, 36).addInstructions(0, ALLOWED)
        // Top-left profile-menu promotion pill ("Start free trial" and siblings): the
        // banner register v9 is overwritten with the invisible banner just before the
        // row is assembled; v0 and p1 are dead at that point in the original method.
        val pill = exact("Lyv/b;", "a(Ltv/k;Lwv/e;)Lwv/f;", 14, 64).also { check(it.name == "a") }
        check(pill.instructions.none { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference && reference.definingClass == CAR_BROWSE
        }) { "Podimo pill builder already hooked" }
        val row = pill.instructions.withIndex().singleOrNull { (_, instruction) ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                (instruction as ReferenceInstruction).reference.toString() == "Lwv/f;"
        } ?: error("Podimo pill row construction contract changed")
        pill.addInstructions(row.index, HIDDEN_BANNER)
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
        val constructor = exact("Lvr/d;", "<init>()V", 6, 19)
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

private const val CAR_BROWSE = "Lpatches/podimo/CarBrowse;"
private const val TREE_FILTER = "$CAR_BROWSE->filter(Ljava/lang/Object;)Ljava/lang/Object;"
private const val ROOT_TABS = "$CAR_BROWSE->rootTabs(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;"
private const val TREE_FOR = "$CAR_BROWSE->treeFor(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;"
private const val FILTER_CALL = "Lzz/f;->e(Ljava/util/List;)Ljava/util/List;"
private const val LIBRARY_RESULT = "Lv9/u;->e(Ljava/util/List;Lv9/m1;)Lv9/u;"

/** The method's declared parameter type descriptors. */
private fun Method.descriptors(): List<String> = parameterTypes.map { it.toString() }

/** Pin one public field with an exact type, as the CarBrowse reflection sees it. */
context(ctx: BytecodePatchContext)
private fun requireField(type: String, name: String, fieldType: String) {
    val cls = ctx.classDefBy(type)
    check(cls.fields.count {
        it.name == name && it.type == fieldType && AccessFlags.PUBLIC.isSet(it.accessFlags)
    } == 1) { "Podimo car ABI changed: $type->$name:$fieldType" }
}

/** Pin one public method with an exact signature. */
context(ctx: BytecodePatchContext)
private fun requireMethod(type: String, name: String, params: List<String>, result: String) {
    val cls = ctx.classDefBy(type)
    check(cls.methods.count {
        it.name == name && it.parameterTypes.map(CharSequence::toString) == params &&
            it.returnType == result && AccessFlags.PUBLIC.isSet(it.accessFlags)
    } == 1) { "Podimo car ABI changed: $type->$name(${params.joinToString("")})$result" }

}

@Suppress("unused")
val androidAutoShowBrowse = bytecodePatch(
    name = "Android Auto show grid browse",
    description = "Rebuilds the Android Auto browse around podcast series and opens it to every car client. " +
        "The For-you episode sections become grids of series covers; opening a series lists its episodes " +
        "newest-first through the app's own paginated query, so playback, queueing and entitlement keep " +
        "running through unmodified Podimo code. The library tab disappears for guests with nothing saved " +
        "locally. Any media-browser client may connect: the app's certificate-pinned caller allowlist is " +
        "replaced with a lookup that serves the full section tree to every caller, including Android " +
        "Automotive, desktop head units and aftermarket clients.",
    default = true,
) {
    compatibleWith(podimo)
    dependsOn(originalInput)
    extendWith("extensions/podimo-car.mpe")
    execute {
        // The CarBrowse extension reaches the app exclusively through these names;
        // pin every one of them so a rebuild of Podimo fails closed here instead
        // of silently breaking browsing at runtime.
        requireField("Lis/k;", "d", "Ljava/util/List;")
        requireField("Lis/k;", "f", "Lis/l;")
        requireField("Lis/l;", "a", "Lks/w;")
        requireField("Lks/w;", "b", "Lgu0/z1;")
        requireMethod("Lgu0/z1;", "i", emptyList(), "Llr0/b0;")
        requireField("Llr0/b0;", "c", "Z")
        requireField("Ld00/c;", "a", "Lzz/f;")
        requireMethod("Lzz/f;", "f", emptyList(), "Lc00/a;")
        for (name in "abcde") requireField("Lc00/a;", name.toString(), "Ljava/util/List;")
        requireField("Lc00/b;", "a", "Lc00/e;")
        requireField("Lc00/b;", "b", "Ljava/util/List;")
        requireMethod(
            "Lc00/b;", "a",
            listOf("Lc00/b;", "Lc00/e;", "Ljava/util/List;", "I"), "Lc00/b;",
        )
        requireMethod("Lc00/e;", "g", emptyList(), "Lcom/podimo/dto/AudioPlayerItem;")
        requireMethod("Lc00/e;", "getId", emptyList(), "Ljava/lang/String;")
        requireMethod("Lc00/e;", "getTitle", emptyList(), "Ljava/lang/String;")
        requireMethod(
            "Lc00/f;", "<init>",
            listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Lc00/c;", "I",
            ),
            "V",
        )
        requireField("Lc00/c;", "b", "Lc00/c;")
        requireField("Lf7/v0;", "a", "Ljava/lang/String;")
        requireField("Lhs/c;", "a", "Ljava/util/LinkedHashMap;")
        requireField("Lhs/c;", "b", "Lhs/b;")
        check(classDefBy("Lc00/g;").methods.any { it.name == "g" }) { "Podimo playable rows lost their item" }

        // 1. For-you regroup: both mapped for-you/discover results pass through
        //    the CarBrowse filter; it reshapes only the three-section for-you
        //    list and passes everything else through unchanged.
        val mapper = exact("Lzz/a;", "invoke(Ljava/lang/Object;)Ljava/lang/Object;", 36, 549)
        check(mapper.descriptors() == listOf("Ljava/lang/Object;")) { "Podimo browse mapper contract changed" }
        check(mapper.instructions.none {
            (it as? ReferenceInstruction)?.reference?.toString() == TREE_FILTER
        }) { "Podimo browse mapper already hooked" }
        val filterCalls = mapper.instructions.withIndex()
            .filter { (_, instruction) ->
                (instruction as? ReferenceInstruction)?.reference?.toString() == FILTER_CALL
            }
            .map { it.index }
        check(filterCalls.size == 2) { "Podimo for-you filter sites changed: ${filterCalls.size}" }
        for (index in filterCalls.sortedDescending()) {
            val moved = mapper.getInstruction<OneRegisterInstruction>(index + 1)
            check(moved.opcode == Opcode.MOVE_RESULT_OBJECT) { "Podimo for-you filter result contract changed" }
            mapper.addInstructions(index + 2, """
                invoke-static {v${moved.registerA}}, $TREE_FILTER
                move-result-object v${moved.registerA}
            """.trimIndent())
        }

        // 2. Root tabs: the online tab list passes through the CarBrowse filter
        //    that drops the library tab for guests with nothing saved locally.
        val root = exact("Lis/k;", "a(ILjava/lang/String;)Lxj/f0;", 11, 128)
        check(root.instructions.none {
            (it as? ReferenceInstruction)?.reference?.toString() == ROOT_TABS
        }) { "Podimo root browse already hooked" }
        val resultIndex = root.instructions.withIndex()
            .singleOrNull { (_, instruction) ->
                (instruction as? ReferenceInstruction)?.reference?.toString() == LIBRARY_RESULT
            }?.index
            ?: error("Podimo root tab list construction changed")
        root.addInstructions(resultIndex, """
            invoke-static {p0, p1}, $ROOT_TABS
            move-result-object p1
        """.trimIndent())

        // 3. Allow all Android Auto clients: the caller gate keeps the app's own
        //    tree mapping for known callers and serves the full Android Auto
        //    section tree to everyone else, instead of trusting a certificate-
        //    pinned package allowlist.
        val gate = exact("Lhs/c;", "a(ILjava/lang/String;)Lhs/b;", 5, 18)
        check(gate.instructions.none {
            (it as? ReferenceInstruction)?.reference?.toString() == TREE_FOR
        }) { "Podimo caller gate already hooked" }
        gate.addInstructions(0, """
            invoke-static {p0, p2}, $TREE_FOR
            move-result-object v0
            check-cast v0, Lhs/b;
            return-object v0
        """.trimIndent())
    }
}

internal const val GATEWAY_HOST = "https://graphql.pdm-gateway.com/graphql"
internal const val WEBSITE_HOST = "https://graphql.podimo.com/graphql"
