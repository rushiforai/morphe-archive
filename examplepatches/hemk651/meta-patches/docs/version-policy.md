# Version compatibility policy

The project will not maintain a hard-coded list of app version codes or version names as the default compatibility strategy.

Morphe supports a version-agnostic target declaration with `AppTarget(version = null, isExperimental = true)`. This allows the patch source to advertise a candidate as experimental across app versions.

This is not proof that the bytecode patch is universal. Each target app can change its Application class, startup flow, storage behavior, or internal configuration loader. Therefore:

- Keep the package identity as the app selector.
- Use resilient structural discovery rather than fixed obfuscated class names wherever possible.
- Make runtime file writing idempotent and non-fatal.
- Detect failure and skip rather than crash the target app.
- Test current releases and record observed compatibility without adding a version allowlist unless a hard incompatibility is found.
- Do not describe the patch as fully universal until cross-version tests establish that claim.

The desired policy is universal-by-design with graceful compatibility checks, not a false guarantee that every future build will work.
