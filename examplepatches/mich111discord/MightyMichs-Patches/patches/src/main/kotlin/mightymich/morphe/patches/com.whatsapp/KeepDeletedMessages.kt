package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

/**
 * Keep "Delete for everyone" messages visible locally on WhatsApp 2.26.43.x - 2.26.46.x.
 *
 * How WhatsApp applies a revoke:
 *  - `RevokeEditProcessor` (obfuscated) receives an `FMessageRevoked` message and calls
 *    the edit/revoke store's static apply method.
 *  - That store method finds the original message row, rewrites/clears it and inserts the
 *    revoke bookkeeping. This is what makes the message disappear for the recipient.
 *
 * The previous implementation blindly prepended `return-void`/`return v0` to *every*
 * method of every class that referenced a revoke-related string. That included the
 * store's own constructor, which produced:
 *
 *     java.lang.VerifyError: Constructor returning without calling superclass constructor
 *
 * and crashed WhatsApp on launch (issues #56, #63, #65, #68).
 *
 * The fixed patch only touches the revoke apply method. It returns the store's existing
 * "not updated / no ack" result before any database work happens. The edit path is not
 * affected because edits use a different store method. If the expected shape cannot be
 * found, the patch fails with a PatchException instead of emitting invalid bytecode.
 *
 * Verified against 2.26.45.93, 2.26.46.76 and 2.26.46.82.
 */
@Suppress("unused")
val keepDeletedMessagesPatch = bytecodePatch(
    name = "Keep deleted messages",
    description = "Show messages that were deleted for everyone. Client-side only; " +
        "already-wiped history cannot be restored.",
    default = true,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    val highlight by booleanOption(
        key = "highlight",
        default = true,
        title = "Highlight deleted messages",
        description = "Reserved for future UI tinting of kept-deleted rows.",
    )

    execute {
        val log = Logger.getLogger("KeepDeletedMessages")
        fun fail(reason: String): Nothing =
            throw PatchException("Keep deleted messages: $reason")

        fun isAssignable(type: String, target: String, visited: MutableSet<String> = mutableSetOf()): Boolean {
            if (type == target) return true
            if (!visited.add(type)) return false

            val classDef = classDefByOrNull(type) ?: return false
            val superClass = classDef.superclass
            if (superClass != null && superClass != "Ljava/lang/Object;" &&
                isAssignable(superClass, target, visited)
            ) {
                return true
            }
            return classDef.interfaces.any { isAssignable(it.toString(), target, visited) }
        }

        // The revoke store logs this exact string when it re-inserts a revoked message.
        // It is stable across the supported 2.26.43.x / 2.26.45.x builds and is only
        // referenced by the store class.
        val storeClasses = classDefByStrings(REVOKE_STORE_ANCHOR)
            .filterNot { AccessFlags.INTERFACE.isSet(it.accessFlags) }
        if (storeClasses.isEmpty()) {
            fail("could not find the revoke store class (anchor: \"$REVOKE_STORE_ANCHOR\").")
        }

        // The apply method is static, takes (store, message, int, boolean) and returns
        // the result object. It is the only method with this shape in the store class.
        val candidates = storeClasses.flatMap { clazz ->
            clazz.methods
                .filter { method ->
                    AccessFlags.STATIC.isSet(method.accessFlags) &&
                        !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                        !AccessFlags.NATIVE.isSet(method.accessFlags) &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        method.implementation != null &&
                        method.parameterTypes.size == 4 &&
                        method.parameterTypes.firstOrNull()?.toString() == clazz.type
                }
                .map { method -> clazz to method }
        }
        val (storeClass, applyMethod) = candidates.singleOrNull()
            ?: fail(
                "expected exactly one revoke apply method, found ${candidates.size} " +
                    "in ${storeClasses.joinToString { it.type }}.",
            )

        val resultType = applyMethod.returnType
        val resultClass = classDefByOrNull(resultType)
            ?: fail("revoke result class $resultType does not exist.")

        // Result type is a small value class holding the server ack (D0W/B36) and a
        // boolean "updated" flag, e.g. C7a(D0W, Z) / 9rD(B36, Z).
        val resultFields = resultClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        val ackFieldDef = resultFields.singleOrNull { it.type != "Z" }
            ?: fail(
                "revoke result $resultType does not have exactly one ack field " +
                    "(fields: ${resultFields.joinToString { "${it.name}:${it.type}" }}).",
            )
        val ackType = ackFieldDef.type.toString()

        val constructor = resultClass.methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == listOf(ackType, "Z")
        } ?: fail("revoke result $resultType has no <init>($ackType, Z) constructor.")

        val instructions = applyMethod.implementation!!.instructions.toList()

        // Reuse an ack singleton that the apply method itself already uses for its
        // "nothing was updated" path (CfM on 2.26.45.x, Acv on 2.26.43.x).
        val ackField = instructions.asSequence()
            .filterIsInstance<ReferenceInstruction>()
            .filter { it.opcode == Opcode.SGET_OBJECT }
            .mapNotNull { it.reference as? FieldReference }
            .firstOrNull { isAssignable(it.type.toString(), ackType) }
            ?: fail("could not find a $ackType singleton used by the revoke apply method.")

        val parameterRegisters = applyMethod.parameterTypes.sumOf {
            if (it == "J" || it == "D") 2 else 1
        } + if (AccessFlags.STATIC.isSet(applyMethod.accessFlags)) 0 else 1
        val localRegisters = applyMethod.implementation!!.registerCount - parameterRegisters
        if (localRegisters < 3) {
            fail("revoke apply method has only $localRegisters local registers, need 3.")
        }

        val mutableClass = mutableClassDefBy(storeClass)
        val mutableMethod = mutableClass.methods.firstOrNull { method ->
            method.name == applyMethod.name &&
                method.parameterTypes.map { it.toString() } ==
                applyMethod.parameterTypes.map { it.toString() }
        } ?: fail("could not resolve mutable revoke apply method ${applyMethod.name}.")

        val ackFieldRef = "${ackField.definingClass}->${ackField.name}:${ackField.type}"
        val constructorRef = "${constructor.definingClass}-><init>(" +
            constructor.parameterTypes.joinToString("") { it.toString() } + ")V"

        mutableMethod.addInstructions(
            0,
            """
                sget-object v0, $ackFieldRef
                const/4 v1, 0x0
                new-instance v2, $resultType
                invoke-direct {v2, v0, v1}, $constructorRef
                return-object v2
            """,
        )

        log.info(
            "Keep deleted messages: stubbed ${storeClass.type}->${applyMethod.name}" +
                "${applyMethod.parameterTypes.joinToString("")} (result $resultType, ack $ackFieldRef)",
        )
    }
}

private const val REVOKE_STORE_ANCHOR = "msgstore/revoke: Failed to re-insert revoked message:"

