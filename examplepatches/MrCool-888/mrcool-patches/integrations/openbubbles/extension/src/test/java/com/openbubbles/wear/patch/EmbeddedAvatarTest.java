package com.openbubbles.wear.patch;

import android.app.Application;
import java.lang.reflect.Method;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32, manifest = Config.NONE, application = Application.class,
        instrumentedPackages = {"com.localob.messaging"})
public class EmbeddedAvatarTest {
    @Test public void unavailableArtworkDoesNotDiscardChatMetadataOrExposePhonePaths() throws Exception {
        EmbeddedBackend backend = new EmbeddedBackend(RuntimeEnvironment.getApplication());
        Method attach = EmbeddedBackend.class.getDeclaredMethod("attachAvatar", JSONObject.class);
        attach.setAccessible(true);
        JSONObject chat = new JSONObject().put("id", "1".repeat(64)).put("isGroup", true)
                .put("title", "Group").put("avatarUri", "file:///data/private/secret");
        attach.invoke(backend, chat);
        assertEquals("Group", chat.getString("title"));
        assertEquals("1".repeat(64), chat.getString("id"));
        assertFalse(chat.has("avatarUri"));
        assertFalse(chat.has("avatarId"));
    }
}
