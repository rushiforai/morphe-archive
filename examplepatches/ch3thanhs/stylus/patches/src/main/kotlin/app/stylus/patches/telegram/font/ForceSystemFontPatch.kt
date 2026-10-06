package app.stylus.patches.telegram.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.stylus.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM
import app.stylus.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM_WEB
import org.w3c.dom.Element

private const val EXTENSION_CLASS =
    "Lapp/stylus/extension/telegram/patches/ForceSystemFontPatch;"

/**
 * Rewrites XML font-family references that explicitly point at a bundled
 * @font resource.
 *
 * Telegram's current XML files mostly use Android system families such as
 * "sans-serif-medium", so those are intentionally left unchanged.
 *
 * This mainly protects the patch against future Telegram releases which
 * move more typography into XML resources.
 */
private val forceSystemFontTelegramXmlPatch = resourcePatch(
    name = "Force system font XML (Telegram)",
    description =
        "Replaces Telegram bundled @font XML font-family references with the " +
            "Android system sans-serif family.",
    default = true,
) {
    compatibleWith(
    COMPATIBILITY_TELEGRAM,
    COMPATIBILITY_TELEGRAM_WEB,
)

    execute {
        val resDir = get("res")

        if (!resDir.exists()) {
            throw PatchException("Telegram res directory was not found.")
        }

        val xmlFiles = resDir.walkTopDown()
            .filter { file ->
                file.isFile &&
                    file.extension.equals("xml", ignoreCase = true)
            }
            .toList()

        val documentFactory =
            javax.xml.parsers.DocumentBuilderFactory.newInstance().apply {
                isNamespaceAware = true
            }

        for (xmlFile in xmlFiles) {
            val document = try {
                documentFactory.newDocumentBuilder().parse(xmlFile)
            } catch (_: Exception) {
                // Some resource XML may not be suitable for DOM parsing.
                // Leave those untouched rather than making the whole patch fail.
                continue
            }

            var changed = false

            /*
             * Case 1:
             *
             * <TextView
             *     android:fontFamily="@font/telegram_font" />
             */
            val elements = document.getElementsByTagName("*")

            for (index in 0 until elements.length) {
                val element = elements.item(index) as? Element ?: continue

                if (element.hasAttributeNS(
                        "http://schemas.android.com/apk/res/android",
                        "fontFamily"
                    )
                ) {
                    val value = element.getAttributeNS(
                        "http://schemas.android.com/apk/res/android",
                        "fontFamily"
                    ).trim()

                    if (value.startsWith("@font/")) {
                        element.setAttributeNS(
                            "http://schemas.android.com/apk/res/android",
                            "android:fontFamily",
                            "sans-serif",
                        )
                        changed = true
                    }
                }

                /*
                 * Case 2:
                 *
                 * <item name="android:fontFamily">@font/foo</item>
                 */
                if (element.tagName == "item" &&
                    element.getAttribute("name") == "android:fontFamily"
                ) {
                    val value = element.textContent?.trim().orEmpty()

                    if (value.startsWith("@font/")) {
                        element.textContent = "sans-serif"
                        changed = true
                    }
                }
            }

            if (!changed) {
                continue
            }

            val transformerFactory =
                javax.xml.transform.TransformerFactory.newInstance()
            val transformer = transformerFactory.newTransformer()

            transformer.setOutputProperty(
                javax.xml.transform.OutputKeys.OMIT_XML_DECLARATION,
                "no",
            )
            transformer.setOutputProperty(
                javax.xml.transform.OutputKeys.ENCODING,
                "utf-8",
            )

            transformer.transform(
                javax.xml.transform.dom.DOMSource(document),
                javax.xml.transform.stream.StreamResult(xmlFile),
            )
        }
    }
}

@Suppress("unused")
val forceSystemFontTelegramPatch = bytecodePatch(
    name = "Force system font (Telegram)",
    description =
        "Renders the app using the device's system font instead of Telegram's bundled font.",
    default = true,
) {
    category("Font")

    compatibleWith(
    COMPATIBILITY_TELEGRAM,
    COMPATIBILITY_TELEGRAM_WEB,
)

    dependsOn(forceSystemFontTelegramXmlPatch)

    extendWith("extensions/extension.mpe")

    execute {
        AndroidUtilitiesGetTypefaceFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS->getSystemTypeface(Ljava/lang/String;)Landroid/graphics/Typeface;
                move-result-object v0
                if-eqz v0, :original
                return-object v0
                :original
                nop
            """.trimIndent(),
        )
    }
}