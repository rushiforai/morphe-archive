package app.paresh.patches.truecaller.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// Targets hc2.c.a() — scam feed manager isEnabled check
object ScamFeedEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lhc2/a;", name = "a"),
        methodCall(definingClass = "Lhc2/baz;", name = "a")
    )
)

// Targets gg1.c.w() — call assistant feature toggle
object AssistantFeatureFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("featureCallAssistant")
    )
)

// Targets qn2.a.a() — finds the method via the premium button field access
object PremiumPurchaseSupportedFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    filters = listOf(
        fieldAccess(opcode = com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT, definingClass = "Lqn2/a;", name = "d", type = "Lqn2/l;")
    )
)

// Targets CategoriesFragment$b.emit() — sets premium item visibility
// Reads fh2.m0.a (isPremiumItemVisible) field
object SettingsPremiumVisibilityFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Lj33/baz;"),
    filters = listOf(
        fieldAccess(opcode = com.android.tools.smali.dexlib2.Opcode.IGET_BOOLEAN, definingClass = "Lfh2/m0;", name = "a", type = "Z")
    )
)

// Targets gg1.c — family protect feature flag check
object FamilyProtectFeatureFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("featureFamilyProtect")
    )
)

// Targets zo2/baz.a() — Compose function that renders "Premium member" block on UsersHome settings
object PremiumBlockComposeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/truecaller/usershome/presentaion/ui/components/featureditemsection/baz;",
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/ui/b;",
        "Ll2/k;",
        "I"
    ),
    filters = listOf(
        string("premium_block")
    )
)
