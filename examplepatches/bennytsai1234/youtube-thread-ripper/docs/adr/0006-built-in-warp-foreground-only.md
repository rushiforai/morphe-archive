# Built-in WARP, only for YouTube and only in the foreground

2026-10-09, `640baed`. At peak hours (evenings) the home connection to YouTube (TBC's Google cache) drops to a few hundred KB/s while Cloudflare WARP stays fast. The maintainer does not want WARP on all the time (it disturbs other apps), so the patch routes YouTube, and only YouTube, through WARP while it is in the foreground and back to the normal connection in the background, where it usually only plays audio. It ships off by default. Mechanics: `docs/warp.md`.

## Considered Options

- Control the 1.1.1.1 app: not possible. Its Tasker receiver (`TaskerSettingsReceiver`, `FIRE_SETTING`) is `exported=false` (the broadcast history shows "Permission Denial ... is not exported"), and the only exported activity (`SplashActivity`) only reads referral links. So WARP is built in: a VpnService with a minimal Java WireGuard client and a wgcf-style free device registration.
