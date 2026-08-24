package com.dr4w.patches.nextgp.misc

import app.morphe.patcher.patch.resourcePatch
import com.dr4w.patches.nextgp.shared.Constants.COMPATIBILITY_NEXTGP

@Suppress("unused")
val networkSecurityPatch = resourcePatch(
    name = "Trust user certificates",
    description = "Allows user-installed certificates to be trusted for debugging.",
    default = false
) {
    compatibleWith(COMPATIBILITY_NEXTGP)

    execute {
        // Crea il file network_security_config.xml
        val networkSecurityConfig = this["res/xml/network_security_config.xml"]
        networkSecurityConfig.parentFile?.mkdirs()
        networkSecurityConfig.writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true">
        <trust-anchors>
            <certificates src="system"/>
            <certificates src="user"/>
        </trust-anchors>
    </base-config>
</network-security-config>"""
        )

        // Aggiunge il riferimento nel AndroidManifest.xml
        document("AndroidManifest.xml").use { document ->
            val applicationNode = document
                .getElementsByTagName("application")
                .item(0)
            applicationNode.attributes
                .setNamedItem(document.createAttribute("android:networkSecurityConfig").apply {
                    value = "@xml/network_security_config"
                })
        }
    }
}