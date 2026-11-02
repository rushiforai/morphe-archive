package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * A Save row in the menu you get by holding a voice message (#123). In current chats that hold goes to a bar of a few rows
 * and a More sheet, and the row goes in the sheet as it's made, since the row model that sheet holds says what the message
 * is. Older screens still build a MenuDialogParams from a list with the message in a Bundle, so the row goes in there too.
 * Tapping it runs Messenger's own voice download and keeps the file where Save voice messages you play keeps its copies.
 */
internal const val SAVE_VOICE_MENU = "save_voice_menu"
internal const val SAVE_VOICE_MENU_HOST = "Lapp/hushmessenger/extension/SaveVoiceMenu;"
internal const val SAVE_VOICE_MENU_ROWS = "$SAVE_VOICE_MENU_HOST->rows(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;"
internal const val SAVE_VOICE_MENU_CLICKED = "$SAVE_VOICE_MENU_HOST->clicked(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"
internal const val SAVE_VOICE_MENU_ROW = "$SAVE_VOICE_MENU_HOST->row(Ljava/lang/CharSequence;I)Ljava/lang/Object;"
internal const val SAVE_VOICE_MENU_ROW_ID = "$SAVE_VOICE_MENU_HOST->rowId(Ljava/lang/Object;)I"
internal const val SAVE_VOICE_MENU_IS_VOICE = "$SAVE_VOICE_MENU_HOST->isVoice(Ljava/lang/Object;)Z"
internal const val SAVE_VOICE_MENU_SESSION = "$SAVE_VOICE_MENU_HOST->session(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val SAVE_VOICE_MENU_FETCH = "$SAVE_VOICE_MENU_HOST->fetch(Ljava/lang/Object;Ljava/lang/Object;)Landroid/net/Uri;"
internal const val SAVE_VOICE_MENU_SHEET_ROW = "$SAVE_VOICE_MENU_HOST->sheetRow(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val SAVE_VOICE_MENU_SHEET_CLICKED = "$SAVE_VOICE_MENU_HOST->sheetClicked(Ljava/lang/Object;Ljava/lang/Object;)Z"
internal const val SAVE_VOICE_MENU_ADD_ROW = "$SAVE_VOICE_MENU_HOST->addRow(Ljava/lang/Object;Ljava/lang/Object;)Z"
internal const val SAVE_VOICE_MENU_HELD = "$SAVE_VOICE_MENU_HOST->held(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val SAVE_VOICE_MENU_SHEET_SESSION = "$SAVE_VOICE_MENU_HOST->sheetSession(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val SAVE_VOICE_MENU_VOICE_URI = "$SAVE_VOICE_MENU_HOST->voiceUri(Ljava/lang/Object;)Landroid/net/Uri;"
internal const val SAVE_VOICE_MENU_FETCH_URI = "$SAVE_VOICE_MENU_HOST->fetchUri(Ljava/lang/Object;Landroid/net/Uri;)Landroid/net/Uri;"
internal val SAVE_VOICE_MENU_STUBS = listOf(SAVE_VOICE_MENU_ROW, SAVE_VOICE_MENU_ROW_ID, SAVE_VOICE_MENU_IS_VOICE, SAVE_VOICE_MENU_SESSION, SAVE_VOICE_MENU_FETCH,
    SAVE_VOICE_MENU_ADD_ROW, SAVE_VOICE_MENU_HELD, SAVE_VOICE_MENU_SHEET_SESSION, SAVE_VOICE_MENU_VOICE_URI, SAVE_VOICE_MENU_FETCH_URI)

internal const val MENU_PARAMS = "Lcom/facebook/messaging/dialog/MenuDialogParams;"
internal const val MENU_ITEM = "Lcom/facebook/messaging/dialog/MenuDialogItem;"
internal const val MENU_AUDIO_DATA = "Lcom/facebook/messaging/attachments/AudioAttachmentData;"
private const val COPY_OF_LIST = "Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;"
private const val LIST = "Ljava/util/List;"
private const val OBJECT = "Ljava/lang/Object;"
private const val MENU_URI = "Landroid/net/Uri;"
/** The name the chat's menu handler gives its work, which only its tap method says. */
internal const val MENU_TAP_NAME = "ThreadItemContextMenuHandler"
/** Where the menu's Bundle keeps the message. */
internal const val MENU_ROW_MESSAGE = "rowMessage"
/** The tag of Messenger's own Save video row, whose icon and tag this row borrows. */
internal const val MENU_SAVE_VIDEO = "save_video"
internal const val MENU_FRAGMENT = "Lcom/facebook/messaging/dialog/MenuDialogFragment;"
/** The dialog tag only the held message's More sheet uses. */
internal const val MORE_SHEET_TAG = "MORE_ACTION_DRAWER_MENU_DIALOG_TAG"
/** Kotlin's cast message where Messenger takes a held message as a voice message, naming the class R8 renamed. */
internal const val AUDIO_MESSAGE_CAST = "null cannot be cast to non-null type com.facebook.xapp.messaging.threadview.model.audio.AudioMessage"

/** Everything this build calls the pieces the extension's stubs are written from. References are smali, ready to use. */
internal class SaveVoiceMenuRecipe(
    val rows: Method,
    val tap: Method,
    val builder: String,
    val builderId: String,
    val builderTitle: String,
    val builderIcon: String,
    val builderTag: String,
    val itemId: String,
    val icon: Int,
    val tapHandler: String,
    val handler: String,
    val session: String,
    val fetcher: String,
    val prefetcher: String,
    val holder: String,
    val holderGet: String,
    val reader: String,
    val classifier: String,
    val classify: String,
    val audioKind: String,
    val readAudio: String,
    val audioUri: String,
    val request: String,
    val download: String,
    val sheet: Method,
    val sheetTap: Method,
    val sheetBuilder: String,
    val addRow: String,
    val sheetTapClass: String,
    val sheetField: String,
    val heldField: String,
    val sheetClass: String,
    val sheetSession: String,
    val holdClass: String,
    val rowModel: String,
    val audioMessage: String,
    val audioMessageUri: String,
)

internal var saveVoiceMenuRecipe: SaveVoiceMenuRecipe? = null

private fun Instruction.menuRef() = (this as? ReferenceInstruction)?.reference
private fun Instruction.menuField() = menuRef() as? FieldReference
private fun Instruction.menuCall() = menuRef() as? MethodReference
private fun Instruction.menuString() = (menuRef() as? StringReference)?.string
private fun Method.menuCode() = implementation?.instructions?.toList().orEmpty()
private fun MethodReference.menuParams() = parameterTypes.map { it.toString() }
private fun Instruction.menuArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private class MenuRowsSite(val copy: Int, val list: Int, val source: Int, val scratch: Int, val extra: String)

/**
 * MenuDialogParams' constructor from its builder: it reads the builder's row list straight into its one ImmutableList copy,
 * and the copy's result register holds nothing yet, so it's free for the Bundle before then. Null for anything else.
 */
private fun Method.menuRowsSite(): MenuRowsSite? {
    val params = menuParams()
    if (definingClass != MENU_PARAMS || name != "<init>" || params.size != 1 || params[0].startsWith("Landroid")) return null
    val code = menuCode()
    val copy = code.indices.singleOrNull { code[it].menuRef()?.toString() == COPY_OF_LIST } ?: return null
    if (copy == 0 || copy + 1 >= code.size) return null
    val read = code[copy - 1]
    val rows = read.menuField() ?: return null
    if (read.opcode != Opcode.IGET_OBJECT || rows.definingClass != params[0] || rows.type != LIST) return null
    val list = (read as TwoRegisterInstruction).registerA
    val source = read.registerB
    if (code[copy].menuArgs() != listOf(list) || code[copy + 1].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val scratch = (code[copy + 1] as OneRegisterInstruction).registerA
    if (scratch == list || scratch == source || scratch > 15) return null
    val extra = code.filter {
        it.opcode == Opcode.IGET_OBJECT && it.menuField()?.definingClass == params[0] && it.menuField()?.type == OBJECT &&
            (it as TwoRegisterInstruction).registerB == source
    }.map { it.menuRef().toString() }.distinct().singleOrNull() ?: return null
    return MenuRowsSite(copy, list, source, scratch, extra)
}

private class MenuTapSite(val start: Int, val scratch: Int, val first: Int, val tapHandler: String, val handler: String)

/**
 * The chat menu's tap method: an instance (item, extra) method that names [MENU_TAP_NAME] and reads the Bundle's message.
 * The name's const-string comes before any of its work, and its register is free since the const-string writes it. The
 * parameters must still hold what they came with there, and the next thing the method reads off itself is its handler.
 */
private fun Method.menuTapSite(): MenuTapSite? {
    if (returnType != "Z" || AccessFlags.STATIC.isSet(accessFlags) || menuParams() != listOf(MENU_ITEM, OBJECT)) return null
    val code = menuCode()
    val start = code.indices.singleOrNull { code[it].menuString() == MENU_TAP_NAME } ?: return null
    if (code.none { it.menuString() == MENU_ROW_MESSAGE }) return null
    val scratch = (code[start] as? OneRegisterInstruction)?.registerA ?: return null
    val first = implementation!!.registerCount - 3
    if (first < 0 || scratch >= first || scratch > 15) return null
    val written = code.take(start).any { it.opcode.setsRegister() && it is OneRegisterInstruction && it.registerA in first..first + 2 }
    if (written) return null
    val read = (start until code.size).firstOrNull {
        code[it].opcode == Opcode.IGET_OBJECT && code[it].menuField()?.definingClass == definingClass && code[it].menuField()?.type == OBJECT
    } ?: return null
    val cast = code.getOrNull(read + 1) ?: return null
    if (cast.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != (code[read] as TwoRegisterInstruction).registerA) return null
    return MenuTapSite(start, scratch, first, code[read].menuRef().toString(), cast.menuRef().toString())
}

private class MoreSheetSite(val at: Int, val builder: Int, val hold: Int, val builderType: String)

/**
 * The held message's More sheet: an instance method of four parameters that names [MORE_SHEET_TAG] and makes the one builder
 * it hands to MenuDialogParams. Just after the builder's constructor the sheet is still empty. The last parameter, what's
 * being held, was copied to a low register before then, and that copy must still hold it there.
 */
private fun Method.moreSheetSite(): MoreSheetSite? {
    if (returnType != "V" || AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 4) return null
    val code = menuCode()
    if (code.none { it.menuString() == MORE_SHEET_TAG }) return null
    val params = code.filter { it.opcode == Opcode.INVOKE_DIRECT && it.menuCall()?.definingClass == MENU_PARAMS && it.menuCall()?.name == "<init>" }
        .singleOrNull()?.menuCall() ?: return null
    val builderType = params.menuParams().singleOrNull() ?: return null
    val made = code.indices.singleOrNull { code[it].opcode == Opcode.NEW_INSTANCE && code[it].menuRef()?.toString() == builderType } ?: return null
    if (made + 2 >= code.size) return null
    val builder = (code[made] as OneRegisterInstruction).registerA
    val start = code[made + 1]
    if (start.opcode != Opcode.INVOKE_DIRECT || start.menuRef()?.toString() != "$builderType-><init>()V" || start.menuArgs() != listOf(builder)) return null
    val last = implementation!!.registerCount - 1
    val copy = code.indices.firstOrNull { code[it].opcode == Opcode.MOVE_OBJECT_FROM16 && (code[it] as TwoRegisterInstruction).registerB == last } ?: return null
    if (copy >= made) return null
    val hold = (code[copy] as TwoRegisterInstruction).registerA
    if (hold == builder || hold > 15 || builder > 15) return null
    val overwritten = code.subList(copy + 1, made).any {
        it is OneRegisterInstruction && (it.opcode.setsRegister() && it.registerA == hold || it.opcode.setsWideRegister() && it.registerA + 1 == hold)
    }
    if (overwritten) return null
    return MoreSheetSite(made + 2, builder, hold, builderType)
}

/**
 * A More sheet's tap method: an instance (item, extra) method that reads the row's id and hands the tap on to a listener of
 * four parameters. It has a local to spare for the answer, and the local holds nothing at the method's start.
 */
private fun Method.sheetTapFirstParameter(): Int? {
    if (returnType != "Z" || AccessFlags.STATIC.isSet(accessFlags) || menuParams() != listOf(MENU_ITEM, OBJECT)) return null
    val first = (implementation?.registerCount ?: return null) - 3
    if (first < 1) return null
    val code = menuCode()
    val readsId = code.any { it.opcode == Opcode.IGET && it.menuField()?.definingClass == MENU_ITEM && it.menuField()?.type == "I" }
    val handsOn = code.any { it.opcode == Opcode.INVOKE_INTERFACE && it.menuCall()?.returnType == "V" && it.menuCall()?.parameterTypes?.size == 4 }
    return first.takeIf { readsId && handsOn }
}

/**
 * This build's recipe, or null when any piece of it doesn't read as expected. Nothing here is guessed from a name: each
 * piece comes from the Messenger code that uses it, and every class and member the stubs name must be public, since they
 * reach it from the extension.
 */
internal fun resolveSaveVoiceMenu(classes: Iterable<ClassDef>): SaveVoiceMenuRecipe? {
    val byType = classes.associateBy { it.type }
    fun isPublic(flags: Int) = AccessFlags.PUBLIC.isSet(flags)
    fun openClass(type: String) = byType[type]?.let { isPublic(it.accessFlags) } == true
    fun openField(field: FieldReference, write: Boolean = false) = byType[field.definingClass]?.takeIf { isPublic(it.accessFlags) }?.fields
        ?.any { it.name == field.name && it.type == field.type && isPublic(it.accessFlags) && (!write || !AccessFlags.FINAL.isSet(it.accessFlags)) } == true
    fun openMethod(call: MethodReference, static: Boolean) = byType[call.definingClass]?.takeIf { isPublic(it.accessFlags) }?.methods
        ?.any { it.name == call.name && it.returnType == call.returnType && it.menuParams() == call.menuParams() && isPublic(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static } == true
    fun openConstructor(type: String, vararg params: String) = byType[type]?.takeIf { isPublic(it.accessFlags) }?.methods
        ?.any { it.name == "<init>" && it.menuParams() == params.toList() && isPublic(it.accessFlags) } == true

    val rows = byType[MENU_PARAMS]?.methods?.singleOrNull { it.menuRowsSite() != null } ?: return null
    val taps = classes.flatMap { cls -> cls.methods.filter { it.returnType == "Z" && it.menuTapSite() != null } }
    val tap = taps.singleOrNull() ?: return null
    val tapSite = tap.menuTapSite()!!

    // The handler keeps the account the tap's download runs for.
    val handler = byType[tapSite.handler] ?: return null
    val session = handler.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == FB_USER_SESSION } ?: return null
    if (!isPublic(handler.accessFlags) || !isPublic(session.accessFlags) || !openClass(tap.definingClass)) return null
    val tapField = tap.menuCode().firstNotNullOfOrNull { i -> i.menuField()?.takeIf { it.toString() == tapSite.tapHandler } } ?: return null
    if (!openField(tapField)) return null

    // MenuDialogItem's constructor reads its builder in a fixed order: title resource, id, icon, then two more ints.
    val item = byType[MENU_ITEM]?.methods?.singleOrNull { it.name == "<init>" && it.menuParams().size == 1 && !it.menuParams()[0].startsWith("Landroid") } ?: return null
    val builder = item.menuParams()[0]
    if (!isPublic(item.accessFlags) || !openClass(MENU_ITEM) || !openConstructor(builder)) return null
    val itemCode = item.menuCode()
    val ints = itemCode.indices.filter { itemCode[it].opcode == Opcode.IGET && itemCode[it].menuField()?.definingClass == builder }
    if (ints.size != 5) return null
    val idStore = itemCode.getOrNull(ints[1] + 1) ?: return null
    if (idStore.opcode != Opcode.IPUT || idStore.menuField()?.definingClass != MENU_ITEM || idStore.menuField()?.type != "I") return null
    fun builderRead(type: String) = itemCode.filter { it.opcode == Opcode.IGET_OBJECT && it.menuField()?.definingClass == builder && it.menuField()?.type == type }
        .singleOrNull()?.menuField()
    val builderId = itemCode[ints[1]].menuField()!!
    val builderIcon = itemCode[ints[2]].menuField()!!
    val builderTitle = builderRead("Ljava/lang/CharSequence;") ?: return null
    val builderTag = builderRead("Ljava/lang/String;") ?: return null
    if (listOf(builderId, builderIcon, builderTitle, builderTag).any { !openField(it, write = true) } || !openField(idStore.menuField()!!)) return null

    // The icon is the constant Save video's row stores in the builder's icon field.
    val saveRow = classes.flatMap { cls -> cls.methods.filter { it.returnType == MENU_ITEM && it.menuCode().any { i -> i.menuString() == MENU_SAVE_VIDEO } } }.singleOrNull() ?: return null
    val saveCode = saveRow.menuCode()
    val iconStore = saveCode.indexOfFirst { it.opcode == Opcode.IPUT && it.menuRef()?.toString() == builderIcon.toString() }
    if (iconStore < 1) return null
    val iconLoad = saveCode[iconStore - 1]
    if ((iconLoad.opcode != Opcode.CONST && iconLoad.opcode != Opcode.CONST_HIGH16) ||
        (iconLoad as OneRegisterInstruction).registerA != (saveCode[iconStore] as TwoRegisterInstruction).registerA) return null
    val icon = (iconLoad as NarrowLiteralInstruction).narrowLiteral

    // The download, the class that holds it, and the one field of that class whose type reads voice messages for the prefetch.
    val download = findSaveVoice(classes).singleOrNull() ?: return null
    val fetcher = byType[download.definingClass] ?: return null
    val request = download.menuParams()[2]
    if (!openConstructor(fetcher.type) || !openConstructor(request, "Z", MENU_URI) || !isPublic(download.accessFlags) || !isPublic(fetcher.accessFlags)) return null
    val prefetchers = fetcher.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.mapNotNull { field ->
        byType[field.type]?.methods?.singleOrNull { it.isAudioPrefetch() }?.let { field to it }
    }
    val (prefetcherField, prefetch) = prefetchers.singleOrNull() ?: return null
    if (!isPublic(prefetcherField.accessFlags) || !openClass(prefetcherField.type)) return null
    val prefetchCode = prefetch.menuCode()
    val holderField = prefetchCode[0].menuField()!!
    val holderGet = prefetchCode[1].menuCall()!!
    val reader = prefetchCode[3].menuRef().toString()
    val readAudio = prefetchCode[5].menuCall()!!
    val audioUri = prefetchCode[8].menuField()!!
    if (!openField(holderField) || !openMethod(holderGet, static = true) || !openMethod(readAudio, static = false) || !openClass(MENU_AUDIO_DATA) || !openField(audioUri)) return null

    // The reader starts by asking its classifier the message's kind, and goes on only for the one kind that's audio.
    val readCode = byType[reader]?.methods?.singleOrNull { it.name == readAudio.name && it.menuParams() == readAudio.menuParams() }?.menuCode() ?: return null
    val classifierField = readCode.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.menuField()?.definingClass == reader }?.menuField() ?: return null
    val ask = readCode.indices.firstOrNull { i ->
        readCode[i].opcode == Opcode.INVOKE_VIRTUAL && readCode[i].menuCall()?.definingClass == classifierField.type &&
            readCode[i].menuCall()?.menuParams() == listOf(FB_USER_SESSION, MESSAGE)
    } ?: return null
    val kind = readCode[ask].menuCall()!!.returnType
    if (readCode.getOrNull(ask + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val audioKind = readCode.getOrNull(ask + 2)?.takeIf { it.opcode == Opcode.SGET_OBJECT }?.menuField()?.takeIf { it.type == kind } ?: return null
    // The classifier's session-free step, which its session-taking one calls. A row is added where no account is at hand.
    val classifier = byType[classifierField.type] ?: return null
    val classify = classifier.methods.singleOrNull {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == kind && it.menuParams() == listOf(classifier.type, MESSAGE)
    } ?: return null
    val asked = classifier.methods.singleOrNull { it.name == readCode[ask].menuCall()!!.name && it.menuParams() == listOf(FB_USER_SESSION, MESSAGE) } ?: return null
    if (asked.menuCode().none { it.opcode == Opcode.INVOKE_STATIC && it.menuCall()?.name == classify.name && it.menuCall()?.definingClass == classifier.type }) return null
    if (!openField(classifierField) || !isPublic(classifier.accessFlags) || !isPublic(classify.accessFlags) || !openField(audioKind)) return null
    if (!openClass(MESSAGE) || !openClass(kind)) return null

    // The More sheet, the builder it adds rows to, and the account it was given.
    val sheet = classes.flatMap { cls -> cls.methods.filter { it.moreSheetSite() != null } }.singleOrNull() ?: return null
    val sheetSite = sheet.moreSheetSite()!!
    val sheetClass = byType[sheet.definingClass] ?: return null
    val sheetSession = sheetClass.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == FB_USER_SESSION } ?: return null
    val addRow = byType[sheetSite.builderType]?.methods?.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && isPublic(it.accessFlags) && it.returnType == "V" && it.menuParams() == listOf(MENU_ITEM)
    } ?: return null
    if (!isPublic(sheetClass.accessFlags) || !isPublic(sheetSession.accessFlags) || !openClass(sheetSite.builderType)) return null

    // The sheet's tap is the object it stores on the dialog, whose (item, extra) method reads the sheet and the hold back.
    val sheetCode = sheet.menuCode()
    val tapTypes = sheetCode.indices.filter { sheetCode[it].opcode == Opcode.IPUT_OBJECT && sheetCode[it].menuField()?.definingClass == MENU_FRAGMENT }.mapNotNull { at ->
        val register = (sheetCode[at] as TwoRegisterInstruction).registerA
        sheetCode.subList(0, at).lastOrNull { it.opcode == Opcode.NEW_INSTANCE && (it as OneRegisterInstruction).registerA == register }?.menuRef()?.toString()
    }
    fun sheetTaps(type: String) = byType[type]?.methods?.filter { it.returnType == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) && it.menuParams() == listOf(MENU_ITEM, OBJECT) }.orEmpty()
    val sheetTapClass = tapTypes.distinct().singleOrNull { sheetTaps(it).isNotEmpty() } ?: return null
    val sheetTap = sheetTaps(sheetTapClass).singleOrNull()?.takeIf { it.sheetTapFirstParameter() != null } ?: return null
    if (!openClass(sheetTapClass)) return null
    val tapCode = sheetTap.menuCode()
    fun tapFieldCastTo(type: String) = tapCode.indices.filter {
        tapCode[it].opcode == Opcode.IGET_OBJECT && tapCode[it].menuField()?.definingClass == sheetTapClass && tapCode.getOrNull(it + 1)?.opcode == Opcode.CHECK_CAST &&
            tapCode[it + 1].menuRef()?.toString() == type && (tapCode[it + 1] as OneRegisterInstruction).registerA == (tapCode[it] as TwoRegisterInstruction).registerA
    }.map { tapCode[it].menuField()!! }.distinctBy { it.toString() }.singleOrNull()
    val sheetField = tapFieldCastTo(sheet.definingClass) ?: return null
    val heldField = tapFieldCastTo(sheet.menuParams()[3]) ?: return null
    if (!openField(sheetField) || !openField(heldField)) return null

    // The one place that takes a held message as a voice message says which row model that is, and the model's Uri is the sound.
    val caster = classes.flatMap { cls -> cls.methods.filter { m -> m.returnType == "V" && m.menuCode().any { it.menuString() == AUDIO_MESSAGE_CAST } } }.singleOrNull()?.menuCode() ?: return null
    val named = caster.indexOfFirst { it.menuString() == AUDIO_MESSAGE_CAST }
    val rowModel = caster.getOrNull(named - 1)?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.menuField() ?: return null
    if (sheetCode.none { it.opcode == Opcode.IGET_OBJECT && it.menuRef()?.toString() == rowModel.toString() }) return null
    val audioMessage = caster.drop(named + 1).take(4).firstOrNull { it.opcode == Opcode.CHECK_CAST }?.menuRef()?.toString() ?: return null
    val audioMessageUri = byType[audioMessage]?.fields?.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == MENU_URI } ?: return null
    if (!openField(rowModel) || !openClass(audioMessage) || !isPublic(audioMessageUri.accessFlags)) return null

    return SaveVoiceMenuRecipe(
        rows = rows, tap = tap,
        builder = builder, builderId = builderId.toString(), builderTitle = builderTitle.toString(), builderIcon = builderIcon.toString(),
        builderTag = builderTag.toString(), itemId = idStore.menuRef().toString(), icon = icon,
        tapHandler = tapSite.tapHandler, handler = tapSite.handler, session = "${handler.type}->${session.name}:$FB_USER_SESSION",
        fetcher = fetcher.type, prefetcher = "${fetcher.type}->${prefetcherField.name}:${prefetcherField.type}",
        holder = holderField.toString(), holderGet = holderGet.toString(), reader = reader, classifier = classifierField.toString(),
        classify = "${classifier.type}->${classify.name}(${classifier.type}$MESSAGE)$kind", audioKind = audioKind.toString(),
        readAudio = readAudio.toString(), audioUri = audioUri.toString(), request = request, download = download.hookId(),
        sheet = sheet, sheetTap = sheetTap, sheetBuilder = sheetSite.builderType, addRow = addRow.hookId(), sheetTapClass = sheetTapClass,
        sheetField = sheetField.toString(), heldField = heldField.toString(), sheetClass = sheetClass.type,
        sheetSession = "${sheetClass.type}->${sheetSession.name}:$FB_USER_SESSION", holdClass = rowModel.definingClass, rowModel = rowModel.toString(),
        audioMessage = audioMessage, audioMessageUri = "$audioMessage->${audioMessageUri.name}:$MENU_URI",
    )
}

/**
 * The fetcher's prefetch step, in the order the recipe reads it: the lazy holder off this, the reader out of it, the
 * reader's voice data for the session and message, then the data's Uri.
 */
private fun Method.isAudioPrefetch(): Boolean {
    if (returnType != "V" || menuParams() != listOf(FB_USER_SESSION, MESSAGE)) return false
    val code = menuCode()
    if (code.size < 9) return false
    val wanted = listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.IGET_OBJECT)
    if (code.take(9).map { it.opcode } != wanted) return false
    val holder = code[0].menuField()?.type ?: return false
    val get = code[1].menuCall() ?: return false
    val read = code[5].menuCall() ?: return false
    val reader = code[3].menuRef().toString()
    return get.definingClass == holder && get.menuParams() == listOf(holder) && get.returnType == OBJECT &&
        read.definingClass == reader && read.returnType == MENU_AUDIO_DATA && read.menuParams() == listOf(FB_USER_SESSION, MESSAGE, "Ljava/lang/String;") &&
        code[8].menuField()?.definingClass == MENU_AUDIO_DATA && code[8].menuField()?.type == MENU_URI
}

/** The older menu's constructor and tap, then the More sheet and its tap, or none when any piece of the recipe doesn't resolve. */
internal fun findSaveVoiceMenu(classes: Iterable<ClassDef>): List<Method> {
    saveVoiceMenuRecipe = resolveSaveVoiceMenu(classes)
    return saveVoiceMenuRecipe?.let { listOf(it.rows, it.tap, it.sheet, it.sheetTap) } ?: emptyList()
}

internal fun MutableMethod.validateSaveVoiceMenu() {
    if (menuRowsSite() == null && menuTapSite() == null && moreSheetSite() == null && sheetTapFirstParameter() == null)
        throw PatchException("Messenger controls: ${hookId()} isn't the chat menu's constructor or tap, or the More sheet or its tap")
}

/**
 * Hands each new menu's rows to the extension on their way into the menu, tells it about each new More sheet while it's
 * empty, and asks it first about each tap.
 */
internal fun MutableMethod.injectSaveVoiceMenu() {
    validateSaveVoiceMenu()
    val sheet = moreSheetSite()
    if (sheet != null) {
        addInstructions(sheet.at, "invoke-static {v${sheet.builder}, v${sheet.hold}}, $SAVE_VOICE_MENU_SHEET_ROW")
        return
    }
    val rows = menuRowsSite()
    if (rows != null) {
        addInstructions(rows.copy, """
            iget-object v${rows.scratch}, v${rows.source}, ${rows.extra}
            invoke-static {v${rows.list}, v${rows.scratch}}, $SAVE_VOICE_MENU_ROWS
            move-result-object v${rows.list}
        """.trimIndent())
        return
    }
    val tap = menuTapSite()
    if (tap == null) {
        val first = sheetTapFirstParameter()!!
        addInstructionsWithLabels(0, """
            invoke-static/range {v$first .. v${first + 1}}, $SAVE_VOICE_MENU_SHEET_CLICKED
            move-result v0
            if-eqz v0, :stock_tap
            const/4 v0, 0x1
            return v0
        """.trimIndent(), ExternalLabel("stock_tap", getInstruction(0)))
        return
    }
    addInstructionsWithLabels(tap.start, """
        invoke-static/range {v${tap.first} .. v${tap.first + 2}}, $SAVE_VOICE_MENU_CLICKED
        move-result v${tap.scratch}
        if-eqz v${tap.scratch}, :stock_tap
        const/4 v${tap.scratch}, 0x1
        return v${tap.scratch}
    """.trimIndent(), ExternalLabel("stock_tap", getInstruction(tap.start)))
}

/** One of the extension's stubs as shipped: static, not private, returning null, zero or false. */
internal fun MutableMethod.validateSaveVoiceMenuStub(id: String) {
    val code = menuCode()
    if (hookId() != id || !AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.PRIVATE.isSet(accessFlags) || code.size != 2 ||
        code[0].opcode != Opcode.CONST_4 || (code[1].opcode != Opcode.RETURN && code[1].opcode != Opcode.RETURN_OBJECT) ||
        (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 || implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the voice message Save row's extension stub changed")
}

/** The stub's replacement, written from this build's recipe. */
internal fun saveVoiceMenuBuilder(stub: MutableMethod, recipe: SaveVoiceMenuRecipe): MutableMethod {
    val id = stub.hookId()
    stub.validateSaveVoiceMenuStub(id)
    val (registers, body) = when (id) {
        SAVE_VOICE_MENU_ROW -> 4 to """
            new-instance v0, ${recipe.builder}
            invoke-direct {v0}, ${recipe.builder}-><init>()V
            iput p1, v0, ${recipe.builderId}
            iput-object p0, v0, ${recipe.builderTitle}
            const v1, ${recipe.icon}
            iput v1, v0, ${recipe.builderIcon}
            const-string v1, "$MENU_SAVE_VIDEO"
            iput-object v1, v0, ${recipe.builderTag}
            new-instance v1, $MENU_ITEM
            invoke-direct {v1, v0}, $MENU_ITEM-><init>(${recipe.builder})V
            return-object v1
        """
        SAVE_VOICE_MENU_ROW_ID -> 2 to """
            check-cast p0, $MENU_ITEM
            iget v0, p0, ${recipe.itemId}
            return v0
        """
        SAVE_VOICE_MENU_SESSION -> 2 to """
            check-cast p0, ${recipe.tap.definingClass}
            iget-object v0, p0, ${recipe.tapHandler}
            check-cast v0, ${recipe.handler}
            iget-object v0, v0, ${recipe.session}
            return-object v0
        """
        SAVE_VOICE_MENU_IS_VOICE -> 3 to """
            new-instance v0, ${recipe.fetcher}
            invoke-direct {v0}, ${recipe.fetcher}-><init>()V
            iget-object v0, v0, ${recipe.prefetcher}
            iget-object v0, v0, ${recipe.holder}
            invoke-static {v0}, ${recipe.holderGet}
            move-result-object v0
            check-cast v0, ${recipe.reader}
            iget-object v0, v0, ${recipe.classifier}
            check-cast p0, $MESSAGE
            invoke-static {v0, p0}, ${recipe.classify}
            move-result-object v0
            sget-object v1, ${recipe.audioKind}
            if-ne v0, v1, :other
            const/4 v0, 0x1
            return v0
            :other
            const/4 v0, 0x0
            return v0
        """
        SAVE_VOICE_MENU_FETCH -> 6 to """
            new-instance v0, ${recipe.fetcher}
            invoke-direct {v0}, ${recipe.fetcher}-><init>()V
            iget-object v1, v0, ${recipe.prefetcher}
            iget-object v1, v1, ${recipe.holder}
            invoke-static {v1}, ${recipe.holderGet}
            move-result-object v1
            check-cast v1, ${recipe.reader}
            check-cast p0, $FB_USER_SESSION
            check-cast p1, $MESSAGE
            const/4 v2, 0x0
            invoke-virtual {v1, p0, p1, v2}, ${recipe.readAudio}
            move-result-object v1
            if-eqz v1, :none
            iget-object v1, v1, ${recipe.audioUri}
            if-eqz v1, :none
            new-instance v2, ${recipe.request}
            const/4 v3, 0x0
            invoke-direct {v2, v3, v1}, ${recipe.request}-><init>(Z$MENU_URI)V
            invoke-static {p0, v0, v2}, ${recipe.download}
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """
        SAVE_VOICE_MENU_ADD_ROW -> 3 to """
            check-cast p0, ${recipe.sheetBuilder}
            check-cast p1, $MENU_ITEM
            invoke-virtual {p0, p1}, ${recipe.addRow}
            const/4 v0, 0x1
            return v0
        """
        SAVE_VOICE_MENU_HELD -> 2 to """
            check-cast p0, ${recipe.sheetTapClass}
            iget-object v0, p0, ${recipe.heldField}
            return-object v0
        """
        SAVE_VOICE_MENU_SHEET_SESSION -> 2 to """
            check-cast p0, ${recipe.sheetTapClass}
            iget-object v0, p0, ${recipe.sheetField}
            check-cast v0, ${recipe.sheetClass}
            iget-object v0, v0, ${recipe.sheetSession}
            return-object v0
        """
        SAVE_VOICE_MENU_VOICE_URI -> 3 to """
            instance-of v0, p0, ${recipe.holdClass}
            if-eqz v0, :none
            check-cast p0, ${recipe.holdClass}
            iget-object v0, p0, ${recipe.rowModel}
            instance-of v1, v0, ${recipe.audioMessage}
            if-eqz v1, :none
            check-cast v0, ${recipe.audioMessage}
            iget-object v0, v0, ${recipe.audioMessageUri}
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """
        SAVE_VOICE_MENU_FETCH_URI -> 5 to """
            new-instance v0, ${recipe.fetcher}
            invoke-direct {v0}, ${recipe.fetcher}-><init>()V
            check-cast p0, $FB_USER_SESSION
            new-instance v1, ${recipe.request}
            const/4 v2, 0x0
            invoke-direct {v1, v2, p1}, ${recipe.request}-><init>(Z$MENU_URI)V
            invoke-static {p0, v0, v1}, ${recipe.download}
            move-result-object v0
            return-object v0
        """
        else -> throw PatchException("Messenger controls: the voice message Save row has no stub $id")
    }
    val built = stub.emptyCopy(registers)
    built.addInstructionsWithLabels(0, body.trimIndent())
    return built
}
