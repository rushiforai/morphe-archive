# core — shared Apple Music MediaBrowser client

UI-agnostic Android library (`com.anderson.applemusic.core`) shared by `:tv-app` and the
future `:car-app`. It wraps the framework `MediaBrowser` / `MediaController` pair of the
patched Apple Music engine and holds the browse/playback domain models. No Compose UI,
no resources — only `androidx.compose.runtime` for the `@Immutable` annotations.

## What it exposes

- `MediaBrowserClient(context)` — the action surface:
  `connect()` / `disconnect()` / `reconnect()`, `subscribe(parentId)` (children are
  cached and replayed), `play(mediaId)` (`playFromMediaId`), `togglePlayPause()`,
  `skipNext()`, `skipPrevious()`, `seekTo(positionMs)`, `refreshPlayback()` and
  `sendCustomAction(actionId)`.
  `MediaBrowserClient.Listener` is the callback contract: `onConnected()`,
  `onDisconnected(message)`, `onChildren(parentId, items)`,
  `onChildrenFailed(parentId)`, `onPlayback(snapshot)`.
  `MediaBrowserClient.AUTO_ROOT` is the Android Auto tab root (`__AUTO_ROOT__`) and
  `isAppleMusicInstalled(context)` checks the engine package.
- `BrowseItem` — one entry of the browse tree (id, title, subtitle, browsable,
  playable, artwork URI).
- `Section` — a shelf of a tab root (or the synthetic "play" shortcut shelf) with its
  `items`, `loading` and `direct` flags.
- `PlaybackSnapshot` — `hasSession`, `playing`, `positionMs`, `durationMs`, `title`,
  `artist`, `album`, `artwork: Bitmap?` and `customActions`.
- `CustomAction` — `PlaybackState.getCustomActions()` mapped to `action`, `title`,
  `iconResId` and `extras` (flattened to `Map<String, String>` so the snapshot stays
  immutable and comparable). The engine publishes
  `com.apple.android.music.playback.action.FAVORITE`, `SHUFFLE`, `REPEAT`,
  `ACTION_ENABLE_CONTINUOUS_PLAYBACK`, `ADD_TO_LIBRARY` and `CREATE_STATION`
  ("Favorito", "Aleatório", "Repetir", "Reprodução Automática",
  "Adicionar à Biblioteca", "Criar Estação"). The icon is the drawable resource id in
  the engine's package; the list changes with the track, so it comes in every
  `PlaybackSnapshot`.

## Consuming it from an app

```kotlin
implementation(project(":core"))
```

Core only uses framework APIs, so the app keeps the engine access: declare
`android:sharedUserId="com.apple.android"`, the `<queries>` for
`com.apple.android.music` (package + `android.media.browse.MediaBrowserService` intent)
and sign the APK with the Morphe certificate — otherwise the media service refuses the
connection (see `tv-app/README.md`).

## Stability

`Section`, `PlaybackSnapshot` and `CustomAction` carry `@Immutable` and only expose
values that are replaced, never mutated, so consumers keep skippable composables: the
`:tv-app` Compose report still lists `stable section: Section`.
