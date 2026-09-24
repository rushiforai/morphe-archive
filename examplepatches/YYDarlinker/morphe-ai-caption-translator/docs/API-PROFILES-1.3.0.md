# 1.3.0 — named API profiles and provider-aware endpoints

> Historical implementation notes. The provider matrix and credential boundaries still apply.
> The profile UI and editor lifecycle described below are superseded by
> [the 1.3.1 compact settings revision](API-PROFILES-UI-1.3.1.md).

## Settings and migration

YouTube → Settings → Morphe → AI caption translator → API configuration.
The first row is **API profiles**: a profile selector, inline name field, Rename and
Add profile actions. It uses the same theme-derived spacing, typography, native controls,
rounded inline editors, and 48dp touch targets as the existing API fields. The action
buttons share the available width and the selected name is ellipsized on narrow screens.

- Existing address, model, prompt and encrypted key remain in place as **Original configuration**.
  There is no destructive migration or plaintext key copy.
- Selecting a saved profile activates it. Address, key and model are edited using the existing
  fields below; translation requirements belong to that profile too. Other profiles remain saved.
- Rename applies the inline name to the selected profile. IDs remain stable UUIDs (the legacy
  profile has a reserved ID), so duplicate names or later renaming do not change credentials.
- Add creates a separate keyless profile with an empty model; it does not copy the previous key.
  Fill its endpoint, key and model before using translation. Up to thirty profiles are retained.
- Engine enabled state, subtitle styling/position, and regular/Shorts menu visibility stay global.
  Selecting a profile does not automatically enable a disabled engine or alter caption language memory.
- Pending valid text/model edits are flushed to the **old** profile before selection changes.
  Invalid edits block selection with an inline hint. Old editor callbacks cannot write into the
  newly selected profile, including after the list recycles/rebinds views.
- Model-list generations are invalidated; a completed test of the old profile cannot refresh the
  new profile's translation session. Active sessions are restarted by the existing configuration
  refresh path, which cancels old work and rejects old-generation results. Already-sent provider
  requests may still be processed or billed; switching cannot undo remote work.

### Credential boundaries

Each key remains AES-GCM encrypted with the existing non-exportable Android Keystore key,
in a separate profile ciphertext slot. Clearing one profile's key removes only its ciphertext
and origin binding, not the shared Keystore alias needed by the other profiles. Saved keys are
not loaded into the editor. Endpoint/model/prompt/key snapshots are read under one profile lock,
so selection cannot mix an endpoint from A with the key from B.

Keys are additionally bound to their saved scheme/authority. Changing a profile to another
host suppresses use of the old key until a key is entered for that host. The old encrypted
value is retained until replaced or explicitly cleared; switching back to the original host
can use it again. Legacy ciphertext is pinned to its previous origin before an address edit.
Keep keys in the API Key field, not in URLs or profile names. No key export feature is added.

## Address compatibility

This is an **OpenAI Chat Completions compatible** client, not an arbitrary protocol translator.
It accepts a base URL, a complete `/chat/completions` endpoint, or a `/models` URL. Known bare
provider hosts receive the appropriate documented path. Explicit custom paths and query
parameters are preserved (including Azure `api-version`). Unknown gateways are not rewritten
to a guessed provider and are not assigned vendor parameters based merely on model names.

| Provider / route | Base path / handling |
|---|---|
| Alibaba Cloud Bailian standard, international and US DashScope domains | `/compatible-mode/v1`; `enable_thinking=false` |
| Bailian business-space `*.maas.aliyuncs.com` | `/compatible-mode/v1`; includes the reported Beijing workspace form; `enable_thinking=false` |
| Bailian `coding.dashscope.aliyuncs.com` | `/v1` for its OpenAI-compatible route, not `/apps/anthropic`; use only where the provider allows the workload |
| DeepSeek official | `/v1`; `thinking.type=disabled` |
| SiliconFlow `.cn` / `.com` | `/v1`; `enable_thinking=false` |
| Volcengine Ark `ark.<region>.volces.com` | `/api/v3`; `thinking.type=disabled` |
| Zhipu BigModel | `/api/paas/v4`; `thinking.type=disabled` |
| Moonshot/Kimi `.cn` / `.ai` | `/v1`; portable request, no guessed model-specific thinking field |
| OpenAI official | `/v1`; bounded `max_completion_tokens` instead of deprecated `max_tokens` |
| Gemini OpenAI-compatible API | `/v1beta/openai`; not native `generateContent` |
| Anthropic OpenAI-compatible API | `/v1`; omit its ignored `response_format`, retain JSON prompt and strict local parsing; not native `/messages` |
| OpenRouter | `/api/v1`; portable request |
| Groq | `/openai/v1`; portable request |
| Cerebras, Mistral, xAI, Together (`.ai` and legacy `.xyz`) | `/v1`; portable request |
| Fireworks | `/inference/v1`; portable request |
| MiniMax `.io` / `.com` | `/v1`; separate reasoning with `reasoning_split=true` |
| Azure OpenAI / Foundry | `/openai/v1`; API-key header; full legacy deployment routes/query also preserved |
| Other OpenAI-compatible gateways and local servers | Explicit configured base path, bearer API key, portable request |

Host matching is case-normalized and boundary-aware; lookalikes such as
`maas.aliyuncs.com.evil.example` do not gain provider behavior. Translation and model-list
requests do not follow redirects carrying a credential. Azure deployment URLs require a
manually entered deployment/model name instead of an invented deployment `/models` route.

Native Anthropic Messages, OpenAI Responses, Gemini GenerateContent, Ollama native `/api/chat`,
SigV4/Bedrock and OAuth-refresh protocols are not implemented. Use a provider's documented
OpenAI-compatible route where available. Model lists may be unavailable even where inference
works; the inline model ID remains editable. API keys, region entitlements, subscriptions,
model availability and provider workload policies still apply. Do not reuse a PAYG key for
a subscription endpoint unless the provider explicitly supports it.

### Request and cost policy

No translation pass, background horizon, token limit or retry allowance is increased.
The current priority deadline remains ten seconds. Adding a domain does not guarantee that
all models there meet real-time latency. Thinking-only models cannot be made non-thinking.
An explicit JSON-format rejection removes only `response_format`, preserving a supported
non-thinking flag; an explicit thinking rejection removes the thinking fields. The existing
single optional-schema negotiation allowance is retained. Its cached outcome is an immutable
identity/category pair, so concurrent providers cannot mix negotiation state.

## Primary documentation consulted (2026-09-18)

- Bailian OpenAI compatibility: https://help.aliyun.com/zh/model-studio/compatibility-of-openai-with-dashscope
- Bailian thinking and workspace examples: https://help.aliyun.com/zh/model-studio/deep-thinking
- Bailian Coding Plan route/key separation: https://help.aliyun.com/zh/model-studio/coding-plan
- DeepSeek: https://api-docs.deepseek.com/
- SiliconFlow: https://docs.siliconflow.cn/docs/api/chat-completions-post
- Ark: https://docs.volcengine.com/docs/ark/chat-api?lang=zh
- BigModel: https://docs.bigmodel.cn/api-reference/模型-api/对话补全
- Kimi: https://platform.kimi.ai/docs/guide/migrating-from-openai-to-kimi
- OpenAI: https://developers.openai.com/api/reference/resources/chat/subresources/completions/methods/create
- Gemini: https://ai.google.dev/gemini-api/docs/openai
- Anthropic: https://platform.claude.com/docs/en/cli-sdks-libraries/libraries/openai-sdk
- Groq: https://console.groq.com/docs/openai
- OpenRouter: https://openrouter.ai/docs/api_reference/overview
- Together: https://docs.together.ai/docs/inference/openai-compatibility
- Fireworks: https://docs.fireworks.ai/api-reference/post-chatcompletions
- Cerebras: https://inference-docs.cerebras.ai/
- Mistral: https://docs.mistral.ai/api/endpoint/chat
- MiniMax: https://platform.minimax.io/docs/api-reference/text-openai-api
- Azure official documentation source (web endpoint TLS fetch failed; repository source fetched):
  https://github.com/MicrosoftDocs/azure-ai-docs/blob/main/articles/foundry/openai/includes/api-version-lifecycle-content.md

## Validation and limits

Local tests cover original-setting preservation, profile naming and persistence, independent
key slots and clear behavior, endpoint/key snapshot consistency during repeated selection,
host-change key quarantine, late URL/model edits, invalid-input switch blocking, the actual
profile selector/add/rename widgets, narrow-layout button bounds, endpoint/path/query routing,
boundary-aware host detection, and authentication headers using a real loopback HTTP server.
Provider protocol tests use synthetic responses and fake keys, never the user's credentials.

The Android MPP and full official Morphe 1.43.0 + addon composition are built against original
YouTube 21.07.247. Generated DEX and settings resource checks cover the new profile preference
and retain the existing ownership/menu audits. Both other caption patches remain independently
selectable. The test suite does not certify every provider/model via paid live calls.

No real-phone visual/playback acceptance, emulator UI screenshot, or new real Android Keystore
round-trip test was performed in this revision. An emulator launch attempt was blocked by the
execution environment; no workaround was used. The existing encryption algorithm is retained,
while slot/origin isolation and clearing are covered by framework tests. Final device checks:
name two profiles, enter separate keys, alternate them, restart the app, clear one key, confirm
the other still works, and inspect both light/dark settings layouts at the preferred font size.

Diagnostic revision: `source-phrase-130`. Release is performed only by the repository's existing
GitHub semantic-release workflow (`feat:` → minor release), not manual metadata/tag/asset edits.
