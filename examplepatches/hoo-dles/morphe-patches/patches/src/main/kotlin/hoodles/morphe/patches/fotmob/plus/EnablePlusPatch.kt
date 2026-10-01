/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.fotmob.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.util.fieldByName
import hoodles.morphe.compatibility.Compat
import kotlin.properties.Delegates

val sharedExtensionPatch = sharedExtensionPatch(
    "fotmob",
    activityOnCreateExtensionHook("/MainActivityWrapper;")
)

var toolbarDrawableId by Delegates.notNull<Long>()

val getToolbarDrawableId = resourcePatch {
    execute {
        toolbarDrawableId = this.resourceIds[ResourceType.DRAWABLE, "ic_fotmob_plus_logo_app_bar"]
    }
}

@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable FotMob+",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.FOTMOB)

    dependsOn(sharedExtensionPatch, getToolbarDrawableId)

    execute {
        val patchClass = mutableClassDefBy("Lhoodles/morphe/extension/fotmob/plus/EnablePlusPatch;")

        (patchClass.fieldByName("PERIOD_TYPE_CLASS").initialValue as MutableStringEncodedValue).value =
            PeriodTypeClassFingerprint.classDef.type
        (patchClass.fieldByName("STORE_TYPE_CLASS").initialValue as MutableStringEncodedValue).value =
            StoreTypeClassFingerprint.classDef.type
        (patchClass.fieldByName("OWNERSHIP_TYPE_CLASS").initialValue as MutableStringEncodedValue).value =
            OwnershipTypeClassFingerprint.classDef.type
        (patchClass.fieldByName("VERIFIED_TYPE_CLASS").initialValue as MutableStringEncodedValue).value =
            VerifiedTypeClassFingerprint.classDef.type

        EntitlementInfosCtorFingerprint.method.addInstructions(0,
            "invoke-static {p1}, Lhoodles/morphe/extension/fotmob/plus/EnablePlusPatch;->addEntitlement(Ljava/util/Map;)V"
        )

        // no idea what actually determines the toolbar logo, so I'm just going to force it...
        SetLogoFingerprint.method.addInstructions(0,
            "const p1, $toolbarDrawableId"
        )
    }
}