package app.smartlife.patches.smartlife.ai

import app.morphe.patcher.Fingerprint

/**
 * The "is the AI assistant enabled" check. It reads the is_ai_assistant_support flag and logs
 * "enableAssistant, is_ai_assistant_support: ..." under the AI_LOG tag, then returns the result.
 * Matched by its log strings, which survive obfuscation.
 *
 * This can match more than one method: 7.12.0 has a single usk.c() that
 * AIAssistantEnableServiceImpl.B2() calls, but in 7.12.6 R8 inlined it into
 * AIAssistantEnableServiceImpl.o0() (used by the AI bar and most entry points) while also keeping
 * a copy as xdh.g(). Callers must patch every match (matchAll), not just the first.
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
