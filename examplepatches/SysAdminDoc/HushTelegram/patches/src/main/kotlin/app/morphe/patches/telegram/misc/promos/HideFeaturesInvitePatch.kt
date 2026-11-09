/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.promos

import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origString
import app.morphe.util.names.addInstructions
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val FEATURES_INVITE = "$EXTENSION_PACKAGE/misc/FeaturesInvite;"
internal const val ADD_FEATURES = "$FEATURES_INVITE->addFeaturesRow(Ljava/util/ArrayList;Ljava/lang/Object;)Z"
internal const val SECTION_COUNT = "$FEATURES_INVITE->sectionCount(Ljava/lang/Object;II)I"
internal const val SECTION_ROW = "$FEATURES_INVITE->sectionRow(Ljava/lang/Object;II)I"
internal const val LIST_SHOWN = "$FEATURES_INVITE->listShown(Ljava/lang/Object;)V"
internal const val FEATURES_LABEL = "Lorg/telegram/messenger/R\$string;->TelegramFeatures:I"
internal const val INVITE_LABEL = "Lorg/telegram/messenger/R\$string;->InviteFriends:I"
internal const val INVITE_ICON = "Lorg/telegram/messenger/R\$drawable;->settings_invite:I"
internal const val APPEND = "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"
private const val STRING = "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;"
private const val CACHE_PUT = "Landroid/util/SparseIntArray;->put(II)V"
private val ROW_FACTORY = List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" }
private val STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** How close the Help row's factory call follows its label. */
private const val FACTORY_REACH = 10

/** How close the empty Contacts list's flag is read before its Invite Friends heading. */
private const val HEADING_REACH = 4

@Suppress("unused")
val hideFeaturesInvitePatch = bytecodePatch(
    name = "Hide Telegram Features and Invite Friends",
    description = "Removes the Telegram Features row from Settings and the Invite Friends rows from Contacts. Starts " +
        "off. Turn it on in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveFeaturesInvite()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insert(MutableMethod(ImmutableMethod.of(site.settings)), MutableMethod(ImmutableMethod.of(site.counter)),
            MutableMethod(ImmutableMethod.of(site.rows)))
        writeStub(FEATURES_INVITE, "inviteLayout", 2, """
            instance-of v0, p0, ${site.adapter}
            if-eqz v0, :hush_none
            check-cast p0, ${site.adapter}
            iget-boolean v0, p0, ${site.phonebook}
            if-eqz v0, :hush_none
            iget v0, p0, ${site.onlyUsers}
            if-nez v0, :hush_none
            iget-boolean v0, p0, ${site.inviteList}
            if-nez v0, :hush_list
            const/4 v0, 0x1
            return v0
            :hush_list
            const/4 v0, 0x2
            return v0
            :hush_none
            const/4 v0, 0x0
            return v0
        """)
        // Each step returns on its own, so no register meets a label holding two kinds of value.
        writeStub(FEATURES_INVITE, "rebuildList", 5, """
            instance-of v0, p0, ${site.settingsType}
            if-nez v0, :hush_settings
            return-void
            :hush_settings
            check-cast p0, ${site.settingsType}
            iget-object v1, p0, ${site.listField}
            if-nez v1, :hush_list
            return-void
            :hush_list
            iget-object v2, v1, ${site.adapterField}
            if-nez v2, :hush_adapter
            return-void
            :hush_adapter
            const/4 v3, 0x1
            invoke-virtual {v2, v3}, ${site.update}
            return-void
        """)
        site.insert(site.settings, site.counter, site.rows)
        enableStatus("hideFeaturesAndInvite")
    }
}

/**
 * [settings] builds Settings' list, and [append] adds its Telegram Features row. [counter] is the
 * sectioned list base's cached section count, with [counted] the count Telegram's adapter answered,
 * and [rows] the base's row-in-section lookup, with [row] the row it worked out. The Contacts
 * adapter is [adapter], and its fields say whether it's the main list ([phonebook]), a picker
 * ([onlyUsers]) and whether it has no Telegram contacts and lists people to invite ([inviteList]).
 * The Settings screen ([settingsType]) holds its list view in [listField], the view its adapter in
 * [adapterField], and [update] has that adapter build its rows again.
 */
internal class FeaturesInviteSite(
    val settings: MutableMethod,
    val append: Int,
    val counter: MutableMethod,
    val counted: Int,
    val rows: MutableMethod,
    val row: Int,
    val adapter: String,
    val phonebook: String,
    val onlyUsers: String,
    val inviteList: String,
    val settingsType: String,
    val listField: String,
    val adapterField: String,
    val update: String,
) {
    fun insert(settings: MutableMethod, counter: MutableMethod, rows: MutableMethod) {
        val (list, item) = settings.controlBody()[append].namedRegisters()
        settings.replaceInstruction(append, "invoke-static {v$list, v$item}, $ADD_FEATURES")
        // The builder's first argument is the Settings screen, untouched before its first instruction.
        val screen = settings.parameterRegisterNumber(0)
        settings.addInstructions(0, "invoke-static/range {v$screen .. v$screen}, $LIST_SHOWN")
        val (self, section) = counter.controlBody()[counted - 1].namedRegisters()
        val count = counter.controlBody()[counted].namedRegisters().single()
        counter.addInstructions(counted + 1, "invoke-static {v$self, v$section, v$count}, $SECTION_COUNT\nmove-result v$count")
        val asked = rows.controlBody().indices.single { rows.controlBody()[it].controlRef() == ref(this.counter) }
        val (owner, which) = rows.controlBody()[asked].namedRegisters()
        val value = rows.controlBody()[row].namedRegisters().first()
        rows.addInstructions(row + 1, "invoke-static {v$owner, v$which, v$value}, $SECTION_ROW\nmove-result v$value")
    }
}

internal fun BytecodePatchContext.resolveFeaturesInvite(): FeaturesInviteSite {
    requireStatusMethod("hideFeaturesAndInvite")
    controlHook(FEATURES_INVITE, "addFeaturesRow", listOf("Ljava/util/ArrayList;", "Ljava/lang/Object;"), "Z")
    controlHook(FEATURES_INVITE, "sectionCount", listOf("Ljava/lang/Object;", "I", "I"), "I")
    controlHook(FEATURES_INVITE, "sectionRow", listOf("Ljava/lang/Object;", "I", "I"), "I")
    controlHook(FEATURES_INVITE, "inviteLayout", listOf("Ljava/lang/Object;"), "I")
    controlHook(FEATURES_INVITE, "listShown", listOf("Ljava/lang/Object;"), "V")
    controlHook(FEATURES_INVITE, "rebuildList", listOf("Ljava/lang/Object;"), "V")

    val builders = mutableListOf<Pair<String, String>>()
    val binders = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(FEATURES_LABEL) or (Mention.reference(INVITE_LABEL) and Mention.reference(INVITE_ICON))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val refs = m.controlBody().mapNotNull { it.controlRef() }
            if (FEATURES_LABEL in refs && AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" &&
                m.origParameterTypes == listOf(cls.origType, "Ljava/util/ArrayList;")) builders += cls.type to ref(m)
            if (INVITE_LABEL in refs && INVITE_ICON in refs && !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" &&
                m.parameterTypes.size == 3 && m.parameterTypes.take(2).map(CharSequence::toString) == listOf("I", "I")) binders += cls.type to ref(m)
        }
    }

    // Settings: the Telegram Features label, its title, the row factory and the row's own append.
    val (settingsType, settingsRef) = builders.controlSingle("Settings' list builder")
    val settings = tgMutableClassDefBy(settingsType).methods.single { ref(it) == settingsRef }
    val body = settings.controlBody()
    val label = body.indices.filter { body[it].controlRef() == FEATURES_LABEL }.controlSingle("Telegram Features label")
    controlShape(body.getOrNull(label + 1)?.isGetString() == true && body.getOrNull(label + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT,
        "the Telegram Features label no longer becomes a row title")
    val title = body[label + 2].namedRegisters().single()
    val factory = (label + 3 until minOf(body.size, label + FACTORY_REACH)).firstOrNull { at ->
        body[at].opcode in STATIC_CALLS && body[at].call()?.parameterTypes?.map(CharSequence::toString) == ROW_FACTORY
    }
    controlShape(factory != null && body[factory].namedRegisters().getOrNull(4) == title && (label + 3 until factory).none { body[it].writes(title) },
        "the Telegram Features row isn't made from its title")
    val append = factory!! + 2
    controlShape(body[factory + 1].opcode == Opcode.MOVE_RESULT_OBJECT && body.getOrNull(append)?.opcode == Opcode.INVOKE_VIRTUAL &&
        body[append].controlRef() == APPEND && body[append].namedRegisters()[1] == body[factory + 1].namedRegisters().single(),
        "the Telegram Features row has no append of its own")
    // The builder copies its list argument once into a low register; another list in the same method holds account numbers.
    val list = body[append].namedRegisters()[0]
    val argument = settings.parameterRegisterNumber(1)
    val copies = body.filter { it.writes(list) }
    controlShape(body[append].namedRegisters().all { it <= 15 } && body.none { it.writes(argument) } &&
        (copies.isEmpty() && list == argument ||
            copies.size == 1 && copies[0].opcode in OBJECT_MOVES && copies[0].namedRegisters() == listOf(list, argument)),
        "the Telegram Features row isn't added to Settings' own list")

    // Settings keeps the rows it built: onResume reaches its adapter through the list view, and the
    // screen's one (Z)V call on that adapter builds the rows again.
    val screen = tgClassDefByOrNull(settingsType)!!
    val resume = screen.methods.filter { it.origName == "onResume" && shape(it, emptyList(), "V") }.controlSingle("Settings' onResume").controlBody()
    val view = resume.indices.filter { at ->
        resume[at].opcode == Opcode.IGET_OBJECT && resume[at].controlField()?.origDefiningClass == settingsType &&
            resume.getOrNull(at + 1)?.opcode == Opcode.IGET_OBJECT && resume[at + 1].namedRegisters().getOrNull(1) == resume[at].namedRegisters()[0]
    }.controlSingle("Settings' list adapter")
    val listField = resume[view].controlField()!!
    val adapterField = resume[view + 1].controlField()!!
    controlShape(adapterField.origDefiningClass == listField.origType, "Settings' adapter isn't its list view's")
    val update = screen.methods.flatMap { m -> m.controlBody().filter { it.opcode == Opcode.INVOKE_VIRTUAL } }.mapNotNull { it.call() }
        .filter { it.origDefiningClass == adapterField.origType && it.origParameterTypes == listOf("Z") && it.origReturnType == "V" }
        .map { "${it.origDefiningClass}->${it.origName}(Z)V" }.distinct().controlSingle("Settings' list update")
    controlShape(AccessFlags.PUBLIC.isSet(screen.accessFlags) && reachable(listField.definingClass, listField.name) &&
        reachable(adapterField.definingClass, adapterField.name) && tgClassDefByOrNull(adapterField.type)?.let { found ->
            AccessFlags.PUBLIC.isSet(found.accessFlags) && found.methods.any { "${it.origDefiningClass}->${it.origName}(Z)V" == update && AccessFlags.PUBLIC.isSet(it.accessFlags) }
        } == true, "Settings' list update can't be called from outside")

    // Contacts: the adapter that binds Invite Friends, and the sectioned list base it extends.
    val (adapterType, binderRef) = binders.controlSingle("the Contacts list's row binder")
    val adapter = tgClassDefByOrNull(adapterType)!!
    val base = tgClassDefByOrNull(adapter.superclass ?: "")
    controlShape(base != null && AccessFlags.ABSTRACT.isSet(base.accessFlags), "the Contacts list no longer extends a sectioned list")
    val count = base!!.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) && shape(it, listOf("I"), "I") }.controlSingle("a section's row count")
    val counter = base.methods.filter { m -> !AccessFlags.STATIC.isSet(m.accessFlags) && shape(m, listOf("I"), "I") &&
        m.controlBody().any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == ref(count) } }.controlSingle("the cached section count")
    val rows = base.methods.filter { m -> !AccessFlags.STATIC.isSet(m.accessFlags) && shape(m, listOf("I"), "I") &&
        m.controlBody().let { b -> b.any { it.controlRef() == ref(counter) } && b.any { it.opcode == Opcode.SUB_INT } && b.any { it.controlRef() == CACHE_PUT } } }
        .controlSingle("the row-in-section lookup")

    val counted = counter.controlBody().let { b ->
        val call = b.indices.filter { b[it].controlRef() == ref(count) }.controlSingle("section count call")
        controlShape(b[call].namedRegisters() == listOf(counter.localRegisterCount(), counter.parameterRegisterNumber(0)) &&
            b.getOrNull(call + 1)?.opcode == Opcode.MOVE_RESULT && b[call].namedRegisters().all { it <= 15 } && b[call + 1].namedRegisters().single() <= 15,
            "the cached section count doesn't ask the adapter for its own section")
        controlShape(onlyEntry(counter, call + 2, call + 1), "something jumps past the section count's answer")
        call + 1
    }
    val row = rows.controlBody().let { b ->
        val asked = b.indices.filter { b[it].controlRef() == ref(counter) }.controlSingle("section walk")
        val (owner, which) = b[asked].namedRegisters()
        val at = b.indices.filter { b[it].opcode == Opcode.SUB_INT }.controlSingle("row-in-section subtraction")
        val value = b[at].namedRegisters()
        controlShape(owner == rows.localRegisterCount() && at > asked && value[1] == rows.parameterRegisterNumber(0) &&
            (asked + 1 until at).none { b[it].writes(owner) || b[it].writes(which) } && (value + owner + which).all { it <= 15 },
            "the row-in-section lookup doesn't subtract the section's start from the asked row")
        controlShape(b.withIndex().any { (i, it) -> i > at && it.controlRef() == CACHE_PUT && it.namedRegisters().drop(1) == listOf(value[1], value[0]) } &&
            b.withIndex().any { (i, it) -> i > at && it.opcode == Opcode.RETURN && it.namedRegisters() == listOf(value[0]) },
            "the row-in-section lookup no longer caches and returns its answer")
        controlShape(onlyEntry(rows, at + 1, at), "something jumps past the row-in-section subtraction")
        at
    }

    // The adapter's flags: the constructor's boolean and first int arguments, and the flag tested just before the empty list's heading.
    val init = adapter.methods.filter { it.origName == "<init>" }.controlSingle("Contacts list constructor")
    val initBody = init.controlBody()
    controlShape(ControlFlow.of(init).normal.withIndex().all { (at, next) -> next.all { it > at } }, "the Contacts list constructor loops")
    fun stored(parameter: String, opcode: Opcode): String {
        val index = init.parameterTypes.indexOfFirst { it.toString() == parameter }
        controlShape(index >= 0, "the Contacts list constructor has no $parameter argument")
        val from = init.parameterRegisterNumber(index)
        // The constructor has no loops; once the argument's register is reused, later stores hold other flags.
        val store = initBody.indices.filter { at ->
            initBody[at].opcode == opcode && initBody[at].namedRegisters() == listOf(from, init.localRegisterCount()) &&
                (0 until at).none { initBody[it].writes(from) }
        }.controlSingle("the Contacts list's $parameter flag")
        return initBody[store].controlRef()!!
    }
    val phonebook = stored("Z", Opcode.IPUT_BOOLEAN)
    val onlyUsers = stored("I", Opcode.IPUT)
    val binder = adapter.methods.single { ref(it) == binderRef }
    val bound = binder.controlBody()
    // A heading is where the label's text is fetched: 13.2 loads the id once at the top and fetches it further down.
    val boundFlow = ControlFlow.of(binder)
    val headings = bound.indices.filter { at -> bound[at].isGetString() &&
        boundFlow.oneWrite(at, bound[at].namedRegisters().first())?.let { bound[it].controlRef() == INVITE_LABEL } == true }
    val inviteList = headings.flatMap { at ->
        (at - 1 downTo 0).filter { bound[it].controlRef() != INVITE_LABEL }.take(HEADING_REACH)
            .filter { bound[it].opcode == Opcode.IGET_BOOLEAN && bound[it].controlField()?.origDefiningClass == adapterType }
            .map { bound[it].controlRef()!! }
    }.filter { it != phonebook }.distinct().controlSingle("the empty Contacts list's flag")
    controlShape(adapter.methods.any { it.origName == count.origName && shape(it, listOf("I"), "I") && it.controlBody().firstOrNull()?.controlRef() == inviteList },
        "the empty Contacts list's flag no longer decides its section counts")
    controlShape(AccessFlags.PUBLIC.isSet(adapter.accessFlags) && listOf(phonebook, onlyUsers, inviteList).all { wanted ->
        adapter.fields.any { it.origString() == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }
    }, "the Contacts list's flags can't be read from outside")

    val base2 = tgMutableClassDefBy(base.type)
    return FeaturesInviteSite(settings, append, base2.methods.single { ref(it) == ref(counter) }, counted,
        base2.methods.single { ref(it) == ref(rows) }, row, adapterType, phonebook, onlyUsers, inviteList,
        settingsType, "${listField.definingClass}->${listField.name}:${listField.type}",
        "${adapterField.definingClass}->${adapterField.name}:${adapterField.type}", update)
}

/** A public instance field of a public class, so the extension's stub can read it. */
private fun BytecodePatchContext.reachable(type: String, name: String): Boolean {
    val owner = tgClassDefByOrNull(type) ?: return false
    return AccessFlags.PUBLIC.isSet(owner.accessFlags) &&
        owner.fields.any { it.origName == name && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }
}

/** Only [from] reaches [at], so an insert there runs on every path. */
private fun onlyEntry(method: Method, at: Int, from: Int): Boolean {
    val flow = ControlFlow.of(method)
    return flow.normal.indices.filter { at in flow.normal[it] } == listOf(from)
}

/** The one write of [register] that reaches [use] on every path in, or null when none or several do. */
private fun ControlFlow.oneWrite(use: Int, register: Int): Int? {
    val predecessors = Array(instructions.size) { mutableListOf<Int>() }
    for (index in instructions.indices) for (next in normal[index] + exceptional[index]) predecessors[next] += index
    val pending = ArrayDeque(predecessors[use])
    val visited = mutableSetOf<Int>()
    val found = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (!visited.add(index)) continue
        if (instructions[index].writes(register)) found += index
        else if (predecessors[index].isEmpty()) return null
        else pending.addAll(predecessors[index])
    }
    return found.singleOrNull()
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

private fun shape(m: Method, parameters: List<String>, result: String) = m.origParameterTypes == parameters && m.origReturnType == result
private fun ref(m: Method) = m.origString()

/** LocaleController.getString(int), which 13.2 mostly inlines into getString(null, int) with the two swapped. */
private fun Instruction.isGetString() = controlRef() == STRING || ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let {
    it.origDefiningClass == "Lorg/telegram/messenger/LocaleController;" && it.origName == "getString" &&
        it.origParameterTypes == listOf("I", "Ljava/lang/String;") } == true
