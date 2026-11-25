package patches.gboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal const val CORRECTION_LIST_FRAGMENT =
    "Lcom/google/android/apps/inputmethod/latin/preference/VoiceCorrectionListFragment;"
internal const val MODULE_MANAGER = "Lcom/google/android/libraries/inputmethod/module/ModuleManager;"
private const val CONTACTS_RUNTIME = "Ldev/jason/gboardpatches/extension/rambler/GboardRamblerContactsRuntime;"
private const val CONTEXT_TYPE = "Landroid/content/Context;"
private const val CLASS_TYPE = "Ljava/lang/Class;"
private const val WORD_SET = "Ljava/util/LinkedHashSet;"
private const val MUSE_STATS = "MUSE_STATS"

private val ramblerDictionaryFlags = gboardFlagFamilyFeaturePatch(
    description = "Supply the voice-correction-list flags a re-signed Gboard never receives.",
    feature = GboardFlagFamilyFeature.RAMBLER_DICTIONARY,
)

@Suppress("unused")
val ramblerPersonalDictionary = bytecodePatch(
    name = "Rambler personal dictionary",
    description = "Adds Voice dictionary to Gboard settings → Voice typing, with Gboard's voice correction list: names " +
        "and words you add, import or export, which Rambler receives with every dictation so it spells them right. " +
        "Requires Rambler voice typing.",
) {
    compatibleWith(gboard)
    dependsOn(originalInput, ramblerVoiceTyping, ramblerDictionaryFlags, voiceDictionarySettings)
}

/** How Gboard's own "Import words" action adds words to the voice correction list. */
internal class CorrectionListImport(
    val moduleLookup: MethodReference,
    val statsStore: String,
    val statsKind: FieldReference,
    val statsClass: String,
    val addWords: MethodReference,
    val update: MethodReference,
)

/**
 * Finds `ModuleManager.getInstance(ctx).<lookup>(Store.class)` followed by
 * `store.<update>(kind, Stats.class, new AddWords(words, 0))` in the list's import action.
 * Every operand is traced to the instruction that loads it, so a reordered or different call is
 * rejected instead of guessed.
 */
internal fun correctionListImport(instructions: List<Instruction>): CorrectionListImport {
    fun ref(instruction: Instruction?) = (instruction as? ReferenceInstruction)?.reference
    fun lastWrite(before: Int, register: Int): Instruction? = (before - 1 downTo 0).map(instructions::get).firstOrNull {
        it is OneRegisterInstruction && it.registerA == register && it.opcode.setsRegister()
    }
    val candidates = instructions.indices.filter { index ->
        val update = ref(instructions[index]) as? MethodReference
        instructions[index].opcode == Opcode.INVOKE_INTERFACE && update != null && update.returnType == "V" &&
            update.parameterTypes.size == 3 && update.parameterTypes[1].toString() == CLASS_TYPE
    }
    val index = candidates.singleOrNull()
        ?: throw PatchException("Expected one word-list update in the voice correction list import, found ${candidates.size}")
    val call = instructions[index] as FiveRegisterInstruction
    val update = ref(call) as MethodReference
    val kindLoad = lastWrite(index, call.registerD)
    val classLoad = lastWrite(index, call.registerE)
    val kind = ref(kindLoad) as? FieldReference
    val statsClass = (ref(classLoad) as? TypeReference)?.type
    if (kindLoad?.opcode != Opcode.SGET_OBJECT || kind?.type != update.parameterTypes[0].toString() ||
        classLoad?.opcode != Opcode.CONST_CLASS || statsClass == null
    ) throw PatchException("Voice correction list import no longer passes a stats kind and class")

    val construct = (index - 1 downTo 0).firstOrNull { at ->
        val init = ref(instructions[at]) as? MethodReference
        instructions[at].opcode == Opcode.INVOKE_DIRECT && init?.name == "<init>" &&
            (instructions[at] as FiveRegisterInstruction).registerC == call.registerF
    } ?: throw PatchException("Voice correction list import no longer builds its word update")
    val addWords = ref(instructions[construct]) as MethodReference
    val allocation = lastWrite(construct, call.registerF)
    val modeLoad = lastWrite(construct, (instructions[construct] as FiveRegisterInstruction).registerE)
    if (addWords.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;", "I") ||
        allocation?.opcode != Opcode.NEW_INSTANCE || (ref(allocation) as? TypeReference)?.type != addWords.definingClass ||
        modeLoad?.opcode != Opcode.CONST_4 || (modeLoad as NarrowLiteralInstruction).narrowLiteral != 0
    ) throw PatchException("Voice correction list import no longer adds words in mode 0")

    val lookup = (index - 1 downTo 0).map { ref(instructions[it]) as? MethodReference }.firstOrNull {
        it != null && it.definingClass == MODULE_MANAGER && it.returnType != MODULE_MANAGER &&
            it.parameterTypes.map(CharSequence::toString) == listOf(CLASS_TYPE)
    } ?: throw PatchException("Voice correction list import no longer looks up the stats store")
    return CorrectionListImport(lookup, update.definingClass, kind, statsClass, addWords, update)
}

context(context: BytecodePatchContext)
internal fun resolveCorrectionListImport(): CorrectionListImport {
    // The import action lives in a small listener class that reads the fragment's word splitter
    // and adds words through the stats store; find it by those references, not by its name.
    val matches = mutableListOf<List<Instruction>>()
    context.classDefForEach { owner ->
        owner.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val readsSplitter = instructions.any {
                val field = (it as? ReferenceInstruction)?.reference as? FieldReference
                it.opcode == Opcode.SGET_OBJECT && field?.definingClass == CORRECTION_LIST_FRAGMENT
            }
            val usesModules = readsSplitter && instructions.any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { m ->
                    m.definingClass == MODULE_MANAGER && m.name == "getInstance"
                } == true
            }
            if (usesModules) matches.add(instructions)
        }
    }
    val resolved = matches.mapNotNull { runCatching { correctionListImport(it) }.getOrNull() }.distinctBy { it.update.toString() }
    val site = resolved.singleOrNull()
        ?: throw PatchException("Expected one voice correction list import, found ${resolved.size}")
    verifyMuseStats(site.statsKind)
    return site
}

/** The stats kind must be the enum constant Gboard names MUSE_STATS. */
context(context: BytecodePatchContext)
private fun verifyMuseStats(kind: FieldReference) {
    val enumClass = context.classDefBy(kind.definingClass)
    val init = enumClass.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
        ?: throw PatchException("${kind.definingClass} has no static initializer")
    val nameIndex = init.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == MUSE_STATS }
    val stored = init.drop(nameIndex + 1).firstOrNull { it.opcode == Opcode.SPUT_OBJECT }
    val storedField = (stored as? ReferenceInstruction)?.reference as? FieldReference
    if (nameIndex < 0 || storedField?.name != kind.name || storedField.definingClass != kind.definingClass) {
        throw PatchException("The voice correction list no longer stores its words as MUSE_STATS")
    }
}

/**
 * The store's `read(kind, Stats.class)`, which the list's settings screen uses to load the words. It
 * returns null until Gboard has registered the store, exactly when an update would be dropped.
 */
internal fun correctionListRead(store: ClassDef, site: CorrectionListImport): MethodReference {
    val kindType = site.statsKind.type
    val reads = store.methods.filter {
        it.returnType != "V" && !it.returnType.startsWith("[") &&
            it.parameterTypes.map(CharSequence::toString) == listOf(kindType, CLASS_TYPE)
    }
    val read = reads.singleOrNull()
        ?: throw PatchException("Expected one voice correction list read on ${store.type}, found ${reads.size}")
    return ImmutableMethodReference(store.type, read.name, read.parameterTypes, read.returnType)
}

internal fun MethodReference.listSmali() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
internal fun FieldReference.listSmali() = "$definingClass->$name:$type"
private fun MethodReference.smali() = listSmali()
private fun FieldReference.smali() = listSmali()

@Suppress("unused")
val ramblerContactNames = bytecodePatch(
    name = "Rambler contact names",
    description = "Adds your contacts' names to Rambler's voice correction list, so Rambler spells them right. Names " +
        "you delete from the list are not added again; new contacts are added the next time Rambler starts. Needs " +
        "Gboard's contacts access, which Gboard asks for when you switch on Contact names. Requires Rambler personal dictionary.",
) {
    compatibleWith(gboard)
    dependsOn(originalInput, ramblerPersonalDictionary)

    execute {
        val site = resolveCorrectionListImport()
        val read = correctionListRead(classDefBy(site.statsStore), site)

        // Give the runtime's placeholder Gboard's own import call, made only once the list's store
        // can be read; before that Gboard drops the words without a trace.
        val runtime = mutableClassDefBy(CONTACTS_RUNTIME)
        val placeholder = runtime.methods.singleOrNull {
            it.name == "addToVoiceCorrectionList" && AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT_TYPE, WORD_SET) && it.returnType == "Z"
        } ?: throw PatchException("Rambler contacts runtime placeholder missing")
        runtime.methods.remove(placeholder)
        runtime.methods.add(ImmutableMethod(
            runtime.type, placeholder.name, placeholder.parameterTypes.map { ImmutableMethodParameter(it.toString(), null, null) },
            "Z", placeholder.accessFlags, null, null, MutableMethodImplementation(7),
        ).toMutable().apply {
            addInstructionsWithLabels(0, """
                invoke-static {p0}, $MODULE_MANAGER->getInstance($CONTEXT_TYPE)$MODULE_MANAGER
                move-result-object v0
                const-class v1, ${site.statsStore}
                invoke-virtual {v0, v1}, ${site.moduleLookup.smali()}
                move-result-object v0
                if-eqz v0, :unavailable
                check-cast v0, ${site.statsStore}
                sget-object v1, ${site.statsKind.smali()}
                const-class v2, ${site.statsClass}
                invoke-interface {v0, v1, v2}, ${read.smali()}
                move-result-object v3
                if-eqz v3, :unavailable
                new-instance v3, ${site.addWords.definingClass}
                const/4 v4, 0x0
                invoke-direct {v3, p1, v4}, ${site.addWords.smali()}
                invoke-interface {v0, v1, v2, v3}, ${site.update.smali()}
                const/4 v0, 0x1
                return v0
                :unavailable
                const/4 v0, 0x0
                return v0
            """)
        })

        // Tell the runtime its import call is real, so Parakeet sessions may add names too.
        val wired = runtime.methods.singleOrNull {
            it.name == "wired" && AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == "Z"
        } ?: throw PatchException("Rambler contacts runtime flag missing")
        runtime.methods.remove(wired)
        runtime.methods.add(ImmutableMethod(
            runtime.type, wired.name, emptyList(), "Z", wired.accessFlags, null, null, MutableMethodImplementation(1),
        ).toMutable().apply {
            addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        })

        // Start it whenever Gboard's Rambler extension starts; it returns immediately.
        val start = mutableOnCreateExtension()
        val contextRead = start.implementation!!.instructions.firstOrNull {
            val field = (it as? ReferenceInstruction)?.reference as? FieldReference
            it.opcode == Opcode.IGET_OBJECT && field?.type == CONTEXT_TYPE && field.definingClass == start.definingClass
        } ?: throw PatchException("Rambler extension start no longer reads its Context")
        val contextField = (contextRead as ReferenceInstruction).reference as FieldReference
        start.addInstructions(0, """
            iget-object v0, p0, ${contextField.smali()}
            invoke-static {v0}, $CONTACTS_RUNTIME->onRamblerStart($CONTEXT_TYPE)V
        """)
    }
}
