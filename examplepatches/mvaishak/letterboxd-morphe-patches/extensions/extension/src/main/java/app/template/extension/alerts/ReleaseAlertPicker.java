package app.template.extension.alerts;

import static app.template.extension.alerts.ReleaseAlerts.call;
import static app.template.extension.alerts.ReleaseAlerts.color;
import static app.template.extension.alerts.ReleaseAlerts.dp;
import static app.template.extension.alerts.ReleaseAlerts.resource;

import android.content.Context;
import android.content.res.ColorStateList;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.google.android.material.checkbox.MaterialCheckBox;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

final class ReleaseAlertPicker {
    private static final String MODEL = "com.letterboxd.api.model.";
    private static final String ITEM = "com.letterboxd.letterboxd.ui.item.";

    private ReleaseAlertPicker() {}

    static View create(Context context, Collection<ReleaseAlert> alerts, Map<String, Object> releases,
                       Map<String, ReleaseAlert> selected) throws ReflectiveOperationException {
        // FilmReleaseListAdapter supplies the same date formatting, country spans, and Coil flags as Releases.
        Class<?> adapterClass = Class.forName(ITEM + "FilmReleaseListAdapter");
        Class<?> holderClass = Class.forName("androidx.recyclerview.widget.RecyclerView$ViewHolder");
        Constructor<?> dateRow = Class.forName(ITEM + "ReleaseRow$DateRow")
                .getConstructor(Class.forName("kotlinx.datetime.LocalDate"), List.class);
        Method createHolder = adapterClass.getMethod("onCreateViewHolder", ViewGroup.class, int.class);
        Method bindHolder = adapterClass.getMethod("onBindViewHolder", holderClass, int.class);
        Method submit = adapterClass.getMethod("submitList", List.class);

        Map<String, Map<LocalDate, List<ReleaseAlert>>> sections = new LinkedHashMap<>();
        for (String type : List.of("Premiere", "Theatrical_limited", "Theatrical", "Digital", "Physical", "TV")) {
            sections.put(type, new TreeMap<>());
        }
        for (ReleaseAlert alert : alerts) {
            sections.computeIfAbsent(alert.type, ignored -> new TreeMap<>())
                    .computeIfAbsent(alert.date, ignored -> new ArrayList<>()).add(alert);
        }

        LayoutInflater inflater = LayoutInflater.from(context);
        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, dp(context, 12), 0, dp(context, 8));
        scroll.addView(content);

        for (Map<LocalDate, List<ReleaseAlert>> dates : sections.values()) {
            if (dates.isEmpty()) continue;
            LinearLayout section = (LinearLayout) inflater.inflate(
                    resource(context, "fragment_film_releases_section", "layout"), content, false);
            section.setForeground(null);
            section.removeView(section.findViewById(resource(context, "list", "id")));
            TextView title = section.findViewById(resource(context, "sectionTitle", "id"));
            title.setText(dates.values().iterator().next().get(0).label);
            title.setAccessibilityHeading(true);
            content.addView(section);

            List<Object> rows = new ArrayList<>();
            for (List<ReleaseAlert> entries : dates.values()) {
                List<Object> nativeEntries = new ArrayList<>();
                for (ReleaseAlert alert : entries) {
                    Object release = releases.get(alert.key());
                    nativeEntries.add(release != null ? release : savedRelease(alert));
                }
                Object date = call(call(nativeEntries.get(0), "getReleaseDate"), "getKLocalDate");
                rows.add(dateRow.newInstance(date, nativeEntries));
            }

            Object adapter = adapterClass.getConstructor().newInstance();
            submit.invoke(adapter, rows);
            int index = 0;
            for (List<ReleaseAlert> entries : dates.values()) {
                Object holder = createHolder.invoke(adapter, section, 1);
                bindHolder.invoke(adapter, holder, index++);
                View row = (View) holderClass.getField("itemView").get(holder);
                LinearLayout countries = row.findViewById(resource(context, "country_container", "id"));
                TextView date = row.findViewById(resource(context, "date_view", "id"));
                date.setPaddingRelative(0, dp(context, 4), dp(context, 6), 0);
                for (int i = 0; i < entries.size(); i++) {
                    View info = countries.getChildAt(i);
                    countries.removeViewAt(i);
                    countries.addView(selectable(context, info, entries.get(i), date.getText(), selected), i);
                }
                section.addView(row);
            }
        }
        return scroll;
    }

    private static View selectable(Context context, View info, ReleaseAlert alert, CharSequence date,
                                   Map<String, ReleaseAlert> selected) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.TOP);
        row.setMinimumHeight(dp(context, 48));
        TypedValue ripple = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
            row.setBackgroundResource(ripple.resourceId);
        }
        info.setPaddingRelative(info.getPaddingStart(), dp(context, 4), 0, info.getPaddingBottom());
        row.addView(info, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        MaterialCheckBox box = new MaterialCheckBox(context);
        box.setUseMaterialThemeColors(false);
        box.setButtonTintList(new ColorStateList(
                new int[][]{{android.R.attr.state_checked}, {}},
                new int[]{color(context, "green00E054"), color(context, "textColorSecondary")}));
        box.setChecked(selected.containsKey(alert.key()));
        box.setContentDescription(alert.description() + ", " + date);
        box.setOnCheckedChangeListener((button, checked) -> {
            if (checked) selected.put(alert.key(), alert);
            else selected.remove(alert.key());
        });
        row.addView(box, new LinearLayout.LayoutParams(dp(context, 48), dp(context, 48)));
        row.setOnClickListener(v -> box.toggle());
        row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        info.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        return row;
    }

    // A saved alert can still be removed if the film is offline or Letterboxd changed its release data.
    private static Object savedRelease(ReleaseAlert alert) throws ReflectiveOperationException {
        Class<?> typeClass = Class.forName(MODEL + "Release$Type");
        Object companion = typeClass.getField("Companion").get(null);
        Object type = companion.getClass().getMethod("valueOf", String.class).invoke(companion, alert.type);
        Class<?> countryClass = Class.forName(MODEL + "Country");
        Object country = countryClass.getConstructor(String.class, String.class, java.net.URL.class)
                .newInstance(alert.countryCode, alert.country, null);
        Class<?> dateClass = Class.forName("com.letterboxd.api.support.LocalDate");
        Object date = dateClass.getConstructor(String.class).newInstance(alert.date.toString());
        return Class.forName(MODEL + "Release").getConstructor(typeClass, countryClass,
                Class.forName(MODEL + "Language"), String.class, String.class, dateClass)
                .newInstance(type, country, null, null, alert.note, date);
    }
}
