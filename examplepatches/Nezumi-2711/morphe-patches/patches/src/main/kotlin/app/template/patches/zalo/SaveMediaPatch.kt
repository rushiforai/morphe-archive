package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderPackedSwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FEED_IMAGE_VIEWER = "Lcom/zing/zalo/social/presentation/view_full/photo/FeedImageViewer;"
private const val PHOTO_MENU_DATA =
    "Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;"
private const val MENU_BUNDLE_DATA = "Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleData;"
private const val FEED_MENU_SHEET = "Lcom/zing/zalo/social/features/menu_feed/BottomSheetMenuView;"
private const val ITEM_ALBUM_MOBILE = "Lcom/zing/zalo/control/ItemAlbumMobile;"
private const val VIDEO_ACTION_SHEET = "Lcom/zing/zalo/shortvideo/ui/component/bts/VideoActionBottomSheet;"
private const val VIDEO_ACTION_ITEM = "Lok7;" // obfuscated row model, 26.11.01 only (see ZaloVideoSave.ITEM)
private const val SHORT_VIDEO_ENTITY = "Lcom/zing/zalo/shortvideo/domain/entity"
private const val SHORT_VIDEO_CONTENT = "$SHORT_VIDEO_ENTITY/content/Content;"

// FeedImageViewer.f8(): the "..." menu. The first instruction reads the prevent-screenshot flag (r3) and
// diverts to a report-only menu when set.
private object ViewerMoreMenuFingerprint : Fingerprint(
    definingClass = FEED_IMAGE_VIEWER,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
        newInstance(PHOTO_MENU_DATA),
    ),
)

// FeedImageViewer.y8(String): builds the full menu bundle; the 7th iput-boolean is the "owner is friend" field `l`.
private object ViewerFriendFlagFingerprint : Fingerprint(
    definingClass = FEED_IMAGE_VIEWER,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        newInstance(PHOTO_MENU_DATA),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = PHOTO_MENU_DATA, type = "Z"),
    ),
)

// Story "..." menu builder (sld.Q(lc2)): the only method with "report_zvideo_story". The insertion point is the
// `sget-object nc2.Companion` that starts the plain "Report" item of someone else's story.
private object StoryMenuBuilderFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("L"),
    filters = listOf(
        string("report_zvideo_story"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = "Companion"),
        fieldAccess(opcode = Opcode.SGET, name = "zds_ic_warning_line_24"),
        fieldAccess(opcode = Opcode.SGET, name = "str_bottom_sheet_menu_report_title"),
    ),
)

// BottomSheetMenuView.j5(Bundle): builds the feed photo/video "..." sheet (type 6 = FeedImageViewer,
// type 7 = feed video player). The four bundle keys are read once each, in this order.
private object FeedMenuSheetBuildFingerprint : Fingerprint(
    definingClass = FEED_MENU_SHEET,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("EXTRA_BUNDLE_DATA"),
        string("EXTRA_DATA_RETAIN_KEY"),
        string("bundleData"),
        string("hiddenAreaHeight"),
    ),
)

// BottomSheetMenuView.V6(nc2): row click of the feed "..." sheet (all menu types). The two setting strings occur
// once each in the class.
private object FeedMenuItemClickFingerprint : Fingerprint(
    definingClass = FEED_MENU_SHEET,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        string("setting_hide_ad"),
        string("setting_on_off_notification"),
    ),
)

// VideoActionBottomSheet.z6(): builds the row list (oqz.D -> ArrayList) right before rendering it.
private object VideoActionSheetBuildFingerprint : Fingerprint(
    definingClass = VIDEO_ACTION_SHEET,
    returnType = "Landroid/view/View;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(returnType = "Ljava/util/ArrayList;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, InstructionLocation.MatchAfterImmediately()),
    ),
)

// VideoActionBottomSheet.x2(ok7): row click dispatch.
private object VideoActionSheetClickFingerprint : Fingerprint(
    definingClass = VIDEO_ACTION_SHEET,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(opcode(Opcode.INVOKE_INTERFACE)),
)

// c1s.l(c1s, Content, b59, i66): Zalo Video share/long-press gate. `share_via_action_mode` (dev pref, -1 by default)
// == 0 jumps to the native VideoActionBottomSheet result; otherwise the server ShareConfig action opens the Zinstant
// sheet. yz8/j08 (debug UI) also use the string but have different signatures.
private object ShortVideoShareSheetGateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", SHORT_VIDEO_CONTENT, "L", "L"),
    filters = listOf(
        string("share_via_action_mode"),
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getInt"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, InstructionLocation.MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "$SHORT_VIDEO_ENTITY/config/UserConfig;"),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "$SHORT_VIDEO_ENTITY/config/ShareConfig;"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "$SHORT_VIDEO_ENTITY/config/ShareConfig;",
            type = "$SHORT_VIDEO_ENTITY/Action;",
        ),
    ),
)

@Suppress("unused")
val saveMediaPatch = bytecodePatch(
    name = "Save media",
    description = "Adds Save to Gallery for profile avatar, profile cover, Story, Zalo Video, feed videos, and post videos and photos.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        registerApplied(PatchId.SAVE_MEDIA)
        check(ViewerMoreMenuFingerprint.matchAll(1..1).size == 1)
        check(ViewerFriendFlagFingerprint.matchAll(1..1).size == 1)
        check(StoryMenuBuilderFingerprint.matchAll(1..1).size == 1)
        check(VideoActionSheetBuildFingerprint.matchAll(1..1).size == 1)
        check(VideoActionSheetClickFingerprint.matchAll(1..1).size == 1)
        check(FeedMenuSheetBuildFingerprint.matchAll(1..1).size == 1)
        check(ShortVideoShareSheetGateFingerprint.matchAll(1..1).size == 1)
        check(FeedMenuItemClickFingerprint.matchAll(1..1).size == 1)

        // 1a. Avatar/cover gate A: f8() index 0 is `iget-boolean vX, this, r3`; neutralise it for the menu choice only.
        val moreMenu = ViewerMoreMenuFingerprint.method
        val moreMatches = ViewerMoreMenuFingerprint.instructionMatches
        check(moreMatches[0].index == 0)
        val preventFlag = moreMenu.getInstruction<TwoRegisterInstruction>(0)
        check(preventFlag.opcode == Opcode.IGET_BOOLEAN)
        moreMenu.addInstructions(1, """
            invoke-static {v${preventFlag.registerA}}, $SAVE_MEDIA->allowProtectedMenu(Z)Z
            move-result v${preventFlag.registerA}
        """.trimIndent())

        // 1b. Gate B: the 7th iput-boolean into the menu bundle is field `l` (owner is friend).
        val friendMethod = ViewerFriendFlagFingerprint.method
        val friendIndex = ViewerFriendFlagFingerprint.instructionMatches[7].index
        val friendPut = friendMethod.getInstruction<TwoRegisterInstruction>(friendIndex)
        val friendRef = (friendPut as ReferenceInstruction).reference as FieldReference
        check(friendRef.name == "l" && friendRef.definingClass == PHOTO_MENU_DATA)
        // Re-store after the original iput; the value register is dead afterwards in y8.
        friendMethod.addInstructions(friendIndex + 1, """
            invoke-static {v${friendPut.registerA}}, $SAVE_MEDIA->treatAsFriend(Z)Z
            move-result v${friendPut.registerA}
            iput-boolean v${friendPut.registerA}, v${friendPut.registerB}, $friendRef
        """.trimIndent())

        // 2. Story: native Download item (id 36), cloned from the own-story block, for stories of others.
        val story = StoryMenuBuilderFingerprint.method
        val storyMatches = StoryMenuBuilderFingerprint.instructionMatches
        val insertAt = storyMatches[1].index
        check(storyMatches[2].index == insertAt + 1 && storyMatches[3].index == insertAt + 2)
        check(story.implementation!!.registerCount >= 18)
        val instructions = story.implementation!!.instructions.toList()
        val companionRef = (instructions[insertAt] as ReferenceInstruction).reference.toString()
        fun fieldNamed(name: String): String {
            val matches = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
                .filter { it.name == name }.map { it.toString() }.distinct()
            check(matches.size == 1) { "field $name: $matches" }
            return matches.single()
        }
        val downloadIcon = fieldNamed("ic_bottom_sheet_story_download")
        val downloadTitle = fieldNamed("str_bottom_sheet_story_download_tittle")
        val itemFactoryIndex = (insertAt until instructions.size).first {
            instructions[it].opcode == Opcode.INVOKE_STATIC_RANGE
        }
        val itemFactory = (instructions[itemFactoryIndex] as ReferenceInstruction).reference as MethodReference
        check(itemFactory.parameterTypes.size == 10 && itemFactory.returnType.startsWith("L"))
        // v2 = list, v3 = Context, v5 = story item (uwo); v8..v17 are dead on this path.
        val reportItem = story.getInstruction<ReferenceInstruction>(insertAt)
        story.addInstructionsWithLabels(insertAt, """
            invoke-static {v5}, $SAVE_MEDIA->canSaveStory(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :nezumi_no_story_save
            sget-object v8, $companionRef
            sget v10, $downloadIcon
            sget v0, $downloadTitle
            invoke-virtual {v3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
            move-result-object v11
            const/16 v9, 0x24
            const/4 v12, 0x0
            const/4 v13, 0x0
            const/4 v14, 0x0
            const/4 v15, 0x0
            const/16 v16, 0x0
            const/16 v17, 0x1f0
            invoke-static/range {v8 .. v17}, $itemFactory
            move-result-object v0
            invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        """.trimIndent(), ExternalLabel("nezumi_no_story_save", reportItem as com.android.tools.smali.dexlib2.iface.instruction.Instruction))

        // 2b. Story diagnostics (no behavior change): right after `move-result vEmoji` of the emoji-status check
        // (z920.c(uwo)) in the prologue of sld.Q, log the flags that pick the menu branch. Read-only registers:
        // v4 = own (kvr.t()), v9 = ads (kvr.g == 2), v6 = Zalo Video story (kvr.g == 3), vEmoji, v5 = uwo.
        run {
            val storyInstructions = story.implementation!!.instructions.toList()
            val storyItemCall = storyInstructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.parameterTypes.isEmpty() && ref.returnType == "Luwo;"
                    }
            }
            check(storyItemCall in 1 until insertAt) { "story item getter not found" }
            val storyReg = (storyInstructions[storyItemCall + 1] as OneRegisterInstruction).registerA
            check(storyInstructions[storyItemCall + 1].opcode == Opcode.MOVE_RESULT_OBJECT && storyReg == 5)
            val emojiCall = storyInstructions[storyItemCall + 2]
            check(emojiCall.opcode == Opcode.INVOKE_STATIC)
            val emojiRef = (emojiCall as ReferenceInstruction).reference as MethodReference
            check(emojiRef.returnType == "Z" && emojiRef.parameterTypes.map { it.toString() } == listOf("Luwo;"))
            val emojiResult = storyInstructions[storyItemCall + 3]
            check(emojiResult.opcode == Opcode.MOVE_RESULT)
            val emojiReg = (emojiResult as OneRegisterInstruction).registerA
            // The prologue sets v4 (own) by move-result and v9/v6 by moves, then branches on v4 right after.
            val ownBranch = storyInstructions.drop(storyItemCall + 4).first { it.opcode == Opcode.IF_EQZ }
            check((ownBranch as OneRegisterInstruction).registerA == 4)
            val prologue = storyInstructions.subList(0, storyItemCall)
            check(prologue.any { it.opcode == Opcode.MOVE && (it as OneRegisterInstruction).registerA == 9 })
            check(prologue.any { it.opcode == Opcode.MOVE && (it as OneRegisterInstruction).registerA == 6 })
            story.addInstructions(storyItemCall + 4, """
                invoke-static {v4, v9, v6, v$emojiReg, v5}, $SAVE_MEDIA->logStoryMenu(ZZZZLjava/lang/Object;)V
            """.trimIndent())
        }

        // 4. Feed photo/video sheet (BottomSheetMenuView.j5). Both windows are resolved on the original
        // instruction list and patched from the highest index down.
        val sheet = FeedMenuSheetBuildFingerprint.method
        val sheetInstructions = sheet.implementation!!.instructions.toList()
        fun fieldName(index: Int): String? =
            ((sheetInstructions.getOrNull(index) as? ReferenceInstruction)?.reference as? FieldReference)?.name
        fun isPhotoMenuFlag(index: Int): Boolean {
            val instruction = sheetInstructions.getOrNull(index) ?: return false
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return false
            return instruction.opcode == Opcode.IGET_BOOLEAN && ref.definingClass == PHOTO_MENU_DATA
        }

        // 4a. Type 7 window: iget-boolean vP, vData, PhotoViewfull->p ; if-eqz vP ; if-eqz vOwn ;
        //     sget-object Companion ; sget ic_bottom_sheet_menu_download ; sget str_bottom_sheet_menu_video_download
        val videoWindows = sheetInstructions.indices.filter { i ->
            isPhotoMenuFlag(i) &&
                sheetInstructions.getOrNull(i + 1)?.opcode == Opcode.IF_EQZ &&
                sheetInstructions.getOrNull(i + 2)?.opcode == Opcode.IF_EQZ &&
                sheetInstructions[i + 3].opcode == Opcode.SGET_OBJECT && fieldName(i + 3) == "Companion" &&
                sheetInstructions[i + 4].opcode == Opcode.SGET && fieldName(i + 4) == "ic_bottom_sheet_menu_download" &&
                sheetInstructions[i + 5].opcode == Opcode.SGET && fieldName(i + 5) == "str_bottom_sheet_menu_video_download"
        }
        check(videoWindows.size == 1) { "feed video owner gate: $videoWindows" }
        val videoFlag = videoWindows.single()
        val progressiveReg = (sheetInstructions[videoFlag] as TwoRegisterInstruction).registerA
        check((sheetInstructions[videoFlag + 1] as OneRegisterInstruction).registerA == progressiveReg)
        val ownerGate = videoFlag + 2
        val videoDownloadStart = sheetInstructions[videoFlag + 3]
        // The `p` register is dead here: the download block and the fall-through both overwrite it
        // (sget vP, str_bottom_sheet_menu_video_download / str_reportabuse) before any read.
        check((sheetInstructions[videoFlag + 5] as OneRegisterInstruction).registerA == progressiveReg)

        // 4b. Type 6 a=0 window: move ; if-nez own-flags ; if-nez friend-flags ; if-nez vVideoOther ;
        //     if-nez vNoMedia ; move ; goto ; move. Patch before the third if-nez.
        val albumWindows = sheetInstructions.indices.filter { i ->
            i + 7 < sheetInstructions.size &&
                sheetInstructions[i].opcode == Opcode.MOVE &&
                (1..4).all { sheetInstructions[i + it].opcode == Opcode.IF_NEZ } &&
                sheetInstructions[i + 5].opcode == Opcode.MOVE &&
                sheetInstructions[i + 6].opcode == Opcode.GOTO &&
                sheetInstructions[i + 7].opcode == Opcode.MOVE
        }
        check(albumWindows.size == 1) { "album video gate: $albumWindows" }
        val albumGate = albumWindows.single() + 3
        val mediaTypeReads = sheetInstructions.indices.filter { i ->
            sheetInstructions[i].opcode == Opcode.IGET &&
                ((sheetInstructions[i] as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == ITEM_ALBUM_MOBILE && it.name == "a"
                }
        }
        check(mediaTypeReads.size == 1 && mediaTypeReads.single() < albumGate) { "media type read: $mediaTypeReads" }
        check(albumGate > ownerGate)
        check(
            (albumGate until minOf(albumGate + 80, sheetInstructions.size)).any { fieldName(it) == "ic_bottom_sheet_menu_download" }
        ) { "album gate not followed by the download item" }
        val videoOtherReg = (sheetInstructions[albumGate] as OneRegisterInstruction).registerA
        val menuDataRead = (mediaTypeReads.single() until albumGate).last { isPhotoMenuFlag(it) }
        val menuDataReg = (sheetInstructions[menuDataRead] as TwoRegisterInstruction).registerB
        check((menuDataRead + 1 until albumGate).none {
            sheetInstructions[it].opcode.setsRegister() &&
                (sheetInstructions[it] as? OneRegisterInstruction)?.registerA == menuDataReg
        }) { "menu data register v$menuDataReg overwritten before the album gate" }

        // 5a. Post "..." sheet video save (Target 7), Hook A: menu types 1 (Newsfeed/Timeline, sld.R), 3 (post detail,
        // sld.O), 4 (profile timeline, inline) and 5 (mutual feed, inline). Each branch starts with
        // `iget-object vH, vData, BundleData->b:hc2 ; iput-object vH, vState, yc2->i:hc2` and ends with
        // `iput-object vList, vState, yc2->h:List` followed by the method's return-void, so every register other than
        // the ones read here is dead at the insertion point. These branches sit above both type 6/7 edit points
        // (resolved on the same original list), so they are patched first, highest index down.
        run {
            fun labeled(index: Int) = (sheetInstructions[index] as BuilderInstruction).location.labels.isNotEmpty()
            fun ref(index: Int) = (sheetInstructions[index] as? ReferenceInstruction)?.reference
            fun writes(index: Int, reg: Int) = sheetInstructions[index].let {
                it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == reg
            }

            // Java pins in PostVideoSave: row class nc2, factory mc2.a(mc2, I, I, String, String, Z, Drawable, String, ly8, I).
            check(sheetInstructions.any { i ->
                i.opcode == Opcode.SGET_OBJECT && (i as ReferenceInstruction).reference.toString() == "Lnc2;->Companion:Lmc2;"
            }) { "nc2.Companion not found in j5" }
            check(sheetInstructions.any { i ->
                i.opcode == Opcode.INVOKE_STATIC_RANGE && (i as ReferenceInstruction).reference.toString() ==
                    "Lmc2;->a(Lmc2;IILjava/lang/String;Ljava/lang/String;ZLandroid/graphics/drawable/Drawable;Ljava/lang/String;Lly8;I)Lnc2;"
            }) { "mc2.a row factory not found in j5" }
            val iconRef = (ref(videoFlag + 4) as FieldReference).also { check(it.type == "I") }.toString()

            // The menu-type switch: packed-switch over BundleData.a with keys 1..11.
            val switchIndex = sheetInstructions.indices.single { i ->
                sheetInstructions[i].opcode == Opcode.PACKED_SWITCH &&
                    ((sheetInstructions[i] as BuilderOffsetInstruction).target.location.instruction as? BuilderPackedSwitchPayload)
                        ?.switchElements?.map { it.key } == (1..11).toList()
            }
            val switchReg = (sheetInstructions[switchIndex] as OneRegisterInstruction).registerA
            val typeRead = (0 until switchIndex).last { writes(it, switchReg) }
            check(sheetInstructions[typeRead].opcode == Opcode.IGET &&
                (ref(typeRead) as FieldReference).let { it.definingClass == MENU_BUNDLE_DATA && it.name == "a" }) {
                "menu switch is not over BundleData.a"
            }
            val payload = (sheetInstructions[switchIndex] as BuilderOffsetInstruction).target.location.instruction
                as BuilderPackedSwitchPayload

            data class PostHook(val type: Int, val at: Int, val smali: String)
            val hooks = listOf(1, 3, 4, 5).map { type ->
                val start = payload.switchElements.single { it.key == type }.target.location.index
                val readData = sheetInstructions[start] as TwoRegisterInstruction
                val dataRef = ref(start) as FieldReference
                check(readData.opcode == Opcode.IGET_OBJECT && dataRef.definingClass == MENU_BUNDLE_DATA && dataRef.name == "b") {
                    "type $type: branch does not start with BundleData.b"
                }
                val selectedType = dataRef.type
                val storeData = sheetInstructions[start + 1] as TwoRegisterInstruction
                val selectedRef = ref(start + 1) as FieldReference
                check(storeData.opcode == Opcode.IPUT_OBJECT && storeData.registerA == readData.registerA &&
                    selectedRef.type == selectedType) { "type $type: selection not stored into the sheet state" }
                val stateType = selectedRef.definingClass
                val stateReg = storeData.registerB
                val listStore = (start + 2 until sheetInstructions.size).first { i ->
                    sheetInstructions[i].opcode == Opcode.IPUT_OBJECT &&
                        (ref(i) as FieldReference).let { it.definingClass == stateType && it.type == "Ljava/util/List;" }
                }
                val store = sheetInstructions[listStore] as TwoRegisterInstruction
                check(store.registerB == stateReg) { "type $type: list stored into another object" }
                check((start + 2 until listStore).none { writes(it, stateReg) }) { "type $type: v$stateReg overwritten" }
                val listReg = store.registerA
                // The branch returns right after storing the list (directly or via goto -> return-void).
                val next = sheetInstructions[listStore + 1]
                val exit = when (next.opcode) {
                    Opcode.RETURN_VOID -> next
                    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> (next as BuilderOffsetInstruction).target.location.instruction
                    else -> error("type $type: branch does not end after the list store (${next.opcode})")
                }
                check(exit?.opcode == Opcode.RETURN_VOID) { "type $type: branch exit is not return-void" }
                // Insert where every path of the branch passes: before the store when nothing jumps to it, else
                // right after it (types 4/5 jump to a label on the store).
                val at = if (!labeled(listStore)) listStore else listStore + 1
                check(!labeled(at)) { "type $type: insertion point $at is a branch target" }

                val smali = if (type == 1) {
                    // move-result-object vList right after sld.R(a99, feedId, flag); a99/feedId come from the call.
                    val call = listStore - 2
                    val callRef = ref(call) as MethodReference
                    check(sheetInstructions[call].opcode == Opcode.INVOKE_VIRTUAL && callRef.returnType == "Ljava/util/List;" &&
                        callRef.parameterTypes.map { it.toString() }.let {
                            it.size == 3 && it[0].startsWith("L") && it[1] == "Ljava/lang/String;" && it[2] == "Z"
                        }) { "type 1: sld.R call not found before the list store" }
                    check(sheetInstructions[call + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                        (sheetInstructions[call + 1] as OneRegisterInstruction).registerA == listReg && at == listStore)
                    val invoke = sheetInstructions[call] as FiveRegisterInstruction
                    val groupReg = invoke.registerD
                    val idReg = invoke.registerE
                    check(listReg != groupReg && listReg != idReg)
                    // Provenance: group = hc2.b (a99), id = hc2.c (String), both read from the selection in this branch.
                    fun readsSelection(reg: Int, fieldType: String) = (start + 2 until call).any { i ->
                        sheetInstructions[i].opcode == Opcode.IGET_OBJECT &&
                            (sheetInstructions[i] as TwoRegisterInstruction).registerA == reg &&
                            (ref(i) as FieldReference).let { it.definingClass == selectedType && it.type == fieldType }
                    }
                    check(readsSelection(groupReg, callRef.parameterTypes[0].toString()) && readsSelection(idReg, "Ljava/lang/String;")) {
                        "type 1: feed group/id registers do not come from the selection"
                    }
                    // vState is still read by the list store that follows the insertion point.
                    val scratch = (0..15).first { it !in setOf(listReg, groupReg, idReg, stateReg) }
                    check(maxOf(listReg, groupReg, idReg) <= 15)
                    """
                        sget v$scratch, $iconRef
                        invoke-static {v$listReg, v$groupReg, v$idReg, v$scratch}, $POST_VIDEO_SAVE->addForFeed(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;I)V
                    """.trimIndent()
                } else {
                    // The post (ze9) is the selection's `d` field, which this branch itself reads.
                    val postRefs = (start + 2 until listStore).mapNotNull { i ->
                        if (sheetInstructions[i].opcode != Opcode.IGET_OBJECT) return@mapNotNull null
                        (ref(i) as FieldReference).takeIf { it.definingClass == selectedType && it.name == "d" }
                    }.map { it.toString() }.distinct()
                    check(postRefs.size == 1) { "type $type: post field reads $postRefs" }
                    val (postReg, iconReg, typeReg) = (0..15).filter { it != listReg && it != stateReg }.take(3)
                    check(maxOf(listReg, stateReg) <= 15)
                    // The menu type (3/4/5) is passed for the photo-row diagnostics (more_photo per surface).
                    """
                        iget-object v$postReg, v$stateReg, $selectedRef
                        iget-object v$postReg, v$postReg, ${postRefs.single()}
                        sget v$iconReg, $iconRef
                        const/4 v$typeReg, $type
                        invoke-static {v$listReg, v$postReg, v$iconReg, v$typeReg}, $POST_VIDEO_SAVE->addForPost(Ljava/util/List;Ljava/lang/Object;II)V
                    """.trimIndent()
                }
                PostHook(type, at, smali)
            }
            check(hooks.map { it.at }.distinct().size == hooks.size && hooks.all { it.at > albumGate }) {
                "post menu hooks overlap the type 6/7 edits: ${hooks.map { it.at }}"
            }
            hooks.sortedByDescending { it.at }.forEach { sheet.addInstructions(it.at, it.smali) }
        }

        sheet.addInstructions(albumGate, """
            invoke-static {v$videoOtherReg, v$menuDataReg}, $SAVE_MEDIA->allowAlbumVideo(ZLjava/lang/Object;)Z
            move-result v$videoOtherReg
        """.trimIndent())

        sheet.addInstructionsWithLabels(ownerGate, """
            invoke-static {}, $SAVE_MEDIA->unlockFeedVideoDownload()Z
            move-result v$progressiveReg
            if-nez v$progressiveReg, :nezumi_feed_video_download
        """.trimIndent(), ExternalLabel("nezumi_feed_video_download", videoDownloadStart))

        // 3a. Zalo Video: append the Save row after the list is built (extension builds the obfuscated row model).
        val build = VideoActionSheetBuildFingerprint.method
        val resultMatch = VideoActionSheetBuildFingerprint.instructionMatches[1]
        val listReg = resultMatch.getInstruction<OneRegisterInstruction>().registerA
        build.addInstructions(resultMatch.index + 1, """
            invoke-static {p0, v$listReg}, $ZALO_VIDEO_SAVE->addItem(Ljava/lang/Object;Ljava/util/ArrayList;)V
        """.trimIndent())

        // 3c. Zalo Video long-press (b59.SHARE_MORE): take the native-sheet branch (target of `if-eqz vMode`) when
        // the video has an mp4 or HLS link, so the sheet that carries the Save row opens instead of the Zinstant one.
        run {
            val gate = ShortVideoShareSheetGateFingerprint.method
            val gateMatches = ShortVideoShareSheetGateFingerprint.instructionMatches
            val impl = gate.implementation!!
            val gateInstructions = impl.instructions.toList()
            check(impl.registerCount == 21) { "c1s.l register count ${impl.registerCount}" }
            val kindType = gate.parameterTypes[2].toString()

            val modeReg = gateMatches[2].getInstruction<OneRegisterInstruction>().registerA
            val branchIndex = gateMatches[3].index
            val branch = gate.getInstruction<OneRegisterInstruction>(branchIndex)
            check(branch.opcode == Opcode.IF_EQZ && branch.registerA == modeReg)
            val nativeLocation = gate.getInstruction<BuilderOffsetInstruction>(branchIndex).target.location
            val nativeTarget = nativeLocation.instruction!!
            val nativeIndex = nativeLocation.index
            // Native branch: const/4 vX, 0x0 ; new-instance w0s ; invoke-direct w0s.<init>(Z, k86, d4e) ; return-object.
            check(nativeIndex > branchIndex && nativeTarget.opcode == Opcode.CONST_4)
            check(gateInstructions[nativeIndex + 1].opcode == Opcode.NEW_INSTANCE)
            val nativeInit = (gateInstructions[nativeIndex + 2] as ReferenceInstruction).reference as MethodReference
            check(gateInstructions[nativeIndex + 2].opcode == Opcode.INVOKE_DIRECT && nativeInit.name == "<init>" &&
                nativeInit.parameterTypes.firstOrNull()?.toString() == "Z")
            check(gateInstructions[nativeIndex + 3].opcode == Opcode.RETURN_OBJECT)

            // Provenance: v0 = p1 (Content), v1 = p2 (b59) at method start (p1 = v18, p2 = v19 with 21 registers).
            fun movedParam(index: Int, reg: Int, param: Int) {
                val move = gateInstructions[index]
                check(move.opcode == Opcode.MOVE_OBJECT_FROM16 && (move as TwoRegisterInstruction).registerA == reg &&
                    move.registerB == impl.registerCount - 4 + param) { "c1s.l prologue[$index]" }
            }
            movedParam(1, 0, 1)
            movedParam(2, 1, 2)
            // The k86 header is built from v0 (Content) on the fresh-call path that reaches the gate; from there
            // to the gate nothing writes v0 or v1.
            val headerInit = (0 until branchIndex).last { i ->
                gateInstructions[i].opcode == Opcode.INVOKE_DIRECT &&
                    ((gateInstructions[i] as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.name == "<init>" && ref.parameterTypes.map { it.toString() }.drop(1) ==
                            listOf("Ljava/lang/String;", SHORT_VIDEO_CONTENT, "Z") && ref.parameterTypes.size == 4
                    }
            }
            check((gateInstructions[headerInit] as FiveRegisterInstruction).registerF == 0) { "Content not in v0" }
            check((headerInit + 1 until branchIndex).none { i ->
                gateInstructions[i].opcode.setsRegister() &&
                    (gateInstructions[i] as? OneRegisterInstruction)?.registerA.let { it == 0 || it == 1 }
            }) { "v0/v1 overwritten before the share gate" }
            // After the gate the original code compares v1 against b59.SHARE_PERSONAL.
            val sharePersonal = (branchIndex until nativeIndex).first { i ->
                gateInstructions[i].opcode == Opcode.SGET_OBJECT &&
                    ((gateInstructions[i] as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == kindType && it.name == "SHARE_PERSONAL"
                    }
            }
            val personalReg = (gateInstructions[sharePersonal] as OneRegisterInstruction).registerA
            val compare = gateInstructions[sharePersonal + 1]
            check(compare.opcode == Opcode.IF_NE && (compare as TwoRegisterInstruction).registerA == 1 &&
                compare.registerB == personalReg) { "b59 not in v1" }
            // vMode is dead on the fall-through (next write: move-result after IAction.isValid()) and the native
            // branch does not read it.
            check((branchIndex + 1 until gateMatches[6].index).none { i ->
                gateInstructions[i].let { it is OneRegisterInstruction && it.registerA == modeReg } ||
                    (gateInstructions[i] as? TwoRegisterInstruction)?.registerB == modeReg ||
                    (gateInstructions[i] as? FiveRegisterInstruction)?.let {
                        modeReg in listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG)
                            .take(it.registerCount)
                    } == true
            }) { "v$modeReg used between the gate and ShareConfig.a" }

            gate.addInstructionsWithLabels(branchIndex + 1, """
                invoke-static {v1, v0}, $ZALO_VIDEO_SAVE->forceNativeSheet(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v$modeReg
                if-nez v$modeReg, :nezumi_native_sheet
            """.trimIndent(), ExternalLabel("nezumi_native_sheet", nativeTarget))
        }

        // 5b. Post "..." sheet, Hook B: BottomSheetMenuView.V6(nc2) entry. Our row closes the sheet without storing
        // yc2.m, so the menu result carries id 0 and the host ignores it.
        run {
            val click = FeedMenuItemClickFingerprint.method
            val impl = click.implementation!!
            val clickInstructions = impl.instructions.toList()
            check(click.parameterTypes.map { it.toString() } == listOf("Lnc2;")) { "V6 parameter ${click.parameterTypes}" }
            check(impl.registerCount == 13) { "V6 register count ${impl.registerCount}" }
            val first = clickInstructions[0]
            check(first.opcode == Opcode.INVOKE_VIRTUAL &&
                ((first as ReferenceInstruction).reference as MethodReference).name == "getClass" &&
                (first as FiveRegisterInstruction).registerC == impl.registerCount - 1) { "V6 does not start with p1.getClass()" }
            // v0 is first written by the move-result-object of U6() before any read.
            check(clickInstructions[1].opcode == Opcode.INVOKE_VIRTUAL &&
                clickInstructions[2].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (clickInstructions[2] as OneRegisterInstruction).registerA == 0) { "V6 prologue changed" }
            val closeRef = clickInstructions.mapNotNull { i ->
                if (i.opcode != Opcode.INVOKE_VIRTUAL) return@mapNotNull null
                ((i as ReferenceInstruction).reference as MethodReference).takeIf {
                    it.name == "close" && it.parameterTypes.isEmpty() && it.returnType == "V"
                }?.toString()
            }.distinct().single()
            click.addInstructionsWithLabels(0, """
                invoke-static {p0, p1}, $POST_VIDEO_SAVE->onClick(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :nezumi_post_menu_native
                invoke-virtual {p0}, $closeRef
                return-void
            """.trimIndent(), ExternalLabel("nezumi_post_menu_native", first))
        }

        // 3b. Zalo Video: intercept our row's click before the native dispatcher.
        val click = VideoActionSheetClickFingerprint.method
        check(click.parameterTypes.map { it.toString() } == listOf(VIDEO_ACTION_ITEM))
        check(click.implementation!!.registerCount >= 3)
        val clickFirst = click.implementation!!.instructions.first()
        click.addInstructionsWithLabels(0, """
            invoke-static {p0, p1}, $ZALO_VIDEO_SAVE->onItemClick(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :nezumi_native_click
            return-void
        """.trimIndent(), ExternalLabel("nezumi_native_click", clickFirst))

        registerHooks(PatchId.SAVE_MEDIA, moreMenu, friendMethod, story, sheet, build,
            ShortVideoShareSheetGateFingerprint.method, FeedMenuItemClickFingerprint.method, click)
    }
}
