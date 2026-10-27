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
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal const val MARK_READ_BUTTON = "mark_read_button"
/** The chat top bar's button list builder, where the button is added. */
internal const val MARK_READ_BAR = "mark_read_bar"
/** The shared top bar listener the button's tap goes through. */
internal const val MARK_READ_CLICK = "mark_read_click"
internal const val MARK_READ = "Lapp/hushmessenger/extension/MarkReadButton;"
internal const val MARK_READ_ADD = "$MARK_READ->add(Ljava/util/List;Ljava/lang/Object;)V"
internal const val MARK_READ_ADD_TO = "$MARK_READ->addTo(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;"
internal const val MARK_READ_BUILD = "$MARK_READ->build(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val MARK_READ_BUTTON_BUILD = "$MARK_READ->button(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
/** MarkReadButton.DETAILS_TAG, the chat details button's test tag, which both top bars' details builder sets. */
internal const val MARK_READ_DETAILS_TAG = "settings_button"
internal const val MARK_READ_CLICKED = "$MARK_READ->clicked(Ljava/lang/Object;Landroid/view/View;)Z"
internal const val MARK_READ_TAG = "$MARK_READ->tag(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
internal const val MARK_READ_LABEL = "$MARK_READ->label()Ljava/lang/String;"
/** MarkReadButton.MOST_BUTTONS: how many top bar buttons Messenger shows, which the extension places the button by. */
internal const val MARK_READ_MOST_BUTTONS = 3
/** MarkReadButton.VIEW_TAG, the button's test tag in the bar. */
internal const val MARK_READ_VIEW_TAG = "hush_mark_read_button"
internal const val QR_BUTTON = "Lcom/facebook/messaging/payments/plugins/core/qrscannerbutton/ThreadViewTitleBarQRScannerButtonImplementation;"
internal const val QR_BUTTON_NAME = "messaging.payments.core.qrscannerbutton.ThreadViewTitleBarQRScannerButtonImplementation"
internal const val QR_BUTTON_TAG = "thread_view_title_bar_qr_scanner_button"
internal const val THREAD_SCHEME = "Lcom/facebook/messaging/threadview/scheme/interfaces/ThreadViewColorScheme;"
internal const val MIG_SCHEME = "Lcom/facebook/mig/scheme/interfaces/MigColorScheme;"
/** Messenger's own Mark as read icon, named in its icon enum's initializer. */
internal const val MARK_READ_ICON = "ENVELOPE_OPEN"
private const val COLLECTION_ADD = "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z"
private const val COLLECTION_ITERATOR = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;"
private const val LIST_INIT = "Ljava/util/ArrayList;-><init>(I)V"
private const val SUB_LIST = "$IMMUTABLE_LIST->subList(II)$IMMUTABLE_LIST"
private const val LIST_BUILD = "Lcom/google/common/collect/ImmutableList\$Builder;->build()$IMMUTABLE_LIST"
private const val LIST_COPY = "$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST"
/** What the newer bar's factory may declare it returns: the list it builds, or any type above it. */
private val FACTORY_RETURNS = setOf("Ljava/lang/Object;", "Ljava/lang/Iterable;", "Ljava/util/Collection;", "Ljava/util/List;", IMMUTABLE_LIST)
private const val CONTEXT = "Landroid/content/Context;"

/**
 * Where Messenger's newer chat top bar, a static factory, hands back the button list its builder just built: [site] is
 * its one return, of [list]. [session], [thread] and [mig] are the parameters that are never reassigned, and [scratch]
 * three low locals the call may use, since only [list] is read after the site.
 */
internal data class MarkReadFactory(val site: Int, val list: Int, val session: Int, val thread: Int, val mig: Int, val scratch: List<Int>)

/**
 * How this build's chat top bar makes its QR scanner button, which the Mark as read button copies with Messenger's own
 * Mark as read icon and a listener that holds the extension's tag. Each value is read from the build at discovery.
 * [site] is the builder's last instruction before it walks the finished list, where [list] and [socket] still hold
 * the list and the plugin socket. [factory] is the newer top bar, which calls the same details button builder.
 */
internal data class MarkReadRecipe(
    val bar: Method,
    val click: Method,
    val socketType: String,
    val session: String,
    val thread: String,
    val scheme: String,
    val mig: String,
    val builder: String,
    val builderScheme: String,
    val tagField: String,
    val listenerField: String,
    val iconSource: String,
    val iconProvider: String,
    val iconSetter: String,
    val icon: String,
    val listener: String,
    val listenerCase: Int,
    val target: String,
    val spec: String,
    val site: Int,
    val list: Int,
    val socket: Int,
    val factory: Method,
    val factorySite: MarkReadFactory,
)

internal var markReadRecipe: MarkReadRecipe? = null

private fun Instruction.markRef() = (this as? ReferenceInstruction)?.reference
private fun Method.markCode() = implementation?.instructions?.toList().orEmpty()
private fun Instruction.markArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun Instruction.markWrites(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))
private fun MethodReference.params() = parameterTypes.map { it.toString() }
private fun FieldReference.id() = "$definingClass->$name:$type"
private fun ClassDef.isPublic() = AccessFlags.PUBLIC.isSet(accessFlags)

/**
 * Every branch, switch case and catch handler as (source index, landing index); a handler's source is -1. Null when
 * one lands between instructions, which no shape is proved against.
 */
private fun Method.markEdges(): List<Pair<Int, Int>>? {
    val code = markCode()
    val addresses = IntArray(code.size + 1).also { a -> for (i in code.indices) a[i + 1] = a[i] + code[i].codeUnits }
    val indexAt = code.indices.associateBy { addresses[it] }
    val edges = mutableListOf<Pair<Int, Int>>()
    code.forEachIndexed { i, insn ->
        if (insn !is OffsetInstruction || insn.opcode == Opcode.FILL_ARRAY_DATA) return@forEachIndexed
        val landing = indexAt[addresses[i] + insn.codeOffset] ?: return null
        if (insn.opcode == Opcode.PACKED_SWITCH || insn.opcode == Opcode.SPARSE_SWITCH) {
            val payload = code[landing] as? SwitchPayload ?: return null
            payload.switchElements.forEach { case -> edges.add(i to (indexAt[addresses[i] + case.offset] ?: return null)) }
        } else edges.add(i to landing)
    }
    implementation!!.tryBlocks.forEach { block -> block.exceptionHandlers.forEach { h -> edges.add(-1 to (indexAt[h.handlerCodeAddress] ?: return null)) } }
    return edges
}

/**
 * The builder's seam: the one walk of the finished list, right after the socket counts its plugins to pad that list.
 * Between that count and the walk nothing writes [list] or [socket] and nothing jumps in from outside, so both still
 * hold what the walk and the count used. Null when the shape moved.
 */
internal fun Method.markReadSite(list: Int, socket: Int, socketType: String): Int? {
    val code = markCode()
    val walks = code.indices.filter { code[it].opcode == Opcode.INVOKE_VIRTUAL && code[it].markRef()?.toString() == COLLECTION_ITERATOR }
    val site = walks.singleOrNull() ?: return null
    if (code[site].markArgs() != listOf(list) || list > 15 || socket > 15) return null
    val count = (site - 1 downTo 0).firstOrNull { i ->
        val ref = code[i].markRef() as? MethodReference
        code[i].opcode == Opcode.INVOKE_STATIC && ref?.definingClass == socketType && ref.params() == listOf(socketType) && ref.returnType == "I"
    } ?: return null
    if (code[count].markArgs() != listOf(socket)) return null
    if ((count + 1 until site).any { code[it].markWrites(list) || code[it].markWrites(socket) }) return null
    val edges = markEdges() ?: return null
    // Nothing lands inside from outside, and nothing lands on the site itself, so the new call always runs first.
    if (edges.any { (from, to) -> to in count + 1..site && (from !in count until site || to == site) }) return null
    return site
}

/** Messenger's top bar keeps the first [MARK_READ_MOST_BUTTONS] buttons: its one subList end is a register set once, to that constant. */
internal fun Method.markReadCapMatches(): Boolean {
    val code = markCode()
    val cut = code.indices.singleOrNull { code[it].markRef()?.toString() == SUB_LIST } ?: return false
    val end = code[cut].markArgs().getOrNull(2) ?: return false
    val move = code.getOrNull(cut - 1) as? TwoRegisterInstruction ?: return false
    val cap = if (move.registerA == end && (move as Instruction).opcode in setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)) move.registerB else return false
    val writes = code.filter { it.markWrites(cap) }
    val const = writes.singleOrNull() as? NarrowLiteralInstruction ?: return false
    return (const as Instruction).opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) && const.narrowLiteral == MARK_READ_MOST_BUTTONS
}

/**
 * The newer bar's seam: a static factory whose one return hands back the list an ImmutableList builder just built, with
 * nothing between that build and the return that writes the list, branches or is landed on. The account, chat and
 * colors are parameters of their own types, each declared once and never reassigned. Null when the shape moved.
 */
internal fun Method.markReadFactorySite(): MarkReadFactory? {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType !in FACTORY_RETURNS || implementation == null) return null
    val code = markCode()
    val site = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_OBJECT } ?: return null
    val list = (code[site] as OneRegisterInstruction).registerA
    val build = (site - 1 downTo 0).firstOrNull { code[it].markRef()?.toString() == LIST_BUILD } ?: return null
    if (code[build + 1].opcode != Opcode.MOVE_RESULT_OBJECT || (code[build + 1] as OneRegisterInstruction).registerA != list) return null
    if ((build + 2 until site).any { code[it].markWrites(list) || code[it] is OffsetInstruction }) return null
    val edges = markEdges() ?: return null
    if (edges.any { (_, to) -> to in build + 1..site }) return null
    val types = parameterTypes.map { it.toString() }
    fun words(of: List<String>) = of.sumOf { if (it == "J" || it == "D") 2 else 1 }
    fun param(type: String) = types.indices.singleOrNull { types[it] == type }?.let { i -> parameterRegister(words(types.take(i))) }
    val session = param(FB_USER_SESSION) ?: return null
    val thread = param(THREAD_KEY_TYPE) ?: return null
    val mig = param(MIG_SCHEME) ?: return null
    if (code.any { insn -> insn.markWrites(session) || insn.markWrites(thread) || insn.markWrites(mig) }) return null
    val locals = implementation!!.registerCount - words(types)
    val scratch = (0 until minOf(16, locals)).filter { it != list }.take(3)
    if (list > 15 || scratch.size < 3) return null
    return MarkReadFactory(site, list, session, thread, mig, scratch)
}

/**
 * The narrow constant a register holds at [target], following plain moves to the register they copy. The 584.1 armv7
 * bar hoists the listener case into a high register and moves it down at the call, so the definition is not always a
 * literal. Null unless one definition reaches each step.
 */
private fun ReadFlow.narrowConstantAt(target: Int, register: Int, depth: Int = 4): Int? {
    if (depth < 0) return null
    val definition = definitionsAt(target, register).singleOrNull()?.takeIf { it >= 0 } ?: return null
    val instruction = code[definition]
    if (instruction is NarrowLiteralInstruction &&
        instruction.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)) return instruction.narrowLiteral
    if (instruction is TwoRegisterInstruction && instruction.opcode.toString().startsWith("MOVE") &&
        !instruction.opcode.toString().startsWith("MOVE_RESULT")) return narrowConstantAt(definition, instruction.registerB, depth - 1)
    return null
}

/** Reads the recipe from the one builder that names the QR scanner plugin and reads it from the socket, or null. */
internal fun resolveMarkReadRecipe(classes: Iterable<ClassDef>): MarkReadRecipe? {
    val byType = classes.associateBy { it.type }
    val bar = classes.flatMap { it.methods }.filter { m ->
        val code = m.markCode()
        code.any { (it.markRef() as? StringReference)?.string == QR_BUTTON_NAME } &&
            code.any { it.opcode == Opcode.IGET_OBJECT && (it.markRef() as? FieldReference)?.type == QR_BUTTON }
    }.singleOrNull() ?: return null
    val c = bar.markCode()
    val name = c.indices.singleOrNull { (c[it].markRef() as? StringReference)?.string == QR_BUTTON_NAME } ?: return null
    val plugin = (name until c.size).firstOrNull { c[it].opcode == Opcode.IGET_OBJECT && (c[it].markRef() as? FieldReference)?.type == QR_BUTTON } ?: return null
    val pluginRead = c[plugin] as TwoRegisterInstruction
    val socketType = (c[plugin].markRef() as FieldReference).definingClass
    val add = (plugin until c.size).firstOrNull { c[it].markRef()?.toString() == COLLECTION_ADD } ?: return null
    val list = c[add].markArgs().first()
    val block = (plugin..add).map { it to c[it] }
    val qr = byType[QR_BUTTON] ?: return null

    // The button's builder is the one class the block constructs from a label String; the rest of the block fills it in.
    val builder = block.map { it.second }.mapNotNull { insn ->
        (insn.markRef() as? MethodReference)?.takeIf { insn.opcode == Opcode.INVOKE_DIRECT && it.name == "<init>" && it.params() == listOf("Ljava/lang/String;") }?.definingClass
    }.distinct().singleOrNull() ?: return null
    val flow = try { ReadFlow(bar) } catch (_: PatchException) { return null }
    var mig: String? = null
    var builderScheme: String? = null
    var tagField: String? = null
    var listenerField: String? = null
    var iconProvider: String? = null
    var iconRead: FieldReference? = null
    var listener: String? = null
    var listenerCase: Int? = null
    var spec: String? = null
    val strings = mutableMapOf<Int, String>()
    var listenerRegister = -1
    for ((i, insn) in block) {
        val ref = insn.markRef()
        when {
            ref is StringReference && insn is OneRegisterInstruction -> strings[insn.registerA] = ref.string
            insn.opcode == Opcode.IGET_OBJECT && ref is FieldReference -> {
                if (ref.definingClass == THREAD_SCHEME && ref.type == MIG_SCHEME) mig = ref.id()
                if (ref.definingClass == QR_BUTTON && ref.type != THREAD_SCHEME && ref.type != CONTEXT) iconRead = ref
            }
            insn.opcode == Opcode.INVOKE_STATIC && ref is MethodReference && ref.params().size == 1 && iconRead != null &&
                ref.params() == listOf(iconRead!!.type) && ref.returnType.startsWith("L") && iconProvider == null -> {
                // The provider takes the register the icon field was just read into.
                val read = c[i - 1] as? TwoRegisterInstruction
                if (c[i - 1].opcode == Opcode.IGET_OBJECT && read?.registerA == insn.markArgs().first()) iconProvider = ref.toString()
            }
            insn.opcode == Opcode.IPUT_OBJECT && ref is FieldReference && ref.definingClass == builder -> {
                val value = (insn as TwoRegisterInstruction).registerA
                when {
                    ref.type == MIG_SCHEME -> builderScheme = ref.id()
                    ref.type == "Ljava/lang/String;" && strings[value] == QR_BUTTON_TAG -> tagField = ref.id()
                    value == listenerRegister -> listenerField = ref.id()
                }
            }
            insn.opcode == Opcode.INVOKE_DIRECT && ref is MethodReference && ref.name == "<init>" -> {
                val args = insn.markArgs()
                if (ref.params() == listOf("Ljava/lang/Object;", "I") && args.getOrNull(1) == pluginRead.registerA) {
                    listener = ref.definingClass
                    // The case is a constant set wherever the method keeps it, so follow any plain move to the call.
                    listenerCase = flow.narrowConstantAt(i, args[2])
                    listenerRegister = args[0]
                } else if (ref.params() == listOf(builder)) spec = ref.definingClass
            }
        }
    }
    val iconField = iconRead ?: return null
    // The plugin keeps more than one lazy of the icon's type, so the field is the one the block reads, by name.
    if (qr.fields.none { it.name == iconField.name && it.type == iconField.type && !AccessFlags.STATIC.isSet(it.accessFlags) }) return null
    // The QR plugin's constructor fills its icon field from a no-argument static call, which the button calls itself.
    val iconSource = qr.methods.filter { it.name == "<init>" }.flatMap { ctor ->
        val ic = ctor.markCode()
        (2 until ic.size).mapNotNull { k ->
            val store = ic[k].markRef() as? FieldReference
            val source = ic[k - 2].markRef() as? MethodReference
            if (ic[k].opcode == Opcode.IPUT_OBJECT && store?.name == iconField.name && ic[k - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                ic[k - 2].opcode == Opcode.INVOKE_STATIC && source != null && source.parameterTypes.isEmpty() && source.returnType == iconField.type) source.toString() else null
        }
    }.distinct().singleOrNull() ?: return null
    val provider = iconProvider ?: return null
    val providerType = provider.substringAfter(')')
    // The builder keeps its icon in an int field, which one public static helper on it fills from the provider's result.
    val setters = byType[builder]?.methods?.filter { m ->
        AccessFlags.STATIC.isSet(m.accessFlags) && AccessFlags.PUBLIC.isSet(m.accessFlags) && m.returnType == "V" &&
            m.parameterTypes.map(CharSequence::toString).let { it.size == 3 && it[1] == providerType && it[2] == builder }
    }.orEmpty()
    val setterMethod = setters.singleOrNull() ?: return null
    val setter = setterMethod.hookId()
    val iconType = setterMethod.parameterTypes[0].toString()
    val setterCode = setterMethod.markCode()
    val resolve = setterCode.getOrNull(0)?.markRef() as? MethodReference
    val store = setterCode.getOrNull(2)?.markRef() as? FieldReference
    if (setterCode.map { it.opcode } != listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IPUT, Opcode.RETURN_VOID) ||
        resolve == null || resolve.definingClass != providerType || resolve.params() != listOf(iconType) || resolve.returnType != "I" ||
        store == null || store.definingClass != builder || store.type != "I") return null
    // The QR block does the same two steps inline, so the helper is the button's own way of setting an icon.
    if (block.none { it.second.markRef()?.toString() == resolve.toString() } ||
        block.none { it.second.opcode == Opcode.IPUT && it.second.markRef()?.toString() == store.toString() }) return null
    // Messenger's Mark as read icon, by its enum name.
    val icon = byType[iconType]?.methods?.singleOrNull { it.name == "<clinit>" }?.markCode()?.let { ic ->
        ic.indices.filter { (ic[it].markRef() as? StringReference)?.string == MARK_READ_ICON }.flatMap { k ->
            (k + 1 until minOf(ic.size, k + 8)).mapNotNull { j ->
                (ic[j].markRef() as? FieldReference)?.takeIf { ic[j].opcode == Opcode.SPUT_OBJECT && it.type == iconType && it.definingClass == iconType }?.id()
            }.take(1)
        }.distinct().singleOrNull()
    } ?: return null
    val socketClass = byType[socketType] ?: return null
    fun socketField(type: String) = socketClass.fields.filter { it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .singleOrNull()?.takeIf { AccessFlags.FINAL.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }?.let { "$socketType->${it.name}:${it.type}" }
    val session = socketField(FB_USER_SESSION) ?: return null
    val thread = socketField(THREAD_KEY_TYPE) ?: return null
    val scheme = socketField(THREAD_SCHEME) ?: return null
    val listenerType = listener ?: return null
    val listenerClass = byType[listenerType] ?: return null
    // The listener keeps its Object argument in one field, which the tap hook reads back.
    val target = listenerClass.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;", "I") }?.let { ctor ->
        val p1 = ctor.parameterRegister(1)
        ctor.markCode().filter { it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA == p1 }
            .mapNotNull { (it.markRef() as? FieldReference)?.takeIf { f -> f.definingClass == listenerType && f.type == "Ljava/lang/Object;" }?.id() }.singleOrNull()
    } ?: return null
    val click = listenerClass.methods.singleOrNull { it.name == "onClick" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;") && it.returnType == "V" }
        ?: return null
    // The tap hook writes v0 and v1 ahead of the stock body, so a listener without them gets neither hook.
    if (click.implementation == null || AccessFlags.STATIC.isSet(click.accessFlags) || click.parameterRegister(0) < 2) return null
    val builderClass = byType[builder] ?: return null
    val specType = spec ?: return null
    val specClass = byType[specType] ?: return null
    if (builderClass.methods.none { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") }) return null
    // Every class the generated button names is public, since it lives in the extension's package.
    if (listOf(socketClass, builderClass, specClass, listenerClass).any { !it.isPublic() }) return null
    if (listOf(iconSource, provider, setter).any { ref ->
            val owner = byType[ref.substringBefore("->")] ?: return null
            val method = owner.methods.singleOrNull { it.hookId() == ref } ?: return null
            !owner.isPublic() || !AccessFlags.PUBLIC.isSet(method.accessFlags) || !AccessFlags.STATIC.isSet(method.accessFlags)
        }) return null
    val site = bar.markReadSite(list, pluginRead.registerB, socketType) ?: return null
    if (!bar.markReadCapMatches()) return null
    val tag = tagField ?: return null
    // The chat details button's builder: the bar's one call that takes the chat colors last and returns a button.
    val detailsRef = c.mapNotNull { insn ->
        (insn.markRef() as? MethodReference)?.takeIf { insn.opcode == Opcode.INVOKE_VIRTUAL && it.returnType == specType && it.params().lastOrNull() == MIG_SCHEME }
    }.map { it.toString() }.distinct().singleOrNull() ?: return null
    val details = byType[detailsRef.substringBefore("->")]?.methods?.singleOrNull { it.hookId() == detailsRef } ?: return null
    // It tags the button settings_button, which is how the extension finds the details button in either bar.
    val dc = details.markCode()
    if (dc.indices.none { k ->
            val put = dc[k] as? TwoRegisterInstruction
            dc[k].opcode == Opcode.IPUT_OBJECT && (dc[k].markRef() as? FieldReference)?.id() == tag &&
                (k - 1 downTo 0).firstOrNull { dc[it].markWrites(put!!.registerA) }?.let { (dc[it].markRef() as? StringReference)?.string } == MARK_READ_DETAILS_TAG
        }) return null
    // The newer bar is the one other method that makes the details button.
    val titleBar = classes.flatMap { it.methods }.filter { m -> m.hookId() != bar.hookId() && m.markCode().any { it.markRef()?.toString() == detailsRef } }
        .singleOrNull() ?: return null
    val titleBarSite = titleBar.markReadFactorySite() ?: return null
    // Its list goes back through ImmutableList.copyOf, since the bar casts what the factory returns.
    if (byType[IMMUTABLE_LIST]?.methods?.none { it.hookId() == LIST_COPY && AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) } != false) return null
    return MarkReadRecipe(bar, click, socketType, session, thread, scheme, mig ?: return null, builder, builderScheme ?: return null,
        tag, listenerField ?: return null, iconSource, provider, setter, icon, listenerType,
        listenerCase ?: return null, target, specType, site, list, pluginRead.registerB, titleBar, titleBarSite)
}

internal fun findMarkReadButton(classes: Iterable<ClassDef>): Pair<List<Method>, List<Method>> {
    markReadRecipe = resolveMarkReadRecipe(classes)
    return markReadRecipe?.let { listOf(it.bar, it.factory) to listOf(it.click) } ?: (emptyList<Method>() to emptyList())
}

private fun markReadRequire(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("Messenger controls: the chat top bar changed ($detail)")
}

/** Checks either top bar method against the recipe: the older plugin bar's list walk or the newer factory's return. */
internal fun MutableMethod.validateMarkReadBar(): MarkReadRecipe {
    val recipe = markReadRecipe
    markReadRequire(recipe != null && (recipe.bar.hookId() == hookId() || recipe.factory.hookId() == hookId()), "no button recipe")
    if (recipe!!.factory.hookId() == hookId()) {
        markReadRequire(markReadFactorySite() == recipe.factorySite, "button list return")
        return recipe
    }
    markReadRequire(markReadSite(recipe.list, recipe.socket, recipe.socketType) == recipe.site, "list walk")
    markReadRequire(markReadCapMatches(), "button limit")
    return recipe
}

internal fun MutableMethod.injectMarkReadBar() {
    val recipe = validateMarkReadBar()
    if (recipe.factory.hookId() != hookId()) {
        addInstructions(recipe.site, "invoke-static {v${recipe.list}, v${recipe.socket}}, $MARK_READ_ADD")
        return
    }
    val f = recipe.factorySite
    val (a, b, c) = f.scratch
    addInstructions(f.site, """
        move-object/from16 v$a, v${f.session}
        move-object/from16 v$b, v${f.thread}
        move-object/from16 v$c, v${f.mig}
        invoke-static {v${f.list}, v$a, v$b, v$c}, $MARK_READ_ADD_TO
        move-result-object v${f.list}
        invoke-static {v${f.list}}, $LIST_COPY
        move-result-object v${f.list}
    """.trimIndent())
}

internal fun MutableMethod.validateMarkReadClick(): MarkReadRecipe {
    val recipe = markReadRecipe
    markReadRequire(recipe != null && recipe.click.hookId() == hookId() && !AccessFlags.STATIC.isSet(accessFlags), "no tap listener")
    // Two locals for the tag and the view, ahead of the stock body.
    markReadRequire(parameterRegister(0) >= 2, "tap listener registers")
    return recipe!!
}

/** Our tag answers the tap; anything else is one of Messenger's buttons and goes on as before. */
internal fun MutableMethod.injectMarkReadClick() {
    val recipe = validateMarkReadClick()
    addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        iget-object v0, v0, ${recipe.target}
        move-object/from16 v1, p1
        invoke-static {v0, v1}, $MARK_READ_CLICKED
        move-result v0
        if-eqz v0, :stock_click
        return-void
    """.trimIndent(), ExternalLabel("stock_click", getInstruction(0)))
}

/** One of the extension's two builder stubs as shipped: static, not private, returning null. */
internal fun MutableMethod.validateMarkReadStub(id: String) {
    val code = markCode()
    if (hookId() != id || !AccessFlags.STATIC.isSet(accessFlags) || AccessFlags.PRIVATE.isSet(accessFlags) ||
        code.map { it.opcode } != listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT) || (code[0] as? NarrowLiteralInstruction)?.narrowLiteral != 0 ||
        implementation!!.tryBlocks.isNotEmpty())
        throw PatchException("Messenger controls: the Mark as read button's extension stub changed")
}

private fun MutableMethod.emptyCopy(registers: Int) = MutableMethod(ImmutableMethod(definingClass, name, parameters, returnType, accessFlags,
    annotations, hiddenApiRestrictions, ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))

/** The build(socket) stub's replacement for the older bar: reads the chat, account and colors from the socket for button(). */
internal fun markReadSocketBuilder(stub: MutableMethod, recipe: MarkReadRecipe): MutableMethod {
    stub.validateMarkReadStub(MARK_READ_BUILD)
    val built = stub.emptyCopy(4)
    built.addInstructionsWithLabels(0, """
        instance-of v0, p0, ${recipe.socketType}
        if-eqz v0, :none
        check-cast p0, ${recipe.socketType}
        iget-object v0, p0, ${recipe.session}
        iget-object v1, p0, ${recipe.thread}
        iget-object v2, p0, ${recipe.scheme}
        if-eqz v2, :none
        iget-object v2, v2, ${recipe.mig}
        invoke-static {v0, v1, v2}, $MARK_READ_BUTTON_BUILD
        move-result-object v0
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    return built
}

/**
 * The button(session, thread, mig) stub's replacement: the QR scanner block with the chat's tag as the listener's
 * Object, Messenger's Mark as read icon, the extension's label and test tag. Null whenever the chat isn't known yet or
 * the colors aren't Messenger's color scheme.
 */
internal fun markReadBuilder(stub: MutableMethod, recipe: MarkReadRecipe): MutableMethod {
    stub.validateMarkReadStub(MARK_READ_BUTTON_BUILD)
    val built = stub.emptyCopy(7)
    built.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $MARK_READ_TAG
        move-result-object v1
        if-eqz v1, :none
        instance-of v0, p2, $MIG_SCHEME
        if-eqz v0, :none
        move-object v0, p2
        check-cast v0, $MIG_SCHEME
        invoke-static {}, $MARK_READ_LABEL
        move-result-object v2
        new-instance v3, ${recipe.builder}
        invoke-direct {v3, v2}, ${recipe.builder}-><init>(Ljava/lang/String;)V
        iput-object v0, v3, ${recipe.builderScheme}
        invoke-static {}, ${recipe.iconSource}
        move-result-object v0
        invoke-static {v0}, ${recipe.iconProvider}
        move-result-object v0
        sget-object v2, ${recipe.icon}
        invoke-static {v2, v0, v3}, ${recipe.iconSetter}
        const-string v0, "$MARK_READ_VIEW_TAG"
        iput-object v0, v3, ${recipe.tagField}
        const/16 v0, ${recipe.listenerCase}
        new-instance v2, ${recipe.listener}
        invoke-direct {v2, v1, v0}, ${recipe.listener}-><init>(Ljava/lang/Object;I)V
        iput-object v2, v3, ${recipe.listenerField}
        new-instance v0, ${recipe.spec}
        invoke-direct {v0, v3}, ${recipe.spec}-><init>(${recipe.builder})V
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent())
    return built
}
