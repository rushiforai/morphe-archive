# Optional AI captions flyout entry

## Behavior

Settings → Morphe → AI caption translator → **AI captions toggle in regular video menu** and
**AI captions toggle in Shorts menu**, adjacent below the AI engine switch.
Both are independently persisted and enabled by default to preserve existing behavior.
Regular controls portrait/fullscreen ordinary videos; Shorts controls Shorts, even when
Morphe also reports the top-menu signal. Neither is dependent on the AI engine setting.
A disabled entry is absent on the next menu opening.
It does not change the engine, language memory, native captions, cached translations,
or API settings. The engine remains controllable from the settings page.

When enabled, the same official inflater, icon, localized On/Off label, insertion index,
shared divider, click action and spacing are retained. When disabled, the addon returns
the unchanged official insertion index before adding views or touching container spacing.
It clears transient Shorts menu evidence rather than carrying it through a hidden invocation.
Other Morphe rows and their divider remain controlled by Morphe, not this switch.

## Official precedent reviewed

- MorpheApp/morphe-patches, main commit `6d6654327095f9d358b35e3ca99d285accc5ab69`:
  `extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/utils/FlyoutUtils.java`.
  `addFlyoutElements` checks `ADS_CHANNEL_WHITELIST_FLYOUT_MENU` and
  `PLAYBACK_SPEED_CHANNEL_WHITELIST_FLYOUT_MENU` before inserting those rows;
  it adds a group divider only when the final insertion index is positive.
- The same conditional insertion contract was checked in the local official Morphe
  1.43.0 + YouTube 21.07.247 composition.

The addon already delegates row creation to the official `addFlyoutButton` through a
typed bridge, before the shared divider. No new custom popup or second-level menu is
introduced. Unlike official built-in features, this separately distributed addon keeps
its Boolean in its existing private preferences and uses `AddonSwitchPreference`;
using a host setting widget without registering its key in the host Setting registry
would be unsafe. Strings are provided in all fourteen existing locales and honor the
settings language override. The new settings are scoped to the AI patch's own settings
screen; memory-only and language-only installations gain no extra UI.

## Validation scope

Regression checks cover all four regular/Shorts visibility combinations, overlapping
Shorts/top-menu signals, cleared transient Shorts evidence, default/migrated behavior, persisted preference reconstruction,
engine/language independence, hidden insertion indices and untouched containers,
reenabling, recognized Shorts and nested menus. Existing menu layout tests continue to
check the enabled rendering contract. Framework tests and APK composition do not
constitute a real phone screenshot or live video acceptance test.

The final local JVM/Robolectric suite passes 227 tests (zero failures/errors/skips).
Localization validates 93 keys in each of fourteen locales. The generated ordinary,
icon and bold-icon Morphe settings screens contain both adjacent preferences with no
engine dependency. The final all-feature composition uses original YouTube 21.07.247
and official Morphe 1.43.0 defaults; its DEX audit checks both visibility gates and
XML-inflatable preference constructors as well as the existing menu/ownership bridges.
No real-phone menu screenshot or video playback was performed for this UI change.
The caption-engine diagnostic revision stays source-phrase-126: caption ownership,
translation scheduling, paid-API policy and native switching are not modified.
