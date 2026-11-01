package patches.detijd

import app.morphe.patcher.patch.resourcePatch

// Filter only rendered buttons. Original routes and map indices stay intact.
internal val accountTabEdits = listOf(
    HermesEdit("BottomTabBar route renderer", 33218, 7114322, 798, 41, 3,
        "683822a223dff0f1c7ce4669d8a580e5af5f5d96df2064b34f17a51451944d9d",
        "341200400702891101370700113b04120144031100b05d0304039401b00503760144170301c6450317021b96d109030144031703e9d1090301440311044744051104473413013b14130f450414056f5a450404065160",
        "341200400702891101370700113b04120144031100b05d0304039401b00503760144170301c6450317021b96d109030144031703e9d1090301440311044744051104473413013b14130f9004f38790008760d3cd0500"),
)

@Suppress("unused")
val hideMyTijd = resourcePatch(
    name = "Hide Mijn Tijd (expert)",
    description = "Removes Mijn Tijd from the bottom bar. De essentie, other navigation and manual sign-in remain available.",
    default = false,
) {
    dependsOn(originalInput)
    compatibleWith(detijd)
    execute { patchHermes(get("assets/index.android.bundle"), accountTabEdits) }
}
