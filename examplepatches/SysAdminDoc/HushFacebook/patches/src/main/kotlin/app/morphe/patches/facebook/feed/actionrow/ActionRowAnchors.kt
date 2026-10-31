/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.actionrow

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.downloads.video.GRAPHQL_STORY
import app.morphe.patches.facebook.downloads.video.IMMUTABLE_LIST
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsNaming
import app.morphe.patches.facebook.feed.refresh.enumConstant
import app.morphe.util.writersReaching
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * The tag Facebook's own Save item carries, loaded in its case of the item builder. Up to 584 the
 * row was found by "XFBUFIButtonWithFallbackOptions", which only its type list loaded (584 `LX/36P;->A06`).
 * 585 (arm64 `LX/03E8;`, read 2026-10-29) dropped that literal from the type list, which now holds
 * no string at all, while the item builder (`A01`) still loads "Save" in Save's case, so the row is
 * found from the item builder.
 */
internal const val SAVE_TAG = "Save"

internal const val LIST = "Ljava/util/List;"
internal const val MAP = "Ljava/util/Map;"
internal const val STRING = "Ljava/lang/String;"
internal const val OBJECT = "Ljava/lang/Object;"
internal const val CONTEXT = "Landroid/content/Context;"
internal const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"

/**
 * Where Facebook builds the row of buttons under a post, and what an item of the row is made of.
 *
 * One class lists the row's button types ([types]: a static method answering a List), builds the
 * item of one type ([item]: static, taking the type enum, which names SAVE, the row's state and a
 * Map, the one whose cases load [SAVE_TAG]), and builds the row from both ([items]). The item
 * builder is found first; the type list is the one static List method of its class that the row
 * builder calls beside it. Save's case of [item] shows how an item is put together: an icon from Facebook's icon
 * enum and a style enum, two texts holding the icon, a label holding the text and the click (a
 * Function1), a tag, and the item's constructor taking those among nulls.
 */
internal class ActionRow(
    val owner: String,
    val types: Method,
    val items: Method,
    val item: Method,
    /** The type enum's SAVE constant, as a field reference. */
    val save: String,
    /** The row state's Context field, and its field holding the post's holder. */
    val state: String,
    val stateContext: String,
    val statePost: String,
    /** The holder's field holding the post. */
    val postValue: String,
    val download: String,
    val outline: String,
    val iconInit: MethodReference,
    val textInit: MethodReference,
    /** Which of the text's parameters takes the icon; the String takes the words, the rest null. */
    val textIcon: Int,
    val labelInit: MethodReference,
    val tagInit: MethodReference,
    val itemInit: MethodReference,
)

/** Finds the [ActionRow] of this build. Throws naming what moved. */
internal fun BytecodePatchContext.actionRow(): ActionRow {
    // "Save" is a common literal, so the item builder is the static (type, state, Map) holder of it
    // whose type enum names a SAVE button.
    val item = methodsNaming(SAVE_TAG) {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.size == 3 &&
            it.parameterTypes[2].toString() == MAP && holdsString(it, SAVE_TAG)
    }.filter { method ->
        classDefByOrNull(method.parameterTypes[0].toString())?.let { enumConstant(it, "SAVE") } != null
    }.distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes}" }.singleOrNull()
        ?: refuse("no single static (type, state, Map) item builder loading \"$SAVE_TAG\" with a type naming SAVE")
    val owner = item.definingClass
    val ownerClass = classDefBy(owner)
    val typeEnum = item.parameterTypes[0].toString()
    val state = item.parameterTypes[1].toString()

    // The row builder calls the item builder and the type list, the class's one static List method it calls.
    val lists = ownerClass.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == LIST && it.implementation != null
    }
    val builders = ownerClass.methods.mapNotNull { method ->
        val calls = method.code().mapNotNull { it.methodReference() }
        if (calls.none { it.matches(item) }) return@mapNotNull null
        lists.filter { list -> calls.any { it.matches(list) } }.singleOrNull()?.let { method to it }
    }
    val (items, types) = builders.singleOrNull()
        ?: refuse("$owner has no single method building the row from ${item.name} and one static List method, found ${builders.size}")

    val save = enumConstant(classDefBy(typeEnum), "SAVE") ?: refuse("$typeEnum names no SAVE button")

    // ---- the row state's fields, read the way the item builder reads them ---------------------
    val stateContext = classDefBy(state).fields.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == CONTEXT
    }.singleOrNull() ?: refuse("$state has no single Context field")
    val code = item.code()
    val cast = code.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.typeReference() == GRAPHQL_STORY }
    if (cast < 0) refuse("${item.name} never reads the post")
    val valueAt = (cast - 1 downTo maxOf(0, cast - 6)).firstOrNull {
        code[it].opcode == Opcode.IGET_OBJECT && code[it].fieldReference()?.type == OBJECT
    } ?: refuse("${item.name} reads the post from no Object field")
    val postValue = code[valueAt].fieldReference()!!
    val holderAt = (valueAt - 1 downTo maxOf(0, valueAt - 6)).firstOrNull {
        val field = code[it].fieldReference()
        code[it].opcode == Opcode.IGET_OBJECT && field?.definingClass == state && field.type == postValue.definingClass
    } ?: refuse("${item.name} reads the post's holder from no field of $state")

    // ---- how an item is made, from the calls the builder makes --------------------------------
    val inits = code.filter { it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE }
        .mapNotNull { it.methodReference() }.filter { it.name == "<init>" }
    fun one(what: String, wanted: (MethodReference) -> Boolean): MethodReference {
        val found = inits.filter(wanted).distinctBy { it.toString() }
        return found.singleOrNull() ?: refuse("${item.name} makes ${found.size} kinds of $what: ${found.joinToString()}")
    }

    var download: String? = null
    var outline: String? = null
    val iconInit = one("icon") { init ->
        val parameters = init.parameters()
        if (parameters.size != 3) return@one false
        val icons = classDefByOrNull(parameters[0])?.let { enumConstant(it, "DOWNLOAD") } ?: return@one false
        val styles = classDefByOrNull(parameters[1])?.let { enumConstant(it, "OUTLINE") } ?: return@one false
        download = icons
        outline = styles
        true
    }
    val iconClass = classDefBy(iconInit.definingClass)
    val iconTypes = setOf(iconClass.type) + iconClass.interfaces + listOfNotNull(iconClass.superclass)

    val textInit = one("text") { init ->
        val parameters = init.parameters()
        parameters.size == 4 && parameters.last() == STRING && parameters.count { it in iconTypes } == 1
    }
    val textIcon = textInit.parameters().indexOfFirst { it in iconTypes }
    val labelInit = one("label") { it.parameters() == listOf(STRING, FUNCTION1) }
    val itemInit = one("item") { it.definingClass == item.returnType }

    val saveAt = code.indexOfFirst { it.string() == SAVE_TAG }
    val tagInit = (saveAt + 1 until minOf(code.size, saveAt + 4)).mapNotNull { code[it].methodReference() }
        .firstOrNull { it.name == "<init>" && it.parameters() == listOf(STRING) }
        ?: refuse("${item.name} makes no tag right after \"$SAVE_TAG\"")

    val itemParameters = itemInit.parameters()
    if (itemParameters.count { it == labelInit.definingClass } != 1 ||
        itemParameters.count { it == textInit.definingClass } != 2 ||
        itemParameters.count { it == tagInit.definingClass } != 1
    ) {
        refuse("the item ${itemInit.definingClass} doesn't take one label, two texts and one tag: $itemParameters")
    }

    return ActionRow(
        owner = owner,
        types = types,
        items = items,
        item = item,
        save = save,
        state = state,
        stateContext = "$state->${stateContext.name}:$CONTEXT",
        statePost = code[holderAt].fieldReference().toString(),
        postValue = postValue.toString(),
        download = download!!,
        outline = outline!!,
        iconInit = iconInit,
        textInit = textInit,
        textIcon = textIcon,
        labelInit = labelInit,
        tagInit = tagInit,
        itemInit = itemInit,
    )
}

/**
 * Where [ActionRow.items] seals each list of items it hands its result: the index of the call that
 * wraps the list into an ImmutableList, whose answer is the last argument of the result's
 * constructor (the whole row, or the group Share sits in when the row is split), with the list's
 * register and the row state's register as the items were built.
 */
internal class RowSeal(val index: Int, val list: Int, val state: Int)

internal fun ActionRow.seals(): List<RowSeal> {
    val code = items.code()
    val seals = mutableListOf<RowSeal>()
    code.forEachIndexed { index, instruction ->
        val call = instruction.methodReference() ?: return@forEachIndexed
        if (instruction.opcode != Opcode.INVOKE_STATIC || call.returnType != IMMUTABLE_LIST ||
            call.parameters() != listOf(LIST)
        ) {
            return@forEachIndexed
        }
        val result = (code.getOrNull(index + 1) as? OneRegisterInstruction)
            ?.takeIf { code[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT }?.registerA ?: return@forEachIndexed
        val built = (index + 2 until code.size).firstOrNull { at ->
            val init = code[at].methodReference()
            code[at].opcode == Opcode.INVOKE_DIRECT && init?.name == "<init>" &&
                init.parameters().isNotEmpty() && init.parameters().all { it == IMMUTABLE_LIST }
        } ?: return@forEachIndexed
        val arguments = (code[built] as FiveRegisterInstruction).registers()
        if (arguments.last() != result || items.writersReaching(built, result) != listOf(index + 1)) return@forEachIndexed

        val list = (instruction as FiveRegisterInstruction).registerC
        val itemCall = (index - 1 downTo 0).firstOrNull { code[it].methodReference()?.matches(item) == true }
            ?: refuse("${items.name} seals a list at $index without building an item first")
        seals += RowSeal(index, list, (code[itemCall] as FiveRegisterInstruction).registerD)
    }
    if (seals.isEmpty()) refuse("${items.name} seals no list of items into its result")
    return seals
}

/** The indices of [ActionRow.types]'s returns, with the register each returns. */
internal fun ActionRow.typeReturns(): List<Pair<Int, Int>> {
    val code = types.code()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
        .map { it to (code[it] as OneRegisterInstruction).registerA }
    if (returns.isEmpty()) refuse("${types.name} never returns its list")
    return returns
}

internal fun refuse(why: String): Nothing = throw PatchException("Post action buttons: $why")

internal fun Method.code(): List<Instruction> = implementation?.instructions?.toList() ?: emptyList()

internal fun MethodReference.parameters(): List<String> = parameterTypes.map(CharSequence::toString)

private fun MethodReference.matches(method: Method) =
    definingClass == method.definingClass && name == method.name && returnType == method.returnType &&
        parameters() == method.parameterTypes.map(CharSequence::toString)

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReference() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.typeReference() =
    ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun FiveRegisterInstruction.registers(): List<Int> =
    listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
