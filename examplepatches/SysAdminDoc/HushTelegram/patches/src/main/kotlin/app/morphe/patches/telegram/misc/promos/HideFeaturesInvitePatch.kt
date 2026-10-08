/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.promos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val FEATURES_INVITE = "$EXTENSION_PACKAGE/misc/FeaturesInvite;"
internal const val ADD_FEATURES = "$FEATURES_INVITE->addFeaturesRow(Ljava/util/ArrayList;Ljava/lang/Object;)Z"
internal const val SECTION_COUNT = "$FEATURES_INVITE->sectionCount(Ljava/lang/Object;II)I"
internal const val SECTION_ROW = "$FEATURES_INVITE->sectionRow(Ljava/lang/Object;II)I"
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
    description = "Adds a switch, off by default, that takes the Telegram Features row out of Settings and the Invite Friends rows out of Contacts.",
    default = true,
) {
    category("Chats")
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
) {
    fun insert(settings: MutableMethod, counter: MutableMethod, rows: MutableMethod) {
        val (list, item) = settings.controlBody()[append].namedRegisters()
        settings.replaceInstruction(append, "invoke-static {v$list, v$item}, $ADD_FEATURES")
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

    val builders = mutableListOf<Pair<String, String>>()
    val binders = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            val refs = m.controlBody().mapNotNull { it.controlRef() }
            if (FEATURES_LABEL in refs && AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                m.parameterTypes.map(CharSequence::toString) == listOf(cls.type, "Ljava/util/ArrayList;")) builders += cls.type to ref(m)
            if (INVITE_LABEL in refs && INVITE_ICON in refs && !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                m.parameterTypes.size == 3 && m.parameterTypes.take(2).map(CharSequence::toString) == listOf("I", "I")) binders += cls.type to ref(m)
        }
    }

    // Settings: the Telegram Features label, its title, the row factory and the row's own append.
    val (settingsType, settingsRef) = builders.controlSingle("Settings' list builder")
    val settings = mutableClassDefBy(settingsType).methods.single { ref(it) == settingsRef }
    val body = settings.controlBody()
    val label = body.indices.filter { body[it].controlRef() == FEATURES_LABEL }.controlSingle("Telegram Features label")
    controlShape(body.getOrNull(label + 1)?.controlRef() == STRING && body.getOrNull(label + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT,
        "the Telegram Features label no longer becomes a row title")
    val title = body[label + 2].namedRegisters().single()
    val factory = (label + 3 until minOf(body.size, label + FACTORY_REACH)).firstOrNull { at ->
        body[at].opcode in STATIC_CALLS && body[at].controlCall()?.parameterTypes?.map(CharSequence::toString) == ROW_FACTORY
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

    // Contacts: the adapter that binds Invite Friends, and the sectioned list base it extends.
    val (adapterType, binderRef) = binders.controlSingle("the Contacts list's row binder")
    val adapter = classDefByOrNull(adapterType)!!
    val base = classDefByOrNull(adapter.superclass ?: "")
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
    val init = adapter.methods.filter { it.name == "<init>" }.controlSingle("Contacts list constructor")
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
    val inviteList = bound.indices.filter { bound[it].controlRef() == INVITE_LABEL }.flatMap { at ->
        (maxOf(0, at - HEADING_REACH) until at).filter { bound[it].opcode == Opcode.IGET_BOOLEAN && bound[it].controlField()?.definingClass == adapterType }
            .map { bound[it].controlRef()!! }
    }.filter { it != phonebook }.distinct().controlSingle("the empty Contacts list's flag")
    controlShape(adapter.methods.any { it.name == count.name && shape(it, listOf("I"), "I") && it.controlBody().firstOrNull()?.controlRef() == inviteList },
        "the empty Contacts list's flag no longer decides its section counts")
    controlShape(AccessFlags.PUBLIC.isSet(adapter.accessFlags) && listOf(phonebook, onlyUsers, inviteList).all { wanted ->
        adapter.fields.any { "${it.definingClass}->${it.name}:${it.type}" == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }
    }, "the Contacts list's flags can't be read from outside")

    val base2 = mutableClassDefBy(base.type)
    return FeaturesInviteSite(settings, append, base2.methods.single { ref(it) == ref(counter) }, counted,
        base2.methods.single { ref(it) == ref(rows) }, row, adapterType, phonebook, onlyUsers, inviteList)
}

/** Only [from] reaches [at], so an insert there runs on every path. */
private fun onlyEntry(method: Method, at: Int, from: Int): Boolean {
    val flow = ControlFlow.of(method)
    return flow.normal.indices.filter { at in flow.normal[it] } == listOf(from)
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

private fun shape(m: Method, parameters: List<String>, result: String) = m.parameterTypes.map(CharSequence::toString) == parameters && m.returnType == result
private fun ref(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
