package app.sircoderin.patches.twilight

import app.morphe.patcher.Fingerprint

/** `TwilightView.onDraw(canvas)`: draws the full-screen tint, the optional dim and the optional paper texture. */
internal object TwilightViewOnDrawFingerprint : Fingerprint(
    definingClass = "Lcom/urbandroid/lux/ui/TwilightView;",
    name = "onDraw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;"),
)

/** `AbstractTwilightService.onCreate()`: the accessibility service (":background" process) starting. */
internal object TwilightServiceOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/urbandroid/lux/AbstractTwilightService;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** `AbstractTwilightService.onDestroy()`. */
internal object TwilightServiceOnDestroyFingerprint : Fingerprint(
    definingClass = "Lcom/urbandroid/lux/AbstractTwilightService;",
    name = "onDestroy",
    returnType = "V",
    parameters = listOf(),
)
