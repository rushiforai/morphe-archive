public final class Chrome150MenuHookSelfTest {
    public static void main(String[] args) {
        String source = read(
                "extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/" +
                "chromeuserscripts/ChromeAppMenuIntegrator.java"
        );
        require(source.contains("app_menu_list"), "exact Chrome app menu resource missing");
        require(source.contains("context_menu_list_view"), "context menu exclusion missing");
        require(!source.contains("import android.view.Menu;"),
                "Chrome 150 hook must not depend on android.view.Menu");
        require(source.contains("WindowManagerGlobal"), "popup-root discovery missing");
        require(source.contains("getResourceEntryName"), "resource-name validation missing");
        System.out.println("Chrome 150 exact menu-hook self-test passed.");
    }

    private static String read(String path) {
        try {
            return new String(
                    java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(path)),
                    java.nio.charset.StandardCharsets.UTF_8
            );
        } catch (Exception error) {
            throw new RuntimeException(error);
        }
    }

    private static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
}
