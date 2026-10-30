import io.github.jordanwoodson.extension.shared.twitch.TwitchInterface;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.util.Arrays;
import java.util.AbstractList;
import kotlin.enums.EnumEntries;
import android.os.Bundle;
import tv.twitch.android.models.feed.DiscoveryFeedPage;
import tv.twitch.android.models.feed.DiscoveryFeedPage.FeedLocationPage;
import tv.twitch.android.models.feed.FeedLocation;

public final class InterfaceProbe {
    enum Tab { HOME, CLIPS, VIDEOS, CHAT }
    enum Destination { Default, Browse, Following, NotificationCenter, Channel, Clip }
    enum MissingDestination { Default, Clip }
    // Twitch's subscription state keeps its constant names; the chat header reads only which offers it makes.
    enum SubscriptionState { DISABLED, NOT_SUBSCRIBED, NOT_SUBSCRIBED_GIFTING_DISABLED, SUBSCRIBED, GIFTING_ENABLED }
    enum OtherState { NOT_SUBSCRIBED, GIFTING_ENABLED }
    public static final class Fragment {
        private final Bundle arguments = new Bundle();
        Fragment(DiscoveryFeedPage page) { arguments.putSerializable("DiscoveryFeedPage", page); }
        public Bundle getArguments() { return arguments; }
    }
    static final class Tabs extends AbstractList<Tab> implements EnumEntries<Tab> {
        public Tab get(int index) { return Tab.values()[index]; }
        public int size() { return Tab.values().length; }
    }
    static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }
    static void startup() {
        Destination[] expected = {Destination.Default, Destination.Default, Destination.Browse,
                Destination.Following, Destination.NotificationCenter, Destination.Default};
        for (int setting = -1; setting <= 4; setting++) {
            Settings.defaultTab = setting;
            check(TwitchInterface.startDestination(Destination.Default) == expected[setting + 1],
                    "Plain startup follows default_tab " + setting);
            check(TwitchInterface.startDestination(null) == null, "Missing startup stays missing");
            for (Destination destination : Destination.values()) {
                if (destination != Destination.Default)
                    check(TwitchInterface.startDestination(destination) == destination,
                            "Explicit startup destination stays unchanged: " + destination);
            }
            check(TwitchInterface.startDestination(MissingDestination.Default) == MissingDestination.Default,
                    "Missing chosen enum value falls back to stock");
        }
    }
    static void home(boolean enabled) {
        FeedLocationPage live = new FeedLocationPage(new FeedLocation.Live());
        FeedLocationPage clips = new FeedLocationPage(new FeedLocation.Clips());
        FeedLocationPage category = new FeedLocationPage(new FeedLocation.ClipsCategory());
        java.util.List<?> tabs = Arrays.asList(live, clips, category);
        for (Object context : new Object[]{null, live, new Fragment(live), new Object(), Arrays.asList(live)}) {
            java.util.List<?> result = TwitchInterface.homeTabs(tabs, context);
            check(result.size() == (enabled ? 1 : 3), "Ordinary Home hides both Clips page kinds");
            check(result.get(0) == live && tabs.size() == 3, "Home order and source preserved");
            check(enabled || result == tabs, "Disabled Home preserves identity");
            if (enabled) {
                try { result.clear(); throw new AssertionError("Mutable Home tabs"); }
                catch (UnsupportedOperationException expected) { }
            }
        }
        for (DiscoveryFeedPage page : new DiscoveryFeedPage[]{clips, category}) {
            for (Object context : new Object[]{page, new Fragment(page), Arrays.asList(live, page)}) {
                check(TwitchInterface.homeTabs(tabs, context) == tabs,
                        "Explicit Home Clips routing retains selected tab");
            }
        }
        check(TwitchInterface.homeTabs(null, null) == null, "Missing Home tabs stay missing");
        java.util.List<?> allClips = Arrays.asList(clips, category);
        check(TwitchInterface.homeTabs(allClips, null) == allClips, "Never empty the Home pager");
        java.util.List<?> unrelated = Arrays.asList("Clips", Tab.CLIPS);
        check(TwitchInterface.homeTabs(unrelated, null) == unrelated, "Only real Home page types are filtered");
    }
    public static void main(String[] args) {
        startup();
        for (boolean enabled : new boolean[] {false, true}) {
            Settings.enabled = enabled;
            home(enabled);
            check(!TwitchInterface.bitsVisible(false), "Stock hidden Bits stays hidden");
            check(TwitchInterface.bitsVisible(true) == !enabled, "Bits setting applies");
            check(!TwitchInterface.subscriptionUpsellVisible(false), "Stock hidden upgrade stays hidden");
            check(TwitchInterface.subscriptionUpsellVisible(true) == !enabled, "Upgrade follows the upsell setting");
            for (SubscriptionState state : SubscriptionState.values()) {
                boolean subscriber = state == SubscriptionState.SUBSCRIBED || state == SubscriptionState.GIFTING_ENABLED;
                SubscriptionState expected = !enabled ? state : subscriber ? SubscriptionState.SUBSCRIBED : SubscriptionState.DISABLED;
                check(TwitchInterface.subscriptionButtons(state) == expected, "Chat header subscription state " + state);
            }
            check(TwitchInterface.subscriptionButtons(null) == null, "Missing subscription state stays missing");
            for (OtherState state : OtherState.values())
                check(TwitchInterface.subscriptionButtons(state) == state, "An enum without the hidden states is kept");
            check(TwitchInterface.clipTabs(null) == null, "Missing UI data stays missing");
            java.util.List<String> unrelated = Arrays.asList("CLIPS", "normal chat");
            check(TwitchInterface.clipTabs(unrelated) == unrelated, "Unrelated strings are not discovery enum tabs");
            Tabs source = new Tabs();
            EnumEntries<?> filtered = (EnumEntries<?>) TwitchInterface.clipTabs(source);
            check(source.size() == 4, "Original enum entries are unchanged");
            check(filtered.size() == (enabled ? 3 : 4), "Only Clips removed");
            check(filtered.get(0) == Tab.HOME, "Home order preserved");
            check(filtered.contains(Tab.CHAT), "Chat kept");
            check(filtered.contains(Tab.CLIPS) == !enabled, "Clip discovery setting applies");
            check(enabled || filtered == source, "Disabled preserves original identity");
            Bundle plain = new Bundle();
            check(((java.util.List<?>) TwitchInterface.clipTabs(source, plain)).size() == (enabled ? 3 : 4), "Plain profile filtering");
            for (String key : new String[]{"clipId", "contentType", "profileScope", "profileScopeLower"}) {
                Bundle explicit = new Bundle();
                explicit.putString(key.equals("profileScopeLower") ? "profileScope" : key, key.equals("clipId") ? "shared-clip" : key.equals("contentType") ? "clips_content" : key.equals("profileScopeLower") ? "clips" : "CLIPS");
                check(TwitchInterface.clipTabs(source, explicit) == source, "Explicit clip context must retain full profile: " + key);
            }
            if (enabled) {
                check(filtered.indexOf(Tab.VIDEOS) == 1, "Pager indexes match filtered entries");
                check(filtered.equals(Arrays.asList(Tab.HOME, Tab.VIDEOS, Tab.CHAT)), "List equality preserved");
                check(filtered.toArray().length == 3, "List bridge array conversion preserved");
                try { ((java.util.List) filtered).clear(); throw new AssertionError("Mutable result"); }
                catch (UnsupportedOperationException expected) { }
            }
        }
        System.out.println("Twitch interface helper checks passed");
    }
}
