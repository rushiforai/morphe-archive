## Context

The target app bundles Timber but plants no tree in release: `Timber.<clinit>` constructs an
`empty` forest (`trees` is an empty `ArrayList`, `treeArray` an empty array) and no `Timber.plant`
call exists anywhere in the DEX. `Timber$DebugTree` and `Timber$Forest.plant(Tree)` are both
present, so a tree can be planted with no new code — the only question is where and how.

Verified in the pinned artifact (`analysis/zotero/smali/classes8/timber/log/`):

- `Timber.smali` → `<clinit>` is `.registers 2`, static, and ends with `return-void`; registers
  `v0`/`v1` are scratch (the last use of `v0` is storing the tree array, before the return).
- `Timber.smali` → `plant(Ltimber/log/Timber$Tree;)V` and
  `Timber$Forest.plant(Ltimber/log/Timber$Tree;)V` are the available entry points.
- `Timber$DebugTree` (and its `Companion`) exist in the same DEX.

## Goals / Non-Goals

**Goals:**

- Make the client's own log lines observable on demand, with no behaviour change.
- Do it with the smallest possible patch: no dependency, no register bookkeeping, no new code.

**Non-Goals:**

- Changing what is logged, adding new log statements, or shipping logging on by default.
- Any change to synchronisation, storage or networking.

## Decisions

- **D1 — Plant the tree at the end of `Timber.<clinit>`, not in `ZoteroApplication.onCreate`.**
  Injecting into a static initializer with `.registers 2` gives two free scratch registers and no
  parameters to preserve, so the four instructions below need no `FreeRegisterProvider` and no
  `morphe-patches-library` dependency; `onCreate` would need both. Alternative: inject
  `Timber.plant(...)` at Application startup — rejected as heavier for no benefit.
- **D2 — Use `Timber$Forest.plant` directly** rather than the static `Timber.plant`, so the class
  is not re-entered while it is still initialising.
- **D3 — Off by default.** This is a diagnostics tool; the operator selects it explicitly.

Injected at the last instruction of `Timber.<clinit>`:

```smali
new-instance v0, Ltimber/log/Timber$DebugTree;
invoke-direct {v0}, Ltimber/log/Timber$DebugTree;-><init>()V
sget-object v1, Ltimber/log/Timber;->Forest:Ltimber/log/Timber$Forest;
invoke-virtual {v1, v0}, Ltimber/log/Timber$Forest;->plant(Ltimber/log/Timber$Tree;)V
```

## Risks / Trade-offs

- [Log volume] → the patch is off unless selected, and the description says so.
- [DebugTree tags lines by caller] → expected; it is exactly the client trace being sought.
- [An injection into `<clinit>` could clobber registers still in use] → checked: the method
  finishes with `sput-object v0, treeArray` and `return-void`, so `v0`/`v1` are dead at the
  injection point.

## Migration Plan

Not applicable: a diagnostics patch with no data or behaviour change. Rollback is re-patching
without it.

## Open Questions

- Whether the DebugTree survives in future targets (R8 keeps it today because Timber's metadata
  and `Forest` reference it) — re-check at target confirmation.
