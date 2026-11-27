package app.xposed.extension;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class ProfileInfoTest {
    @Test
    public void theVariableIsAddedFirstUnlessAlreadyNamed() {
        assertEquals("{\"include_profile_info\":true}", ProfileInfo.withVariable("{}"));
        assertEquals("{\"include_profile_info\":true,\"count\":30,\"cursor\":\"{}\"}",
                ProfileInfo.withVariable("{\"count\":30,\"cursor\":\"{}\"}"));
        String present = "{\"include_profile_info\":false,\"count\":30}";
        assertEquals(present, ProfileInfo.withVariable(present));
        assertEquals("[]", ProfileInfo.withVariable("[]"));
    }
}
