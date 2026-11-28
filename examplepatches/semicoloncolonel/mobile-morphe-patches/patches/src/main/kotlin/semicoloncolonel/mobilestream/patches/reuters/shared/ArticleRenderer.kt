package semicoloncolonel.mobilestream.patches.reuters.shared

import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// The article renderer picks how each element renders with a chain of
// LoadConstString r5, <type>; JStrictEqualLong <branch>, r5, r33. The ad and
// promo branches wrap their card in a container whose margin stays on screen
// when the card renders nothing. Redirecting a type's branch to the renderer's
// null return (Ret r32) makes that element render nothing at all, leaving no
// gap. The type is found by its own string, and the target by the chain's
// shape, so this holds as the bundle changes between app versions.
internal object ArticleRenderer {
    private val USING = listOf("fullWidthContainer", "topic-engagement", "context-widget")

    fun drop(bundle: HermesBundle, type: String) {
        bundle.dropTypeBranch("", USING, type)
    }
}
