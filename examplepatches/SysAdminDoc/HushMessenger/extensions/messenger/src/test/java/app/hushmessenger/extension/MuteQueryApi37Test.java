package app.hushmessenger.extension;

import org.junit.Before;
import org.robolectric.annotation.Config;

/**
 * The mute check's copy, on an API 37 host. MuteQuery is the one piece that changes a file Messenger owns, a native
 * library Android 17 loads only while it's read-only, so every case in MuteQueryTest runs again with Messenger's target.
 */
@Config(sdk = Api37Host.TARGET)
public class MuteQueryApi37Test extends MuteQueryTest {
    @Before public void onApi37Host() {
        Api37Host.target();
    }
}
