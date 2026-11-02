# Sleep as Android

Package `com.urbandroid.sleep`, supported targets `20261006` and `20260616`.
Source: [`patches/src/main/kotlin/dev/hyzor/patches/sleep/`](../../patches/src/main/kotlin/dev/hyzor/patches/sleep/).

| Patch | Default | What it does |
|---|---|---|
| Enable Premium | on | Unlocks the in-app premium features. |
| Enable Cloud Premium | off | Reports the Sleep Cloud subscription as active (client-side only). |

`20261006` is the build the fingerprints and register counts were verified against.
`20260616` is the build the patches were originally written for; the two extra hooks are
resolved with `methodOrNull`, so they degrade to a no-op on builds that lack them.

## How the app decides you are premium

Sleep as Android validates in-app purchases entirely on-device:

1. Play Billing returns a purchase; the app verifies Play's signature over it with an
   RSA key embedded in `classes4.dex` (`Billing.verify`, `SHA1withRSA`).
2. On success it writes `BS = 42` into the `TVF` SharedPreferences file — a plain
   `long`, no MAC, no Keystore wrapping.
3. `TrialFilter.refresh()` maps that to `isTrial = false`, which 58 call sites read.

There is no server-issued licence. The patches therefore rewrite the decision
(`isTrial`, `hasUnlock`, `isUnlockAcked`) rather than trying to forge a receipt, and
additionally clear the two tamper signals a re-signed sideload triggers
(`isOurSignature`, `isUnknownSource`).

The genuine paid unlocker (`com.urbandroid.sleep.full.key`) is *not* required and
does **not** work alongside these patches — Morphe re-signs the app, so the
`checkSignatures()` comparison between the two packages no longer matches.

## Limitations

The patch only changes the client-side decision. Anything that authenticates against
Urbandroid's backend still sees the real account. Sleep Cloud Premium is reported as
active locally; the cloud service may still refuse requests.
