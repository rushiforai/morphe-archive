# v1.3.1-R2 — hybrid smali pipeline + corrected patch designs (2026-11-11)

The S-rung convicted 02a (semantic hang) and 03a (manifest crash) and proved
02b/02c/03b innocent-but-inert. R2 redesigns the guilty patches and adds the
correct gates for the dialogs the user actually wants gone.

## The hybrid pipeline

apktool full rebuilds (D-rung) died at install-time parsing because of
resource/manifest re-encoding. The hybrid avoids that completely:

1. Wrap the single target dex (`classes3.dex`) in a minimal zip, decode with
   `apktool d --no-res` (dex named `classes.dex` inside the wrapper).
2. Edit the smali (patches in `patches/`).
3. `apktool b` → harvest the rebuilt dex.
4. `scripts/splice_entry.py` — replace `classes3.dex` in the C1 substrate,
   byte-preserving every other entry (same discipline as the binary patcher's
   zip rewrite).
5. Run `scripts/v131_binary_patch.py --only 02b,02c,03b,03c` on the spliced
   apk — applies the three proven-innocent dex patches (anchors verified to
   hold on the rebuilt dex) + the arsc blanking, re-checksums all dexes, and
   runs the structural gate over every method of every dex (which validates
   the smali rebuild as a side effect).
6. zipalign + apksigner v1+v2+v3 (proven signing path).

Reproduction commands (from `work/` after tool provisioning):

```bash
python3 -c "import zipfile; z=zipfile.ZipFile('wbuild/dexwrap/c3.zip','w'); z.write('beta_dex/classes3.dex','classes.dex')"
java -jar tools/apktool.jar d --no-res -f -o wbuild/smali3 wbuild/dexwrap/c3.zip
#   → edit smali3/smali/{WelcomeActivity,cfn,nt8}.smali per patches/
java -jar tools/apktool.jar b wbuild/smali3 -o wbuild/rebuilt3.apk
unzip -o wbuild/rebuilt3.apk classes.dex -d wbuild/rd && mv wbuild/rd/classes.dex wbuild/new_classes3.dex
bash Vogelkop-MorphePatches/scripts/build_w_rung.sh
```

## Patch designs

### 02a' — T&C auto-accept (`WelcomeActivity.smali`)

- Site 1 (`onCreate`, eula read → `if-eqz v4, :cond_7`): read replaced with
  `const/4 v4, 0x1` → the "accepted" branch runs (`m9k.S()`), the EULA leaf
  (`rml`/`qfl(19)`) is never added. Same edit as S1 (device-proven safe).
- Site 2 (`onCreate` tail, `:cond_9` = fresh install + not accepted): the
  `N().e.r(new k0o(j0o.a, false, q0n(14), 2))` posting is replaced with
  `invoke-virtual {v0}, WelcomeActivity;->X()V`.
- `X()` is the T&C "Next" handler: `mdf.a(kl0.j, gl0.c)` →
  `SettingsManager.V(1, "eula_accepted.gdpr")` → `h().b(...)` → `m9k.S()` →
  `W()`. Calling it puts the app in exactly the state a real button press
  creates. Sites 3/4 (`onStop`, `startActivityForResult`) need no patch: the
  pref is genuinely written by then.

### 02d — DEFAULT_BROWSER step (`cfn.smali` case 0x8)

`canOfferDefaultBrowser` → head-inserted `const/4 v0,0; Boolean.valueOf;
return`. The original body remains as dead code (labels stay resolvable).
Byte-selector 0x8 is constructed only in `q0o.g()` (verified by scanning all
cfn construction sites), so the kill is scoped to the onboarding flow.

### 02e — CMP_INTRO + CONSENT steps (`cfn.smali` cases 0xc, 0xd)

`isCmpIntroductionDue` and `e0o.shouldShow` (the "Help us make Opera better"
CONSENT screen gate) → forced false, same technique. Unasked Usercentrics
consent = all services denied, satisfying "no data collection allowed".

The step machine (`q0o.g()`, `m0o` enum) for reference:
FEATURES_ONBOARDING[DEFAULT_BROWSER, NOTIFICATIONS, CMP_INTRO] (screen g0o,
returns null when no children due → auto-skip), CONSENT (e0o), PERSONALIZATION
(i0o — kept). The `lrk` screen lambdas for these three nodes are also
exclusively constructed in `q0o.g()`.

### 03d — omnibox feature suggestions (`nt8.smali`)

`nt8` is an enum with exactly two entries: ESIM and VPN_PRO
(`ofa://ui/upgrade?source=feature_suggestion` — the VPN Pro "button + dialog"
the user still saw in S3–S6; its title string was the one 03c blanked in S3).
The `<clinit>` now builds a zero-length values array. Safety: no
`nt8.valueOf`/`nt8.values` callers exist in any dex (verified across all 10);
the iteration sites guard `isEmpty()`.

### Dropped

- **03a** (manifest component cut) — convicted by S2. VPN Pro system surfaces
  (QS tile, widget, boot receiver) stay declared; they are invisible unless
  the user adds them manually. Revisit only with an `android:enabled="false"`
  variant if the user reports the tile/widget as a problem.
- Old 02a read-bypass sites 3/4 — superseded by the real write.

### Kept unchanged (device-proven innocent)

02b (r65.l → false, standalone CMP re-prompt), 02c (mm6.e → false, startpage
default-browser re-prompt), 03b (wdn.a → false, VPN Pro feature gate),
03c (extended to 12 names).
