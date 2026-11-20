package app.afterglow.extension.navigation;

import java.util.Arrays;
import java.util.List;

public final class NativeTabs {
    public static List<String> supportedTabs() {
        return Arrays.asList("home", "subscriptions", "library", "afterglow", "history", "watchlater", "posts", "messages", "shorts", "hype", "create");
    }
}
