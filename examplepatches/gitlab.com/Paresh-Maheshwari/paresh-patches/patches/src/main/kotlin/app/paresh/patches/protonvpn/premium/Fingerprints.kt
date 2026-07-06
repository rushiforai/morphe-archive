package app.paresh.patches.protonvpn.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// VpnUser.isFreeUser() — returns true when maxTier == 0
// Used in 40+ places to gate features for free users
object IsFreeUserFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "isFreeUser",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// VpnUser.getUserTier() — returns maxTier int (0=free, 2=plus)
object GetUserTierFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getUserTier",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// VpnUser.isUserPlusOrAbove() — returns getUserTier() >= 2
object IsUserPlusOrAboveFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "isUserPlusOrAbove",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// VpnUserKt.hasAccessToServer(VpnUser, Server) — server.tier <= user.tier
object HasAccessToServerFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/protonvpn/android/auth/data/VpnUser;",
        "Lcom/protonvpn/android/servers/Server;"
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "getTier"),
        methodCall(definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;", name = "getUserTier"),
    )
)

// NetShieldAvailabilityKt.getNetShieldAvailability(VpnUser) — returns AVAILABLE or UPGRADE_VPN_PLUS
object GetNetShieldAvailabilityFingerprint : Fingerprint(
    returnType = "Lcom/protonvpn/android/netshield/NetShieldAvailability;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/protonvpn/android/auth/data/VpnUser;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;", name = "isFreeUser"),
        fieldAccess(name = "AVAILABLE"),
    )
)

// VpnUser.getHasSubscription() — returns subscribed != 0
object GetHasSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getHasSubscription",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// VpnUser.getUserTierName() — returns plan name string, defaults to "free"
object GetUserTierNameFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getUserTierName",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// IsFeatureFlagEnabledImpl.invoke(UserId) — base class for all feature flags
object IsFeatureFlagEnabledFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/featureflag/data/IsFeatureFlagEnabledImpl;",
    name = "invoke",
    returnType = "Z",
    parameters = listOf("Lme/proton/core/domain/entity/UserId;"),
    filters = listOf(
        methodCall(definingClass = "Lme/proton/core/featureflag/data/IsFeatureFlagEnabledImpl;", name = "isLocalEnabled"),
        methodCall(definingClass = "Lme/proton/core/featureflag/data/IsFeatureFlagEnabledImpl;", name = "isRemoteEnabled"),
    )
)

// ServerListViewModelDataAdapterLegacy.asFilteredSequence_fnZhiP4$lambda$17
// UI-only filter that controls which servers appear in Countries/Cities/Servers tabs
// Contains isFreeServer() check — we invert it to exclude paid servers instead of free
object ServerListFilterFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Z",
        "Lcom/protonvpn/android/redesign/countries/ui/ServerFilterType;",
        "Ljava/lang/String;",
        "Lcom/protonvpn/android/redesign/CityStateId;",
        "Z",
        "Ljava/lang/String;",
        "Lcom/protonvpn/android/servers/Server;"
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "isFreeServer"),
    )
)

// ServerGroupUiItem$ServerGroup.getAvailable() — controls connect vs upsell in Countries tab
object ServerGroupGetAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/redesign/countries/ui/ServerGroupUiItem${'$'}ServerGroup;",
    name = "getAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// GetOnlineServersForIntent.invoke$lambda$2$lambda$1 — connection server filter (error fallback only)
object ConnectionServerFilterFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "I",
        "Lcom/protonvpn/android/vpn/ProtocolSelection;",
        "Ljava/util/List;",
        "Lcom/protonvpn/android/servers/Server;"
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "getTier"),
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "getOnline"),
    )
)

// ServerManager.getBestScoreServer — picks the actual server for connection
// p1 = Iterable<Server> (serverList), p2 = VpnUser, p3 = ProtocolSelection, p4 = smartProtocols
object GetBestScoreServerFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/utils/ServerManager;",
    name = "getBestScoreServer",
    returnType = "Lcom/protonvpn/android/servers/Server;",
    parameters = listOf(
        "Ljava/lang/Iterable;",
        "Lcom/protonvpn/android/auth/data/VpnUser;",
        "Lcom/protonvpn/android/vpn/ProtocolSelection;",
        "Ljava/util/List;"
    ),
)

// ServerGroupsViewModel.getFilterButtons — builds the filter tab buttons (All, SecureCore, P2P, Tor)
// p1 = availableTypes (Set), p2 = selectedType, p3 = allLabelRes, p4 = emptyTypes, p5 = onItemSelect
object GetFilterButtonsFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    parameters = listOf(
        "Ljava/util/Set;",
        "Lcom/protonvpn/android/redesign/countries/ui/ServerFilterType;",
        "I",
        "Ljava/util/Set;",
        "Lkotlin/jvm/functions/Function1;"
    ),
    filters = listOf(
        string("availableTypes"),
        methodCall(definingClass = "Lcom/protonvpn/android/redesign/countries/ui/ServerFilterType;", name = "getEntries"),
    )
)

// VpnUser.getMaxTier() — returns Integer maxTier (raw field, used by banner check)
object GetMaxTierFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getMaxTier",
    returnType = "Ljava/lang/Integer;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
)

// TypeAndLocationScreenState$Standard.getAvailableTypes() — profile type dropdown
object ProfileAvailableTypesFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/profiles/ui/TypeAndLocationScreenState\$Standard;",
    name = "getAvailableTypes",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

// ProfilesServerDataAdapter.countries() — builds country list for profile dropdown
// Calls serverManager2.getVpnCountries() — we redirect to getFreeCountries()
object ProfileCountriesFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/profiles/ui/ProfilesServerDataAdapter;",
    name = "countries",
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/ServerManager2;", name = "getVpnCountries"),
    )
)

// UpgradeOnboardingDialogActivity$Companion.launch(Context) — shows upgrade onboarding after login
object UpgradeOnboardingLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/ui/planupgrade/UpgradeOnboardingDialogActivity\$Companion;",
    name = "launch",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
