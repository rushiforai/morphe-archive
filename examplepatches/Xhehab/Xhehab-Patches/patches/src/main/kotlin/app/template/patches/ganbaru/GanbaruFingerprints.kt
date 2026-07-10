package app.template.patches.ganbaru

import app.morphe.patcher.Fingerprint

object GanbaruUserIsMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isMember",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruUserIsLiteMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isLiteMember",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruUserIsLifetimeMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isLifetimeMember",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruUserIsYearlyMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isYearlyMember",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruUserIsAffiliateMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isAffiliateMember",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruUserIsSingleProgramMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isSingleProgramMember",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruUserIsTrialFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/common/dataHelper/models/data/UserKt;",
    name = "isTrial",
    parameters = listOf("Lcom/ganbaru/method/common/dataHelper/models/data/User;"),
    returnType = "Z"
)

object GanbaruProgramTagCheckerIsPurchasedFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/domain/usecase/payment/ProgramTagCheckerImpl;",
    name = "isPurchased",
    parameters = listOf(
        "Ljava/util/Set;",
        "Lcom/ganbaru/method/common/dataHelper/models/data/User;"
    ),
    returnType = "Z"
)

object GanbaruWorkoutsViewModelIsPremiumMemberFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/ui/workoutsHome/WorkoutsViewModel;",
    name = "isPremiumMember",
    parameters = emptyList(),
    returnType = "Z"
)

object GanbaruViewProgramIsPurchasedThisProgramFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/ui/viewProgram/ViewProgramViewModel;",
    name = "isPurchasedThisProgram",
    parameters = listOf("Ljava/util/ArrayList;"),
    returnType = "Z"
)

object GanbaruSubscriptionTypeFromFingerprint : Fingerprint(
    definingClass = "Lcom/ganbaru/method/ui/settings/manageSubscription/SubscriptionType\$Companion;",
    name = "from",
    parameters = listOf("Ljava/lang/Integer;"),
    returnType = "Lcom/ganbaru/method/ui/settings/manageSubscription/SubscriptionType;"
)
