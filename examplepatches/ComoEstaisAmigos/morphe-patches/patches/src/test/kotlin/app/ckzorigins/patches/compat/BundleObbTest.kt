package app.ckzorigins.patches.compat

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class BundleObbTest {
    @Test
    fun `unsafe OBB paths are refused and so files under assets libs move to lib`() {
        assertEquals(
            "lib/armeabi-v7a/libunity.so",
            remapObbEntry("assets/libs/armeabi-v7a/libunity.so"),
        )
        assertEquals(
            "lib/armeabi-v7a/libmono.so",
            remapObbEntry("assets/libs/armeabi-v7a/libmono.so"),
        )
        assertEquals(
            "assets/bin/Data/Managed/Assembly-CSharp.dll",
            remapObbEntry("assets/bin/Data/Managed/Assembly-CSharp.dll"),
        )
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            remapObbEntry("../lib/armeabi-v7a/libunity.so")
        }
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            remapObbEntry("/tmp/libunity.so")
        }
    }
}
