# Twitter/X share-link patches

These patches port the core Twitter/X share-link behavior from the ReVanced-style Kareem patches into Morphe bytecode patches. They are currently maintained against X/Twitter `11.86.0-release.0`. They do not use extension code and intentionally do not include the JSON hook compatibility patch.

## Disable Twitter PairIP startup checks

`Disable Twitter PairIP startup checks` bypasses the PairIP integrity startup paths added to recent X builds. Repacked `11.86.0-release.0` APKM outputs crash before UI startup inside `libpairipcore.so`; the patch short-circuits the app attach-time signature verifier and PairIP startup launcher while leaving non-startup PairIP VM code untouched.

Targeted methods:

```smali
Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V
Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V
Lcom/pairip/StartupLauncher;->launch()V
```

## Change Twitter share domain

`Change Twitter share domain` targets Twitter/X's status permalink formatter:

```smali
Lcom/twitter/model/core/e;->v(JLjava/lang/String;)Ljava/lang/String;
```

It rewrites this generated status URL format:

```text
https://x.com/%1$s/status/%2$d
```

to:

```text
https://nitter.kareem.one/%1$s/status/%2$d
```

The replacement is emitted as `const-string/jumbo` to avoid string-index issues when adding the new literal. The patch fails fast if the expected class, method, or original/custom format string cannot be found.

## Sanitize Twitter share links

`Sanitize Twitter share links` targets Twitter/X's share-target URL formatter:

```smali
Lcom/twitter/share/api/targets/u;->a(Ljava/lang/String;Lcom/twitter/share/api/targets/t;Ljava/lang/String;)Ljava/lang/String;
```

Instead of replacing the whole method body, it inserts an early return at the start of the method:

```smali
return-object p0
```

for a static method, or:

```smali
return-object p1
```

if the method is instance-based. In both cases the returned register is the incoming share URL string. This preserves the already-generated permalink while skipping logic that appends tracking query parameters.

## Verification checklist

1. Build with `Constants.COMPATIBILITY_TWITTER` present in `app.kareem.patches.shared.Constants`.
2. Patch a Twitter/X APK matching the compatibility entry with all three Twitter patches enabled.
3. Launch X and verify it does not crash in `libpairipcore.so` during startup.
4. Share or copy a status link and verify the host is `nitter.kareem.one`.
5. Verify the shared link does not include Twitter/X tracking query parameters.
6. Open the shared URL externally and confirm the path still resolves to the expected status.
