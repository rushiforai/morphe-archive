package app.asana.patches.unlock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * `PayWall.isOpen()` is Asana Rebel's single "user is a paying subscriber" flag.
 *
 * `PayWallImpl.isOpen()` reads it from SharedPreferences (`pay_wall_is_open`):
 *
 * ```
 * .method public isOpen()Z
 *     iget-object v0, p0, L...PayWallImpl;->payWallStorage:L...PayWallStorage;
 *     invoke-interface {v0}, L...PayWallStorage;->retrievePayWallIsOpen()Z
 *     move-result v0
 *     return v0
 * .end method
 * ```
 *
 * It is written by `SplashScreenPresenter` as `latestSubscription != null && !latestSubscription.canceled`,
 * so `true` == Pro. 28 call sites consume it (workout detail play button, downloads, yoga stories,
 * recipes, songs, weekly plan, settings).
 *
 * Filters are based on the class/method names, which are NOT obfuscated in this app.
 * If a future version renames them, the `methodCall` filter on the storage is the part to keep.
 */
object PayWallIsOpenFingerprint : Fingerprint(
    definingClass = "Lcom/asanayoga/asanarebel/paywall/PayWallImpl;",
    name = "isOpen",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/asanayoga/asanarebel/paywall/PayWallStorage;",
            name = "retrievePayWallIsOpen"
        )
    )
)
