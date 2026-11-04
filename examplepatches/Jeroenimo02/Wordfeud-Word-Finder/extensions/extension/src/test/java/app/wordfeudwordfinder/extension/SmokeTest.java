package app.wordfeudwordfinder.extension;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class SmokeTest {
    @Test
    public void smoke() throws Exception {
        assertEquals(1, new org.json.JSONObject("{\"a\":1}").getInt("a"));
    }
}
