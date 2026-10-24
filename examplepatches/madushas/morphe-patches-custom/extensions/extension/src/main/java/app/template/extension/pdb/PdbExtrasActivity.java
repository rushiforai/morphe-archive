package app.template.extension.pdb;

import app.template.extension.BuildConfig;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * The "Pdb Extras" screen, opened from the "Pdb Extras" row at the top of Pdb's
 * Settings screen (wired by {@link SettingsEntryHook}).
 *
 * <p>Redesigned (v0.3.8) into four tabs so the page works for non-power users
 * too:
 *
 * <ul>
 *   <li><b>Quick</b> — the everyday switches (profile IDs, receipts, pause) with
 *       plain-language labels, plus one-tap actions (visitors, chats, icon…).</li>
 *   <li><b>Power</b> — user inspector, direct chat by id, hidden-screens launcher,
 *       deep-link tester, app-icon switcher.</li>
 *   <li><b>Data</b> — read-only local data: database stats/schema/browser, chat
 *       statistics, visitors, streaks, drafts, full text backup.</li>
 *   <li><b>Advanced</b> — identity/transport (MMKV), hidden backend overrides,
 *       developer switches, diagnostics, export/import/reset.</li>
 * </ul>
 *
 * <p>A single shared result drawer sits directly under the tab bar and appears
 * the moment any tool produces output (previously the user had to scroll to the
 * bottom of one long page to read results). The UI is assembled from Pdb's own
 * widgets through {@link PdbUi}, so it matches the app's typography, colors and
 * dark mode.
 */
public final class PdbExtrasActivity extends Activity {

    private static final int TAB_QUICK = 0;
    private static final int TAB_LIMITS = 1;
    private static final int TAB_POWER = 2;
    private static final int TAB_DATA = 3;
    private static final int TAB_ADVANCED = 4;
    private static final int TAB_COUNT = 5;
    private static final String[] TAB_NAMES = {"Quick", "Limits", "Power", "Data", "Advanced"};

    private FrameLayout root;
    private LinearLayout content;          // tab currently being built
    private LinearLayout resultArea;       // shared result drawer (under tab bar)
    private TextView result;
    private FrameLayout tabHost;
    private final View[] tabViews = new View[TAB_COUNT];
    private final TextView[] chips = new TextView[TAB_COUNT];

    private final List<EditText> textFields = new ArrayList<>();
    private EditText inspectorInput;
    private EditText chatQuery;
    private EditText deeplinkInput;
    private EditText deviceId;
    private EditText imUrl;
    private EditText tableName;

    /** label → morphe key for the everyday switches on the Quick tab. */
    private static final String[][] QUICK_SWITCH_ROWS = {
        {"Show profile IDs next to names", PdbSettings.IDS_EVERYWHERE},
        {"Disable read receipts", PdbSettings.PRIVACY_RECEIPTS},
        {"Ignore \u201csee more\u201d walls", PdbSettings.PRIVACY_SEE_MORE},
        {"Stay signed in", PdbSettings.REMEMBER_AUTH},
        {"Show floating power button", PdbSettings.BUBBLE},
        {"Pause all Morphe extras", PdbSettings.GLOBAL_PAUSE},
    };

    /** label → morphe key for the developer switches on the Advanced tab. */
    private static final String[][] DEV_SWITCH_ROWS = {
        {"Force offer sheet", PdbSettings.FORCE_OFFER},
        {"Use staging backend", PdbSettings.API_STAGING},
        {"Show full error messages", PdbSettings.SHOW_FULL_ERROR},
        {"Stream connect toast", PdbSettings.IM_CONNECT_TOAST},
        {"Force English", PdbSettings.FORCE_ENGLISH},
        {"Verbose file logging", PdbSettings.ADVANCED_LOGGING},
    };

    /** hint → morphe key for the backend/identity overrides on the Advanced tab. */
    private static final String[][] TEXT_ROWS = {
        {"Feed country \u2014 two-letter code, e.g. US, TH", PdbSettings.GEO_COUNTRY},
        {"Spoof GPS \u2014 lat,lng, e.g. 40.7128,-74.0060", PdbSettings.MOCK_LATLNG},
        {"Pin instant chat to a user id \u2014 numeric", PdbSettings.INSTANT_CHAT_USER},
        {"Extra trusted web host \u2014 domain only", PdbSettings.WHITELIST_HOST},
        {"Bubble tap target \u2014 full https URL", PdbSettings.BUBBLE_URL},
    };

    /** Hidden-screens launcher: label → kept activity class (from Pdb's router map). */
    private static final String[][] HIDDEN_SCREENS = {
        {"Profile visitors", PdbNav.USER_VISITOR},
        {"User center", PdbNav.USER_CENTER},
        {"Coins engage", PdbNav.COINS_ENGAGE},
        {"Balance", PdbNav.BALANCE},
        {"Community info", PdbNav.COMMUNITY_INFO},
        {"Verify", PdbNav.VERIFY},
        {"Story editor", PdbNav.STORY_EDITOR},
        {"Profile settings", PdbNav.PROFILE_SETTING},
        {"PDB page manager", PdbNav.DB_PAGE},
        {"Instant chat history", PdbNav.INSTANT_HISTORY},
        {"Community explore", PdbNav.COMMUNITY_EXPLORE},
        {"Boards explore", PdbNav.BOARD_EXPLORE},
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            getWindow().setDecorFitsSystemWindows(true);
        } catch (Throwable ignored) {
        }
        try {
            PdbMmkv.init(this);
            setContentView(buildScreen());
            applySystemBarInsets();
            selectTab(TAB_QUICK);
        } catch (Throwable t) {
            PdbTools.toast(this, "Morphe Extras: " + t);
            finish();
        }
    }

    /**
     * Keeps the title below the status bar and the footer above the navigation bar.
     * The activity uses the app's edge-to-edge theme, so the content would otherwise
     * start underneath the clock/battery icons.
     */
    private void applySystemBarInsets() {
        if (root == null) return;
        root.post(new Runnable() {
            @Override
            public void run() {
                int top = 0;
                int bottom = 0;
                try {
                    android.view.WindowInsets insets =
                        getWindow().getDecorView().getRootWindowInsets();
                    if (insets != null) {
                        if (android.os.Build.VERSION.SDK_INT >= 30) {
                            android.graphics.Insets bars = insets.getInsets(
                                android.view.WindowInsets.Type.systemBars());
                            top = bars.top;
                            bottom = bars.bottom;
                        } else {
                            top = insets.getSystemWindowInsetTop();
                            bottom = insets.getSystemWindowInsetBottom();
                        }
                    }
                } catch (Throwable ignored) {
                }
                if (top == 0) {
                    int id = getResources().getIdentifier("status_bar_height", "dimen", "android");
                    if (id != 0) top = getResources().getDimensionPixelSize(id);
                }
                // Pad the root, not the scrolling content: otherwise rows scroll
                // underneath the clock/battery icons and the gesture bar.
                root.setPadding(0, top, 0, bottom);
            }
        });
    }

    /* ── screen construction ── */

    private View buildScreen() {
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        int pad = PdbUi.dp(this, 16);
        page.setPadding(pad, PdbUi.dp(this, 8), pad, 0);

        TextView title = PdbUi.text(this, "Pdb Extras v" + BuildConfig.EXTRAS_VERSION, 22, "gray_01", 0xFF1C1C1E);
        title.setPadding(0, 0, 0, PdbUi.dp(this, 2));
        page.addView(title);

        TextView status = PdbUi.text(this, PdbTools.summary(this), 12, "gray_03", 0xFF8E8E93);
        status.setPadding(0, 0, 0, PdbUi.dp(this, 8));
        page.addView(status);

        page.addView(tabBar());

        // Shared result drawer: hidden until a tool produces output.
        resultArea = new LinearLayout(this);
        resultArea.setOrientation(LinearLayout.VERTICAL);
        resultArea.setVisibility(View.GONE);
        TextView resultLabel = PdbUi.sectionLabel(this, "Result  (tap text to select \u00b7 copied to clipboard where useful)");
        resultArea.addView(resultLabel);
        LinearLayout card = PdbUi.card(this);
        resultArea.addView(card, PdbUi.cardParams(this));
        result = PdbUi.text(this, "", 12, "gray_02", 0xFF3A3A3C);
        result.setTextIsSelectable(true);
        int rpad = PdbUi.dp(this, 12);
        result.setPadding(rpad, rpad, rpad, rpad);
        ScrollView scroller = new ScrollView(this);
        scroller.addView(result);
        card.addView(scroller, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, PdbUi.dp(this, 200)));
        page.addView(resultArea, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Tab contents.
        tabHost = new FrameLayout(this);
        page.addView(tabHost, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        for (int i = 0; i < TAB_COUNT; i++) {
            content = new LinearLayout(this);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(0, PdbUi.dp(this, 8), 0, PdbUi.dp(this, 24));
            switch (i) {
                case TAB_QUICK:
                    quickTab();
                    break;
                case TAB_LIMITS:
                    limitsTab();
                    break;
                case TAB_POWER:
                    powerTab();
                    break;
                case TAB_DATA:
                    dataTab();
                    break;
                case TAB_ADVANCED:
                    advancedTab();
                    break;
            }
            ScrollView scroll = new ScrollView(this);
            scroll.setFillViewport(true);
            scroll.addView(content);
            scroll.setVisibility(View.GONE);
            tabViews[i] = scroll;
            tabHost.addView(scroll, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        content = null;

        root = new FrameLayout(this);
        root.addView(page, new ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return root;
    }

    private View tabBar() {
        HorizontalScrollView bar = new HorizontalScrollView(this);
        bar.setHorizontalScrollBarEnabled(false);
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        int gap = PdbUi.dp(this, 8);
        for (int i = 0; i < TAB_COUNT; i++) {
            TextView chip = new TextView(this);
            chip.setText(TAB_NAMES[i]);
            chip.setTextSize(14);
            chip.setAllCaps(false);
            chip.setPadding(PdbUi.dp(this, 18), PdbUi.dp(this, 8),
                PdbUi.dp(this, 18), PdbUi.dp(this, 8));
            chip.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (i > 0) lp.leftMargin = gap;
            row.addView(chip, lp);
            chips[i] = chip;
            final int index = i;
            chip.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    selectTab(index);
                }
            });
        }
        bar.addView(row);
        return bar;
    }

    private void selectTab(int index) {
        for (int i = 0; i < TAB_COUNT; i++) {
            boolean selected = i == index;
            tabViews[i].setVisibility(selected ? View.VISIBLE : View.GONE);
            GradientDrawable bg = new GradientDrawable();
            bg.setCornerRadius(PdbUi.dp(this, 20));
            bg.setColor(selected ? PdbUi.color(this, "purple", 0xFF6C5CE7) : 0x00000000);
            chips[i].setBackground(bg);
            chips[i].setTextColor(selected
                ? PdbUi.color(this, "white", 0xFFFFFFFF)
                : PdbUi.color(this, "gray_03", 0xFF8E8E93));
        }
    }

    /* ── Quick tab ── */

    private void quickTab() {
        section("Everyday switches");
        LinearLayout card = newCard();
        note(card, "Switches marked \u2022 apply on next launch; the rest apply immediately.");
        for (final String[] rowSpec : QUICK_SWITCH_ROWS) {
            card.addView(switchRow(rowSpec[0], rowSpec[1]));
        }

        section("One-tap actions");
        LinearLayout actions = newCard();
        actions.addView(row("Profile visitors", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PdbNav.start(PdbExtrasActivity.this, PdbNav.USER_VISITOR);
            }
        }));
        actions.addView(row("Chat statistics", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Chat stats", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.chatStats(PdbExtrasActivity.this);
                    }
                });
            }
        }));
        actions.addView(row("Recent chats", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Recent chats", new Work() {
                    @Override
                    public String run() {
                        return PdbTools.chatExport(PdbExtrasActivity.this, null, 50);
                    }
                });
            }
        }));
        actions.addView(row("Switch app icon (MBTI / themes)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iconMenu(v);
            }
        }));
        actions.addView(row("Open native dev screen (Tweaks)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PdbNav.start(PdbExtrasActivity.this, PdbNav.TWEAKS);
            }
        }));
        actions.addView(row("Close", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        }));

        note(null, "More: Limits = extend the app's own caps \u00b7 Power = tools \u00b7 "
            + "Data = database reads \u00b7 Advanced = overrides, identity, diagnostics.");
    }

    /* ── Limits tab ── */

    /**
     * Client-side limits only. Pdb's premium Soul filters (personality / region)
     * are refused by the server with "need to be pro user to access" — no client
     * patch can lift those, so they are called out instead of faked.
     */
    private void limitsTab() {
        section("Client-side limits");
        LinearLayout card = newCard();
        note(card, "Pdb enforces some caps in its own code and some on the server. "
            + "Only the local ones can be extended here.");
        card.addView(switchRow("No profile-visitor limit", PdbSettings.NO_VISITOR_LIMIT));
        card.addView(row("Show the app's counters", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Counters", new Work() {
                    @Override
                    public String run() {
                        return PdbLimits.counterReport(PdbExtrasActivity.this);
                    }
                });
            }
        }));
        card.addView(row("Reset daily counters now", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Reset counters", new Work() {
                    @Override
                    public String run() {
                        return PdbLimits.resetDailyCounters(PdbExtrasActivity.this);
                    }
                });
            }
        }));

        section("How far this goes");
        LinearLayout facts = newCard();
        note(facts, "Profile-visitor limit \u2014 the app's own 3-per-hour rule on opening "
            + "visitor profiles and tapping visitor cards, kept in its local store. "
            + "Extendable, and this switch lifts it.");
        note(facts, "Daily counters \u2014 likes, replies, swipes and chat entries are "
            + "counted locally per day. Resetting them restarts your own allowance "
            + "without waiting for tomorrow.");
        note(facts, "Premium Soul filters \u2014 personality and region filtering is a "
            + "paid entitlement checked by the server, which answers \u201cneed to be pro "
            + "user to access\u201d. The sheet opens in this build, but the server still "
            + "refuses the write; no client patch changes that.");
        note(facts, "Coins, boosts and ads budgets \u2014 server-side, out of reach.");

        note(null, "Tip: the floating power button (Quick tab) puts the most-used "
            + "switches one tap away on any screen.");
    }

    /* ── Power tab ── */

    private void powerTab() {
        section("Power tools");
        LinearLayout card = newCard();

        card.addView(row("User inspector \u2014 look up any id / @name", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String input = inspectorInput == null ? "" : inspectorInput.getText().toString();
                runAsync("User inspector", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.userById(PdbExtrasActivity.this, input);
                    }
                });
            }
        }));
        card.addView(row("Open profile of entered id", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String id = PdbDatabase.resolveUserId(PdbExtrasActivity.this, input());
                if (id == null) {
                    PdbTools.toast(PdbExtrasActivity.this, "Morphe: enter a user id or @name first");
                    return;
                }
                PdbNav.openProfile(PdbExtrasActivity.this, id);
            }
        }));
        card.addView(row("Instant-chat as entered id", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                directChat();
            }
        }));
        card.addView(row("Clear instant-chat override", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PdbTools.prefs(PdbExtrasActivity.this).edit()
                    .remove(PdbSettings.PDB_IM_CHAT_USER)
                    .remove(PdbSettings.INSTANT_CHAT_USER).apply();
                PdbTools.toast(PdbExtrasActivity.this, "Morphe: instant-chat override cleared");
            }
        }));
        card.addView(row("Open instant chat", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PdbNav.openInstantChat(PdbExtrasActivity.this);
            }
        }));
        card.addView(row("Hidden screens launcher (" + HIDDEN_SCREENS.length + ")", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                List<PdbMenu.Item> items = new ArrayList<>();
                for (final String[] screen : HIDDEN_SCREENS) {
                    items.add(new PdbMenu.Item() {
                        @Override
                        public String label() {
                            return screen[0];
                        }

                        @Override
                        public void run() {
                            PdbNav.start(PdbExtrasActivity.this, screen[1]);
                        }
                    });
                }
                PdbMenu.show(v, items);
            }
        }));
        card.addView(row("Open entered deep link", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String link = deeplinkInput == null ? "" : deeplinkInput.getText().toString();
                if (link.trim().isEmpty()) {
                    PdbTools.toast(PdbExtrasActivity.this, "Morphe: type a pdb:// link first");
                    return;
                }
                PdbNav.openLink(PdbExtrasActivity.this, link);
            }
        }));
        card.addView(row("Switch app icon (MBTI / themes)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                iconMenu(v);
            }
        }));

        inspectorInput = PdbUi.field(this, "user id or @username");
        card.addView(inspectorInput);
        card.addView(PdbUi.spacer(this, 4));
        deeplinkInput = PdbUi.field(this, "pdb://app/router?link=\u2026 or any deep link");
        card.addView(deeplinkInput);
    }

    /* ── Data tab ── */

    private void dataTab() {
        section("Local data (read-only)");
        LinearLayout card = newCard();

        card.addView(row("Database stats (files, tables, row counts)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Databases", new Work() {
                    @Override
                    public String run() {
                        return PdbTools.dbStats(PdbExtrasActivity.this);
                    }
                });
            }
        }));
        card.addView(row("Dump database schema", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Schema", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.schema(PdbExtrasActivity.this);
                    }
                });
            }
        }));
        tableName = PdbUi.field(this, "table name (e.g. channel_info)");
        tableName.setText("channel_info");
        card.addView(tableName);
        card.addView(row("Browse table (first 20 rows)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String name = tableName == null ? "" : tableName.getText().toString();
                runAsync("Table", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.table(PdbExtrasActivity.this, name, 20);
                    }
                });
            }
        }));
        card.addView(row("Chat statistics", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Chat stats", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.chatStats(PdbExtrasActivity.this);
                    }
                });
            }
        }));
        card.addView(row("Recent chats", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Recent chats", new Work() {
                    @Override
                    public String run() {
                        return PdbTools.chatExport(PdbExtrasActivity.this, null, 50);
                    }
                });
            }
        }));
        card.addView(row("Search chats", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String query = chatQuery == null ? "" : chatQuery.getText().toString();
                runAsync("Chat search", new Work() {
                    @Override
                    public String run() {
                        return PdbTools.chatExport(PdbExtrasActivity.this, query, 50);
                    }
                });
            }
        }));
        card.addView(row("Visitor digest (grouped)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Visitor digest", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.visitorDigest(PdbExtrasActivity.this, 50);
                    }
                });
            }
        }));
        card.addView(row("Profile view log", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Profile views", new Work() {
                    @Override
                    public String run() {
                        return PdbTools.visitorLog(PdbExtrasActivity.this, 50);
                    }
                });
            }
        }));
        card.addView(row("Profile feed (local cache)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Profile feed", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.feed(PdbExtrasActivity.this, 30);
                    }
                });
            }
        }));
        card.addView(row("Streak radar", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Streak radar", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.streaks(PdbExtrasActivity.this, 30);
                    }
                });
            }
        }));
        card.addView(row("Unsent drafts recovery", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Drafts", new Work() {
                    @Override
                    public String run() {
                        return PdbDatabase.drafts(PdbExtrasActivity.this, 30);
                    }
                });
            }
        }));
        card.addView(row("Backup & share everything (text)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                runAsync("Backup", new Work() {
                    @Override
                    public String run() {
                        return buildBackup();
                    }
                });
            }
        }));

        chatQuery = PdbUi.field(this, "chat search text (empty = latest)");
        card.addView(chatQuery);
    }

    /* ── Advanced tab ── */

    private void advancedTab() {
        section("Backend & identity overrides — leave blank to disable");
        LinearLayout overrides = newCard();
        for (final String[] rowSpec : TEXT_ROWS) {
            EditText edit = PdbUi.field(this, rowSpec[0]);
            edit.setText(PdbSettings.getString(PdbTools.prefs(this), rowSpec[1], ""));
            edit.setTag(rowSpec[1]);
            textFields.add(edit);
            overrides.addView(edit);
        }
        overrides.addView(row("Save text overrides", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                android.content.SharedPreferences.Editor e =
                    PdbTools.prefs(PdbExtrasActivity.this).edit();
                for (EditText edit : textFields) {
                    String key = (String) edit.getTag();
                    String value = edit.getText().toString().trim();
                    if (value.isEmpty()) e.remove(key);
                    else e.putString(key, value);
                }
                e.apply();
                show("Text overrides", "Saved. Relaunch Pdb to apply.", false);
            }
        }));

        section("Developer switches — apply after restart");
        LinearLayout dev = newCard();
        for (final String[] rowSpec : DEV_SWITCH_ROWS) {
            dev.addView(switchRow(rowSpec[0], rowSpec[1]));
        }

        section("Device identity & chat connection");
        LinearLayout identity = newCard();
        deviceId = PdbUi.field(this, "XDeviceId value");
        String id = PdbTools.deviceId();
        if (!id.startsWith("(")) deviceId.setText(id);
        identity.addView(deviceId);
        identity.addView(row("Save device id", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("XDeviceId", PdbTools.setDeviceId(deviceId.getText().toString()), false);
            }
        }));
        identity.addView(row("Randomize device id", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("XDeviceId", PdbTools.randomizeDeviceId(), false);
                deviceId.setText(PdbTools.deviceId());
            }
        }));
        imUrl = PdbUi.field(this, "wss://your-relay/connection/websocket");
        String url = PdbTools.imSocket();
        if (!url.startsWith("(")) imUrl.setText(url);
        identity.addView(imUrl);
        identity.addView(row("Save IM socket URL", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("IM socket", PdbTools.setImSocket(imUrl.getText().toString()), false);
            }
        }));
        identity.addView(row("Clear IM socket override", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("IM socket", PdbTools.setImSocket(""), false);
                imUrl.setText("");
            }
        }));
        identity.addView(row("Mark session signed out (keeps data)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("Fake logout", PdbTools.setFakeLogout(true), false);
            }
        }));
        identity.addView(row("Undo signed-out mark", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("Fake logout", PdbTools.setFakeLogout(false), false);
            }
        }));
        identity.addView(row("Dump stored app data", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("Stored app data", PdbTools.mmkvDump(PdbExtrasActivity.this), true);
            }
        }));

        section("Diagnostics, export & reset");
        LinearLayout diag = newCard();
        diag.addView(row("Export settings to clipboard (JSON)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("Settings JSON", PdbTools.exportJson(PdbExtrasActivity.this), true);
            }
        }));
        diag.addView(row("Import settings from clipboard (JSON)", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String json = PdbTools.readClipboard(PdbExtrasActivity.this);
                int restored = json == null ? 0 : PdbTools.importJson(PdbExtrasActivity.this, json);
                show("Import", restored == 0
                    ? "No importable Morphe JSON on the clipboard."
                    : restored + " value(s) imported. Relaunch Pdb to apply.", false);
            }
        }));
        diag.addView(row("Diagnostics — every switch value", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("Diagnostics", PdbTools.diagnostics(PdbExtrasActivity.this), true);
            }
        }));
        diag.addView(row("Dump every preference key", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                show("Preferences", PdbTools.prefsDump(PdbExtrasActivity.this), true);
            }
        }));
        diag.addView(row("Preset: maximum privacy", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PdbTools.applyPrivacyPreset(PdbExtrasActivity.this);
                show("Preset", "Maximum-privacy preset applied. Relaunch Pdb to apply.", false);
            }
        }));
        diag.addView(row("Reset all Morphe values", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PdbTools.reset(PdbExtrasActivity.this);
                show("Reset", "Morphe values cleared. Relaunch Pdb to apply.", false);
            }
        }));
    }

    /* ── shared builders ── */

    private void section(String label) {
        if (content != null) content.addView(PdbUi.sectionLabel(this, label));
    }

    private LinearLayout newCard() {
        LinearLayout card = PdbUi.card(this);
        if (content != null) content.addView(card, PdbUi.cardParams(this));
        return card;
    }

    private void note(LinearLayout card, String text) {
        if (card != null) {
            TextView t = PdbUi.text(this, text, 11, "gray_03", 0xFF8E8E93);
            int pad = PdbUi.dp(this, 14);
            t.setPadding(pad, PdbUi.dp(this, 6), pad, PdbUi.dp(this, 2));
            card.addView(t);
        }
    }

    private void iconMenu(View anchor) {
        List<PdbMenu.Item> items = new ArrayList<>();
        items.add(simpleMenu("Stock icon", new Runnable() {
            @Override
            public void run() {
                PdbIcons.reset(PdbExtrasActivity.this);
            }
        }));
        for (final String alias : PdbIcons.aliases(PdbExtrasActivity.this)) {
            items.add(simpleMenu(PdbIcons.pretty(alias), new Runnable() {
                @Override
                public void run() {
                    PdbIcons.switchTo(PdbExtrasActivity.this, alias);
                }
            }));
        }
        PdbMenu.show(anchor, items);
    }

    /* ── row helpers ── */

    private View row(String label, View.OnClickListener onClick) {
        return PdbUi.actionCell(this, label, onClick);
    }

    /** Reads the inspector field and starts a direct chat against that user. */
    private void directChat() {
        String id = PdbDatabase.resolveUserId(PdbExtrasActivity.this, input());
        if (id == null) {
            PdbTools.toast(this, "Morphe: enter a user id or @name first");
            return;
        }
        PdbTools.prefs(this).edit()
            .putString(PdbSettings.PDB_IM_CHAT_USER, id)
            .putString(PdbSettings.INSTANT_CHAT_USER, id).apply();
        PdbTools.toast(this, "Morphe: instant-chat target \u2192 #" + id);
        PdbNav.openInstantChat(this);
    }

    private String input() {
        return inspectorInput == null ? "" : inspectorInput.getText().toString();
    }

    private PdbMenu.Item simpleMenu(final String label, final Runnable action) {
        return new PdbMenu.Item() {
            @Override
            public String label() {
                return label;
            }

            @Override
            public void run() {
                action.run();
            }
        };
    }

    /** One text bundle with everything worth keeping: settings, stats, chats, visitors. */
    private String buildBackup() {
        StringBuilder sb = new StringBuilder();
        sb.append("=== Pdb Extras backup — ").append(PdbTools.summary(this)).append(" ===\n\n");
        sb.append("--- Settings JSON ---\n").append(PdbTools.exportJson(this)).append("\n\n");
        sb.append("--- Chat statistics ---\n").append(PdbDatabase.chatStats(this)).append("\n\n");
        sb.append("--- Visitor digest ---\n").append(PdbDatabase.visitorDigest(this, 100)).append("\n\n");
        sb.append("--- Recent chats ---\n").append(PdbTools.chatExport(this, null, 100)).append("\n\n");
        sb.append("--- Drafts ---\n").append(PdbDatabase.drafts(this, 100)).append('\n');
        String text = sb.toString();
        PdbTools.copyToClipboard(this, text);
        return text;
    }

    /* ── widgets ── */

    private View switchRow(String label, final String key) {
        Switch sw = new Switch(this);
        sw.setText(label);
        sw.setTextSize(15);
        sw.setAllCaps(false);
        sw.setTextColor(PdbUi.color(this, "gray_01", 0xFF1C1C1E));
        sw.setChecked(PdbSettings.getBool(PdbTools.prefs(this), key, PdbSettings.defaultBool(key)));
        int padV = PdbUi.dp(this, 10);
        sw.setPadding(PdbUi.dp(this, 14), padV, PdbUi.dp(this, 14), padV);
        sw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                PdbTools.prefs(PdbExtrasActivity.this).edit().putBoolean(key, isChecked).apply();
                String effect = switchEffect(key, isChecked);
                PdbTools.toast(PdbExtrasActivity.this, "Morphe Extras: " + effect);
                if (PdbSettings.IDS_EVERYWHERE.equals(key)) {
                    PdbUi.IDS_EVERYWHERE = isChecked; // hot — no relaunch needed
                }
                if (PdbSettings.NO_VISITOR_LIMIT.equals(key)) {
                    PdbLimits.NO_VISITOR_LIMIT = isChecked; // hot — read per check
                }
            }
        });
        return sw;
    }

    /** Human text for the switch toast, saying when the change takes effect. */
    private String switchEffect(String key, boolean on) {
        if (PdbSettings.IDS_EVERYWHERE.equals(key)) {
            return on ? "profile IDs ON (next list refresh)" : "profile IDs OFF";
        }
        if (PdbSettings.BUBBLE.equals(key)) {
            return on ? "power button ON (reopen Pdb)" : "power button OFF (reopen Pdb)";
        }
        if (PdbSettings.GLOBAL_PAUSE.equals(key)) {
            return on ? "paused (relaunch Pdb)" : "resumed (relaunch Pdb)";
        }
        if (PdbSettings.NO_VISITOR_LIMIT.equals(key)) {
            return on ? "visitor limit lifted" : "visitor limit back to the app default";
        }
        return (on ? "on" : "off") + " \u2014 relaunch to apply";
    }

    /* ── async plumbing ── */

    private interface Work {
        String run();
    }

    /** Runs a possibly slow read (SQLite) off the main thread. */
    private void runAsync(final String label, final Work work) {
        show(label, "working\u2026", false);
        new Thread(new Runnable() {
            @Override
            public void run() {
                final String text;
                try {
                    text = String.valueOf(work.run());
                } catch (Throwable t) {
                    showResult(label, "failed: " + t, false);
                    return;
                }
                showResult(label, text, false);
            }
        }, "pdb-extras").start();
    }

    private void showResult(final String label, final String text, final boolean copy) {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                applyResult(label, text, copy);
            }
        });
    }

    private void show(String label, String text, boolean copy) {
        applyResult(label, text, copy);
    }

    private void applyResult(String label, String text, boolean copy) {
        try {
            if (resultArea != null) resultArea.setVisibility(View.VISIBLE);
            if (copy) PdbTools.copyToClipboard(this, text);
            if (result != null) result.setText(label + "\n\n" + text);
            String firstLine = text == null ? "" : text.split("\n", 2)[0];
            PdbTools.toast(this, "Morphe Extras: " + (firstLine.length() > 60
                ? firstLine.substring(0, 60) + "\u2026" : firstLine));
        } catch (Throwable ignored) {
        }
    }
}
