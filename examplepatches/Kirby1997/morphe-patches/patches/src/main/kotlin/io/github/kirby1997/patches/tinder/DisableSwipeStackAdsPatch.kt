package io.github.kirby1997.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Tinder injects native "sponsored" cards directly into the swipe rec-stack via its
// own adsrecs pipeline — these are NOT standard AdMob/FAN banners, so a universal
// hosts-file/DNS ad-block cannot drop them without also breaking the legitimate rec
// feed (both arrive from Tinder's own domain, interleaved). They must be killed at
// the injection decision.
//
// Each injector's shouldInsertAdRec is a Kotlin suspend fun compiled to
// `<class>.d(ContinuationImpl)Ljava/lang/Object;`, returning a boxed Boolean that
// AdRecsInjectionRule check-casts + booleanValue()s to decide insertion. Returning
// Boolean.FALSE at offset 0 means "no ad this swipe"; the coroutine completes
// synchronously, so this is crash-safe (no COROUTINE_SUSPENDED contract to honour).
//
// Two injectors, both obfuscated to single-letter classes in adsrecs/internal/rule:
//   AdMainCardStackInjectorImpl    -> class d, method d  (DebugMetadata m="shouldInsertAdRec")
//   AdCuratedCardStackInjectorImpl -> class b, method d
private const val RETURN_FALSE_BOXED = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    return-object v0
"""

object MainCardStackShouldInsertAdRecFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
    definingClass = "Lcom/tinder/library/adsrecs/internal/rule/d;",
    name = "d",
)

@Suppress("unused")
val disableMainCardStackAdsPatch = bytecodePatch(
    name = "Disable main swipe-stack ads",
    description = "Stops Tinder inserting sponsored ad cards into the main swipe rec-stack (AdMainCardStackInjector.shouldInsertAdRec -> false).",
) {
    compatibleWith(Constants.TINDER)

    execute {
        MainCardStackShouldInsertAdRecFingerprint.method.addInstructions(0, RETURN_FALSE_BOXED)
    }
}

object CuratedCardStackShouldInsertAdRecFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
    definingClass = "Lcom/tinder/library/adsrecs/internal/rule/b;",
    name = "d",
)

@Suppress("unused")
val disableCuratedCardStackAdsPatch = bytecodePatch(
    name = "Disable curated swipe-stack ads",
    description = "Stops Tinder inserting sponsored ad cards into curated card stacks (AdCuratedCardStackInjector.shouldInsertAdRec -> false).",
) {
    compatibleWith(Constants.TINDER)

    execute {
        CuratedCardStackShouldInsertAdRecFingerprint.method.addInstructions(0, RETURN_FALSE_BOXED)
    }
}
