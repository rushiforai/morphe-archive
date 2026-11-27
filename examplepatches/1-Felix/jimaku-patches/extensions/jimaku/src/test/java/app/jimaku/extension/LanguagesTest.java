package app.jimaku.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class LanguagesTest {
    @Test
    public void listMatchesTheExtensions() throws Exception {
        JSONArray languages = SharedCases.read("languages.json").getJSONArray("languages");
        List<String> codes = new ArrayList<>();
        for (int i = 0; i < languages.length(); i++) {
            JSONObject language = languages.getJSONObject(i);
            codes.add(language.getString("code"));
            assertEquals(language.getString("code"), language.getString("name"), Languages.name(language.getString("code")));
        }
        assertEquals(codes, Languages.codes());
    }

    @Test
    public void passesTheSharedCases() throws Exception {
        JSONArray cases = SharedCases.read("language-for.json").getJSONArray("cases");
        assertTrue(cases.length() > 0);
        for (int i = 0; i < cases.length(); i++) {
            JSONArray pair = cases.getJSONArray(i);
            assertEquals("languageFor(\"" + pair.getString(0) + "\")", pair.getString(1), Languages.languageFor(pair.getString(0)));
        }
    }

    @Test
    public void mapsTheAppsLocale() throws Exception {
        assertEquals("de", Languages.languageFor(Locale.GERMANY));
        assertEquals("de", Languages.languageFor(new Locale("de", "AT")));
        assertEquals("zh-Hant", Languages.languageFor(Locale.TAIWAN));
        assertEquals("zh-Hans", Languages.languageFor(Locale.SIMPLIFIED_CHINESE));
        assertEquals("zh-Hant", Languages.languageFor(Locale.forLanguageTag("zh-Hant-TW")));
        assertEquals("he", Languages.languageFor(new Locale("iw")));
        assertEquals("en", Languages.languageFor(new Locale("am")));
    }

    @Test
    public void knowsItsCodes() throws Exception {
        assertTrue(Languages.isLanguageCode("de"));
        assertTrue(Languages.isLanguageCode("zh-Hant"));
        assertFalse(Languages.isLanguageCode("zh"));
        assertFalse(Languages.isLanguageCode("am"));
        assertEquals("Deutsch", Languages.name("de"));
    }
}
