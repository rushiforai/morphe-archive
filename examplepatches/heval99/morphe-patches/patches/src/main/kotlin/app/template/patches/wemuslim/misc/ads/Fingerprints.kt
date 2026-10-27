package app.template.patches.wemuslim.misc.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val AUTHORITY_TYPE = "Lcom/fyxtech/muslim/protobuf/MembershipConfigProto\$AuthorityType;"
internal const val NO_ADS = "AUTHORITY_TYPE_NO_ADS"
internal const val WALLET_EXPORT = "Lcom/fyxtech/muslim/bizcore/router/export/IWalletExport;"
internal const val NEW_USER_AD_DAYS = "ad_new_user_first_show_days"

// The open-ad manager's "may this open-page resource show its ad" check (OooO00o.OooO0Oo in
// 3.5.0 and 3.5.4). It answers false for the remote "adEnable" switch, inside the new-user grace
// period (NEW_USER_AD_DAYS), for an already shown resource, while an open ad is loading or an
// interstitial is showing, and for members holding AUTHORITY_TYPE_NO_ADS. Its only caller picks
// the launcher's open-page resource: false drops an ad resource, so LauncherActivity never waits
// on the ad platform and goes straight to MainActivity. The model class name is stable; the
// manager and method names are R8-renamed. Several methods share the shape (the static "already
// shown" check is one), so the patch keeps only the one reading the grace period.
internal object OpenPageAdGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lcom/fyxtech/muslim/bizcore/resource/LocResourceOpenPageUiModel;"),
    custom = { method, _ -> method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) },
)

// The new-user grace period check on its own: 3.5.0 inlines it into the gate (and other ad
// checks), 3.5.4 calls this static ()Z helper (ric.OooO0OO in 3.5.4) from the gate.
internal object NewUserAdGraceFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(string(NEW_USER_AD_DAYS, StringComparisonType.CONTAINS)),
)
