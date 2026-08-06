package app.heinrich26.patches.example

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * See:
 * https://github.com/MorpheApp/morphe-patcher/blob/main/docs
 * https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md
 *
 * Declaring fingerprints as classes is not required, but if a fingerprint fails
 * to match then the exception stack trace will include the fingerprint name.
 */
object GetProStatusFingerprint : Fingerprint(
    /**
     * Defining class type is matched using implicit comparison depending on how the type is declared.
     *
     * This can be a package without a class: ":com/some/app/ads/"
     * A class without a package: "/AdsLoader;"
     * Or a full class if the full class name is not obfuscated: "Lcom/some/app/ads/AdsLoader;"
     *
     * See [app.morphe.patcher.StringComparisonType] for more.
     */
    definingClass = "Lcom/pryshedko/mtisland/model/datastore/DataStoreRepositoryBilling;",
    /**
     * Exact method name.
     */
    name = "getProStatus1",
    /**
     * Exact access flags.
     */
    accessFlags = listOf(AccessFlags.PUBLIC),
    /**
     * Return type. Partial matches are allowed and follows the same rules as [definingClass]
     * and [app.morphe.patcher.StringComparisonType].
     */
    returnType = "Ljava/lang/Object",
    /**
     * Parameters. Partial matches are allowed and follows the same rules as
     * [app.morphe.patcher.StringComparisonType].
     *
     * Obfuscated class names must be declared only using the object type: "L"
     * Since obfuscated names change between app targets.
     */
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
    /**
     * Instruction filters. See [app.morphe.patcher.InstructionFilter].
     */
    filters = listOf(
        literal(0, opcodes = listOf(Opcode.CONST_4)),
        opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
        methodCall(smali = "Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;")
    )
)