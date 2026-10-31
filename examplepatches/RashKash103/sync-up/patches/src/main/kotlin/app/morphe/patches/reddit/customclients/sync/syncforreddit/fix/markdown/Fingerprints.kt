package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.markdown

import app.morphe.patcher.Fingerprint

/**
 * Rewrites a fenced code block before the text is drawn, putting what it matched back in as the
 * replacement. This is the one a thread that will not load dies in.
 */
internal val codeBlockFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
    strings = listOf("```(.*?)```"),
)

/**
 * Rewrites a link written in the text, likewise putting matched text back in as the replacement.
 * Vulnerable to exactly the same thing, and by the same means.
 */
internal val markdownLinkFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
    strings = listOf("█", "]("),
)
