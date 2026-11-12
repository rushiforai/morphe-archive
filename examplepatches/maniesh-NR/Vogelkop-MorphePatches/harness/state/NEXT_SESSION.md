# NEXT_SESSION.md — working memory / handoff

Updated: 2026-11-12 (X-rung waiter-fix session, UTC)

## Current state

- Harness LIVE with **event-driven backups** (ADR 0004): every execution
  plan ends with `harness/bin/backup.sh` as its final step.
- Project: v1.3.0 released. W-rung verdicts in: **W1 boots** (innocent
  combo cleared); **W2 froze at "Start browsing" / black on reopen** —
  root cause found (fresh-install `m9k` startup-dependency waiter: j9k
  remote-config + bac Leanplum/Braze + a umi-scheduled give-up timeout,
  none fire in the patched flow; full trace in root STATE.md §W2
  post-mortem).
- **X-rung (v1.3.1-R3) built + host-verified + uploaded**, awaiting device
  results: X2 = W2 + 02f (waiter seeds TRUE) + 02h (hch splash posting
  dead) — flash first; X1 = W2 + 02f — differential. Protocol in
  `docs/X-RUNG-README.md`; hashes in root STATE.md §X-rung build.
- v1.3.2 #8 (adblock defaults + Secure DNS) recon COMPLETE
  (`evidence/adblock-defaults-recon.md`), implementation fully specified,
  blocked on the X2 verdict (target substrate = X2 lineage).

## Open threads

1. **X1/X2 device results** — when the user reports, record verdicts in
   root STATE.md. X2 boots → v1.3.1 DONE (tag/release, update PATCHES.md,
   then start v1.3.2 #8). X1 boots + X2 fails → 02h guilty, ship X1
   content + investigate. Both fail → pull `vogelkop-diag.log`, suspects:
   umi flow executor, tzn-1 pushed-content deferral.
2. **Token expiry watch** — PAT uploaded 2026-11-12, ~7-day convention →
   expect expiry ~2026-11-19. On auth failure ask the user to re-issue
   (fine-grained, Contents: Read & Write on
   maniesh-NR/Vogelkop-MorphePatches) and upload as `Vogelkop access
   key.txt`; `backup.sh` auto-imports it.
3. (optional) `scripts/upload_storage.py` has stale `/tmp/my-project`
   paths — retire in favour of `harness/bin/storage_upload.py` next time
   it is touched.
4. (note) `scripts/build_x_rung.sh` embeds the recycle-#3 session layout
   (`/home/z/my-project/work/...`); if the sandbox recycles again, re-run
   `scripts/fetch_x_rung_artifacts.py`-style provisioning first (see
   episode 2026-11-12-x-rung-waiter-fix.md for the toolchain recipe: smali
   3.0.10 lib jar + baksmali fat + antlr-runtime 3.5.3, build-tools r34).

## Next session should

1. `git -C /home/z/my-project/.harness/vogelkop pull --rebase --autostash origin HEAD`
2. Read `memory/MEMORY.md` → this file → root `STATE.md`.
3. Do the work. EVERY reply ends with `bash harness/bin/backup.sh`
   (AGENTS.md "End of every prompt — MANDATORY final step"); at rung
   boundaries also write an episode + update this file BEFORE the backup.
