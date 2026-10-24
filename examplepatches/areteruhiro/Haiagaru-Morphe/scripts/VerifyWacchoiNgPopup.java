import java.nio.file.*;
import javax.tools.ToolProvider;

/** Tests popup and 242 Compose dispatch without changing other native actions. */
public class VerifyWacchoiNgPopup {
    public static void main(String[] args) throws Exception {
        String archive = Files.readString(Path.of("extensions/chmate/src/main/java/app/morphe/extension/chmate/ResponseArchive.java"));
        String dispatch = archive.substring(archive.indexOf("    public static boolean handle(Object object)"), archive.indexOf("    /** 242's response-body sheet"));
        if (!dispatch.contains("WacchoiLongPressMenu.handleSuffixNg(object)"))
            throw new AssertionError("242 Compose response route is not connected to suffix NG");
        String source = Files.readString(Path.of("extensions/chmate/src/main/java/app/morphe/extension/chmate/WacchoiLongPressMenu.java"));
        String helper = source.substring(source.indexOf("    public static boolean dispatchSuffixNgItem"),
                source.indexOf("    /** Name/SLIP bottom sheets"))
                .replace("android.util.Log.w", "TestLog.w");
        Path temp = Files.createTempDirectory("haiagaru-ng-popup-");
        try {
            Path file = temp.resolve("Popup.java");
            Files.writeString(file, "import java.lang.reflect.*; public class Popup {" + helper + """
                interface MenuItem {
                    int getItemId();
                    interface OnMenuItemClickListener { boolean onMenuItemClick(MenuItem item); }
                }
                static class TestLog { static void w(String tag, String text, Throwable error) {} }
                static class ResponseArchive {
                    static boolean handle(Object item) { return handleSuffixNg(item); }
                }
                static class BaseItem implements MenuItem {
                    private final OnMenuItemClickListener listener;
                    private final int id;
                    BaseItem(int id, OnMenuItemClickListener listener) { this.id = id; this.listener = listener; }
                    public int getItemId() { return id; }
                }
                static class ChildItem extends BaseItem {
                    ChildItem(int id, OnMenuItemClickListener listener) { super(id, listener); }
                }
                public static void verify() {
                    int[] calls = {0};
                    MenuItem.OnMenuItemClickListener listener = item -> { calls[0]++; return true; };
                    if (!dispatchSuffixNgItem(new BaseItem(76, listener)) || calls[0] != 1)
                        throw new AssertionError("191 callback not dispatched exactly once");
                    if (!dispatchSuffixNgItem(new ChildItem(76, listener)) || calls[0] != 2)
                        throw new AssertionError("inherited listener");
                    if (!ResponseArchive.handle(new ChildItem(76, listener)) || calls[0] != 3)
                        throw new AssertionError("242 Compose callback not dispatched exactly once");
                    if (!handleSuffixNg(new BaseItem(76, listener)) || calls[0] != 4)
                        throw new AssertionError("direct suffix callback not dispatched exactly once");
                    if (dispatchSuffixNgItem(new BaseItem(75, listener)) || calls[0] != 4)
                        throw new AssertionError("search/native action intercepted");
                    if (dispatchSuffixNgItem(new BaseItem(76, null)) || dispatchSuffixNgItem(null)
                            || dispatchSuffixNgItem("not a menu")) throw new AssertionError("fallback");
                }
            }
            """);
            if (ToolProvider.getSystemJavaCompiler().run(null, null, null,
                    "-d", temp.toString(), file.toString()) != 0) throw new AssertionError("compile");
            try (var loader = new java.net.URLClassLoader(new java.net.URL[]{temp.toUri().toURL()})) {
                loader.loadClass("Popup").getMethod("verify").invoke(null);
            }
            System.out.println("PASS: popup / 242 Compose suffix NG dispatch exactly once, inherited listener and native fallbacks");
        } finally {
            try (var paths = Files.walk(temp)) {
                for (Path path : paths.sorted(java.util.Comparator.reverseOrder()).toList()) Files.delete(path);
            }
        }
    }
}
