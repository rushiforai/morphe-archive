package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.view.View;
import android.os.Looper;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Switch;
import android.widget.TextView;
import app.spicetify.extension.spotify.localserver.JellyfinClient;
import app.spicetify.extension.spotify.localserver.JellyfinConnection;
import app.spicetify.extension.spotify.localserver.ServerConfig;
import app.spicetify.extension.spotify.localserver.ServerConnection;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.time.Duration;
import java.util.function.Function;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.Shadows;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ServerFilesSettingsTest {
    private Activity activity;
    private ServerFilesSettings form;

    @Before public void setUp() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        ServerConfig.initialize(activity);
        ServerConfig.configure(false, "https://dav.example/music/", "fixture-user", "fixture-secret");
        form = new ServerFilesSettings(activity);
    }

    @Test public void passwordIsNeverPrefilledOrSavedInViewState() {
        EditText password = inputs().get(2);
        assertEquals("", password.getText().toString());
        assertFalse(password.isSaveEnabled());
        button("Save").performClick();
        assertTrue(ServerConfig.snapshot().hasPassword());
        assertFalse(ServerConfig.snapshot().enabled);
    }

    @Test public void editingServerDoesNotSendSavedCredentialsToNewServer() {
        inputs().get(0).setText("https://another.example/music/");
        button("Save").performClick();
        assertEquals("https://another.example/music/", ServerConfig.snapshot().rootUrl());
        assertFalse(ServerConfig.snapshot().hasPassword());
        assertFalse(ServerConfig.snapshot().enabled);
    }

    @Test public void webDavHostWithoutSchemeKeepsTheSameSavedPassword() {
        inputs().get(0).setText("dav.example/music");
        button("Save").performClick();
        assertEquals("https://dav.example/music/", ServerConfig.snapshot().rootUrl());
        assertTrue(ServerConfig.snapshot().hasPassword());
    }

    @Test public void invalidUrlLeavesTheSavedConfigurationUntouched() {
        inputs().get(0).setText("http://insecure.example/music/");
        button("Save").performClick();
        assertEquals("https://dav.example/music/", ServerConfig.snapshot().rootUrl());
        assertTrue(ServerConfig.snapshot().hasPassword());
    }

    @Test public void forgettingRequiresConfirmationAndClearsCredentials() {
        button("Forget server").performClick();
        sheetButton("Cancel").performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(ServerConfig.snapshot().hasPassword());
        button("Forget server").performClick();
        sheetButton("Forget").performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("", ServerConfig.snapshot().rootUrl());
        assertFalse(ServerConfig.snapshot().hasPassword());
        assertFalse(ServerConfig.snapshot().enabled);
    }

    @Test @Config(sdk = 24) public void androidSevenCannotEnableServerStreaming() {
        assertEquals(0, inputs().size());
        assertThrows(IllegalArgumentException.class, () ->
                ServerConfig.configure(true, "https://dav.example/music/", "user", "secret"));
        assertFalse(ServerConfig.snapshot().enabled);
    }

    @Test public void disablingStopsSavedServerEvenWithAnInvalidDraft() {
        ServerConfig.configure(true, "https://dav.example/music/", "fixture-user", "fixture-secret");
        form = new ServerFilesSettings(activity);
        inputs().get(0).setText("http://invalid.example/music/");
        for (int i = 0; i < form.getChildCount(); i++) {
            if (form.getChildAt(i) instanceof Switch) ((Switch) form.getChildAt(i)).setChecked(false);
        }
        assertFalse(ServerConfig.snapshot().enabled);
        button("Save").performClick();
        assertFalse(ServerConfig.snapshot().enabled);
        assertEquals("https://dav.example/music/", ServerConfig.snapshot().rootUrl());
    }

    @Test public void pollingDoesNotEraseValidationErrors() {
        activity.setContentView(form);
        inputs().get(0).setText("http://invalid.example/music/");
        button("Save").performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        boolean visible = false;
        for (int i = 0; i < form.getChildCount(); i++) {
            View view = form.getChildAt(i);
            if (view instanceof TextView && ((TextView) view).getText().toString().startsWith("Use an HTTPS folder URL")) visible = true;
        }
        assertTrue(visible);
    }

    @Test public void jellyfinHasAnAccessibleProviderChoiceAndBothSignInMethods() {
        RadioGroup providers = first(form, RadioGroup.class);
        assertNotNull(providers);
        assertNotNull(radio("WebDAV"));
        radio("Jellyfin").performClick();
        assertNotNull(button("Use Quick Connect"));
        assertNotNull(button("Sign in with password"));
        assertNotNull(inputWithHint("https://jellyfin.example/"));
        assertNull(inputWithHint("https://server.example/music/"));
    }

    @Test public void choosingJellyfinKeepsWebDavCredentialsUntilALibraryIsSaved() {
        radio("Jellyfin").performClick();
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
        assertEquals("https://dav.example/music/", ServerConfig.snapshot().rootUrl());
        assertTrue(ServerConfig.snapshot().hasPassword());
        radio("WebDAV").performClick();
        assertEquals("https://dav.example/music/", inputs().get(0).getText().toString());
        button("Save").performClick();
        assertTrue(ServerConfig.snapshot().hasPassword());
    }

    @Test public void quickConnectRejectsAnInsecureServerWithoutChangingSavedProvider() {
        radio("Jellyfin").performClick();
        inputWithHint("https://jellyfin.example/").setText("http://insecure.example/web/#/home");
        button("Use Quick Connect").performClick();
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
        assertTrue(statusText().contains("HTTPS"));
    }

    @Test public void passwordFallbackClearsThePasswordFieldEvenWhenTheUrlIsInvalid() {
        radio("Jellyfin").performClick();
        EditText password = inputWithHint("Password");
        assertNotNull(password);
        assertFalse(password.isSaveEnabled());
        password.setText("temporary-fixture-password");
        jellyfinUrl().setText("http://insecure.example/");
        button("Sign in with password").performClick();
        assertEquals("", password.getText().toString());
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
    }

    @Test public void forgetClearsSavedProviderEvenAfterChangingTheDraftProvider() {
        radio("Jellyfin").performClick();
        button("Forget server").performClick();
        sheetButton("Forget").performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(ServerConfig.Provider.NONE, ServerConfig.snapshot().provider());
    }

    @Test public void libraryChoiceSavesJellyfinAndClearsInactiveWebDavFields() throws Exception {
        activity.setContentView(form);
        radio("Jellyfin").performClick();
        JellyfinClient.Account account = fixtureAccount();
        offerLibrary(account);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse(radioIn(form, "Music").isChecked());
        radioIn(form, "Music").performClick();
        button("Save library and scan").performClick();

        ServerConfig.Snapshot saved = ServerConfig.snapshot();
        assertEquals(ServerConfig.Provider.JELLYFIN, saved.provider());
        assertEquals("Music", saved.jellyfinConnection().libraryName);
        assertEquals("https://127.0.0.1:1/", saved.jellyfinConnection().root.toString());
        assertTrue(saved.enabled);
        assertTrue(first(form, Switch.class).isChecked());
        assertNull(jellyfinUrl());
        assertNotNull(button("Sign in again"));
        ServerConfig.enabled(false);
        radio("WebDAV").performClick();
        assertEquals("", inputs().get(0).getText().toString());
        assertEquals("Password", inputs().get(2).getHint().toString());
    }

    @Test public void savedJellyfinHidesSignInUntilAskedAgain() throws Exception {
        JellyfinClient.Account account = fixtureAccount();
        assertTrue(ServerConfig.configureJellyfinIfCurrent(ServerConfig.snapshot(), false, account.select(fixtureLibrary(account))));
        form = new ServerFilesSettings(activity);
        assertNotNull(button("Rescan library"));
        assertNull(findButton(form, "Use Quick Connect"));
        assertNull(jellyfinUrl());
        button("Sign in again").performClick();
        assertEquals("https://127.0.0.1:1/", jellyfinUrl().getText().toString());
        assertNotNull(button("Use Quick Connect"));
        assertNull(findButton(form, "Sign in again"));
    }

    @Test public void quickConnectCodeOpensTheApprovalPageOnTheServer() throws Exception {
        activity.setContentView(form);
        radio("Jellyfin").performClick();
        assertNull(findButton(form, "Open in Jellyfin"));
        Method show = ServerFilesSettings.class.getDeclaredMethod("showCode", java.net.URI.class, String.class);
        show.setAccessible(true);
        show.invoke(form, java.net.URI.create("https://jellyfin.example/media/"), "123456");
        assertNull(findButton(form, "Use Quick Connect"));
        assertNotNull(button("Get a new code"));
        button("Open in Jellyfin").performClick();
        android.content.Intent opened = Shadows.shadowOf(activity).getNextStartedActivity();
        assertEquals(android.content.Intent.ACTION_VIEW, opened.getAction());
        assertEquals("https://jellyfin.example/media/web/#/quickconnect?txtQuickConnectCode=123456", opened.getDataString());
        radio("WebDAV").performClick();
        radio("Jellyfin").performClick();
        assertNull(findButton(form, "Open in Jellyfin"));
        assertNotNull(button("Use Quick Connect"));
    }

    @Test public void enablingSavedJellyfinKeepsAnOpenLibraryChoice() throws Exception {
        JellyfinClient.Account account = fixtureAccount();
        JellyfinClient.MusicLibrary music = fixtureLibrary(account);
        assertTrue(ServerConfig.configureJellyfinIfCurrent(ServerConfig.snapshot(), false, account.select(music)));
        form = new ServerFilesSettings(activity);
        activity.setContentView(form);
        offerLibrary(account);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        radioIn(form, "Music").performClick();
        first(form, Switch.class).setChecked(true);
        assertFalse(ServerConfig.snapshot().enabled);
        assertNotNull(button("Save library and scan"));
        button("Save library and scan").performClick();
        assertTrue(ServerConfig.snapshot().enabled);
        assertEquals("Music", ServerConfig.snapshot().jellyfinConnection().libraryName);
        ServerConfig.enabled(false);
    }

    @Test public void failedSignInRestoresTheSavedEnabledState() throws Exception {
        JellyfinClient.Account account = fixtureAccount();
        assertTrue(ServerConfig.configureJellyfinIfCurrent(ServerConfig.snapshot(), false,
                account.select(fixtureLibrary(account))));
        form = new ServerFilesSettings(activity);
        activity.setContentView(form);
        button("Sign in again").performClick();
        jellyfinUrl().setText("http://insecure.example/");
        offerLibrary(account);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        first(form, Switch.class).setChecked(true);
        assertFalse(ServerConfig.snapshot().enabled);

        button("Use Quick Connect").performClick();

        assertFalse(first(form, Switch.class).isChecked());
        assertFalse(ServerConfig.snapshot().enabled);
        assertTrue(statusText().contains("HTTPS"));
    }

    @Test public void switchingProviderDropsAPostedLibraryChoice() throws Exception {
        activity.setContentView(form);
        radio("Jellyfin").performClick();
        offerLibrary(fixtureAccount());
        radio("WebDAV").performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(findButton(form, "Save library and scan"));
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
    }

    @Test public void webDavReplacementHidesTheOldJellyfinAccount() throws Exception {
        activity.setContentView(form);
        radio("Jellyfin").performClick();
        offerLibrary(fixtureAccount());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        radioIn(form, "Music").performClick();
        button("Save library and scan").performClick();
        radio("WebDAV").performClick();
        inputs().get(0).setText("dav.example/new/");
        button("Save").performClick();
        radio("Jellyfin").performClick();
        assertNull(findButton(form, "Rescan library"));
        assertNull(findButton(form, "Change music library"));
        assertEquals("", jellyfinUrl().getText().toString());
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
        ServerConfig.enabled(false);
    }

    private JellyfinClient.Account fixtureAccount() throws Exception {
        Constructor<JellyfinClient.Account> constructor = JellyfinClient.Account.class.getDeclaredConstructor(
                ServerConnection.class, String.class, String.class, String.class, String.class);
        constructor.setAccessible(true);
        return constructor.newInstance(new ServerConnection("https://127.0.0.1:1/", "", ""),
                ServerConfig.deviceId(), "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "Fixture account", "fixture-token");
    }

    private JellyfinClient.MusicLibrary fixtureLibrary(JellyfinClient.Account account) throws Exception {
        Constructor<JellyfinClient.MusicLibrary> constructor = JellyfinClient.MusicLibrary.class.getDeclaredConstructor(
                JellyfinClient.Account.class, String.class, String.class);
        constructor.setAccessible(true);
        return constructor.newInstance(account, "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", "Music");
    }

    private void offerLibrary(JellyfinClient.Account account) throws Exception {
        Field generation = ServerFilesSettings.class.getDeclaredField("generation");
        generation.setAccessible(true);
        Method offer = ServerFilesSettings.class.getDeclaredMethod("offerLibraries", int.class,
                ServerConfig.Snapshot.class, Function.class, List.class);
        offer.setAccessible(true);
        Function<JellyfinClient.MusicLibrary, JellyfinConnection> select = account::select;
        offer.invoke(form, generation.getInt(form), ServerConfig.snapshot(), select, List.of(fixtureLibrary(account)));
    }

    private RadioButton radioIn(View root, String label) {
        if (root instanceof RadioButton && label.contentEquals(((RadioButton) root).getText())) return (RadioButton) root;
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                RadioButton found = radioIn(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }

    private List<EditText> inputs() {
        List<EditText> result = new ArrayList<>();
        collectInputs(form, result);
        return result;
    }

    private void collectInputs(View root, List<EditText> result) {
        if (root.getVisibility() == View.GONE) return;
        if (root instanceof EditText) result.add((EditText) root);
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) collectInputs(group.getChildAt(i), result);
        }
    }

    private Button sheetButton(String label) {
        Button found = findButton(ShadowDialog.getLatestDialog().getWindow().getDecorView(), label);
        if (found != null) return found;
        throw new AssertionError("Missing sheet button: " + label);
    }

    private Button button(String label) {
        Button found = findButton(form, label);
        if (found != null) return found;
        throw new AssertionError("Missing button: " + label);
    }

    private Button findButton(View root, String label) {
        if (root.getVisibility() == View.GONE) return null;
        if (root instanceof Button && label.contentEquals(((Button) root).getText())) return (Button) root;
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                Button found = findButton(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }

    private RadioButton radio(String label) {
        for (int i = 0; i < form.getChildCount(); i++) {
            View view = form.getChildAt(i);
            if (!(view instanceof RadioGroup)) continue;
            RadioGroup group = (RadioGroup) view;
            for (int j = 0; j < group.getChildCount(); j++) {
                RadioButton item = (RadioButton) group.getChildAt(j);
                if (label.contentEquals(item.getText())) return item;
            }
        }
        return null;
    }

    private EditText inputWithHint(String hint) {
        return findInputWithHint(form, hint);
    }

    private EditText jellyfinUrl() {
        return inputWithHint("https://jellyfin.example/");
    }

    private EditText findInputWithHint(View root, String hint) {
        if (root.getVisibility() == View.GONE) return null;
        if (root instanceof EditText && android.text.TextUtils.equals(hint, ((EditText) root).getHint())) return (EditText) root;
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = findInputWithHint(group.getChildAt(i), hint);
                if (found != null) return found;
            }
        }
        return null;
    }

    private String statusText() {
        for (int i = 0; i < form.getChildCount(); i++) {
            View child = form.getChildAt(i);
            if (child instanceof TextView && child.getAccessibilityLiveRegion() == View.ACCESSIBILITY_LIVE_REGION_POLITE)
                return ((TextView) child).getText().toString();
        }
        throw new AssertionError("Missing status text");
    }

    private <T extends View> T first(View root, Class<T> kind) {
        if (kind.isInstance(root)) return kind.cast(root);
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = first(group.getChildAt(i), kind);
                if (found != null) return found;
            }
        }
        return null;
    }
}
