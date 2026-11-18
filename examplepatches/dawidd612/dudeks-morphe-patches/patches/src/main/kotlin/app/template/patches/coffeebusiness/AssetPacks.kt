package app.template.patches.coffeebusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode

internal fun BytecodePatchContext.restoreCoffeeAssetPacks() {
    val wrapper = "Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;"
    val helper = "Lcom/unity3d/player/CoffeeAssetPacks;"
    val callback = "Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;"
    val constructor = coffeeMethod(wrapper, "<init>", listOf("Lcom/unity3d/player/UnityPlayer;", "Landroid/content/Context;"), "V", false)
    val states = coffeeMethod(wrapper, "getAssetPackStates", listOf("[Ljava/lang/String;", callback), "V", false)
    val path = coffeeMethod(wrapper, "getAssetPackPath", listOf(STRING), STRING, false)
    checkCoffee(constructor.instructions.first().opcode == Opcode.INVOKE_DIRECT &&
        constructor.hasString("com.google.android.play.core.assetpacks.AssetPackManager") &&
        states.calls("Lcom/google/android/play/core/assetpacks/AssetPackManager;", "getPackStates") &&
        path.calls("Lcom/google/android/play/core/assetpacks/AssetPackManager;", "getPackLocation") &&
        states.implementation!!.registerCount > 3 && path.implementation!!.registerCount > 2,
        "Unity asset-pack bridge changed")
    constructor.addInstructions(1,
        "invoke-static {p1, p2}, $helper->initialize(Lcom/unity3d/player/UnityPlayer;Landroid/content/Context;)V")
    states.addInstructions(0, """
        invoke-static {p1, p2}, $helper->states([Ljava/lang/String;$callback)Z
        move-result v0
        if-eqz v0, :original
        return-void
        :original
        nop
    """.trimIndent())
    path.addInstructions(0, """
        invoke-static {p1}, $helper->path($STRING)$STRING
        move-result-object v0
        if-eqz v0, :original
        return-object v0
        :original
        nop
    """.trimIndent())
}
