package app.template.patches.protonvpn.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Obfuscated (v5.20.57.0+)
object VpnUserGetUserTierFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "t",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserGetMaxTierFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "i",
    returnType = "Ljava/lang/Integer;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserIsFreeUserFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "v",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserIsUserPlusOrAboveFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "x",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserGetUserTierNameFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "u",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object HasAccessToServerFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lag/a;",
        "Lcom/protonvpn/android/servers/Server;",
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "getTier"),
        methodCall(definingClass = "Lag/a;", name = "t"),
    ),
)

object HaveAccessWithFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "w",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/protonvpn/android/servers/Server;",
        "Ljava/lang/Integer;",
    ),
)

object GetBestScoreServerFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/utils/ServerManager;",
    name = "getBestScoreServer",
    returnType = "Lcom/protonvpn/android/servers/Server;",
    parameters = listOf(
        "Ljava/lang/Iterable;",
        "Lag/a;",
        "Lcom/protonvpn/android/vpn/ProtocolSelection;",
        "Ljava/util/List;",
    ),
)

object GetNetShieldAvailabilityFingerprint : Fingerprint(
    returnType = "Lcom/protonvpn/android/netshield/NetShieldAvailability;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lag/a;"),
    filters = listOf(
        methodCall(definingClass = "Lag/a;", name = "v"),
        fieldAccess(name = "AVAILABLE"),
    ),
)

object VpnUserConstructorFingerprint : Fingerprint(
    definingClass = "Lag/a;",
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Lme/proton/core/domain/entity/UserId;",
        "I", "I", "I", "I", "Z", "I", "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/Integer;",
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J",
        "Lme/proton/core/network/domain/session/SessionId;",
        "Ljava/lang/String;",
        "Lcom/protonvpn/android/models/login/NetShieldConfig;",
    ),
)

// Non-obfuscated (v5.20.39.0 and earlier)
object VpnUserGetUserTierFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getUserTier",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserGetMaxTierFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getMaxTier",
    returnType = "Ljava/lang/Integer;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserIsFreeUserFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "isFreeUser",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserIsUserPlusOrAboveFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "isUserPlusOrAbove",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object VpnUserGetUserTierNameFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "getUserTierName",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object HasAccessToServerFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUserKt;",
    name = "hasAccessToServer",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/protonvpn/android/auth/data/VpnUser;",
        "Lcom/protonvpn/android/servers/Server;",
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "getTier"),
        methodCall(definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;", name = "getUserTier"),
    ),
)

object HaveAccessWithFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUserKt;",
    name = "haveAccessWith",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/protonvpn/android/servers/Server;",
        "Ljava/lang/Integer;",
    ),
)

object GetBestScoreServerFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/utils/ServerManager;",
    name = "getBestScoreServer",
    returnType = "Lcom/protonvpn/android/servers/Server;",
    parameters = listOf(
        "Ljava/lang/Iterable;",
        "Lcom/protonvpn/android/auth/data/VpnUser;",
        "Lcom/protonvpn/android/vpn/ProtocolSelection;",
        "Ljava/util/List;",
    ),
)

object GetNetShieldAvailabilityFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/netshield/NetShieldAvailabilityKt;",
    name = "getNetShieldAvailability",
    returnType = "Lcom/protonvpn/android/netshield/NetShieldAvailability;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/protonvpn/android/auth/data/VpnUser;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;", name = "isFreeUser"),
        fieldAccess(name = "AVAILABLE"),
    ),
)

object VpnUserConstructorFingerprintV2 : Fingerprint(
    definingClass = "Lcom/protonvpn/android/auth/data/VpnUser;",
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Lme/proton/core/domain/entity/UserId;",
        "I", "I", "I", "I", "Z", "I", "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Ljava/lang/Integer;",
        "I",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J",
        "Lme/proton/core/network/domain/session/SessionId;",
        "Ljava/lang/String;",
        "Lcom/protonvpn/android/models/login/NetShieldConfig;",
    ),
)

// Shared (same in both versions)
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
        "Lcom/protonvpn/android/servers/Server;",
    ),
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/Server;", name = "isFreeServer"),
    ),
)

object ServerGroupGetAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/redesign/countries/ui/ServerGroupUiItem\$ServerGroup;",
    name = "getAvailable",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)

object IsFeatureFlagEnabledFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/featureflag/data/IsFeatureFlagEnabledImpl;",
    name = "invoke",
    returnType = "Z",
    parameters = listOf("Lme/proton/core/domain/entity/UserId;"),
    filters = listOf(
        methodCall(definingClass = "Lme/proton/core/featureflag/data/IsFeatureFlagEnabledImpl;", name = "isLocalEnabled"),
        methodCall(definingClass = "Lme/proton/core/featureflag/data/IsFeatureFlagEnabledImpl;", name = "isRemoteEnabled"),
    ),
)

object GetFilterButtonsFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    parameters = listOf(
        "Ljava/util/Set;",
        "Lcom/protonvpn/android/redesign/countries/ui/ServerFilterType;",
        "I",
        "Ljava/util/Set;",
        "Lkotlin/jvm/functions/Function1;",
    ),
    filters = listOf(
        string("availableTypes"),
        methodCall(definingClass = "Lcom/protonvpn/android/redesign/countries/ui/ServerFilterType;", name = "getEntries"),
    ),
)

object ProfileCountriesFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/profiles/ui/ProfilesServerDataAdapter;",
    name = "countries",
    filters = listOf(
        methodCall(definingClass = "Lcom/protonvpn/android/servers/ServerManager2;", name = "getVpnCountries"),
    ),
)

object ProfileAvailableTypesFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/profiles/ui/TypeAndLocationScreenState\$Standard;",
    name = "getAvailableTypes",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)