package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private const val APP = "Lcom/letterboxd/letterboxd/"
private const val ACTIONS = "${APP}ui/fragments/film/FilmActionsFragment;"
private const val MODEL = "${APP}ui/fragments/film/FilmViewModel"
private const val BINDING = "${APP}databinding/FragmentFilmActionsBinding;"
private const val FILM = "Lcom/letterboxd/api/model/Film;"
private const val HOOK = "Lapp/template/extension/alerts/ReleaseAlerts;"
private const val RECEIVER = "app.template.extension.alerts.ReleaseAlertReceiver"
private const val ROW = "morphe_release_alert"
private const val BELL = "morphe_release_alert_bell"

private val releaseAlertResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val bootPermission = "android.permission.RECEIVE_BOOT_COMPLETED"
            val permissions = doc.getElementsByTagName("uses-permission")
            if ((0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttribute("android:name") == bootPermission
                }) {
                doc.documentElement.appendChild(doc.createElement("uses-permission").apply {
                    setAttribute("android:name", bootPermission)
                })
            }
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.appendChild(doc.createElement("receiver").apply {
                setAttribute("android:name", RECEIVER)
                setAttribute("android:exported", "false")
                appendChild(doc.createElement("intent-filter").apply {
                    for (action in listOf("BOOT_COMPLETED", "TIME_SET", "TIMEZONE_CHANGED", "MY_PACKAGE_REPLACED")) {
                        appendChild(doc.createElement("action").apply {
                            setAttribute("android:name", "android.intent.action.$action")
                        })
                    }
                })
            })
        }
        // Reuse the native action row's typography, ripple, padding and touch target.
        document("res/layout/fragment_film_actions.xml").use { doc ->
            val buttons = doc.getElementsByTagName("Button")
            val share = (0 until buttons.length).map { buttons.item(it) as Element }
                .single { it.getAttribute("android:id") == "@id/button_share" }
            val alert = (share.cloneNode(true) as Element).apply {
                setAttribute("android:id", "@+id/$ROW")
                setAttribute("android:text", "Alert")
                setAttribute("android:visibility", "gone")
                setAttribute("app:icon", "@drawable/$BELL")
            }
            share.parentNode.insertBefore(alert, share)
        }
        get("res/drawable/$BELL.xml").writeText(
            """
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp"
                android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="@color/textColorSecondary"
                    android:pathData="M4,19v-2h2v-6c0,-2.79 1.91,-5.12 4.5,-5.79V4.5a1.5,1.5 0,0 1,3 0v0.71C16.09,5.88 18,8.21 18,11v6h2v2zM8,17h8v-6a4,4 0,0 0,-8 0zM10,20h4a2,2 0,0 1,-4 0z"
                    android:fillType="evenOdd"/>
            </vector>
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val releaseAlertsPatch = bytecodePatch(
    name = "Film release alerts",
    description = "Adds an Alert action to the film page for local notifications on selected release dates.",
) {
    compatibleWith(
        Compatibility(
            name = "Letterboxd",
            packageName = "com.letterboxd.letterboxd",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xFF8000,
            targets = listOf(AppTarget(version = "3.6.7"), AppTarget(version = "3.6.9")),
        ),
    )
    dependsOn(modSettingsPatch, releaseAlertResources, alertHistoryPatch)

    execute {
        LetterboxdApplicationOnCreateFingerprint.method.addInstruction(
            0, "invoke-static {}, $HOOK->markAvailable()V",
        )
        val contents = Fingerprint(
            definingClass = "$MODEL;",
            name = "handleContents",
            returnType = "V",
            parameters = listOf("$MODEL\$FilmResults;"),
        ).method
        val releases = contents.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference?.toString() == "$FILM->getReleases()Ljava/util/List;"
        }.index
        // The stock ViewModel has just loaded the actual Film, including its raw releases.
        contents.addInstruction(releases, "invoke-static { v1 }, $HOOK->filmLoaded(Ljava/lang/Object;)V")

        val actions = Fingerprint(
            definingClass = ACTIONS,
            name = "onViewCreated",
            returnType = "V",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
        ).method
        val goToFilm = actions.implementation!!.instructions.withIndex().first {
            (it.value as? ReferenceInstruction)?.reference?.toString() ==
                "$BINDING->buttonGoToFilm:Landroid/widget/Button;"
        }.index
        val hide = actions.implementation!!.instructions.elementAt(goToFilm + 1) as ReferenceInstruction
        check(hide.reference.toString() == "Landroid/widget/Button;->setVisibility(I)V")
        // Letterboxd takes this branch when the action sheet was opened from the film page itself.
        actions.addInstruction(goToFilm + 2, "invoke-static { p0 }, $HOOK->bind(Landroidx/fragment/app/DialogFragment;)V")
        MainActivityOnResumeFingerprint.method.addInstruction(
            0, "invoke-static/range { p0 .. p0 }, $HOOK->resume(Landroid/content/Context;)V",
        )
    }
}
