package app.smartlife.patches.smartlife.ai

import app.morphe.patcher.Fingerprint

/**
 * com.thingclips...usk.c(): the central "is the AI assistant enabled" check. It reads the
 * is_ai_assistant_support flag and logs "enableAssistant, is_ai_assistant_support: ..." under
 * the AI_LOG tag, then returns the result. AIAssistantEnableServiceImpl.B2() (which every AI
 * bar / entry view consults) is backed by this, so gating it hides the AI bar and entry points.
 * Matched by its log strings, which survive obfuscation.
 */
internal object AiEnableCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf(
        "is_ai_assistant_support",
        "enableAssistant, is_ai_assistant_support: ",
        "AI_LOG",
    ),
)
