package eh.premom.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * Core membership gate in MembershipUtils.
 * Returns true when the user is a free (NONE) or bronze member.
 * Used by isNone() and MembershipFeatureGateManager.shouldLock().
 */
object MembershipIsNoneOrBronzeFingerprint : Fingerprint(
    definingClass = "Lcom/premom/premom/common/biz/utils/MembershipUtils;",
    name = "isNoneOrBronze",
    returnType = "Z",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/premom/premom/common/biz/utils/MembershipUtils;",
            name = "getMembershipType",
        ),
        methodCall(
            definingClass = "Landroid/text/TextUtils;",
            name = "isEmpty",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Lpremom/eh/com/datalibrary/enums/MembershipType;",
        )
    )
)

/**
 * H5 web view premium check on UserBaseInfo.
 */
object H5IsPaidMemberFingerprint : Fingerprint(
    definingClass = "Lcom/premom/premom/common/biz/web/H5WebViewPolicy;",
    name = "isPaidMember",
    returnType = "Z",
    parameters = listOf("Lpremom/eh/com/datalibrary/entity/UserBaseInfo;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "Lpremom/eh/com/datalibrary/entity/UserBaseInfo;",
        ),
        methodCall(
            definingClass = "Ljava/lang/String;",
            name = "trim",
        )
    )
)

/**
 * H5 web view premium check for a specific user.
 */
object H5IsPaidMemberForUserFingerprint : Fingerprint(
    definingClass = "Lcom/premom/premom/common/biz/web/H5WebViewPolicy;",
    name = "isPaidMemberForUser",
    returnType = "Z",
    parameters = listOf("Lpremom/eh/com/datalibrary/entity/UserBaseInfo;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/premom/premom/common/biz/web/H5WebViewPolicy;",
            name = "isPaidMember",
        ),
        methodCall(
            definingClass = "Lpremom/eh/com/datalibrary/entity/UserBaseInfo;",
            name = "getUserId",
        )
    )
)

/**
 * OPK history analysis premium check.
 */
object OpkIsPaidMemberFingerprint : Fingerprint(
    definingClass = "Lpremom/eh/com/ovulation/analysis/OpkHistoryAnalysisPolicy;",
    name = "isPaidMember",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Boolean;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "booleanValue",
        )
    )
)
