# HBC98 inspection helpers

Developer-only tools for porting Venus Patches to a new Discord build. Nothing here is shipped in the `.mpp`.

```bash
unzip -p Discord.apkm base.apk > /tmp/base.apk && unzip -o /tmp/base.apk assets/index.android.bundle -d work/new
python3 -c "import sys; sys.path.insert(0,'scripts/hbc'); from hbc import Bundle; B=Bundle('work/new/assets/index.android.bundle'); print(B.grep_path('UserStore'))"
```

`ops.txt` is the HBC98 opcode table, generated from Hermes' `BytecodeList.def` (tag `hermes-v250829098.0.19`) with `cpp`.
`Bundle` maps Metro module ids to factories, dependency arrays, source paths (`fileFinishedImporting`), strings and object-literal keys.
