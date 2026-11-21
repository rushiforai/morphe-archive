package patches.rox

import app.morphe.patcher.patch.resourcePatch

/*
 * ROX 3.0.14's <application> element carries two android:name attributes:
 *   android:name=".MyApplication"                       (the app's own Application)
 *   android:name="com.pairip.application.Application"    (PairIP's licence wrapper)
 *
 * The binary manifest tolerates the duplicate, but as soon as any patch parses the decoded
 * manifest as XML the strict DOM parser rejects it ("Attribute android:name was already
 * specified for element application"), which aborts the whole patch run on the user's device.
 *
 * com.pairip.application.Application extends com.jazz.rox.MyApplication and only adds the
 * licence check (which "Bypass Play Store check" neutralises) before chaining to the real
 * Application, so the PairIP name is the complete, correct one. We drop the stray
 * ".MyApplication" duplicate in execute {} (raw text, before any DOM parse) and keep PairIP's.
 * The strip only happens when both names are present, so a build that ships a single name is
 * left untouched.
 */
internal val fixApplicationNamePatch = resourcePatch {
    execute {
        val manifest = get("AndroidManifest.xml", false)
        var text = manifest.readText()

        val pairipName = "android:name=\"com.pairip.application.Application\""
        if (!text.contains(pairipName)) return@execute

        var changed = false
        for (duplicate in listOf(
            "android:name=\".MyApplication\"",
            "android:name=\"com.jazz.rox.MyApplication\"",
        )) {
            if (text.contains(duplicate)) {
                // Drop the attribute together with any whitespace that precedes it, so the
                // remaining attributes stay well-formed.
                text = text.replace(Regex("""\s*${Regex.escape(duplicate)}"""), "")
                changed = true
            }
        }

        if (changed) manifest.writeText(text)
    }
}
