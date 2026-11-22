package app.tiktoktv.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/** Matches the app-context `b()` call that writes the `aid` common parameter. */
internal object CommonParamsAppIdFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("Ljava/util/Map;", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/ss/android/common/a;",
            name = "b",
            returnType = "I",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Ljava/lang/String;",
            name = "valueOf",
            parameters = listOf("I"),
            returnType = "Ljava/lang/String;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        string("aid"),
    ),
)

/** Matches the app-context `h()` call that writes the `app_name` common parameter. */
internal object CommonParamsAppNameFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("Ljava/util/Map;", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/ss/android/common/a;",
            name = "h",
            returnType = "Ljava/lang/String;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        string("app_name"),
    ),
)

/** Matches the legacy `build_number` common parameter. */
internal object CommonParamsBuildNumberFingerprint : Fingerprint(
    returnType = "Ljava/util/HashMap;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/bytedance/ies/ugc/appcontext/c;",
            name = "m",
            returnType = "Ljava/lang/String;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        string("build_number"),
    ),
)

/** Matches the default okhttp bridge user agent. */
internal object OkHttpUserAgentFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "getPackageName",
            returnType = "Ljava/lang/String;",
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Ljava/lang/StringBuilder;",
            name = "append",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Ljava/lang/StringBuilder;",
        ),
        opcode(Opcode.CONST_16, MatchAfterImmediately()),
        methodCall(
            definingClass = "Ljava/lang/StringBuilder;",
            name = "append",
            parameters = listOf("C"),
            returnType = "Ljava/lang/StringBuilder;",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            type = "Landroid/content/Context;",
        ),
        methodCall(
            definingClass = "Lcom/bytedance/frameworks/baselib/network/http/ok3/impl/p;",
            name = "c",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "I",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        methodCall(
            definingClass = "Ljava/lang/StringBuilder;",
            name = "append",
            parameters = listOf("I"),
            returnType = "Ljava/lang/StringBuilder;",
        ),
    ),
)

/** Matches the hardcoded TV category list. */
internal object TvCategoryListFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Funny"),
        string("V1_Funny"),
        string("Movies_TV"),
        string("V1_Movies_TV"),
    ),
)

/** Matches the remote category list payload. */
internal object RemoteCategoryListFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/util/ArrayList;",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            type = "Ljava/util/ArrayList;",
        ),
        methodCall(
            smali = "Ljava/util/ArrayList;->clear()V",
            location = MatchAfterImmediately(),
        ),
    ),
)
