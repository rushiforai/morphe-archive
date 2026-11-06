package app.loupric.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loupric.patches.waze.Constants.COMPATIBILITY_WAZE

@Suppress("unused")
val wazeMorpheMusicResourcePatch = resourcePatch(
    name = "Waze Morphe Music support",
    description = "Adds Morphe Music (app.morphe.android.apps.youtube.music) to Waze audio SDK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val queriesNode = document.getElementsByTagName("queries").item(0)
            val packageNode = document.createElement("package")
            packageNode.setAttribute("android:name", "app.morphe.android.apps.youtube.music")
            queriesNode.appendChild(packageNode)
        }
    }
}

@Suppress("unused")
val wazeMorpheMusicBytecodePatch = bytecodePatch(
    name = "Waze Morphe Music bytecode",
    description = "Injects Morphe Music into Waze audio SDK app list.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    dependsOn(wazeMorpheMusicResourcePatch)

    execute {
        val sdkClass = UpdateAppListFingerprint.classDef.type

        val insertIndex = UpdateAppListFingerprint.instructionMatches.last().index + 1

        UpdateAppListFingerprint.method.addInstructionsWithLabels(
            insertIndex,
            """
            sget-object v4, $sdkClass->appConfigs:Ljava/util/Map;
            const-string v6, "app.morphe.android.apps.youtube.music"
            invoke-interface {v4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
            move-result v7
            if-nez v7, :cond_skip_morphe
            new-instance v5, Lcom/waze/sdk/au;
            const-string v7, "Morphe Music"
            const v8, 0x200001
            const/4 v9, 0x0
            const/4 v10, 0x0
            invoke-direct/range {v5 .. v10}, Lcom/waze/sdk/au;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)V
            invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            :cond_skip_morphe
            nop
            """
        )
    }
}
