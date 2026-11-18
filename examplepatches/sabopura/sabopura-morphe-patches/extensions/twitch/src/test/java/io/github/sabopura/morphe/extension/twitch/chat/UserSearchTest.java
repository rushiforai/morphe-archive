package io.github.sabopura.morphe.extension.twitch.chat;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

public class UserSearchTest {
    @Test
    public void queryDropsSpacesAndALeadingAt() {
        assertEquals("some_user", UserSearch.query("  @some_user "));
        assertEquals("12345", UserSearch.query("12345"));
    }

    @Test
    public void queryRefusesWhatCannotBeALoginOrId() {
        assertNull(UserSearch.query(""));
        assertNull(UserSearch.query("two words"));
        assertNull(UserSearch.query("ユーザー"));
        assertNull(UserSearch.query("a_name_that_is_far_too_long"));
    }

    @Test
    public void profilePrefersTheIdMatchForDigits() throws JSONException {
        UserSearch.Profile profile = UserSearch.profile(new JSONObject(
                "{\"data\":{\"byId\":{\"id\":\"42\",\"login\":\"answer\",\"displayName\":\"Answer\",\"description\":\"hi\"},"
                        + "\"byLogin\":{\"id\":\"7\",\"login\":\"42\",\"displayName\":\"42\",\"description\":\"\"}}}"));
        assertEquals("42", profile.id);
        assertEquals("answer", profile.login);
        assertEquals("Answer", profile.displayName);
        assertEquals("hi", profile.description);
    }

    @Test
    public void profileFallsBackToTheLoginMatch() throws JSONException {
        UserSearch.Profile profile = UserSearch.profile(new JSONObject(
                "{\"data\":{\"byId\":null,\"byLogin\":{\"id\":\"7\",\"login\":\"seven\"}}}"));
        assertEquals("seven", profile.login);
        assertEquals("seven", profile.displayName);
        assertEquals("", profile.description);
    }

    @Test
    public void noSuchUserIsNotAFailure() throws JSONException {
        assertNull(UserSearch.profile(new JSONObject("{\"data\":{\"byLogin\":null}}")));
    }

    @Test(expected = JSONException.class)
    public void replyWithoutDataIsAFailure() throws JSONException {
        UserSearch.profile(new JSONObject("{\"errors\":[{\"message\":\"service error\"}]}"));
    }

    @Test(expected = JSONException.class)
    public void unexpectedLoginIsAFailure() throws JSONException {
        UserSearch.profile(new JSONObject("{\"data\":{\"byLogin\":{\"id\":\"1\",\"login\":\"../x\"}}}"));
    }
}
