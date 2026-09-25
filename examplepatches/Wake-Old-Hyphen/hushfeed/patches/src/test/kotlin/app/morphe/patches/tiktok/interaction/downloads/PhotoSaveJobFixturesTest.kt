package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The photo save job Original Photo Mode hooks, held to every retained fixture through the
 * fingerprint's own predicate ([isPhotoSaveJob]). On 47.0.3 a photo post's Download never reaches
 * the video download start the older hook sits on, so with the switch on nothing of it ran (the
 * S22, 2026-09-23); every photo save runs this job instead. Exactly one method has its shape on
 * each build, and on 47.0.3 it is the one that logs the job it starts.
 */
class PhotoSaveJobFixturesTest {
    @Test
    fun `every fixture has exactly one photo save job`() {
        for (apk in Fixtures.apks()) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val jobs = container.dexEntryNames.flatMap { entry ->
                container.getEntry(entry)!!.dexFile.classes.flatMap { classDef ->
                    classDef.methods.filter { it.isPhotoSaveJob(classDef) }
                }
            }
            assertEquals("${apk.name}: photo save jobs ${jobs.map { "${it.definingClass}->${it.name}" }}", 1, jobs.size)
            val job = jobs.single()
            assertTrue("${apk.name}: the job has a body to hook", job.implementation != null)
            if (apk.name.contains("47.0.3")) {
                val strings = job.implementation!!.instructions.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                }
                assertTrue("${apk.name}: the job logs the save it starts, got $strings", "initializeJob aid=" in strings)
            }
        }
    }
}
