package id.ikuradachi.patches.crunchyroll.speed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PlaybackSpeedConfigToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("PlaybackSpeedConfigurationImpl(isEnabled="),
    ),
)

object PlayerSettingsViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        literal(1.0f),
        literal(0.75f),
        literal(0.5f),
        opcode(Opcode.FILLED_NEW_ARRAY),
    ),
)
