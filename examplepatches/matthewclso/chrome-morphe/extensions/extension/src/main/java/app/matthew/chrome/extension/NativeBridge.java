package app.matthew.chrome.extension;

import android.app.Activity;

/** Bodies are replaced with validated native Chrome calls by the patch. */
public final class NativeBridge {
    private NativeBridge() {}
    public static boolean isIncognito(Activity activity) { throw new IllegalStateException("Unpatched bridge"); }
    public static int tabCount(Activity activity, boolean incognito) { throw new IllegalStateException("Unpatched bridge"); }
    public static void selectModel(Activity activity, boolean incognito) { throw new IllegalStateException("Unpatched bridge"); }
    public static boolean newTab(Activity activity, int menuId) { throw new IllegalStateException("Unpatched bridge"); }
    public static boolean incognitoAllowed(Activity activity) { throw new IllegalStateException("Unpatched bridge"); }
    public static boolean rememberModeFeatureEnabled() { return false; }
    public static boolean tabsReady(Activity activity) { throw new IllegalStateException("Unpatched bridge"); }
    public static int hubPane(Activity activity) { throw new IllegalStateException("Unpatched bridge"); }
    public static Object pickerModel(Activity activity) { throw new IllegalStateException("Unpatched bridge"); }
    public static boolean pickerLocked(Activity activity) { throw new IllegalStateException("Unpatched bridge"); }
    public static boolean pickerAtBottom(android.view.View container) { throw new IllegalStateException("Unpatched bridge"); }
    public static int pickerCount(Object model) { throw new IllegalStateException("Unpatched bridge"); }
    public static int pickerIndex(Object model) { throw new IllegalStateException("Unpatched bridge"); }
    public static Object pickerTab(Object model, int index) { throw new IllegalStateException("Unpatched bridge"); }
    public static int pickerId(Object tab) { throw new IllegalStateException("Unpatched bridge"); }
    public static String pickerTitle(Object tab) { throw new IllegalStateException("Unpatched bridge"); }
    public static android.graphics.Bitmap pickerIcon(Object tab) { throw new IllegalStateException("Unpatched bridge"); }
    public static void pickerSelect(Object model, int tabId) { throw new IllegalStateException("Unpatched bridge"); }
    public static void pickerClose(Object model, int tabId) { throw new IllegalStateException("Unpatched bridge"); }
    public static void writeChromeInt(int value, String key) { throw new IllegalStateException("Unpatched bridge"); }
    public static int themeSetting() { return 0; }
    public static void setBottomPosition() { throw new IllegalStateException("Unpatched bridge"); }
    public static java.util.List<android.view.View> themeChoices(Object preference) { throw new IllegalStateException("Unpatched bridge"); }
    public static boolean bottomSelected() { return false; }
    public static void unanchorSearchResults(android.view.View view) { throw new IllegalStateException("Unpatched bridge"); }
    public static Object microGAuthRequest(Object request, android.os.IBinder binder) throws Exception { throw new IllegalStateException("Unpatched bridge"); }
    public static void refreshMicroGAccounts() { throw new IllegalStateException("Unpatched bridge"); }
}
