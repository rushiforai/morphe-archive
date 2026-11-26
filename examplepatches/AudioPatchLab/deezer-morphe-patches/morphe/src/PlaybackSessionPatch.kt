package deezer.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PLAYLOG_REQUESTS = "LIIIIlIlIIlIII;"
private const val GATEWAY_REQUEST = "LIlllIlIlIlIlllII;"

private fun MutableMethod.skipPlaylogRequest(apiMethod: String) {
    check(returnType == GATEWAY_REQUEST)
    check(checkNotNull(implementation).instructions.count {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == apiMethod
    } == 1)

    // The sender already handles null as no request and completes its cache bookkeeping.
    addInstructions(
        0,
        """
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(),
    )
}

internal val playbackSessionPatch = patch {
    compatibleWith(deezerCompatibility)

    execute {
        // Playback logs share their sender with other logs. Skip only the two listening endpoints.
        val requests = mutableClassDefBy(PLAYLOG_REQUESTS)
        requests.methods.single {
            it.name == "IllIIIlllIIlIlll" && it.parameterTypes == listOf("LIIIIlIIIIIlllllI;")
        }.skipPlaylogRequest("log.listen")
        requests.methods.single {
            it.name == "IllIlllIIIllIlII" && it.parameterTypes == listOf("Ljava/util/List;")
        }.skipPlaylogRequest("log.batch_listen")
    }
}
