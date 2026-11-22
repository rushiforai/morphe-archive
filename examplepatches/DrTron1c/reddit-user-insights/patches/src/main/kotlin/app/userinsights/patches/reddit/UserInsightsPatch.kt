package app.userinsights.patches.reddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.userinsights.patches.reddit.Constants.COMPATIBILITY_REDDIT

private const val EXTENSION_PACKAGE = "app.userinsights.extension"
private const val EXTENSION_CLASS = "Lapp/userinsights/extension/UserInsights;"

private const val A11Y_CONFIG_NAME = "user_insights_accessibility"
private const val A11Y_DESCRIPTION_NAME = "user_insights_a11y_description"

/**
 * Reddit's main activity. The class name is not obfuscated
 * (the official Morphe Reddit patches hook the same method).
 */
internal object RedditMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/launch/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
)

/**
 * Adds the accessibility service, the archive screen and the settings screen to the app.
 */
private val userInsightsResourcesPatch = patch {
    execute {
        // Accessibility service configuration.
        // The package filter is set at runtime, so the patch also works with a renamed/cloned app.
        resourceFile("res/xml/$A11Y_CONFIG_NAME.xml", false).apply {
            parentFile.mkdirs()
            writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <accessibility-service xmlns:android="http://schemas.android.com/apk/res/android"
                    android:accessibilityEventTypes="typeWindowStateChanged|typeWindowContentChanged|typeViewScrolled"
                    android:accessibilityFeedbackType="feedbackGeneric"
                    android:accessibilityFlags="flagReportViewIds"
                    android:canRetrieveWindowContent="true"
                    android:notificationTimeout="100"
                    android:description="@string/$A11Y_DESCRIPTION_NAME" />
                """.trimIndent()
            )
        }

        resourceXml("res/values/strings.xml", copy = false).use { strings ->
            strings.root.appendChild("string") {
                setAttribute("name", A11Y_DESCRIPTION_NAME)
                // No apostrophes or quotes here: Android string resources would need them escaped.
                text = "Shows the 3 subreddits each user is most active in next to their name, " +
                    "and a button to see the archived activity of hidden profiles. " +
                    "It only reads the screens of this Reddit app. Data comes from the public Arctic Shift archive."
            }
        }

        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()

            application.appendChild("service") {
                setAttribute("android:name", "$EXTENSION_PACKAGE.InsightsAccessibilityService")
                setAttribute("android:label", "Reddit User Insights")
                setAttribute("android:permission", "android.permission.BIND_ACCESSIBILITY_SERVICE")
                setAttribute("android:exported", "true")
                appendChild("intent-filter") {
                    appendChild("action") {
                        setAttribute("android:name", "android.accessibilityservice.AccessibilityService")
                    }
                }
                appendChild("meta-data") {
                    setAttribute("android:name", "android.accessibilityservice")
                    setAttribute("android:resource", "@xml/$A11Y_CONFIG_NAME")
                }
            }

            application.appendChild("activity") {
                setAttribute("android:name", "$EXTENSION_PACKAGE.ArchiveActivity")
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
                setAttribute(
                    "android:configChanges",
                    "orientation|screenSize|screenLayout|smallestScreenSize|keyboardHidden|uiMode"
                )
            }

            application.appendChild("activity") {
                setAttribute("android:name", "$EXTENSION_PACKAGE.SettingsActivity")
                setAttribute("android:label", "User Insights")
                setAttribute("android:exported", "true")
                setAttribute("android:taskAffinity", "$EXTENSION_PACKAGE.settings")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
                setAttribute("android:windowSoftInputMode", "adjustResize")
            }

            // Separate launcher icon for the settings screen. It can be hidden from the settings screen.
            application.appendChild("activity-alias") {
                setAttribute("android:name", "$EXTENSION_PACKAGE.SettingsLauncher")
                setAttribute("android:targetActivity", "$EXTENSION_PACKAGE.SettingsActivity")
                setAttribute("android:label", "User Insights")
                setAttribute("android:exported", "true")
                setAttribute("android:enabled", "true")
                appendChild("intent-filter") {
                    appendChild("action") {
                        setAttribute("android:name", "android.intent.action.MAIN")
                    }
                    appendChild("category") {
                        setAttribute("android:name", "android.intent.category.LAUNCHER")
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val userInsightsPatch = patch(
    name = "User insights",
    description = "Shows each user's top 3 subreddits next to their name and unhides hidden profiles.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(userInsightsResourcesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        RedditMainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onMainActivityCreate(Landroid/app/Activity;)V"
        )
    }
}
