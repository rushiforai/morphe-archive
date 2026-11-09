# WhatsApp MightyMich patches (English UI)

Target: `com.whatsapp` 2.26.43.75 (+ nearby 2.26.43.x experimental)

## Patches

| Name | Default | Notes |
|------|---------|--------|
| Mods settings resources | on | English strings for in-app GUI |
| Mods settings entry | on | Placeholder until Settings adapter is fingerprinted |
| Keep deleted messages | on | Best-effort revoke block |
| Unlock view-once media | on | Best-effort |
| Disable read receipts | on | Option: always vs prefs-gated |
| Hide typing indicator | off | Composing send no-op |
| Disable telemetry | on | WAM / analytics no-op |
| Change app icon | off | classic / premium_dark / premium_gold / premium_purple / business |

## Change app icon

Morphe option **Icon style**:

- Whatsapp Red
- Whatsapp Blue
- Whatsapp Gold

Preview PNGs: `icons/icon_*.png`

After install, if the launcher cache sticks, reboot launcher or reinstall.

## In-app GUI

Strings are ready (`mightymich_mods_*`). Wiring a Settings row + dialog needs a dump of the Settings list adapter from the real APK (upload often fails to persist in this environment).

## Ban risk

Protocol-level changes can trigger bans. Prefer local UI/DB hooks; use a secondary account for testing.
