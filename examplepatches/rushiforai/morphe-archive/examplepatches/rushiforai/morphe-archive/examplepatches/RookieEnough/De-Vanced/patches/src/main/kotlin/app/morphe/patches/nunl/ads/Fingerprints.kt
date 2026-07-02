/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/nunl/ads/Fingerprints.kt
 */
package app.morphe.patches.nunl.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object JwPlayerConfigMethodFingerprint : Fingerprint(
    name = "advertisingConfig",
    definingClass = "Lcom/jwplayer/pub/api/configuration/PlayerConfig\$Builder;",
    accessFlags = listOf(AccessFlags.PUBLIC),
)

internal object ScreenMapperMethodFingerprint : Fingerprint(
    definingClass = "Lnl/nu/android/bff/data/mappers/ScreenMapper;",
    name = "map",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lnl/nu/android/bff/domain/models/screen/ScreenEntity;",
    parameters = listOf("Lnl/nu/performance/api/client/objects/Screen;"),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.IF_EQZ,
        Opcode.CHECK_CAST,
    ),
)

internal object NextPageRepositoryImplMethodFingerprint : Fingerprint(
    definingClass = "Lnl/nu/android/bff/data/repositories/NextPageRepositoryImpl;",
    name = "mapToPage",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Lnl/nu/android/bff/domain/models/Page;",
    parameters = listOf("Lnl/nu/performance/api/client/PacResponse;", "Ljava/lang/String;"),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.IF_EQZ,
        Opcode.CHECK_CAST,
    ),
)

