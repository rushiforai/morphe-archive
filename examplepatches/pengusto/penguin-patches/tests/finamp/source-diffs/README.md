# Reviewed player-menu native backport

The selectable patch retains its name and bit 32. These text diffs accompany the
complete source pins in [native-sources.json](../native-sources.json).

- [Full diff against official 1.0.1 release source](player-menu-full-1.0.1.patch):
  base `65c1a78b1d04dd8525825ecdf2cf39c7442b51e9`. Includes the dependency-lock
  adjustment already used by the pinned native baseline, the complete player
  change and its 27 regression cases.
- [Update to the previous player-only backport](player-menu-review.patch):
  base `98f45b17686b1887849482d2fd9d0c20fc2477e3`.

Both apply to exactly tree `4eabc83ab4d2a2adeb2cbb4f08426afa011c8e99`, commit
[`8b4adc590944ddd177d3fdc42bf47518b3eb0c9d`](https://github.com/pengusto/finamp/commit/8b4adc590944ddd177d3fdc42bf47518b3eb0c9d).
The reviewed upstream source is
[`0092a0593a9d69dfc461834d0e4e6c580d112379`](https://github.com/pengusto/finamp/commit/0092a0593a9d69dfc461834d0e4e6c580d112379)
from [Finamp PR #1836](https://github.com/finamp-app/finamp/pull/1836).

Use an isolated checkout at the indicated base and `git apply --index DIFF`.
`git write-tree` must return the tree above. Rebuild with the toolchain and
original-APK checks in the [native verification guide](../README.md). A rebuilt
APK is not the compatibility input; Morphe still requires the pinned official
universal APK and produces ARM64-only output.

The 64 compositions containing bit 32 apply the same reviewed update. The
other 64 source entries, including the empty mask, remain unchanged. Every
composition keeps its other independently selected features and complete source.
Finamp modifications retain MPL-2.0.
