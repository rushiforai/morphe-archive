# Patch 03b — Smali: force `Lwdn;->a()Z` to always return false

## File

`smali_classes3/wdn.smali`

## Goal

`Lwdn;` is the VPN Pro feature-state holder. Its method `a()Z` is the
"**is VPN Pro supported on this device/account/region?**" gate. It returns
`true` only if all of these hold:

* field `a` is true (a bitfield flag from remote config `tfn`, bit 0)
* field `b` is true (from `Ljtg;->b()Z`, server-side config)
* field `c` is false (kill-switch `vpn_pro.kill_switch.on` is OFF)

We force `a()Z` to always return `false`. Every caller then sees "VPN Pro
not supported" and short-circuits its UI:

| Caller | Effect of `a()Z == false` |
| --- | --- |
| `ggn` (menu state computer) | VPN Pro menu banner state never selected |
| `nlk` | VPN Pro entry suppressed |
| `yvg` | VPN Pro dialog suppressed |
| `yi2` | VPN Pro upsell suppressed |
| `hlk` (debug logger) | Logs "VpnPro: not supported" — harmless |
| `ydn` (VPN manager internal) | Internal state only; no UI |

## Patch — replace the body of `Lwdn;->a()Z`

### Original (lines ~110-130 of `wdn.smali`)

```smali
.method public final a()Z
    .locals 1

    iget-boolean v0, p0, Lwdn;->a:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lwdn;->b:Z

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Lwdn;->c:Z

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
```

### Patched (replace the entire method body)

```smali
.method public final a()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
```

## Anchoring notes

* The method signature `public final a()Z` on class `Lwdn;` is stable
  across builds because it is invoked by name from 6 caller classes.
* Field reads (`iget-boolean` on `a`, `b`, `c`) are no longer performed,
  which is fine — those fields are still initialized by the constructor
  (`<init>(Lydn;)V`); they are simply never consulted.
* No labels (`:cond_0`) are referenced from outside the method.

## Risk

* If Opera ever wires a **non-VPN-Pro** feature through `Lwdn;->a()Z`, this
  patch would disable that too. Verified against 104.0.5262.91143: `wdn` is
  constructed only inside `vy`, `x53`, `ydn` (all VPN-Pro-related); all 6
  callers of `a()Z` are VPN-Pro-related code. Safe.
* The constructor `<init>(Lydn;)V` still runs and reads prefs — this is
  harmless; we just don't use its result.
