# Feature flags

The `Feature flags` patch exposes TikTok's AB flags in the Tweaks screen: every flag the app has
read is listed with its type and value, and any of them can be overridden from a dialog. The patch
is **off by default**; with no override set, every getter returns the app's own value.

Version scope: 47.9.1, 47.9.2, 47.9.3, 48.0.1 and 48.0.2.

## Where the values come from

TikTok reads its flags through one class with a getter per type. The class name and the method
names change every build, so the patch finds it by shape: the one class that carries all six typed
getters together.

| Type | Getter shape | Key position |
|---|---|---|
| boolean | `(int, String, boolean, boolean) -> boolean` | `p1` |
| int | `(int, int, String, boolean) -> int` | `p2` |
| long | `(int, long, String, boolean) -> long` | `p3` |
| float | `(int, String, boolean, float) -> float` | `p1` |
| double | `(double, int, String, boolean) -> double` | `p3` |
| string | `(int, String, String, boolean) -> String` | `p2` |

The six typed getters only *name* the class. Every other getter in it is hooked too, whatever its
shape: a string key without an int, an extra boolean, and values returned as a parsed `Object`. On
the checked builds that adds, among others:

| Shape | Helper |
|---|---|
| `(String, boolean, boolean) -> boolean` | boolean |
| `(String, int, boolean) -> int` | int |
| `(int, String, boolean) -> Object` | object |
| `(String, boolean) -> Object` | object |
| `(String, boolean, boolean, Class, int) -> Object` | object |
| `(String, boolean, Class, Object) -> Object` | object |
| `(Class, Object, String, boolean) -> Object` | object |

A method that takes a stored value before the key is a setter returning the previous value, and is
left alone. The rule needs the key to be the only `String` parameter, except for the two shapes
written out by hand: a default value before the key, and a key followed by a default string.

Both AB classes on 48.0.2 are covered (`X.09mi` and `ls4.m`), and the second one carries more
shapes than the first.

Each getter is hooked at its `return`, not at its entry: the app's own answer is already in a
register there, so the helper either replaces it with the override or returns it unchanged. Nothing
is recomputed and no early-return branch is added.

The key register is computed from the parameter widths, so a `long` or `double` before the key is
counted as two registers. When the key or the value sits above `v15`, a four-bit invoke cannot name
it, so both are copied into low scratch registers first. The `String` getter on the checked builds
is exactly that case: its key is `v18` on 48.0.2.

## Storage

Overrides and the recorded list live in the same shared preferences file as every other switch
(`tiktokHandle_prefs`), not in a file on the device:

| Key | Content |
|---|---|
| `flag_overrides` | JSON object, flag key to override text |
| `flag_seen` | JSON object, flag key to `<type>|<last value the app returned>` |

Reading is cached in memory. A getter call is a map update, never a disk read. The seen list grows
to thousands of keys (5090 after a day of use), so writing it is a background job: the map is copied
and serialised on one daemon thread, at most every 15 seconds, and only when something changed.

## The screen

Misc → **Feature flags**:

- search field, then type chips: All, Boolean, Whole, Decimal, Text;
- the list opens with the overridden flags first, then by key;
- 40 rows per pull, more as the page is scrolled, with a footer that says how many are shown;
- tapping a row opens the editor for that flag;
- **Reset all overrides** appears only while an override exists.

The editor follows the flag's type:

| Type | Input |
|---|---|
| boolean | a switch |
| int / long | a number field, signed |
| float / double | a number field with the decimal key |
| string | a text field |

An empty number or text field clears the override. A boolean has no empty state, so its override is
cleared through Reset. The dialog shows the full key, wrapped onto as many lines as it needs, and
the app's own value under it.

The list is filled after the page transition finishes, not during it, and the rows are built a few
per frame, so neither the parallax nor the scroll drops frames.

## What takes effect when

- The override map is read on every getter call, so a flag the app asks for repeatedly changes
  without a restart.
- A flag read once at startup only changes after a restart.
- A flag the app re-reads but caches in a field of its own keeps the cached copy until that code
  runs again; the patch answers each getter call correctly, it cannot reach into a value the app
  already stored.

## What the list does not cover

The list is a runtime registry: it holds the flags TikTok has read in this or an earlier run. A flag
that exists in the dex but was never requested does not appear. A complete static list would need a
separate scan of every getter call site, per build.

A value returned as an `Object` that is not a boolean, number or string is listed as `object` and
cannot be overridden; it is shown so the list stays complete rather than hiding a flag.

## About

The About page reads the installed app's version name from the package manager, so it names the
build actually running rather than a hardcoded range.

Overrides are part of the settings export/import: the backup carries a `flag_overrides` object with
the same key and value pairs, and an import replaces the whole set. The recorded list is not
backed up, because it is only the registry of what the app has read.

## Diagnostics

With diagnostics on, every overridden read is logged once per key and answer:

```text
flags: b gecko_lazy_callback = true -> false
flags: i lite_mode_downgrade_gecko = 1 -> 0
```

`record` writes nothing when the value and the override have not changed, so a getter read every
frame does not flood the log.
