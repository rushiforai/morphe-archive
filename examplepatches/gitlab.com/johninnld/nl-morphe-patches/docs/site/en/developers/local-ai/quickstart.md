# Add a proofreading action

This tutorial adds one optional action to an Android editor. First [install and authenticate the provider](install.md). The complete `Proofreader.java` example is included in the [companion's developer documentation](https://gitlab.com/johninnld/local-model-host) and its offline documentation screen.

## Connect and negotiate

Use `ModelHostClient.connect(context, listener)` on the main thread. The listener receives `HostStatus` and `HostCapabilities` after negotiation. Before opening the action, require `status.isReady()` and `capabilities.supports("proofread")`.

Open the session on a worker:

```java
HostSession session = client.openSession(
    new SessionOptions("My editor", "en", 2048)
);
```

`client` is your connected `ModelHostClient`. Keep the session within the editor's lifetime. Synchronous Binder discovery/status/session calls belong off the UI thread; connection callbacks use the configured callback executor.

## Submit a small task

```java
RequestHandle active = session.submitText(
    TaskRequests.proofread("She dont have the order yet."),
    json -> {
        try {
            JSONObject event = new JSONObject(json);
            if (!event.optBoolean("terminal")) return;
            if ("ok".equals(event.optString("status"))) {
                showPreview(event.getString("text"));
            } else {
                showError(event.optString("code", "INFERENCE_FAILED"));
            }
        } catch (Exception invalid) {
            showError("PROTOCOL_ERROR");
        }
    }
);
```

Import the SDK classes and `org.json.JSONObject`. `showPreview` and `showError` are your app's UI functions. Dispatch UI work to the main thread if you selected another callback executor. The host supplies the proofreading instruction; your app does not need to reconstruct it.

## Preserve the user's edit

Capture the original text, selection and document revision before submission. Before showing or applying a result, check that the same editor and revision are still active. Discard stale results after typing, cursor movement or navigation. Cancellation can race with completion, so it does not replace this check.

Preview the result and use the editor's ordinary replace/undo operation. A streamed chunk is provisional. A terminal successful result contains the complete final text; do not append it to accumulated chunks.

## End the action

Call `active.cancel()` when the action becomes irrelevant. Close the session and client when their UI lifetime ends. On disconnect, invalidate pending edits and reconnect deliberately; never replay an old edit automatically into a new field.

Show separate states for connecting, missing model, loading, memory pause, user Stop, failure and Ready. Review generated changes, especially names, numbers and negation.

Next: [task recipes](tasks.md) and [speech integration](speech.md).
