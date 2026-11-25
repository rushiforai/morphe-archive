package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val DICTIONARY_RUNTIME = "Lnl/johninnl/gboard/ParakeetDictionary;"
private const val LIST = "Ljava/util/List;"
private const val SET = "Ljava/util/Set;"
private const val WORD_SET_TYPE = "Ljava/util/LinkedHashSet;"
private const val STRING_TYPE = "Ljava/lang/String;"
private const val CONTEXT_PARAM = "Landroid/content/Context;"

/** Where the voice correction list keeps its words: three entry lists, each entry holding one word. */
internal class CorrectionListWords(val lists: List<FieldReference>, val entryClass: String, val word: FieldReference)

private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference

/**
 * The list screen's helper `static void collect(List entries, Set shown, Set out)`: it casts each
 * entry and reads its word. Returns the entry class and word field.
 */
internal fun correctionListEntryWord(helper: List<Instruction>): Pair<String, FieldReference> {
    val reads = helper.indices.mapNotNull { index ->
        val field = helper[index].ref() as? FieldReference ?: return@mapNotNull null
        val cast = helper.getOrNull(index - 1)
        val castType = (cast?.ref() as? TypeReference)?.type
        if (helper[index].opcode == Opcode.IGET_OBJECT && field.type == STRING_TYPE &&
            cast?.opcode == Opcode.CHECK_CAST && castType == field.definingClass
        ) field else null
    }.distinctBy { "${it.definingClass}->${it.name}" }
    val word = reads.singleOrNull()
        ?: throw PatchException("Expected one entry word read in the voice correction list helper, found ${reads.size}")
    return word.definingClass to word
}

/**
 * The list screen's loader: it reads the store with the list's kind and stats class, walks one
 * entry list itself and hands two more to [helper]. Every stats field it reads is an entry list.
 */
internal fun correctionListWords(
    loader: List<Instruction>,
    helper: MethodReference,
    site: CorrectionListImport,
    entry: Pair<String, FieldReference>,
): CorrectionListWords {
    val readsKind = loader.any {
        it.opcode == Opcode.SGET_OBJECT && (it.ref() as? FieldReference)?.let { f ->
            f.definingClass == site.statsKind.definingClass && f.name == site.statsKind.name
        } == true
    }
    val castsStats = loader.any { it.opcode == Opcode.CHECK_CAST && (it.ref() as? TypeReference)?.type == site.statsClass }
    if (!readsKind || !castsStats) throw PatchException("Voice correction list loader no longer reads MUSE_STATS")
    val lists = loader.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.ref() as? FieldReference }
        .filter { it.definingClass == site.statsClass }.distinctBy { it.name }
    if (lists.size != 3 || lists.map { it.type }.distinct().size != 1 || lists[0].type.let { it == STRING_TYPE || !it.startsWith("L") }) {
        throw PatchException("Expected three entry lists on ${site.statsClass}, found ${lists.map { it.name }}")
    }
    val handedOver = loader.count {
        it.opcode == Opcode.INVOKE_STATIC && (it.ref() as? MethodReference)?.let { m ->
            m.definingClass == helper.definingClass && m.name == helper.name && m.parameterTypes.map(CharSequence::toString) ==
                helper.parameterTypes.map(CharSequence::toString)
        } == true
    }
    val walksEntries = loader.any {
        it.opcode == Opcode.IGET_OBJECT && (it.ref() as? FieldReference)?.let { f ->
            f.definingClass == entry.first && f.name == entry.second.name
        } == true
    }
    if (handedOver != 2 || !walksEntries) throw PatchException("Voice correction list loader no longer collects three entry lists")
    return CorrectionListWords(lists, entry.first, entry.second)
}

context(context: BytecodePatchContext)
private fun resolveCorrectionListWords(site: CorrectionListImport): CorrectionListWords {
    val fragment = context.classDefBy(CORRECTION_LIST_FRAGMENT)
    val helpers = fragment.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(LIST, SET, SET)
    }
    val helper = helpers.singleOrNull()
        ?: throw PatchException("Expected one entry helper on the voice correction list screen, found ${helpers.size}")
    val entry = correctionListEntryWord(helper.implementation?.instructions?.toList().orEmpty())
    val helperRef = helper.reference()
    val loaders = mutableListOf<List<Instruction>>()
    context.classDefForEach { owner ->
        owner.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val calls = instructions.any {
                it.opcode == Opcode.INVOKE_STATIC && (it.ref() as? MethodReference)?.let { m ->
                    m.definingClass == helperRef.definingClass && m.name == helperRef.name
                } == true
            }
            if (calls && instructions.any { (it.ref() as? TypeReference)?.type == site.statsClass }) loaders.add(instructions)
        }
    }
    val loader = loaders.singleOrNull()
        ?: throw PatchException("Expected one voice correction list loader, found ${loaders.size}")
    val words = correctionListWords(loader, helperRef, site, entry)
    val listType = context.classDefBy(words.lists[0].type)
    val isList = listType.type == LIST || listType.interfaces.contains(LIST) || listType.superclass == "Ljava/util/AbstractList;"
    if (!isList) throw PatchException("${listType.type} is not a java.util.List")
    return words
}

private fun Method.reference(): MethodReference =
    ImmutableMethodReference(definingClass, name, parameterTypes, returnType)

private fun MutableClass.replacePlaceholder(name: String, params: List<String>, returns: String, registers: Int, smali: String) {
    val existing = methods.singleOrNull {
        it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == returns &&
            it.parameterTypes.map(CharSequence::toString) == params
    } ?: throw PatchException("Parakeet dictionary placeholder $name missing")
    methods.remove(existing)
    methods.add(ImmutableMethod(
        type, name, params.map { ImmutableMethodParameter(it, null, null) }, returns,
        existing.accessFlags, null, null, MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructionsWithLabels(0, smali) })
}

@Suppress("unused")
val parakeetPersonalDictionary = bytecodePatch(
    name = "Parakeet personal dictionary",
    description = "Lets Parakeet voice typing spell the names and words in the Voice dictionary's voice correction list, " +
        "including contact names added there. Parakeet favours them while listening and corrects a sound-alike spelling " +
        "only when a second listen agrees. Switch it on or off under Parakeet voice typing; it needs a 2 MB spelling " +
        "download. Requires Parakeet voice typing and Rambler personal dictionary.",
) {
    compatibleWith(gboard)
    dependsOn(originalInput, parakeetVoiceTyping, ramblerPersonalDictionary)

    execute {
        val site = resolveCorrectionListImport()
        val read = correctionListRead(classDefBy(site.statsStore), site)
        val words = resolveCorrectionListWords(site)
        val runtime = mutableClassDefBy(DICTIONARY_RUNTIME)

        runtime.replacePlaceholder("wired", emptyList(), "Z", 1, """
            const/4 v0, 0x1
            return v0
        """)
        val collect = "$DICTIONARY_RUNTIME->addEntries($LIST$WORD_SET_TYPE)V"
        runtime.replacePlaceholder("readCorrectionList", listOf(CONTEXT_PARAM, WORD_SET_TYPE), "Z", 6, """
            invoke-static {p0}, $MODULE_MANAGER->getInstance($CONTEXT_PARAM)$MODULE_MANAGER
            move-result-object v0
            const-class v1, ${site.statsStore}
            invoke-virtual {v0, v1}, ${site.moduleLookup.listSmali()}
            move-result-object v0
            if-eqz v0, :unavailable
            check-cast v0, ${site.statsStore}
            sget-object v1, ${site.statsKind.listSmali()}
            const-class v2, ${site.statsClass}
            invoke-interface {v0, v1, v2}, ${read.listSmali()}
            move-result-object v3
            if-eqz v3, :unavailable
            check-cast v3, ${site.statsClass}
        """ + words.lists.joinToString("") { list ->
            """
            iget-object v0, v3, ${list.listSmali()}
            invoke-static {v0, p1}, $collect
            """
        } + """
            const/4 v0, 0x1
            return v0
            :unavailable
            const/4 v0, 0x0
            return v0
        """)
        runtime.replacePlaceholder("addEntries", listOf(LIST, WORD_SET_TYPE), "V", 4, """
            if-eqz p0, :done
            invoke-interface {p0}, $LIST->iterator()Ljava/util/Iterator;
            move-result-object v0
            :next
            invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
            move-result v1
            if-eqz v1, :done
            invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v1
            check-cast v1, ${words.entryClass}
            iget-object v1, v1, ${words.word.listSmali()}
            if-eqz v1, :next
            invoke-virtual {p1, v1}, $WORD_SET_TYPE->add(Ljava/lang/Object;)Z
            goto :next
            :done
            return-void
        """)
    }
}
