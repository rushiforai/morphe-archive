package com.openbubbles.wear.patch;

import android.app.Application;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.net.Uri;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Files;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class)
public class CompanionMediaProviderTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void onlyCanonicalGuidUrisAreAccepted() throws Exception {
        String guid = "A0B1C2D3-1234-5678-90AB-ABCDEF123456";
        Uri uri = CompanionMediaProvider.uriFor(guid);
        assertEquals(guid, CompanionMediaProvider.attachmentGuid(uri));
        for (String invalid : new String[]{"", "../secret", "a/b", "a%2fb", "a.b", "a\\b", "a\nb", "a".repeat(201)}) {
            assertFalse(invalid, CompanionMediaProvider.validAttachmentGuid(invalid));
        }
        for (String invalid : new String[]{"file:///attachment/ABC", "content://wrong/attachment/ABC",
                "content://" + CompanionMediaProvider.AUTHORITY + "/attachment/ABC/extra",
                uri + "?path=/data/private", uri + "#fragment",
                "content://" + CompanionMediaProvider.AUTHORITY + "/attachment/%41BC",
                "content://" + CompanionMediaProvider.AUTHORITY + "/attachment/..%2fsecret"}) {
            assertThrows(invalid, FileNotFoundException.class,
                    () -> CompanionMediaProvider.attachmentGuid(Uri.parse(invalid)));
        }
    }

    @Test public void confinesFilesToDownloadedAttachmentDirectory() throws Exception {
        File root = temporary.newFolder("attachments");
        File nested = new File(root, "guid");
        assertTrue(nested.mkdir());
        File image = new File(nested, "photo.gif");
        Files.write(image.toPath(), new byte[]{1, 2, 3});
        assertEquals(image.getCanonicalFile(), CompanionMediaProvider.containedFile(root, image));
        assertTrue(CompanionMediaProvider.hasReadableFile(root, image.getAbsolutePath()));
        assertFalse(CompanionMediaProvider.hasReadableFile(root, null));
        assertFalse(CompanionMediaProvider.hasReadableFile(root, new File(root, "missing").getAbsolutePath()));
        assertFalse(CompanionMediaProvider.hasReadableFile(root, nested.getAbsolutePath()));
        File other = temporary.newFolder("attachments-other");
        File secret = new File(other, "secret.gif");
        Files.write(secret.toPath(), new byte[]{4});
        assertThrows(FileNotFoundException.class, () -> CompanionMediaProvider.containedFile(root, secret));
        assertThrows(FileNotFoundException.class, () -> CompanionMediaProvider.containedFile(root,
                new File(root, "../attachments-other/secret.gif")));
        assertThrows(FileNotFoundException.class, () -> CompanionMediaProvider.containedFile(root, root));
        assertThrows(FileNotFoundException.class, () -> CompanionMediaProvider.containedFile(root, nested));
        assertThrows(FileNotFoundException.class, () -> CompanionMediaProvider.containedFile(root, new File(root, "missing")));
    }

    @Test public void rejectsWriteModesAndNonImageMimeTypes() {
        CompanionMediaProvider.requireReadMode("r");
        for (String mode : new String[]{"w", "rw", "rwt", "wa", "wt", "", null}) {
            assertThrows(SecurityException.class, () -> CompanionMediaProvider.requireReadMode(mode));
        }
        assertEquals("image/gif", CompanionMediaProvider.imageMime("IMAGE/GIF"));
        assertEquals("image/jpeg", CompanionMediaProvider.imageMime("image/jpeg"));
        assertEquals("image/heic", CompanionMediaProvider.imageMime("image/heic-sequence"));
        assertEquals("image/heif", CompanionMediaProvider.imageMime("IMAGE/HEIF-SEQUENCE"));
        assertNull(CompanionMediaProvider.imageMime("text/plain"));
        assertNull(CompanionMediaProvider.imageMime("image/svg+xml"));
        assertNull(CompanionMediaProvider.imageMime("image/gif\r\ntext/plain"));
    }

    @Test public void rejectsSymlinkEscapingAttachmentDirectory() throws Exception {
        File root = temporary.newFolder("attachments");
        File secret = temporary.newFile("secret.gif");
        File link = new File(root, "linked.gif");
        try {
            Files.createSymbolicLink(link.toPath(), secret.toPath());
        } catch (UnsupportedOperationException | java.io.IOException | SecurityException e) {
            org.junit.Assume.assumeNoException("Host cannot create symlinks", e);
        }
        assertThrows(FileNotFoundException.class, () -> CompanionMediaProvider.containedFile(root, link));
    }

    @Test public void disabledBridgeRejectsEveryMediaEntryPointBeforeDatabaseAccess() {
        PatchSettings.setEnabled(RuntimeEnvironment.getApplication(), false);
        CompanionMediaProvider provider = new CompanionMediaProvider();
        ProviderInfo info = new ProviderInfo();
        info.authority = CompanionMediaProvider.AUTHORITY;
        provider.attachInfo(RuntimeEnvironment.getApplication(), info);
        Uri uri = CompanionMediaProvider.uriFor("ABC");
        assertTrue(provider.onCreate());
        assertThrows(SecurityException.class, () -> provider.openFile(uri, "r"));
        assertThrows(SecurityException.class, () -> provider.getType(uri));
        assertThrows(SecurityException.class, () -> provider.query(uri, null, null, null, null));
        assertThrows(SecurityException.class, () -> provider.insert(uri, new ContentValues()));
        assertThrows(SecurityException.class, () -> provider.update(uri, new ContentValues(), null, null));
        assertThrows(SecurityException.class, () -> provider.delete(uri, null, null));
        assertNull(provider.getTypeAnonymous(uri));
    }

    @Test public void sameUidProviderPassesCallerCheckAndRemainsReadOnly() {
        Context context = RuntimeEnvironment.getApplication();
        assertTrue(CompanionMediaProvider.isSameUid(android.os.Process.myUid()));
        assertFalse(CompanionMediaProvider.isSameUid(android.os.Process.myUid() + 1));
        PatchSettings.setEnabled(context, true);
        CompanionMediaProvider provider = new CompanionMediaProvider();
        ProviderInfo providerInfo = new ProviderInfo();
        providerInfo.authority = CompanionMediaProvider.AUTHORITY;
        provider.attachInfo(context, providerInfo);
        assertThrows(UnsupportedOperationException.class, () -> provider.query(CompanionMediaProvider.uriFor("ABC"), null, null, null, null));
        assertThrows(UnsupportedOperationException.class, () -> provider.insert(CompanionMediaProvider.uriFor("ABC"), new ContentValues()));
    }
}
