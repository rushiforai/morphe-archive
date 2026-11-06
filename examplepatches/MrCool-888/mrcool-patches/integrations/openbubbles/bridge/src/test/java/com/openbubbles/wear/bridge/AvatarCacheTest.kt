package com.openbubbles.wear.bridge

import android.Manifest
import android.app.Application
import android.graphics.Bitmap
import android.net.Uri
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import java.io.File

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class)
class AvatarCacheTest {
    private lateinit var context: Application
    private lateinit var source: File

    @Before fun setup() {
        context = RuntimeEnvironment.getApplication()
        shadowOf(context).grantPermissions(Manifest.permission.READ_CONTACTS)
        AvatarCache.clear(context)
        source = File(context.filesDir, "avatar-source.png")
    }

    private fun image(color: Int) {
        val bitmap = Bitmap.createBitmap(300, 150, Bitmap.Config.ARGB_8888)
        bitmap.eraseColor(color)
        source.outputStream().use { bitmap.compress(Bitmap.CompressFormat.PNG, 100, it) }
        bitmap.recycle()
    }

    @Test fun hashesPreparedJpegAndReflectsContentChanges() {
        image(0xffff0000.toInt())
        val first = AvatarCache.cache(context, Uri.fromFile(source))!!
        assertTrue(first.matches(Regex("avatar-[0-9a-f]{64}")))
        val info = AvatarCache.info(context, first)!!
        assertEquals("image/jpeg", info.mimeType)
        assertEquals(128, info.width)
        assertEquals(64, info.height)
        val digest = java.security.MessageDigest.getInstance("SHA-256").digest(info.file.readBytes())
            .joinToString("") { "%02x".format(it) }
        assertEquals("avatar-$digest", first)
        assertEquals(first, AvatarCache.cache(context, Uri.fromFile(source)))
        image(0xff00ff00.toInt())
        assertNotEquals(first, AvatarCache.cache(context, Uri.fromFile(source)))
    }

    @Test fun rejectsUntrustedSourcesAndInvalidIds() {
        image(0xff0000ff.toInt())
        assertNull(AvatarCache.cache(context, Uri.fromFile(File(context.cacheDir, "outside.png").apply { writeBytes(source.readBytes()) })))
        assertNull(AvatarCache.cache(context, Uri.parse("http://example.invalid/avatar.jpg")))
        assertNull(AvatarCache.cache(context, Uri.parse("content://other.example/avatar/1")))
        assertNull(AvatarCache.info(context, "../avatar-anything"))
        assertTrue(AvatarCache.ids(context).isEmpty())
    }

    @Test fun appPrivateFileWorksWithoutContactsPermissionButContactsUriDoesNot() {
        image(0xff336699.toInt())
        shadowOf(context).denyPermissions(Manifest.permission.READ_CONTACTS)
        assertNotNull(AvatarCache.cache(context, Uri.fromFile(source)))
        assertNull(AvatarCache.cache(context, Uri.parse("content://com.android.contacts/contacts/1/photo")))
    }

    @Test fun nativeGroupAvatarDirectoryIsAllowedWithoutExposingOtherNativeFiles() {
        image(0xff778899.toInt())
        val native = context.getDir("flutter", android.content.Context.MODE_PRIVATE)
        val groupPhoto = File(native, "avatars/group/icon.png").apply { parentFile!!.mkdirs(); writeBytes(source.readBytes()) }
        shadowOf(context).denyPermissions(Manifest.permission.READ_CONTACTS)
        assertNotNull(AvatarCache.cache(context, Uri.fromFile(groupPhoto)))
        val unrelated = File(native, "unrelated.png").apply { writeBytes(source.readBytes()) }
        assertNull(AvatarCache.cache(context, Uri.fromFile(unrelated)))
    }

    @Test fun cacheCapRetainsNewAvatarEvenWhenOlderFilesHaveFutureTimestamps() {
        val dir = File(context.filesDir, "openbubbles_wear_avatars").apply { mkdirs() }
        repeat(200) { index ->
            File(dir, "avatar-${index.toString(16).padStart(64, '0')}.jpg").apply {
                writeBytes(ByteArray(16))
                setLastModified(System.currentTimeMillis() + 100_000L)
            }
        }
        image(0xff123456.toInt())
        val newest = AvatarCache.cache(context, Uri.fromFile(source))!!
        assertEquals(200, AvatarCache.ids(context).size)
        assertNotNull(AvatarCache.info(context, newest))
    }
}
