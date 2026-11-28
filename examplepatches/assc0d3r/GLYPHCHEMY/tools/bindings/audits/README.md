# Binding audits

Historical inputs for `tools/bindings/BindingAudit.java`, kept so a later port does not have to
rediscover the same obfuscated members. Nothing in this directory is compiled or shipped: the audit
tool parses the `val` declarations that build a `Gboard…Target(…)` out of a file and resolves each one
against an APK, and `tools/bindings/MethodDump.java` prints the members those declarations came from.

## Apply evidence

`morphe-cli` reports success for a patch it never ran. If the APK in front of it is not in the
patch's declared targets, the run prints

```
INFO: Skipping "English QWERTY Flick Case": incompatible with com.google.android.inputmethod.latin 18.8.0.1022711984-beta-arm64-v8a
INFO: Applying 0 patches...
INFO: Saved to …/out.apk
```

and **exits 0**, with a rebuilt APK at the output path. A port whose release gate was never added
therefore looks exactly like a port that applied: same exit status, same output file. Checking the
output APK's existence, or running `morphe-cli … && echo verified`, proves nothing.

Only this line shows the patch executed:

```
INFO: Applied: <patch name>
```

So an apply is checked, never assumed:

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java" \
    ./tools/apply-patch.sh <input.apk> <output.apk> "English QWERTY Flick Case"
```

`tools/apply-patch.sh` runs morphe-cli, keeps the log next to the output, and fails unless
`INFO: Applied:` names every patch it was handed — through `tools/check-apply-evidence.sh`, which
names the reason when it does not (incompatible, failed, or never ran). Matching is exact on purpose:
`Swipe Down` must not be satisfied by `Applied: Swipe Down to Dismiss Keyboard`, and several patch
names in this bundle are prefixes of others.

A patch can also apply and still not finish the run: an unrelated patch failing afterwards aborts
it, and the output APK is then incomplete. `apply-patch.sh` reports that case separately — "applied"
for the named patches, then a non-zero exit for the run. `EXTRA_MORPHE_ARGS=--continue-on-error`
lets a run survive such a failure when only the applied patch is being inspected, but the exit status
still has to be read.

## `frosted-and-flag-store-18.8.0.kt`

The thirteen targets Frosted Glass and the shared flag family need on
**18.8.0.1022711984-beta-arm64-v8a**, sha256
`d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b`.

Ten of them are the values used by `GboardFrostedGlassTargets.kt`. The three `flag*` entries are recorded
here because no 18.8 bindings projection exists yet: the flag composer reasons about the store by
shape, and its 18.8 contract lives in `GboardFlagFamilyComposer.kt`.

### How the values were derived

1. Ran the audit with the committed 18.6.3 values against the 18.8 APK: **0 of 12 resolved**. The
   classes still exist but nothing on them matches — `Lpbk;` is a `Runnable` on 18.8 and `Lodo;` is a
   function wrapper — so every member was re-located by shape instead of by name.
2. Method shapes, with `DexQuery <apk> sig V '<params>'` and `DexQuery <apk> paramsig '<params>'`:
   - `onConfigureWindow(Window;ZZ)V`, `onWindowShown()V` and `onWindowHidden()V` all sit on the one
     `InputMethodService` subclass → `Lafae;`.
   - `(I I Lj$/util/OptionalInt; Lj$/util/OptionalInt; Z)V` had a single hit → `Lajle;-><init>`.
   - `(Window;Lajle;)V` had a single hit → `Lajlf;->g`.
   - the five model fields were read straight off `Lajle;`: `a:I`, `b:I`, `c:OptionalInt`,
     `d:OptionalInt`, `e:Z`, the same names, types and order as the 18.6.3 projection, all
     `public final` (`0x11`) and none static.
3. Flag store: indexed the APK (`DexQuery <apk> index`) for the class carrying the flag triangle —
   `String` name, `Object` value behind a holder, `[Object` keys, `[Z` defaults, `Map` parameters —
   which is `Ladfs;`, whose `f` field has type `Ladgf;`. A `MethodDump` run on `Ladfs;->g()Ljava/lang/Object;`
   confirmed the shape the composer's predicate requires: `iget-object v0, v2, Ladfs;->f:Ladgf;`, then
   `iget-object v2, v0, Ladgf;->a:Object`, then `return-object v2` — the holder lands in `v0` (register 0
   = `FLAG_NAME_SCRATCH_REGISTER`), the result in `p0` (register 1 = `RECEIVER_SCRATCH_REGISTER`). Those
   three names are exactly the `18.8.0` row of `GBOARD_FLAG_STOCK_CONTRACTS`.
4. Re-ran the audit against the file in this directory: **13 of 13 resolved** (6 methods, 7 fields).

### Re-checking

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/BindingAudit.java \
    tools/bindings/audits/frosted-and-flag-store-18.8.0.kt \
    "dist/com.google.android.inputmethod.latin_18.8.0.1022711984-beta-arm64-v8a-176124766_minAPI26(arm64-v8a)(nodpi)_apkmirror.com.apk"
```

Expect `resolved: 13` and `unresolved: 0`. The APK itself is not in the repo, so match it by version
and, when you have the same download, by the sha256 above.

### Looking at a shape

Everything above can be re-derived with the two tools in `tools/bindings/`, without a scratch script.
`MethodDump` lists a class's fields and methods with their descriptors and access flags, or one
method's instructions and register count:

```bash
# The audited flag getter: registers=3, holder into v0, value into v2, a single return-object.
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/MethodDump.java <apk> 'Ladfs;' g

# The navigation model: five fields, all access=0x11 (public final, non-static), plus the constructor
# and the (Window, model) applier that takes it.
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/MethodDump.java <apk> 'Lajle;'
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/MethodDump.java <apk> 'Lajlf;'
```

Dropping the method name is how a member is found again after a rename: list the class, compare
parameter descriptors and register counts, then dump the candidate.

### Status and limits

- **Frosted Glass** was not only resolved: it was applied to this APK for real, and the patch's own
  assertions held — `onConfigureWindow` expanded from 11 to 17 registers, exactly one
  `Window.setLayout` survived, all five model fields are final and non-static, and the nav-bar
  entry/exit and lifecycle delegates landed. Nothing has run on a device, so blur and nav-bar styling
  are still unverified, which is why 18.8 is offered as an experimental target only.
- **Flag store** is resolved and shape-checked only. It was exercised once through a temporary 18.8
  projection that is not in the tree.
- If a later 18.8 build changes these shapes the audit fails loudly: re-derive rather than guess.

## `pointer-owner-18.8.0.kt`

The seven members the pointer-owner family rewrites on **18.8.0.1022711984-beta-arm64-v8a** (the same
APK, and the same sha256, as the section above). They are the `18.8` row of
`GboardPointerTargets.kt`.

### How the values were derived

1. The 18.6.3 owner, `Lqck;->B(SoftKeyView;FFJI)V`, has no counterpart by name: `Lqck;` is not in the
   18.8 APK at all. The owner was found by shape instead — `(SoftKeyView;FFJI)V` has a single hit,
   `Lagyw;->D`, with `access=0x10` (final) and 21 registers, the register contract
   `GboardPointerOwnerRegisterContract` states for stock.
2. `MethodDump <apk> 'Lagyw;' D` shows the finish → pre-reset adjacency the stock gate requires:
   instruction 6 is `t(JI)V`, instruction 7 is `ad()V`, each appearing exactly once, with one
   `return-void` in the method.
3. The four anchors follow from their uses:
   - `t(JI)V`, `access=0x11`, 18 registers, exactly one `invoke-interface/range {v0 .. v13}` to
     `Lagyx;->f` → finish.
   - `u(J)V`, `access=0x11`, 4 registers, with the same iget / if-eqz / `a(J)V` / `Z()` / const /
     iput / iput / return sequence the 18.6.3 cancel has → cancel.
   - `E()V`, `access=0x11`, 3 registers, calls `u(0L)` then `ad()` then returns → reset.
   - `ad()V`, `access=0x12` (private final), 8 registers → pre-reset.
4. The dispatcher the finish calls is `Lagyx;` (`flags=0x601`, an interface), and the update-target
   method is `Lagyw;->H(MotionEvent;I)V` with 11 registers. `Lagyw;` also declares an `H` *field*, so
   the two are told apart by the method descriptor, not by the name alone.
5. Re-ran the audit against the file in this directory: **7 of 7 resolved**.

### Re-checking

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/BindingAudit.java \
    tools/bindings/audits/pointer-owner-18.8.0.kt \
    "<the 18.8 APK>"
```

Expect `resolved: 7` and `unresolved: 0`.

### Status and limits

- **Resolved and applied** through Swipe Left to Delete, the one pointer feature whose public patch
  is a single unit; see that patch's commit for the run.
- The other pointer features still resolve 18.6.3 descriptors for their own units, so this table is
  what they will use when their units are ported — it does not admit them on its own.

## `symbol-footer-18.8.0.kt`

The two members the Emojis, stickers & GIFs tab-order port needs on
**18.8.0.1022711984-beta-arm64-v8a**, sha256
`d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b`. They are the `18.8.0` row of
`GboardSymbolFooterTargets.kt`.

### How the values were derived

1. Not by name, and not from the 18.6.3 descriptor: `Lgva;->a(EditorInfo;Z)Lwhe;` is not in the 18.8
   APK. The method was found from the structure the patch asserts, scanned over every class:
   - exactly one `RETURN_OBJECT`, and it is the tail of `collect` -> `move-result-object` ->
     `check-cast` -> `return-object` in one register;
   - exactly two `Lj$/util/stream/Stream;->collect(Lj$/util/stream/Collector;)Ljava/lang/Object;` calls;
   - exactly one `invoke-direct` to an `<init>` whose first parameter is the method's own class - the
     receiver wrapper the method constructs with `(self, EditorInfo, boolean)`.

   Two methods matched that predicate. The `(EditorInfo;Z)` prototype picks out
   `Lnxt;->a(Landroid/view/inputmethod/EditorInfo;Z)Lauaz;`, with 14 registers - the same stock
   register count as 18.6.3 - and `return-object v11`, the register the delegate edits.
2. `MethodDump` on it shows the same body with every reference renamed: `iget-object v0, v11,
   Lnxt;->c:Landroid/content/Context;`, the corpus list cast to `Lauaz;` after the second collect, and
   `new-instance v1  Lnxp;` / `invoke-direct {v1, v11, v12, v13}  Lnxp;-><init>(Lnxt;EditorInfo;Z)V`
   before the final `map`.
3. The stock body's structural fingerprint is
   `1489b9465696f3e789c5628ec24a93fd113b7ab177f77ac7b947f497d95fd445`, the `stock` entry of
   `GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_8`. It was computed with the algorithm in
   `GboardStructuralFingerprint.kt`; the same tool reproduces the committed 18.6.3 `composed`
   fingerprint `4f9029e9b07e...` from a patched 18.6.3 APK, which is what makes the 18.8 value
   trustworthy rather than a guess.
4. Re-ran the audit against the file in this directory: **2 of 2 resolved**.

### Re-checking

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/BindingAudit.java     tools/bindings/audits/symbol-footer-18.8.0.kt     "<the 18.8 APK>"
```

Expect `resolved: 2` and `unresolved: 0`. `MethodDump <apk> 'Lnxt;' a` reprints the body the
fingerprint covers.

### Status and limits

- **Resolved and applied** through the public Emojis, stickers & GIFs Tab Order patch; see that
  commit for the run.
- Custom Symbols is not offered on 18.8, so only the `stock` and `tabOnly` states exist for this
  release; the classifier has no `customOnly` or `composed` fingerprint to match there and fails
  loudly instead of guessing.
- The footer reorder itself has not been checked on a device: the claim is that the patch applies
  and its own gates hold, not that the tab order looks right.

## `settings-homepage-18.8.0.kt`

The one member the settings homepage override hooks on **18.8.0.1022711984-beta-arm64-v8a** (same
APK and sha256 as the sections above). It is the `18.8.0` row of `GboardSettingsHomepageTargets.kt`.

### How the value was derived

`SettingsActivity` is a manifest class, so it keeps its name across releases and the 18.6.3
descriptor resolves unchanged. Running `BindingAudit` over the 18.8 APK resolves the method itself,
and `MethodDump <apk> 'Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;'
onCreate` shows the same body the patch's stock gate asserts:

- seven registers, the receiver at v5;
- `invoke-virtual {v5} ...->getIntent()Landroid/content/Intent;` as instruction 0;
- exactly one `invoke-super {v5, v6} ...->onCreate(Landroid/os/Bundle;)V`;
- exactly one `return-void`, and it is the last instruction.

The one difference is the declaration: 18.6.3 compiles it `protected final` (`0x14`) and 18.8.0
compiles it `public final` (`0x11`). `BindingAudit` does not compare access flags, so the patch's own
gate is what pins it: `SettingsHomepageTargets` carries the expected flags per release and selects
the table whose flags the APK actually declares.

### Re-checking

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/BindingAudit.java     tools/bindings/audits/settings-homepage-18.8.0.kt     "<the 18.8 APK>"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/MethodDump.java "<the 18.8 APK>"     'Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;' onCreate | head -3
```

Expect `resolved: 1`, `unresolved: 0`, and `registers=7 access=0x11` on the dump.

### Status and limits

- **Resolved and applied** through the public Settings Homepage Override patch; see that commit for
  the run.
- Nothing was run on a device, so switching between the new and legacy settings pages is unverified.

## `long-press-gesture-18.8.0.kt`

The gesture dispatch boundary and the input-event entry the Long-Press Editing Shortcuts port needs
on **18.8.0.1022711984-beta-arm64-v8a** (same APK and sha256 as the sections above). The first three
are the `18.8.0` row of `GboardGestureTargets.kt`; the input-event method is the row that patch
already carried.

### How the values were derived

1. 18.6.3's boundary is `Lqch;->f(...)V`, a three-instruction forward that reads its own stock
   delegate (`Lqch;->n:Lqcf;`) and calls `Lqcf;->h(...)`. On 18.8.0 that shape is gone from the old
   names: `Lqch;` does not exist, and the dispatcher became an interface — `Lagyx;` (`0x601`) with
   `f(Lagyw;Lagkl;Lagmb;SoftKeyDef;JZZIZJI)V`, which the view holds in `Lagyw;->s:Lagyx;`.
2. The boundary moved to the interface's sole implementor: `Lagyn;` is the only class listing
   `Lagyx;` in its interfaces, and its `f` is still exactly three instructions (14 registers):
   `iget-object v0, v0, Lagyn;->n:Lagyl;`, `invoke-interface/range {v0 .. v13}, Lagyl;->h(...)`,
   `return-void`. The stock dispatch is the `Lagyl;` interface's `h` with the same prototype.
3. The prototype renamed its first three parameters (`Lqck;` -> `Lagyw;`, `Lpuc;` -> `Lagkl;`,
   `Lpva;` -> `Lagmb;`) but still costs thirteen parameter words, so the composer's register layout
   and helper bodies carry over unchanged.
4. `Lafae;->ay(Ladan;)Z` is the input-event dispatcher, 28 registers - receiver at v26, event at v27 -
   which is what the input-event patch's register layout derives from its one-parameter prototype.
5. Re-ran the audit against the file in this directory: **4 of 4 resolved**.

### Re-checking

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/BindingAudit.java     tools/bindings/audits/long-press-gesture-18.8.0.kt     "<the 18.8 APK>"
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/MethodDump.java "<the 18.8 APK>" 'Lagyn;' f
"$JAVA" -cp libs/morphe-cli.jar tools/bindings/MethodDump.java "<the 18.8 APK>" 'Lafae;' ay | head -2
```

Expect `resolved: 4`, `unresolved: 0`, the three-instruction forward on `Lagyn;->f`, and
`registers=28` on `Lafae;->ay`.

### Status and limits

- **Resolved and applied** through the public Long-Press Editing Shortcuts patch, together with its
  soft-key, pointer and input-event units; see that commit for the run.
- Top Row Swipe and the Zhuyin toggle share this composer and now read the same table, but their
  other units have no 18.8 bindings yet, so their public patches stay 18.6.3-only.
- Nothing was run on a device: the globe-drag shortcut itself is unverified.

## Proposing replacements

`tools/bindings/ProposeRetarget.java` turns this audit's reasons into ranked candidates for the next
release, so a port starts from a shortlist instead of a fresh search. It re-derives every
unresolved target by shape, reports the class hypotheses and successor classes it relied on, and
`--emit-audit` writes the accepted proposals back in the format above so `BindingAudit` can re-check them.
