package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import java.nio.ByteBuffer
import java.nio.ByteOrder
import kotlin.test.*

class ControllerThrowAnglePatchTest {
    private fun payload() = controllerVelocityFrameLibrary(false)

    @Test fun `exact native builds only with user default and dependency`() {
        val patch = controllerThrowAnglePatch
        assertFalse(patch.default)
        assertEquals(13, patch.options["throwAngleDegrees"].default)
        assertEquals(50, CONTROLLER_THROW_ANGLE_MAX)
        assertEquals(setOf(controllerVelocityFramePatch), patch.dependencies.toSet())
        assertEquals(setOf("2.0.23" to 5002363, "2.0.24" to 5002395, "2.0.24" to 5002527),
            patch.compatibility.orEmpty().flatMap { it.targets }.map {
                it.version to it.versionCodes!!.values.toSet().single()
            }.toSet())
        for ((v,c) in listOf("2.0.23" to "5002363", "2.0.24" to "5002395", "2.0.24" to "5002527")) {
            assertTrue(isControllerThrowAngleBuild("com.valvesoftware.steamlinkvr",v,c))
            assertFalse(isControllerThrowAngleBuild("cn.vr4p.oculus4xvrplayerov",v,c))
        }
        for ((v,c) in listOf("2.0.22" to "5002244", "2.0.23" to "5002395", "2.0.24" to "5002363"))
            assertFalse(isControllerThrowAngleBuild("com.valvesoftware.steamlinkvr",v,c))
    }

    @Test fun `zero preserves baseline and option transitions change only linear angle`() {
        val base = payload()
        val offset = base.angularVelocityConfigOffset(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC)
        assertContentEquals(base, base.withControllerThrowAngle(0))
        for (angle in listOf(13,50,0)) {
            val changed = base.withControllerThrowAngle(50).withControllerThrowAngle(angle)
            assertEquals(angle, ByteBuffer.wrap(changed).order(ByteOrder.LITTLE_ENDIAN).getInt(offset+24))
            assertContentEquals(changed, changed.withControllerThrowAngle(angle))
            assertTrue(base.indices.filter { base[it]!=changed[it] }.all { it in offset+24..offset+27 })
            assertFalse(changed.angularVelocityWorld(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC))
        }
        assertFailsWith<PatchException> { base.withControllerThrowAngle(-1) }
        assertFailsWith<PatchException> { base.withControllerThrowAngle(51) }
    }

    @Test fun `old malformed and duplicate configs fail closed`() {
        val base = payload()
        val offset = base.angularVelocityConfigOffset(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC)
        for ((field,value) in listOf(16 to 2, 20 to 2, 24 to 51, 28 to 0)) {
            val invalid = base.copyOf()
            ByteBuffer.wrap(invalid).order(ByteOrder.LITTLE_ENDIAN).putInt(offset+field,value)
            assertFailsWith<PatchException> { invalid.withControllerThrowAngle(13) }
        }
        assertFailsWith<PatchException> { base.copyOfRange(0,offset+31).withControllerThrowAngle(13) }
        assertFailsWith<PatchException> { (base+CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC.encodeToByteArray()).withControllerThrowAngle(13) }
        assertFailsWith<PatchException> { ByteArray(32).withControllerThrowAngle(13) }
    }
}
