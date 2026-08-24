package app.riky.patches.komoot

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val packageClass =
    "Lde/komoot/android/services/api/model/Package;"

/** RegionsData — aggregate map ownership shown in shop/offline UI. */
internal object RegionsDataFingerprint : Fingerprint(
    definingClass = "Lwmt;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Z",
        "Ljava/util/Map;",
        "Ljava/util/List;",
        "Lywl;",
        "Ljava/util/Map;",
        "Ljava/util/Map;",
        "Ljava/util/Set;",
    ),
)

/** Package.getMAllRegions() — world-pack flag from finance API / local DB. */
internal object PackageAllRegionsFingerprint : Fingerprint(
    definingClass = packageClass,
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/** Package.getMActive() — active package flag paired with allRegions checks. */
internal object PackageActiveFingerprint : Fingerprint(
    definingClass = packageClass,
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)
