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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FEED_IMAGE_VIEWER = "Lcom/zing/zalo/social/presentation/view_full/photo/FeedImageViewer;"
private const val PHOTO_MENU_DATA =
    "Lcom/zing/zalo/social/features/menu_feed/model/BottomSheetMenuBundleDataPhotoViewfull;"
private const val VIDEO_ACTION_SHEET = "Lcom/zing/zalo/shortvideo/ui/component/bts/VideoActionBottomSheet;"
private const val VIDEO_ACTION_ITEM = "Lok7;" // obfuscated row model, 26.11.01 only (see ZaloVideoSave.ITEM)

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

@Suppress("unused")
val saveMediaPatch = bytecodePatch(
    name = "Save media",
    description = "Adds Save to Gallery for profile avatar, profile cover, Story and Zalo Video.",
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
        check(ViewerMoreMenuFingerprint.matchAll(1..1).size == 1)
        check(ViewerFriendFlagFingerprint.matchAll(1..1).size == 1)
        check(StoryMenuBuilderFingerprint.matchAll(1..1).size == 1)
        check(VideoActionSheetBuildFingerprint.matchAll(1..1).size == 1)
        check(VideoActionSheetClickFingerprint.matchAll(1..1).size == 1)

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

        // 3a. Zalo Video: append the Save row after the list is built (extension builds the obfuscated row model).
        val build = VideoActionSheetBuildFingerprint.method
        val resultMatch = VideoActionSheetBuildFingerprint.instructionMatches[1]
        val listReg = resultMatch.getInstruction<OneRegisterInstruction>().registerA
        build.addInstructions(resultMatch.index + 1, """
            invoke-static {p0, v$listReg}, $ZALO_VIDEO_SAVE->addItem(Ljava/lang/Object;Ljava/util/ArrayList;)V
        """.trimIndent())

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
    }
}
