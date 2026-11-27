# Text and image task APIs

Use named task factories for common short operations. The host supplies task-specific instructions and bounded output budgets. Your app owns the input, preview and final action.

| Task | SDK request |
| --- | --- |
| Spelling, grammar and punctuation | `TaskRequests.proofread(text)` |
| Summary | `TaskRequests.summarize(text)` |
| Professional tone | `TaskRequests.rewrite(text, TaskRequests.RewriteStyle.PROFESSIONAL)` |
| Natural rephrase | `TaskRequests.rewrite(text, TaskRequests.RewriteStyle.REPHRASE)` |
| Translation | `TaskRequests.translate(text, "French")` |
| Draft from supplied conversation | `TaskRequests.reply(incomingMessage, intendedReply)` |
| Match explicit user examples | `TaskRequests.matchStyle(text, userExamples)` |
| A user-directed change | `TaskRequests.edit(text, instruction)` |
| Visible image text | `TaskRequests.extractText()` |
| Image description | `TaskRequests.describeImage()` |

Submit text through `HostSession.submitText`; submit images through `submitImage` with a readable image file descriptor. Vision must be enabled and advertised as available. The client owns camera/picker permissions and explicit user selection. The host does not continuously capture the screen or microphone.

## Context and language

The configured session ceiling is 4096 total tokens, including instructions, history, media and reserved output. Context requests are bounded to 256–4096 tokens; output budgets to 1–2048 tokens. Keep keyboard jobs short. Partition a long document deliberately instead of silently dropping its end.

Translation requires an explicit destination. Supply the incoming message and intended response for a reply; the model does not know another app's conversation unless the caller provides it. Style examples must be explicitly supplied by the user or consuming app.

The writing policy uses a 38-language baseline and permits additional languages with an experimental-quality caveat. This does not establish verified quality for every task. Speech and voice profiles have their own language lists.

## Custom tasks

Use `TextRequest.rawMessages(...)` with `ChatMessage` roles for app-defined generation. Keep the system instruction stable, put changing input in the user message and specify a small output format. Validate returned JSON, enum values, ranges and referenced IDs with code.

Use deterministic code for exact counts, arithmetic, permissions and side effects. Use extraction APIs when the job is finding named spans or supported labels; use a language model for the ambiguous language step. Search is separately permissioned through [tool policy](tools-and-memory.md).

## Images and stale results

Image operations accept PNG/JPEG/WebP within the advertised size and pixel limits. Their result is text or a description. They do not provide OCR boxes or calibrated detector confidence. Check sensitive names and numbers before using extracted text.

Keep an editor/document revision with every request. Validate it before applying the terminal result, and preserve normal undo. The host never sends a message or edits another app on the caller's behalf.

[Connection tutorial](quickstart.md) · [Models and shared speech](speech.md)
