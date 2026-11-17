/*
 * Copyright 2026 HSlightsteel
 * https://github.com/HSlightsteel/slight-patches
 *
 * Ported from the Sparkle TV "Unlock Plus" patch in slight-patches (GPLv3),
 * re-resolved for 2.4.0.
 */

package dev.hyzor.patches.sparkle.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.hyzor.patches.sparkle.shared.Constants.LIB_UTILS
import dev.hyzor.patches.sparkle.shared.Constants.MAIN_ACTIVITY
import dev.hyzor.patches.sparkle.shared.Constants.SPARKLE
import dev.hyzor.patches.sparkle.shared.Constants.STARTUP_TIME

/**
 * Sparkle TV puts every Plus feature behind one static gatekeeper and one bitmask.
 *
 * ### How the licence is modelled
 *
 * `LibUtils` is a thin JNI wrapper around `libutilsJNI`. `LibUtils.h(context, purchases)` asks
 * the native library which Plus flags the Play purchases cover and returns them as a bitmask;
 * `lh/f` (the billing manager) stores it and hands it to the UI. The mask then travels as the
 * `sync_internal` intent extra / fragment argument:
 *
 * ```
 * lh/f (billing) -> MainActivity.K(int) -> fragment bundles (SetupActivity$*.g1)
 *                                       -> TaskReceiver broadcast
 * ```
 *
 * and every gate calls `kh.x.e(context, mask, required, prompt)`, which is
 * `(mask & required) == required`, falling through to a switch that only chooses the purchase
 * prompt for the matching flag. Returning `true` there opens all of them (49 call sites across
 * 37 classes in 2.4.0).
 *
 * ### What this patch does
 *
 * 1. Forces the gatekeeper to `true` — covers the UI gates and the players.
 * 2. Forces `MainActivity.K`'s mask to `0xFF` and `LibUtils.h` to `0xFF`, so the fragments and
 *    `TaskReceiver` receive "everything" even with no purchases. 2.3.1 called the distributor
 *    `H(int)`; 2.4.0 renamed it and moved the per-fragment `iput`s out of the fragments — the
 *    mask is now read back from the bundle. `MainActivity.K` feeds the bundles it builds, but
 *    the separate setup wizard has its own root. Its mask is seeded in the root's `g1` and
 *    re-asserted in its `e2` updater, because the billing callbacks also write the field (the
 *    failure one stores 0); see [forceSetupFragmentMasks].
 * 3. Forces the per-feature `LibUtils` constants. Those getters do **not** return the user's
 *    state: they return the feature's own bit, and the gatekeeper compares `required` against
 *    them to pick a prompt string. 2.4.0's own prompt resources confirm the upstream mapping:
 *    `u()` timeshift `0x8`, `a()` recordings `0x10`, `v()` VOD `0x20`, `g()` multiview `0x40`.
 *    They are still worth pinning — the native library returns 0 for them once it distrusts the
 *    build, which would make `required == 0` and change what the gates compare.
 * 4. Neutralises the native anti-tamper handshake (`LibUtils.x`), the debugger check
 *    (`LibUtils.w`) and the purchase-signature verification (`LibUtils.y`).
 * 5. Seeds `startup_time = 1000` in `MainActivity.onCreate`. The native library stamps that
 *    preference and the Java side treats `value % 10 != 0` as tampering, scheduling a deferred
 *    wipe in `TaskReceiver`, `SetupActivity$j$g` and `i0`. Nothing in the DEX writes the key, so
 *    seeding it before those readers fixes the check.
 *
 * The timeshift session and buffer classes (`th.*`) are deliberately untouched: this patch only
 * changes the licence decision, never the feature implementation. That is why timeshift keeps
 * working here, where patched builds that rewrite the session have broken it.
 *
 * Client-side only: nothing server-side changes, and the stock app must be uninstalled first
 * because Morphe re-signs the APK.
 */
@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable Plus",
    description = "Unlocks the Plus subscription features, including DVR, timeshift, multiview, " +
        "VOD (movies & series), multi-source setup and channel/category editing.",
    default = true,
) {
    compatibleWith(SPARKLE)

    // The VOD screens are only reachable once the licence is open; cap their 2000dp background
    // first so a 4K screen does not try to draw an 8000 x 8000 bitmap.
    dependsOn(limitVodBackgroundPatch)

    execute {
        // 1. The single gatekeeper every Plus surface asks.
        GatekeeperFingerprint.method.addInstructions(0, returnConstant(true))

        // 1b. Device compatibility: only matters on emulators and non-TV hardware, so a missing
        // match degrades to the stock behaviour instead of failing the patch.
        DeviceCheckFingerprint.methodOrNull?.addInstructions(0, returnConstant(true))

        // 2a. Every fragment and the sync worker receive the full mask.
        SyncMaskFingerprint.method.addInstructions(0, "const/16 p1, 0xff")

        // 2b. Seed the anti-tamper timestamp before any of the readers run.
        seedStartupTime()

        // 2c. The setup screens keep their own copy of the mask. The root gets it from the Play
        // Billing callback, which may never run (no Play) or may report an error (a re-signed
        // build Play rejects), so both the root and the six caching fragments are forced.
        forceSetupFragmentMasks()

        // 3. The native licence wrappers.
        val libUtils = LibUtilsFingerprint.classDef

        // 3a. Skip xpoe32871a(context), the native anti-tamper handshake.
        libUtils
            .libUtilsMethod("x", "V", listOf(MAIN_ACTIVITY))
            .addInstructions(0, "return-void")

        // 3b. The billing mask: all flags, whatever the purchases say.
        libUtils
            .libUtilsMethod("h", "I", listOf("Landroid/content/Context;", "Ljava/util/ArrayList;"))
            .addInstructions(0, returnConstant(0xff))

        // 3c. Debugger check: never let TaskReceiver's wipe branch arm.
        libUtils.libUtilsMethod("w", "Z").addInstructions(0, returnConstant(false))

        // 3d. Purchase signature verification: always valid.
        libUtils
            .libUtilsMethod(
                "y",
                "Z",
                listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
            )
            .addInstructions(0, returnConstant(true))

        // 3e. Per-feature flag constants.
        LIB_UTILS_FLAGS.forEach { (name, flag) ->
            libUtils.libUtilsMethod(name, "I").addInstructions(0, returnConstant(flag))
        }

        // 3f. Plan/product-name getters, so the UI reads "Plus" instead of "Free".
        LIB_UTILS_PLAN_STRINGS.forEach { (name, value) ->
            libUtils.libUtilsMethod(name, "Ljava/lang/String;").addInstructions(0, """
                const-string v0, "$value"
                return-object v0
            """.trimIndent())
        }

        // 3g. Native string getters used when building the purchase prompt.
        listOf("p", "q").forEach { name ->
            libUtils
                .libUtilsMethod(name, "Ljava/lang/String;", listOf("Landroid/content/Context;"))
                .addInstructions(0, """
                    const-string v0, ""
                    return-object v0
                """.trimIndent())
        }
    }
}

/**
 * The feature bits `LibUtils` reports, in the order the upstream patch documents them. The four
 * used by the gatekeeper's prompt switch (`u`, `a`, `v`, `g`) are re-confirmed against 2.4.0's
 * `notification_purchase_*` resources; the rest keep the upstream values, which the native
 * library also returns for those getters.
 */
private val LIB_UTILS_FLAGS = linkedMapOf(
    "f" to 0x1, // Multi-source setup
    "e" to 0x2, // EPG and channel art cache
    "c" to 0x4, // Live TV preview session
    "u" to 0x8, // Timeshift and catch-up
    "a" to 0x10, // DVR and recordings
    "v" to 0x20, // VOD (movies and series)
    "g" to 0x40, // Multiview
    "b" to 0x80, // Category and channel editing
)

/**
 * `LibUtils`'s product/plan name getters. `i`/`j` are the plan label, `k`-`o` the Play SKUs,
 * `r`/`s` the monthly/yearly subscription ids and `t` the shared-plan label.
 */
private val LIB_UTILS_PLAN_STRINGS = linkedMapOf(
    "i" to "Plus Subscription",
    "j" to "Plus",
    "k" to "sparkle_contribute_support_1",
    "l" to "sparkle_contribute_support_2",
    "m" to "sparkle_contribute_support_3",
    "n" to "sparkle_plus",
    "o" to "sparkle_plus_connected",
    "r" to "sparkle_plus_subscription_month",
    "s" to "sparkle_plus_subscription_year",
    "t" to "Shared Plus",
)

/**
 * `const/16 <v0>, <value>` followed by `return v0`. `const/16` rather than `const/4` keeps the
 * list valid for every bit in [LIB_UTILS_FLAGS], and `v0` is a local in all of the hooked methods
 * (or aliases `p0` in the zero-local ones, which is harmless because the method returns at once).
 */
private fun returnConstant(value: Int): String = "const/16 v0, 0x${value.toString(16)}\nreturn v0"

private fun returnConstant(value: Boolean): String = returnConstant(if (value) 1 else 0)

/**
 * Writes `startup_time = 1000` into the default SharedPreferences. 1000 % 10 == 0, which is what
 * the anti-tamper readers require; the value is otherwise unused.
 *
 * The injected code uses `v0`–`v3` (the `long` needs a register pair), so the method needs four
 * locals on top of `this` and the `Bundle`. `onCreate` has `.locals 7` in 2.4.0; check the frame
 * anyway so a future build fails here instead of clobbering `p0`/`p1` and crashing at runtime.
 */
private fun BytecodePatchContext.seedStartupTime() {
    val onCreate = OnCreateFingerprint.method
    val registers = onCreate.implementation?.registerCount
        ?: throw PatchException(
            "Sparkle: MainActivity.onCreate(Bundle) has no body, so startup_time cannot be " +
                "seeded. Re-derive the anti-tamper seed.",
        )
    if (registers < ON_CREATE_MIN_REGISTERS) {
        throw PatchException(
            "Sparkle: MainActivity.onCreate(Bundle) has $registers registers, but the " +
                "startup_time seed needs at least $ON_CREATE_MIN_REGISTERS (v0..v3 plus `this` " +
                "and the Bundle). Re-derive the anti-tamper seed.",
        )
    }
    onCreate.addInstructions(0, STARTUP_TIME_SEED)
}

/** Four injected locals (`v0`–`v3`) plus the two parameter registers of `onCreate`. */
private const val ON_CREATE_MIN_REGISTERS = 6

private val STARTUP_TIME_SEED = """
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
    move-result-object v0
    const-string v1, "$STARTUP_TIME"
    const-wide/16 v2, 0x3e8
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences${'$'}Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
""".trimIndent()

/**
 * Picks one `LibUtils` method by its JNI-pinned name and exact signature. The names are stable
 * (2.3.1 and 2.4.0 agree on all 25), but a rename or an overload would otherwise silently hook
 * the wrong thing, so an unexpected shape fails the patch with the signature it looked for.
 */
private fun MutableClass.libUtilsMethod(
    name: String,
    returnType: String,
    parameters: List<String> = emptyList(),
): MutableMethod {
    val matches = methods.filter { method ->
        method.name == name &&
            method.returnType == returnType &&
            method.parameterTypes.map { it.toString() } == parameters
    }
    if (matches.size != 1) {
        throw PatchException(
            "Sparkle: expected exactly one $LIB_UTILS->$name" +
                "(${parameters.joinToString("")})$returnType but found ${matches.size}. " +
                "The LibUtils surface moved; re-derive it against this build.",
        )
    }
    return matches.single()
}

private const val SETUP_FRAGMENT_PREFIX = "Lse/hedekonsult/tvlibrary/core/ui/SetupActivity\$"

private const val BUNDLE = "Landroid/os/Bundle;"

/** The six setup fragments that cache the `sync_internal` mask in an `int` field. */
private const val SETUP_MASK_STORE_COUNT = 6

private class MaskStore(val classType: String, val index: Int, val register: Int)

/**
 * Pins the setup wizard's root mask to `0xFF`.
 *
 * The wizard's fragments cache the `sync_internal` mask in an `int` field, read from their
 * arguments in `g1(Bundle)`. The arguments are built from the parent fragment's copy, and the
 * root (`SetupActivity$j`) gets its copy from the Play Billing callback. On a device where Play
 * is missing — or present but rejecting the re-signed build, so billing reports an error — the
 * tree can stay at 0 and the setup screens stay locked even though the gatekeeper returns true.
 *
 * Three things keep it open:
 * 1. The root's `g1` seeds the field before the billing helper is created.
 * 2. Its `e2` updater re-asserts `0xFF` on entry. That matters because `SetupActivity$j$c.z0(I)`
 *    (the billing failure callback) stores `0` and then calls `e2`; a seed alone is not durable,
 *    and `e2` is the method that renders the setup rows.
 * 3. Every fragment that stores the extra into an `int` field gets the store clamped to `0xFF`.
 *    The fragments that merely read the extra and discard it are left alone (their first field
 *    store after the read is an object field, which is how they are told apart).
 */
private fun BytecodePatchContext.forceSetupFragmentMasks() {
    val stores = mutableListOf<MaskStore>()
    val overviews = mutableListOf<Pair<String, List<String>>>()

    classDefForEach { classDef ->
        if (!classDef.type.startsWith(SETUP_FRAGMENT_PREFIX)) return@classDefForEach

        // The overview fragment owns a static `e2(itself)` updater and is the only fragment that
        // does; it is the root that builds the child bundles.
        if (
            classDef.methods.any { method ->
                method.name == "e2" &&
                    method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() } == listOf(classDef.type)
            }
        ) {
            overviews += classDef.type to classDef.fields.filter { it.type == "I" }.map { it.name }
        }

        classDef.methods.forEach { method ->
            if (
                method.name != "g1" ||
                method.returnType != "V" ||
                method.parameterTypes.map { it.toString() } != listOf(BUNDLE)
            ) {
                return@forEach
            }

            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val readIndex = instructions.indexOfFirst { instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string
                text == "sync_internal"
            }
            if (readIndex < 0) return@forEach

            for (index in (readIndex + 1) until instructions.size) {
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.IPUT) continue
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.type == "I") {
                    stores += MaskStore(
                        classType = classDef.type,
                        index = index,
                        register = (instruction as TwoRegisterInstruction).registerA,
                    )
                }
                break
            }
        }
    }

    val overview = overviews.singleOrNull()
        ?: throw PatchException(
            "Sparkle: expected exactly one setup overview fragment (a class with a static " +
                "e2(itself) updater), found ${overviews.size}" +
                (if (overviews.isEmpty()) "" else " (${overviews.joinToString { it.first }})") +
                ". The setup wizard was restructured; re-derive the mask seeding.",
        )
    val overviewClass = overview.first
    val overviewMaskField = overview.second.singleOrNull()
        ?: throw PatchException(
            "Sparkle: $overviewClass has ${overview.second.size} int field(s)" +
                (if (overview.second.isEmpty()) "" else " (${overview.second.joinToString()})") +
                "; expected exactly one to hold the sync mask. The setup wizard was " +
                "restructured; re-derive the mask seeding.",
        )

    val overviewReader = mutableClassDefBy(overviewClass).methods.setupMaskReader()
    overviewReader.requireInjectedLocal("$overviewClass.g1")
    overviewReader.addInstructions(0, forceOverviewMask(overviewClass, overviewMaskField))

    val overviewUpdater = mutableClassDefBy(overviewClass)
        .methods
        .singleOrNull { method ->
            method.name == "e2" &&
                method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == listOf(overviewClass)
        }
        ?: throw PatchException(
            "Sparkle: $overviewClass has no e2(itself) updater to re-assert the sync mask. " +
                "The setup wizard was restructured; re-derive the mask seeding.",
        )
    overviewUpdater.requireInjectedLocal("$overviewClass.e2")
    overviewUpdater.addInstructions(0, forceOverviewMask(overviewClass, overviewMaskField))

    if (stores.size != SETUP_MASK_STORE_COUNT) {
        throw PatchException(
            "Sparkle: expected $SETUP_MASK_STORE_COUNT setup fragments caching the sync mask, " +
                "found ${stores.size} (${stores.joinToString { it.classType }}). Re-derive the " +
                "setup-screen mask forcing.",
        )
    }

    stores.forEach { store ->
        mutableClassDefBy(store.classType)
            .methods
            .setupMaskReader()
            .addInstructions(store.index, "const/16 v${store.register}, 0xff")
    }
}

/**
 * Moves the overview into a low register, then writes `0xFF` into its mask field. `iput` uses
 * 4-bit register operands, and `e2` has 46 locals, so its `p0` is `v46` and cannot be addressed
 * directly; `move-object/from16` can. `v0`/`v1` exist in both hooked methods (`g1` has `.locals
 * 2`, `e2` has `.locals 46`), and both are dead at method entry.
 */
private fun forceOverviewMask(classType: String, field: String): String = """
    move-object/from16 v0, p0
    const/16 v1, 0xff
    iput v1, v0, $classType->$field:I
""".trimIndent()

/**
 * Fails when the hook's method has no locals for the injected `v0`/`v1`. Both hooked methods
 * take one argument; the instance `g1` has two parameter registers (`this` + `Bundle`), the
 * static `e2` one.
 */
private fun MutableMethod.requireInjectedLocal(description: String) {
    val registers = implementation?.registerCount
        ?: throw PatchException(
            "Sparkle: $description has no body. Re-derive the mask seeding.",
        )
    val parameterRegisters =
        parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (registers - parameterRegisters < 2) {
        throw PatchException(
            "Sparkle: $description has $registers registers and fewer than two locals for the " +
                "injected mask write. Re-derive the mask seeding.",
        )
    }
}

private fun Iterable<MutableMethod>.setupMaskReader(): MutableMethod =
    singleOrNull {
        it.name == "g1" &&
            it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf(BUNDLE)
    } ?: throw PatchException(
        "Sparkle: expected exactly one g1(Bundle) setup hook in this class. Re-derive the " +
            "setup-screen mask forcing.",
    )
