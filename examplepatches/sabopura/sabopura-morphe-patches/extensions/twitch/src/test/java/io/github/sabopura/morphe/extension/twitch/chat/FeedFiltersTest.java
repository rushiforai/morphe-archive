package io.github.sabopura.morphe.extension.twitch.chat;

import static org.junit.Assert.assertSame;

import android.content.SharedPreferences;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

import org.junit.Test;

public class FeedFiltersTest {
    private static final Function<String, String> SECTION = r -> r.startsWith("#") ? r.substring(1) : null;

    /** A store whose "hide" switches answer as {@code getBoolean} does when an import wrote another type. */
    private static SharedPreferences prefs(boolean mistyped) {
        return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
                    if (!method.getName().equals("getBoolean")) return null;
                    if (mistyped) throw new ClassCastException("java.lang.String cannot be cast to java.lang.Boolean");
                    return true;
                });
    }

    private static List<String> rows() {
        return new ArrayList<>(Arrays.asList("#ContinueWatching", "a", "#FollowedOfflineChannels", "b"));
    }

    @Test
    public void aMistypedSettingGivesBackTwitchsOwnList() {
        List<String> rows = rows();
        assertSame(rows, FeedFilters.filterSections(rows, prefs(true), SECTION));
    }

    @Test
    public void aRowThatCannotBeReadGivesBackTwitchsOwnList() {
        List<String> rows = rows();
        Function<String, String> changed = r -> {
            if (r.equals("b")) throw new IllegalStateException("Twitch changed its row");
            return SECTION.apply(r);
        };
        assertSame(rows, FeedFilters.filterSections(rows, prefs(false), changed));
    }
}
