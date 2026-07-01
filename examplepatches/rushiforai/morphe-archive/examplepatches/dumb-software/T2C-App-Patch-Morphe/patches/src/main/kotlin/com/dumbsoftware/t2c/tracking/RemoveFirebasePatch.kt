package com.dumbsoftware.t2c.tracking

import app.morphe.patcher.patch.resourcePatch
import com.dumbsoftware.t2c.COMPATIBILITY_T2C

@Suppress("unused")
val removeFirebasePatch = resourcePatch(
    name = "Remove Firebase tracking",
    description = "Removes Firebase App ID and Crashlytics API keys to disable Google tracking."
) {
    compatibleWith(COMPATIBILITY_T2C)

    execute {
        document("res/values/strings.xml").use { document ->
            val stringNodes = document.getElementsByTagName("string")
            val targetKeys = setOf("google_app_id", "google_crash_reporting_api_key", "google_api_key")
            
            (0 until stringNodes.length).forEach { i ->
                val node = stringNodes.item(i)
                val nameAttr = node.attributes.getNamedItem("name")?.nodeValue
                if (nameAttr in targetKeys) {
                    node.textContent = ""
                }
            }
        }
    }
}