package app.revanced.patches.rif.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** rif is fun (free, ad-supported). */
internal const val RIF_PACKAGE = "com.andrewshu.android.reddit"

/** rif is fun golden platinum (paid, ad-free). A separate R8 build of the same 5.6.22 code. */
internal const val RIF_PLATINUM_PACKAGE = "com.andrewshu.android.redditdonation"

/** Every rif build the shared patches support. Ads-only patches target [RIF_PACKAGE] alone. */
internal val RIF_PACKAGES = arrayOf(RIF_PACKAGE, RIF_PLATINUM_PACKAGE)

/**
 * The rif version the patches are built for: 5.6.22, its final release. The patches match
 * its R8-obfuscated names, so they won't apply to other versions; declaring it lets
 * managers recommend it and warn about others.
 */
internal const val RIF_VERSION = "5.6.22"

/** [RIF_PACKAGE] at [RIF_VERSION], for compatibleWith() (Morphe Compatibility). */
internal val RIF_FREE_COMPATIBILITY = Compatibility(
    name = "rif is fun",
    packageName = RIF_PACKAGE,
    targets = listOf(AppTarget(RIF_VERSION)),
)

/** [RIF_PACKAGES] at [RIF_VERSION], for compatibleWith(*...). */
internal val RIF_COMPATIBILITY: Array<Compatibility> = arrayOf(
    RIF_FREE_COMPATIBILITY,
    Compatibility(
        name = "rif is fun golden platinum",
        packageName = RIF_PLATINUM_PACKAGE,
        targets = listOf(AppTarget(RIF_VERSION)),
    ),
)

/**
 * Obfuscated names that differ between the free and Platinum builds of rif 5.6.22.
 * rif's own class names survive R8 in both, but members and the obfuscated helper
 * packages are renamed independently, so every symbol that differs is listed here.
 * Fingerprints match a symbol set as a unit, so one bundle patches either app.
 * Verified that no build contains the other build's names at these locations.
 */
internal class RifSymbols(
    /** i0.b render callback on CommentThing/ThreadThing: `(SpannableStringBuilder)V`. */
    val renderCallback: String,
    /** Comment ViewHolder whose `h(m, CommentThing, Fragment)` binds the body TextView. */
    val commentBindClass: String,
    /** Thread-list binder whose selftext-preview method calls [selftextGetter] then setText. */
    val selftextBindClass: String,
    /** ThreadThing getter for the rendered selftext: `()CharSequence`. */
    val selftextGetter: String,
    /**
     * Comments-page binder whose `o(holder, ThreadThing)` sets the post's selftext (the
     * body above the comments) via [selftextGetter].
     */
    val opSelftextBindClass: String,
    /** The body render task (named BodyRenderTask): its `I(action)` renders one body. */
    val bodyRenderClass: String,
    /** The comments-page adapter (a Thing-list loader): its private `k0(Thing)Z` drops blocked users' comments. */
    val commentsAdapterClass: String,
    /**
     * The body render callback interface (`<bodyRenderClass>$b`, BodyRenderTask.Callback)'s
     * `String` getter for the body's HTML (`j()`/`k()`) ...
     */
    val bodyHtmlGetter: String,
    /** ... and its `boolean` "the HTML is itself HTML-escaped" getter (`l()`/`m()`). */
    val bodyEscapedGetter: String,
)

internal val RIF_BUILDS = listOf(
    RifSymbols( // free
        renderCallback = "e", commentBindClass = "Ln2/o;", selftextBindClass = "Le5/g;",
        selftextGetter = "C0", opSelftextBindClass = "Le5/u;", bodyRenderClass = "Ln2/i0;",
        commentsAdapterClass = "Ln2/r;", bodyHtmlGetter = "j", bodyEscapedGetter = "l",
    ),
    RifSymbols( // Platinum
        renderCallback = "d", commentBindClass = "Lo2/o;", selftextBindClass = "Lf5/g;",
        selftextGetter = "F0", opSelftextBindClass = "Lf5/u;", bodyRenderClass = "Lo2/i0;",
        commentsAdapterClass = "Lo2/r;", bodyHtmlGetter = "k", bodyEscapedGetter = "m",
    ),
)

/**
 * Throws unless `v0` can safely be used as scratch at [method]'s entry, which is what our
 * injected guards (`move-result v0`) do. That's the case if `v0` is a local (locals come
 * first in the register frame), or if it's a parameter the original code never touches.
 * Otherwise clobbering it corrupts `this`/an argument — a VerifyError at runtime (this is
 * what broke the 1.1.0-rc3 test build). Must be called BEFORE injecting. This turns that into a loud
 * patch-time error instead.
 *
 * Example of the second case: free rif's BannerAdViewHelper.loadAd(View, boolean) has
 * no locals (v0 = this), but its body only uses v1/v2, so the guard is safe there.
 */
internal fun requireScratchRegister(method: Method) {
    val implementation = method.implementation
        ?: throw PatchException("${method.definingClass}->${method.name} has no implementation")
    val parameterRegisters = method.parameterTypes.sumOf { type ->
        val t = type.toString()
        if (t == "J" || t == "D") 2 else 1
    } + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    if (implementation.registerCount - parameterRegisters >= 1) return // v0 is a local

    if (implementation.instructions.none { 0 in it.registers() }) return // unused parameter

    throw PatchException(
        "${method.definingClass}->${method.name}: v0 is a parameter the method uses; " +
            "an injected v0 scratch would clobber it",
    )
}

/** All registers an instruction reads or writes (wide values: their low register). */
private fun Instruction.registers(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}
