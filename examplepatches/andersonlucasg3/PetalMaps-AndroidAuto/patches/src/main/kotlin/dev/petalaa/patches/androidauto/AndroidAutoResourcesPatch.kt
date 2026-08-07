package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.resourcePatch
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Resource patch that adds the required automotive app descriptor XML resource
 * (res/xml/automotive_app_desc.xml) for Android Auto support.
 *
 * This file tells Android Auto which templates the app supports.
 *
 * The file MUST be written in [execute] (before the aapt2 resource recompile),
 * NOT in [finalize]: files written in finalize are copied raw into the APK zip
 * but never registered in resources.arsc, so @xml/automotive_app_desc would
 * not resolve and Android Auto rejects the app
 * ("CAR.VALIDATOR: Package DENIED; Uses for TEMPLATE not defined").
 */
@Suppress("unused")
val androidAutoResourcesPatch = resourcePatch(
    name = "Android Auto Resources",
    description = "Adds the automotive_app_desc.xml resource required by Android Auto.",
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        val descPath = "res/xml/automotive_app_desc.xml"
        val descContent =
            """<?xml version="1.0" encoding="utf-8"?>
<automotiveApp>
    <uses name="template"/>
</automotiveApp>
"""
        // Only write if the file doesn't already exist (idempotent).
        val destFile = this[descPath]
        if (!destFile.exists()) {
            destFile.parentFile?.mkdirs()
            destFile.writeText(descContent)
        }
    }
}
