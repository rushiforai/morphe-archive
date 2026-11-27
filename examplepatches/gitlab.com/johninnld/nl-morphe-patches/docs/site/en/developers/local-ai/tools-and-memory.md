# Tools, extraction and private memory

These capabilities are optional. Negotiate them individually; never infer availability from the protocol version alone. Your app remains responsible for confirmation and every action taken from a result.

## Grounding and direct lookup

The user enables Search tools in Local AI and chooses a provider. The consuming app separately grants a tool policy. Installing or loading Gemma does not grant network permission to model requests.

```java
TextRequest online = TextRequest.rawMessages(messages, 512, 120000)
    .withToolPolicy(ToolPolicy.allowWebSearch());
TextRequest offline = TextRequest.rawMessages(messages, 512, 60000)
    .withToolPolicy(ToolPolicy.none());
```

`messages` is your list of `ChatMessage` objects. `auto` allows a permitted call; `required` must produce a permitted call or an explicit error. A request policy overrides the session default. Prompts and retrieved pages do not grant tool authority.

| Provider | Setup |
| --- | --- |
| DuckDuckGo | No key; Instant Answers and best-effort public web results, with explicit block/rate-limit errors |
| Brave | User-entered Brave Search API key |
| Tavily | User-entered Tavily Search API key |
| Music lookup | User-enabled MusicBrainz and Deezer metadata route, separately permitted as `music.search` |

The local model generates the grounded answer. Search providers receive the permitted query. Provider keys stay in encrypted host storage and are not returned to clients or included in prompts. Keep returned source IDs, attribution and URLs with the result.

`client.openToolSession()` offers direct lookups without requesting a Gemma load. This also serves apps using another local or cloud model. Explicitly granted tools still require the user's enabled/configured provider. Do not silently substitute providers after an error.

## Extraction and prefetch

Negotiate `supportsExtraction()` and open an `ExtractionSession`. Supply your text, entity labels and any classification tasks. The selected profile determines supported tasks; `UNSUPPORTED_TASK` never silently switches models. Results include spans with half-open UTF-16 offsets into the unchanged input. Validate them before use.

`supportsExtractionPrefetch()` adds caller-defined lookup rules and callbacks. Extraction finds a candidate name; it does not authorize a search. Your rule and explicit tool policy decide whether a lookup runs. Returned candidates are reference data, not playback or navigation commands.

## Private memory and grounded choices

Negotiate `supportsPrivateMemory()` before opening a memory session. Each app has its own encrypted UID-owned space. Store facts explicitly under your app's consent policy; the host does not automatically turn conversations into permanent memory. Let users view and delete what your integration stores.

From **Local Model Host v0.1.143**, each admitted client can register its memory schema on first use without a separate memory toggle. New entries are kept until deleted by default. Existing retention settings carry forward. The owner can restrict all Host features in **App access**. Handle `CLIENT_ACCESS_DENIED` by pointing to that setting and reconnecting after access is restored. [DriveDeck integration contract](https://gitlab.com/johninnld/local-model-host/-/releases/v0.1.143/downloads/DriveDeck-Local-AI-Final-State-Compliance.md).

Pass retrieved memory, app-owned results and tool candidates as bounded reference data. Require the model to answer with a supplied ID and validate that ID in the app. Never execute a hallucinated ID, raw model command or instruction embedded in a retrieved page.

Close sessions and release conversation holds when done. User Stop, ownership, expiry, cancellation and memory pressure remain enforced for all these routes.

[Companion API contracts and source](https://gitlab.com/johninnld/local-model-host) · [First request](quickstart.md)
