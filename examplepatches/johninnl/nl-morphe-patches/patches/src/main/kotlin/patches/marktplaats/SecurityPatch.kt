package patches.marktplaats

import app.morphe.patcher.patch.bytecodePatch

private const val wrapper = "Lcom/horizon/android/core/networking/threatmetrix/a;"

@Suppress("unused")
val disableThreatMetrix = bytecodePatch(
    name = "Disable ThreatMetrix",
    description = "Stops ThreatMetrix initialization, device/security profiling and its session headers. Independent and enabled by default.",
) {
    dependsOn(originalInput)
    compatibleWith(marktplaats)
    execute {
        // Suppress startup before even resolving the native SDK singleton.
        // The real wrapper constructor keeps its initialized state false.
        exact(wrapper, "d(${wrapper}Lcom/horizon/android/HorizonApplication;)V", 9, 6, 38)
            .addInstructions(0, "return-void")
        // Also protect restored/late header calls: the unmodified header method
        // uses its native emptyMap before creating a blocking/refresh coroutine.
        exact(wrapper, "e()Z", 17, 2, 23).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
