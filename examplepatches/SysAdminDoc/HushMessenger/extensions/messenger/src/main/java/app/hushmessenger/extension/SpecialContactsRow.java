package app.hushmessenger.extension;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * The people under Special contacts (#163): each one's name and the last thing seen, with History to read the rest and
 * Stop tracking. One per settings page, filled again on every return so someone tracked from the chat list shows up.
 */
final class SpecialContactsRow {
    /** The newest lines History shows, so a long history doesn't build hundreds of views. */
    static final int SHOWN_EVENTS = 100;

    private final SettingsActivity page;
    private final Set<String> open = new HashSet<>();
    private LinearLayout list;

    SpecialContactsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        list = page.ui.column();
        list.setTag("special_contacts_list");
        page.ui.add(content, list, 0);
        fill(null);
    }

    /** Filled again from what's saved. Focus goes back to the button that was used, if any, for TalkBack. */
    void fill(String focusTag) {
        if (list == null) return;
        list.removeAllViews();
        SettingsUi ui = page.ui;
        List<SpecialContactsStore.Person> people = SpecialContacts.list();
        if (people.isEmpty()) {
            TextView none = ui.text(page.text.get("special_contacts_empty"), 13, ui.muted, false);
            none.setTag("special_contacts_empty");
            ui.add(list, none, 8);
            return;
        }
        for (SpecialContactsStore.Person person : people) addPerson(person);
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled()) used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addPerson(SpecialContactsStore.Person person) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String id = person.id;
        String name = person.name.isEmpty() ? text.get("special_contacts_unnamed") : person.name;
        LinearLayout block = ui.column();
        block.setTag("special_contacts_person_" + id);
        ui.add(block, ui.text(name, 15, ui.text, false), 0);
        TextView latest = ui.text(person.latest == null ? text.get("special_contacts_nothing")
            : SpecialContacts.describe(page, text, person.latest), 13, ui.muted, false);
        latest.setTag("special_contacts_latest_" + id);
        ui.add(block, latest, 2);

        boolean showing = open.contains(id);
        LinearLayout buttons = ui.row();
        if (ui.largeText) buttons.setOrientation(LinearLayout.VERTICAL);
        String historyLabel = text.get(showing ? "special_contacts_hide_history" : "special_contacts_history");
        Button history = ui.button(historyLabel);
        history.setTag("special_contacts_history_" + id);
        history.setContentDescription(historyLabel + ", " + name);
        history.setOnClickListener(view -> {
            if (!open.remove(id)) open.add(id);
            fill((String) view.getTag());
        });
        Button stop = ui.button(text.get("special_contacts_untrack"));
        stop.setTag("special_contacts_stop_" + id);
        stop.setContentDescription(text.get("special_contacts_untrack") + ", " + name);
        stop.setOnClickListener(view -> {
            boolean stopped = SpecialContacts.stopTracking(id);
            open.remove(id);
            fill(null);
            page.feedback(text.get(stopped ? "special_contacts_untracked" : "special_contacts_failed"), Toast.LENGTH_SHORT);
        });
        buttons.addView(history, new LinearLayout.LayoutParams(ui.largeText ? -1 : -2, -2));
        LinearLayout.LayoutParams second = new LinearLayout.LayoutParams(ui.largeText ? -1 : -2, -2);
        if (ui.largeText) second.topMargin = ui.dp(6);
        else second.setMarginStart(ui.dp(8));
        buttons.addView(stop, second);
        ui.add(block, buttons, 6);

        if (showing) {
            LinearLayout lines = ui.column();
            lines.setTag("special_contacts_events_" + id);
            List<SpecialContactsStore.Event> events = SpecialContacts.history(id);
            if (events.isEmpty()) ui.add(lines, ui.text(text.get("special_contacts_nothing"), 13, ui.muted, false), 0);
            for (int i = 0; i < events.size() && i < SHOWN_EVENTS; i++)
                ui.add(lines, ui.text(SpecialContacts.describe(page, text, events.get(i)), 13, ui.text, false), i == 0 ? 0 : 4);
            Button clear = ui.button(text.get("special_contacts_clear"));
            clear.setTag("special_contacts_clear_" + id);
            clear.setContentDescription(text.get("special_contacts_clear") + ", " + name);
            clear.setEnabled(!events.isEmpty());
            clear.setOnClickListener(view -> {
                boolean cleared = SpecialContacts.clearHistory(id);
                fill((String) view.getTag());
                page.feedback(text.get(cleared ? "special_contacts_cleared" : "special_contacts_failed"), Toast.LENGTH_SHORT);
            });
            ui.add(lines, clear, 8);
            ui.add(block, lines, 8);
        }
        ui.add(list, block, 12);
    }
}
