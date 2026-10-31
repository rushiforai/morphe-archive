# In-app patch settings for YouTube VR: the strategy

How to give a patched YouTube VR build real in-app settings — a hub of feature entries, each
opening its own screen — using nothing but the app's own UI machinery. This is the technique
behind the SponsorBlock patch's "Patch settings" hub (SPONSORBLOCK-NOTES.md Addenda 14–18, 1.88.10);
this page is the generalizable version, written so a future patch author (or agent) can reuse it
on a newer build without re-deriving it.

The result looks like this:

```
Settings (the app's own list)
  └─ "Patch settings" (row)         → hub screen, one entry per feature
       └─ "SponsorBlock" (entry)  → that feature's settings screen
```

Rows render, scroll, focus and persist exactly like the app's own, because they *are* the app's
own: its preference XMLs, its fragments, its navigation, its back stack.

## The graveyard (what does not work — all measured, not guessed)

- **A view you add is not a UI.** Views added over the settings card look like overlays, cannot
  receive the controller's scroll, and the app rebuilds the holders they live in. Only
  `VrCardView` children composite into the headset at all (see INTERNALS.md).
- **Reflection by name silently does nothing.** R8 keeps androidx's *class names* (XML inflation
  needs them) but renames its *members*: `Preference.setTitle`/`setKey`/`addPreference` are
  `L(...)`, `X(...)`, ... in the shipped dex. Build the UI from XML, never from reflected calls.
- **A nested `<PreferenceScreen>` is inert.** androidx's start-screen navigation needs the host to
  implement its start-screen callback; nothing in the app does. `android:fragment` needs the same
  callback.
- **`ARG_PREFERENCE_ROOT` is dead.** The renamed `PreferenceFragmentCompat` (`cfq` in 1.88.10)
  reads the root-key argument in `onCreate` and drops it — this build predates
  `setPreferencesFromResource`, so arguments alone can never display a nested screen.
- **A patch cannot create classes or mint resource ids** through the bytecode API (lookup and
  mutation only), and a new preferences XML's numeric id does not exist until resource
  compilation.

The way through all five: **the app already contains dead settings screens with working
navigation.** Reuse them.

## The discovery (how to find the machinery in any build)

1. **Find the settings XMLs.** The lists are `res/xml/settings_prefs.xml` (immersive) and
   `panel2_settings_prefs.xml` (panel mode); inflated one `Preference` per element. Cross-check
   `res/values/public.xml` — it maps every resource id to its name and is how mined ids are
   resolved back to files later.
2. **Find the click handler.** The list fragment (inflating those XMLs — pin the method by the
   inlined `R.xml` ids, see FINGERPRINTS.md) compares the clicked row's key against known string
   literals and, for rows that open sub-screens, calls the holder's swap:
   `aC(Preference)` → `aH(SomeFragment.class, Bundle)`.
3. **Read the swap.** The holder's swap instantiates the class reflectively (any no-arg
   constructor works), **passes the Bundle as fragment arguments**, replaces the settings
   container, and adds every non-root target to the **back stack**. Navigation, transitions and
   back behaviour are all the app's own — a patch that reuses this gets them for free.
4. **Inventory the dead surfaces.** Two kinds, both ideal hosts:
   - a screen whose *list row is removed at startup* (the click handler's branch survives, the
     row is gone — 1.88.10: `developer_settings`);
   - an *unreferenced fragment* with its own preferences XML (1.88.10: a legacy
     `android.preference.PreferenceFragment` inflating a generic preferences XML — note it is
     framework, not androidx, so it cannot itself be hosted, but its XML can be).
5. **Check for parallel stacks.** 1.88.10 ships two full settings stacks sharing the same XMLs
   (the live one and a peer-wired twin). Anything re-keying or relabelling must handle both —
   or deliberately only the live one, identified structurally (see below).

## The recipe (all edits structural — no obfuscated name is ever written down)

1. **Entry row.** Add a plain `<Preference android:key="ytvr_mod_settings" .../>` at the top of
   both main-list XMLs. A plain `Preference` (no `android:fragment`, no intent) is inert on its
   own; the click handler is what routes it.
2. **Re-key the click handlers.** Replace the `const-string` comparison literal
   (`"developer_settings"` → `"ytvr_mod_settings"`) in every `(Preference)Z` handler holding it.
   Enumerate candidates by the literal, match by shape, and mine the branch's target: the
   `const-class` that follows the literal, **validated** by requiring its class to carry a known
   literal (the sub-screen's title) — a reordered branch cannot then steer the patch wrong.
3. **Two levels from one fragment.** The sub-screen fragment re-opens *itself* with a fragment
   argument (`ytvr_screen=sb`) that switches which XML it inflates and which title it sets. Its
   `()V` setup and view-created callback are replaced wholesale — mine their pieces first
   (manager field/call, single-int inflate call, resource-id const, super call, holder field,
   set-title call, divider call), then assemble the branched bodies with smali labels.
4. **The same-class swap guard.** The app's swap skips a swap to the class already showing. Add
   a small static bridge to the holder class and replace the swap's `getClass()` call with it:
   the bridge returns the real class except when the arguments carry the mod's key, which forces
   the recreation (with the back-stack entry the app's own code adds). Scope the override to the
   mod's key so every other caller keeps exact stock behaviour.
5. **The hub entry click.** Add a `aC(Preference)` override to the sub-screen fragment: the
   entry's key re-invokes the app's swap with the argument bundle; everything else falls through
   to the app's inherited handler. The `invoke-super` must be **rebased** onto the fragment's own
   ancestor that declares the handler — the click handler's superclass is a different branch of
   the hierarchy and an invalid super target.
6. **The second XML.** Resolve the dead fragment's XML id → file name through
   `res/values/public.xml`, and replace that file's *contents* (the root element — and with it
   the resource id and inflation path — stays the app's own). No id is ever minted.
7. **Wire only the live stack.** The parallel stack gets the re-key + a relabelled title, and its
   fragment's own post-inflation wiring is skipped (see traps) — nothing more.

## The traps (each one cost real time)

- **Register counts — the one that crashes on device.** Assembling a rewritten body does *not*
  change the method's register count. If the body's scratch registers reach past
  `registers − paramWords`, they silently alias `p0`/`p1`, and ART rejects the whole class at
  first load: `VerifyError: ... instance field access on object that has non-reference type
  Conflict`, crashing exactly when the user taps. **Replace the method wholesale**
  (`ImmutableMethod` with `paramWords + locals` registers, remove + re-add) *before* assembling
  the body, and never assume the original had spare registers.
- **`PreferenceGroup.removePreference(null)` is not null-safe** in this androidx build — the
  field dereference happens before the guarded list remove. Never neutralize a removal by
  pointing it at a missing key; re-key the *click* comparison instead and let the removal stand.
- **The reused screen's own wiring will crash on a slimmed XML.** The developer-settings setup
  dereferences app-only rows (`experiment_ids`, refresh-rate, foveated rendering) without null
  checks. Skip it — a `return-void` right after the inflation call, or the wholesale rewrite;
  plain `SwitchPreference` rows need no wiring (they persist to the screens' `youtube.xml` file
  — the fragment sets its storage name to `"youtube"` — and render without listeners).
- **`classDefByStrings` (née `getAllClassesWithString`, hidden from Kotlin on patcher 2.x) returns
  raw dex class defs** — re-resolve each through the mutable class repository before touching its
  methods.
- **Don't skip reference-less instructions while mining.** A `const` has no reference; a
  `continue` before the const check silently misses exactly the instruction you are mining. Use
  first-wins guards on every mined reference so a later shape-match cannot overwrite an earlier
  one (a `(I)V` seekbar call overwrote the inflate call once).
- **Identify the live stack structurally**: of two matching click handlers, the live one is whose
  route target's title method reads a *field of the holder's type* — the twin stack's fragment
  reaches its holder through a peer lookup and has no such field.
- **Tooling**: the patcher's instruction extensions are member imports
  (`import ...InstructionExtensions.replaceInstruction`); label support comes from
  `addInstructionsWithLabels`; the `.mpp` is version-named and a hand-written CLI command pinned
  to an old file silently tests stale code; `apk/` accumulates ~116 MB per build and fails late
  with a bare `IOException: There is not enough space on the disk`.

## Verification recipe

1. **Static, before install** — both checks are cheap and have caught every break so far:
   - the compiled XMLs: scan the built APK's zip entries for the mod's keys (resource paths are
     shortened and deflate-compressed, so grepping the archive proves nothing);
   - the bytecode: dump the rewritten methods from the built APK's dexes at opcode level
     *with registers* (a ~100-line `smali-dexlib2` harness over the jars already in the Gradle
     cache — `apk/scratch/dexdump/` has one) and check receivers, branch targets and the
     register map (`p0` must be `registers − paramWords`).
2. **On device**: the class verifies only when navigated to, so launch, tap the chain, and read
   the crash buffer — `adb logcat -d -b crash` names the method, opcode offset and conflict, which
   is enough to pin a verify error without any debugger. An empty crash buffer plus a successful
   tap-through is the verdict.
