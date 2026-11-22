package app.template.patches.letterboxd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private const val ROW = "Lcom/letterboxd/letterboxd/ui/fragments/film/WhereToWatchFragment"
private const val DETAIL = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmAvailabilityFragment;"
private const val FILM = "Lcom/letterboxd/api/model/Film;"
private const val HOOK = "Lapp/template/extension/watch/WatchHooks;"

private val watchAlertResources = resourcePatch {
    execute {
        ratingLogos.forEach { (source, xml) ->
            get("res/drawable/morphe_rating_$source.xml").writeText(xml)
        }
        document("AndroidManifest.xml").use { doc ->
            val permissions = doc.getElementsByTagName("uses-permission")
            val boot = "android.permission.RECEIVE_BOOT_COMPLETED"
            if ((0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttribute("android:name") == boot
                }) {
                doc.documentElement.appendChild(doc.createElement("uses-permission").apply {
                    setAttribute("android:name", boot)
                })
            }
            doc.getElementsByTagName("application").item(0).appendChild(doc.createElement("service").apply {
                setAttribute("android:name", "app.template.extension.watch.WatchAlertJob")
                setAttribute("android:exported", "true")
                setAttribute("android:permission", "android.permission.BIND_JOB_SERVICE")
            })
        }
        get("res/drawable/morphe_stream_alert_bell.xml").writeText(
            """
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp" android:height="24dp"
                android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="@android:color/white" android:fillType="evenOdd"
                    android:pathData="M4,19v-2h2v-6c0,-2.79 1.91,-5.12 4.5,-5.79V4.5a1.5,1.5 0,0 1,3 0v0.71C16.09,5.88 18,8.21 18,11v6h2v2zM8,17h8v-6a4,4 0,0 0,-8 0zM10,20h4a2,2 0,0 1,-4 0z" />
            </vector>
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val whereToWatchPatch = bytecodePatch(
    name = "Where to Watch",
    description = "Shows JustWatch offers for streaming services you select in the film’s Availability page.",
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
    dependsOn(modSettingsPatch, watchAlertResources, alertHistoryPatch)

    execute {
        MainActivityOnResumeFingerprint.method.addInstruction(
            0, "invoke-static/range { p0 .. p0 }, $HOOK->resume(Landroid/content/Context;)V",
        )
        val emitter = ROW + "\$onViewCreated\$1\$1\$1;"
        val film = Fingerprint(
            definingClass = emitter,
            name = "emit",
            returnType = "Ljava/lang/Object;",
            parameters = listOf(FILM, "Lkotlin/coroutines/Continuation;"),
        ).method
        val rowRead = film.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference?.toString() == "$emitter->\$view:Landroid/view/View;"
        }.index
        film.addInstruction(rowRead + 1, "invoke-static { p2, p1 }, $HOOK->bindRow(Landroid/view/View;Ljava/lang/Object;)V")

        // Keep the host row visibility and click destination. Its icons are supplied by the local picker.
        Fingerprint(
            definingClass = "$ROW;",
            name = "updateServicesIcons",
            returnType = "V",
            parameters = listOf("Z", "Ljava/util/List;"),
        ).method.addInstruction(0, "return-void")

        val detail = Fingerprint(
            definingClass = DETAIL,
            name = "onViewCreated",
            returnType = "V",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
        ).method
        detail.addInstructionsWithLabels(
            0,
            """
                invoke-direct { p0 }, $DETAIL->getFilmID()Ljava/lang/String;
                move-result-object v0
                invoke-static { p0, p1, v0 }, $HOOK->bindDetail(Landroidx/fragment/app/Fragment;Landroid/view/View;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :stock
                return-void
                :stock
                nop
            """,
        )
    }
}
