package local.wazemaps.alerts;
import com.waze.*;
import com.waze.config.*;
public class ValidateCameraSound {
    static void require(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static void apply() throws Exception {
        NativeManager.nativeThread = true;
        try { CameraSound.apply(); } finally { NativeManager.nativeThread = false; }
    }
    public static void main(String[] args) throws Exception {
        ConfigManager.bools.put(668, false);
        ConfigManager.bools.put(999, false);
        require(CameraSound.override(ConfigValues.CONFIG_VALUE_ALERTS_PLAY_SPEED_CAMERA_SOUND_BELOW_SPEED_LIMIT) == Boolean.TRUE, "Camera getter not enabled");
        require(CameraSound.override(new b(668)) == null && CameraSound.override(null) == null, "Unrelated getter changed");
        NativeManager.started = false;
        try { apply(); throw new AssertionError("Applied before native startup"); } catch (IllegalStateException expected) { }
        require(ConfigManager.boolWrites == 0, "Premature native write");
        NativeManager.started = true;
        apply();
        require(ConfigManager.bools.get(668), "Native setting not enabled");
        int writes = ConfigManager.boolWrites;
        apply();
        require(ConfigManager.boolWrites == writes, "Already enabled setting written again");
        ConfigManager.bools.put(668, false);
        CameraSound.scheduleApply();
        require(!ConfigManager.bools.get(668), "Refresh wrote outside native queue");
        NativeManager.drain();
        require(ConfigManager.bools.get(668), "Server refresh not reapplied");
        for (boolean reject : new boolean[]{false, true}) {
            ConfigManager.bools.put(668, false);
            ConfigManager.ignoreBool = !reject;
            ConfigManager.failBool = reject;
            try { apply(); throw new AssertionError("Failed native update accepted"); } catch (Exception expected) { }
            require(!ConfigManager.bools.get(668), "Native failure did not retain original");
        }
        ConfigManager.ignoreBool = ConfigManager.failBool = false;
        NativeManager.accept = false;
        android.util.Log.expectedError = "Could not queue camera sound setting";
        CameraSound.scheduleApply();
        require(android.util.Log.expectedError == null, "Rejected queue was not reported");
        NativeManager.drain();
        require(!ConfigManager.bools.get(668), "Rejected queue changed native setting");
        NativeManager.accept = true;
        CameraSound.scheduleApply();
        NativeManager.drain();
        require(ConfigManager.bools.get(668) && !ConfigManager.bools.get(999), "Camera setting or unrelated boolean incorrect");
        System.out.println("PASS: camera sound identity override, native startup, native queue, refresh, idempotence, read-back/write failures, rollback and unrelated config isolation (JVM native API fixtures)");
    }
}
