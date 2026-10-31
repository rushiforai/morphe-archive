package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import org.w3c.dom.Element

private const val HUAWEI16_PIP_FRAGMENT =
    "Lcom/viettel/tv360/ui/miniplay/AlticastTopPlayerFragmentBase;"
private const val HUAWEI16_PIP_HOME =
    "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
private const val HUAWEI16_PIP_HOME_XML =
    "com.viettel.tv360.ui.home.HomeBoxActivity"
private const val HUAWEI16_PIP_NS =
    "http://schemas.android.com/apk/res/android"
private const val HUAWEI16_PIP_HELPER =
    "$HUAWEI16_PIP_FRAGMENT->morpheHuawei16UpdatePip(Lcom/viettel/tv360/ui/miniplay/AlticastTopPlayerFragmentBase;Lcom/google/android/exoplayer2/analytics/AnalyticsListener\$EventTime;ZI)V"

/**
 * Experimental PiP arming limited to video that ExoPlayer reports as playing.
 *
 * The original Huawei 1.6 APK was locally audited to confirm the
 * AlticastTopPlayerFragmentBase.onPlayerStateChanged(EventTime,boolean,int)
 * signature. ExoPlayer state 3 denotes READY, and the boolean is
 * playWhenReady. No player pause hook has yet been verified for 1.6.
 *
 * Only Android 12+ auto-enter is attempted, on the host HomeBoxActivity,
 * and only when this fragment receives playback state transitions.
 * This patch does not change streaming, DRM, native libraries, or auth.
 * It MUST be tested on-device: app pause handlers may still pause the video.
 */
private val tv360Huawei16PipRuntimePatch = bytecodePatch {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        val stateChanged = Fingerprint(
            definingClass = HUAWEI16_PIP_FRAGMENT,
            name = "onPlayerStateChanged",
            returnType = "V",
            parameters = listOf(
                "Lcom/google/android/exoplayer2/analytics/AnalyticsListener\$EventTime;",
                "Z",
                "I",
            ),
        ).method
        if (stateChanged.implementation == null) {
            throw PatchException("Huawei 1.6 PiP: player state listener has no implementation")
        }

        val fragment = mutableClassDefBy(HUAWEI16_PIP_FRAGMENT)
        if (fragment.methods.any { it.name == "morpheHuawei16UpdatePip" }) {
            throw PatchException("Huawei 1.6 PiP: helper already exists")
        }

        val helper = ImmutableMethod(
            HUAWEI16_PIP_FRAGMENT,
            "morpheHuawei16UpdatePip",
            listOf(
                ImmutableMethodParameter(HUAWEI16_PIP_FRAGMENT, null, null),
                ImmutableMethodParameter("Lcom/google/android/exoplayer2/analytics/AnalyticsListener\$EventTime;", null, null),
                ImmutableMethodParameter("Z", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(7),
        ).toMutable()
        helper.addInstructionsWithLabels(
            0,
            """
            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
            const/16 v1, 0x1f
            if-lt v0, v1, :morphe_tv360_pip_done
            invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;
            move-result-object v0
            if-eqz v0, :morphe_tv360_pip_done
            instance-of v1, v0, $HUAWEI16_PIP_HOME
            if-eqz v1, :morphe_tv360_pip_done
            invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v1
            const-string v2, "android.software.picture_in_picture"
            invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
            move-result v1
            if-eqz v1, :morphe_tv360_pip_done
            const/4 v2, 0x3
            if-ne p3, v2, :morphe_tv360_pip_disable
            if-eqz p2, :morphe_tv360_pip_disable
            const/4 v2, 0x1
            goto :morphe_tv360_pip_build
            :morphe_tv360_pip_disable
            const/4 v2, 0x0
            :morphe_tv360_pip_build
            new-instance v1, Landroid/app/PictureInPictureParams${'$'}Builder;
            invoke-direct {v1}, Landroid/app/PictureInPictureParams${'$'}Builder;-><init>()V
            invoke-virtual {v1, v2}, Landroid/app/PictureInPictureParams${'$'}Builder;->setAutoEnterEnabled(Z)Landroid/app/PictureInPictureParams${'$'}Builder;
            move-result-object v1
            invoke-virtual {v1}, Landroid/app/PictureInPictureParams${'$'}Builder;->build()Landroid/app/PictureInPictureParams;
            move-result-object v1
            invoke-virtual {v0, v1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
            :morphe_tv360_pip_done
            return-void
            """.trimIndent(),
        )
        fragment.methods.add(helper)

        // Match four contiguous parameters: this, EventTime, boolean, int.
        // Range form supports register indices above v15.
        // Keep original playback handling and every existing side effect.
        stateChanged.addInstructions(
            0,
            "invoke-static/range {p0 .. p3}, $HUAWEI16_PIP_HELPER",
        )
    }
}

/**
 * Android native PiP declaration for TV360's already-verified home activity.
 * Does not enable PiP in LoginActivity, or replace player controls.
 */
@Suppress("unused")
val tv360Huawei16PipPatch = resourcePatch(
    name = "TV360 Bitel 1.6 - Experimental Picture in Picture",
    description = "Auto-enter Android 12+ PiP only when the Alticast player reports active playback; requires device testing.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))
    dependsOn(tv360Huawei16PipRuntimePatch)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            val matches = (0 until activities.length)
                .mapNotNull { activities.item(it) as? Element }
                .filter {
                    it.getAttributeNS(HUAWEI16_PIP_NS, "name") == HUAWEI16_PIP_HOME_XML ||
                        it.getAttribute("android:name") == HUAWEI16_PIP_HOME_XML
                }
            if (matches.size != 1) {
                throw PatchException(
                    "Huawei 1.6 PiP: expected one HomeBoxActivity, found ${matches.size}"
                )
            }
            val activity = matches.single()
            val resizable = activity.getAttributeNS(HUAWEI16_PIP_NS, "resizeableActivity")
                .ifEmpty { activity.getAttribute("android:resizeableActivity") }
            if (resizable == "false" || resizable == "0") {
                throw PatchException(
                    "Huawei 1.6 PiP: HomeBoxActivity explicitly disallows resizing"
                )
            }

            val oldChanges = activity.getAttributeNS(HUAWEI16_PIP_NS, "configChanges")
                .ifEmpty { activity.getAttribute("android:configChanges") }
            if (oldChanges.matches(Regex("(0[xX][0-9a-fA-F]+|[0-9]+)"))) {
                throw PatchException(
                    "Huawei 1.6 PiP: numeric configChanges requires manual verification"
                )
            }
            val flags = oldChanges.split('|').map { it.trim() }
                .filter { it.isNotEmpty() }.toMutableSet()
            flags.addAll(listOf("screenSize", "smallestScreenSize", "screenLayout", "orientation"))

            activity.setAttributeNS(
                HUAWEI16_PIP_NS, "android:supportsPictureInPicture", "true"
            )
            activity.setAttributeNS(
                HUAWEI16_PIP_NS, "android:configChanges", flags.joinToString("|")
            )
        }
    }
}
