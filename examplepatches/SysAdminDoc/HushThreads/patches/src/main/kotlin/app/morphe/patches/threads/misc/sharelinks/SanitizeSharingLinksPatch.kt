/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.patches.threads.misc.sharelinks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.ads.MEDIA
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.freeLocalsAt
import app.morphe.patches.threads.misc.extension.localRegisterCount
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireThisIntact
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import app.morphe.util.singleOrPatchException
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.BitSet

private const val PATCH = "Sanitize sharing links"

private const val SANITIZE =
    "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;"

internal const val POST_LINK =
    "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->postLink(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;"

internal const val REMEMBER_POST =
    "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->rememberPost(Ljava/lang/Object;Ljava/lang/Object;)V"

internal const val REMEMBERED_POST =
    "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->rememberedPost(Ljava/lang/Object;)Ljava/lang/Object;"

/** The share sheet's repository of post links. A kept class. */
internal const val PERMALINK_REPOSITORY = "Lcom/instagram/barcelona/share/permalink/data/PermalinkRepository;"

/** A user. A kept class, whose methods Redex renames. */
internal const val USER = "Lcom/instagram/user/model/User;"

/**
 * The share sheet's fetch of a post's link: a suspend function taking the post, which reads the
 * link out of the server's answer and hands it on with the post. The only one in its class that
 * names "itas-android", the label it asks the post for to put the post's text before the link.
 */
internal object PostLinkFetchFingerprint : Fingerprint(
    definingClass = PERMALINK_REPOSITORY,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", MEDIA, "L", "L"),
    filters = listOf(string("itas-android")),
)

/** A post's code, the last part of its own link. Pando reads a field by its name's hash. */
internal object PostCodeFingerprint : Fingerprint(
    definingClass = MEDIA,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(literal("code".hashCode())),
)

/** A post's author, or null when the post doesn't carry one. */
internal object PostAuthorFingerprint : Fingerprint(
    definingClass = MEDIA,
    returnType = USER,
    parameters = listOf(),
    filters = listOf(literal("user".hashCode())),
)

/** A user's username, or null. The name is an encoded string here, the hash is not. */
internal object UsernameFingerprint : Fingerprint(
    definingClass = USER,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(literal("username".hashCode())),
)

/**
 * The parser of the server's answer to `media/<id>/permalink/`, the one request behind every link
 * Threads hands out for a post: Copy link, Share to another app, Send and the share sheet's own
 * rows. It reads the `permalink` field and stores it in a fresh response object. The method's name
 * comes from the JSON parser interface it implements, so Redex keeps it, and the two strings say
 * which of the app's many parsers this is.
 */
internal object PermalinkResponseParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("permalink"),
        string("XDTPermalinkResponse"),
    ),
)

/**
 * Takes Threads' tracking tags off the links you share.
 *
 * Threads asks its server for a post's link each time you share it, and the server answers with
 * `xmt`, a code that ties the link to you, and `slof` added to it. The link goes through the
 * extension as the app reads it from that answer, before anything stores it, so every place that
 * shares the link gets the clean one. With the switch off, paused, or before the settings are
 * ready, the extension hands the link back as it came.
 *
 * Found by reading 449 (2026-09-29): the parser stores the string into the response object's one
 * String field right after it creates the object.
 */
@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Takes Threads' tracking tags, such as xmt, off the links you share or copy, and turns a short " +
        "share link into the post's own link. The post a link opens stays the same.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        val method = PermalinkResponseParserFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // Tie the response to its type-name constructor argument and follow its registers until
        // an owned String store. A different allocation, owner or receiver isn't the response.
        val typeName = PermalinkResponseParserFingerprint.instructionMatches[1].index
        val typeRegister = (instructions[typeName] as OneRegisterInstruction).registerA
        val stores = mutableSetOf<Int>()
        for (created in typeName + 1 until instructions.size) {
            val allocation = instructions[created]
            if (allocation.opcode != Opcode.NEW_INSTANCE) continue
            val owner = allocation.getReference<TypeReference>()!!.type
            val constructorOwners = superclassChain(owner).toSet()
            val aliases = mutableSetOf((allocation as OneRegisterInstruction).registerA)
            val typeUnchanged = instructions.subList(typeName + 1, created + 1).none {
                val register = (it as? OneRegisterInstruction)?.registerA
                it.opcode.setsRegister() && (register == typeRegister || it.opcode.setsWideRegister() && register == typeRegister - 1)
            }
            if (!typeUnchanged) continue
            var namedResponse = false
            for (index in created + 1 until instructions.size) {
                val instruction = instructions[index]
                if (instruction is OffsetInstruction || !instruction.opcode.canContinue()) break
                if (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) {
                    val call = instruction.getReference<MethodReference>()!!
                    val registers = when (instruction) {
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                        else -> emptyList()
                    }
                    var word = 1
                    val takesTypeName = call.parameterTypes.any { parameter ->
                        val register = registers.getOrNull(word)
                        word += if (parameter == "J" || parameter == "D") 2 else 1
                        parameter == "Ljava/lang/String;" && register == typeRegister &&
                            instructions.subList(typeName + 1, index).none {
                                val register = (it as? OneRegisterInstruction)?.registerA
                                it.opcode.setsRegister() && (register == typeRegister || it.opcode.setsWideRegister() && register == typeRegister - 1)
                            }
                    }
                    if (call.name == "<init>" && call.returnType == "V" && call.definingClass in constructorOwners &&
                        registers.firstOrNull() in aliases && takesTypeName) {
                        namedResponse = true
                    }
                }
                if (namedResponse && instruction.opcode == Opcode.IPUT_OBJECT) {
                    val field = instruction.getReference<FieldReference>()!!
                    if (field.definingClass == owner && field.type == "Ljava/lang/String;" &&
                        (instruction as TwoRegisterInstruction).registerB in aliases) stores += index
                }
                if (instruction.opcode.setsRegister()) {
                    val target = (instruction as OneRegisterInstruction).registerA
                    val carriesResponse = when (instruction.opcode) {
                        Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                            (instruction as TwoRegisterInstruction).registerB in aliases
                        Opcode.CHECK_CAST -> target in aliases
                        else -> false
                    }
                    aliases.remove(target)
                    if (instruction.opcode.setsWideRegister()) aliases.remove(target + 1)
                    if (carriesResponse) aliases += target
                    if (aliases.isEmpty()) break
                }
            }
        }
        val store = stores.singleOrPatchException(
            "Sanitize sharing links: owned response String store in ${method.definingClass}->${method.name}; candidates: " +
                stores.joinToString { "$it:${instructions[it].getReference<FieldReference>()}" },
        )
        val link = (instructions[store] as TwoRegisterInstruction).registerA

        // At the store's own label, so a branch that jumped to the store runs the call too.
        method.addInstructionsAtControlFlowLabel(
            store,
            """
                invoke-static/range { v$link .. v$link }, $SANITIZE
                move-result-object v$link
            """,
        )

        replaceShortLinks(instructions[store].getReference<FieldReference>()!!)

        enableStatus("sanitizeSharingLinks")
    }
}

/**
 * Where the share sheet reads the link out of the server's answer, through the answer's getter of
 * [link], the field the parser stores it in: right after each read, the post's code and its
 * author's username go to the extension with the link, which swaps a short /share/ link for the
 * post's own. The post is the one the fetch hands on with the link, and it sits in the same
 * register from the read to that store.
 *
 * Found by reading 449 (2026-10-02): the fetch reads the link twice, once for the link it shares
 * and once for the link it keeps, and stores the post with both.
 */
private fun BytecodePatchContext.replaceShortLinks(link: FieldReference) {
    val method = PostLinkFetchFingerprint.method
    val where = "${method.definingClass}->${method.name}"
    val body = method.implementation!!.instructions.toList()

    val owners = superclassChain(link.definingClass).toList()
    val types = owners.toSet() + owners.flatMap { classDefByOrNull(it)?.interfaces.orEmpty() }
    val getters = owners.flatMap { classDefByOrNull(it)?.methods ?: emptyList() }.filter { getter ->
        getter.parameterTypes.isEmpty() && getter.returnType == "Ljava/lang/String;" &&
            getter.implementation?.instructions?.any { it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>() == link } == true
    }.map { it.name }.toSet()
    val reads = body.linkReads(types, getters)
    if (reads.isEmpty()) throw PatchException("$PATCH: $where never reads ${link.definingClass}'s link")

    val post = body.withIndex().filter { (index, instruction) ->
        index > reads.last() && instruction.opcode == Opcode.IPUT_OBJECT && instruction.getReference<FieldReference>()!!.type == MEDIA
    }.singleOrPatchException("$PATCH: the post $where stores with the link").index
    val media = (body[post] as TwoRegisterInstruction).registerA

    val sites = reads.map { read ->
        val after = read + 2
        val value = (body[read + 1] as OneRegisterInstruction).registerA
        for (index in after until post) {
            val instruction = body[index]
            if (instruction is OffsetInstruction || !instruction.opcode.canContinue()) {
                throw PatchException("$PATCH: $where branches between its link read at $read and the post's store at $post")
            }
            val written = (instruction as? OneRegisterInstruction)?.registerA
            if (instruction.opcode.setsRegister() &&
                (written == media || instruction.opcode.setsWideRegister() && written == media - 1)
            ) throw PatchException("$PATCH: $where writes v$media, the post, between its link read at $read and the store")
        }
        if (media > 15 || value > 15) throw PatchException("$PATCH: $where keeps the post or the link above v15")
        Triple(after, value, method.freeLocalsAt(PATCH, after, 2))
    }

    // Later sites first, so the earlier indices still point where they did.
    for ((after, value, scratch) in sites.sortedByDescending { it.first }) {
        val (postCode, name) = scratch
        method.addInstructionsWithLabels(after, postLinkHook(value, media, postCode, name))
    }

    val hooked = replaceShortLinksInHolders(types, getters)
    replaceShortLinksAfterResume(types, getters, hooked, method)
}

/**
 * The other places Threads reads a post's link out of the server's answer. Copy link, Share to
 * another app and Share to Instagram each read it in a coroutine of their own, and two older share
 * rows in a callback, and each of those objects holds the post it asked about in its one post
 * field. Right after each read the post comes out of that field and the fetch's hook runs.
 *
 * Found on the emulator (2026-10-02): the share sheet's Link row still copied a /share/ link,
 * because Copy link asks the repository's plain fetch and reads the answer itself, never passing
 * through the fetch above. Send, WhatsApp status and Instagram story, and WhatsApp quick sends
 * hold no post by the time they read the link, so [replaceShortLinksAfterResume] takes those.
 * Answers the methods it hooked.
 */
private fun BytecodePatchContext.replaceShortLinksInHolders(types: Set<String>, getters: Set<String>): Set<String> {
    val holders = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT) || classDef.type == PERMALINK_REPOSITORY) return@classDefForEach
        if (classDef.instanceFields.none { it.type == MEDIA }) return@classDefForEach
        if (classDef.methods.any { it.readsLinkAsInstance(types, getters) }) holders += classDef.type
    }
    val hooked = mutableSetOf<String>()
    for (type in holders) {
        val holder = mutableClassDefBy(type)
        // Two posts and either could be the one the link is for.
        val post = holder.instanceFields.filter { it.type == MEDIA }.singleOrNull() ?: continue
        for (method in holder.methods.filter { it.readsLinkAsInstance(types, getters) }) {
            val body = method.implementation!!.instructions.toList()
            val reads = body.linkReads(types, getters)
            method.requireThisIntact(PATCH, reads.map { it + 2 })
            val self = method.localRegisterCount()
            val sites = reads.map { read ->
                val value = (body[read + 1] as OneRegisterInstruction).registerA
                if (value > 15) throw PatchException("$PATCH: $type->${method.name} keeps the link above v15")
                Pair(read + 2, value) to method.freeLocalsAt(PATCH, read + 2, 3)
            }
            for ((site, scratch) in sites.sortedByDescending { it.first.first }) {
                val (after, value) = site
                val (media, postCode, name) = scratch
                method.addInstructionsWithLabels(
                    after,
                    """
                        move-object/from16 v$media, v$self
                        iget-object v$media, v$media, $type->${post.name}:$MEDIA
                    """ + postLinkHook(value, media, postCode, name),
                )
            }
            hooked += method.key()
        }
    }
    if (hooked.isEmpty()) throw PatchException("$PATCH: nothing that holds a post reads its link, so Copy link would keep short links")
    return hooked
}

/**
 * Send, WhatsApp status and Instagram story, and WhatsApp quick sends. Each reads the link in a
 * coroutine that lets go of the post while it waits for the server: Send and the story share hand
 * the post to the repository's plain fetch and are resumed without it, and quick sends empty their
 * post field before they wait. The coroutine is the one object there both times, so just before
 * the wait the post goes to the extension against it, and right after each read it comes back out
 * for the fetch's hook. A post that never went in comes back null, and the link stays as it came.
 *
 * A method that hands the plain fetch a post, outside the holders [hooked] already took, keeps it
 * against the continuation it hands the fetch: its own this, or a register it only ever fills with
 * its continuation parameter, a cast of that, or a new continuation of that one type. A coroutine
 * body that reads the link without fetching keeps the post held by its one cast of its own field to
 * a post, a cast every path to the read passes and nothing jumps to.
 *
 * Found by reading 449 (2026-10-02). 448 makes Send's new continuation in a static factory and has
 * no quick sends link to read, so a build without quick sends is fine. Answers how many reads it hooked.
 */
private fun BytecodePatchContext.replaceShortLinksAfterResume(
    types: Set<String>,
    getters: Set<String>,
    hooked: Set<String>,
    ownFetch: Method,
): Int {
    val fetchers = mutableListOf<Pair<String, String>>()
    val coroutines = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT) || classDef.type == PERMALINK_REPOSITORY) return@classDefForEach
        for (method in classDef.methods) {
            val body = method.implementation?.instructions?.toList() ?: continue
            if (method.key() in hooked || body.linkReads(types, getters).isEmpty()) continue
            if (body.any { it.isPlainFetch(ownFetch) }) {
                fetchers += classDef.type to method.key()
            } else if (method.isCoroutineBody()) {
                coroutines += classDef.type to method.key()
            }
        }
    }
    if (fetchers.isEmpty()) {
        throw PatchException("$PATCH: nothing outside a holder hands the plain fetch a post and reads its link, so Send would keep short links")
    }
    fun mutable(type: String, key: String) = mutableClassDefBy(type).methods.single { it.key() == key }
    return fetchers.sumOf { (type, key) -> rememberAtFetch(mutable(type, key), types, getters, ownFetch) } +
        coroutines.sumOf { (type, key) -> rememberAtCast(mutable(type, key), types, getters) }
}

/** Code to put in front of an instruction, by that instruction's index before any of it goes in. */
private typealias Edits = MutableList<Pair<Int, () -> Unit>>

/** Applies [Edits] later sites first, so the earlier indices still point where they did. */
private fun Edits.applyLastFirst() = sortedByDescending { it.first }.forEach { it.second() }

/** [replaceShortLinksAfterResume] for a method that hands the plain fetch its post. */
private fun BytecodePatchContext.rememberAtFetch(
    method: MutableMethod,
    types: Set<String>,
    getters: Set<String>,
    ownFetch: Method,
): Int = with(method) {
    val where = "$definingClass->$name"
    val body = implementation!!.instructions.toList()
    val reads = body.linkReads(types, getters)
    val calls = body.indices.filter { body[it].isPlainFetch(ownFetch) }
    // The receiver, then the four arguments: the post is the second and the continuation the last.
    val arguments = calls.map { body[it].namedRegisters() }
    val coroutine = arguments.map { it[4] }.distinct().singleOrNull()
        ?: throw PatchException("$PATCH: $where hands the plain fetch more than one continuation register")
    if (!AccessFlags.STATIC.isSet(accessFlags) && coroutine == localRegisterCount()) {
        requireThisIntact(PATCH, calls + reads.map { it + 2 })
    } else {
        val continuation = body[calls.first()].getReference<MethodReference>()!!.parameterTypes[3].toString()
        requireOwnContinuation(where, coroutine, continuation, reads)
    }
    if (coroutine > 15 || arguments.any { it[2] > 15 }) {
        throw PatchException("$PATCH: $where keeps the continuation or the post above v15")
    }
    val edits: Edits = mutableListOf()
    // At the call's own label, so a branch that jumped to the call keeps the post too.
    for ((call, registers) in calls.zip(arguments)) {
        edits += call to { addInstructionsAtControlFlowLabel(call, "invoke-static { v$coroutine, v${registers[2]} }, $REMEMBER_POST") }
    }
    recallAfter(this, edits, where, body, reads, coroutine)
    edits.applyLastFirst()
    reads.size
}

/** [replaceShortLinksAfterResume] for a coroutine body that reads the link without fetching it. */
private fun BytecodePatchContext.rememberAtCast(method: MutableMethod, types: Set<String>, getters: Set<String>): Int = with(method) {
    val where = "$definingClass->$name"
    val body = implementation!!.instructions.toList()
    val reads = body.linkReads(types, getters)
    val self = localRegisterCount()
    val flow = ControlFlow.of(this)
    val casts = body.indices.filter { cast ->
        val load = body.getOrNull(cast - 1) as? TwoRegisterInstruction ?: return@filter false
        body[cast].opcode == Opcode.CHECK_CAST && body[cast].getReference<TypeReference>()!!.type == MEDIA &&
            load.opcode == Opcode.IGET_OBJECT && load.getReference<FieldReference>()!!.definingClass == definingClass &&
            load.registerB == self && load.registerA == (body[cast] as OneRegisterInstruction).registerA &&
            flow.normal.indices.none { from -> (from != cast - 1 && cast in flow.normal[from]) || cast in flow.exceptional[from] }
    }
    val posts = reads.map { read ->
        casts.singleOrNull { flow.dominates(it, read) }
            ?: throw PatchException("$PATCH: $where reads the link at $read without one cast of its own post field on every path there")
    }.distinct()
    requireThisIntact(PATCH, posts.flatMap { listOf(it - 1, it + 1) } + reads.map { it + 2 })
    val registers = posts.map { (body[it] as OneRegisterInstruction).registerA }
    if (self > 15 || registers.any { it > 15 }) throw PatchException("$PATCH: $where keeps this or the post above v15")
    val edits: Edits = mutableListOf()
    // After the cast, and not at the next instruction's label: only the cast's own post goes in.
    for ((cast, post) in posts.zip(registers)) {
        edits += cast + 1 to { addInstructions(cast + 1, "invoke-static { v$self, v$post }, $REMEMBER_POST") }
    }
    recallAfter(this, edits, where, body, reads, self)
    edits.applyLastFirst()
    reads.size
}

/**
 * Right after each of [reads], the post kept against the coroutine in [key] comes out of the
 * extension into a free local and the fetch's hook runs with it. [key] is read before any of the
 * hook's own registers is written, and stays out of them so a later read still finds it.
 */
private fun BytecodePatchContext.recallAfter(
    method: MutableMethod,
    edits: Edits,
    where: String,
    body: List<Instruction>,
    reads: List<Int>,
    key: Int,
) {
    for (read in reads) {
        val after = read + 2
        val value = (body[read + 1] as OneRegisterInstruction).registerA
        if (value > 15) throw PatchException("$PATCH: $where keeps the link above v15")
        val free = method.freeLocalsAt(PATCH, after, 3).let { if (key in it) method.freeLocalsAt(PATCH, after, 4) - key else it }
        val (post, postCode, name) = free
        val hook = """
            invoke-static { v$key }, $REMEMBERED_POST
            move-result-object v$post
            check-cast v$post, $MEDIA
        """ + postLinkHook(value, post, postCode, name)
        edits += after to { method.addInstructionsWithLabels(after, hook) }
    }
}

/**
 * Throws naming [where] unless [register] only ever holds the method's own coroutine: its last
 * parameter, a [continuation], or a cast of that, or a new continuation, made here or by a factory,
 * all of one type, filled on every path to [reads]. Anything else there could be some other
 * coroutine's key.
 */
private fun Method.requireOwnContinuation(where: String, register: Int, continuation: String, reads: List<Int>) {
    val last = parameterTypes.lastIndex
    if (register >= localRegisterCount() || last < 0 || parameterTypes[last].toString() != continuation) {
        throw PatchException("$PATCH: $where hands the plain fetch a continuation in v$register that isn't its own")
    }
    val parameter = parameterRegisterNumber(last)
    val flow = ControlFlow.of(this)
    val body = flow.instructions
    val writes = body.indices.filter { index ->
        val instruction = body[index]
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        instruction.opcode.setsRegister() && destination != null &&
            (destination == register || instruction.opcode.setsWideRegister() && destination + 1 == register)
    }.toSet()
    val kinds = writes.mapNotNull { index ->
        val instruction = body[index]
        when (instruction.opcode) {
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
                if ((instruction as TwoRegisterInstruction).registerB == parameter) null
                else throw PatchException("$PATCH: $where copies something other than its continuation into v$register at $index")
            Opcode.CHECK_CAST, Opcode.NEW_INSTANCE -> instruction.getReference<TypeReference>()!!.type
            // 448 makes the new continuation in a static factory.
            Opcode.MOVE_RESULT_OBJECT -> ((body.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? MethodReference)?.returnType
                ?: throw PatchException("$PATCH: $where writes something other than its continuation into v$register at $index (${instruction.opcode.name})")
            else -> throw PatchException("$PATCH: $where writes something other than its continuation into v$register at $index (${instruction.opcode.name})")
        }
    }.toSet()
    if (kinds.size != 1) throw PatchException("$PATCH: $where keeps ${kinds.size} kinds of continuation in v$register")
    // A path from the start that reaches a read without passing a write leaves the key unset.
    val reached = BitSet()
    val pending = ArrayDeque<Int>()
    fun visit(next: List<Int>) = next.forEach { if (!reached[it]) { reached.set(it); pending += it } }
    visit(listOf(0))
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        visit(flow.exceptional[at])
        if (at !in writes) visit(flow.normal[at])
    }
    val unset = reads.filter { reached[it] }
    if (unset.isNotEmpty()) throw PatchException("$PATCH: $where can reach its link read at ${unset.joinToString()} before v$register holds its continuation")
}

/** Whether every path from the method's start to [to] runs [through] first. */
private fun ControlFlow.dominates(through: Int, to: Int): Boolean {
    val reached = BitSet()
    val pending = ArrayDeque<Int>()
    reached.set(0)
    pending += 0
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == to) return false
        if (at == through) continue
        (normal[at] + exceptional[at]).forEach { if (!reached[it]) { reached.set(it); pending += it } }
    }
    return true
}

/** A call to the repository's plain fetch: a post in, the answer out, and not [ownFetch], which hooks itself. */
private fun Instruction.isPlainFetch(ownFetch: Method): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = getReference<MethodReference>()!!
    val parameters = call.parameterTypes.map { it.toString() }
    return call.definingClass == PERMALINK_REPOSITORY && call.returnType == "Ljava/lang/Object;" &&
        parameters.size == 4 && parameters[1] == MEDIA &&
        !(call.name == ownFetch.name && parameters == ownFetch.parameterTypes.map { it.toString() })
}

/** A Kotlin coroutine's body, the one method its continuation runs each time it resumes. */
private fun Method.isCoroutineBody(): Boolean = name == "invokeSuspend" && !AccessFlags.STATIC.isSet(accessFlags) &&
    parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") && returnType == "Ljava/lang/Object;"

private fun Method.key(): String = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Null code and name, the post's code and its author's username when there is a post and an
 * author, then the extension with the link, the name and the code, its answer replacing the link.
 */
private fun BytecodePatchContext.postLinkHook(value: Int, media: Int, postCode: Int, name: Int): String {
    val code = PostCodeFingerprint.method
    val author = PostAuthorFingerprint.method
    val username = UsernameFingerprint.method
    return """
        const/4 v$postCode, 0x0
        const/4 v$name, 0x0
        if-eqz v$media, :link
        invoke-virtual { v$media }, ${code.definingClass}->${code.name}()Ljava/lang/String;
        move-result-object v$postCode
        invoke-virtual { v$media }, ${author.definingClass}->${author.name}()$USER
        move-result-object v$name
        if-eqz v$name, :link
        invoke-virtual { v$name }, ${username.definingClass}->${username.name}()Ljava/lang/String;
        move-result-object v$name
        :link
        invoke-static { v$value, v$name, v$postCode }, $POST_LINK
        move-result-object v$value
    """
}

/** The reads of the answer's link getter in [this] body: a call to one of [getters] on [types] and its result. */
private fun List<Instruction>.linkReads(types: Set<String>, getters: Set<String>): List<Int> = indices.filter { index ->
    val instruction = this[index]
    if (instruction.opcode != Opcode.INVOKE_INTERFACE && instruction.opcode != Opcode.INVOKE_VIRTUAL) return@filter false
    val call = instruction.getReference<MethodReference>()!!
    call.definingClass in types && call.name in getters && call.parameterTypes.isEmpty() &&
        call.returnType == "Ljava/lang/String;" && getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
}

private fun Method.readsLinkAsInstance(types: Set<String>, getters: Set<String>): Boolean =
    !AccessFlags.STATIC.isSet(accessFlags) && implementation?.instructions?.toList()?.linkReads(types, getters).orEmpty().isNotEmpty()
