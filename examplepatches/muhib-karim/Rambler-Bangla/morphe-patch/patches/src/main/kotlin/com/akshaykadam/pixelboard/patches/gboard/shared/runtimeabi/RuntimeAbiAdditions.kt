/*
 * Merge these two entries into the existing RuntimeCallId enum in
 * pixelboard-patches/.../gboard/shared/runtimeabi/RuntimeAbi.kt
 * (alongside RAMBLER_RUNTIME_UPDATE_OFFICIAL_SELECTION).
 * GPL-3.0; see ATTRIBUTION.md.
 */

// BEGIN merge into enum RuntimeCallId
RAMBLER_LITE_RUNTIME_REWRITE_CLEANUP_PROMPT(
    "Lcom/akshaykadam/pixelboard/extension/ramblerlite/" +
        "GboardRamblerLiteScriptRuntime;->rewriteCleanupPromptScriptGate(" +
        "Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
),
RAMBLER_LITE_RUNTIME_SELECT_HINGLISH_OVERRIDE(
    "Lcom/akshaykadam/pixelboard/extension/ramblerlite/" +
        "GboardRamblerLiteScriptRuntime;->selectHinglishOverrideRule(" +
        "Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
),
// END merge

// The extension class itself ships at
// extension-src/com/akshaykadam/pixelboard/extension/ramblerlite/
// GboardRamblerLiteScriptRuntime.java and rides the existing extension
// carrier (gboardPatchesExtensionCarrierPatch), same as the AVT/Rambler
// runtimes.
