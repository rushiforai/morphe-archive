# Porting and inspection tools

Developer-only tools for Discord's Hermes bytecode and for porting Venus to a new Discord build. Nothing here ships in
the `.mpp`, and everything they write goes to `work/` (ignored by git). The porting checklist is in `AGENTS.md`.

| Tool | What it does |
|---|---|
| `setup.sh [Discord.apkm]` | Extracts `base.apk` and `index.android.bundle` into `work/new/` and indexes the bundle |
| `find_apkm.py` | Prints the newest complete `.apkm` in `~/uploaded_files` (skips half-uploaded files) |
| `port_check.py` | Prints the constants for `HbcPrelude.kt`/`HbcPrivacy.kt`, finds moved Metro modules and privacy targets, lists module IDs it doesn't check yet; exits 1 when anything needs attention. `--map` regenerates `module-map.md` |
| `privacy_targets.py <bundle> --locate` | Regenerates the `Target(...)` lists in `HbcPrivacy.kt` |
| `module-map.md` | Every Metro module Venus uses, generated from `BOOTSTRAP_MODULES` |
| `hbc.py` | HBC98 reader, disassembler and module index (see below) |
| `ops.txt` | HBC98 opcode table from Hermes' `BytecodeList.def`; `PrivacyTest.kt` checks the Kotlin constants against it |
| `DexInspect.kt` | Lists DEX classes and methods matching a name (usage at its top) |
| `color_tables.py` | Decodes Discord's color tables to `work/discord_colors.json` for `tests/theme_compat.cjs` |
| `legacy_colors.py` | Regenerates `LEGACY_TOKEN_RAWS` in `bootstrap.js` (which legacy raw each moved color token used to read) from nexpid/Themelings history; run when porting |
| `hermes_vm.sh`, `bench_setup.sh` | The checksum-pinned Hermes VM and everything benchmarks need |
| `probe.sh`, `probe_runtime.py` | Boot the real bundle with the runtime and run a probe script inside it |

Related: `scripts/verify_apk.sh` patches the APKM with every patch using the newest Morphe CLI
(`scripts/morphe_cli.py`, prerelease or stable) and runs `tests/native/VerifyApk.kt`.

## Inspecting the bundle

```bash
python3 -c "
import sys; sys.path.insert(0, 'scripts/hbc')
from hbc import Bundle
B = Bundle('work/new/assets/index.android.bundle')
print(B.grep_path('UserStore'))          # [(module id, source path)]
print(B.show(B.grep_path('UserStore')[0][0]))
"
```

`Bundle` maps Metro module IDs to factory functions (`B.modules`), dependencies (`B.deps`), source paths (`B.paths()`),
strings (`B.strs(mid, deep=True)`), exported names (`B.exports(mid)`), closure trees (`B.tree(mid)`), users of a module
(`B.users(mid)`) and modules containing given strings (`B.find(...)`). `B.h.dis(B.h.func(fid))` disassembles a function.
