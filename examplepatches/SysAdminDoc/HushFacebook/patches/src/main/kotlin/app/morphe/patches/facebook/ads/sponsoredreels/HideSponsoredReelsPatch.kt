/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/hidesponsoredreels/HideSponsoredReelsPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.returnEarly
import app.morphe.util.singleOrPatchException
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.util.MethodUtil
import app.morphe.patches.facebook.misc.settings.settingsPatch

private const val LISTENABLE_FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"
private const val SETTABLE_FUTURE = "Lcom/google/common/util/concurrent/SettableFuture;"

private const val PATCH = SPONSORED_REELS_PATCH

@Suppress("unused")
val hideSponsoredReelsPatch = bytecodePatch(
    name = "Hide sponsored reels",
    description = "Removes ads from Reels and Watch, including product banners over a reel and " +
        "ads inside a video.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())
    dependsOn(facebookExtensionPatch)

    execute {
        // The server inlines the ads into each fetched page, so the page arriving at the
        // collection is where they come out: see ReelPages.kt for how the three methods and the
        // ad item base are found. Replace the incoming page with one that has no ads in it, at
        // both levels a page enters.
        val pages = reelPages(PATCH)
        // An ad can also come as an ordinary item around a story with sponsored data, so the
        // filters ask each item for its story too: see ReelItemStory.kt.
        val items = reelItemStory(pages.adBase)
        val adBase = pages.adBase.toBinaryName()
        fillReelItemStubs(items)
        listOf(pages.insertPage, pages.announcePage).forEach { it.filterPageFirst(adBase) }
        pages.addPage.filterSectionsFirst(adBase)

        // The client-side insert paths stay blocked. None of them fired in the logging run, but
        // they are what the app would use if a future release went back to inserting on the device,
        // and blocking them costs nothing.
        //
        // Only the inserts are blocked, not the requests that feed them. Stopping those would save
        // data, but belongs with the prefetch patch, and they have not been checked for organic
        // side effects.
        listOf(
            VideoHomeInsertAdsFingerprint,
            RealtimeIntentAdInsertFingerprint,
            SfdAdInsertFingerprint,
            PoeAdRenderFingerprint,
        ).forEach { it.method.returnEarly() }

        // Banners over a reel and mid-rolls are fetched while the reel plays, not in the page, so
        // the filters cannot see them. Their fetches return a failed future instead. Each caller
        // handles it as a network error: it stores no ad, and no query goes out.
        val adBreakFetch = AdBreakFetchFingerprint.method.instructions()

        // The banner helper. All banner requests go through it.
        val bannerFetch = adBreakFetch.futureCallBefore(BANNER_FETCH_LOG)
        mutableClassDefBy(bannerFetch.definingClass).methods
            .filter { MethodUtil.methodSignaturesMatch(it, bannerFetch) }
            .singleOrPatchException("$PATCH: the banner query helper $bannerFetch, declared on its own class")
            .let(::returnFailedFuture)

        // The ad-break server API. Each of its methods that returns a future is an ad query.
        val videoFetcher = adBreakFetch.futureCallBefore(VIDEO_FETCH_LOG).definingClass
        mutableClassDefBy(videoFetcher).methods
            .filter { it.returnType == LISTENABLE_FUTURE }
            .also { check(it.isNotEmpty()) { "$videoFetcher has no method that returns a future" } }
            .forEach(::returnFailedFuture)

        // The idle state runs its own video ad query on the GraphQL executor, which the whole app
        // shares. Thus only this one executor call changes. The helper call has the same size and
        // no arguments, so the next move-result gets the failed future.
        val idleVideoFetch = ReelsVideoAdQueryFingerprint.method
        val executeIndex = idleExecutorCallIndex(
            idleVideoFetch.instructions(),
            "${idleVideoFetch.definingClass}->${idleVideoFetch.name}",
        )
        idleVideoFetch.replaceInstruction(
            executeIndex,
            "invoke-static { }, ${failedFutureOn(idleVideoFetch.definingClass)}",
        )

        // The ad-break lookup retries a failed fetch each second while the reel plays. Its tick
        // returns -1, the value for a reel with no media, which stops the poller. The lookup then
        // never starts.
        stopDeferredCardPoller()

        enableStatus("sponsoredReels")
    }
}

/**
 * Makes the tick of the deferred-card ad-break state answer -1 ("no media"), so its poller stops.
 *
 * <p>577 names each state in the state's own class, so the class holding the literal is the state
 * and declares the tick. 580 names every state from one method on the abstract base, by
 * `instance-of`, and the tick moved up into a parent the deferred-card state shares with two
 * other states. There the state is the type tested just before the literal, and the tick answers
 * -1 only for an instance of it, so the other states keep their own behaviour.
 */
private fun BytecodePatchContext.stopDeferredCardPoller() {
    val nameMethod = UnresolvedAdStateFingerprint.method
    val instructions = nameMethod.instructions()
    val literal = instructions.indexOfFirst { it.string == DEFERRED_CARD_STATE }
    check(literal >= 0) { "\"$DEFERRED_CARD_STATE\" is not in ${nameMethod.definingClass}->${nameMethod.name}" }

    // The type tested just before the literal, when the name comes from an instance-of chain.
    val tested = (maxOf(0, literal - 3) until literal).reversed()
        .firstNotNullOfOrNull { index ->
            instructions[index].takeIf { it.opcode == Opcode.INSTANCE_OF }
                ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
        }
    val state = tested ?: nameMethod.definingClass

    // The tick the state runs: its own, or the nearest one it inherits.
    val tick = superclassChain(state)
        .mapNotNull { mutableClassDefByOrNull(it) }
        .firstNotNullOfOrNull { classDef -> adBreakTickAmong(classDef.methods, classDef.type) }
        ?: throw PatchException("$PATCH: no class of $state's hierarchy declares an ad-break tick")

    if (tick.definingClass == state) {
        tick.returnEarly(-1L)
        return
    }

    // Shared with sibling states: answer -1 only for the deferred-card one. Index 0, where no
    // local holds anything yet; this is copied down because instance-of takes 4-bit registers.
    tick.requireLocals("Hide sponsored reels", 2)
    tick.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            instance-of v0, v0, $state
            if-eqz v0, :other_state
            const-wide/16 v0, -0x1
            return-wide v0
        """,
        ExternalLabel("other_state", tick.getInstruction(0)),
    )
}

/**
 * The ad-break tick among [methods], all declared by [owner]: null when none of them is one, and a
 * refusal when several are. Taking none of several would carry the walk up to a parent's tick,
 * which the state never runs, and the poller would keep retrying with nothing to say so.
 */
internal fun <T : Method> adBreakTickAmong(methods: Iterable<T>, owner: String): T? {
    val ticks = methods.filter(::isAdBreakTick)
    if (ticks.isEmpty()) return null
    return ticks.singleOrPatchException("$PATCH: the ad-break tick, (state, int)J with a body, that $owner declares")
}

private fun isAdBreakTick(method: Method) = method.returnType == "J" && method.parameterTypes.size == 2 &&
    method.parameterTypes[1].toString() == "I" && method.implementation != null

/** The state whose poller the lookup keeps retrying. */
private const val DEFERRED_CARD_STATE = "UnresolvedWithDeferredCardState"

private const val FAILED_FUTURE = "failedAdFetch"

/** Adds, once per class, a static method that returns a failed future. */
private fun BytecodePatchContext.failedFutureOn(classType: String): String {
    val reference = "$classType->$FAILED_FUTURE()$SETTABLE_FUTURE"
    val classDef = mutableClassDefBy(classType)
    if (classDef.methods.any { it.name == FAILED_FUTURE }) return reference

    ImmutableMethod(
        classType,
        FAILED_FUTURE,
        emptyList(),
        SETTABLE_FUTURE,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(2),
    ).toMutable().apply {
        addInstructions(
            0,
            """
                new-instance v0, Ljava/io/IOException;
                const-string v1, "Reels ad fetch blocked"
                invoke-direct { v0, v1 }, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                invoke-static { }, $SETTABLE_FUTURE->create()$SETTABLE_FUTURE
                move-result-object v1
                invoke-virtual { v1, v0 }, $SETTABLE_FUTURE->setException(Ljava/lang/Throwable;)Z
                return-object v1
            """,
        )
        classDef.methods.add(this)
    }

    return reference
}

/** Makes [method] return the failed future. It can write v0, because it returns at once. */
private fun BytecodePatchContext.returnFailedFuture(method: MutableMethod) =
    method.addInstructions(
        0,
        """
            invoke-static { }, ${failedFutureOn(method.definingClass)}
            move-result-object v0
            return-object v0
        """,
    )

/** The last call before [log] that returns a future. This is the fetch that the log reports. */
internal fun List<Instruction>.futureCallBefore(log: String): MethodReference {
    val logIndex = indexOfFirst { it.string == log }
    check(logIndex >= 0) { "\"$log\" is not in the ad-break fetch" }

    return take(logIndex)
        .mapNotNull { it.methodReference }
        .lastOrNull { it.returnType == LISTENABLE_FUTURE }
        ?: throw PatchException("$PATCH: the ad-break fetch makes no call returning ListenableFuture before \"$log\"")
}

/**
 * The executor call of the idle state's own video ad query: the first call after the query's name
 * that hands back a SettableFuture. It has to be static with its answer moved straight after,
 * because the replacement is a static call of the same size.
 *
 * The name has to be the whole literal. The fingerprint found the method by a literal that only
 * holds it, since the patcher matches `strings` by containment, so a renamed query such as
 * "FBFetchReelsVideoAdsQueryV2" finds the method and leaves no literal to start from.
 */
internal fun idleExecutorCallIndex(instructions: List<Instruction>, method: String): Int {
    val query = instructions.indexOfFirst { it.string == REELS_VIDEO_AD_QUERY }
    if (query < 0) {
        throw PatchException(
            "$PATCH: $method holds no \"$REELS_VIDEO_AD_QUERY\" literal, only a longer string the fingerprint " +
                "matched by containment, so it may not build the query this patch replaces",
        )
    }
    val execute = (query until instructions.size).firstOrNull { index ->
        instructions[index].methodReference?.returnType == SETTABLE_FUTURE
    } ?: throw PatchException(
        "$PATCH: $method makes no call returning SettableFuture after \"$REELS_VIDEO_AD_QUERY\"",
    )
    if (instructions[execute].opcode != Opcode.INVOKE_STATIC) {
        throw PatchException("$PATCH: the executor call at $execute in $method is not invoke-static")
    }
    if (instructions.getOrNull(execute + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("$PATCH: the executor call at $execute in $method has no move-result-object after it")
    }
    return execute
}

private val Instruction.methodReference
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference

private val Instruction.string
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun MutableMethod.instructions(): List<Instruction> =
    implementation?.instructions?.toList()
        ?: throw IllegalStateException("$definingClass->$name has no body")
