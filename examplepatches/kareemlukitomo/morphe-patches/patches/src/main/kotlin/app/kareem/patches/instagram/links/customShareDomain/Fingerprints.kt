package app.kareem.patches.instagram.links.customShareDomain

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode

private val targetStrings =
    arrayOf(
        "XDTPermalinkResponse",
        "profile_to_share_url",
    )

internal object PermalinkResponseJsonParserFingerprint : Fingerprint(
    strings = listOf(targetStrings[0]),
    custom = { methodDef, _ ->
        methodDef.name.lowercase().contains("parsefromjson") &&
            methodDef.implementation
                ?.instructions
                ?.count { it.opcode == Opcode.CONST_STRING }
                ?.let { it < 3 }
                ?: false
    },
)

internal object ProfileUrlResponseJsonParserFingerprint : Fingerprint(
    strings = listOf(targetStrings[1]),
    custom = { methodDef, _ ->
        methodDef.name.lowercase().contains("parsefromjson")
    },
)

internal object StoryUrlResponseImplFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    definingClass = "Lcom/instagram/request/StoryItemUrlResponseImpl;",
)

internal object LiveUrlResponseImplFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    definingClass = "Lcom/instagram/request/LiveItemLinkUrlResponseImpl;",
)
