package app.template.patches.steamlink.decoder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

// Targets findBestDecoder(); the IGET of m_nLowLatencyVideoMode is its first instruction.
object LowLatDecoderFingerprint : Fingerprint(
    definingClass = "Lcom/valvesoftware/steamlink/SteamLink;",
    name = "findBestDecoder",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "this",
            type = "I",
        ),
    ),
)
