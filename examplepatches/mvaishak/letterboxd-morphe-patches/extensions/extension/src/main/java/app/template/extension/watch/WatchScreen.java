package app.template.extension.watch;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.navigation.Navigation;
import androidx.fragment.app.Fragment;

import com.google.android.material.appbar.MaterialToolbar;

import app.template.extension.ui.LoadingIndicator;
import app.template.extension.settings.Prefs;
import app.template.extension.settings.SurfaceColors;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

import static app.template.extension.watch.WatchAvailability.*;

final class WatchScreen {
    private static final JustWatch SOURCE = new JustWatch();
    private static final String[] ICON_IDS = {
            "ic_start_imageview_0", "ic_start_imageview_1", "ic_start_imageview_2",
            "ic_start_imageview_3", "ic_start_imageview_4"
    };

    private WatchScreen() {}

    static void attachRow(View row, Film film) {
        Object existing = row.getTag();
        if (existing instanceof Summary) {
            ((Summary) existing).update(film);
            return;
        }
        Summary summary = new Summary(row, film);
        row.setTag(summary);
        row.addOnAttachStateChangeListener(summary);
        if (row.isAttachedToWindow()) summary.onViewAttachedToWindow(row);
    }

    static boolean attachDetail(Fragment fragment, View root, Film film) {
        MaterialToolbar toolbar = WatchViews.find(root, "toolbar");
        View originalList = WatchViews.find(root, "listView");
        if (toolbar == null || originalList == null || !(originalList.getParent() instanceof ViewGroup)) {
            return false;
        }
        ViewGroup parent = (ViewGroup) originalList.getParent();
        int index = parent.indexOfChild(originalList);
        ViewGroup.LayoutParams layout = originalList.getLayoutParams();
        Context context = root.getContext();
        ScrollView scroll = new ScrollView(context);
        scroll.setId(originalList.getId());
        scroll.setFillViewport(true);
        parent.removeViewAt(index);
        parent.addView(scroll, index, layout);

        toolbar.setTitle(WatchViews.resource(context, "string", "film_where_to_watch"));
        toolbar.setNavigationOnClickListener(v -> Navigation.findNavController(root).navigateUp());
        LinearLayout panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(panel);
        new Detail(fragment, panel, film).refresh();
        return true;
    }

    private static final class Summary implements View.OnAttachStateChangeListener,
            SharedPreferences.OnSharedPreferenceChangeListener {
        private final View row;
        private final WatchPreferences preferences;
        private Film film;
        private int request;
        private Map<String, Set<Integer>> previous;

        Summary(View row, Film film) {
            this.row = row;
            this.film = film;
            preferences = new WatchPreferences(row.getContext());
        }

        void update(Film next) {
            if (film.sameFilm(next)) return;
            film = next;
            if (row.isAttachedToWindow()) refresh();
        }

        @Override public void onViewAttachedToWindow(View view) {
            preferences.listen(this);
            refresh();
        }

        @Override public void onViewDetachedFromWindow(View view) {
            preferences.unlisten(this);
            previous = null;
            request++;
        }

        @Override public void onSharedPreferenceChanged(SharedPreferences prefs, String key) {
            refresh();
        }

        private void refresh() {
            Map<String, Set<Integer>> selected = preferences.selections();
            if (selected.equals(previous)) return;
            previous = selected;
            int current = ++request;
            show(List.of());
            new MarketResults(selected).load(film, results -> {
                if (current != request) return;
                List<Offer> all = new ArrayList<>();
                for (String region : results.selections.keySet()) all.addAll(results.offers(region));
                show(previewServices(all, ICON_IDS.length));
            });
        }

        private void show(List<Service> services) {
            View badge = WatchViews.find(row, "own_badge_label");
            if (badge != null) badge.setVisibility(View.GONE);
            for (int i = 0; i < ICON_IDS.length; i++) {
                ImageView icon = WatchViews.find(row, ICON_IDS[i]);
                if (icon == null) continue;
                Service service = i < services.size() ? services.get(i) : null;
                boolean visible = service != null && service.icon() != null;
                icon.setVisibility(visible ? View.VISIBLE : View.GONE);
                icon.setContentDescription(visible ? service.name() : null);
                JustWatch.icon(icon, visible ? service.icon() : null);
            }
        }
    }

    private static final class Detail {
        private final Fragment fragment;
        private final LinearLayout panel;
        private final Film film;
        private final WatchPreferences preferences;
        private final Context context;
        private LoadingIndicator loading;
        private WatchServicePicker picker;
        private FrameLayout reminder;
        private MarketResults latest;
        private final SharedPreferences.OnSharedPreferenceChangeListener alertsChanged = (prefs, key) ->
                refreshReminder();
        private int request;

        Detail(Fragment fragment, LinearLayout panel, Film film) {
            this.fragment = fragment;
            this.panel = panel;
            this.film = film;
            context = panel.getContext();
            preferences = new WatchPreferences(context);
            panel.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View v) {
                    WatchAlerts.prefs(context).registerOnSharedPreferenceChangeListener(alertsChanged);
                    refreshReminder();
                }
                @Override public void onViewDetachedFromWindow(View v) {
                    WatchAlerts.prefs(context).unregisterOnSharedPreferenceChangeListener(alertsChanged);
                    if (loading != null) loading.setLoading(false);
                    if (picker != null) picker.dismiss();
                    request++;
                }
            });
        }

        void refresh() {
            int current = ++request;
            latest = null;
            Map<String, Set<Integer>> selected = preferences.selections();
            reset();
            if (selected.isEmpty()) {
                addStatus("Choose your streaming services in Settings.");
                footer(fallback());
                return;
            }
            if (film == null) {
                addStatus("Reopen the film to check its availability.");
                footer(null);
                return;
            }
            MarketResults lookup = new MarketResults(selected);
            showResults(lookup);
            lookup.load(film, results -> {
                if (current == request) showResults(results);
            });
        }

        private void showResults(MarketResults results) {
            latest = results;
            reset();
            boolean any = false;
            for (Kind kind : Kind.values()) {
                boolean first = true;
                for (String region : results.selections.keySet()) {
                    for (Offer offer : results.offers(region)) {
                        if (offer.kind() != kind) continue;
                        if (first) addHeader(kind);
                        first = false;
                        any = true;
                        addOffer(offer, region);
                    }
                }
            }
            if (results.waiting > 0) {
                addStatus("Checking availability…");
                loading = new LoadingIndicator(context, true);
                panel.addView(loading, new LinearLayout.LayoutParams(-1, -2));
                loading.setLoading(true);
            }
            if (results.failed > 0) {
                addStatus("Couldn’t check availability in "
                        + (results.selections.size() == 1 ? "this region." : "some regions."));
                panel.addView(WatchViews.row(panel, "Retry", null, this::refresh));
            } else if (!any && results.waiting == 0) {
                addStatus(results.titleUrl() == null ? "JustWatch couldn’t match this film in your selected regions."
                        : "No offers on your selected services.");
            }
            if (results.waiting == 0 || any) {
                String title = results.titleUrl();
                footer(title == null ? fallback() : title);
            }
        }

        private void addOffer(Offer offer, String region) {
            View row = WatchViews.row(panel, offer.service().name(), countryName(region),
                    () -> open(context, offer.url()));
            ImageView icon = WatchViews.find(row, "ic_start_imageview");
            if (icon != null && offer.service().icon() != null) {
                icon.setVisibility(View.VISIBLE);
                icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                JustWatch.icon(icon, offer.service().icon());
            }
            panel.addView(row);
        }

        private void reset() {
            if (loading != null) loading.setLoading(false);
            loading = null;
            panel.removeAllViews();
            View settings = WatchViews.row(panel, "Settings", null, this::openPicker);
            WatchViews.rowIcon(settings, "section_settings", "textColorSecondary", 3);
            panel.addView(settings);
            reminder = new FrameLayout(context);
            panel.addView(reminder);
            refreshReminder();
        }

        private void openPicker() {
            picker = new WatchServicePicker(context, preferences, SOURCE, this::refresh);
            picker.show();
        }

        private void refreshReminder() {
            if (reminder == null || film == null) return;
            reminder.removeAllViews();
            boolean on = WatchAlerts.armed(context, film);
            View row = WatchViews.row(reminder, on ? "Remove alert" : "Set alert", null, () -> {
                if (!on) {
                    Set<String> regions = preferences.selections().keySet();
                    if (regions.isEmpty()) {
                        openPicker();
                        return;
                    }
                    if (latest == null || !latest.known.keySet().containsAll(regions)) {
                        WatchViews.feedback(fragment, "Check availability before setting an alert.", false);
                        return;
                    }
                }
                boolean saved = on ? WatchAlerts.remove(context, film)
                        : WatchAlerts.arm(context, film, latest.known);
                refreshReminder();
                if (!saved) {
                    WatchViews.feedback(fragment, "Couldn’t update the alert.", true);
                } else if (!on) {
                    if (WatchAlerts.notificationsEnabled(context)) {
                        WatchViews.feedback(fragment, "Streaming alert set", false);
                    } else {
                        WatchAlerts.promptNotifications(context);
                    }
                }
            });
            WatchViews.rowIcon(row, "morphe_stream_alert_bell",
                    on ? "green00E054" : "textColorSecondary", 0);
            reminder.addView(row, new FrameLayout.LayoutParams(-1, WatchViews.dp(context, 48)));
        }

        private void addHeader(Kind kind) {
            View header = WatchViews.inflate(panel, "item_header");
            TextView text = WatchViews.find(header, "header_text");
            View memberStatus = WatchViews.find(header, "member_status");
            if (memberStatus != null) memberStatus.setVisibility(View.GONE);
            String resource = switch (kind) {
                case STREAM -> "availability_stream";
                case FREE -> "availability_free";
                case RENT -> "availability_rent";
                case BUY -> "availability_buy";
                case CINEMA -> "availability_cinema";
            };
            int id = WatchViews.resource(context, "string", resource);
            if (id == 0) text.setText("FREE");
            else text.setText(id);
            text.setAccessibilityHeading(true);
            panel.addView(header);
        }

        private TextView addStatus(String message) {
            TextView status = WatchViews.status(context);
            status.setText(message);
            panel.addView(status);
            return status;
        }

        private String fallback() {
            return film == null ? null : JustWatch.providerTitleUrl(film.justWatch());
        }

        private void footer(String titleUrl) {
            if (titleUrl != null) {
                String label = context.getString(WatchViews.resource(context, "string", "all_services"));
                panel.addView(WatchViews.row(panel, label, null, () -> open(context, titleUrl)));
            }
            View attribution = WatchViews.inflate(panel, "availability_powered_by_footer");
            attribution.setOnClickListener(v -> open(context,
                    titleUrl == null ? "https://www.justwatch.com" : titleUrl));
            attribution.setFocusable(true);
            panel.addView(attribution);
        }
    }

    private static final class MarketResults {
        private final Map<String, Set<Integer>> selections;
        private final Map<String, List<Offer>> offers = new HashMap<>();
        private final Map<String, String> links = new HashMap<>();
        private final Map<String, Set<Integer>> known = new HashMap<>();
        private int waiting;
        private int failed;

        MarketResults(Map<String, Set<Integer>> selections) {
            this.selections = selections;
            waiting = selections.size();
        }

        void load(Film film, Consumer<MarketResults> update) {
            selections.forEach((region, favorites) -> SOURCE.load(film, region, results -> {
                waiting--;
                offers.put(region, selectedOffers(results.offers(), favorites));
                known.put(region, WatchAlertRules.available(results.offers()));
                if (results.justWatch() != null) links.put(region, results.justWatch());
                update.accept(this);
            }, () -> {
                waiting--;
                failed++;
                update.accept(this);
            }));
        }

        List<Offer> offers(String region) {
            return offers.getOrDefault(region, List.of());
        }

        String titleUrl() {
            for (String region : selections.keySet()) {
                if (links.containsKey(region)) return links.get(region);
            }
            return null;
        }
    }

    private static String countryName(String code) {
        return new Locale("", code).getDisplayCountry();
    }

    private static void open(Context context, String url) {
        if (!JustWatch.https(url)) return;
        try {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (ActivityNotFoundException | SecurityException error) {
            Toast.makeText(context, "Couldn’t open the service link.", Toast.LENGTH_SHORT).show();
        }
    }
}
