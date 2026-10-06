/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.analytics

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Holds back Facebook's own analytics uploads: the XAnalytics event uploader and the Papaya
 * on-device learning jobs. See AnalyticsUploadAnchors.kt for where each hook goes.
 *
 * Every anchor has to be found once: a half-applied patch would leave one sender running while the
 * switch says it's held, so a missing one stops the patch naming all of them.
 *
 * Off in the default selection: it trades Facebook's record of how the app is used for less
 * background traffic, which is a choice to make, not a fix. Picked, its switch starts on.
 */
@Suppress("unused")
val holdAnalyticsUploadsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Hold back analytics uploads",
    description = "Stops Facebook uploading its app analytics in the background and skips its on-device " +
        "learning jobs. Its switch starts on, under Privacy. Restart Facebook after changing it.",
    default = false,
) {
    category("Privacy")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val missing = mutableListOf<String>()
        fun <T> one(what: String, matches: List<T>): T? {
            if (matches.size == 1) return matches.single()
            missing += "$what (found ${matches.size})"
            return null
        }
        val jobStart = one(
            "the Papaya job's start",
            superclassChain(PAPAYA_SERVICE).mapNotNull { classDefByOrNull(it) }
                .flatMap { it.methods.filter(::isJobStart) }.take(1).toList(),
        )
        val gate = jobStart?.let(::papayaGate)
        if (jobStart != null && gate == null) missing += "the Papaya gate in ${jobStart.definingClass}->onStartJob"
        val kickOff = one(
            "XAnalytics' foreground upload",
            classDefByOrNull(APP_JOB_HANDLER)?.let { kickOffUploads(it) { type -> classDefByOrNull(type) } }.orEmpty(),
        )
        val resume = one("XAnalytics' uploader resume", classDefByOrNull(LOW_PRIORITY_INIT)?.let(::resumeUploads).orEmpty())
        if (missing.isNotEmpty()) {
            throw PatchException(
                "$PATCH: could not find " + missing.joinToString("; ") +
                    ". Applying the rest would leave that sender running, so nothing was changed.",
            )
        }
        mutable(jobStart!!).passPapayaGate(gate!!)
        mutable(kickOff!!.first).skipUploadWhenHeld(kickOff.second, KICK_OFF_UPLOAD)
        mutable(resume!!.first).skipUploadWhenHeld(resume.second, RESUME_UPLOADING)
        enableStatus("analyticsUploads")
    }
}

/** The mutable copy of [method], matched on its name, return type and parameters' descriptors. */
private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(Any::toString) == method.parameterTypes.map(Any::toString)
    }
