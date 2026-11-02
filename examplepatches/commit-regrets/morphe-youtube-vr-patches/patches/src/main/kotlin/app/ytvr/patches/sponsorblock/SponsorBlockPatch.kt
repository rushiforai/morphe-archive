package app.ytvr.patches.sponsorblock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR
import app.ytvr.patches.shared.applicationOnCreateFingerprint
import app.ytvr.patches.shared.callsMethodOn
import app.ytvr.patches.shared.holdsStringLiteral
import app.ytvr.patches.shared.skipAdCountdownFingerprints
import app.ytvr.patches.shared.videoStreamingDataCtorFingerprint
import app.ytvr.patches.storedChoice
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/**
 * The loadVideo log literal, unique to the player wrapper's `j` (measured: 1
 * method). String anchors compare the whole dex string (this repo's
 * `holdsStringLiteral` is exact equality), so this is the literal in full.
 */
private const val LOAD_VIDEO_LITERAL =
    "MedialibPlayer.loadVideo(cpn=%s playWhenReady=%b positionMs=%s playerEvents=[%d] " +
        "videoId=%s volume=%s pauseOnLastFrame=%b)"

/** The seekTo log literal, unique to the same wrapper's seek (measured: 1 method). */
private const val SEEK_LITERAL = "MedialibPlayer.seekTo(positionMillis=%d)"

/** The onSeeked log literal, unique to the events delegator's `u` (measured: 1 method). */
private const val SEEKED_LITERAL = "onSeeked(positionMillis=%d)"

/**
 * The playback-state literals of the events delegator, each measured to exactly one
 * method (`o`, `k`, `w`). The extension's tick polls the playhead only while
 * playing — polling during prepare coincided with a prepare→retry loop on device
 * (the app's own poller also starts only on a playback-state transition).
 */
private const val ON_PLAYING_LITERAL = "onPlaying()"
private const val ON_PAUSED_LITERAL = "onPaused()"
private const val ON_STOPPED_LITERAL = "onStopped()"

/** The seek-source enum constant a programmatic skip should carry (measured: 1 class). */
private const val SEEK_SOURCE_UNKNOWN_LITERAL = "SEEK_SOURCE_UNKNOWN"

/**
 * Seek-bar resource ids of the VR player controls (`R.id.*`). They are the
 * anchor for [seekbarControllerFingerprint] — its constructor binds all five, and no
 * other method in the app references them (measured with the scratch harness's
 * `findint`, which takes the hex digits) — and the two the overlay needs at runtime
 * are baked into the app at start, so the extension never guesses them. One set
 * per supported version; baking the wrong set would paint markers on the wrong view.
 */
private class SeekbarIds(
    val seekbar: Int,
    val seekbarBg: Int,
    val seekbarBuffered: Int,
    val seekbarContainer: Int,
    val seekbarPosition: Int,
    val seekbarThumb: Int,
) {
    val allFive: IntArray = intArrayOf(seekbar, seekbarBuffered, seekbarContainer, seekbarPosition, seekbarThumb)
}

@Suppress("MagicNumber")
private val SEEKBAR_SETS = listOf(
    // 1.90.05
    SeekbarIds(0x7f0b0a3b, 0x7f0b0a3c, 0x7f0b0a3d, 0x7f0b0a3e, 0x7f0b0a41, 0x7f0b0a42),
    // 1.89.09
    SeekbarIds(0x7f0b0a39, 0x7f0b0a3a, 0x7f0b0a3b, 0x7f0b0a3c, 0x7f0b0a3f, 0x7f0b0a40),
)

/**
 * The panel-name literal of the app's own skip-Ad button: the value of the `gnd` enum constant the
 * app sets on that card (`gnd.SKIP_BUTTON("skip-ad-button")`). Measured over the stock dex: the
 * literal occurs exactly once, and the static field it is stored into is read from exactly one
 * method — the skip-Ad-button constructor, which is also where the activity is available. Both
 * facts are what this patch mines for the Skip button.
 */
private const val SKIP_BUTTON_SLOT_LITERAL = "skip-ad-button"

/**
 * The `R.layout.*` id space of 1.88.10 (the `R.xml` window is 0x7f1800xx, `R.id` is 0x7f0b, dimens
 * are 0x7f07): the skip button's layout id is the only value from this window in the constructor
 * that mines it, which is what makes "the int before the inflate call" an unambiguous anchor.
 */
private const val LAYOUT_RESOURCE_ID_FIRST = 0x7f0e0000
private const val LAYOUT_RESOURCE_ID_LAST = 0x7f0effff
private val LAYOUT_RESOURCE_ID_WINDOW = LAYOUT_RESOURCE_ID_FIRST..LAYOUT_RESOURCE_ID_LAST

/** Every invoke opcode, for the scans that look for a *call* rather than for a name. */
private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_SUPER,
    Opcode.INVOKE_DIRECT,
    Opcode.INVOKE_STATIC,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_SUPER_RANGE,
    Opcode.INVOKE_DIRECT_RANGE,
    Opcode.INVOKE_STATIC_RANGE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

/** The smali spelling of an invoke opcode, for the bodies assembled below. */
private fun Opcode.smaliName(): String = name.lowercase().replace("_range", "/range").replace('_', '-')

/**
 * The app's skip-Ad-button panel slot: `gnd`'s static initializer is the only holder of the
 * `skip-ad-button` literal (measured: 1 class).
 */
private val skipSlotFingerprint = Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf(SKIP_BUTTON_SLOT_LITERAL),
)

/**
 * The static field [instruction] stores a value of [type] into, or null. The slot enum's own
 * definition -- `sput-object` of the field whose type is the enum itself -- is the one this patch
 * mines; testing it away from the scan keeps that condition readable.
 */
private fun Instruction.storesFieldOfType(type: String): FieldReference? {
    if (opcode != Opcode.SPUT_OBJECT) {
        return null
    }
    val reference = (this as? ReferenceInstruction)?.reference
    return if (reference is FieldReference && reference.definingClass == type) reference else null
}

/** True when [this] references every seek-bar resource id (they are inlined ints). */
private fun Method.matchedSeekbarIds(): SeekbarIds? = matchingSeekbarSets().firstOrNull()

/**
 * Every supported seek-bar id set whose five code-referenced ids this method contains
 * (seekbar, buffered, container, position, thumb). Those five overlap by one id: 1.90.05's
 * seekbar is `0x7f0b0a3b`, which is 1.89.09's seekbar_buffered. `0x7f0b0a3c` is seekbar_bg on
 * 1.90.05 and seekbar_container on 1.89.09, so only the 1.89.09 set matches on it. A future
 * denser overlap could make both sets match one method; the bake site throws in that case
 * instead of baking the first set's ids into the wrong build.
 */
private fun Method.matchingSeekbarSets(): List<SeekbarIds> {
    val implementation = implementation ?: return emptyList()
    val seen = HashSet<Int>()
    for (instruction in implementation.instructions) {
        if (instruction is NarrowLiteralInstruction) {
            seen.add(instruction.narrowLiteral)
        }
    }
    return SEEKBAR_SETS.filter { set -> set.allFive.all { seen.contains(it) } }
}

/** True when [this] references every seek-bar resource id in any supported set (they are inlined ints). */
private fun Method.referencesSeekbarIds(): Boolean = matchedSeekbarIds() != null

/**
 * The class whose constructor binds the seek-bar views. Structural, not name-bound:
 * the anchor is the set of inlined resource ids plus the constructor's shape
 * (a `View` first parameter), which R8 cannot rename.
 */
private fun ClassDef.isSeekbarController(): Boolean = methods.any { method ->
    method.name == "<init>" &&
        method.parameterTypes.size == 8 &&
        method.parameterTypes.firstOrNull()?.toString() == "Landroid/view/View;" &&
        method.referencesSeekbarIds()
}

/** The player-controls binder's constructor (`gtw.<init>`), where the overlay attaches. */
private val seekbarControllerFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.name == "<init>" &&
            classDef?.isSeekbarController() == true &&
            method.referencesSeekbarIds()
    },
)

/**
 * The timeline update of that same class: `(positionMs, windowStartMs, durationMs,
 * bufferedMs) -> void`. Matched as the class's `(J J J J)V` method that actually
 * lays the bar out (the class also has a synthetic `(J J J J)V` bridge that merely
 * forwards, so the `setLayoutParams` call is what separates them).
 */
private val seekbarTimelineFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef?.isSeekbarController() == true &&
            method.returnType.toString() == "V" &&
            method.parameterTypes.map { it.toString() } == listOf("J", "J", "J", "J") &&
            method.implementation?.instructions?.any { instruction ->
                instruction is ReferenceInstruction &&
                    instruction.reference.toString().contains("->setLayoutParams(")
            } == true
    },
)

/**
 * `R.id.settings_fragment_holder`: the FrameLayout inside the settings card that the app's
 * settings *content* is added to. The "Patch settings" row is put at the top of that column so
 * it reads as one of the app's own rows instead of floating at the card's top-right corner.
 * Hand-kept for the same reason as `seekbar_bg` — the layout references it, no code does —
 * and the row falls back to the corner when it resolves to nothing.
 */
private const val ID_SETTINGS_HOLDER = 0x7f0b0a51

/**
 * `R.xml.settings_prefs` and `R.xml.panel2_settings_prefs`: the preference XMLs the app's settings
 * screens are built from. The method that loads one of them is where the screen exists and can be
 * added to, and it is found by these ids rather than by a class or method name.
 */
private val SETTINGS_PREFS_IDS = intArrayOf(0x7f180013, 0x7f180011)

/** True when [this] references the inlined resource id [id]. */
private fun Method.referencesResourceId(id: Int): Boolean {
    val implementation = implementation ?: return false
    for (instruction in implementation.instructions) {
        if (instruction is NarrowLiteralInstruction && instruction.narrowLiteral == id) {
            return true
        }
    }
    return false
}

// ---------------------------------------------------------------------------
// The "Patch settings" hub. The app navigates its own settings sub-screens by
// comparing the clicked row's key against known keys and swapping a whole
// fragment in; one of those keys is `developer_settings`, whose screen inflates
// `developer_settings_prefs.xml` -- but the app removes that screen's list row
// at startup, so the whole surface is dead UI. The hub reuses it, Morphe-style:
//
//   Settings -> "Patch settings" (row) -> hub screen with one entry per feature
//              ("SponsorBlock" today) -> that feature's settings screen.
//
// One fragment class serves both levels: it re-opens *itself* with a fragment
// argument (`ytvr_screen=sb`) that switches which XML it inflates and what
// title it sets. The app's swap (`fzf.aH`) normally skips a swap to the class
// already showing, so a generated static bridge replaces its `getClass()` call
// and forces the recreation only when the arguments carry our key. No class is
// created (the added click handler and bridge are methods on the app's own
// classes), no resource id is minted (the second XML is the dead
// `PreferenceFragment`'s, mined and resolved through `res/values/public.xml`),
// and the back stack and transitions are the app's own.
//
// 1.88.10 has *two* full settings stacks (the live `fzf`/`fzb`/`fyp` one and a
// parallel `fqg`/`fqa`/`fnj` one that shares the same XMLs); both click
// handlers match the same shape, so every matching site is re-keyed, but only
// the live stack's fragment gets the two-level treatment -- the other stack
// just gets its title relabelled and its own wiring skipped.
// ---------------------------------------------------------------------------

/** The key literal the app's settings click handlers compare against. */
private const val DEV_ROW_KEY = "developer_settings"

/** The key of our main-list row; the click handlers are re-keyed to it. */
private const val MOD_SETTINGS_KEY = "ytvr_mod_settings"

/** The app's own sub-screen title literal, still carried by both stacks. */
private const val DEV_TITLE_LITERAL = "Developer Settings"

/** The fragment argument and its value that turn the hub fragment into the SponsorBlock screen. */
private const val SCREEN_ARG = "ytvr_screen"
private const val SCREEN_ARG_SB = "sb"

/** The hub entry row that opens the SponsorBlock screen. */
private const val SB_ROW_KEY = "ytvr_mod_sb_screen"

/** Titles: the hub and the SponsorBlock screen (the app's own title literal is only an anchor). */
private const val HUB_TITLE = "Patch settings"
private const val SB_TITLE = "SponsorBlock"

/** The activity classes whose back handling can be on screen with the hub open. Both are
 *  package-named in the app (R8 keeps them -- the manifest references their family), and both
 *  keep a scratch register free before their first write, which the guard needs. The manifest's
 *  Internal activity is an alias of the first. */
private val BACK_ACTIVITY_TYPES = listOf(
    "Lcom/google/android/apps/youtube/vr/activities/YouTubeVrActivity;",
    "Lcom/google/android/apps/youtube/vr/activities/YouTubeVrPanel2Activity;",
)

/**
 * The `xml` resource-type block of the app's id space (1.88.10: `R.xml` ids live in 0x7f1800xx,
 * while strings are 0x7f10xxxx and layout ids are elsewhere). Inflation methods are pinned by
 * holding exactly one of these, without any name.
 */
private val XML_RESOURCE_ID_WINDOW = 0x7f180000..0x7f1800ff

/**
 * `androidx.preference.Preference`. Library class names survive R8 because XML inflation looks
 * them up by name, so this is a safe anchor where the class's *members* -- which R8 does
 * rename (`setTitle` is `L` in 1.88.10) -- are not.
 */
private const val PREFERENCE_TYPE = "Landroidx/preference/Preference;"

/**
 * A literal only [PREFERENCE_TYPE]'s summary setter throws. Used to find that class without a
 * fingerprint (and, through `mutableClassDefBy`, to make it editable), and it is also the reason
 * the two `(CharSequence)V` setters do not have to be told apart: both get hooked.
 */
private const val SUMMARY_PROVIDER_LITERAL = "Preference already has a SummaryProvider set."

/**
 * `android.widget.TextView`, a platform class: its `setText(CharSequence)` is what the row binder
 * calls to put the title on screen, which is how the binder is identified without naming it.
 */
private const val TEXT_VIEW_TYPE = "Landroid/widget/TextView;"

/** True when [this] holds the string literal [literal] as a constant. */
private fun Method.holdsConstant(literal: String): Boolean = implementation?.instructions?.any { instruction ->
    (instruction as? ReferenceInstruction)?.reference.let { reference ->
        reference is StringReference && reference.string == literal
    }
} == true

/** True when [this] class definition references the type [type] anywhere. */
private fun ClassDef.referencesType(type: String): Boolean = fields.any { it.type == type || it.definingClass == type } ||
    methods.any { method ->
        method.implementation?.instructions?.any { instruction ->
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                when (reference) {
                    is TypeReference -> reference.type == type
                    is MethodReference -> reference.definingClass == type
                    is FieldReference -> reference.definingClass == type
                    else -> false
                }
            }
        } == true
    }

/**
 * Replaces [method] in [classDef] wholesale with a method of the same identity but a register
 * count sized for [locals] scratch registers, then assembles [smali] into it (labels allowed;
 * they must resolve within the block). The original body is gone and `p0`/`p1` can never collide
 * with a scratch register -- the rewritten title callback of the hub fragment only verified
 * against the app's real register layout after this grew the count (the original has a single
 * free local, and the reused registers *were* `p0`/`p1`: the class was rejected with
 * `VerifyError` on load).
 */
private fun MutableClass.replaceMethodBody(method: MutableMethod, locals: Int, smali: String) {
    val paramWords = (if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1) +
        method.parameterTypes.sumOf { param ->
            when (param.toString()) {
                "J", "D" -> 2
                else -> 1
            }
        }
    val replacement = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameterTypes.map { ImmutableMethodParameter(it.toString(), null, null) },
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        ImmutableMethodImplementation(
            paramWords + locals,
            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
            emptyList(),
            emptyList(),
        ),
    )
    methods.remove(method)
    methods.add(MutableMethod(replacement))
    val replaced = methods.single { candidate ->
        candidate.name == method.name && candidate.parameterTypes == method.parameterTypes
    }
    replaced.addInstructionsWithLabels(0, smali)
}

/**
 * Adds [smali] as the entire effective body of a freshly added placeholder method. The
 * placeholder's own instructions end up unreachable behind the new body.
 */
private fun MutableMethod.fillBody(smali: String) {
    addInstructionsWithLabels(0, smali)
}

/**
 * The "Patch settings" hub, wired into the live settings stack.
 *
 * [screenClass] is the live stack's sub-screen fragment; [argsField] its arguments field (mined
 * from the click handler's own class), [sbXmlId] the id of the dead framework XML that becomes
 * the SponsorBlock screen. The other mined pieces ([holderType], [routeTarget], [keyField],
 * [swapRef], [superClickProto]) come from [SettingsClickMining].
 */
private fun BytecodePatchContext.wireModSettingsHub(
    screenClass: MutableClass,
    holderType: String,
    routeTarget: String,
    keyField: FieldReference,
    swapRef: MethodReference,
    superClickProto: String,
    argsField: FieldReference,
    sbXmlId: Int,
) {
    val subType = screenClass.type

    // ---- mine what the rewrites need from the fragment's own bodies -------------
    val setupMethod = screenClass.methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() &&
            method.returnType == "V" &&
            method.implementation?.instructions?.filterIsInstance<NarrowLiteralInstruction>()
                ?.count { it.narrowLiteral in XML_RESOURCE_ID_WINDOW } == 1
    } ?: throw PatchException(
        "Patch settings: no ()V setup with a single xml resource id in $subType",
    )
    val titleMethod = screenClass.methods.singleOrNull { it.holdsConstant(DEV_TITLE_LITERAL) }
        ?: throw PatchException("Patch settings: no \"$DEV_TITLE_LITERAL\" title site in $subType")

    var managerField: FieldReference? = null
    var managerCall: MethodReference? = null
    var inflateRef: MethodReference? = null
    var devXmlId: Int? = null
    for (instruction in setupMethod.implementation!!.instructions) {
        val reference = (instruction as? ReferenceInstruction)?.reference
        when {
            instruction.opcode == Opcode.IGET_OBJECT &&
                managerField == null -> managerField = reference as FieldReference

            devXmlId == null &&
                instruction is NarrowLiteralInstruction &&
                instruction.narrowLiteral in XML_RESOURCE_ID_WINDOW -> devXmlId = instruction.narrowLiteral

            instruction.opcode == Opcode.INVOKE_VIRTUAL && reference != null -> {
                val method = reference as MethodReference
                if (managerCall == null &&
                    method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
                    method.returnType == "V"
                ) {
                    managerCall = method
                } else if (inflateRef == null &&
                    method.parameterTypes.map { it.toString() } == listOf("I")
                ) {
                    inflateRef = method
                }
            }
        }
    }
    val aField = managerField
    val gRef = managerCall
    val oRef = inflateRef
    val devId = devXmlId
    check(aField != null && gRef != null && oRef != null && devId != null) {
        val dump = setupMethod.implementation!!.instructions.joinToString("|") { instruction ->
            (instruction as? NarrowLiteralInstruction)?.let { "${instruction.opcode}:${it.narrowLiteral}" }
                ?: instruction.opcode.toString()
        }
        "Patch settings: the setup in $subType does not have the expected shape " +
            "(manager field, manager call, single-int inflate, xml id); found " +
            "$aField, $gRef, $oRef, $devId; body: $dump"
    }

    var superTitleRef: MethodReference? = null
    var holderField: FieldReference? = null
    var setTitleRef: MethodReference? = null
    var dividerRef: MethodReference? = null
    for (instruction in titleMethod.implementation!!.instructions) {
        val reference = (instruction as? ReferenceInstruction)?.reference ?: continue
        when (instruction.opcode) {
            Opcode.INVOKE_SUPER -> superTitleRef = reference as MethodReference

            Opcode.IGET_OBJECT -> holderField = reference as FieldReference

            Opcode.INVOKE_VIRTUAL -> {
                val method = reference as MethodReference
                if (method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")) {
                    setTitleRef = method
                } else if (method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].toString() == "Landroid/graphics/drawable/Drawable;"
                ) {
                    dividerRef = method
                }
            }

            else -> Unit
        }
    }
    val wSuper = superTitleRef
    val atField = holderField
    val aFRef = setTitleRef
    val rRef = dividerRef
    check(wSuper != null && atField != null && aFRef != null && rRef != null) {
        "Patch settings: the title site in $subType does not have the expected shape " +
            "(super call, holder field, set-title call, divider call)"
    }

    // ---- the setup: account-name hook, then pick the XML by the fragment argument -------------
    screenClass.replaceMethodBody(
        setupMethod,
        locals = 4,
        smali = """
        iget-object v0, p0, $aField
        const-string v1, "youtube"
        invoke-virtual {v0, v1}, $gRef
        iget-object v0, p0, $argsField
        if-eqz v0, :ytvr_hub
        const-string v1, "$SCREEN_ARG"
        invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :ytvr_hub
        const-string v1, "$SCREEN_ARG_SB"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :ytvr_hub
        const v0, $sbXmlId
        invoke-virtual {p0, v0}, $oRef
        return-void
        :ytvr_hub
        const v0, $devId
        invoke-virtual {p0, v0}, $oRef
        return-void
        """.trimIndent(),
    )

    // ---- the title: the argument decides between the hub and the SponsorBlock screen ----------
    screenClass.replaceMethodBody(
        titleMethod,
        locals = 4,
        smali = """
        invoke-super {p0, p1}, $wSuper
        const-string v0, "$HUB_TITLE"
        iget-object v1, p0, $argsField
        if-eqz v1, :ytvr_set
        const-string v2, "$SCREEN_ARG"
        invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v1
        if-eqz v1, :ytvr_set
        const-string v2, "$SCREEN_ARG_SB"
        invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :ytvr_set
        const-string v0, "$SB_TITLE"
        :ytvr_set
        iget-object v1, p0, $atField
        if-eqz v1, :ytvr_divider
        invoke-virtual {v1, v0}, $aFRef
        :ytvr_divider
        const/4 v0, 0
        invoke-virtual {p0, v0}, $rRef
        return-void
        """.trimIndent(),
    )

    // ---- the click handler: the hub's SponsorBlock entry re-opens the fragment with our argument
    //      (the app's swap would skip a same-class swap; the bridge below makes it recreate). The
    //      super fallback is rebased onto the fragment's own ancestor that declares the click
    //      handler (the mined prototype names the click handler's superclass, a different branch
    //      of the hierarchy).
    val superClickForScreen = oRef.definingClass + "->" + superClickProto.substringAfter("->")
    val clickOverride = ImmutableMethod(
        routeTarget,
        "aC",
        listOf(ImmutableMethodParameter("Landroidx/preference/Preference;", null, null)),
        "Z",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            6,
            listOf(
                ImmutableInstruction11x(Opcode.RETURN, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )
    screenClass.methods.add(MutableMethod(clickOverride))
    val click = screenClass.methods.single { it.name == "aC" }
    click.fillBody(
        """
        iget-object v0, p1, $keyField
        const-string v1, "$SB_ROW_KEY"
        invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :ytvr_super
        iget-object v0, p0, $atField
        if-eqz v0, :ytvr_super
        new-instance v1, Landroid/os/Bundle;
        invoke-direct {v1}, Landroid/os/Bundle;-><init>()V
        const-string v2, "$SCREEN_ARG"
        const-string v3, "$SCREEN_ARG_SB"
        invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
        const-class v2, $routeTarget
        invoke-virtual {v0, v2, v1}, $swapRef
        const/4 v0, 1
        return v0
        :ytvr_super
        invoke-super {p0, p1}, $superClickForScreen
        move-result v0
        return v0
        """.trimIndent(),
    )

    // ---- the swap guard bridge: only our argument forces a same-class recreation --------------
    val bridge = ImmutableMethod(
        holderType,
        "YtvrSbScreenClass",
        listOf(
            ImmutableMethodParameter("Ljava/lang/Object;", null, null),
            ImmutableMethodParameter("Landroid/os/Bundle;", null, null),
        ),
        "Ljava/lang/Class;",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            5,
            listOf(
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )
    val holderClass = mutableClassDefBy(holderType)
    holderClass.methods.add(MutableMethod(bridge))
    val bridgeMethod = holderClass.methods.single { it.name == "YtvrSbScreenClass" }
    bridgeMethod.fillBody(
        """
        if-eqz p1, :ytvr_real
        const-string v0, "$SCREEN_ARG"
        invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :ytvr_real
        const-string v1, "$SCREEN_ARG_SB"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :ytvr_real
        const-class v0, Landroid/os/Bundle;
        return-object v0
        :ytvr_real
        invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
        move-result-object v0
        return-object v0
        """.trimIndent(),
    )

    // Swap the `getClass()` inside the fragment swap for the bridge. `aH(Object, Class, Bundle)`:
    // p0 this, p1 class, p2 bundle, so the bundle is the last register of the method.
    val swapMethod = holderClass.methods.single { method ->
        method.name == swapRef.name &&
            method.parameterTypes.map { it.toString() } ==
            listOf("Ljava/lang/Class;", "Landroid/os/Bundle;")
    }
    val swapInstructions = swapMethod.implementation!!.instructions.toList()
    val classReads = swapInstructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                reference is MethodReference && reference.name == "getClass"
            }
    }
    check(classReads.size == 1) {
        "Patch settings: expected exactly one getClass call in ${swapRef.definingClass}, " +
            "found ${classReads.size}"
    }
    val (classReadIndex, classRead) = classReads.single()
    val receiverRegister = (classRead as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerC
    val bundleRegister = swapMethod.implementation!!.registerCount - 1
    check(receiverRegister < 16 && bundleRegister < 16) {
        "Patch settings: the swap's registers are too wide for a 35c invoke " +
            "($receiverRegister, $bundleRegister)"
    }
    swapMethod.replaceInstruction(
        classReadIndex,
        "invoke-static {v$receiverRegister, v$bundleRegister}, " +
            "$holderType->YtvrSbScreenClass(Ljava/lang/Object;Landroid/os/Bundle;)Ljava/lang/Class;",
    )

    // ---- the system back: the OS draws its own back affordance on the focused panel and the
    //      card's arrow is hidden, so the system back must drive the hub's navigation. The
    //      holder's pop-or-close (the arrow's action) is exposed through a bridge, the holder
    //      registers itself with the extension while its view exists, and the app's base
    //      activity back handling tries the hub first.

    // The arrow's action, mined through its click listener: the holder's (View, Bundle) view-
    // created callback constructs the listener, whose click handler calls the holder's
    // pop-or-close. (In 1.88.10: fzf.ad -> fru -> fzf.r.)
    val viewCreated = holderClass.methods.singleOrNull { method ->
        method.parameterTypes.map { it.toString() } ==
            listOf("Landroid/view/View;", "Landroid/os/Bundle;")
    } ?: throw PatchException("Patch settings: no view-created callback on $holderType")
    val listenerNews = viewCreated.implementation!!.instructions.filter { instruction ->
        instruction.opcode == Opcode.NEW_INSTANCE
    }
    check(listenerNews.size == 1) {
        "Patch settings: expected exactly one listener constructed in the holder's " +
            "view-created callback, found ${listenerNews.size}"
    }
    val listenerType = (listenerNews.single() as ReferenceInstruction)
        .reference.let { it as TypeReference }.type
    val listenerClass = mutableClassDefBy(listenerType)
    val listenerClicks = listenerClass.methods.filter { method ->
        method.parameterTypes.map { it.toString() } == listOf("Landroid/view/View;")
    }
    check(listenerClicks.size == 1) {
        "Patch settings: expected exactly one click handler on $listenerType, found ${listenerClicks.size}"
    }
    val popRefs = listenerClicks.single().implementation!!.instructions.mapNotNull { instruction ->
        (instruction as? ReferenceInstruction)?.reference.let { reference ->
            reference as? MethodReference
        }?.takeIf { reference ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                reference.definingClass == holderType &&
                reference.parameterTypes.isEmpty() &&
                reference.returnType == "V"
        }
    }
    check(popRefs.size == 1) {
        "Patch settings: expected exactly one holder call from the arrow's click handler, " +
            "found ${popRefs.size}"
    }
    val popRef = popRefs.single()

    // The bridge the extension invokes by name.
    val goBackBridge = ImmutableMethod(
        holderType,
        "YtvrSbGoBack",
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            1,
            listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference.of(popRef),
                ),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            ),
            emptyList(),
            emptyList(),
        ),
    )
    holderClass.methods.add(MutableMethod(goBackBridge))

    // Registration: while the holder's view exists, system back belongs to the hub.
    viewCreated.addInstructions(
        0,
        "invoke-static {p0}, Lapp/ytvr/extension/ModSettingsUi;->onSettingsShown(Ljava/lang/Object;)V",
    )

    // Deregistration: the preference-fragment base's view-destroyed callback runs for every
    // settings fragment; the extension only clears when the destroyed fragment IS the
    // registered holder (the list/screen fragments inside it destroy during normal navigation).
    val destroyed = oRef.definingClass
    val baseDestroy = mutableClassDefBy(destroyed).methods.singleOrNull { method ->
        method.name == "h" && method.returnType == "V" && method.parameterTypes.isEmpty()
    } ?: throw PatchException("Patch settings: no view-destroyed callback on $destroyed")
    baseDestroy.addInstructions(
        0,
        "invoke-static {p0}, Lapp/ytvr/extension/ModSettingsUi;->onSettingsHidden(Ljava/lang/Object;)V",
    )

    // The activity back hooks: each of these activities declares its own onBackPressed (they
    // are separate class hierarchies, so no double dispatch), and their bodies write their
    // scratch register before reading it -- so a guard inserted at index zero is safe.
    for (activityType in BACK_ACTIVITY_TYPES) {
        val activity = mutableClassDefBy(activityType)
        val back = activity.methods.singleOrNull { method ->
            method.name == "onBackPressed" &&
                method.returnType == "V" &&
                method.parameterTypes.isEmpty()
        } ?: throw PatchException("Patch settings: no onBackPressed on $activityType")
        check(back.implementation!!.registerCount >= 2) {
            "Patch settings: $activityType back handler has no scratch register " +
                "(registers=${back.implementation!!.registerCount})"
        }
        back.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Lapp/ytvr/extension/ModSettingsUi;->goBack()Z
                move-result v0
                if-eqz v0, :ytvr_app
                return-void
                :ytvr_app
                nop
            """.trimIndent(),
        )
    }
}

/**
 * Mines the pieces the hub needs from the click handler, re-keying every handler on the way; the
 * call site throws when no handler matched the expected shape.
 */
private class SettingsClickMining(
    val holderType: String,
    val routeTarget: String,
    val keyField: FieldReference,
    val swapRef: MethodReference,
    val superClickProto: String,
)

/**
 * The parallel stack's fragment: relabel its title and skip its own wiring (it would dereference
 * rows of the app's own developer XML without null checks, and our replacement has none of them).
 */
private fun BytecodePatchContext.relabelParallelStack(target: String) {
    val parallelClass = try {
        mutableClassDefBy(target)
    } catch (exception: Exception) {
        throw PatchException("Patch settings: the parallel-stack fragment $target did not come back mutable", exception)
    }

    val titleMethod = parallelClass.methods.singleOrNull { it.holdsConstant(DEV_TITLE_LITERAL) }
        ?: throw PatchException("Patch settings: no \"$DEV_TITLE_LITERAL\" title site in $target")
    for ((index, instruction) in titleMethod.implementation!!.instructions.toList().withIndex()) {
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (reference is StringReference && reference.string == DEV_TITLE_LITERAL) {
            val register = (instruction as OneRegisterInstruction).registerA
            titleMethod.replaceInstruction(index, "const-string v$register, \"$HUB_TITLE\"")
        }
    }

    val setupMethod = parallelClass.methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() &&
            method.returnType == "V" &&
            method.implementation?.instructions?.filterIsInstance<NarrowLiteralInstruction>()
                ?.count { it.narrowLiteral in XML_RESOURCE_ID_WINDOW } == 1
    } ?: throw PatchException(
        "Patch settings: no ()V setup with a single xml resource id in $target",
    )
    val setupInstructions = setupMethod.implementation!!.instructions.toList()
    val constIndex = setupInstructions.indexOfFirst { instruction ->
        instruction is NarrowLiteralInstruction && instruction.narrowLiteral in XML_RESOURCE_ID_WINDOW
    }
    var inflateIndex = -1
    for (follow in constIndex + 1 until setupInstructions.size) {
        val later = setupInstructions[follow]
        if (later.opcode == Opcode.INVOKE_VIRTUAL || later.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            val reference = (later as ReferenceInstruction).reference.let { it as MethodReference }
            check(reference.parameterTypes.map { it.toString() } == listOf("I")) {
                "Patch settings: the call after the xml id in $target is not the single-int " +
                    "inflate call ($reference)"
            }
            inflateIndex = follow
            break
        }
    }
    check(inflateIndex > constIndex) {
        "Patch settings: no inflate call found after the xml resource id in $target"
    }
    setupMethod.addInstructions(inflateIndex + 1, "return-void")
}

/**
 * The player wrapper's loadVideo (its one-parameter method carrying the
 * `MedialibPlayer.loadVideo(cpn=` log literal; measured: 1 method). This is the
 * player handover: the extension captures the instance here, resets per-video
 * state and starts the fetch.
 */
private val loadVideoFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf(LOAD_VIDEO_LITERAL),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

/**
 * The time-info snapshot: the method that builds the player's `MedialibPlayerTimeInfo`
 * (`pwe.A` in 1.88.10) out of eight backend accessors.
 *
 * Anchored on the wrapper class (via its loadVideo literal) plus a static call whose
 * prototype is exactly the TimeInfo factory `(J J J J I J J String) -> reference`.
 * Measured over the stock 1.88.10 dex: that prototype is invoked from exactly two
 * methods app-wide -- this snapshot and the TimeInfo class's own `<clinit>` -- and the
 * class literal separates them. This method is NOT hooked; it is mined for the
 * references the bridge bodies are built from:
 *
 * ```dump of pwe.A (1.88.10)
 *    2  iget-object       Lpwe;->a:Lqhg;              <- the backend field
 *    3  invoke-interface  Lqhg;->e()J                 <- #0: position ms
 *    5  invoke-interface  Lqhg;->f()J                 <- #1: utc time
 *    7  invoke-interface  Lqhg;->g()J                 <- #2: duration ms
 *   ...                                              #3..#7: buffered/live/cpn
 * ```
 */
private val timeInfoSnapshotFingerprint = Fingerprint(
    custom = { method, classDef ->
        method.name != "<init>" &&
            classDef.holdsStringLiteral(LOAD_VIDEO_LITERAL) &&
            method.invokesStaticReturningReference(
                listOf("J", "J", "J", "J", "I", "J", "J", "Ljava/lang/String;"),
            )
    },
)

/**
 * Matches the wrapper's seek (its body calls the backend's `(J, seekSource)V`). The
 * literal anchors the method; its body is mined for the seek MethodReference.
 */
private val seekToFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf(SEEK_LITERAL),
    custom = { method, classDef ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes[0].toString() == "J" &&
            classDef.holdsStringLiteral(LOAD_VIDEO_LITERAL)
    },
)

/** Matches the events delegator's onSeeked (the skip's async confirmation signal). */
private val onSeekedFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf(SEEKED_LITERAL),
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[0].toString() == "J"
    },
)

/** The playback-state callbacks: no parameters, one literal each (measured: 1 per literal). */
private val playerStateFingerprints = listOf(
    ON_PLAYING_LITERAL to "onPlaying",
    ON_PAUSED_LITERAL to "onPaused",
    ON_STOPPED_LITERAL to "onStopped",
).map { (literal, extensionMethod) ->
    Fingerprint(
        returnType = "V",
        strings = listOf(literal),
        custom = { method, _ -> method.parameterTypes.isEmpty() },
    ) to extensionMethod
}

/**
 * Matches the seek-source enum's static initializer, the only method in the app
 * holding the `SEEK_SOURCE_UNKNOWN` constant name (measured: 1). Mined for the
 * enum's static field, which the seek bridge loads as the seek source.
 */
private val seekSourceEnumClinitFingerprint = Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf(SEEK_SOURCE_UNKNOWN_LITERAL),
)

/**
 * True when [this] method invokes a **static** method whose parameter prototype is
 * exactly [parameterTypes] and whose return type is a reference.
 */
private fun Method.invokesStaticReturningReference(parameterTypes: List<String>): Boolean = implementation?.instructions?.any { instruction ->
    (
        instruction.opcode == Opcode.INVOKE_STATIC ||
            instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        ) &&
        (instruction as? ReferenceInstruction)?.reference.let { reference ->
            reference is MethodReference &&
                reference.parameterTypes.map { it.toString() } == parameterTypes &&
                reference.returnType.startsWith("L")
        }
} ?: false

/** The option value, which is only null if it and its default were both lost. */
private fun requireValue(value: String?, optionKey: String): String = value ?: throw PatchException("SponsorBlock: option '$optionKey' has no value")

/**
 * The behaviour choices the per-category options offer, in the orientation patcher 2.x hosts
 * expect: `values` maps the *display name* to the value stored and handed to the patch -- both
 * Manager 2.2 and Desktop render the keys and save the values (issue #45: this map used to be
 * declared 1.x-style as `{token: label}`, so changing a category in Manager 2.2 stored
 * 'Show on the seekbar only (never skips)' and the patch refused it at patch time).
 *
 * The display names are exactly the labels the 1.x-shaped map carried, so `storedChoice` also
 * resolves what a Manager 2.2 has already persisted -- the user is not asked to reset options.
 */
internal val behaviourChoices: Map<String, String> = linkedMapOf(
    "Skip automatically (a backwards seek skips it again)" to "skip",
    "Skip automatically once (a backwards seek stays)" to "skip-once",
    "Show a Skip button in the player (nothing is skipped until it is pressed)" to "manual-skip",
    "Show on the seekbar only (never skips)" to "seekbar-only",
    "Leave alone" to "ignore",
)

/**
 * SponsorBlock for YouTube VR: skips crowd-sourced segments (sponsors, self-promos,
 * intros, ...) automatically while a video plays.
 *
 * Everything about the design -- the API contract, the port of the phone patch's
 * skip controller, the two research questions this patch answers -- is documented in
 * docs/SPONSORBLOCK-NOTES.md. The short version:
 *
 * - The extension (extensions/src/SponsorBlock*.java) fetches segments per video id
 *   and runs a ~500 ms tick on the main looper, reading the playhead through three
 *   **bridge methods this patch generates on the player wrapper class**. The app's
 *   own UI poller reads the same accessors every 100 ms, so the access pattern is
 *   the app's own.
 * - The bridge bodies are built at patch time from references mined out of the
 *   snapshot method (`Lpwe;->a:Lqhg;` for the backend field, `Lqhg;->e()J` /
 *   `Lqhg;->g()J` for position/duration) and out of the seek method
 *   (`Lqhg;->F(J,Lablw;)V` plus the `SEEK_SOURCE_UNKNOWN` enum constant). No
 *   obfuscated name is written into this patch: a version bump that renames the
 *   accessors still produces correct bridges, and a shape change fails this patch
 *   loudly at the `check`s below instead of mis-seek-ing on device.
 * - A skip is only counted as done when the events hook reports `onSeeked` landing
 *   near the requested target -- the underlying seek returns void, so confirmation
 *   is asynchronous.
 */
@Suppress("unused")
val sponsorBlockPatch = bytecodePatch(
    name = "SponsorBlock",
    description = "Automatically skips SponsorBlock segments (sponsors, self-promos, " +
        "intros, ...). On by default (sponsors: skip once); configure per-category " +
        "behaviour below or in the headset's Patch settings screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    val apiBase by stringOption(
        key = "sponsorBlockApi",
        default = "https://sponsor.ajay.app",
        title = "SponsorBlock API base",
        description = "A self-hosted SponsorBlock instance works too. Must be the bare " +
            "origin (scheme, host, optional port), no path.",
    )

    fun categoryBehaviourOption(key: String, title: String, default: String) = stringOption(
        key = key,
        default = default,
        values = behaviourChoices,
        title = title,
    )

    // Upstream's own default map: what a phone user gets before touching anything. `sponsor` is the
    // only category that skips by itself; the six upstream leaves to its Skip button
    // (selfpromo/interaction/intro/outro/music_offtopic/poi_highlight) are `manual-skip` here too,
    // now that this port has that button -- they were `seekbar-only` only while it did not, which
    // made those six silently do nothing. `preview`/`hook`/`filler` are left alone, as upstream
    // leaves them. The Patch settings pickers change any of them per category at runtime, and
    // SponsorBlockSettings.migrateOldDefaults moves rows still holding the old defaults so the
    // change is actually seen by an install that has already opened the screen.
    val sponsor by categoryBehaviourOption("sponsorCategory", "Sponsor", "skip-once")
    val selfpromo by categoryBehaviourOption("selfpromoCategory", "Self-promotion", "manual-skip")
    val interaction by categoryBehaviourOption("interactionCategory", "Interaction reminder", "manual-skip")
    val intro by categoryBehaviourOption("introCategory", "Intermission/intro", "manual-skip")
    val outro by categoryBehaviourOption("outroCategory", "Outro/endcards", "manual-skip")
    val preview by categoryBehaviourOption("previewCategory", "Preview/recap", "ignore")
    val hook by categoryBehaviourOption("hookCategory", "Hook (padding after intro)", "ignore")
    val filler by categoryBehaviourOption("fillerCategory", "Filler tangent", "ignore")
    val musicOfftopic by categoryBehaviourOption("musicOfftopicCategory", "Music: non-music", "manual-skip")
    val poiHighlight by categoryBehaviourOption("poiHighlightCategory", "Highlight (jump to point)", "manual-skip")

    // ---- the colour legend on the category rows.
    //
    // The rows are plain androidx preferences, so their titles go through
    // `androidx.preference.Preference`'s two `(CharSequence)V` setters -- which R8 has renamed
    // (measured in 1.88.10: `L` is the title setter, it writes field `q`, and `n` is the summary
    // one). Naming either method would silently do nothing, which is the trap this project has
    // already lost time to, so they are found by shape and *both* are hooked: the extension only
    // colours text that matches one of our category titles, so hooking the summary setter too is
    // harmless and saves telling the two apart.
    //
    // The colours themselves live in the extension's CategoryColours, next to the seek-bar
    // palette, so a row and its marker cannot disagree. (The rewrite itself is inside `execute`,
    // below, next to the other bytecode edits: `classDefByStrings` is only in that scope.)

    execute {
        // ---- the colour legend on the category rows: the hook half; CategoryColours has the why.
        //
        // The hook is the **row binder**, found by what it does rather than by any name: the
        // one-parameter method on `Preference` that calls `TextView.setText(CharSequence)`. Two
        // wrong turns are recorded here so they are not repeated:
        //   * the `(CharSequence)V` title/summary setters are `L` and `n`, but XML inflation never
        //     calls them -- the constructor reads `android:title` out of the TypedArray and assigns
        //     the field (`this.q = ...`), so a setter hook fires for nothing;
        //   * `b(View)` looks like the binder and is not -- it is a shell that calls `D()`, and
        //     `SwitchPreference.b` overrides it as `final` and never calls the base, so hooking
        //     either paints nothing. The binder is `a(<holder>)`, which reads the title field and
        //     calls `textView2.setText(charSequence)` on the view it found via `android.R.id.title`.
        // The extension is handed the holder and recovers the row view itself.
        //
        // The class is reached the way everything else that needs a *non-app* class is reached
        // here: by a literal it holds (`Preference already has a SummaryProvider set.` is thrown by
        // that class's own summary setter), then re-resolved through the mutable class repository,
        // because `classDefByStrings` returns raw dex defs that cannot be edited.
        val preferenceClasses = classDefByStrings(SUMMARY_PROVIDER_LITERAL)
            .filter { classDef -> classDef.type == PREFERENCE_TYPE }
            .map { classDef -> mutableClassDefBy(classDef) }
        check(preferenceClasses.size == 1) {
            "SponsorBlock: expected exactly one $PREFERENCE_TYPE, found ${preferenceClasses.size}: " +
                "cannot colour the category rows"
        }
        val binders = preferenceClasses.single().methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.implementation != null &&
                method.callsMethodOn(TEXT_VIEW_TYPE, "setText")
        }
        check(binders.size == 1) {
            "SponsorBlock: expected exactly one (holder)V row binder on $PREFERENCE_TYPE (the " +
                "method that calls TextView.setText), found ${binders.size}: cannot colour the rows"
        }
        val binder = binders.single()
        // `p1` is named in the invoke list, so it must fit in a 4-bit register list: for an
        // instance method with one parameter, p1 is at registerCount - 1.
        val registers = binder.implementation!!.registerCount
        check(registers <= 16) {
            "SponsorBlock: ${binder.name} has $registers registers, so p1 cannot be named in an " +
                "invoke list: cannot colour the category rows"
        }
        binder.addInstructions(
            0,
            "invoke-static {p1}, Lapp/ytvr/extension/CategoryRows;->bindRow(Ljava/lang/Object;)V",
        )

        // Normalizing *is* the validation: a value that is neither a behaviour token nor one of
        // the picker's display names fails the patch here, before any bytecode is touched.
        val behaviours: Map<String, String> = mapOf(
            "sponsor" to requireValue(sponsor, "sponsorCategory"),
            "selfpromo" to requireValue(selfpromo, "selfpromoCategory"),
            "interaction" to requireValue(interaction, "interactionCategory"),
            "intro" to requireValue(intro, "introCategory"),
            "outro" to requireValue(outro, "outroCategory"),
            "preview" to requireValue(preview, "previewCategory"),
            "hook" to requireValue(hook, "hookCategory"),
            "filler" to requireValue(filler, "fillerCategory"),
            "music_offtopic" to requireValue(musicOfftopic, "musicOfftopicCategory"),
            "poi_highlight" to requireValue(poiHighlight, "poiHighlightCategory"),
        ).mapValues { (_, stored) ->
            storedChoice(behaviourChoices, stored) ?: throw PatchException(
                "SponsorBlock: unknown category behaviour '$stored' " +
                    "(want ${behaviourChoices.values.joinToString(", ")}, or one of the picker's " +
                    "display names)",
            )
        }
        val apiBaseValue = requireValue(apiBase, "sponsorBlockApi")
        if (!Regex("^https?://[A-Za-z0-9.-]+(:[0-9]+)?$").matches(apiBaseValue)) {
            throw PatchException(
                "SponsorBlock: '$apiBaseValue' is not a bare API origin " +
                    "(https://sponsor.ajay.app is the default)",
            )
        }

        // ------------------------------------------------------------------
        // Mine the references the bridge bodies are built from.
        // ------------------------------------------------------------------
        val snapshot = timeInfoSnapshotFingerprint.method
        val wrapperType = timeInfoSnapshotFingerprint.classDef.type

        var backendField: FieldReference? = null
        val accessors = mutableListOf<MethodReference>()
        for (instruction in snapshot.implementation?.instructions ?: throw PatchException(
            "SponsorBlock: the time-info snapshot has no body",
        )) {
            val reference = (instruction as? ReferenceInstruction)?.reference ?: continue
            when (instruction.opcode) {
                Opcode.IGET_OBJECT -> if (backendField == null) {
                    backendField = reference as FieldReference
                }

                Opcode.INVOKE_INTERFACE -> accessors += reference as MethodReference

                else -> Unit
            }
        }
        check(backendField != null && accessors.size == 8) {
            "SponsorBlock: the time-info snapshot does not have the expected shape " +
                "(one backend field read, eight accessor calls); found " +
                "${backendField != null} and ${accessors.size}"
        }
        val positionAccessor = accessors[0]
        val durationAccessor = accessors[2]
        check(
            positionAccessor.returnType == "J" &&
                durationAccessor.returnType == "J" &&
                positionAccessor.definingClass == durationAccessor.definingClass,
        ) {
            "SponsorBlock: snapshot accessors #0/#2 are not (J, J) on one interface " +
                "($positionAccessor, $durationAccessor)"
        }
        val backendType = positionAccessor.definingClass

        val seekDef = seekToFingerprint.method
        check(seekToFingerprint.classDef.type == wrapperType) {
            "SponsorBlock: the seek method and the time-info snapshot are not in the " +
                "same class (${seekToFingerprint.classDef.type} vs $wrapperType)"
        }
        val seekRefs = seekDef.implementation?.instructions
            ?.mapNotNull { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                if (instruction.opcode == Opcode.INVOKE_INTERFACE) {
                    reference as? MethodReference
                } else {
                    null
                }
            }
            ?.filter {
                it.returnType == "V" &&
                    it.parameterTypes.size == 2 &&
                    it.parameterTypes[0].toString() == "J" &&
                    it.parameterTypes[1].toString().startsWith("L")
            }
            .orEmpty()
        check(seekRefs.size == 1) {
            "SponsorBlock: expected exactly one interface seek call in the seek method, " +
                "found ${seekRefs.size}"
        }
        val seekRef = seekRefs.single()
        check(seekRef.definingClass == backendType) {
            "SponsorBlock: the seek call's receiver $seekRef is not the backend interface " +
                "$backendType the snapshot reads"
        }
        val seekSourceType = seekRef.parameterTypes[1].toString()

        val enumClinit = seekSourceEnumClinitFingerprint.method
        check(seekSourceEnumClinitFingerprint.classDef.type == seekSourceType) {
            "SponsorBlock: the class holding SEEK_SOURCE_UNKNOWN " +
                "(${seekSourceEnumClinitFingerprint.classDef.type}) is not the seek's " +
                "source enum $seekSourceType"
        }
        var pastUnknown = false
        var seekSourceField: FieldReference? = null
        for (instruction in enumClinit.implementation?.instructions ?: emptyList()) {
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (reference is StringReference && reference.string == SEEK_SOURCE_UNKNOWN_LITERAL) {
                pastUnknown = true
                continue
            }
            if (pastUnknown &&
                instruction.opcode == Opcode.SPUT_OBJECT &&
                reference is FieldReference &&
                reference.definingClass == seekSourceType
            ) {
                seekSourceField = reference
                break
            }
        }
        check(seekSourceField != null) {
            "SponsorBlock: no static field of $seekSourceType is stored after the " +
                "SEEK_SOURCE_UNKNOWN constant"
        }

        // ------------------------------------------------------------------
        // Generate the three bridges on the player wrapper. Their bodies are
        // the mined references; their names are ours, so the extension's
        // reflection cannot be broken by a rename.
        // ------------------------------------------------------------------
        val access = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

        fun getterBridge(name: String, accessor: MethodReference) = ImmutableMethod(
            wrapperType,
            name,
            emptyList(),
            "J",
            access,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(
                2,
                listOf(
                    ImmutableInstruction22c(
                        Opcode.IGET_OBJECT,
                        0,
                        1,
                        ImmutableFieldReference.of(backendField!!),
                    ),
                    ImmutableInstruction35c(
                        Opcode.INVOKE_INTERFACE,
                        1,
                        0,
                        0,
                        0,
                        0,
                        0,
                        ImmutableMethodReference.of(accessor),
                    ),
                    ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 0),
                    ImmutableInstruction11x(Opcode.RETURN_WIDE, 0),
                ),
                emptyList(),
                emptyList(),
            ),
        )

        val seekBridge = ImmutableMethod(
            wrapperType,
            "YtvrSbSeekTo",
            listOf(ImmutableMethodParameter("J", null, null)),
            "V",
            access,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(
                5,
                listOf(
                    ImmutableInstruction22c(
                        Opcode.IGET_OBJECT,
                        0,
                        2,
                        ImmutableFieldReference.of(backendField!!),
                    ),
                    ImmutableInstruction21c(
                        Opcode.SGET_OBJECT,
                        1,
                        ImmutableFieldReference.of(seekSourceField!!),
                    ),
                    ImmutableInstruction35c(
                        // { backend, position.lo, position.hi, seek source }
                        Opcode.INVOKE_INTERFACE,
                        4,
                        0,
                        3,
                        4,
                        1,
                        0,
                        ImmutableMethodReference.of(seekRef),
                    ),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
                emptyList(),
                emptyList(),
            ),
        )

        // `fingerprint.classDef` resolves through the patcher's mutable class
        // repository, so adding methods here is what gets written to the dex.
        val wrapperClass = timeInfoSnapshotFingerprint.classDef as? MutableClass
            ?: throw PatchException(
                "SponsorBlock: the player wrapper class $wrapperType did not come back " +
                    "mutable -- cannot add the bridge methods",
            )
        wrapperClass.methods.add(MutableMethod(getterBridge("YtvrSbGetPositionMs", positionAccessor)))
        wrapperClass.methods.add(MutableMethod(getterBridge("YtvrSbGetDurationMs", durationAccessor)))
        wrapperClass.methods.add(MutableMethod(seekBridge))

        // ------------------------------------------------------------------
        // Wire the hooks. All injected smali is trivial: one call per site,
        // everything else lives in the extension.
        // ------------------------------------------------------------------

        // Bake the option values into the app once, at start: the baked defaults first,
        // then the overlay's ids, then the settings store — which reads the user's own
        // choices over those defaults, so the order inside this one block matters.
        val seekbarMatches = seekbarControllerFingerprint.method.matchingSeekbarSets()
        if (seekbarMatches.size > 1) {
            throw PatchException(
                "SponsorBlock: ${seekbarMatches.size} supported seek-bar id sets match the " +
                    "binder -- the supported versions' id ranges have collided; add the new " +
                    "version's set and prune the stale one before baking",
            )
        }
        val seekbarIds = seekbarMatches.firstOrNull()
            ?: throw PatchException(
                "SponsorBlock: seek-bar fingerprint matched but none of the known id sets " +
                    "were present -- refusing to bake a guessed version's ids",
            )

        applicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$apiBaseValue"
                const-string v1, "${behaviours.entries.joinToString(";") { "${it.key}=${it.value}" }}"
                invoke-static {v0, v1}, Lapp/ytvr/extension/SponsorBlockSettings;->configure(Ljava/lang/String;Ljava/lang/String;)V
                const v2, ${seekbarIds.seekbar}
                const v3, ${seekbarIds.seekbarPosition}
                const v4, ${seekbarIds.seekbarContainer}
                const v5, ${seekbarIds.seekbarBuffered}
                const v6, ${seekbarIds.seekbarThumb}
                invoke-static {v2, v3, v4, v5, v6}, Lapp/ytvr/extension/SponsorBlockOverlay;->configure(IIIII)V
                const v2, ${seekbarIds.seekbarBg}
                invoke-static {v2}, Lapp/ytvr/extension/SponsorBlockOverlay;->setBackgroundId(I)V
                move-object/from16 v0, p0
                invoke-static {v0}, Lapp/ytvr/extension/SponsorBlockSettings;->initContext(Landroid/content/Context;)V
            """,
        )

        // Player handover + video change (pwe.j): attach, reset, fetch.
        loadVideoFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                invoke-static {v0}, Lapp/ytvr/extension/SponsorSkipController;->onLoadVideo(Ljava/lang/Object;)V
            """,
        )

        // Which video is being prepared (oqb.<init>(zjp) -- the same constructor the
        // Extension patch hooks, so this adds no new class to the patched set).
        videoStreamingDataCtorFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                invoke-static {v0}, Lapp/ytvr/extension/SponsorSkipController;->onPlayerResponse(Ljava/lang/Object;)V
            """,
        )

        // Async seek confirmation (pwd.u = onSeeked).
        onSeekedFingerprint.method.addInstructions(
            0,
            """
                move-wide/from16 v0, p1
                invoke-static {v0, v1}, Lapp/ytvr/extension/SponsorSkipController;->onSeeked(J)V
            """,
        )

        // Playback state: the tick polls only between onPlaying and onPaused/onStopped.
        playerStateFingerprints.forEach { (fingerprint, extensionMethod) ->
            fingerprint.method.addInstructions(
                0,
                "invoke-static {}, Lapp/ytvr/extension/SponsorSkipController;->$extensionMethod()V",
            )
        }

        // The ad gate: both ad countdowns mark "ad on screen" for the controller.
        skipAdCountdownFingerprints.forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                "invoke-static {p1}, Lapp/ytvr/extension/SponsorSkipController;->onAdCountdown(I)V",
            )
        }

        // ------------------------------------------------------------------
        // Seek-bar markers: hand the overlay the two ids it needs to find the
        // bar, then hook the controls binder and its timeline update.
        // ------------------------------------------------------------------

        seekbarControllerFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p1}, Lapp/ytvr/extension/SponsorBlockOverlay;->attach(Landroid/view/View;)V
            """,
        )

        // `invoke-static/range` passing the parameters straight through: a dex `invoke`
        // (format 35c) lists *every* register, so four longs would need eight entries,
        // and it holds five — and moving them into locals instead clobbers the method's
        // own registers (both mistakes are the same VerifyError: "long or double
        // parameter at index 0 is not a pair"). The range form is correct and touches
        // nothing.
        seekbarTimelineFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p1 .. p8}, Lapp/ytvr/extension/SponsorBlockOverlay;->onTimeline(JJJJ)V
            """,
        )

        // ------------------------------------------------------------------
        // The Skip button (the `manual-skip` behaviour): the app's **own** skip-button
        // card, built the way the app builds its skip-Ad button.
        //
        // The controls card is not an option: it is drawn only while the player controls
        // are on screen (the app hides the whole panel when the controller ray leaves
        // it), and a view on the window's decor is never composited at all. The app's
        // skip-Ad button is a standalone `VrCardView` registered with the activity's VR
        // view root -- drawn during playback and hit-tested by the ray -- so the Skip
        // button is one of those.
        //
        // Everything is mined, nothing is named: the slot enum's field comes from the
        // `skip-ad-button` literal, and the one method that reads that field is the
        // skip-Ad-button constructor, whose body supplies the layout id, the activity's
        // card factory, the slot setter and the app's own show/hide call. The bridges
        // below carry *our* names, so the extension never names an obfuscated member.
        // ------------------------------------------------------------------
        val slotClinit = skipSlotFingerprint.method
        val slotType = skipSlotFingerprint.classDef.type
        var slotField: FieldReference? = null
        var pastSlotLiteral = false
        for (instruction in slotClinit.implementation?.instructions ?: emptyList()) {
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (reference is StringReference && reference.string == SKIP_BUTTON_SLOT_LITERAL) {
                pastSlotLiteral = true
                continue
            }
            if (pastSlotLiteral) {
                val stored = instruction.storesFieldOfType(slotType)
                if (stored != null) {
                    slotField = stored
                    break
                }
            }
        }
        val slot = slotField ?: throw PatchException(
            "SponsorBlock: no static field of $slotType is stored after " +
                "\"$SKIP_BUTTON_SLOT_LITERAL\", so the Skip button cannot be given its panel slot",
        )

        // The one method that reads the slot: the skip-Ad-button constructor. Measured over the
        // stock dex, the field is read from exactly one method.
        var slotReaderOwner: ClassDef? = null
        var slotReaderParams: List<String>? = null
        classDefForEach { classDef ->
            if (slotReaderOwner == null) {
                for (method in classDef.methods) {
                    val implementation = method.implementation ?: continue
                    if (implementation.instructions.any { instruction ->
                            instruction.opcode == Opcode.SGET_OBJECT &&
                                (instruction as? ReferenceInstruction)?.reference == slot
                        }
                    ) {
                        slotReaderOwner = classDef
                        slotReaderParams = method.parameterTypes.map { it.toString() }
                        break
                    }
                }
            }
        }
        val readerOwner = slotReaderOwner ?: throw PatchException(
            "SponsorBlock: nothing reads the $SKIP_BUTTON_SLOT_LITERAL slot, so there is no " +
                "skip-Ad button to copy and no activity to hand the extension",
        )
        val readerParams = slotReaderParams ?: throw PatchException(
            "SponsorBlock: the method reading the $SKIP_BUTTON_SLOT_LITERAL slot has no parameters",
        )
        val activityType = readerParams.firstOrNull() ?: throw PatchException(
            "SponsorBlock: the skip-Ad-button constructor takes no activity",
        )
        check(activityType.startsWith("L") && activityType.endsWith(";")) {
            "SponsorBlock: the skip-Ad-button constructor's first parameter is not a class " +
                "($activityType): the skip card cannot be built"
        }
        val readerClass = mutableClassDefBy(readerOwner.type)
        val skipCtor = readerClass.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == readerParams
        } ?: throw PatchException(
            "SponsorBlock: no constructor on ${readerOwner.type} matches $readerParams",
        )

        var layoutId: Int? = null
        var cardFactory: MethodReference? = null
        var cardFactoryOpcode: Opcode? = null
        var slotSetter: MethodReference? = null
        var slotSetterOpcode: Opcode? = null
        var visibilitySetter: MethodReference? = null
        var visibilitySetterOpcode: Opcode? = null
        val ctorInstructions = skipCtor.implementation?.instructions?.toList() ?: throw PatchException(
            "SponsorBlock: the skip-Ad-button constructor has no body",
        )
        for ((index, instruction) in ctorInstructions.withIndex()) {
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (instruction is NarrowLiteralInstruction &&
                instruction.narrowLiteral in LAYOUT_RESOURCE_ID_WINDOW &&
                layoutId == null
            ) {
                // The layout id is the argument of the inflate call that follows it. Anything else
                // between the two means the shape has changed, and that is worth failing on rather
                // than guessing the id.
                for (follow in index + 1 until ctorInstructions.size) {
                    val later = ctorInstructions[follow]
                    if (later.opcode !in INVOKE_OPCODES) {
                        continue
                    }
                    val method = (later as? ReferenceInstruction)?.reference as? MethodReference
                    if (method != null &&
                        method.parameterTypes.map { it.toString() } == listOf("I") &&
                        method.returnType.startsWith("L")
                    ) {
                        layoutId = instruction.narrowLiteral
                        cardFactory = method
                        cardFactoryOpcode = later.opcode
                    }
                    break
                }
            }
            if (instruction.opcode in INVOKE_OPCODES && reference is MethodReference) {
                val parameters = reference.parameterTypes.map { it.toString() }
                if (slotSetter == null && parameters == listOf(slotType)) {
                    slotSetter = reference
                    slotSetterOpcode = instruction.opcode
                }
                if (visibilitySetter == null &&
                    parameters == listOf("Z") &&
                    reference.returnType == "V"
                ) {
                    visibilitySetter = reference
                    visibilitySetterOpcode = instruction.opcode
                }
            }
        }
        val layout = layoutId ?: throw PatchException(
            "SponsorBlock: no layout id in the ${readerOwner.type} constructor",
        )
        val factory = cardFactory ?: throw PatchException(
            "SponsorBlock: the layout id in ${readerOwner.type} is not followed by an inflate call",
        )
        val factoryOpcode = cardFactoryOpcode!!
        val setSlot = slotSetter ?: throw PatchException(
            "SponsorBlock: ${readerOwner.type} never sets the $slotType slot on the card",
        )
        val setSlotOpcode = slotSetterOpcode!!
        val setVisible = visibilitySetter ?: throw PatchException(
            "SponsorBlock: ${readerOwner.type} never shows or hides the card",
        )
        val setVisibleOpcode = visibilitySetterOpcode!!
        val cardType = factory.returnType
        check(factory.definingClass == activityType) {
            "SponsorBlock: the card factory $factory is not on the activity $activityType"
        }

        // The bridges the extension calls by name. `YtvrSbMakeSkipCard` does what the app's own
        // constructor does for its card -- inflate it, register it with the VR view root, give it
        // the panel slot -- and hands back the view; `YtvrSbSkipCardVisible` is the app's own
        // show/hide call, which the extension cannot name either.
        val activityClass = mutableClassDefBy(activityType)
        val publicStatic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        activityClass.methods.add(
            MutableMethod(
                ImmutableMethod(
                    activityType,
                    "YtvrSbMakeSkipCard",
                    listOf(ImmutableMethodParameter(activityType, null, null)),
                    "Landroid/view/View;",
                    publicStatic,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(
                        3,
                        listOf(ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)),
                        emptyList(),
                        emptyList(),
                    ),
                ),
            ),
        )
        activityClass.methods.single { it.name == "YtvrSbMakeSkipCard" }.fillBody(
            """
            const v0, $layout
            ${factoryOpcode.smaliName()} {p0, v0}, $factory
            move-result-object v0
            sget-object v1, $slot
            ${setSlotOpcode.smaliName()} {v0, v1}, $setSlot
            check-cast v0, Landroid/view/View;
            return-object v0
            """.trimIndent(),
        )
        activityClass.methods.add(
            MutableMethod(
                ImmutableMethod(
                    activityType,
                    "YtvrSbSkipCardVisible",
                    listOf(
                        ImmutableMethodParameter("Landroid/view/View;", null, null),
                        ImmutableMethodParameter("Z", null, null),
                    ),
                    "V",
                    publicStatic,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(
                        2,
                        listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
                        emptyList(),
                        emptyList(),
                    ),
                ),
            ),
        )
        activityClass.methods.single { it.name == "YtvrSbSkipCardVisible" }.fillBody(
            """
            check-cast p0, $cardType
            ${setVisibleOpcode.smaliName()} {p0, p1}, $setVisible
            return-void
            """.trimIndent(),
        )

        // The handover: the app's skip-Ad-button constructor receives the activity, and it runs
        // once per player surface. `p1` because the constructor is an instance method.
        skipCtor.addInstructions(
            0,
            "invoke-static/range {p1 .. p1}, " +
                "Lapp/ytvr/extension/SkipButtonCard;->attachActivity(Ljava/lang/Object;)V",
        )

        // ------------------------------------------------------------------
        // The "Patch settings" hub. The XML restructure (entry rows into the dead
        // developer-settings screen, the SponsorBlock rows into the dead
        // framework fragment's XML, the entry row onto the main lists) plus the
        // bytecode edits: every settings click handler that routes the
        // `developer_settings` key is re-keyed to our row; the live stack's
        // fragment gets the two-level treatment (XML and title chosen by a
        // fragment argument, an added click handler for the hub's entry, and a
        // swap-guard bridge); the parallel stack only gets relabelled and its
        // own wiring skipped.
        // ------------------------------------------------------------------

        // `classDefByStrings` returns raw dex class defs, so each candidate is
        // re-resolved through the mutable class repository before its methods are touched.
        val clickHandlers = classDefByStrings(DEV_ROW_KEY).map { classDef ->
            mutableClassDefBy(classDef)
        }.flatMap { classDef ->
            classDef.methods.filter { method ->
                method.returnType == "Z" &&
                    method.parameterTypes.map { it.toString() } ==
                    listOf("Landroidx/preference/Preference;") &&
                    method.holdsConstant(DEV_ROW_KEY)
            }
        }
        check(clickHandlers.isNotEmpty()) {
            "Patch settings: no settings click handler carries the \"$DEV_ROW_KEY\" branch"
        }

        // Mine each handler: the key field it compares, the holder field and swap call its
        // developer-settings branch uses, the fragment class that branch opens (validated by the
        // title literal), and the super-call prototype its tail falls back to.
        val titleHolderTypes = classDefByStrings(DEV_TITLE_LITERAL).map { it.type }.toSet()
        val minings = mutableListOf<SettingsClickMining>()
        for (clickHandler in clickHandlers) {
            val instructions = clickHandler.implementation?.instructions?.toList()
                ?: throw PatchException("Patch settings: a click handler has no body")
            var routeTarget: String? = null
            var keyField: FieldReference? = null
            var holderField: FieldReference? = null
            var swapRef: MethodReference? = null
            var superClickProto: String? = null
            for ((index, instruction) in instructions.withIndex()) {
                val reference = (instruction as? ReferenceInstruction)?.reference
                when {
                    reference is StringReference && reference.string == DEV_ROW_KEY -> {
                        val register = (instruction as OneRegisterInstruction).registerA
                        clickHandler.replaceInstruction(
                            index,
                            "const-string v$register, \"$MOD_SETTINGS_KEY\"",
                        )
                        for (follow in index + 1 until instructions.size) {
                            val later = instructions[follow]
                            if (later.opcode == Opcode.CONST_CLASS) {
                                val type = (later as ReferenceInstruction)
                                    .reference.let { it as TypeReference }.type
                                if (type in titleHolderTypes) {
                                    routeTarget = type
                                }
                                break
                            }
                            if (later is ReferenceInstruction &&
                                later.reference is StringReference
                            ) {
                                break // left the branch without opening a screen
                            }
                        }
                    }

                    instruction.opcode == Opcode.IGET_OBJECT &&
                        reference is FieldReference &&
                        reference.type == "Ljava/lang/String;" &&
                        keyField == null ->
                        keyField = reference

                    instruction.opcode == Opcode.IGET_OBJECT &&
                        reference is FieldReference &&
                        holderField == null ->
                        holderField = reference

                    reference is MethodReference &&
                        reference.parameterTypes.map { it.toString() } ==
                        listOf("Ljava/lang/Class;", "Landroid/os/Bundle;") -> swapRef = reference

                    instruction.opcode == Opcode.INVOKE_SUPER &&
                        reference is MethodReference &&
                        reference.parameterTypes.map { it.toString() } ==
                        listOf("Landroidx/preference/Preference;") ->
                        superClickProto = reference.toString()
                }
            }
            val target = routeTarget
            val key = keyField
            val holder = holderField
            val swap = swapRef
            val superClick = superClickProto
            if (target != null && key != null && holder != null && swap != null && superClick != null) {
                minings.add(
                    SettingsClickMining(
                        holder.type,
                        target,
                        key,
                        swap,
                        superClick,
                    ),
                )
            }
        }
        // Both stacks' handlers can match the shape, so "live" is decided by structure: the
        // fragment whose title method reads a *field of the holder's type* is the one wired to
        // that holder (the parallel stack's fragment reaches its holder through a peer lookup,
        // with no such field).
        val mining = minings.singleOrNull { candidate ->
            val candidateClass = classDefByOrNull(candidate.routeTarget)
            val titleSite = candidateClass?.methods?.singleOrNull { method ->
                method.implementation?.instructions?.any { instruction ->
                    (instruction as? ReferenceInstruction)?.reference.let { reference ->
                        reference is StringReference && reference.string == DEV_TITLE_LITERAL
                    }
                } == true
            }
            titleSite?.implementation?.instructions?.any { instruction ->
                (instruction as? ReferenceInstruction)?.reference.let { reference ->
                    reference is FieldReference && reference.type == candidate.holderType
                }
            } == true
        } ?: throw PatchException(
            "Patch settings: no click handler had the expected live-stack shape " +
                "(key field, holder field, fragment swap, super fallback, holder-typed title " +
                "field; candidates: " + minings.map { it.routeTarget } + ")",
        )

        val screenClass = try {
            mutableClassDefBy(mining.routeTarget)
        } catch (exception: Exception) {
            throw PatchException(
                "Patch settings: the sub-screen fragment ${mining.routeTarget} did not come back mutable",
                exception,
            )
        }
        val titleMethod = screenClass.methods.singleOrNull { it.holdsConstant(DEV_TITLE_LITERAL) }
            ?: throw PatchException(
                "Patch settings: no \"$DEV_TITLE_LITERAL\" title site in ${screenClass.type}",
            )
        val talksToLiveHolder = titleMethod.implementation!!.instructions.any { instruction ->
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                reference is FieldReference &&
                    reference.definingClass == mining.routeTarget &&
                    reference.type == mining.holderType
            }
        }
        check(talksToLiveHolder) {
            "Patch settings: ${mining.routeTarget} does not talk to the live holder " +
                "${mining.holderType} -- the hub cannot be wired here"
        }

        // The fragment-arguments field (`androidx Fragment`'s, R8-renamed): mined from the click
        // handler's own class, whose `()V` setup reads it to pick its XML.
        val clickHandlerClass = mutableClassDefBy(
            clickHandlers.first { it.definingClass != mining.routeTarget }.definingClass,
        )
        var argsField: FieldReference? = null
        for (method in clickHandlerClass.methods) {
            if (method.parameterTypes.isNotEmpty() || method.returnType != "V") {
                continue
            }
            for (instruction in method.implementation?.instructions ?: emptyList()) {
                if (instruction.opcode == Opcode.IGET_OBJECT) {
                    (instruction as? ReferenceInstruction)?.reference?.let { reference ->
                        if (reference is FieldReference && reference.type == "Landroid/os/Bundle;") {
                            argsField = reference
                        }
                    }
                }
            }
        }
        val args = argsField ?: throw PatchException(
            "Patch settings: the settings fragment's setup never reads its arguments -- " +
                "cannot branch the hub on a fragment argument",
        )

        // The dead framework XML for the SponsorBlock screen: the `android.preference
        // .PreferenceFragment` subclasses that inflate one xml resource. Both are dead UI; the
        // languages one is excluded structurally (it references the input-method backup type),
        // which leaves the generic preferences screen.
        val frameworkPrefFragments = buildList {
            classDefForEach { classDef ->
                if (classDef.superclass == "Landroid/preference/PreferenceFragment;") {
                    add(classDef)
                }
            }
        }
        val sbXmlCandidates = frameworkPrefFragments.filter { classDef ->
            !classDef.referencesType("Lcom/google/android/apps/vr/inputmethod/backup/Backup;") &&
                classDef.methods.any { method ->
                    method.implementation?.instructions?.any { instruction ->
                        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                                reference is MethodReference &&
                                    reference.name == "addPreferencesFromResource"
                            }
                    } == true
                }
        }
        check(sbXmlCandidates.size == 1) {
            "Patch settings: expected exactly one candidate for the dead framework preferences " +
                "XML, found ${sbXmlCandidates.size} (${sbXmlCandidates.map { it.type }})"
        }
        var sbXmlId: Int? = null
        for (method in sbXmlCandidates.single().methods) {
            for (instruction in method.implementation?.instructions ?: emptyList()) {
                if (instruction is NarrowLiteralInstruction &&
                    instruction.narrowLiteral in XML_RESOURCE_ID_WINDOW
                ) {
                    sbXmlId = instruction.narrowLiteral
                }
            }
        }
        val sbId = sbXmlId ?: throw PatchException(
            "Patch settings: the dead framework fragment carries no xml resource id",
        )

        // The parallel stack: same re-keyed row, but no hub -- just the relabelled title and the
        // wiring skip.
        for (type in titleHolderTypes) {
            if (type != mining.routeTarget) {
                relabelParallelStack(type)
            }
        }

        wireModSettingsHub(
            screenClass = screenClass,
            holderType = mining.holderType,
            routeTarget = mining.routeTarget,
            keyField = mining.keyField,
            swapRef = mining.swapRef,
            superClickProto = mining.superClickProto,
            argsField = args,
            sbXmlId = sbId,
        )
        // The settings screens' XML is the Patch settings resource patch's job: under the 2.x
        // hosts that decode resources on request, nothing exists under the decode tree until a
        // resource patch asks for it (measured 2026-10-30, see PatchSettingsPatch's kdoc). This
        // patch publishes what only bytecode access can mine.
        PatchSettingsState.screenXmlId = sbId
        PatchSettingsState.behaviours = behaviours
    }

    finalize {
        // Disable-coupling guard. This patch's bytecode wires the "Patch settings" row and the
        // hub click handlers onto screens that ONLY the Patch settings patch fills (it executes
        // in the execute phase; every finalize runs after every execute). If it was disabled or
        // failed, this wiring would point at the app's dead developer screen -- degraded, not
        // crashing, which is exactly how it would slip through a green run. Fail here instead.
        if (!PatchSettingsState.restructured) {
            throw PatchException(
                "SponsorBlock: the 'Patch settings' patch did not run, so the settings screens' " +
                    "XML was never restructured -- this patch's hub wiring would point at empty " +
                    "screens. Enable 'Patch settings' (default-on), or disable SponsorBlock too.",
            )
        }
    }
}
