package io.github.jordanwoodson.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import io.github.jordanwoodson.patches.twitch.chat.printedField
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.replaceInstruction
import io.github.jordanwoodson.patches.twitch.shared.requireKept
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val EMOTES = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchEmotes;"
private const val FAVORITES = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchEmoteFavorites;"
private const val OPTIONAL = "Ltv/twitch/android/util/Optional;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"

/**
 * The emote picker and autocomplete (switch `emotes_picker`). Twitch builds the picker's sections itself:
 * the presenter groups the user's emote sets by owner and gives each owner's set a section with the owner's
 * name as its header. The hook adds one owner set per service to that list, made of the same Twitch emote
 * objects chat uses ([emoteType]), so Twitch draws them, inserts their code on a tap and loads their images
 * through the emote URL hook. Autocomplete asks its current source for matches; the call goes through the
 * extension, which appends the services' emotes when the source is the emote one.
 */
internal fun BytecodePatchContext.hookEmotePicker(emoteType: String) {
    val picker = EmotePickerFingerprint.twitchMatch("emote picker presenter").classDef
    val setClass = OwnerEmoteSetFingerprint.twitchMatch("owner emote set").classDef
    val ownerClass = EmoteOwnerFingerprint.twitchMatch("emote owner").classDef
    val ownerInit = ownerClass.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(TUID, STRING, STRING, STRING)
    } ?: throw PatchException("Twitch: the emote owner constructor changed")
    val setInit = setClass.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(ownerClass.type, STRING, "Ljava/util/List;")
    } ?: throw PatchException("Twitch: the owner emote set constructor changed")
    // The presenter's section builder (set, channel, surface): what the probe calls to check a section.
    val section = picker.methods.singleOrNull { method ->
        method.parameterTypes.map(CharSequence::toString).let { it.size == 3 && it[0] == setClass.superclass && it[1] == TUID }
    } ?: throw PatchException("Twitch: the emote picker's section builder changed")
    Locators.record("twitch.emote_picker.section", section)

    // The presenter combines the user's sets with the channel's (two Optionals) in one Function3 case; its
    // arguments are cast right at the start of that case. The sets list gets the services' sets appended.
    val sets = Fingerprint(
        name = "invoke", returnType = OBJECT, parameters = listOf(OBJECT, OBJECT, OBJECT),
        filters = listOf(
            checkCast(picker.type),
            checkCast(TUID, MatchAfterWithin(2)),
            checkCast("Ljava/util/List;", MatchAfterWithin(6)),
            checkCast(OPTIONAL, MatchAfterWithin(2)),
            checkCast(OPTIONAL, MatchAfterWithin(2)),
        ),
    ).twitchMatch("emote picker sets")
    sets.method.apply {
        val channelCast = sets.instructionMatches[1]
        val listCast = sets.instructionMatches[2]
        val channel = (channelCast.instruction as OneRegisterInstruction).registerA
        val list = (listCast.instruction as OneRegisterInstruction).registerA
        val insert = listCast.index + 1
        requireKept(channelCast.index, insert, channel, "emote picker channel")
        requireNotBranchTarget(insert, "emote picker sets")
        addInstructions(insert, """
            ${invokeStatic("$EMOTES->pickerSets(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;", list, channel)}
            move-result-object v$list
        """)
    }
    bridge(EMOTES, "emoteClass", "const-class v0, $emoteType\nreturn-object v0", locals = 1)
    bridge(EMOTES, "ownerSet", """
        new-instance v0, Ltv/twitch/android/models/Tuid;
        invoke-direct { v0, p0 }, Ltv/twitch/android/models/Tuid;-><init>(I)V
        new-instance v1, ${ownerClass.type}
        invoke-direct { v1, v0, p1, p2, p3 }, $ownerInit
        new-instance v0, ${setClass.type}
        invoke-direct { v0, v1, p4, p5 }, $setInit
        return-object v0
    """, locals = 2)

    // Autocomplete: the filter's call into its source goes through the extension, which makes the same call.
    val sourceMatch = EmoteAutocompleteFingerprint.twitchMatch("emote autocomplete source")
    val source = sourceMatch.classDef
    // The source's code-to-emote map, for the probe: the field read right before the LinkedHashMap cast.
    sourceMatch.method.implementation!!.instructions.toList().let { code ->
        val cast = sourceMatch.instructionMatches.first().index
        val map = (code.getOrNull(cast - 1) as? ReferenceInstruction)?.reference
        if (code.getOrNull(cast - 1)?.opcode != Opcode.IGET_OBJECT || map == null) {
            throw PatchException("Twitch: the emote autocomplete source's map moved")
        }
        Locators.record("twitch.emote_picker.autocomplete_map", map.toString())
        // Its sort order: the method's other cast, of the field it reads first.
        val order = code.take(cast).indexOfFirst { it.opcode == Opcode.CHECK_CAST }
        if (order < 1 || code[order - 1].opcode != Opcode.IGET_OBJECT) {
            throw PatchException("Twitch: the emote autocomplete source's order moved")
        }
        Locators.record("twitch.emote_picker.autocomplete_order", (code[order - 1] as ReferenceInstruction).reference.toString())
        Locators.record("twitch.emote_picker.autocomplete_order_type", (code[order] as ReferenceInstruction).reference.toString())
    }
    val filter = AutocompleteFilterFingerprint.twitchMatch("autocomplete filter")
    val call = filter.instructionMatches.first()
    val matches = (call.instruction as ReferenceInstruction).reference as MethodReference
    if (call.instruction.opcode != Opcode.INVOKE_INTERFACE || matches.definingClass !in source.interfaces) {
        throw PatchException("Twitch: the autocomplete filter no longer asks the emote source's interface")
    }
    val has = classDefBy(matches.definingClass).methods.singleOrNull {
        it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf(STRING)
    } ?: throw PatchException("Twitch: the autocomplete source has no single code lookup")
    val arguments = call.instruction as FiveRegisterInstruction
    if (arguments.registerCount != 2) throw PatchException("Twitch: unexpected autocomplete call")
    filter.method.replaceInstruction(call.index,
        invokeStatic("$EMOTES->autocomplete(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/util/ArrayList;",
            arguments.registerC, arguments.registerD))
    bridge(EMOTES, "sourceMatches",
        "check-cast p0, ${matches.definingClass}\ninvoke-interface { p0, p1 }, $matches\nmove-result-object p0\nreturn-object p0")
    bridge(EMOTES, "sourceHas",
        "check-cast p0, ${matches.definingClass}\ninvoke-interface { p0, p1 }, $has\nmove-result p0\nreturn p0")
    bridge(EMOTES, "isEmoteSource", "instance-of p0, p0, ${source.type}\nreturn p0")
    hookBareAutocomplete(source.type)

    // An emote's code: the base class getter the emote class implements by returning the field its
    // constructor stores its second argument in (id, code, owner, asset type, modifications, type).
    val emote = classDefBy(emoteType)
    val emoteInit = emote.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.size == 6 && it.parameterTypes[1].toString() == STRING
    }?.implementation ?: throw PatchException("Twitch: the emote constructor changed")
    val codeRegister = emoteInit.registerCount - 7 + 2
    val codeField = emoteInit.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }
        .singleOrNull { (it as TwoRegisterInstruction).registerA == codeRegister }
        ?.let { (it as ReferenceInstruction).reference.toString() }
        ?: throw PatchException("Twitch: the emote constructor no longer stores its code")
    val getter = emote.methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == STRING && method.implementation?.instructions?.toList()?.let {
            it.size == 2 && it[0].opcode == Opcode.IGET_OBJECT && (it[0] as ReferenceInstruction).reference.toString() == codeField
        } == true
    } ?: throw PatchException("Twitch: the emote has no code getter")
    if (classDefBy(emote.superclass!!).methods.none { it.name == getter.name && it.returnType == STRING && it.parameterTypes.isEmpty() }) {
        throw PatchException("Twitch: the emote code getter isn't the base class's")
    }
    bridge(EMOTES, "emoteCode", """
        check-cast p0, ${emote.superclass}
        invoke-virtual { p0 }, ${emote.superclass}->${getter.name}()Ljava/lang/String;
        move-result-object p0
        return-object p0
    """)
    hookFavorites(picker, emoteType)
}

/**
 * The base class getter ([emoteType]'s superclass) that [emoteType] implements by returning the field its
 * constructor (id, code, owner, asset type, modifications, type) stores argument [argument] in.
 */
private fun BytecodePatchContext.emoteGetter(emoteType: String, argument: Int): Method {
    val emote = classDefBy(emoteType)
    val init = emote.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.size == 6 }?.implementation
        ?: throw PatchException("Twitch: the emote constructor changed")
    val register = init.registerCount - 7 + 1 + argument
    val field = init.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }
        .singleOrNull { (it as TwoRegisterInstruction).registerA == register }
        ?.let { (it as ReferenceInstruction).reference as FieldReference }
        ?: throw PatchException("Twitch: the emote constructor no longer stores argument $argument")
    val getter = emote.methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == field.type && method.implementation?.instructions?.toList()?.let {
            it.size == 2 && it[0].opcode == Opcode.IGET_OBJECT && (it[0] as ReferenceInstruction).reference == field
        } == true
    } ?: throw PatchException("Twitch: the emote has no getter for argument $argument")
    return classDefBy(emote.superclass!!).methods.singleOrNull {
        it.name == getter.name && it.returnType == getter.returnType && it.parameterTypes.isEmpty()
    } ?: throw PatchException("Twitch: the emote getter for argument $argument isn't the base class's")
}

/**
 * Favorite emotes (switch `emotes_favorites`). The picker's emote item binder gives each emote view Twitch's long
 * press listener (which shows modifier variants, when the emote has any, and nothing otherwise); that call goes
 * through `TwitchEmoteFavorites.longClick` with the item's model, which adds or removes the emote. The favorites
 * come back as a set in [hookEmotePicker]'s sets hook, made of [emoteType] objects from the stored ID, code, asset
 * type and type. The presenter's load for a channel and surface, which Twitch calls each time the picker opens, is
 * noted at its start and called again after a change, so the open picker shows it.
 */
private fun BytecodePatchContext.hookFavorites(picker: ClassDef, emoteType: String) {
    val itemModel = EmoteUiModelFingerprint.twitchMatch("emote picker item").method
    val clicked = itemModel.printedField(", clickedEmote=")
    val unlocked = UnlockedEmoteFingerprint.twitchMatch("unlocked emote").method
    val unlockedEmote = unlocked.printedField("Unlocked(emote=")
    val variants = unlocked.printedField(", modifiedEmotes=")
    if (variants.type != "Ljava/util/List;") throw PatchException("Twitch: an unlocked emote's variants aren't a list")
    bridge(FAVORITES, "pickerEmote", """
        check-cast p0, ${itemModel.definingClass}
        iget-object p0, p0, $clicked
        instance-of v0, p0, ${unlocked.definingClass}
        if-eqz v0, :none
        check-cast p0, ${unlocked.definingClass}
        iget-object v0, p0, $variants
        invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
        move-result v0
        if-eqz v0, :none
        iget-object p0, p0, $unlockedEmote
        return-object p0
        :none
        const/4 p0, 0x0
        return-object p0
    """, locals = 1)
    val base = classDefBy(emoteType).superclass!!
    if (!classDefBy(base).let { AccessFlags.ABSTRACT.isSet(it.accessFlags) } || unlockedEmote.type != base) {
        throw PatchException("Twitch: an unlocked emote isn't the emote base class")
    }
    for ((name, argument) in listOf("emoteId" to 0, "emoteAsset" to 3, "emoteType" to 5)) {
        val getter = emoteGetter(emoteType, argument)
        if ((argument == 0) != (getter.returnType == STRING)) throw PatchException("Twitch: unexpected emote getter types")
        bridge(FAVORITES, name, """
            check-cast p0, $base
            invoke-virtual { p0 }, $base->${getter.name}()${getter.returnType}
            move-result-object p0
            return-object p0
        """)
    }

    // The item binder: the merged binder method that casts its model to the item class and sets a long press.
    val binder = Fingerprint(
        returnType = "V", parameters = listOf("L"),
        custom = { method, _ ->
            val code = method.implementation?.instructions?.toList().orEmpty()
            code.any { it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == itemModel.definingClass } &&
                code.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setOnLongClickListener" }
        },
    ).twitchMatch("emote picker item binder")
    binder.method.apply {
        val instructions = implementation!!.instructions.toList()
        val cast = instructions.indices.single { i ->
            instructions[i].opcode == Opcode.CHECK_CAST && (instructions[i] as ReferenceInstruction).reference.toString() == itemModel.definingClass
        }
        val call = (cast until instructions.size).firstOrNull { i ->
            val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[i].opcode == Opcode.INVOKE_VIRTUAL && ref?.name == "setOnLongClickListener" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View\$OnLongClickListener;")
        } ?: throw PatchException("Twitch: the emote picker item sets no long press")
        val model = (instructions[cast] as OneRegisterInstruction).registerA
        requireKept(cast, call, model, "emote picker item model")
        val arguments = instructions[call] as FiveRegisterInstruction
        replaceInstruction(call, invokeStatic(
            "$FAVORITES->longClick(Landroid/view/View;Landroid/view/View\$OnLongClickListener;$OBJECT)V",
            arguments.registerC, arguments.registerD, model))
    }
    Locators.record("twitch.emote_picker.item_binder", binder.method)

    // The presenter's load for a channel (Tuid) and surface (an enum: chat, whispers).
    val load = picker.methods.singleOrNull { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        method.returnType == "V" && types.size == 2 && types[0] == TUID &&
            classDefByOrNull(types[1])?.superclass == "Ljava/lang/Enum;"
    } ?: throw PatchException("Twitch: the emote picker's load changed")
    val surface = load.parameterTypes[1].toString()
    Locators.record("twitch.emote_picker.load", load)
    mutableClassDefBy(picker.type).methods.single { it.name == load.name && it.parameterTypes == load.parameterTypes }.apply {
        addInstructions(0, invokeStatic("$FAVORITES->opened($OBJECT$OBJECT$OBJECT)V",
            parameterRegister(0), parameterRegister(1), parameterRegister(2)))
    }
    bridge(FAVORITES, "reloadPicker", """
        check-cast p0, ${picker.type}
        check-cast p1, $TUID
        check-cast p2, $surface
        invoke-virtual { p0, p1, p2 }, ${picker.type}->${load.name}($TUID$surface)V
        return-void
    """)
}

/**
 * Autocomplete without ':' (switch `emotes_autocomplete_bare`). The chat input's text watcher picks the
 * autocomplete source from the word before the cursor: '@' chatters, ':' emotes, a command's argument chatters,
 * and otherwise hides the drop-down. Its ':' check (a detector object's boolean method, right before the branch
 * that hands the adapter the emote source) gets a hook that also says yes for a plain word of a few characters;
 * the input's tokenizer (`findTokenStart`, which only ever starts a token at '@', ':' or a command's argument)
 * gets one that starts the token at that word. Twitch's own filter, drop-down and insertion do the rest.
 */
private fun BytecodePatchContext.hookBareAutocomplete(sourceType: String) {
    val watcher = Fingerprint(
        name = "onTextChanged", returnType = "V", parameters = listOf(CHAR_SEQUENCE, "I", "I", "I"),
        custom = { _, classDef -> classDef.fields.any { it.type == sourceType } },
    ).twitchMatch("chat input text watcher")
    val detector: String
    watcher.method.apply {
        val instructions = implementation!!.instructions.toList()
        val emoteRead = instructions.indices.singleOrNull { i ->
            instructions[i].opcode == Opcode.IGET_OBJECT &&
                ((instructions[i] as ReferenceInstruction).reference as FieldReference).type == sourceType
        } ?: throw PatchException("Twitch: the chat input doesn't hand over the emote source once")
        val check = (emoteRead downTo 0).firstOrNull { i ->
            val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[i].opcode == Opcode.INVOKE_VIRTUAL && ref?.returnType == "Z" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf(CHAR_SEQUENCE)
        } ?: throw PatchException("Twitch: the chat input's ':' check moved")
        detector = ((instructions[check] as ReferenceInstruction).reference as MethodReference).definingClass
        val result = instructions[check + 1]
        if (result.opcode != Opcode.MOVE_RESULT) throw PatchException("Twitch: the chat input's ':' check isn't kept")
        val flag = (result as OneRegisterInstruction).registerA
        val text = (instructions[check] as FiveRegisterInstruction).registerD
        val branch = instructions[check + 2]
        if (branch.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != flag) {
            throw PatchException("Twitch: the chat input doesn't branch on its ':' check")
        }
        requireNotBranchTarget(check + 2, "chat input ':' check")
        addInstructions(check + 2, """
            ${invokeStatic("$EMOTES->bareTrigger(Z$CHAR_SEQUENCE)Z", flag, text)}
            move-result v$flag
        """)
    }
    Locators.record("twitch.emote_picker.text_watcher", watcher.method)

    val tokenizer = Fingerprint(
        name = "findTokenStart", returnType = "I", parameters = listOf(CHAR_SEQUENCE, "I"),
        custom = { _, classDef -> classDef.fields.any { it.type == detector } },
    ).twitchMatch("chat input tokenizer")
    tokenizer.method.apply {
        val instructions = implementation!!.instructions.toList()
        val text = parameterRegister(1)
        // Its text argument is replaced, once, by the part before the cursor; that is what the hook reads.
        val cut = instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "subSequence" && ref.definingClass == CHAR_SEQUENCE
        }
        val writes = instructions.indices.filter { i ->
            instructions[i].opcode.setsRegister() && (instructions[i] as? OneRegisterInstruction)?.registerA == text
        }
        if (cut < 0 || writes != listOf(cut + 1) || instructions[cut + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Twitch: the chat input tokenizer no longer cuts its text at the cursor")
        }
        val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN }
        if (returns.size != 1) throw PatchException("Twitch: the chat input tokenizer has ${returns.size} returns")
        val at = returns.single()
        val value = (instructions[at] as OneRegisterInstruction).registerA
        requireNotBranchTarget(at, "chat input tokenizer return")
        addInstructions(at, """
            ${invokeStatic("$EMOTES->bareTokenStart(I$CHAR_SEQUENCE)I", value, text)}
            move-result v$value
        """)
    }
    Locators.record("twitch.emote_picker.tokenizer", tokenizer.method)
}
