# 02h — q0o.f() splash (hch) posting bypass

Goal: never post the `q0n(15)` flow event. `q0n` case 15 constructs `hch`
(`delayed_launch_fragment` — the "Opera logo with a loading bar" splash) and
is the first thing `q0o.f()` does on a fresh flow while
`pushed.sequence != 2`. With 02h the flow goes straight to tree-building,
so PERSONALIZATION is the first screen after the system cold-start window,
on first open and on every relaunch.

Target: `q0o.f()V` — the head:

```smali
    const/4 v1, 0x2

    if-eq v0, v1, :cond_2e        # sequence == 2 → tree path

    iget-object v0, p0, Lq0o;->f:Lpyl;

    if-nez v0, :cond_2e           # flow already built → tree path

    <construct k0o(j0o.a, false, q0n(15), 2) and post it>

    return-void

    :cond_2e
    ...build tree, launch cek...
```

Patched — replace the first `if-eq` with an unconditional jump (the whole
posting block becomes dead code; the second `if-nez` and `:cond_2e` stay
resolvable):

```smali
    const/4 v1, 0x2

    goto/16 :cond_2e

    iget-object v0, p0, Lq0o;->f:Lpyl;

    if-nez v0, :cond_2e
    ...
```

(`goto/16` because the distance to `:cond_2e` exceeds the 10t `goto` range
once the ~25-instruction k0o construction sits between them; smali picks
the 20t encoding.)

Safety notes:

- `pushed.sequence` readers: this site (dead after 02h) and `cfn` case 0xd
  (`e0o.shouldShow` — already forced false by 02e). No writer depends on
  the posting having happened.
- `hch` carries a 10-second postDelayed failsafe that force-launches the
  browser (`pjg` case 12 → `hch.f0()` → `qch.b(true)` → `g9k.J()`); it only
  ran while hch was the visible fragment and is irrelevant once hch is never
  posted. The real finalization is 02f's END path.
- PERSONALIZATION's preload (`uyg.x` await with `q0o.k` timeout in `cek`)
  still runs before its screen shows; the visible effect is at most a brief
  window-background instead of the branded splash.
