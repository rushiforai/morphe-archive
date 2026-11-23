package app.jofslash.patches.googlehealth.medical

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Account menu entries (an obfuscated enum) that open Medical records. */
private val MENU_ENTRIES = setOf("MEDICAL_RECORDS_SETTINGS", "MEDICAL_RECORDS_ONBOARDING")

/** The Connections screen section (an obfuscated enum) that holds the Medical records card. */
private const val CONNECTIONS_SECTION = "CONNECTIONS_APPS_AND_SERVICES"

private fun Instruction.string() =
    if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO)
        ((this as ReferenceInstruction).reference as StringReference).string else null

private fun Instruction.field() =
    if (opcode == Opcode.SGET_OBJECT || opcode == Opcode.SPUT_OBJECT)
        (this as ReferenceInstruction).reference as FieldReference else null

private fun Instruction.methodCall() =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
        opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_INTERFACE
    }

private fun Instruction.isSingleton() = methodCall()?.let {
    it.definingClass == "Ljava/util/Collections;" && it.name == "singleton"
} == true

/**
 * The static fields of the enum constants named in [names], found in the class initializer: each
 * name is a const-string followed by the sput-object of its constant.
 */
private fun enumFields(classDef: ClassDef, names: Set<String>): Set<String> {
    val clinit = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return emptySet()
    val instructions = clinit.implementation?.instructions?.toList() ?: return emptySet()
    val fields = mutableSetOf<String>()
    instructions.forEachIndexed { index, insn ->
        if (insn.string() !in names) return@forEachIndexed
        val put = instructions.drop(index + 1).firstOrNull {
            it.opcode == Opcode.SPUT_OBJECT && it.field()?.definingClass == classDef.type
        }
        put?.field()?.let { fields += it.name }
    }
    return fields
}

private fun Method.sameAs(other: Method) =
    name == other.name && parameterTypes == other.parameterTypes && returnType == other.returnType

@Suppress("unused")
val hideMedicalRecordsPatch = bytecodePatch(
    name = "Hide Medical records",
    description = "Hides Medical records in the account menu and on the Connections screen. Medical " +
            "records only work with US healthcare providers.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        var menuEnum: ClassDef? = null
        // More than one enum has these names (the app maps one to the other), so keep every one.
        val sectionEnums = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            val clinit = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return@classDefForEach
            val strings = clinit.implementation?.instructions?.mapNotNull { it.string() }?.toSet()
                ?: return@classDefForEach
            if (strings.containsAll(MENU_ENTRIES) && "PARTNER_APPS" in strings) menuEnum = classDef
            if (CONNECTIONS_SECTION in strings && "CONNECTIONS_DEVICES" in strings) sectionEnums += classDef
        }
        val menu = menuEnum ?: throw PatchException("Couldn't find the account menu entries")
        if (sectionEnums.isEmpty()) throw PatchException("Couldn't find the Connections sections")
        val menuFields = enumFields(menu, MENU_ENTRIES)
        val sections = sectionEnums.mapNotNull { enum ->
            enumFields(enum, setOf(CONNECTIONS_SECTION)).singleOrNull()?.let { enum.type to it }
        }.toSet()
        if (menuFields.size != MENU_ENTRIES.size || sections.isEmpty()) {
            throw PatchException("Couldn't find the Medical records enum constants")
        }

        // The account menu: its list of entries gets list.add(MEDICAL_RECORDS_...). Those calls go.
        // The Connections screen: the Medical records card is the only item of the Apps and services
        // section made with Collections.singleton(card). It becomes an empty set.
        val menuHits = mutableListOf<Pair<ClassDef, Method>>()
        val cardHits = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val fields = instructions.mapNotNull { it.field() }
                if (fields.any { it.definingClass == menu.type && it.name in menuFields }) {
                    menuHits += classDef to method
                }
                if (fields.any { (it.definingClass to it.name) in sections } &&
                    instructions.any { it.isSingleton() }
                ) {
                    cardHits += classDef to method
                }
            }
        }
        if (menuHits.isEmpty()) throw PatchException("Couldn't find the account menu list")
        if (cardHits.size != 1) throw PatchException("Expected one Medical records card, found ${cardHits.size}")

        var removed = 0
        menuHits.forEach { (classDef, found) ->
            val method = mutableClassDefBy(classDef).methods.first { it.sameAs(found) }
            val instructions = method.implementation!!.instructions.toList()
            // From the end, so the indexes before stay valid.
            for (i in instructions.indices.reversed()) {
                val field = instructions[i].field() ?: continue
                if (instructions[i].opcode != Opcode.SGET_OBJECT) continue
                if (field.definingClass != menu.type || field.name !in menuFields) continue
                val add = i + 1
                val call = instructions.getOrNull(add)?.methodCall() ?: continue
                if (call.name != "add" || call.parameterTypes.size != 1) continue
                if (instructions.getOrNull(add + 1)?.opcode == Opcode.MOVE_RESULT) method.removeInstruction(add + 1)
                method.removeInstruction(add)
                removed++
            }
        }
        if (removed != MENU_ENTRIES.size) {
            throw PatchException("Expected ${MENU_ENTRIES.size} Medical records menu entries, removed $removed")
        }

        val (cardClass, cardFound) = cardHits.single()
        val cardMethod = mutableClassDefBy(cardClass).methods.first { it.sameAs(cardFound) }
        val instructions = cardMethod.implementation!!.instructions.toList()
        val singleton = instructions.indexOfFirst { it.isSingleton() }
        val result = instructions[singleton + 1]
        if (result.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Unexpected code after the card")
        val register = (result as OneRegisterInstruction).registerA
        cardMethod.addInstructions(
            singleton + 2,
            """
                invoke-static { }, Ljava/util/Collections;->emptySet()Ljava/util/Set;
                move-result-object v$register
            """
        )
    }
}
