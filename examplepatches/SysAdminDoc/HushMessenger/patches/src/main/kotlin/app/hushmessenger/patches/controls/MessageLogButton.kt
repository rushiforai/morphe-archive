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
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** The Chats tab's top bar button list builder, where the message log button is added. */
internal const val MESSAGE_LOG_BUTTON = "message_log_button"
/** The same bar's tap handler, which hands every button's id over. */
internal const val MESSAGE_LOG_CLICK = "message_log_click"
internal const val MESSAGE_LOG_BUTTON_CLASS = "Lapp/hushmessenger/extension/MessageLogButton;"
internal const val MESSAGE_LOG_BUTTON_ADD = "$MESSAGE_LOG_BUTTON_CLASS->add(Ljava/util/List;Landroid/content/Context;Ljava/lang/Object;)V"
internal const val MESSAGE_LOG_BUTTON_CLICKED = "$MESSAGE_LOG_BUTTON_CLASS->clicked(Landroid/view/View;Ljava/lang/String;)Z"
internal const val MESSAGE_LOG_BUTTON_BUILD = "$MESSAGE_LOG_BUTTON_CLASS->button(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;"
internal const val MESSAGE_LOG_BUTTON_ID_OF = "$MESSAGE_LOG_BUTTON_CLASS->buttonId(Ljava/lang/Object;)Ljava/lang/String;"
/** MessageLogButton.ID, the button's id in the bar. */
internal const val MESSAGE_LOG_BUTTON_ID = "HushMessageLog"
/** MessageLogButton.COMPOSER, the id Messenger gives its new message button. */
internal const val COMPOSER_BUTTON_ID = "ComposerButton"
internal const val TOOLBAR_SPEC = "messaging.navigation.home.tabs.tabtoolbarbutton.TabToolbarButtonInterfaceSpec"
internal const val TOOLBAR_MODEL = "getTabToolbarButtonModel"
internal const val COMPOSE_BUTTON_NAME = "messaging.inbox.tab.core.tabtoolbarbutton.composerbutton.composertoolbarbutton.ComposeButtonTabButtonImplementation"
/** Messenger's own clock icon, named in its icon enum's initializer. */
internal const val MESSAGE_LOG_ICON = "CLOCK"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val GET_STRING = "$CONTEXT->getString(I)$STRING"
private const val COLLECTION_ADD = "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
/** The new message button's block names all four, which no other method does. */
private val BAR_STRINGS = setOf(TOOLBAR_SPEC, TOOLBAR_MODEL, COMPOSE_BUTTON_NAME, COMPOSER_BUTTON_ID)
private val CLICK_PARAMS = listOf("Landroid/view/View;", STRING, STRING, "I")

/** The builder fields the new message button's block fills, the only ones ours fills. */
internal enum class LogSlot { ICON, LABEL, ID }

/**
 * Where the bar hands its finished list back: [site] is its one return, of [list], an ArrayList it made, and [scratch]
 * two low locals the call may use, since only [list] is read after the site.
 */
internal data class LogBarSite(val site: Int, val list: Int, val scratch: List<Int>)

/**
 * How this build's Chats tab bar makes its new message button, which the message log button copies with Messenger's
 * clock icon, the log's label and the extension's id. Each value is read from the build at discovery.
 */
internal data class MessageLogButtonRecipe(
    val bar: Method,
    val click: Method,
    /** The bar's Context and FbUserSession fields, which the new message button's block reads. */
    val context: String,
    val session: String,
    /** The static call that makes a button's icon from the context, the account and an icon enum value. */
    val factory: String,
    val icon: String,
    /** The button, its one constructor, which copies a builder, and that builder's fields the block fills. */
    val button: String,
    val init: String,
    val builder: String,
    val fields: Map<LogSlot, String>,
    /** The button's id field, which the tap handler gets back. */
    val idField: String,
    val site: LogBarSite,
)

internal var messageLogButtonRecipe: MessageLogButtonRecipe? = null

private fun Instruction.logRef() = (this as? ReferenceInstruction)?.reference
private fun Method.logCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.logArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun Method.logStrings() = logCode().mapNotNull { (it.logRef() as? StringReference)?.string }.toSet()
private fun MethodReference.logParams() = parameterTypes.map { it.toString() }
private fun FieldReference.logId() = "$definingClass->$name:$type"
private fun ClassDef.logPublic() = AccessFlags.PUBLIC.isSet(accessFlags)
private fun ClassDef.logInstanceField(f: FieldReference) =
    fields.any { it.name == f.name && it.type == f.type && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }
private fun Instruction.logTouches(register: Int) = register in logArgs() || readWrites(register) ||
    (this is OneRegisterInstruction && registerA == register) || (this is TwoRegisterInstruction && registerB == register) ||
    (this is ThreeRegisterInstruction && registerC == register)

/**
 * The bar's seam: its one return hands back an ArrayList the method made, nothing jumps onto the return, and no try
 * covers it or ends on it, since the new code goes in right before it and would join that try. The receiver is never
 * reassigned, so the call reads the bar's fields from it. Null when the shape moved.
 */
internal fun Method.messageLogBarSite(): LogBarSite? {
    val impl = implementation ?: return null
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty()) return null
    val code = logCode()
    val site = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_OBJECT } ?: return null
    val list = (code[site] as OneRegisterInstruction).registerA
    if (list > 15 || site in jumpTargets()) return null
    val at = code.take(site).sumOf { it.codeUnits }
    if (impl.tryBlocks.any { it.startCodeAddress < at && it.startCodeAddress + it.codeUnitCount >= at }) return null
    val self = parameterRegister(0)
    if (code.any { it.readWrites(self) }) return null
    val made = try { ReadFlow(this).definitionsAt(site, list).singleOrNull() } catch (_: PatchException) { return null }
    if (made == null || made < 0 || code[made].opcode != Opcode.NEW_INSTANCE ||
        (code[made].logRef() as? TypeReference)?.type != ARRAY_LIST) return null
    val scratch = (0 until minOf(16, self)).filter { it != list }.take(2)
    return if (scratch.size == 2) LogBarSite(site, list, scratch) else null
}

/** Reads the recipe from the one bar that builds the new message button, or null. */
internal fun resolveMessageLogButtonRecipe(classes: Iterable<ClassDef>): MessageLogButtonRecipe? {
    val byType = classes.associateBy { it.type }
    val bar = classes.flatMap { it.methods }.filter { m ->
        m.returnType == "Ljava/util/List;" && m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.implementation != null && m.logStrings().containsAll(BAR_STRINGS)
    }.singleOrNull() ?: return null
    val barClass = byType[bar.definingClass] ?: return null
    // The bar's tap handler gets each button's id second, and the new message button's id is one it knows.
    val click = barClass.methods.singleOrNull { m ->
        m.parameterTypes.map(CharSequence::toString) == CLICK_PARAMS && m.returnType == "V" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.implementation != null && COMPOSER_BUTTON_ID in m.logStrings()
    } ?: return null
    // The tap hook writes v0 ahead of the stock body.
    if (click.parameterRegister(0) < 1) return null
    val c = bar.logCode()
    val name = c.indices.singleOrNull { (c[it].logRef() as? StringReference)?.string == COMPOSE_BUTTON_NAME } ?: return null
    val add = (name until c.size).firstOrNull { c[it].logRef()?.toString() == COLLECTION_ADD } ?: return null
    val block = name..add

    fun barField(type: String) = block.mapNotNull { i ->
        (c[i].logRef() as? FieldReference)?.takeIf { c[i].opcode == Opcode.IGET_OBJECT && it.definingClass == bar.definingClass && it.type == type }
    }.distinct().singleOrNull()?.takeIf { f -> barClass.fields.any { it.name == f.name && it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) } }?.logId()
    val context = barField(CONTEXT) ?: return null
    val session = barField(FB_USER_SESSION) ?: return null

    // The icon comes from one static call on the context, the account and an icon enum value.
    val factoryAt = block.singleOrNull { i ->
        val ref = c[i].logRef() as? MethodReference
        c[i].opcode == Opcode.INVOKE_STATIC && ref != null && ref.logParams().size == 3 && ref.logParams()[0] == CONTEXT &&
            ref.logParams()[1] == FB_USER_SESSION && ref.returnType.startsWith("L")
    } ?: return null
    if (c[factoryAt + 1].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val factory = c[factoryAt].logRef() as MethodReference
    val iconType = factory.logParams()[2]
    val labelAt = block.singleOrNull { c[it].opcode == Opcode.INVOKE_VIRTUAL && c[it].logRef()?.toString() == GET_STRING } ?: return null
    if (c[labelAt + 1].opcode != Opcode.MOVE_RESULT_OBJECT) return null

    // What goes in the list is a button made by its one-argument constructor from a builder made just for it.
    val shown = c[add].logArgs().getOrNull(1) ?: return null
    val initAt = block.singleOrNull { i ->
        val ref = c[i].logRef() as? MethodReference
        c[i].opcode == Opcode.INVOKE_DIRECT && ref?.name == "<init>" && ref.logParams().size == 1 && c[i].logArgs().firstOrNull() == shown
    } ?: return null
    val init = c[initAt].logRef() as MethodReference
    val builder = init.logParams().single()
    val held = c[initAt].logArgs()[1]
    val fields = try {
        val flow = ReadFlow(bar)
        val made = flow.definitionsAt(initAt, held).singleOrNull()?.takeIf { it in block } ?: return null
        if (c[made].opcode != Opcode.NEW_INSTANCE || (c[made].logRef() as? TypeReference)?.type != builder ||
            c[made + 1].opcode != Opcode.INVOKE_DIRECT || c[made + 1].logRef()?.toString() != "$builder-><init>()V" ||
            c[made + 1].logArgs() != listOf(held)) return null
        // Between the two, the block only fills builder fields, each with the icon, the label or the new message button's id.
        val filled = mutableMapOf<LogSlot, FieldReference>()
        for (i in made + 2 until initAt) {
            if (!c[i].logTouches(held)) continue
            val field = c[i].logRef() as? FieldReference
            val store = c[i] as? TwoRegisterInstruction
            if (c[i].opcode != Opcode.IPUT_OBJECT || field == null || store == null || field.definingClass != builder || store.registerB != held) return null
            val definition = flow.definitionsAt(i, store.registerA).singleOrNull()?.takeIf { it >= 0 }
            val slot = when {
                definition == factoryAt + 1 && field.type == factory.returnType -> LogSlot.ICON
                definition == labelAt + 1 && field.type == STRING -> LogSlot.LABEL
                definition != null && field.type == STRING && (c[definition].logRef() as? StringReference)?.string == COMPOSER_BUTTON_ID -> LogSlot.ID
                else -> return null
            }
            if (filled.put(slot, field) != null) return null
        }
        filled
    } catch (_: PatchException) { return null }
    if (fields.size != LogSlot.entries.size || fields.values.distinct().size != fields.size) return null

    val buttonClass = byType[init.definingClass] ?: return null
    val builderClass = byType[builder] ?: return null
    val ctor = buttonClass.methods.singleOrNull { it.hookId() == init.toString() } ?: return null
    val builderInit = builderClass.methods.singleOrNull { it.hookId() == "$builder-><init>()V" } ?: return null
    if (fields.values.any { !builderClass.logInstanceField(it) }) return null
    // The constructor copies the builder's id into one String field, which the extension reads back to place the button.
    val cc = ctor.logCode()
    val idRead = cc.indices.singleOrNull { i ->
        cc[i].opcode == Opcode.IGET_OBJECT && (cc[i].logRef() as? FieldReference)?.logId() == fields.getValue(LogSlot.ID).logId()
    } ?: return null
    val read = cc[idRead] as TwoRegisterInstruction
    val copy = cc.getOrNull(idRead + 1) as? TwoRegisterInstruction
    val idField = (cc.getOrNull(idRead + 1)?.logRef() as? FieldReference)?.takeIf { f ->
        read.registerB == ctor.parameterRegister(1) && cc[idRead + 1].opcode == Opcode.IPUT_OBJECT && copy != null && copy.registerA == read.registerA &&
            copy.registerB == ctor.parameterRegister(0) && f.definingClass == init.definingClass && f.type == STRING && buttonClass.logInstanceField(f)
    }?.logId() ?: return null

    // Messenger's clock icon, by its enum name.
    val iconClass = byType[iconType] ?: return null
    val icon = iconClass.methods.singleOrNull { it.name == "<clinit>" }?.logCode()?.let { ic ->
        ic.indices.filter { (ic[it].logRef() as? StringReference)?.string == MESSAGE_LOG_ICON }.flatMap { k ->
            (k + 1 until minOf(ic.size, k + 8)).mapNotNull { j ->
                (ic[j].logRef() as? FieldReference)?.takeIf { ic[j].opcode == Opcode.SPUT_OBJECT && it.type == iconType && it.definingClass == iconType }
            }.take(1)
        }.distinct().singleOrNull()
    } ?: return null
    if (iconClass.fields.none { it.name == icon.name && it.type == iconType && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }) return null

    // Every class and member the generated button names is public, since it lives in the extension's package.
    val factoryClass = byType[factory.definingClass] ?: return null
    val factoryMethod = factoryClass.methods.singleOrNull { it.hookId() == factory.toString() } ?: return null
    if (listOf(buttonClass, builderClass, factoryClass, iconClass).any { !it.logPublic() } || byType[FB_USER_SESSION]?.logPublic() != true ||
        listOf(ctor, builderInit).any { !AccessFlags.PUBLIC.isSet(it.accessFlags) } || !AccessFlags.PUBLIC.isSet(factoryMethod.accessFlags) ||
        !AccessFlags.STATIC.isSet(factoryMethod.accessFlags)) return null

    val site = bar.messageLogBarSite() ?: return null
    if (site.list != c[add].logArgs().first()) return null
    return MessageLogButtonRecipe(bar, click, context, session, factory.toString(), icon.logId(), init.definingClass, init.toString(),
        builder, fields.mapValues { it.value.logId() }, idField, site)
}

internal fun findMessageLogButton(classes: Iterable<ClassDef>): Pair<List<Method>, List<Method>> {
    messageLogButtonRecipe = resolveMessageLogButtonRecipe(classes)
    return messageLogButtonRecipe?.let { listOf(it.bar) to listOf(it.click) } ?: (emptyList<Method>() to emptyList())
}

private fun logButtonRequire(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("Messenger controls: the Chats tab's top bar changed ($detail)")
}

internal fun MutableMethod.validateMessageLogBar(): MessageLogButtonRecipe {
    val recipe = messageLogButtonRecipe
    logButtonRequire(recipe != null && recipe.bar.hookId() == hookId(), "no button recipe")
    logButtonRequire(messageLogBarSite() == recipe!!.site, "button list return")
    return recipe
}

internal fun MutableMethod.injectMessageLogBar() {
    val recipe = validateMessageLogBar()
    val site = recipe.site
    val (a, b) = site.scratch
    addInstructions(site.site, """
        move-object/from16 v$a, p0
        iget-object v$b, v$a, ${recipe.context}
        iget-object v$a, v$a, ${recipe.session}
        invoke-static {v${site.list}, v$b, v$a}, $MESSAGE_LOG_BUTTON_ADD
    """.trimIndent())
}

internal fun MutableMethod.validateMessageLogClick(): MessageLogButtonRecipe {
    val recipe = messageLogButtonRecipe
    logButtonRequire(recipe != null && recipe.click.hookId() == hookId() && !AccessFlags.STATIC.isSet(accessFlags), "no tap handler")
    validateScratch()
    return recipe!!
}

/** Our id answers the tap; any other is one of Messenger's buttons and goes on as before. */
internal fun MutableMethod.injectMessageLogClick() {
    validateMessageLogClick()
    addInstructionsWithLabels(0, """
        invoke-static/range {v${parameterRegister(1)} .. v${parameterRegister(2)}}, $MESSAGE_LOG_BUTTON_CLICKED
        move-result v0
        if-eqz v0, :stock_click
        return-void
    """.trimIndent(), ExternalLabel("stock_click", getInstruction(0)))
}

/** One of the extension's two stubs as shipped: static, not private, returning null. */
internal fun MutableMethod.validateMessageLogButtonStub(id: String) {
    val code = logCode()
    if (hookId() != id || !AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.PRIVATE.isSet(accessFlags) ||
        code.map { it.opcode } != listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT) || (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the message log button's extension stub changed")
}

/**
 * The button(context, session, label) stub's replacement: the new message button's builder filled with Messenger's
 * clock icon, the log's label and the extension's id, then the button made from it. Null when the account isn't
 * Messenger's.
 */
internal fun messageLogButtonBuilder(stub: MutableMethod, recipe: MessageLogButtonRecipe): MutableMethod {
    stub.validateMessageLogButtonStub(MESSAGE_LOG_BUTTON_BUILD)
    val built = stub.emptyCopy(3 + 3)
    built.addInstructionsWithLabels(0, """
        instance-of v0, p1, $FB_USER_SESSION
        if-eqz v0, :none
        move-object v2, p1
        check-cast v2, $FB_USER_SESSION
        sget-object v1, ${recipe.icon}
        invoke-static {p0, v2, v1}, ${recipe.factory}
        move-result-object v1
        new-instance v2, ${recipe.builder}
        invoke-direct {v2}, ${recipe.builder}-><init>()V
        iput-object v1, v2, ${recipe.fields.getValue(LogSlot.ICON)}
        iput-object p2, v2, ${recipe.fields.getValue(LogSlot.LABEL)}
        const-string v1, "$MESSAGE_LOG_BUTTON_ID"
        iput-object v1, v2, ${recipe.fields.getValue(LogSlot.ID)}
        new-instance v0, ${recipe.button}
        invoke-direct {v0, v2}, ${recipe.init}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    return built
}

/** The buttonId(button) stub's replacement: the id a top bar button keeps, or null for anything else. */
internal fun messageLogButtonIdReader(stub: MutableMethod, recipe: MessageLogButtonRecipe): MutableMethod {
    stub.validateMessageLogButtonStub(MESSAGE_LOG_BUTTON_ID_OF)
    val built = stub.emptyCopy(2)
    built.addInstructionsWithLabels(0, """
        instance-of v0, p0, ${recipe.button}
        if-eqz v0, :none
        check-cast p0, ${recipe.button}
        iget-object v0, p0, ${recipe.idField}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    return built
}
