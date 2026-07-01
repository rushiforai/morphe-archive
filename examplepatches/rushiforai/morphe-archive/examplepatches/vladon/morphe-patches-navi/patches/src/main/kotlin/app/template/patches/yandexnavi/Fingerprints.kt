package app.template.patches.yandexnavi

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * `ru.yandex.yandexmaps.debug.v0.c()Z` — cached `nextLaunchAsYandexoid` gate (28.6.5, classes15.dex).
 */
internal object YandexMapsDebugV0NextLaunchFingerprint : Fingerprint(
    definingClass = "Lru/yandex/yandexmaps/debug/v0;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            name = "c",
        ),
        opcode(Opcode.RETURN),
    ),
)

/**
 * `ru.yandex.yandexmaps.debug.m0.i()Z` — AND of [YandexMapsDebugV0NextLaunchFingerprint] and experiment "Debug panel swipable".
 */
internal object YandexMapsDebugM0PanelVisibilityFingerprint : Fingerprint(
    definingClass = "Lru/yandex/yandexmaps/debug/m0;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(smali = "Lru/yandex/yandexmaps/debug/v0;->c()Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ),
    ),
)

/**
 * `com.yandex.passport.internal.c0.a(...)` — Kotlin `releaseRuntimeChecks` (28.6.5, classes12.dex).
 * Unique string: Passport fatal *application signature mismatch*.
 */
internal object PassportReleaseRuntimeChecksSignatureCrashFingerprint : Fingerprint(
    definingClass = "Lcom/yandex/passport/internal/c0;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    name = "a",
    returnType = "V",
    parameters = listOf(
        "Lcom/yandex/passport/internal/c0;",
        "Landroid/content/Context;",
        "Lio/appmetrica/analytics/IReporterYandex;",
    ),
    strings = listOf("Internal error, application signature mismatch"),
)
