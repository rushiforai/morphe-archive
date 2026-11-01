/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 452 (2026-10-22).
 */
package app.morphe.patches.threads.feed.swipesearch

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.ads.sourceOrNull
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireParameterIntact
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.argumentRegister
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Disable swipe to Search"
internal const val SWIPE_TO_SEARCH = "$EXTENSION_PACKAGE/feed/SwipeToSearch;"
internal const val ALLOW = "$SWIPE_TO_SEARCH->allow(Z)Z"

/** The start of the Compose note Threads keeps in its home screen, the function that lays out the home pager. */
internal const val TABS_NOTE = "com.instagram.barcelona.mainactivity.tabsscreen.BarcelonaMainTabsScreen ("

/** The home pager's pages, the constants of its page enum. */
internal const val FEED_PAGE = "FEED"
internal const val SEARCH_PAGE = "SEARCH"

/**
 * The swipe into Search: in the home screen [screen], the `if-eqz` at [guard] that leaves Search out
 * of the home pager when the home screen state's final boolean [flag] is false, and the state's
 * [constructor], whose `iput-boolean` at [store] writes [flag] from its declared parameter [parameter].
 */
internal class SwipePage(
    val screen: Method,
    val guard: Int,
    val flag: FieldReference,
    val constructor: MutableMethod,
    val parameter: Int,
    val store: Int,
)

/**
 * Stops a sideways swipe on the feed from sliding into Search.
 *
 * On some accounts Threads' home screen is a pager of two pages, the feed and Search, and a server
 * flag decides it. The flag is read once, when the home screen's state is made, and kept in a final
 * boolean of the state. The home screen then builds its pages as `listOfNotNull(FEED, if (flag)
 * SEARCH else null)`, so with the flag false the pager holds the feed alone and the Search button
 * opens Search as a screen of its own, which is what every account without the flag gets. The
 * extension is asked for the flag first thing in the state's constructor, before it's stored, and
 * while the switch is on it answers false. Every state Threads makes, copies included, goes through
 * that constructor.
 *
 * The home screen is found by its Compose note, and the check by its shape there: a boolean read
 * from the state, an `if-eqz` on it that skips only the read of the SEARCH page, and an array of the
 * FEED page and that page. The page enum has to be an enum of exactly FEED and SEARCH, the check has
 * to be the only one, the flag has to be final with one write, in a constructor, from a boolean
 * parameter the constructor hasn't written over. Anything else is refused rather than guessed.
 */
@Suppress("unused")
val disableSwipeToSearchPatch = bytecodePatch(
    name = PATCH,
    description = "Stops a sideways swipe on your feed from sliding into Search. The Search button still opens " +
        "Search. Threads only has the swipe on some accounts. Good if you keep landing in Search while you scroll. " +
        "Starts off. Turn it on in HushThreads settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("disableSwipeToSearch")
        val page = swipePage()
        val flag = page.constructor.parameterRegister(page.parameter)
        page.constructor.addInstructions(
            0,
            """
                invoke-static/range { $flag .. $flag }, $ALLOW
                move-result $flag
            """,
        )
        enableStatus("disableSwipeToSearch")
    }
}

/** A method's full signature. A Method is a MethodReference too. */
private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.descriptor() = "$definingClass->$name:$type"

/** The home pager's check and the constructor that stores what it reads. Throws unless each is the only one. */
internal fun BytecodePatchContext.swipePage(): SwipePage {
    val sites = classDefByStrings(TABS_NOTE, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .distinctBy { it.signature() }
        .filter { method -> method.implementation?.instructions?.any { it.isTabsNote() } == true }
        .flatMap { method -> method.searchPageChecks().map { (guard, array) -> Triple(method, guard, array) } }
    val (screen, guard, array) = sites.singleOrPatchException("$PATCH: the home pager's check on its Search page")
    requirePages(screen, guard, array)
    val flag = screen.implementation!!.instructions.elementAt(guard - 1).getReference<FieldReference>()!!
    val (constructor, store) = flagStore(flag)
    return SwipePage(screen, guard, flag, constructor, constructor.storedParameter(store), store)
}

internal fun Instruction.isTabsNote(): Boolean =
    opcode == Opcode.CONST_STRING && getReference<StringReference>()?.string?.startsWith(TABS_NOTE) == true

/**
 * The `if-eqz` instructions in this method that test a boolean just read from a field and skip the
 * static read of the Search page, with the index of the `filled-new-array` the two paths meet
 * again at: the shape of the home pager's check. 452 falls straight from the read into the array,
 * while 453 loads null on the branch and jumps back to it. [requirePages] says whether what they
 * build is the pager's pages.
 */
private fun Method.searchPageChecks(): List<Pair<Int, Int>> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    return (1 until code.size - 1).filter { at ->
        code[at].opcode == Opcode.IF_EQZ && code[at - 1].opcode == Opcode.IGET_BOOLEAN &&
            code[at + 1].opcode == Opcode.SGET_OBJECT
    }.mapNotNull { at ->
        val read = code[at - 1] as TwoRegisterInstruction
        if ((code[at] as OneRegisterInstruction).registerA != read.registerA) return@mapNotNull null
        val search = (code[at + 1] as OneRegisterInstruction).registerA
        val array = code.indices.firstOrNull { index ->
            index > at + 1 && code[index].opcode == Opcode.FILLED_NEW_ARRAY &&
                code[index].getReference<TypeReference>()?.type?.startsWith("[") == true &&
                (code[index] as FiveRegisterInstruction).let { pages ->
                    (0 until pages.registerCount).any { pages.argumentRegister(it) == search }
                }
        } ?: return@mapNotNull null
        at to array
    }
}

/**
 * The page enum's constants by field name, for the enum [type]: each constant's name is the last
 * string loaded before its static field is set. Null unless [type] is an enum.
 */
private fun BytecodePatchContext.pageNames(type: String): Map<String, String>? {
    val enum = classDefByOrNull(type) ?: return null
    if (enum.superclass != "Ljava/lang/Enum;") return null
    val code = enum.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList() ?: return null
    val names = mutableMapOf<String, String>()
    var last: String? = null
    for (instruction in code) {
        instruction.getReference<StringReference>()?.let { if (instruction.opcode == Opcode.CONST_STRING) last = it.string }
        val field = instruction.getReference<FieldReference>()
        if (instruction.opcode == Opcode.SPUT_OBJECT && field != null && field.type == type && field.definingClass == type) {
            names[field.name] = last ?: return null
        }
    }
    return names
}

/** Throws unless the check at [guard] in [screen] is the home pager's: an array of FEED and SEARCH from the page enum. */
private fun BytecodePatchContext.requirePages(screen: Method, guard: Int, array: Int) {
    val code = screen.implementation!!.instructions.toList()
    val search = code[guard + 1].getReference<FieldReference>()!!
    val pages = code[array] as FiveRegisterInstruction
    val whenRead = "${screen.signature()} at $guard"
    if (code[array].getReference<TypeReference>()?.type != "[${search.type}" || pages.registerCount != 2 ||
        pages.registerD != (code[guard + 1] as OneRegisterInstruction).registerA
    ) {
        throw PatchException("$PATCH: the check in $whenRead doesn't skip the second page of an array of its pages")
    }
    val names = pageNames(search.type)
    if (names == null || names.values.toSet() != setOf(FEED_PAGE, SEARCH_PAGE) || names.size != 2) {
        throw PatchException("$PATCH: the pages in $whenRead come from ${search.type}, not an enum of $FEED_PAGE and $SEARCH_PAGE")
    }
    val feed = screen.sourceOrNull(array, pages.registerC)?.takeIf { it.at >= 0 }?.let { code[it.at] }
    val feedField = feed?.getReference<FieldReference>()
    if (names[search.name] != SEARCH_PAGE || feed?.opcode != Opcode.SGET_OBJECT || feedField?.definingClass != search.type ||
        names[feedField.name] != FEED_PAGE
    ) {
        throw PatchException("$PATCH: the pages in $whenRead aren't $FEED_PAGE and then $SEARCH_PAGE")
    }
}

/**
 * The one write of [flag], as the mutable constructor that writes it and the index of the
 * `iput-boolean`. Throws unless [flag] is a final field of its class, written once, in a constructor.
 */
private fun BytecodePatchContext.flagStore(flag: FieldReference): Pair<MutableMethod, Int> {
    val owner = mutableClassDefBy(flag.definingClass)
    val field = owner.fields.singleOrNull { it.name == flag.name && it.type == flag.type }
    if (field == null || !AccessFlags.FINAL.isSet(field.accessFlags) || AccessFlags.STATIC.isSet(field.accessFlags)) {
        throw PatchException("$PATCH: ${flag.descriptor()} isn't a final field of the home screen's state")
    }
    // A final field is written only by its own class.
    val stores = owner.methods.flatMap { method ->
        val code = method.implementation?.instructions?.toList().orEmpty()
        code.indices.filter { code[it].opcode.setsField() && code[it].getReference<FieldReference>()?.descriptor() == flag.descriptor() }
            .map { method to it }
    }
    val (constructor, store) = stores.singleOrPatchException("$PATCH: the store of ${flag.descriptor()}")
    if (constructor.name != "<init>" || constructor.implementation!!.instructions.elementAt(store).opcode != Opcode.IPUT_BOOLEAN) {
        throw PatchException("$PATCH: ${flag.descriptor()} is set in ${constructor.signature()}, not by an iput-boolean in a constructor")
    }
    return constructor to store
}

/** Whether this is a field write of any kind, so a write of the flag by the wrong opcode is still seen. */
private fun Opcode.setsField() = name.lowercase().let { it.startsWith("iput") || it.startsWith("sput") }

/** The declared boolean parameter the `iput-boolean` at [store] writes, untouched since the method's entry. */
private fun MutableMethod.storedParameter(store: Int): Int {
    val value = (implementation!!.instructions.elementAt(store) as TwoRegisterInstruction).registerA
    val source = sourceOrNull(store, value)
    if (source == null || source.at != -1) {
        throw PatchException("$PATCH: ${signature()} stores the swipe flag from something it worked out, not a parameter")
    }
    val parameter = parameterTypes.indices.firstOrNull { parameterRegisterNumber(it) == source.register }
        ?: throw PatchException("$PATCH: ${signature()} stores the swipe flag from v${source.register}, which isn't a parameter")
    if (parameterTypes[parameter].toString() != "Z") {
        throw PatchException("$PATCH: ${signature()} stores the swipe flag from parameter $parameter, " +
            "a ${parameterTypes[parameter]}, not a boolean")
    }
    // The hook goes in first thing, so the store has to write the parameter as it came in.
    requireParameterIntact(PATCH, parameter, listOf(store))
    return parameter
}
