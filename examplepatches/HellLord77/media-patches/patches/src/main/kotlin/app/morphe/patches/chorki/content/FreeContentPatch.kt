package app.morphe.patches.chorki.content

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.chorki.shared.Constants.COMPATIBILITY_CHORKI

@Suppress("unused")
val freeContentPatch = rawResourcePatch(
    name = "Free content",
    description = "Stream movies and series for free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CHORKI)

    dependsOn(changePackageInstallerPatch())

    execute {
        val lib = get("lib/arm64-v8a/libapp.so")
        val bytes = lib.readBytes()

        val contentHelperCanAccessContent = 0x006B23BD
        val settingsModelFromJson = 0x00DA7519

        require(bytes[contentHelperCanAccessContent] == 0xC2.toByte())
        require(bytes[settingsModelFromJson] == 0x44.toByte())
        require(bytes[settingsModelFromJson + 1] == 0x46.toByte())

        bytes[contentHelperCanAccessContent] = 0x82.toByte()
        bytes[settingsModelFromJson] = 0x84.toByte()
        bytes[settingsModelFromJson + 1] = 0x45.toByte()

        lib.writeBytes(bytes)
    }
}
