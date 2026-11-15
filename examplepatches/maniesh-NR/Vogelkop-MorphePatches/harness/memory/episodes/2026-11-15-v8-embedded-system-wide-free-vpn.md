# 2026-11-15 — v8: embedded system-wide free VPN

## Goal

Reopen the "system-level VPN with free servers" question after the user's
community evidence (opera-proxy forks prove the free SurfEasy tier can
serve a full VpnService), then build and ship v8.

## Facts established

- Free VPN transport in libopera.so registers a SurfEasy device against
  api2.sec-tunnel.com/v4 and proxies via *.sec-tunnel.com:443 — the same
  infrastructure the standalone `opera-proxy` client speaks.
- The manifest declares a complete VpnService entry under the Kape partner
  name `com.kape.vpnservicemanager.data.externals.Service` (BIND_VPN_SERVICE,
  android.net.VpnService filter, systemExempted FGS). Kape classes are NOT
  in any dex -> the name was free to squat. Unlocking Pro itself is a dead
  end (Play on-demand module + server entitlement).
- The `com.opera.android.vpn.*` trio (QS tile / app widget / receiver) DOES
  ship in classes3. `ien.l()/yen.l()` disable tile+widget components for
  free users at startup. Widget layout is res/layout/vpn_pro_widget.xml
  (container 0x7f0a08b7, status 0x7f0a08bc, location 0x7f0a08bb, hint
  0x7f0a08ba); Leif.onUpdate routes widget adds into c().
- v7-missed targets located: VPN settings "Protect more devices" = xoj egn
  branch row 7; orphan in-app-notifications header = rqd.k child #4 (no
  id in XML); Rewards settings row shown by k9's iwk branch (fl9.f).

## Built

- classes5.dex (was an empty 2 KB stub) = com.kape...Service (VpnService:
  tun 198.18.0.1 + fc00::1, routes 0/0 + ::/0, DNS 198.18.0.2, browser
  disallowed) + hev.htproxy.TProxyService + com.zai.sysvpn.VpnController.
- classes3 smali surgery: tile onClick/onStartListening, widget
  c()/b()/onEnabled, receiver onReceive (maps legacy VPN_PRO_* broadcasts)
  -> all drive VpnController.
- Manifest AXML binary edits (size-preserving): extractNativeLibs
  false->true; two labels 0x7f1413ee (vpn_pro_title) -> 0x7f141408 (vpn_title).
- Payload: lib/armeabi-v7a/liboprx.so (opera-proxy v1.15.0-fork arm,
  -socks-mode -country {EU,AS,AM} -server-selection first) +
  libhev-socks5-tunnel.so (2.20.0). Orphan child cleanup via
  pidfile + /proc cmdline check.
- v7 patch set re-derived from the spec (scripts lost in the recycle) +
  V8a/V7b2/N8/RS8 fixes. 21 patches, fail-loud, verified post-sign.

## Outcomes

- v8 universal APK shipped: sha256 cce194fe…, 154,436,314 bytes, morphe
  key, updates over v7. ALL v8 markers OK; v4+v5+v6 regression OK;
  entry-diff vs v6 = manifest + 3 dexes + 2 libs + re-sign only.
- APK uploaded to sandbox-storage; scripts/sources/docs mirrored; token
  re-imported from upload/; askpass provisioned via install.sh.

## Lessons

- Multiple smali method-body patches on one file MUST be applied
  cumulatively — planning each against the original text silently
  clobbers earlier patches (T8a was lost to T8b for two builds).
- baksmali renumbers labels on rebuild -> marker checks must be
  label-agnostic (match instruction sequences, not `:cond_N` names).
- ecj (3.2 MB jar) + android-34 platform jar is a complete javac+d8
  replacement on a JRE-only sandbox (Maven Central was rate-limited;
  Aliyun mirror + dl.google.com worked).
