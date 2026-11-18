package app.afterglow.extension.litho;

import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import app.afterglow.extension.litho.filters.PlayerActionButtonsFilter;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Regression cases from the 21.43.523 fullscreen component trace. */
public final class PlayerActionButtonsFilterTest {
    private static final Map<String, Boolean> PREFS = new HashMap<>();
    private static int checks;
    private static final String QUICK = "quick_actions.eml-fe|1a023556160f547d";
    private static final ElementProto SHARED_ICONS = () ->
            "yt_outline_share_black_24 yt_outline_bookmark_black_24".getBytes(StandardCharsets.UTF_8);

    public static void main(String[] args) throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, values) -> {
                    if (method.getName().equals("getBoolean")) return PREFS.getOrDefault((String) values[0], (Boolean) values[1]);
                    throw new AssertionError("Unexpected preference read " + method.getName());
                });
        Field field = AfterglowPrefs.class.getDeclaredField("prefs");
        field.setAccessible(true); field.set(null, preferences);
        PlayerActionButtonsFilter filter = new PlayerActionButtonsFilter();
        String button = "|ContainerType|button.eml|button_inner.eml|ContainerType|";
        for (boolean share : new boolean[]{false, true}) {
            for (boolean save : new boolean[]{false, true}) {
                PREFS.put("noPlayerShareButton", share); PREFS.put("noPlayerSaveButton", save);
                check(filter, share, QUICK, button, "id.video.share.button");
                check(filter, save, QUICK, button, "id.video.add_to.button");
                for (String id : new String[]{"id.video.like.button", "id.video.dislike.button", "id.elements.button", ""}) {
                    check(filter, false, QUICK, button, id);
                }
                check(filter, false, QUICK, "|ContainerType|", "id.video.share.button");
                check(filter, false, QUICK, "|overflow_menu_button.eml|button.eml|", "id.video.share.button");
                check(filter, false, "unrelated.eml", button, "id.video.share.button");
            }
        }
        PREFS.put("noPlayerShareButton", true);
        PREFS.put("noPlayerSaveButton", false);
        // Overflow descendants carry all menu icons: neither the button nor any inner
        // component may be mistaken for Share in the existing under-video action bar.
        for (String suffix : new String[]{"|overflow_menu_button.eml|", "|overflow_menu_button.eml|button.eml|",
                "|overflow_menu_button.eml|button.eml|button_inner.eml|ContainerType|"}) {
            check(filter, false, "video_action_bar.eml", suffix, "");
        }
        check(filter, true, "video_action_bar.eml", button, "id.video.share.button");
        for (String id : new String[]{"id.video.like.button", "id.video.dislike.button", "id.video.add_to.button", ""}) {
            check(filter, false, "compactify_video_action_bar.eml", button, id);
        }
        PREFS.put("noPlayerShareButton", false); PREFS.put("noPlayerSaveButton", false);
        PREFS.put("noPlayerDownloadButton", true); PREFS.put("noPlayerRemixButton", true);
        check(filter, false, QUICK, button, "id.ui.add_to.offline.button");
        check(filter, false, QUICK, button, "id.video.remix.button");
        System.out.println("PASS player action filters: " + checks + "/" + checks + " checks");
    }

    private static void check(LithoFilter filter, boolean expected,
                              String identifier, String suffix, String accessibility) {
        LithoComponent component = new LithoComponent();
        component.reset(null, SHARED_ICONS, identifier, new StringBuilder(identifier + suffix), accessibility, "");
        boolean hidden = false;
        for (StringFilterGroup group : filter.identifierCallbacks) {
            int index = group.indexIn(identifier);
            if (index >= 0 && filter.isFiltered(component, group, LithoFilter.MatchType.IDENTIFIER, index)) hidden = true;
        }
        checks++;
        if (hidden != expected) throw new AssertionError(identifier + suffix + " " + accessibility
                + " expected=" + expected + " hidden=" + hidden + " preferences=" + PREFS);
    }
}
