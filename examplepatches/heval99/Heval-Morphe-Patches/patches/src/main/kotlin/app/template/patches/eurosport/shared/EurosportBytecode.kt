package app.template.patches.eurosport.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The app is R8-renamed almost everywhere, so its models are found through their data class
// toString() output and the methods by shape. R8 class names in the comments are only
// examples, from the version named next to them.

internal const val STRING = "Ljava/lang/String;"

/** The no-arg toString() holding a string that starts with [prefix] and then [contains], in order. */
internal fun toStringFingerprint(prefix: String, vararg contains: String) = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = listOf(),
    filters = listOf(string(prefix, StringComparisonType.STARTS_WITH)) +
        contains.map { string(it, StringComparisonType.CONTAINS) },
)

/** The fingerprint's single match, or a loud failure naming every match. */
internal fun BytecodePatchContext.single(fingerprint: Fingerprint, label: String): Match {
    val matches = fingerprint.matchAllOrNull().orEmpty()
    return matches.singleOrNull() ?: throw PatchException(
        "Expected one $label, found " + matches.map { "${it.classDef.type}->${it.method.name}" },
    )
}

/** The single concrete static method taking one parameter and returning [type]. */
internal fun BytecodePatchContext.singleStaticFactory(type: String, label: String): Match =
    single(
        Fingerprint(
            returnType = type,
            custom = { method, _ ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 1 &&
                    method.implementation != null
            },
        ),
        "static (1 arg)$type factory ($label)",
    )

internal fun Method.strings(): List<String> =
    implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }.orEmpty()

/** `return null` at entry. Every method has a v0; a static one may overwrite its parameter. */
internal fun MutableMethod.returnNull() = addInstructionsChecked(
    0,
    """
        const/4 v0, 0x0
        return-object v0
    """,
)

/**
 * Inserts [smali] before the instruction at [index]. Refuses a branch or switch target: the
 * old label stays on that instruction, so a jump there would skip the inserted code.
 */
internal fun MutableMethod.insertBefore(index: Int, smali: String) {
    val location = implementation!!.instructions[index].location
    if (location.labels.isNotEmpty()) {
        throw PatchException("$definingClass->$name: instruction $index is a branch target; not inserting there")
    }
    addInstructionsWithLabelsChecked(index, smali)
}

/** Index and source register of the constructor's only store into [field] (by name and type). */
internal fun MutableMethod.singleStore(opcode: Opcode, fieldName: String, fieldType: String): Pair<Int, Int> {
    val stores = implementation!!.instructions.withIndex().filter { (_, insn) ->
        val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
        insn.opcode == opcode && ref != null && ref.definingClass == definingClass &&
            ref.name == fieldName && ref.type == fieldType
    }
    val (index, store) = stores.singleOrNull() ?: throw PatchException(
        "$definingClass->$name: expected one ${opcode.name} to $fieldName, found ${stores.size}",
    )
    return index to (store as TwoRegisterInstruction).registerA
}

/** `const/4` or, for a register above v15, `const/16` (AGENTS.md rule 11). */
internal fun constZero(register: Int) =
    if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0"

/*
 * The remote per-SDK kill switch. The app config lists SdkConfig(sdk, enabled,
 * notAllowedCountries) entries (8.34.1: kgj), matched by enum name() against the server's
 * names (8.34.1: jgj; STORYTELLER, TEADS, GOOGLE_AD, ADOBE, APPSFLYER, CHARTBEAT, PERMUTIVE, MUX,
 * MEDIAMELON). They become a Map<Sdk, Boolean> whose lookup answers false for a missing or
 * disabled SDK, and every SDK starts only when it answers true: the ad view factory returns a
 * 0x0 view for GOOGLE_AD / TEADS, and Adobe, Chartbeat, Permutive, Mux and MediaMelon do not
 * start. AppsFlyer has no reader in 8.33.0 or 8.34.1 and is listed for later builds. Storyteller (the
 * Stories/Clips content) keeps the server value.
 */
internal val AD_SDKS = setOf("GOOGLE_AD", "TEADS")
internal val TELEMETRY_SDKS = setOf("ADOBE", "APPSFLYER", "CHARTBEAT", "PERMUTIVE", "MUX", "MEDIAMELON")
internal const val CONTENT_SDK = "STORYTELLER"

/**
 * Appends a block before the SdkConfig constructor's return-void that stores enabled = false
 * when the SDK's name() is one of [names]. Each block re-reads the sdk field and ends with an
 * unconditional store, so "Disable ads" and "Disable telemetry" can both add one.
 */
internal fun BytecodePatchContext.disableSdkConfigs(names: Set<String>) {
    val config = single(toStringFingerprint("SdkConfig(sdk="), "SdkConfig toString").classDef
    val constructor = config.methods.singleOrNull { method ->
        method.name == "<init>" && method.implementation != null &&
            method.parameterTypes.map(CharSequence::toString).let { it.size == 3 && it[1] == "Z" && it[2] == "Ljava/util/List;" }
    } ?: throw PatchException("${config.type} has no <init>(Sdk, Z, List)V")
    val sdk = constructor.parameterTypes[0].toString()

    // The Sdk enum must still carry every name the block compares against.
    val sdkClass = classDefByOrNull(sdk) ?: throw PatchException("SdkConfig enum $sdk not found")
    if (sdkClass.superclass != "Ljava/lang/Enum;") throw PatchException("$sdk is not an enum")
    val enumNames = sdkClass.methods.singleOrNull { it.name == "<clinit>" }?.strings().orEmpty().toSet()
    val missing = names + CONTENT_SDK - enumNames
    if (missing.isNotEmpty()) throw PatchException("SdkConfig enum $sdk lacks $missing")

    val instanceFields = config.fields.filterNot { AccessFlags.STATIC.isSet(it.accessFlags) }
    val enabled = instanceFields.singleOrNull { it.type == "Z" }
        ?: throw PatchException("${config.type} has no single boolean (enabled) field")
    val sdkField = instanceFields.singleOrNull { it.type == sdk }
        ?: throw PatchException("${config.type} has no single $sdk field")

    val returns = constructor.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
    val returnIndex = returns.singleOrNull()?.index
        ?: throw PatchException("${config.type}-><init> has ${returns.size} return-void, expected one")

    // p1..p3 are free after the stores: p3 carries the result, p1 the name, p2 each compare.
    val enabledRef = "${config.type}->${enabled.name}:Z"
    val smali = buildList {
        add("iget-boolean p3, p0, $enabledRef")
        add("iget-object p1, p0, ${config.type}->${sdkField.name}:$sdk")
        add("invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;")
        add("move-result-object p1")
        names.sorted().forEachIndexed { i, name ->
            add("const-string p2, \"$name\"")
            add("invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z")
            add("move-result p2")
            add("if-eqz p2, :keep_$i")
            add("const/4 p3, 0x0")
            add(":keep_$i")
        }
        add("iput-boolean p3, p0, $enabledRef")
    }.joinToString("\n")
    constructor.insertBefore(returnIndex, smali)
}
