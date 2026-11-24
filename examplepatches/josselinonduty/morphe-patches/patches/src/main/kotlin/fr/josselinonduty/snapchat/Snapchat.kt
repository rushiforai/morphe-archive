package fr.josselinonduty.snapchat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import fr.josselinonduty.snapchat.core.spoofSignaturePatch

val SNAPCHAT = Compatibility(
    name = "Snapchat",
    packageName = "com.snapchat.android",
    apkFileType = ApkFileType.APKM_REQUIRED,
    appIconColor = 0xFFFC00,
    targets = listOf(AppTarget(version = "14.33.1.0")),
)

// Every patch depends on the signature spoof: without it a re-signed app cannot log in.
fun snapBytecodePatch(
    name: String,
    description: String,
    default: Boolean = true,
    block: BytecodePatchBuilder.() -> Unit,
) = bytecodePatch(name, description, default) {
    compatibleWith(SNAPCHAT)
    dependsOn(spoofSignaturePatch)
    block()
}

fun snapResourcePatch(
    name: String,
    description: String,
    default: Boolean = true,
    block: ResourcePatchBuilder.() -> Unit,
) = resourcePatch(name, description, default) {
    compatibleWith(SNAPCHAT)
    dependsOn(spoofSignaturePatch)
    block()
}
