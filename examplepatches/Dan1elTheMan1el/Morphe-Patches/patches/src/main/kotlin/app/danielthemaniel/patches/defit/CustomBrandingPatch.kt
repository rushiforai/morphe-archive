package app.danielthemaniel.patches.defit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/**
 * DeFit 0.9.3 constructs its action-bar title in bytecode as:
 *
 *     "<app_name> 0.9.3 - <app_name_full>"
 *
 * The old resource-only branding approach therefore cannot set an arbitrary
 * title on 0.9.3. This hidden dependency reapplies our custom header from a
 * resource in onResume(). 0.8.2a is left untouched.
 */
private val customBranding093BytecodePatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_DEFIT)

    execute {
        val mainActivity = mutableClassDefBy(
            "Lcom/googlefit/tester/MainActivity;"
        )

        val is093 = mainActivity.methods.any {
            it.name == "updateUI"
        }

        if (is093) {
            mainActivity.methods
                .first {
                    it.name == "onResume" &&
                        it.parameterTypes.isEmpty() &&
                        it.returnType == "V"
                }
                .addInstructions(
                    0,
                    """
                    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                    move-result-object v0

                    const-string v1, "com.fitness.debugger:string/defit_patched_header"
                    const/4 v2, 0x0
                    invoke-virtual {v0, v1, v2, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                    move-result v1

                    if-eqz v1, :patch_branding_title_done

                    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                    move-result-object v0
                    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

                    :patch_branding_title_done
                    """.trimIndent()
                )
        }
    }
}

@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom Branding",
    description = "Changes DeFit's app name, header title, and displayed version.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)
    dependsOn(customBranding093BytecodePatch)

    val appNameOption = stringOption(
        key = "appName",
        title = "App name",
        description = "Launcher/app display name.",
        required = true,
        default = "DeFit++",
    )

    val headerOption = stringOption(
        key = "topBarText",
        title = "Top bar text",
        description = "Text shown in DeFit's top action bar.",
        required = true,
        default = "DeFit++ - Unlimited Debugging",
    )

    val versionOption = stringOption(
        key = "version",
        title = "Version",
        description = "Version text shown in the app. Use \"auto\" to display the patched target version automatically.",
        required = true,
        default = "auto",
    )

    execute {
        val appName = appNameOption.value ?: "DeFit++"
        val header = headerOption.value ?: "DeFit++ - Unlimited Debugging"
        val configuredVersion = versionOption.value ?: "auto"

        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            var patchedHeaderResource: Element? = null

            for (i in 0 until strings.length) {
                val string = strings.item(i) as? Element ?: continue

                when (string.getAttribute("name")) {
                    "app_name",
                    "app_name_debug",
                    "app_name_release" -> string.textContent = appName

                    // 0.8.2a reads this directly for its action-bar title.
                    "app_name_full" -> string.textContent = header

                    "defit_patched_header" -> patchedHeaderResource = string
                }
            }

            // 0.9.3's hidden bytecode dependency reads this at runtime.
            if (patchedHeaderResource != null) {
                patchedHeaderResource!!.textContent = header
            } else {
                val string = document.createElement("string")
                string.setAttribute("name", "defit_patched_header")
                string.textContent = header
                document.documentElement.appendChild(string)
            }
        }

        document("res/layout/activity_main.xml").use { document ->
            val nodes = document.getElementsByTagName("*")
            var stockVersion: Element? = null
            var rootScroll: Element? = null

            for (i in 0 until nodes.length) {
                val element = nodes.item(i) as? Element ?: continue

                when (element.getAttribute("android:id")) {
                    "@+id/version", "@id/version" -> stockVersion = element
                    "@+id/scroll", "@id/scroll" -> rootScroll = element
                }
            }

            stockVersion?.let { original ->
                val parent = original.parentNode

                // 0.9.3 moved its main content into a root-level ScrollView
                // and leaves the stock version TextView hidden at the root.
                val is093Layout =
                    rootScroll != null && rootScroll!!.parentNode == parent

                val version = if (
                    configuredVersion.equals("auto", ignoreCase = true)
                ) {
                    if (is093Layout) "0.9.3-patched" else "0.8.2a-patched"
                } else {
                    configuredVersion
                }

                val patched = original.cloneNode(true) as Element

                // Leave the stock view available for whatever the original app
                // writes to it, but make it take no visible/layout space.
                original.setAttribute("android:visibility", "gone")
                original.setAttribute("android:layout_width", "0dp")
                original.setAttribute("android:layout_height", "0dp")

                patched.setAttribute(
                    "android:id",
                    "@+id/defit_patched_version_display"
                )
                patched.setAttribute("android:text", version)
                patched.setAttribute("android:visibility", "visible")

                if (is093Layout) {
                    // In 0.9.3 the stock version view is top-left and hidden.
                    // Put our visible version between the scrollable content
                    // and the bottom ad barrier instead.
                    patched.setAttribute(
                        "android:layout_width",
                        "wrap_content"
                    )
                    patched.setAttribute(
                        "android:layout_height",
                        "wrap_content"
                    )

                    listOf(
                        "app:layout_constraintTop_toTopOf",
                        "app:layout_constraintTop_toBottomOf",
                        "app:layout_constraintBottom_toTopOf",
                        "app:layout_constraintBottom_toBottomOf",
                        "app:layout_constraintStart_toStartOf",
                        "app:layout_constraintStart_toEndOf",
                        "app:layout_constraintEnd_toStartOf",
                        "app:layout_constraintEnd_toEndOf",
                        "app:layout_constraintLeft_toLeftOf",
                        "app:layout_constraintLeft_toRightOf",
                        "app:layout_constraintRight_toLeftOf",
                        "app:layout_constraintRight_toRightOf",
                    ).forEach(patched::removeAttribute)

                    patched.setAttribute(
                        "app:layout_constraintStart_toStartOf",
                        "parent"
                    )
                    patched.setAttribute(
                        "app:layout_constraintEnd_toEndOf",
                        "parent"
                    )
                    patched.setAttribute(
                        "app:layout_constraintBottom_toTopOf",
                        "@id/adBarrier"
                    )
                    patched.setAttribute(
                        "android:layout_marginBottom",
                        "4dp"
                    )

                    rootScroll!!.removeAttribute(
                        "app:layout_constraintBottom_toBottomOf"
                    )
                    rootScroll!!.removeAttribute(
                        "app:layout_constraintBottom_toTopOf"
                    )
                    rootScroll!!.setAttribute(
                        "app:layout_constraintBottom_toTopOf",
                        "@id/defit_patched_version_display"
                    )
                }

                parent.insertBefore(
                    patched,
                    original.nextSibling
                )
            }
        }
    }
}
