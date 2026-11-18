package patches.shared

import java.io.File
import java.security.MessageDigest

/** Remove the paper tab before the app builds its dense tab/index mapping. */
internal fun removeMediahuisNewspaperTab(file: File) {
    val original = file.readBytes()
    val digest = MessageDigest.getInstance("SHA-256").digest(original)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    check(digest == "39f770f3fbc74929b29aecf93ee32bfb519fea3c1df0652d5f98df3c61443365") {
        "Unsupported Mediahuis bottom navigation"
    }
    val tab = """|    {
        |        "name": "TAB_PAPER_TITLE",
        |        "icon": "newspaper.icon",
        |        "selectedIcon": "",
        |        "deeplink": "onep://epaper"
        |    },
        |""".trimMargin()
    val text = original.toString(Charsets.UTF_8)
    check(text.indexOf(tab) >= 0 && text.indexOf(tab) == text.lastIndexOf(tab)) {
        "Expected one original newspaper tab"
    }
    file.writeText(text.replace(tab, ""))
}
