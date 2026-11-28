# Binding tools

Source-only helpers for deriving and re-checking the obfuscated Gboard members a port binds to.
Nothing here is compiled into the bundle or shipped; each tool runs from source. The audited values
they produced live in [`audits/`](audits/README.md), and each audit records how it was derived.

Run any of them with the patcher jar on the classpath — on Windows use `;` between entries:

```bash
JAVA="/c/Program Files/Eclipse Adoptium/jdk-25.0.4.101-hotspot/bin/java"
"$JAVA" -cp "libs/morphe-cli.jar" tools/bindings/MethodDump.java <apk> 'Lmdy;' '<clinit>'
```

- `Inventory.java <patches.mpp> <version> <patches-list.json>` — checks the bundle's patch list.
- `BindingAudit.java <audit.kt> <apk>` — resolves the `Gboard…Target(…)` declarations in an audit.
- `MethodDump.java <apk> '<class;>' [method]` — declared members, or one method's instructions.
- `MethodRefs.java <apk> '<owner;>' [name]` — methods that call a method.
- `FieldRefs.java <apk> '<class;>' [field]` — field reads and writes, with their methods.
- `StringRefs.java <apk> <substring> [--exact]` — methods that reference a string literal.
- `ProposeRetarget.java` — suggests replacement targets for a drifted binding.

Each exits 0 when something matched, 1 when nothing did, 2 on a usage or read error, so an empty
result is distinguishable from a failed run.

## Deriving the 18.8 backup-provider flag

The Backup & Restore port needs the rollout flag that decides whether Gboard's own backup data
providers are registered. Gboard renames the holder class every release, so the flag is derived from
the release's dex and then re-checked the same way. Values below are for
**18.8.0.1022711984-beta-arm64-v8a**, sha256
`d1406caa270011aaea2a58bf828a3ffd94a58927a53688dc7bcd26e537c4d34b`; they are what
`GboardBackupRestoreTargets.kt` records.

The literal is stable even though the class is not, so start from the string:

```bash
"$JAVA" -cp "libs/morphe-cli.jar" tools/bindings/StringRefs.java \
    "<the 18.8 APK>" enable_backup_delight5_personalized_data --exact
```

```
Lmdy;-><clinit>()V  "enable_backup_delight5_personalized_data"
```

That gives the holder (`Lmdy;`) but not the field. The constructor stores every flag definition in
order, so the literal's instruction index names the field it is written to:

```bash
"$JAVA" -cp "libs/morphe-cli.jar" tools/bindings/MethodDump.java \
    "<the 18.8 APK>" 'Lmdy;' '<clinit>' | grep -B2 -A3 enable_backup_delight5_personalized_data
```

```
  77: const-string v0  enable_backup_delight5_personalized_data
  78: invoke-static {v0, v6}  Ladfk;->a(Ljava/lang/String;Z)Ladfh;
  79: move-result-object v0
  80: sput-object v0  Lmdy;->q:Ladfh;
```

`Ladfk;->a(String;Z)Ladfh;` is the boolean-flag factory, so the target is `Lmdy;->q:Ladfh;`. The
last step is the one that matters: a field is only a flag worth forcing if something gates behaviour
on it, and the consumers are what distinguish a plural gate from a single provider:

```bash
"$JAVA" -cp "libs/morphe-cli.jar" tools/bindings/FieldRefs.java "<the 18.8 APK>" 'Lmdy;' q
```

```
sput-object Lmdy;->q  in  Lmdy;-><clinit>()V
sget-object Lmdy;->q  in  Lmgu;->getModuleDef(Landroid/content/Context;)Lagwf;
sget-object Lmdy;->q  in  Lmgw;->getModuleDef(Landroid/content/Context;)Lagwf;
```

Exactly two readers, both `getModuleDef(Landroid/content/Context;)Lagwf;`, i.e. the flag decides
whether two whole modules exist — the backup providers behind them are absent when it is off. The
same chain run for the neighbouring `enable_hmm_user_history_backup` gives a single reader:

```bash
"$JAVA" -cp "libs/morphe-cli.jar" tools/bindings/StringRefs.java "<the 18.8 APK>" enable_hmm_user_history_backup --exact
"$JAVA" -cp "libs/morphe-cli.jar" tools/bindings/FieldRefs.java "<the 18.8 APK>" 'Lotm;' c
```

```
Lotm;-><clinit>()V  "enable_hmm_user_history_backup"
sput-object Lotm;->c  in  Lotm;-><clinit>()V
sget-object Lotm;->c  in  Lour;->getModuleDef(Landroid/content/Context;)Lagwf;
```

One reader gates one provider, which is why that flag is not the gate this feature is built on.

Re-running these three commands against another build is the whole re-check: `StringRefs` finds the
holder, `MethodDump` names the field the literal is stored to, and `FieldRefs` shows what reads it.
If the consumer count or the consumer shape changes, the recorded row is stale even when the strings
match.
