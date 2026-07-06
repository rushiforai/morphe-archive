package app.paresh.patches.eyecon.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Combined premium check — p8/e.u(Boolean)Boolean
object CombinedPremiumCheckFingerprint : Fingerprint(
    returnType = "Ljava/lang/Boolean;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Ljava/lang/Boolean;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Ljava/lang/Boolean;",
            name = "TRUE",
            type = "Ljava/lang/Boolean;"
        )
    ),
    custom = { method, _ -> method.implementation?.registerCount == 2 }
)

// Find the FreePremium class via its clinit strings
object FreePremiumClassFingerprint : Fingerprint(
    strings = listOf("SP_KEY_LAST_DATE_FOR_FREE_PREMIUM", "SP_KEY_LAST_DATE_FOR_VIRAL_PREMIUM")
)

// Free premium timer check — j5/c.c()Z
object FreePremiumCheckFingerprint : Fingerprint(
    classFingerprint = FreePremiumClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/System;", name = "currentTimeMillis")
    )
)

// Premium button in bottom bar — MainActivity.M0()V
object PremiumButtonVisibilityFingerprint : Fingerprint(
    definingClass = "Lcom/eyecon/global/MainScreen/MainActivity;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        literal(0x7f0a00dc)  // R.id.EIB_premium
    )
)

// Settings premium section setup — MoreSettingsFragment.mo10006m0()
// Sets click listener on premiumContainer (field w) with Lv6/o class
object SettingsPremiumSetupFingerprint : Fingerprint(
    definingClass = "Lcom/eyecon/global/MoreMenuAndSettings/MoreSettingsFragment;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(name = "w", type = "Landroid/view/View;"),
    )
)
