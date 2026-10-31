package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * A real APK's classes. CompatReport already runs on the six 583 APKs themselves, so the fixtures this size skip the
 * second finder and its minute of extra work.
 */
private const val MIRROR_LIMIT = 5_000

/**
 * The hooks controlPatch proves with validateHook. The other controls (anonymous stories, menu settings, text style,
 * the community inbox and the rest) prove theirs on their own path, so they keep only the one-way check.
 */
private val PROVED_BY_VALIDATE_HOOK: Set<String> by lazy { controlHooks.filterKeys { it != COMMUNITY_INBOX }.values.flatten().toSet() }

/**
 * Hooks of [PROVED_BY_VALIDATE_HOOK] whose proof CompatReport's findControls doesn't repeat, and why. None of them can
 * get a build recorded, since --save runs the real patch first.
 */
private val PROVED_ONLY_BY_THE_PATCH: Map<String, String> =
    (listOf("bubble_mode", "browser", "subtabs", "people_jewel") + pluginGates.keys)
        .associateWith { "CompatReport proves the body through a profile field, and FIELD_CONTROLS fails the control when it changes" } +
    listOf(HIDE_READ_RECEIPTS, REPLY_READ).associateWith { "the patch proves the account's identity dataflow, CompatReport only the seen handler's and dispatcher's outline" }

/**
 * findControls, checked against CompatReport's findControls on the same classes. CompatReport must never resolve a
 * method the patch's discovery doesn't, or a build it passes would be refused at patch time. And for the hooks of
 * [PROVED_BY_VALIDATE_HOOK] outside [PROVED_ONLY_BY_THE_PATCH], it resolves a key exactly when the patch finds the key
 * and proves every method of it, on the classes as given and again with those methods cut to no local register.
 */
internal fun mirroredControls(classes: Iterable<ClassDef>): Map<String, List<Method>> =
    mirrored(classes, emptySet()) { findControls(it) }

/** The same, with a community inbox contract handed in. CompatReport always finds its own, so that key isn't compared. */
internal fun mirroredControls(classes: Iterable<ClassDef>, community: CommunityInboxContract?): Map<String, List<Method>> =
    mirrored(classes, setOf(COMMUNITY_INBOX)) { findControls(it, community) }

private fun mirrored(classes: Iterable<ClassDef>, skip: Set<String>, find: (List<ClassDef>) -> Map<String, List<Method>>):
    Map<String, List<Method>> {
    val list = classes.toList()
    val found = find(list)
    if (list.size <= MIRROR_LIMIT) {
        val ours = CompatMirror.ids(found)
        val compat = CompatMirror.controls(list).filterKeys { it !in skip }
        val extra = compat.mapNotNull { (key, ids) -> (ids - ours[key].orEmpty().toSet()).takeIf { it.isNotEmpty() }?.let { "$key $it" } }
        assertTrue(extra.isEmpty(), "CompatReport resolves what findControls doesn't: $extra")
        val keys = (found.keys + compat.keys).filter { it in PROVED_BY_VALIDATE_HOOK && it !in skip && it !in PROVED_ONLY_BY_THE_PATCH }
        val differ = disagreements(list, found, compat, keys)
        assertTrue(differ.isEmpty(), "CompatReport and the patch's proof disagree: $differ")
        // Most switches need a free local for their scratch v0, so the proved hooks again with none: both sides must agree.
        val proved = keys.filter { key -> found[key].orEmpty().let { it.isNotEmpty() && it.all { method -> proves(key, method, list) } } }
        val swap = proved.flatMap { found.getValue(it) }.filter { it.implementation != null }.associateWith { it.starved() }
        if (swap.isNotEmpty()) {
            val starved = list.map { it.withMethods(swap) }
            val saved = listOf(messageTextGetterName, messageIdGetterName, messageIsUnsentGetterName)
            val savedLog = messageLogContract
            val savedThreads = readReceiptThreadFields
            val savedRecipe = markReadRecipe
            val savedPicture = autoReplyPictureRecipe
            val savedGallery = galleryRoute
            val savedGalleryChat = galleryChatRoute
            val savedCircle = vitoCircleField
            val savedTile = tileShapeSetter
            try {
                val starvedFound = find(starved)
                val starvedDiffer = disagreements(starved, starvedFound, CompatMirror.controls(starved).filterKeys { it !in skip }, proved)
                assertTrue(starvedDiffer.isEmpty(), "With no local register, CompatReport and the patch's proof disagree: $starvedDiffer")
            } finally {
                messageTextGetterName = saved[0]
                messageIdGetterName = saved[1]
                messageIsUnsentGetterName = saved[2]
                messageLogContract = savedLog
                readReceiptThreadFields = savedThreads
                markReadRecipe = savedRecipe
                autoReplyPictureRecipe = savedPicture
                galleryRoute = savedGallery
                galleryChatRoute = savedGalleryChat
                vitoCircleField = savedCircle
                tileShapeSetter = savedTile
            }
        }
    }
    return found
}

private fun disagreements(classes: List<ClassDef>, found: Map<String, List<Method>>, compat: Map<String, List<String>>, keys: Iterable<String>):
    List<String> {
    val ours = CompatMirror.ids(found)
    return keys.sorted().mapNotNull { key ->
        val methods = found[key].orEmpty()
        val expected = if (methods.isNotEmpty() && methods.all { proves(key, it, classes) }) ours.getValue(key) else emptyList()
        "$key: patch $expected, CompatReport ${compat[key].orEmpty()}".takeIf { expected.sorted() != compat[key].orEmpty().sorted() }
    }
}

/** A copy of the method with only its parameters' registers left. */
private fun Method.starved(): Method {
    val words = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val code = implementation!!
    return ImmutableMethod(definingClass, name, parameters, returnType, accessFlags, annotations, hiddenApiRestrictions,
        ImmutableMethodImplementation(words, code.instructions, code.tryBlocks, null))
}

private fun ClassDef.withMethods(swap: Map<Method, Method>): ClassDef =
    if (methods.none { it in swap }) this
    else ImmutableClassDef(type, accessFlags, superclass, interfaces, sourceFile, annotations, fields, methods.map { swap[it] ?: it })

/** What the patch proves about [hook]'s [method] before its first edit: validateHook, then what controlPatch resolves first. */
private fun proves(hook: String, method: Method, classes: List<ClassDef>): Boolean = runCatching {
    val classOf = { type: String -> classes.firstOrNull { it.type == type } }
    // Some fixtures hand over plain dexlib2 methods. validateHook edits nothing, so a wrapper reads the same.
    (method as? MutableMethod ?: MutableMethod(method)).validateHook(hook)
    when (hook) {
        INBOX_REFRESH_HOOK -> resolveInboxRefresh(method, classOf)
        "emoji_typeface" -> method.emojiFontHolder(classOf)
    }
}.isSuccess

/** findNativeBubbleRoutes, which CompatReport's nativeBubbleRoutes has to answer exactly. */
internal fun mirroredBubbleRoutes(classes: List<ClassDef>, gate: String): String? {
    val found = findNativeBubbleRoutes(classes, gate)
    assertEquals(found, CompatMirror.nativeBubbleRoutes(classes, gate), "CompatReport's bubble routes differ")
    return found
}
