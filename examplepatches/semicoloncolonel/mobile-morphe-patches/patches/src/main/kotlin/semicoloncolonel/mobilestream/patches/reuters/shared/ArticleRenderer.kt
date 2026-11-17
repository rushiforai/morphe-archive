package semicoloncolonel.mobilestream.patches.reuters.shared

import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// Reuters 7.51.0. The article renderer picks how each element renders with a
// chain of LoadConstString r5, <type>; JStrictEqualLong <branch>, r5, r33.
// The ad and promo branches wrap their card in a container whose margin stays
// on screen when the card renders nothing. A dropped type's jump now points at
// the renderer's "Ret r32" (offset 0x384), and r32 holds null there, so the
// element renders nothing at all. Only the 32-bit jump offset changes.
internal object ArticleRenderer {
    private val USING = listOf("fullWidthContainer", "topic-engagement", "context-widget")

    private val DROPS = mapOf(
        "ad" to ("73056162bd7a0800000521" to "73056162bd210100000521"),
        "dianomi" to ("73051c6abd8a0000000521" to "73051c6abd5b0000000521"),
        "preference" to ("7305931abd200700000521" to "7305931abd000100000521"),
        "newsletter" to ("7305c766bda70600000521" to "7305c766bdf50000000521"),
        "topic-engagement" to ("7305b044bd260600000521" to "7305b044bdea0000000521"),
    )

    private fun hex(text: String) = text.chunked(2).map { it.toInt(16).toByte() }.toByteArray()

    fun drop(bundle: HermesBundle, type: String) {
        val (find, replace) = DROPS.getValue(type)
        bundle.replaceInstructions("", USING, 96, hex(find), hex(replace))
    }
}
