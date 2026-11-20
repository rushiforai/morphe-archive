package id.ikuradachi.patches.crunchyroll.player.maturity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object MaturityLabelDataProviderConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        string("playerControlsVisibility"),
        opcode(Opcode.NEW_INSTANCE),
    ),
)

fun createMaturityLabelVisibilityFingerprint(maturityCoroutineClass: String) = Fingerprint(
    definingClass = maturityCoroutineClass,
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(name = "isVisible", returnType = "Z"),
    ),
)
