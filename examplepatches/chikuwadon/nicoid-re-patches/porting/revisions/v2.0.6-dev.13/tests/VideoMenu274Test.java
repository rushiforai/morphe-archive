package e.e.a;

import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;
import java.util.ArrayList;
import java.util.List;

public final class VideoMenu274Test {
    static final int FULLSCREEN = 0x46f9;
    static final int SAVE = 0x46d2;
    static final int HISTORY = 0x46b8;
    static final int REMOVE_MYLIST = 0x46e0;
    static final int CONTEXT_REMOVE = 0x46b9;
    static final int NEXT = 0x46dc;
    static final int ADD_TO_QUEUE = 0x46dd;

    static final class Item implements MenuItem {
        final int id, order;
        final CharSequence title;
        boolean enabled = true;
        Click listener;

        Item(int id, int order, CharSequence title) {
            this.id = id;
            this.order = order;
            this.title = title;
        }
        public int getItemId() { return id; }
        public int getOrder() { return order; }
        public CharSequence getTitle() { return title; }
        public boolean isEnabled() { return enabled; }
        public MenuItem setEnabled(boolean enabled) { this.enabled = enabled; return this; }
        public MenuItem setOnMenuItemClickListener(Click next) { listener = next; return this; }
    }

    static final class Popup implements Menu {
        final List<Item> items = new ArrayList<>();
        public MenuItem add(int group, int id, int order, CharSequence title) {
            Item next = new Item(id, order, title);
            items.add(next);
            return next;
        }
        public void clear() { items.clear(); }
    }

    static List<ListActions.Action> actions(List<Integer> clicked, Integer... ids) {
        List<ListActions.Action> actions = new ArrayList<>();
        for (int id : ids) {
            Item item = new Item(id, 0, "Action " + id);
            item.enabled = id != 99;
            actions.add(new ListActions.Action(item, () -> clicked.add(id)));
        }
        return actions;
    }

    static void equal(Object actual, Object expected) {
        if (!actual.equals(expected)) throw new AssertionError(actual + " != " + expected);
    }

    static void check(Popup popup, List<ListActions.Action> actions, Integer... expected) {
        equal(popup.items.stream().map(item -> item.id).toList(), List.of(expected));
        equal(actions.stream().map(action -> action.id).toList(), List.of(expected));
    }

    public static void main(String[] args) {
        Activity host = new Activity();
        host.order.addAll(List.of(5, 6, FULLSCREEN, 9, 7, REMOVE_MYLIST, NEXT,
                ADD_TO_QUEUE, SAVE, 10, HISTORY));
        Popup popup = new Popup();
        List<Integer> clicked = new ArrayList<>();
        List<ListActions.Action> actions = actions(clicked, 5, 6, FULLSCREEN, 9, SAVE, 10,
                7, HISTORY, NEXT, ADD_TO_QUEUE, 99, 101);
        VideoMenu274.publish(popup, actions, host);
        check(popup, actions, 5, 6, FULLSCREEN, 9, 7, NEXT, ADD_TO_QUEUE, SAVE, 10, HISTORY, 99, 101);

        host.order.remove((Integer) HISTORY);
        host.order.add(0, HISTORY);
        for (int id : new int[]{5, 7, 10, SAVE, ADD_TO_QUEUE}) host.hidden.add(MenuOptions119.key(id));
        VideoMenu274.publish(popup, actions, host);
        check(popup, actions, HISTORY, 6, FULLSCREEN, 9, NEXT, 99, 101);
        Item item = popup.items.get(2);
        item.listener.click(item);
        actions.get(4).run.run();
        Item disabled = popup.items.get(5);
        equal(disabled.enabled, false);
        disabled.listener.click(disabled);
        equal(clicked, List.of(FULLSCREEN, NEXT));

        equal(VideoMenu274.nativeId(new Item(9, 2, "Popup")), 9);
        equal(VideoMenu274.nativeId(new Item(9, 5, "Remove from mylist")), REMOVE_MYLIST);
        host.account = true;
        actions = actions(clicked, CONTEXT_REMOVE, 9, REMOVE_MYLIST);
        VideoMenu274.publish(popup, actions, host);
        check(popup, actions, 9, CONTEXT_REMOVE);
        host.hidden.add(MenuOptions119.key(REMOVE_MYLIST));
        VideoMenu274.publish(popup, actions, host);
        check(popup, actions, 9);
        host.account = false;
        actions = actions(clicked, CONTEXT_REMOVE, 9);
        VideoMenu274.publish(popup, actions, host);
        check(popup, actions, 9, CONTEXT_REMOVE);
        System.out.println("PASS: default/custom order, visibility, callbacks and shared triangle/long-press actions");
    }
}
