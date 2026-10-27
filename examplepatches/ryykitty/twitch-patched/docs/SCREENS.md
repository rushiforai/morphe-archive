# Screen inventory

Stable baseline: Twitch 31.7.0, ARM64. Experimental target: 31.8.0_BETA. Names in the anchor column identify code or resources, not additional user-facing layouts.

## Playback

| Surface | Variant | Anchors |
| --- | --- | --- |
| Native live player | Portrait Classic Split | Legacy theatre controller, `bottom_player_overlay_controls`, `bottom_player_control_overlay_widget` |
| Native live player | Landscape fullscreen, chat shown or hidden | Native theatre controls, `fullscreen_layout`, metadata action model, `follow_subscribe_button_view` |
| Native vertical player | Vertical theatre | `VerticalTheatreFragment`, vertical player view model |
| React Native live player | Classic Split; channel details expanded or collapsed | `PlayerControlsOverlay`, `ChannelMetadata`, `SupportActionRow`, `ClassicExtensionsIcon` |
| React Native live player | V2 Vertical View | `SkylineControlsOverlay`, `SkylineSupportActionRow`, `SkylineBandActions`, `SkylineSheetActions` |
| React Native live player | Vertical chat overlay | `SkylineChatBand`, `ChatComposerBar`, `OverlayActionButtons` |
| Playback controls | Clip, cast, share, support actions | Native control views; `TheatreClipButton`, `TheatreClipButtonImpl` |
| VOD player | Video playback and chat replay | Native replay presenter and message binding |
| Home | Live swipe feed | Feed player and native/React Native overlays |
| Home | Clips feed | Clip player and feed theme integration |

## Advertising

| Surface | Anchors |
| --- | --- |
| Native display ads | Display-ad response parser; Following headliner request |
| Feed cards | `requestInFeedAd`, `useFeedAdCoordinator`, `FeedAdItem` |
| Home headliner | `requestHeadlinerAd`, `useHeadlinerAd` |
| Player display ads | `StreamDisplayAdSurface` |
| Vertical banner, 31.8 | `useSkylineBannerSlot`, `SkylineBannerAd` |

## Chat

| Surface | Variants |
| --- | --- |
| Live chat | Native list; V2 Classic Split; Vertical View overlay |
| Replay chat | VOD replay, seek and message rebinding |
| Chat composer | Native composer; `ChatComposerBar` |
| Emote picker | Twitch catalogues, history, BTTV, FFZ and 7TV provider tabs |
| Emote preview | Native preview; V2 sheet |
| Deleted messages | Native formatter and spans; React Native `ChatMessageRow`, retained deletion state and tap reveal |
| Hype Trains | Native highlight events and expanded banner; vertical Compose host; React Native highlight selectors and Skyline hosts |
| Leaderboards | Native chat header and ranking container; `ChannelLeaderboardStripHost`; Skyline trophy |
| Channel actions | Classic Split action row and metadata container; vertical support row; gift and leaderboard controls |
| Channel extensions | Native extension gallery and overflow; `ClassicExtensionsIcon`; `ExtensionsEntryButton` where present |

## Settings and sheets

| Surface | Anchors or variants |
| --- | --- |
| App settings | Patch settings entry; Light, Dark and System themes |
| Patch settings | Search, feature sections, Emotes submenu, UI settings |
| Player settings | Native settings; `PlaybackSettingsSheet` |
| Chat settings | Native settings; `ChatSettingsSheet` |
| Layout selection | Classic Split View; Vertical View |
| Bottom sheets | `BottomSheet` dispatcher, `NativeBottomSheet`, `RNBottomSheet` |
| UI settings | Portrait; landscape; system bars and cutout enabled or disabled |

## Cross-surface states

| Area | States |
| --- | --- |
| Player lifecycle | Initial entry, channel change, reused controls, stream end, foreground/background |
| Layout | Native/V2, split/vertical, fullscreen, rotation, picture-in-picture |
| Controls | Visible/hidden, enabled/disabled, open settings sheet |
| Chat | Live/replay, High/Medium/Low/Hidden, provider enabled/disabled, emote preview, deleted-message visibility |
| Presentation | Light/Dark/System, cutout insets, status/navigation bars, delayed legacy and controller bar requests |
