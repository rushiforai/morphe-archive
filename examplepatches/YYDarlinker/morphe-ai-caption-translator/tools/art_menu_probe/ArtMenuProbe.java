/** Invokes the actual patched class, rather than merely loading its method metadata.
 * Run on Android ART with the patched APK on CLASSPATH. No Activity or network is needed.
 */
public final class ArtMenuProbe {
    public static void main(String[] args) {
        try {
            Class<?> menu = Class.forName("app.yydarlinker.deepseekcaptions.CaptionQuickToggle");
            java.lang.reflect.Method enter = menu.getDeclaredMethod("onMenu", Object.class, int.class);
            for (int index : new int[] {0, 3}) {
                Object result = enter.invoke(null, new Object[] {null, index});
                if (!Integer.valueOf(index).equals(result)) {
                    throw new AssertionError("Missing-Activity entry must preserve group index: " + result);
                }
                System.out.println("ART_MENU_ENTRY_PASS index=" + index);
            }
            Class<?> bridge = Class.forName("app.yydarlinker.deepseekcaptions.NativeCaptionBridge");
            bridge.getDeclaredMethod("onNativeSelection", Object.class, Object.class, Object.class)
                    .invoke(null, new Object[] {null, null, null});
            java.lang.reflect.Method refresh = bridge.getDeclaredMethod("refreshNativeTrack");
            refresh.setAccessible(true);
            if (!"CAPTIONS_OFF".equals(String.valueOf(refresh.invoke(null)))) {
                throw new AssertionError("Caption OFF must not require a live native manager");
            }
            Class<?> choice = Class.forName("app.yydarlinker.deepseekcaptions.CaptionChoice");
            java.lang.reflect.Method reset = choice.getDeclaredMethod("reset");
            reset.setAccessible(true); reset.invoke(null);
            if (!"DEFERRED".equals(String.valueOf(refresh.invoke(null)))) {
                throw new AssertionError("Unknown native state must defer without throwing");
            }
            System.out.println("ART_NATIVE_STATE_PASS off=true unknown=deferred");
            System.out.println("ART_MENU_INVOKE_PASS");
        } catch (Throwable error) {
            error.printStackTrace();
            System.exit(1);
        }
    }
}
