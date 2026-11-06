package app.bookspiko.patches.books.misc.gms

import app.bookspiko.patches.books.shared.Constants.COMPATIBILITY_PLAY_BOOKS
import app.bookspiko.patches.books.shared.accountConstructorType
import app.bookspiko.patches.books.shared.firstUseOf
import app.bookspiko.patches.books.shared.stringLiteral
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import java.util.logging.Logger

/**
 * Account names that address "whatever account Play services considers the default".
 * Those requests go to Google Play services, which does not know GmsCore account types.
 */
private const val DEFAULT_ACCOUNT_NAME = "<<default account>>"

/**
 * Play services client library classes that only build requests for Google Play services.
 */
private const val PLAY_SERVICES_CLIENT_PACKAGE = "Lcom/google/android/gms/"

@Suppress("unused")
val extendedAccountTypePatch = bytecodePatch(
    name = "GmsCore account type (extended)",
    description = "Experimental. Also rewrites the remaining Account(name, \"com.google\") constructions " +
        "of the app (uploads, collections, support pages, background sync) to the GmsCore account type. " +
        "\"GmsCore support\" alone was verified to sign in and open the library.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_PLAY_BOOKS)
    dependsOn(gmsCoreSupportPatch)

    execute {
        val accountType = gmsCoreSupportPatch.options["gmsCoreVendorGroupId"].value as String
        val logger = Logger.getLogger(this::class.java.name)
        var replaced = 0

        classDefForEach { classDef ->
            if (classDef.type.startsWith(PLAY_SERVICES_CLIENT_PACKAGE)) return@classDefForEach

            val candidates = classDef.methods.filter { method ->
                val instructions = method.implementation?.instructions ?: return@filter false
                instructions.any { it.stringLiteral == "com.google" } &&
                    instructions.none { it.stringLiteral == DEFAULT_ACCOUNT_NAME }
            }
            if (candidates.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            candidates.forEach { candidate ->
                val method = mutableClass.methods.first {
                    it.name == candidate.name &&
                        it.parameterTypes == candidate.parameterTypes &&
                        it.returnType == candidate.returnType
                }
                method.instructions.withIndex()
                    .filter { (_, instruction) -> instruction.stringLiteral == "com.google" }
                    .map { it.index }
                    .forEach { index ->
                        val register = (method.instructions[index] as OneRegisterInstruction).registerA
                        val use = method.firstUseOf(index, register) ?: return@forEach
                        if (!accountConstructorType.matches(use, register)) return@forEach

                        method.replaceInstruction(
                            index,
                            BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(accountType)),
                        )
                        replaced++
                        logger.info("Account type rewritten in ${method.definingClass}->${method.name}")
                    }
            }
        }

        logger.info("Rewrote $replaced additional account type literal(s)")
    }
}
