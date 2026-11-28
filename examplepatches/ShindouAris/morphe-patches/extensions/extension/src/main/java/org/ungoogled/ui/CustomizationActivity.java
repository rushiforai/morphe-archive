package org.ungoogled.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.ungoogled.car.OverlaySettings;

/**
 * "Customization" screen, reached from the account sheet. Laid out like Maps'
 * own Settings screen (account sheet -> Settings): a 22 sp left-aligned title
 * with Maps' own close icon (gs_close_vd_theme_24) on the right, then plain
 * rows -- 16 sp title, 14 sp summary, 60 dp tall, no icons, no cards -- with
 * sizes measured pixel-for-pixel against that screen. Each toggle is shown
 * only when the patch it controls was included when Maps was patched.
 */
public final class CustomizationActivity extends Activity {
    // Maps' own palette: light = white / grey900 text / grey700 summary; dark = Material 3
    // neutral6 surface (#131314) / neutral90 text; Black theme = pure black surface.
    private static final int BG = 0xFFFFFFFF, TEXT = 0xFF1B1B1F, SUMMARY = 0xFF5F6368;
    private static final int BG_D = 0xFF131314, TEXT_D = 0xFFE3E3E3, SUMMARY_D = 0xFFC4C7C5;
    /**
     * Which page of this same screen: the main list; one of its sections (UI, Hide Telemetry,
     * Misc Features); or a page with its own account sheet row (Power Saving Options, Speeding chime).
     */
    static final String EXTRA_PAGE = "org.ungoogled.ui.page";
    static final String PAGE_POWER = "power", PAGE_WAZE = "waze", PAGE_UI = "ui", PAGE_HIDE = "hide", PAGE_MISC = "misc",
            PAGE_AUTO = "auto";

    private static String title(String page) {
        return Vi.t(englishTitle(page));
    }

    private static String englishTitle(String page) {
        if (PAGE_POWER.equals(page)) return "Power Saving Options";
        if (PAGE_WAZE.equals(page)) return "Speeding chime";
        if (PAGE_UI.equals(page)) return "UI";
        if (PAGE_HIDE.equals(page)) return "Hide Telemetry";
        if (PAGE_MISC.equals(page)) return "Misc Features";
        if (PAGE_AUTO.equals(page)) return "Android Auto";
        return "Customization";
    }
    private boolean dark, black;
    private TextView proxySub;
    private TextView playingMediaSub;

    private String proxySummary() {
        String effective = Shapes.proxy(this);
        return Vi.t(effective.isEmpty() ? "Off" : effective);
    }

    @Override protected void onResume() {
        super.onResume();
        refreshAccess();   // back from Waze Mod's or xADAS' screen: the answer may have changed
        if (proxySub != null) proxySub.setText(proxySummary());
        if (playingMediaSub != null) playingMediaSub.setText(playingMediaSummary(Screens.declared(this, MediaListener.class)));
    }

    private int bg() { return black ? 0xFF000000 : dark ? BG_D : BG; }
    private int text() { return dark ? TEXT_D : TEXT; }
    private int summary() { return dark ? SUMMARY_D : SUMMARY; }

    /** Same override configuration every Maps Activity gets from the patched base class. */
    @Override protected void attachBaseContext(android.content.Context base) {
        super.attachBaseContext(Shapes.wrap(base));
    }

    @Override protected void onCreate(Bundle savedInstanceState) {
        Screens.prepare(this);
        super.onCreate(savedInstanceState);
        // Follow Maps' theme, not the system's: Maps decides dark/light from its own
        // settings_preference/dark_mode (ON | OFF | FOLLOW_SYSTEM), see Shapes.enforceDark.
        black = Shapes.BLACK;
        String darkMode = getSharedPreferences("settings_preference", MODE_PRIVATE).getString("dark_mode", "FOLLOW_SYSTEM");
        boolean systemNight = (getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK) == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        dark = black || "ON".equals(darkMode) || (!"OFF".equals(darkMode) && systemNight);
        String page = getIntent().getStringExtra(EXTRA_PAGE);
        String pageTitle = title(page);
        setTitle(pageTitle);
        if (getActionBar() != null) getActionBar().hide();
        getWindow().getDecorView().setBackgroundColor(bg());
        getWindow().setStatusBarColor(bg());
        getWindow().setNavigationBarColor(bg());

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(bg());
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            int[] sb = Shapes.barInsets(insets, false);
            v.setPadding(sb[0], sb[1], sb[2], sb[3]);
            return insets;
        });

        // header, as on Settings: 22 sp left-aligned title, Maps' close icon on the right
        android.widget.FrameLayout header = new android.widget.FrameLayout(this);
        header.setPadding(dp(20), dp(20), dp(20), dp(12));
        TextView title = new TextView(this);
        title.setText(pageTitle);
        title.setTextColor(text());
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        header.addView(title, new android.widget.FrameLayout.LayoutParams(-2, -2, Gravity.START | Gravity.CENTER_VERTICAL));
        ImageView close = new ImageView(this);
        int closeRes = getResources().getIdentifier("gs_close_vd_theme_24", "drawable", getPackageName());
        close.setImageResource(closeRes != 0 ? closeRes : android.R.drawable.ic_menu_close_clear_cancel);
        close.setColorFilter(text());
        close.setContentDescription(Vi.t("Close"));
        close.setOnClickListener(v -> finish());
        header.addView(close, new android.widget.FrameLayout.LayoutParams(dp(24), dp(24), Gravity.END | Gravity.CENTER_VERTICAL));
        root.addView(header);

        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(0, dp(4), 0, dp(24));

        if (PAGE_POWER.equals(page)) buildPowerPage(body);
        else if (PAGE_WAZE.equals(page)) buildWazePage(body);
        else if (PAGE_UI.equals(page)) buildUiPage(body);
        else if (PAGE_HIDE.equals(page)) buildHidePage(body);
        else if (PAGE_MISC.equals(page)) buildMiscPage(body);
        else if (PAGE_AUTO.equals(page)) buildAutoPage(body);
        else buildMainPage(body);

        ScrollView sv = new ScrollView(this);
        sv.addView(body);
        root.addView(sv, new LinearLayout.LayoutParams(-1, 0, 1f));
        setContentView(root);
    }

    /** The main list: one row a section, each opening its own page, shown when any of its patches is present. */
    private void buildMainPage(LinearLayout body) {
        section(body, PAGE_UI, names(
                Shapes.rectShapesPatched(), "Rectangle Shapes",
                Shapes.blackThemePatched(), "Black theme",
                Shapes.lightMapPatched(), "Light map",
                Shapes.highRefreshPatched(), "120 refresh rate"));
        section(body, PAGE_HIDE, names(
                Shapes.hideAdsPatched(), "Sponsored content",
                Shapes.hideExplorePatched(), "Explore sheet",
                Shapes.hideTabsPatched(), "Bottom tabs",
                Shapes.hideDirectoryPatched(), "Suggestions",
                Shapes.hideAiPatched(), "AI"));
        section(body, PAGE_MISC, names(
                Shapes.navZoomPatched(), "Zoom controls in navigation",
                Shapes.betterOfflinePatched(), "Better offline maps",
                Shapes.locationSourcePatched(), "Location source",
                Shapes.mapRegionPatched(), "Map region",
                Shapes.proxyPatched(), "Proxy",
                Shapes.playingMediaPatched(), "Follow playing media",
                Shapes.anyMediaPatched(), "Media apps in navigation"));
        section(body, PAGE_AUTO, names(
                Screens.declared(this, org.ungoogled.car.MapsCarAppService.class), "Waze Mod",
                Screens.declared(this, org.ungoogled.car.MapsCarAppService.class), "xADAS"));
    }

    /** Android Auto: the Waze Mod overlay over Maps' car UI. The car screen follows these at once. */
    private void buildAutoPage(LinearLayout body) {
        // Waze Mod's Data API: Maps asks Waze Mod's own screen for permission, once.
        LinearLayout wazeRow = rowBase("Request Waze Mod permission",
                "Lets Maps read speed, speed limit and alerts from Waze Mod, for the overlay on Android Auto");
        wazeRow.setOnClickListener(v -> {
            Intent request = org.ungoogled.car.WazeModAccessActivity.request(this);
            if (request == null) {
                Toast.makeText(this, Vi.t(org.ungoogled.car.AccessCheck.wazeInstalled(this) != null
                        ? "Installed, but without the Data API (needs V14 or newer)"
                        : "Waze Mod with the Data API is not installed"), Toast.LENGTH_LONG).show();
                return;
            }
            startActivity(request);
        });
        body.addView(wazeRow);
        wazeSub = (TextView) ((LinearLayout) wazeRow.getChildAt(0)).getChildAt(1);

        // xADAS (Pro): the distance to the vehicle ahead. xADAS asks the user itself once Maps connects.
        LinearLayout xadasRow = rowBase("Request xADAS permission", XADAS_DESC);
        xadasRow.setOnClickListener(v -> requestXadas());
        body.addView(xadasRow);
        xadasSub = (TextView) ((LinearLayout) xadasRow.getChildAt(0)).getChildAt(1);
        refreshAccess();

        LinearLayout styleRow = rowBase("Style", OverlaySettings.STYLE_LABELS[styleIndex()]);
        TextView styleSub = (TextView) ((LinearLayout) styleRow.getChildAt(0)).getChildAt(1);
        styleRow.setOnClickListener(v -> choose("Style", OverlaySettings.STYLE_LABELS, styleIndex(), which -> {
            OverlaySettings.setStyle(this, OverlaySettings.STYLES[which]);
            styleSub.setText(Vi.t(OverlaySettings.STYLE_LABELS[which]));
        }));
        body.addView(styleRow);

        LinearLayout positionRow = rowBase("Position", OverlaySettings.POSITION_LABELS[OverlaySettings.position(this)]);
        TextView positionSub = (TextView) ((LinearLayout) positionRow.getChildAt(0)).getChildAt(1);
        positionRow.setOnClickListener(v -> choose("Position", OverlaySettings.POSITION_LABELS,
                OverlaySettings.position(this), which -> {
                    OverlaySettings.setPosition(this, which);
                    positionSub.setText(Vi.t(OverlaySettings.POSITION_LABELS[which]));
                }));
        body.addView(positionRow);

        String[] sizes = new String[OverlaySettings.SCALES.length];
        for (int i = 0; i < sizes.length; i++) sizes[i] = OverlaySettings.SCALES[i] + "%";
        LinearLayout sizeRow = rowBase("Size", OverlaySettings.scale(this) + "%");
        TextView sizeSub = (TextView) ((LinearLayout) sizeRow.getChildAt(0)).getChildAt(1);
        sizeRow.setOnClickListener(v -> {
            int current = 0;
            for (int i = 0; i < OverlaySettings.SCALES.length; i++) {
                if (OverlaySettings.SCALES[i] <= OverlaySettings.scale(this)) current = i;
            }
            choose("Size", sizes, current, which -> {
                OverlaySettings.setScale(this, OverlaySettings.SCALES[which]);
                sizeSub.setText(sizes[which]);
            });
        });
        body.addView(sizeRow);
    }

    private Runnable xadasRequest;

    /**
     * Asks xADAS for access for Maps: xADAS then lists Maps in its Settings and asks the user in a notification (what
     * it says is shown, and xADAS is opened to finish there). The connection is kept while this screen is open.
     */
    private void requestXadas() {
        if (xadasRequest != null) xadasRequest.run();
        xadasRequest = org.ungoogled.car.AccessCheck.requestXadas(this, access -> {
            if (isFinishing() || isDestroyed()) return;
            String message;
            switch (access) {
                case org.ungoogled.car.AccessCheck.ALLOWED: message = "Maps is already allowed in xADAS"; break;
                case org.ungoogled.car.AccessCheck.PENDING: message = "Allow Maps in xADAS: open its notification or Settings"; break;
                case org.ungoogled.car.AccessCheck.SHARING_OFF: message = "Turn on sharing with other apps in xADAS Pro Settings first"; break;
                case org.ungoogled.car.AccessCheck.NOT_INSTALLED: message = "xADAS is not installed"; break;
                default: message = "Maps is turned off in xADAS Settings"; break;
            }
            Toast.makeText(this, Vi.t(message), Toast.LENGTH_LONG).show();
            refreshAccess();
            if (access != org.ungoogled.car.AccessCheck.ALLOWED && access != org.ungoogled.car.AccessCheck.NOT_INSTALLED) {
                Intent open = getPackageManager().getLaunchIntentForPackage("com.kaibatech.drivedeck.xadas");
                if (open != null) startActivity(open);
            }
        });
    }

    @Override protected void onDestroy() {
        if (xadasRequest != null) xadasRequest.run();
        super.onDestroy();
    }

    private TextView wazeSub, xadasSub;
    private static final String WAZE_DESC = "Lets Maps read speed, speed limit and alerts from Waze Mod, for the overlay on Android Auto";
    private static final String XADAS_DESC = "Distance to the vehicle ahead. In xADAS Pro turn on sharing with other apps, then allow Maps";

    /** Asks Waze Mod and xADAS whether Maps is allowed, and shows the answers under their rows. */
    private void refreshAccess() {
        if (wazeSub == null || xadasSub == null) return;
        org.ungoogled.car.AccessCheck.waze(this, access -> showAccess(wazeSub, access, WAZE_DESC, "Not allowed yet",
                org.ungoogled.car.AccessCheck.wazeInstalled(this)));
        org.ungoogled.car.AccessCheck.xadas(this, access -> showAccess(xadasSub, access, XADAS_DESC,
                "Not allowed, or sharing is off in xADAS Pro", org.ungoogled.car.AccessCheck.xadasInstalled(this)));
    }

    /** [found] is what Maps sees of the app ("package version"), shown so a "not installed" can be traced. */
    private void showAccess(TextView sub, int access, String description, String notAllowed, String found) {
        if (isFinishing() || isDestroyed()) return;
        String status;
        switch (access) {
            case org.ungoogled.car.AccessCheck.ALLOWED: status = "✓ " + Vi.t("Allowed"); break;
            case org.ungoogled.car.AccessCheck.NOT_ALLOWED: status = "✗ " + Vi.t(notAllowed); break;
            case org.ungoogled.car.AccessCheck.NO_DATA_API: status = "✗ " + Vi.t("Installed, but without the Data API (needs V14 or newer)"); break;
            case org.ungoogled.car.AccessCheck.NOT_INSTALLED: status = "✗ " + Vi.t("Not installed"); break;
            default: status = "? " + Vi.t("Could not check"); break;
        }
        sub.setText(status + (found != null ? " (" + found + ")" : "") + "\n" + Vi.t(description));
    }

    private int styleIndex() {
        int style = OverlaySettings.style(this);
        for (int i = 0; i < OverlaySettings.STYLES.length; i++) if (OverlaySettings.STYLES[i] == style) return i;
        return 0;
    }

    /** A section's row: its title, what it holds, and its page when tapped. Left out when it holds nothing. */
    private void section(LinearLayout body, String page, String holds) {
        if (holds == null) return;
        LinearLayout r = rowBase(title(page), holds);
        r.setOnClickListener(v -> startActivity(Screens.intent(this, CustomizationActivity.class).putExtra(EXTRA_PAGE, page)));
        body.addView(r);
    }

    /** "A, B & C" of the names whose patch is present, from (present, name) pairs; null when none is. */
    private static String names(Object... pairs) {
        java.util.List<String> present = new java.util.ArrayList<>();
        for (int i = 0; i + 1 < pairs.length; i += 2) if ((Boolean) pairs[i]) present.add(Vi.t((String) pairs[i + 1]));
        if (present.isEmpty()) return null;
        if (present.size() == 1) return present.get(0);
        return String.join(", ", present.subList(0, present.size() - 1)) + Vi.t(" & ") + present.get(present.size() - 1);
    }

    /** UI: how Maps looks. */
    private void buildUiPage(LinearLayout body) {
        if (Shapes.rectShapesPatched()) {
            Switch rect = new Switch(this);
            rect.setChecked(Shapes.enabled(this));
            body.addView(toggleRow("Rectangle Shapes", "Changes circle & oval icons to squares & rectangles", rect));
            rect.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setEnabled(this, on);
                restartSoon(b);
            });
        }

        if (Shapes.blackThemePatched()) {
            Switch black = new Switch(this);
            black.setChecked(Shapes.blackEnabled(this));
            body.addView(toggleRow("Black theme", "Choosing a theme in Maps settings turns this off", black));
            black.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setBlackEnabled(this, on);
                restartSoon(b);
            });
        }

        if (Shapes.lightMapPatched()) {
            Switch light = new Switch(this);
            light.setChecked(Shapes.lightMapEnabled(this));
            body.addView(toggleRow("Light map", "Keeps the map light when menus are dark", light));
            light.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setLightMapEnabled(this, on);
                // the map picks its style when it is created
                restartSoon(b);
            });
        }

        if (Shapes.highRefreshPatched()) {
            Switch hz = new Switch(this);
            hz.setChecked(Shapes.highRefreshEnabled(this));
            body.addView(toggleRow("120 refresh rate", null, hz));
            hz.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setHighRefreshEnabled(this, on);
                // the window's rate is set when Maps starts
                restartSoon(b);
            });
        }
    }

    /** Hide Telemetry: what Maps shows that it should not. */
    private void buildHidePage(LinearLayout body) {
        if (Shapes.hideAdsPatched()) {
            Switch ads = new Switch(this);
            ads.setChecked(Shapes.hideAdsEnabled(this));
            body.addView(toggleRow("Hide sponsored content", "Removes promoted pins & sponsored search results", ads));
            ads.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setHideAdsEnabled(this, on);
                restartSoon(b);
            });
        }

        if (Shapes.hideExplorePatched()) {
            Switch explore = new Switch(this);
            explore.setChecked(Shapes.hideExploreEnabled(this));
            body.addView(toggleRow("Hide explore sheet", null, explore));
            explore.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setHideExploreEnabled(this, on);
                restartSoon(b);
            });
        }

        if (Shapes.hideTabsPatched()) {
            Switch tabs = new Switch(this);
            tabs.setChecked(Shapes.hideTabsEnabled(this));
            body.addView(toggleRow("Hide bottom tabs", null, tabs));
            tabs.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setHideTabsEnabled(this, on);
                restartSoon(b);
            });
        }

        if (Shapes.hideDirectoryPatched()) {
            Switch directory = new Switch(this);
            directory.setChecked(Shapes.hideDirectoryEnabled(this));
            body.addView(toggleRow("Hide suggestions", null, directory));
            // read each time a place sheet opens, so no restart
            directory.setOnCheckedChangeListener((CompoundButton b, boolean on) -> Shapes.setHideDirectoryEnabled(this, on));
        }

        if (Shapes.hideAiPatched()) {
            Switch ai = new Switch(this);
            ai.setChecked(Shapes.hideAiEnabled(this));
            body.addView(toggleRow("Hide AI", null, ai));
            // read each time a place sheet opens, so no restart
            ai.setOnCheckedChangeListener((CompoundButton b, boolean on) -> Shapes.setHideAiEnabled(this, on));
        }
    }

    /** Misc Features. */
    private void buildMiscPage(LinearLayout body) {
        if (Shapes.navZoomPatched()) {
            Switch navz = new Switch(this);
            navz.setChecked(Shapes.navZoomEnabled(this));
            body.addView(toggleRow("Zoom controls in navigation", null, navz));
            navz.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
                Shapes.setNavZoomEnabled(this, on);
                // no restart: the navigation ticker adds and removes the tiles live
            });
        }

        if (Shapes.betterOfflinePatched()) {
            Switch offline = new Switch(this);
            offline.setChecked(Shapes.betterOfflineEnabled(this));
            body.addView(toggleRow("Better offline maps", null, offline));
            // read live by the picker, so no restart
            offline.setOnCheckedChangeListener((CompoundButton b, boolean on) -> Shapes.setBetterOfflineEnabled(this, on));
        }

        if (Shapes.locationSourcePatched()) {
            // OsmAnd-style single choice. Every source is always listed; the two Play services ones
            // are greyed out and unselectable while they cannot answer. com.google.android.gms is
            // Google's or original microG; app.revanced.android.gms is microG-RE (issue #76).
            final String[] sources = {Shapes.SOURCE_ANDROID, Shapes.SOURCE_GOOGLE, Shapes.SOURCE_MICROG};
            final String[] options = {"Android location API", "Google Play Services or microG", "microG-RE"};
            final boolean[] usable = new boolean[sources.length];
            for (int i = 0; i < sources.length; i++) usable[i] = Shapes.locationSourceUsable(this, sources[i]);
            final int inUse = java.util.Arrays.asList(sources).indexOf(Shapes.locationSourceInUse(this));
            View locRow = row("Location source", options[inUse]);
            locRow.setOnClickListener(v -> {
                ChoiceAdapter adapter = new ChoiceAdapter(this, Vi.t(options), usable, text(), dark ? 0xFF6B6B6B : 0xFFB0B0B0);
                new AlertDialog.Builder(this, dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                        .setTitle(Vi.t("Location source"))
                        .setSingleChoiceItems(adapter, inUse, (d, which) -> {
                            d.dismiss();
                            if (which == inUse) return;
                            Shapes.setLocationSource(this, sources[which]);
                            restartSoon(v);
                        })
                        .setNegativeButton(Vi.t("Cancel"), null)
                        .show();
            });
            body.addView(locRow);
        }

        if (Shapes.mapRegionPatched()) {
            // Every country with a name in the phone's language, "Automatic" (Maps' own) first.
            String[] codes = java.util.Locale.getISOCountries();
            String[][] byName = new String[codes.length][];
            for (int i = 0; i < codes.length; i++) byName[i] = new String[] {new java.util.Locale("", codes[i]).getDisplayCountry(), codes[i]};
            java.util.Arrays.sort(byName, (x, y) -> java.text.Collator.getInstance().compare(x[0], y[0]));
            final String[] regions = new String[codes.length + 1], labels = new String[codes.length + 1];
            regions[0] = "";
            labels[0] = "Automatic";
            for (int i = 0; i < byName.length; i++) { labels[i + 1] = byName[i][0]; regions[i + 1] = byName[i][1]; }
            final int current = Math.max(0, java.util.Arrays.asList(regions).indexOf(Shapes.mapRegion(this)));
            View regionRow = row("Map region", current == 0 ? "Automatic (your SIM's country)" : labels[current]);
            regionRow.setOnClickListener(v -> choose("Map region", labels, current, which -> {
                if (which == current) return;
                Shapes.setMapRegion(this, regions[which]);
                // read when the map asks for tiles; a restart drops the ones already drawn
                restartSoon(v);
            }));
            body.addView(regionRow);
        }

        if (Shapes.proxyPatched()) {
            // its own screen (Enable / Host / Port), like OsmAnd's
            LinearLayout proxyRow = rowBase("Proxy", proxySummary());
            proxySub = (TextView) ((LinearLayout) proxyRow.getChildAt(0)).getChildAt(1);
            proxyRow.setOnClickListener(v -> startActivity(Screens.intent(this, ProxyActivity.class)));
            body.addView(proxyRow);
        }

        if (Shapes.playingMediaPatched()) {
            // Notification access is granted in Android's settings; the row says whether it is.
            boolean declared = Screens.declared(this, MediaListener.class);
            LinearLayout mediaRow = rowBase("Follow playing media", playingMediaSummary(declared));
            playingMediaSub = (TextView) ((LinearLayout) mediaRow.getChildAt(0)).getChildAt(1);
            if (declared) mediaRow.setOnClickListener(v -> PlayingMedia.requestAccess(this,
                    dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert));
            body.addView(mediaRow);
        }

        if (Shapes.anyMediaPatched()) {
            // The row of other apps in navigation's media panel shows about five (issue #78).
            LinearLayout appsRow = rowBase("Media apps in navigation", mediaAppsSummary());
            TextView appsSub = (TextView) ((LinearLayout) appsRow.getChildAt(0)).getChildAt(1);
            appsRow.setOnClickListener(v -> {
                java.util.List<String> all = MediaApps.candidates(this);
                java.util.List<String> chosen = MediaApps.chosen(this);
                for (String p : chosen) if (!all.contains(p)) all.add(p);     // chosen but not offered right now
                if (all.size() > 31) all = all.subList(0, 31);
                final java.util.List<String> apps = all;
                String[] labels = new String[apps.size()];
                int mask = 0;
                for (int i = 0; i < apps.size(); i++) {
                    labels[i] = MediaApps.label(this, apps.get(i));
                    if (chosen.contains(apps.get(i))) mask |= 1 << i;
                }
                chooseMany("Media apps in navigation", labels, mask, out -> {
                    java.util.List<String> picked = new java.util.ArrayList<>();
                    for (int i = 0; i < apps.size(); i++) if ((out & (1 << i)) != 0) picked.add(apps.get(i));
                    // read when navigation starts, so no restart
                    MediaApps.setChosen(this, picked);
                    appsSub.setText(mediaAppsSummary());
                });
            });
            body.addView(appsRow);
        }
    }

    private String mediaAppsSummary() {
        java.util.List<String> chosen = MediaApps.chosen(this);
        if (chosen.isEmpty()) return Vi.t("All, the one playing first");
        java.util.List<String> names = new java.util.ArrayList<>();
        for (String p : chosen) names.add(MediaApps.label(this, p));
        if (names.size() <= 3) return String.join(", ", names);
        return String.join(", ", names.subList(0, 2)) + Vi.t(" & ")
                + (Vi.on() ? (names.size() - 2) + " ứng dụng khác" : (names.size() - 2) + " more");
    }

    /** Speeding chime, opened from its own account sheet row. */
    private void buildWazePage(LinearLayout body) {
        if (Shapes.speedingChimePatched()) {
            LinearLayout chimeRow = rowBase("Speeding chime", CHIME_LABELS[Shapes.speedingChime(this)]);
            TextView chimeSub = (TextView) ((LinearLayout) chimeRow.getChildAt(0)).getChildAt(1);
            chimeRow.setOnClickListener(v -> choose("Speeding chime", CHIME_LABELS, Shapes.speedingChime(this), which -> {
                // read on every speedometer change, so no restart
                Shapes.setSpeedingChime(this, which);
                chimeSub.setText(Vi.t(CHIME_LABELS[which]));
            }));
            body.addView(chimeRow);
        }
    }

    /** Runs [update] every second while this screen is open. */
    private void live(Runnable update) {
        Handler h = new Handler(Looper.getMainLooper());
        h.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (isFinishing() || isDestroyed()) return;
                try {
                    update.run();
                } catch (Throwable t) {
                    android.util.Log.w("UA", "customization status", t);
                }
                h.postDelayed(this, 1000L);
            }
        }, 1000L);
    }

    /** SpeedAlerts' choices, in order. */
    private static final String[] CHIME_LABELS = {"Off", "Past the speed limit", "When the speedometer turns red", "10 mph or 20 km/h over the limit"};
    private static final String[] IDLE_LABELS = {"Off", "After 15 seconds", "After 30 seconds", "After 1 minute", "After 2 minutes"};
    private static final String[] LOW_FPS_LABELS = {"Off", "While navigating", "Everywhere"};

    private static String idleSummary(int seconds) {
        for (int i = 0; i < PowerSaving.IDLE_CHOICES.length; i++) {
            if (PowerSaving.IDLE_CHOICES[i] == seconds) return IDLE_LABELS[i];
        }
        return seconds > 0 ? Vi.t("After ") + seconds + Vi.t(" seconds") : "Off";
    }

    private static final String[] WAKE_LABELS = {"Off", "Back after 30 seconds", "Back after 1 minute", "Back after 2 minutes", "Back after 5 minutes"};

    private static String wakeSummary(int seconds) {
        for (int i = 1; i < PowerSaving.WAKE_CHOICES.length; i++) {
            if (PowerSaving.WAKE_CHOICES[i] == seconds) {
                return PowerSaving.WAKE_METERS + Vi.t(" m before a turn, ") + Vi.t(WAKE_LABELS[i]).toLowerCase(java.util.Locale.ROOT);
            }
        }
        return seconds > 0 ? PowerSaving.WAKE_METERS + Vi.t(" m before a turn, ") + Vi.t("back after ") + seconds + Vi.t(" seconds") : "Off";
    }

    private static String lowFpsSummary(int mode) {
        if (mode <= 0 || mode >= LOW_FPS_LABELS.length) return "Off";
        return Vi.t(LOW_FPS_LABELS[mode]) + Vi.t(": 15 fps and 30 Hz, as on the power saving screen");
    }

    /** Power Saving Options: Power saving mode itself, then the options around it. */
    private void buildPowerPage(LinearLayout body) {
        Switch power = new Switch(this);
        power.setChecked(PowerSaving.allPhones(this));
        body.addView(toggleRow("Power saving mode", "Enables the power saving mode from pixels for all devices", power));
        power.setOnCheckedChangeListener((CompoundButton b, boolean on) -> {
            PowerSaving.setAllPhones(this, on);
            // Maps asks whether to offer the feature when it starts
            restartSoon(b);
        });

        Switch unlocked = new Switch(this);
        unlocked.setChecked(PowerSaving.unlocked(this));
        body.addView(toggleRow("Open without locking", "A button in navigation opens the power saving screen", unlocked));
        // no restart: the navigation ticker adds and removes the button live
        unlocked.setOnCheckedChangeListener((CompoundButton b, boolean on) -> PowerSaving.setUnlocked(this, on));

        LinearLayout idleRow = rowBase("Auto-switch when idle", idleSummary(PowerSaving.idleSeconds(this)));
        TextView idleSub = (TextView) ((LinearLayout) idleRow.getChildAt(0)).getChildAt(1);
        idleRow.setOnClickListener(v -> {
            int current = 0;
            for (int i = 0; i < PowerSaving.IDLE_CHOICES.length; i++) {
                if (PowerSaving.IDLE_CHOICES[i] == PowerSaving.idleSeconds(this)) current = i;
            }
            choose("Auto-switch when idle", IDLE_LABELS, current, which -> {
                // read on every navigation tick, so no restart
                PowerSaving.setIdleSeconds(this, PowerSaving.IDLE_CHOICES[which]);
                idleSub.setText(Vi.t(IDLE_LABELS[which]));
            });
        });
        body.addView(idleRow);

        LinearLayout wakeRow = rowBase("Normal screen near turns", wakeSummary(PowerSaving.wakeSeconds(this)));
        TextView wakeSub = (TextView) ((LinearLayout) wakeRow.getChildAt(0)).getChildAt(1);
        wakeRow.setOnClickListener(v -> {
            int current = 0;
            for (int i = 0; i < PowerSaving.WAKE_CHOICES.length; i++) {
                if (PowerSaving.WAKE_CHOICES[i] == PowerSaving.wakeSeconds(this)) current = i;
            }
            choose("Normal screen near turns", WAKE_LABELS, current, which -> {
                // read for every navigation update, so no restart
                PowerSaving.setWakeSeconds(this, PowerSaving.WAKE_CHOICES[which]);
                wakeSub.setText(wakeSummary(PowerSaving.WAKE_CHOICES[which]));
            });
        });
        body.addView(wakeRow);

        Switch speedo = new Switch(this);
        speedo.setChecked(PowerSaving.speedometer(this));
        body.addView(toggleRow("Speedometer", "Your speed and the speed limit on the power saving screen", speedo));
        // read each time the power saving screen opens, so no restart
        speedo.setOnCheckedChangeListener((CompoundButton b, boolean on) -> PowerSaving.setSpeedometer(this, on));

        LinearLayout fpsRow = rowBase("Lower frame rate", lowFpsSummary(PowerSaving.lowFps(this)));
        fpsRow.setOnClickListener(v -> choose("Lower frame rate", LOW_FPS_LABELS, PowerSaving.lowFps(this), which -> {
            if (which == PowerSaving.lowFps(this)) return;
            PowerSaving.setLowFps(this, which);
            // the window's rate is set when Maps starts
            restartSoon(v);
        }));
        body.addView(fpsRow);

        LinearLayout themeRow = rowBase("Power saving theme", themeSummary(PowerSaving.theme(this)));
        themeRow.setOnClickListener(v -> choose("Power saving theme", THEME_LABELS, PowerSaving.theme(this), which -> {
            if (which == PowerSaving.theme(this)) return;
            PowerSaving.setTheme(this, which);
            // the map picks its style when it is built
            restartSoon(v);
        }));
        body.addView(themeRow);
    }

    private static final String[] THEME_LABELS = {"Off", "While navigating", "Everywhere"};

    private static String themeSummary(int mode) {
        if (mode == PowerSaving.THEME_NAV) return "While navigating: the power saving screen's black map";
        if (mode == PowerSaving.THEME_ALL) return "Everywhere: the power saving screen's black map, roads only, no place names";
        return "Off";
    }

    private interface Choice { void chosen(int which); }

    /** A single-choice dialog in Maps' theme, as the Location source row uses. */
    private void choose(String title, String[] labels, int checked, Choice then) {
        new AlertDialog.Builder(this, dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                .setTitle(Vi.t(title))
                .setSingleChoiceItems(Vi.t(labels), checked, (d, which) -> {
                    d.dismiss();
                    then.chosen(which);
                })
                .setNegativeButton(Vi.t("Cancel"), null)
                .show();
    }

    private interface Mask { void chosen(int mask); }

    /** A tick-list dialog in Maps' theme: bit i of [mask] is [labels][i]; OK hands the new mask on. */
    private void chooseMany(String title, String[] labels, int mask, Mask then) {
        boolean[] checked = new boolean[labels.length];
        for (int i = 0; i < labels.length; i++) checked[i] = (mask & (1 << i)) != 0;
        new AlertDialog.Builder(this, dark ? android.R.style.Theme_DeviceDefault_Dialog_Alert : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                .setTitle(Vi.t(title))
                .setMultiChoiceItems(labels, checked, (d, which, on) -> checked[which] = on)
                .setPositiveButton(Vi.t("OK"), (d, w) -> {
                    int out = 0;
                    for (int i = 0; i < checked.length; i++) if (checked[i]) out |= 1 << i;
                    then.chosen(out);
                })
                .setNegativeButton(Vi.t("Cancel"), null)
                .show();
    }

    /** Single-choice list whose unavailable entries (a location source that cannot answer) are
     *  greyed out and unselectable. */
    private static final class ChoiceAdapter extends android.widget.ArrayAdapter<String> {
        private final boolean[] available; private final int on, off;
        ChoiceAdapter(android.content.Context c, String[] items, boolean[] available, int on, int off) {
            super(c, android.R.layout.simple_list_item_single_choice, items);
            this.available = available; this.on = on; this.off = off;
        }
        @Override public boolean isEnabled(int position) { return available[position]; }
        @Override public boolean areAllItemsEnabled() {
            for (boolean a : available) if (!a) return false;
            return true;
        }
        @Override public View getView(int position, View convertView, android.view.ViewGroup parent) {
            View row = super.getView(position, convertView, parent);
            boolean enabled = isEnabled(position);
            row.setEnabled(enabled);
            if (row instanceof TextView) ((TextView) row).setTextColor(enabled ? on : off);
            return row;
        }
    }

    private void restartSoon(View v) {
        Toast.makeText(this, Vi.t("Restarting Maps to apply"), Toast.LENGTH_SHORT).show();
        v.postDelayed(() -> Shapes.restart(this), 600);
    }

    /** [title 16 sp / summary 14 sp] -- the Settings row, text only. */
    private String playingMediaSummary(boolean declared) {
        if (!declared) return Vi.t("Not on a root mount install");
        return Vi.t(PlayingMedia.allowed(this) ? "On" : "Needs notification access");
    }

    private LinearLayout rowBase(String label, String sub) {
        LinearLayout r = new LinearLayout(this);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(dp(20), dp(10), dp(20), dp(10));
        r.setMinimumHeight(dp(60));
        LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        TextView tv = new TextView(this);
        tv.setText(Vi.t(label));
        tv.setTextColor(text());
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        col.addView(tv);
        if (sub != null) {
            TextView s = new TextView(this);
            s.setText(Vi.t(sub));
            s.setTextColor(summary());
            s.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            col.addView(s);
        }
        r.addView(col, new LinearLayout.LayoutParams(0, -2, 1f));
        return r;
    }

    private View row(String label, String sub) { return rowBase(label, sub); }

    private View toggleRow(String label, String sub, Switch sw) {
        LinearLayout r = rowBase(label, sub);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
        lp.setMarginStart(dp(12));
        r.addView(sw, lp);
        r.setOnClickListener(v -> { if (sw.isEnabled()) sw.toggle(); });
        return r;
    }

    private int dp(int v) { return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics()); }

    /**
     * The account sheet's "Customization" row: opens this screen and leaves the sheet open
     * behind it (when Keep account sheet open is applied; otherwise the flag is unread).
     * The row builder hands over its Activity, because the sheet calls row listeners with
     * a null View.
     */
    public static final class Open implements View.OnClickListener {
        private final android.content.Context context;

        public Open(android.content.Context context) { this.context = context; }

        @Override
        public void onClick(View v) {
            Shapes.SKIP_DISMISS = true;
            context.startActivity(Screens.intent(context, CustomizationActivity.class));
        }
    }

    /** The Power Saving Options row on the account sheet: this screen's power page, the sheet left open behind it. */
    public static final class OpenPower implements View.OnClickListener {
        private final android.content.Context context;

        public OpenPower(android.content.Context context) { this.context = context; }

        @Override
        public void onClick(View v) {
            Shapes.SKIP_DISMISS = true;
            context.startActivity(Screens.intent(context, CustomizationActivity.class).putExtra(EXTRA_PAGE, PAGE_POWER));
        }
    }

    /** The Speeding chime row on the account sheet: this screen's chime page, the sheet left open behind it. */
    public static final class OpenWaze implements View.OnClickListener {
        private final android.content.Context context;

        public OpenWaze(android.content.Context context) { this.context = context; }

        @Override
        public void onClick(View v) {
            Shapes.SKIP_DISMISS = true;
            context.startActivity(Screens.intent(context, CustomizationActivity.class).putExtra(EXTRA_PAGE, PAGE_WAZE));
        }
    }

    /**
     * The Power Saving Options row's icon: Android's battery saver, a battery outline with a
     * plus, cut out of Maps' own solid battery (gs_battery_full_fill1) so it is tinted like the
     * sheet's other icons, in every theme.
     */
    public static android.graphics.drawable.Drawable powerRowIcon(android.graphics.drawable.Drawable battery) {
        return battery == null ? null : new BatterySaverIcon(battery);
    }

    /** [battery] seen through a stencil on Maps' 24 x 24 icon grid: its walls, and a plus inside. */
    static final class BatterySaverIcon extends android.graphics.drawable.DrawableWrapper {
        private final android.graphics.Path stencil = new android.graphics.Path(), scaled = new android.graphics.Path();
        private final android.graphics.Matrix matrix = new android.graphics.Matrix();

        BatterySaverIcon(android.graphics.drawable.Drawable battery) {
            super(battery);
            stencil.setFillType(android.graphics.Path.FillType.EVEN_ODD);
            stencil.addRect(-1, -1, 25, 25, android.graphics.Path.Direction.CW);
            // The battery's inside, as Maps' empty battery (gs_battery_0_bar) has it ...
            stencil.addRect(9, 6, 15, 20, android.graphics.Path.Direction.CW);
            // ... with a plus in its middle, clear of the walls.
            float cx = 12, cy = 13, a = 2.2f, t = 0.9f;
            stencil.moveTo(cx - t, cy - a);
            stencil.lineTo(cx + t, cy - a);
            stencil.lineTo(cx + t, cy - t);
            stencil.lineTo(cx + a, cy - t);
            stencil.lineTo(cx + a, cy + t);
            stencil.lineTo(cx + t, cy + t);
            stencil.lineTo(cx + t, cy + a);
            stencil.lineTo(cx - t, cy + a);
            stencil.lineTo(cx - t, cy + t);
            stencil.lineTo(cx - a, cy + t);
            stencil.lineTo(cx - a, cy - t);
            stencil.lineTo(cx - t, cy - t);
            stencil.close();
        }

        @Override
        public void draw(android.graphics.Canvas c) {
            android.graphics.Rect b = getBounds();
            if (b.isEmpty()) return;
            matrix.setScale(b.width() / 24f, b.height() / 24f);
            matrix.postTranslate(b.left, b.top);
            stencil.transform(matrix, scaled);
            int saved = c.save();
            c.clipPath(scaled);
            super.draw(c);
            c.restoreToCount(saved);
        }
    }
}
