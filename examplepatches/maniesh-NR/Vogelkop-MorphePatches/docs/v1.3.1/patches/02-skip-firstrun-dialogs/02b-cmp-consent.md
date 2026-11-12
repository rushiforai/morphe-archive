# Patch 02b — Usercentrics CMP "Help us make Opera better" bypass

## File

`smali_classes3/r65.smali`

## Goal

Suppress the "Help us make Opera better" consent sheet (Usercentrics CMP).
The gate is `r65.l(Z)Z` — it returns `true` if any of several conditions
hold, the last of which is "the pref `startup.request_cmp_consent` is true
(default true)". Forcing `r65.l(Z)Z` to **always return false** means CMP is
never asked. Under CMP default-deny semantics, that means every analytics /
tracking switch that would have been gated on consent defaults to **off** —
which is the desired end state.

## Patch — replace the body of `r65.l(Z)Z`

### Original (lines ~1208-1255 in the smali file)

```smali
.method public final l(Z)Z
    .locals 1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lr65;->s:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lr65;->u:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lr65;->k()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p0, p0, Lr65;->h:Lru9;

    invoke-static {p0}, Li41;->j0(Lru9;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "startup.request_cmp_consent"

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    return v0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
```

### Patched (replace the entire method body)

```smali
.method public final l(Z)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
```

## Anchoring notes

* The method signature `public final l(Z)Z` on class `Lr65;` is stable across
  Opera Beta builds because it is referenced by name from `rn9` and `x65`
  (the CMP sheet presenter and its observer).
* No pref is written, so no state pollution.
* The `:cond_0` / `:cond_1` labels disappear from the method body — that is
  fine; no other method jumps into this one.

## Risk

* If Opera ever ships a build that *requires* a CMP "yes" answer for some
  feature to function (e.g., a hard-gated feature), this patch would also
  disable that feature. None exists in 104.0.5262.91143; verified by grep
  of all callers of `r65.l`.
* Two other classes (`rn9`, `x65`) call `r65.l`; both treat `false` as
  "don't show the sheet", which is exactly what we want.

## Binary-implementation addendum (2026-11-11, G-rung — SUPERSEDES the
whole-body replacement above)

The smali recipe above ("replace the entire method body") is correct at the
smali level, but the E-rung **binary** implementation of it was the crash
cause of the v1.3.1 E-builds: it wrote `const/4 v0,0; return v0` (4 bytes)
over the method head. `r65.l`'s original head is a 1-unit `const/4 v0,1`
followed by the FIRST unit of a 2-unit `if-nez` — the write split the if-nez
and left its operand `2c 00` as the first dead bytes, which decode as a
phantom `sparse-switch` with a payload pointer 0x7E3B1255 units outside the
48-unit method. ART's verifier walks unreachable instructions too → hard
verification failure → VerifyError when `r65` is first instantiated
(`hjf.onCreate` → `application.h()`, i.e. the very first activity) → instant
black-screen crash. Proven by `scripts/dex_structural_walk.py`: booting C1 =
0 structural failures / 47,865 methods; crashing E1/E2 = exactly 1 failure,
`Lr65;->l`.

**Correct binary form** (what `v131_binary_patch.py` does since the G-rung):
flip ONE operand byte — `12 10` → `12 00`, i.e. `const/4 v0,1` →
`const/4 v0,0` — and touch nothing else. `v0` is the method's only source of
"true" (returned at `:cond_0` and passed as the
`getBoolean("startup.request_cmp_consent")` default), so every ORIGINAL path
now returns false; there is no dead code and no instruction-boundary change
at all. jadx round-trip of the patched method:

```java
public final boolean l(boolean z2) {
    if (z2 || this.s || ((Boolean) this.u.getValue()).booleanValue() || k()) {
        return false;
    }
    ru9 ru9Var = this.h;
    return (i41.j0(ru9Var) || ru9Var.a.getBoolean("startup.request_cmp_consent", false)) ? false : false;
}
```

The patcher now also runs a structural-integrity gate over every method of
every dex after patching (ART-style instruction walk incl. switch payload
resolution) and refuses to emit a dex that fails it.
