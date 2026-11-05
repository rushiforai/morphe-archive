package app.template.patches.flashscore.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

// A remote-config value (R8-renamed, r1o in 26.10.2, u0q in 26.11.4). Every config switch the app
// reads is one of these: its constructor takes (context, key enum, ..., default supplier, parser)
// and opens the per-user override preferences "USER_PREFS_CONFIG_KEY-<user>". The second parameter
// is the key enum (i63 in 26.10.2, zk3 in 26.11.4), whose constants carry the stable names
// (ODDS_ENABLE, ADS_ENABLED, ...). The file name prefix is concatenated with the user, so it is
// matched by prefix: patcher 2.0 compares raw `strings` with the whole constant.
internal object RemoteConfigValueConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(string("USER_PREFS_CONFIG_KEY-", StringComparisonType.STARTS_WITH)),
)

// Every override helper a Flashscore patch adds to the value class starts with this, so a later
// patch can tell that get() already goes through one.
private const val HELPER_PREFIX = "morphe"

/**
 * What a helper returns instead of the remote value. The types match each key's parser: booleans
 * are "1"/"0" parsed to Boolean, URLs are plain Strings, sport lists are List<Integer>.
 */
internal enum class ForcedConfigValue(val smali: String) {
    FALSE("sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"),
    TRUE("sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"),
    EMPTY_STRING("const-string v0, \"\""),
    EMPTY_LIST(
        """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
        """.trimIndent()
    ),
}

private val logger = Logger.getLogger("FlashscoreRemoteConfig")

/**
 * Resolves the enum constant [name] of [enumType] to its static field by following its
 * `<clinit>`: `const-string vN, NAME` -> `invoke-direct {vI, vN, ...}, <init>` -> `sput-object vI`.
 * Enum names survive R8: Enum.name() is backed by the constructor's string argument.
 * Returns `Lenum;->field:Lenum;`, or null when the constant is not there.
 */
internal fun BytecodePatchContext.enumConstantField(enumType: String, name: String): String? {
    val clinit = classDefBy(enumType).methods.singleOrNull { it.name == "<clinit>" } ?: return null
    val insns = clinit.implementation?.instructions?.toList() ?: return null

    val nameIndex = insns.indexOfFirst {
        (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((it as ReferenceInstruction).reference as StringReference).string == name
    }
    if (nameIndex < 0) return null
    val nameRegister = (insns[nameIndex] as OneRegisterInstruction).registerA

    // The constructor call that takes this name as its first argument (Enum(String name, ...)).
    var instanceRegister = -1
    var initIndex = -1
    for (i in nameIndex + 1 until insns.size) {
        val insn = insns[i]
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (ref.definingClass != enumType || ref.name != "<init>") continue
        val (thisRegister, firstArgument) = when (insn) {
            is FiveRegisterInstruction -> insn.registerC to insn.registerD
            is RegisterRangeInstruction -> insn.startRegister to insn.startRegister + 1
            else -> continue
        }
        if (firstArgument != nameRegister) continue
        instanceRegister = thisRegister
        initIndex = i
        break
    }
    if (initIndex < 0) return null

    for (i in initIndex + 1 until insns.size) {
        val insn = insns[i]
        if (insn.opcode != Opcode.SPUT_OBJECT) continue
        val field = (insn as ReferenceInstruction).reference as FieldReference
        if ((insn as OneRegisterInstruction).registerA != instanceRegister) continue
        if (field.definingClass != enumType || field.type != enumType) continue
        return "${field.definingClass}->${field.name}:${field.type}"
    }
    return null
}

/**
 * Makes the remote-config value class answer the keys in [forced] (by key enum constant name)
 * with the given values; every other key reads the remote value as before.
 *
 * The value class's get() only returns its holder's get(). A new static helper [helperName]
 * checks the key by identity against the resolved enum constants and returns the forced value,
 * else falls through. get() has no spare register (.locals 0), so it calls the helper and returns
 * its result, rather than testing a "no override" sentinel.
 *
 * Several patches can force keys (Hide betting content, Disable ads), in any order. When get()
 * already starts with another patch's helper call, the new helper falls through to that helper
 * instead of the holder, and get() calls the new helper first, so every patch's keys apply.
 *
 * R8 inlines get() at some call sites (holder field + holder get() read directly; in 26.10.2
 * inside the config factory lambdas and two change listeners). Those reads bypass the helpers;
 * FlashscoreSmokeTest checks that no forced key is read that way right after its instance is
 * built, so recheck by hand when updating the app.
 *
 * Keys in [required] must exist (the patch fails otherwise); the others are skipped with a
 * warning when the enum lacks them.
 */
internal fun BytecodePatchContext.forceRemoteConfigValues(
    patchName: String,
    helperName: String,
    forced: Map<String, ForcedConfigValue>,
    required: Set<String>,
) {
    require(helperName.startsWith(HELPER_PREFIX)) { "$helperName must start with $HELPER_PREFIX" }
    val valueConstructor = RemoteConfigValueConstructorFingerprint.method
    val valueClass = RemoteConfigValueConstructorFingerprint.classDef
    val keyType = valueConstructor.parameterTypes.getOrNull(1)?.toString()
        ?: throw PatchException("$patchName: remote-config value constructor has no key parameter")
    val keyField = valueClass.fields.singleOrNull {
        it.type == keyType && !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: throw PatchException("$patchName: ${valueClass.type} has no single $keyType key field")
    if (valueClass.methods.any { it.name == helperName }) {
        throw PatchException("$patchName: ${valueClass.type} already has $helperName")
    }

    val get = valueClass.methods.singleOrNull {
        it.returnType == "Ljava/lang/Object;" && it.parameterTypes.isEmpty() &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    } ?: throw PatchException("$patchName: ${valueClass.type} has no single ()Object getter")

    val current = get.implementation!!.instructions.toList()
    val previousHelper = ((current.firstOrNull() as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
        current.first().opcode == Opcode.INVOKE_STATIC && it.definingClass == valueClass.type &&
            it.name.startsWith(HELPER_PREFIX)
    }

    // What the helper does for any other key: v0 = the result.
    val fallThrough = if (previousHelper != null) {
        // Another patch's helper already wraps get(): hand the value on to it.
        "invoke-static {p0}, ${valueClass.type}->${previousHelper.name}(${valueClass.type})Ljava/lang/Object;\n" +
            "move-result-object v0"
    } else {
        // The original body: iget-object holder; invoke holder.get(); move-result; return.
        val holderField = (current.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        val holderGet = (current.getOrNull(1) as? ReferenceInstruction)?.reference as? MethodReference
        if (current.size != 4 || current[0].opcode != Opcode.IGET_OBJECT || holderField == null ||
            holderField.definingClass != valueClass.type || holderGet == null ||
            current[1].opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE) ||
            current[2].opcode != Opcode.MOVE_RESULT_OBJECT || current[3].opcode != Opcode.RETURN_OBJECT
        ) {
            throw PatchException("$patchName: ${valueClass.type}.${get.name}() is not the expected holder getter")
        }
        // The helper calls the holder's get() with the holder as its only register.
        if (holderGet.parameterTypes.isNotEmpty()) {
            throw PatchException("$patchName: ${valueClass.type}.${get.name}() calls $holderGet with arguments")
        }
        val invokeHolder = if (current[1].opcode == Opcode.INVOKE_INTERFACE) "invoke-interface" else "invoke-virtual"
        val holderGetRef = "${holderGet.definingClass}->${holderGet.name}(" +
            holderGet.parameterTypes.joinToString("") + ")${holderGet.returnType}"
        """
            iget-object v0, p0, ${valueClass.type}->${holderField.name}:${holderField.type}
            $invokeHolder {v0}, $holderGetRef
            move-result-object v0
        """.trimIndent()
    }

    val resolved = forced.mapNotNull { (name, value) ->
        val field = enumConstantField(keyType, name)
        if (field == null) {
            if (name in required) throw PatchException("$patchName: $keyType has no $name constant")
            logger.warning("$patchName: $keyType has no $name constant, skipping it")
            null
        } else {
            field to value
        }
    }

    val groups = resolved.groupBy({ it.second }, { it.first })
    val checks = groups.entries.joinToString("\n") { (value, fields) ->
        fields.joinToString("\n") { field ->
            """
                sget-object v1, $field
                if-eq v0, v1, :forced_${value.name.lowercase()}
            """.trimIndent()
        }
    }
    val answers = groups.keys.joinToString("\n") { value ->
        ":forced_${value.name.lowercase()}\n${value.smali}\nreturn-object v0"
    }

    // v0 = key, v1 = scratch, p0 (v2) = the value object.
    val helper = ImmutableMethod(
        valueClass.type,
        helperName,
        listOf(ImmutableMethodParameter(valueClass.type, null, null)),
        "Ljava/lang/Object;",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(3),
    ).toMutable().apply {
        addInstructionsWithLabelsChecked(
            0,
            """
                iget-object v0, p0, ${valueClass.type}->${keyField.name}:$keyType
                $checks
                $fallThrough
                return-object v0
                $answers
            """.trimIndent(),
        )
    }
    valueClass.methods.add(helper)

    get.addInstructionsChecked(
        0,
        """
            invoke-static {p0}, ${valueClass.type}->$helperName(${valueClass.type})Ljava/lang/Object;
            move-result-object p0
            return-object p0
        """.trimIndent(),
    )
}
