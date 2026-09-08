# friendsturner-patches

Morphe patches for **FriendsTurner** (`com.peter890331.friendsturner`).

Built with the [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) API.

## Patches

- **Remove ads** — skips the interstitial ad shown before the "smart click" tool.

## How the ad bypass works

`MainActivity.F()V` is the gate that shows the interstitial ad:

```
sget-object v1, Lp8/b;->z:Lj0/m1;            // ad-free / "sponsor" flag
...
invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
move-result v1
if-eqz v1, :cond_0                            // non-sponsor -> ad code
invoke-virtual {v0}, L.../MainActivity;->E()V // ad-free path: start the tool
return-void
:cond_0
... show interstitial ad (this.S / this.P) ...
```

The patch removes the single conditional branch that diverts non-sponsors to the
ad code, so `F()V` always falls through to the ad-free `E()V / return-void`
path — exactly what a sponsored user gets. No purchase state is faked.

## Build

```bash
./gradlew buildAndroid
```

Requires the `app.morphe.patches` Gradle plugin from the Morphe GitHub Packages
registry, which needs a GitHub token with the `read:packages` scope. Put it in
`~/.gradle/gradle.properties` (do **not** commit it):

```
gpr.user = <github-user>
gpr.key  = <github-token-with-read:packages>
```
