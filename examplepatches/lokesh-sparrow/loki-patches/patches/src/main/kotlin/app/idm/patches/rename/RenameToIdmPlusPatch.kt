/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.idm.patches.rename

import app.idm.patches.menu.idmMenuRowPatch
import app.idm.patches.shared.Constants.COMPATIBILITY_IDM
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.patch.resourcePatch

/**
 * The app's old name. 1DM was IDM+ until version 13; this puts the name back. Every language's strings are rewritten,
 * so the launcher label, the title bar and the texts that mention the app all agree. "1DM+" and "1DM" both become
 * "IDM+", never "IDM++". The package name is left alone.
 */
private val NAME = Regex("""1DM\+?""")

@Suppress("unused")
val renameToIdmPlusPatch = resourcePatch(
    name = "Rename to IDM+",
    description = "Shows the app as IDM+ instead of 1DM, in the launcher and everywhere inside the app.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_IDM)
    dependsOn(menuFlagPatch("app.loki.menu.rename"))
    dependsOn(idmMenuRowPatch)

    execute {
        val res = get("res")
        val dirs = res.listFiles { file -> file.isDirectory && file.name.startsWith("values") }.orEmpty()
        for (dir in dirs) {
            if (!dir.resolve("strings.xml").isFile) continue
            document("res/${dir.name}/strings.xml").use { document ->
                val nodes = document.getElementsByTagName("string")
                for (i in 0 until nodes.length) {
                    val node = nodes.item(i)
                    val text = node.textContent
                    if (!text.contains("1DM")) continue
                    node.textContent = NAME.replace(text, "IDM+")
                }
            }
        }
    }
}
