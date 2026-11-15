package app.lchanc3.patches.dmmvr.handtracking

import app.lchanc3.patches.dmmvr.shared.Constants.COMPATIBILITY_DMM_VR
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

private const val LIBIL2CPP = "lib/arm64-v8a/libil2cpp.so"

private const val HAND_TRACKING_PERMISSION = "com.oculus.permission.HAND_TRACKING"
private const val HAND_TRACKING_FEATURE = "oculus.software.handtracking"

/** Offset of `e_phoff` in a 64-bit ELF header, and of `p_filesz` within a program header. */
private const val ELF64_PHOFF = 0x20
private const val PHDR_FILESZ = 32
private const val PHDR_MEMSZ = 40

@Suppress("unused")
val handTrackingPatch = resourcePatch(
    name = "Hand tracking",
    description = "Lets you use the app with your hands instead of the Quest controllers. The ray " +
        "comes from the hand you last pinched with, and a pinch of thumb and index finger is a " +
        "click, like the trigger.",
) {
    compatibleWith(COMPATIBILITY_DMM_VR)

    execute {
        // Without these the system insists on controllers: it shows the "pick up your
        // controllers" prompt instead of switching to hands when they are put down.
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element

            fun declared(tag: String, name: String) = document.getElementsByTagName(tag).let { nodes ->
                (0 until nodes.length).any { (nodes.item(it) as Element).getAttribute("android:name") == name }
            }

            if (!declared("uses-permission", HAND_TRACKING_PERMISSION)) {
                manifest.insertBefore(
                    document.createElement("uses-permission").apply {
                        setAttribute("android:name", HAND_TRACKING_PERMISSION)
                    },
                    application,
                )
            }
            if (!declared("uses-feature", HAND_TRACKING_FEATURE)) {
                manifest.insertBefore(
                    document.createElement("uses-feature").apply {
                        setAttribute("android:name", HAND_TRACKING_FEATURE)
                        setAttribute("android:required", "false")
                    },
                    application,
                )
            }
            mapOf(
                "com.oculus.handtracking.version" to "V2.0",
                "com.oculus.handtracking.frequency" to "HIGH",
            ).forEach { (name, value) ->
                if (declared("meta-data", name)) return@forEach
                application.appendChild(
                    document.createElement("meta-data").apply {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    },
                )
            }
        }

        // The app reads input through the Unity Input System, which never sees the hands on
        // Quest. The injected code asks OVRPlugin, which the app already ships, for them
        // instead; see NativeCode.kt for what it does and where it is hooked in.
        val library = get(LIBIL2CPP)
        if (!library.isFile) throw PatchException("$LIBIL2CPP not found in the APK")

        val bytes = library.readBytes()
        val elf = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        val programHeaders = elf.getLong(ELF64_PHOFF).toInt()

        fun digest() = MessageDigest.getInstance("SHA-256").digest(bytes)
            .joinToString("") { "%02x".format(it) }

        // The installed app may already be this patch's output: the store version has to be
        // removed to install it, and the store only hands back whatever release it has now.
        // So an APK patched by any release of this patch
        // is turned back into the original first, which the digest below then confirms.
        if (digest() != LIBIL2CPP_SHA256) {
            for (offset in CAVE_OFFSET until CAVE_END) bytes[offset] = 0
            HOOKS.forEach { (offset, original, _) -> elf.putInt(offset, original.toInt()) }
            elf.putLong(programHeaders + PHDR_FILESZ, ORIGINAL_TEXT_SIZE.toLong())
            elf.putLong(programHeaders + PHDR_MEMSZ, ORIGINAL_TEXT_SIZE.toLong())

            val restored = digest()
            if (restored != LIBIL2CPP_SHA256) {
                throw PatchException(
                    "$LIBIL2CPP is not the one from DMM VR 9.0.0 ($restored). The code is " +
                        "written at fixed offsets and would break any other build.",
                )
            }
        }

        CAVE_CODE.forEachIndexed { index, word -> elf.putInt(CAVE_OFFSET + 4 * index, word.toInt()) }
        HOOKS.forEach { (offset, original, replacement) ->
            if (elf.getInt(offset) != original.toInt()) {
                throw PatchException("Unexpected instruction at 0x${offset.toString(16)}")
            }
            elf.putInt(offset, replacement.toInt())
        }

        // Grow the first (executable) PT_LOAD over the padding the code now lives in.
        elf.putLong(programHeaders + PHDR_FILESZ, CAVE_END.toLong())
        elf.putLong(programHeaders + PHDR_MEMSZ, CAVE_END.toLong())

        library.writeBytes(bytes)
    }
}
