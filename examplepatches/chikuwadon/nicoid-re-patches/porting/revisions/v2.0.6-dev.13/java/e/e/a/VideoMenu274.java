package e.e.a;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.Menu;
import android.view.MenuItem;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Apply one set of menu preferences to the final action list and its popup. */
final class VideoMenu274 {
    private static final int POPUP = 9;
    private static final int REMOVE_MYLIST = 0x46e0;
    private static final int REMOVE_CONTEXTUAL = 0x46b9;

    private VideoMenu274() {}

    static int nativeId(MenuItem original) {
        // The native row reuses the popup ID for the separate mylist action.
        int id = original.getItemId();
        return id == POPUP && original.getOrder() == 5 ? REMOVE_MYLIST : id;
    }

    static void publish(Menu menu, List<ListActions.Action> actions, Activity host) {
        SharedPreferences prefs = MenuOptions119.prefs(host);
        List<Integer> order = MenuEditor120.order(host);
        Map<Integer, Integer> ranks = new HashMap<>();
        for (int i = 0; i < order.size(); i++) ranks.put(order.get(i), i);
        boolean accountList = AccountRemoval227.kind(host) > 0;
        boolean hasAccountRemoval = accountList && actions.stream().anyMatch(a -> a.id == REMOVE_CONTEXTUAL);
        // Prefer the account deletion callback when both the native and dedicated
        // account actions are available. Local playlist removal has its own ID.
        actions.removeIf(action -> (hasAccountRemoval && action.id == REMOVE_MYLIST)
                || !prefs.getBoolean(MenuOptions119.key(settingId(action.id, accountList)), true));
        actions.sort((left, right) -> Integer.compare(
                ranks.getOrDefault(settingId(left.id, accountList), Integer.MAX_VALUE),
                ranks.getOrDefault(settingId(right.id, accountList), Integer.MAX_VALUE)));

        menu.clear();
        for (int i = 0; i < actions.size(); i++) {
            ListActions.Action action = actions.get(i);
            MenuItem item = menu.add(0, action.id, i, action.title).setEnabled(action.enabled);
            item.setOnMenuItemClickListener(clicked -> {
                if (action.enabled && action.run != null) action.run.run();
                return true;
            });
        }
    }

    private static int settingId(int id, boolean accountList) {
        return accountList && id == REMOVE_CONTEXTUAL ? REMOVE_MYLIST : id;
    }
}
