package app.braydog2010.patches.venaboxhub

import app.braydog2010.patches.shared.Constants.COMPATIBILITY_VENABOX_HUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

// adBrand.a.H() is the ad gate (returns true when ads should be shown). It is the
// only public, no-argument boolean method on adBrand.a that calls helper.b.h(),
// which makes it uniquely identifiable. Forced to false for an ad-free experience.
internal object AdGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/dubani/dub/mvc/helper/b;",
            name = "h",
            returnType = "Z",
        ),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/dubani/dub/mvc/apptools/adBrand/a;"
    },
)

// adBrand.a.e() reads SharedPrefs key B1 directly (not via helper.b.h), so it is
// not matched by AdGateFingerprint. It is called from App, Hwz1Activity, and u1 to
// decide whether to show subscription prompts. Forced to true so those UIs stay hidden.
internal object AdSubscriptionEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "Lcom/dubani/dub/mvc/apptools/adBrand/a;" &&
            method.name == "e"
    },
)

private const val CXGR_BEAN = "Lcom/dubani/dub/mvc/model/CxgrBean;"

@Suppress("unused")
val premiumPatch = bytecodePatch(
    name = "Premium",
    description = "Unlocks premium. Makes the app's session helper report a valid, active " +
        "subscription so locked content and premium-only features become available, and removes " +
        "ads. Note: media that the server streams and authorizes per-account may still depend on " +
        "the backend honouring the account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VENABOX_HUB)

    execute {
        val sessionHelper = mutableClassDefBy("Lcom/dubani/dub/mvc/helper/b;")

        fun method(name: String) = sessionHelper.methods.first {
            it.name == name && it.parameterTypes.isEmpty()
        }

        // 1) h() – the master entitlement gate, checked in ~90 places to decide whether content is
        //    unlocked (every gate does `if-eqz h(), :locked`, so true = entitled). Force it true.
        method("h").addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // 2) g() – reports an active subscription (CxgrBean.val == 1). Force it true.
        method("g").addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // 3) e() – returns the current user's subscription object (CxgrBean). For a user who never
        //    purchased, the entitlement map in prefs is empty, so this returns a blank bean and the
        //    now-active premium paths dereference its null fields and crash. Replace it with a fully
        //    populated, internally-consistent premium bean so every premium path has valid data:
        //    val=1 (active), master="1" (tier), bb/tbu/ubt=true, a far-future expiry, and all other
        //    string fields set to "" so nothing is null. .locals 5 leaves v0/v1 free.
        method("e").addInstructions(
            0,
            """
                new-instance v0, $CXGR_BEAN
                invoke-direct {v0}, $CXGR_BEAN-><init>()V
                const/4 v1, 0x1
                iput v1, v0, $CXGR_BEAN->val:I
                iput-boolean v1, v0, $CXGR_BEAN->bb:Z
                iput-boolean v1, v0, $CXGR_BEAN->tbu:Z
                iput-boolean v1, v0, $CXGR_BEAN->ubt:Z
                const-string v1, "1"
                iput-object v1, v0, $CXGR_BEAN->master:Ljava/lang/String;
                const-string v1, "9999999999999"
                iput-object v1, v0, $CXGR_BEAN->expires_date_ms:Ljava/lang/String;
                const-string v1, ""
                iput-object v1, v0, $CXGR_BEAN->app_id:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->app_name:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->app_os:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->brand_mail:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->brand_uid:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->email:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->fav_plid:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->fid:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->logtype:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->msync:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->phone:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->pid:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->pn:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->shelf:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->sub:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->uid:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->user_birth:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->user_face:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->user_gender:Ljava/lang/String;
                iput-object v1, v0, $CXGR_BEAN->user_name:Ljava/lang/String;
                return-object v0
            """,
        )

        // 4) Ad-free: force the ad gate to report "do not show ads".
        AdGateFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // 5) adBrand.a.e() reads SharedPrefs key B1 directly (bypasses helper.b.h), so patch 4
        //    does not cover it. Force true so subscription-prompt UIs driven by this gate stay hidden.
        AdSubscriptionEnabledFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
