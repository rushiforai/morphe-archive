package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.AvailabilityResolver
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.util.ResourceGroup
import app.morphe.util.p0Register
import com.android.tools.smali.dexlib2.iface.Method
import org.w3c.dom.Node
import java.io.ByteArrayInputStream
import java.io.InputStream

fun requireArch(vararg arches: ApkArchitecture) = AvailabilityResolver { _, arch ->
    if (arch in arches) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
}

val requireArm64 = requireArch(ApkArchitecture.ARM64_V8A)

fun Method.getRegisterName(register: Int): String {
    val firstParameterRegister = if (implementation != null) p0Register else 0

    return if (register >= firstParameterRegister) {
        "p${register - firstParameterRegister}"
    } else {
        "v$register"
    }
}

fun Node.getNode(tagName: String): Node {
    for (index in 0 until childNodes.length) {
        val element = childNodes.item(index)
        if (element.nodeName == tagName) {
            return element
        }
    }
    throw IllegalStateException()
}

fun ResourcePatchContext.writeResources(
    vararg streams: InputStream,
    resourceGroup: ResourceGroup,
) {
    require(streams.size == resourceGroup.resources.size)
    val targetResourceDirectory = this["res", false]

    streams.zip(resourceGroup.resources).forEach { (stream, resource) ->
        val resourceGroupDirectory =
            targetResourceDirectory.resolve(resourceGroup.resourceDirectoryName)
        resourceGroupDirectory.mkdirs()

        resourceGroupDirectory.resolve(resource).outputStream().use {
            stream.copyTo(it)
        }
    }
}

fun ResourcePatchContext.writeResources(
    vararg streams: ByteArray,
    resourceGroup: ResourceGroup,
) {
    writeResources(
        *streams.map(::ByteArrayInputStream).toTypedArray(), resourceGroup = resourceGroup
    )
}