package com.feurstagram.patches.download

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION
import com.feurstagram.patches.shared.freeLocals
import com.feurstagram.patches.shared.hasStringEndingWith

private const val DOWNLOAD_CLASS = "Lcom/feurstagram/extension/Download;"
private const val MEDIA_OPTION = "Lcom/instagram/feed/media/mediaoption/MediaOption\$Option;"
private const val MEDIA = "Lcom/instagram/feed/media/Media;"
private const val FRAGMENT_ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"

/** Obfuscated classes keep their pre-redex name in this static string. */
private fun ClassDef.originalName(): String? =
    fields.firstOrNull { it.name == "__redex_internal_original_name" }
        ?.initialValue?.let { (it as? StringEncodedValue)?.value }

/** Instagram's static menu-row adder: (state, Option, creator, CharSequence, ArrayList, boolean). */
private fun MethodReference.isRowAdder() =
    parameterTypes.size == 6 && parameterTypes[1].toString() == MEDIA_OPTION &&
        parameterTypes[3].toString() == "Ljava/lang/CharSequence;" &&
        parameterTypes[4].toString() == "Ljava/util/ArrayList;" && parameterTypes[5].toString() == "Z"

private fun Method.addsNativeDownloadRow(): Boolean {
    val insns = implementation?.instructions ?: return false
    return insns.any { it.getReference<FieldReference>()?.let { f -> f.type == MEDIA_OPTION && f.name == "DOWNLOAD" } == true } &&
        insns.any { it.getReference<MethodReference>()?.isRowAdder() == true }
}

// Builds the option list behind a post's overflow sheet. Instagram only adds its own
// DOWNLOAD row there for your own posts whose creator allows downloads; this is the
// method that holds that call, which is why it is matched by it.
internal object PostOptionsBuilderFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) && method.addsNativeDownloadRow() },
)

// Click handler of the feed post overflow menu: MediaOptionsOverflowHelper.onOptionClicked(Option).
internal object FeedOverflowClickFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(MEDIA_OPTION),
    custom = { _, classDef -> classDef.originalName() == "MediaOptionsOverflowHelper" },
)

// The fixed whitelist of options shown on posts that are not yours:
// static List(boolean) = Arrays.asList(..., HIDE_OPTIONS, REPORT).
internal object NonOwnerOptionsWhitelistFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("Z"),
    custom = { method, _ ->
        val names = method.implementation?.instructions
            ?.mapNotNull { it.getReference<FieldReference>()?.takeIf { f -> f.type == MEDIA_OPTION }?.name }
            .orEmpty()
        AccessFlags.STATIC.isSet(method.accessFlags) && "REPORT" in names && "HIDE_OPTIONS" in names &&
            "SEE_MORE" in names
    },
)

// Any method of the story/highlight menu helper; only used to reach its class.
internal object StoryOptionsHelperFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.originalName() == "ReelOptionsOverflowHelper" },
)

/** Smali p-register of parameter [index] of a static method (wide types take two). */
private fun Method.pRegister(index: Int): Int =
    parameterTypes.take(index).sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

// Long-press on a profile's avatar: every avatar variant funnels into this handler
// (logs, then story peek or expanded picture). (avatarModel, headerViews, Function0).
internal object ProfileAvatarLongPressFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("hasPrideMediaReel"),
    custom = { method, _ ->
        method.parameterTypes.size == 3 && method.parameterTypes[2].toString() == "Lkotlin/jvm/functions/Function0;"
    },
)

// Reels viewer menu: the click handler every row of every variant calls with its option.
internal object ClipsOptionSelectedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(MEDIA_OPTION),
    custom = { method, _ -> method.hasStringEndingWith("ClipsOrganicMoreOptionsHelper_handleOptionSelected") },
)

// Reels viewer: opens any of its menu sheets with (anchor view, sheet builder, ...).
internal object ClipsSheetLaunchFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ -> method.hasStringEndingWith("ClipsOrganicMoreOptionsHelper_launchBottomSheet") },
)

internal object LabelResFingerprint : Fingerprint(
    definingClass = DOWNLOAD_CLASS,
    name = "labelRes",
)

internal object CarouselGetterNameFingerprint : Fingerprint(
    definingClass = DOWNLOAD_CLASS,
    name = "carouselGetter",
)

// Media's carousel_media getter: List(), reading the tree field keyed by the name's hashCode.
internal object MediaCarouselGetterFingerprint : Fingerprint(
    definingClass = MEDIA,
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            (it as? NarrowLiteralInstruction)?.narrowLiteral == "carousel_media".hashCode()
        } == true
    },
)

@Suppress("unused")
val downloadPatch = bytecodePatch(
    name = "Download media",
    description = "Adds Instagram's native Download item to every post's menu and saves the " +
        "original photo or video (current carousel slide) to Pictures/Oxbow or Movies/Oxbow.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        // 1. Add the DOWNLOAD row to every post's option list.
        PostOptionsBuilderFingerprint.method.apply {
            val insns = instructions.toList()
            val adder = insns.firstNotNullOf { it.getReference<MethodReference>()?.takeIf { r -> r.isRowAdder() } }
            val creatorType = adder.parameterTypes[2].toString()
            val castIndex = insns.indexOfFirst {
                it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == creatorType
            }
            val returns = insns.filter { it.opcode == Opcode.RETURN_OBJECT }
            if (castIndex < 0 || returns.size != 1) throw PatchException("Post options builder changed shape")
            val creatorReg = (insns[castIndex] as OneRegisterInstruction).registerA
            val listReg = (returns.single() as OneRegisterInstruction).registerA
            // The list must already be in its register when the creator is cast (it is created first).
            val listMade = insns.subList(0, castIndex).any {
                it.opcode == Opcode.MOVE_RESULT_OBJECT && (it as OneRegisterInstruction).registerA == listReg
            }
            if (!listMade || creatorReg > 15 || listReg > 15) throw PatchException("Post options builder registers changed")

            addInstructions(
                castIndex + 1,
                "invoke-static { v$creatorReg, v$listReg }, $DOWNLOAD_CLASS->addMenuItem(Ljava/lang/Object;Ljava/util/ArrayList;)V",
            )

            // Instagram's localized "Download" label: the string id loaded right after the
            // native row's sget-object DOWNLOAD.
            val downloadAt = insns.indexOfFirst { it.getReference<FieldReference>()?.name == "DOWNLOAD" }
            val labelRes = insns.drop(downloadAt).firstNotNullOfOrNull {
                (it as? NarrowLiteralInstruction)?.narrowLiteral?.takeIf { v -> v ushr 24 == 0x7f }
            } ?: throw PatchException("Download label id not found")
            LabelResFingerprint.method.addInstructions(0, "const v0, $labelRes\nreturn v0")
        }

        // Tell the extension how to reach carousel slides as full Media objects.
        CarouselGetterNameFingerprint.method.addInstructions(
            0,
            "const-string v0, \"${MediaCarouselGetterFingerprint.method.name}\"\nreturn-object v0",
        )

        // 3. Stories and highlights: their sheet rows are labels, dispatched by label text.
        val storyHelper = StoryOptionsHelperFingerprint.classDef
        val storyType = storyHelper.type
        var labelLists = 0
        var dispatchers = 0
        mutableClassDefBy(storyHelper).methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation == null) return@forEach
            val params = method.parameterTypes.map(CharSequence::toString)
            val freeLocals = method.implementation!!.registerCount - method.pRegister(params.size)
            when {
                // Label list for someone else's story: CharSequence[] (helper).
                method.returnType == "[Ljava/lang/CharSequence;" && params == listOf(storyType) -> {
                    method.instructions.filter { it.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { ret ->
                        val reg = (ret as OneRegisterInstruction).registerA
                        method.addInstructions(
                            ret.location.index,
                            """
                                invoke-static { v$reg }, $DOWNLOAD_CLASS->addStoryItem([Ljava/lang/CharSequence;)[Ljava/lang/CharSequence;
                                move-result-object v$reg
                            """,
                        )
                    }
                    labelLists++
                }
                // Row icon for a label: int (helper, CharSequence).
                method.returnType == "I" && params == listOf(storyType, "Ljava/lang/CharSequence;") && freeLocals >= 1 -> {
                    method.addInstructionsWithLabels(
                        0,
                        """
                            move-object/from16 v0, p1
                            invoke-static { v0 }, $DOWNLOAD_CLASS->storyIcon(Ljava/lang/CharSequence;)I
                            move-result v0
                            if-eqz v0, :instagram
                            return v0
                        """,
                        ExternalLabel("instagram", method.getInstruction(0)),
                    )
                }
                // Click dispatchers: void (..., helper, ..., CharSequence label).
                method.returnType == "V" && params.lastOrNull() == "Ljava/lang/CharSequence;" &&
                    storyType in params && freeLocals >= 2 -> {
                    val helperP = method.pRegister(params.indexOf(storyType))
                    val labelP = method.pRegister(params.size - 1)
                    method.addInstructionsWithLabels(
                        0,
                        """
                            move-object/from16 v0, p$helperP
                            move-object/from16 v1, p$labelP
                            invoke-static { v0, v1 }, $DOWNLOAD_CLASS->storyClick(Ljava/lang/Object;Ljava/lang/CharSequence;)Z
                            move-result v0
                            if-eqz v0, :instagram
                            return-void
                        """,
                        ExternalLabel("instagram", method.getInstruction(0)),
                    )
                    dispatchers++
                }
            }
        }
        if (labelLists == 0 || dispatchers == 0) {
            throw PatchException("Story menu hooks: $labelLists label lists, $dispatchers dispatchers")
        }

        // 4. Profile pictures: long-press the avatar on someone's profile.
        ProfileAvatarLongPressFingerprint.method.apply {
            val getUserId = instructions.firstOrNull {
                it.getReference<MethodReference>()?.let { r ->
                    r.name == "getUserId" && r.parameterTypes.isEmpty() && r.returnType == "Ljava/lang/String;"
                } == true
            } ?: throw PatchException("Avatar long-press: no getUserId call")
            val invoke = if (getUserId.opcode == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"
            val sessionField = classDefBy(definingClass).fields.singleOrNull {
                it.type == "Lcom/instagram/common/session/UserSession;"
            } ?: throw PatchException("Avatar long-press: no single UserSession field")
            if (freeLocals() < 2) throw PatchException("Avatar long-press: registers")
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p1
                    $invoke { v0 }, ${getUserId.getReference<MethodReference>()}
                    move-result-object v0
                    move-object/from16 v1, p0
                    iget-object v1, v1, $sessionField
                    invoke-static { v1, v0 }, $DOWNLOAD_CLASS->profileAvatarLongPress(Ljava/lang/Object;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :instagram
                    return-void
                """,
                ExternalLabel("instagram", getInstruction(0)),
            )
        }

        // 5. Reels viewer (reels opened from DMs, search...): add a Download row to its sheets...
        ClipsSheetLaunchFingerprint.method.apply {
            if (parameterTypes.size < 2 || AccessFlags.STATIC.isSet(accessFlags)) {
                throw PatchException("Reels sheet launch: unexpected signature")
            }
            addInstructions(
                0,
                "invoke-static/range { p0 .. p2 }, $DOWNLOAD_CLASS->addClipsRow(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }
        // ...and handle Instagram's own Download row, when a variant shows one.
        ClipsOptionSelectedFingerprint.method.apply {
            val fields = classDefBy(definingClass).fields
            val activityField = fields.singleOrNull { it.type == FRAGMENT_ACTIVITY }
            val mediaField = fields.singleOrNull { it.type == MEDIA }
            if (activityField == null || mediaField == null || freeLocals() < 3) {
                throw PatchException("Reels menu click: unexpected helper shape")
            }
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    iget-object v1, v0, $activityField
                    iget-object v2, v0, $mediaField
                    move-object/from16 v0, p1
                    invoke-static { v1, v2, v0 }, $DOWNLOAD_CLASS->clipsOption(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :instagram
                    return-void
                """,
                ExternalLabel("instagram", getInstruction(0)),
            )
        }

        // 1b. Let it through the whitelist Instagram applies to other people's posts.
        NonOwnerOptionsWhitelistFingerprint.method.apply {
            instructions.filter { it.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { ret ->
                val reg = (ret as OneRegisterInstruction).registerA
                addInstructions(
                    ret.location.index,
                    """
                        invoke-static { v$reg }, $DOWNLOAD_CLASS->allowInMenu(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$reg
                    """,
                )
            }
        }

        // 2. Handle a tap on DOWNLOAD before Instagram's own (watermarking, opt-in only) flow.
        val helper = FeedOverflowClickFingerprint.classDef
        val activityField = helper.fields.singleOrNull { it.type == FRAGMENT_ACTIVITY }
            ?: throw PatchException("Overflow helper: expected one FragmentActivity field")
        val mediaGetter = helper.methods.firstOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == MEDIA &&
                it.parameterTypes.map(CharSequence::toString) == listOf(helper.type)
        } ?: throw PatchException("Overflow helper: no static Media getter")

        // The helper is built once per menu, and its creator copies the on-screen carousel
        // slide into one of its int fields straight from the feed item's state:
        //   iget vX, <state>-><index>:I ... iput vX, <helper>-><field>:I
        // An int copied from a parameter (the feed position) has no such iget.
        var indexField: FieldReference? = null
        classDefForEach { classDef ->
            if (indexField != null) return@classDefForEach
            classDef.methods.forEach { method ->
                val insns = method.implementation?.instructions?.toList() ?: return@forEach
                if (insns.none { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == helper.type }) return@forEach
                insns.forEachIndexed { i, insn ->
                    val put = insn.getReference<FieldReference>()
                    if (insn.opcode != Opcode.IPUT || put?.definingClass != helper.type) return@forEachIndexed
                    val src = (insn as TwoRegisterInstruction).registerA
                    val producer = insns.subList(0, i).lastOrNull { (it as? OneRegisterInstruction)?.registerA == src }
                    if (producer?.opcode == Opcode.IGET) indexField = put
                }
            }
        }

        FeedOverflowClickFingerprint.method.apply {
            val locals = implementation!!.registerCount - parameterTypes.size - 1
            if (locals < 4) throw PatchException("Overflow click handler has only $locals free registers")
            val loadIndex = indexField?.let { "iget v3, v0, $it" } ?: "const/4 v3, -0x1"

            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p1
                    invoke-static { v0 }, $DOWNLOAD_CLASS->isOurs(Ljava/lang/Object;)Z
                    move-result v1
                    if-eqz v1, :instagram
                    move-object/from16 v0, p0
                    iget-object v1, v0, $activityField
                    invoke-static { v0 }, $mediaGetter
                    move-result-object v2
                    $loadIndex
                    move-object/from16 v0, p1
                    invoke-static { v0, v1, v2, v3 }, $DOWNLOAD_CLASS->feedClick(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/Object;I)V
                    return-void
                """,
                ExternalLabel("instagram", getInstruction(0)),
            )
        }
    }
}
