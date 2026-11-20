package app.aidan.extension.nhl.adblock;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.text.InputType;
import android.text.format.DateFormat;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Native settings Activity for NHL Ad Blocker.
 * Fully redesigned to match NHL app UI/UX:
 * - Visible status bar and window insets
 * - Native NHL header style with circular back tile
 * - Universal master on/off protection toggle
 * - 3 compact stat cards for session/lifetime totals
 * - Vertically centered navigation rows with native chevrons
 * - Outlined monochrome switches matching native screens
 * - Black rounded title-case action buttons
 * - Truthful bundled rule counts
 */
public class AdBlockSettingsActivity extends Activity {
    private static final String STATE_SCREEN = "current_screen";

    private String mCurrentScreen = "home";
    private LinearLayout mRootLayout;
    private View mToolbar;
    private FrameLayout mContainer;
    private TextView mTitleView;

    private AdBlockStore mStore;
    private RuleRepository mRepo;
    private volatile boolean mRuleMetadataReady = false;
    private final Map<String, TextView> mSubCountViews = new HashMap<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mStore = AdBlockStore.get(this);
        mRepo = RuleRepository.get(this);

        mRepo.ensureInitialized(() -> runOnUiThread(() -> {
            mRuleMetadataReady = true;
            refreshRuleCountViews();
        }));

        if (savedInstanceState != null) {
            mCurrentScreen = savedInstanceState.getString(STATE_SCREEN, "home");
        } else if (getIntent() != null && getIntent().hasExtra("screen")) {
            String scr = getIntent().getStringExtra("screen");
            if (scr != null && !scr.isEmpty()) {
                mCurrentScreen = scr;
            }
        }
        buildRootLayout();
        renderScreen(mCurrentScreen);
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString(STATE_SCREEN, mCurrentScreen);
    }

    @Override
    protected void onNewIntent(android.content.Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        if (intent != null && intent.hasExtra("screen")) {
            String scr = intent.getStringExtra("screen");
            if (scr != null && !scr.isEmpty()) {
                mCurrentScreen = scr;
                navigateTo(scr);
            }
        }
    }

    @Override
    public void onBackPressed() {
        if (!"home".equals(mCurrentScreen)) {
            navigateTo("home");
        } else {
            super.onBackPressed();
        }
    }

    public void navigateTo(String screen) {
        mCurrentScreen = screen;
        renderScreen(screen);
    }

    private int dp(int val) {
        return NhlAdBlockUi.dp(this, val);
    }

    private void buildRootLayout() {
        mRootLayout = new LinearLayout(this);
        mRootLayout.setOrientation(LinearLayout.VERTICAL);
        mRootLayout.setBackgroundColor(NhlAdBlockUi.getPageBgColor(this));

        // Native NHL Header / Toolbar
        TextView[] titleHolder = new TextView[1];
        mToolbar = NhlAdBlockUi.createToolbar(this, "Ad Blocker", v -> onBackPressed(), titleHolder);
        mTitleView = titleHolder[0];
        mRootLayout.addView(mToolbar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // Sub-toolbar divider
        View tbDiv = new View(this);
        tbDiv.setBackgroundColor(NhlAdBlockUi.getDividerColor(this));
        mRootLayout.addView(tbDiv, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));

        // Screen container
        mContainer = new FrameLayout(this);
        mRootLayout.addView(mContainer, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));

        // Configure system status bar and navigation bar insets
        NhlAdBlockUi.configureWindowInsets(this, mRootLayout, mToolbar);

        setContentView(mRootLayout);
    }

    private void renderScreen(String screen) {
        mContainer.removeAllViews();
        mSubCountViews.clear();

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        int padH = dp(16);
        int padV = dp(16);
        content.setPadding(padH, padV, padH, padV);

        switch (screen) {
            case "settings":
                mTitleView.setText("Settings");
                renderSettingsScreen(content);
                break;
            case "rules":
                mTitleView.setText("Filter Rules");
                renderRulesScreen(content);
                break;
            case "history":
                mTitleView.setText("Blocked History");
                renderHistoryScreen(content);
                break;
            case "statistics":
                mTitleView.setText("Statistics");
                renderStatisticsScreen(content);
                break;
            case "home":
            default:
                mTitleView.setText("Ad Blocker");
                renderHomeScreen(content);
                break;
        }

        scroll.addView(content);
        mContainer.addView(scroll);
    }

    // --- Home Screen ---

    private void renderHomeScreen(LinearLayout content) {
        boolean masterEnabled = mStore.isProtectionEnabled();
        boolean netEnabled = mStore.isEnabled();
        boolean cosmeticEnabled = mStore.isCosmeticFiltering();
        boolean active = masterEnabled && (netEnabled || cosmeticEnabled);

        // 1. Protection Card with Universal Master Toggle
        LinearLayout statusCard = NhlAdBlockUi.createCard(this, false);

        LinearLayout topRow = new LinearLayout(this);
        topRow.setOrientation(LinearLayout.HORIZONTAL);
        topRow.setGravity(Gravity.CENTER_VERTICAL);

        // Leading Shield icon
        ImageView shieldIcon = new ImageView(this);
        shieldIcon.setLayoutParams(new LinearLayout.LayoutParams(dp(28), dp(28)));
        shieldIcon.setImageDrawable(NhlAdBlockUi.getDrawable(
                this,
                active ? "aidan_nhl_adblock_shield_check" : "aidan_nhl_adblock_shield_off",
                active ? 0xFF2E7D32 : 0xFF757575
        ));
        shieldIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        topRow.addView(shieldIcon);

        View gap = new View(this);
        gap.setLayoutParams(new LinearLayout.LayoutParams(dp(12), 1));
        topRow.addView(gap);

        // Header and description column
        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        textLp.setMarginEnd(dp(16));
        textCol.setLayoutParams(textLp);

        TextView statusHeader = new TextView(this);
        String headerText;
        String subText;
        if (!masterEnabled) {
            headerText = "Protection Paused";
            subText = "Web request blocking and cosmetic filtering are paused.";
        } else if (!netEnabled && !cosmeticEnabled) {
            headerText = "Protection Disabled";
            subText = "Enable web ad blocking or cosmetic filtering in Settings.";
        } else if (netEnabled && cosmeticEnabled) {
            headerText = "Protection Active";
            subText = "Blocks tracking and advertisements in NHL articles and embedded web views.";
        } else if (netEnabled) {
            headerText = "Protection Active";
            subText = "Blocks advertising and tracking web requests. Cosmetic filtering is off.";
        } else {
            headerText = "Protection Active";
            subText = "Hides ad containers in articles. Web request blocking is off.";
        }

        statusHeader.setText(headerText);
        statusHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        statusHeader.setTypeface(Typeface.DEFAULT_BOLD);
        statusHeader.setTextColor(active ? 0xFF2E7D32 : NhlAdBlockUi.getPrimaryTextColor(this));
        textCol.addView(statusHeader);

        TextView statusSub = new TextView(this);
        statusSub.setText(subText);
        statusSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        statusSub.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        statusSub.setPadding(0, dp(2), 0, 0);
        textCol.addView(statusSub);

        topRow.addView(textCol);

        // Universal Master Toggle
        View masterSwitch = NhlAdBlockUi.createNhlSwitch(this, masterEnabled, (btn, isChecked) -> {
            mStore.setProtectionEnabled(isChecked);
            AdBlockBridge.refreshProtection();
            renderScreen("home");
        });
        topRow.addView(masterSwitch);

        statusCard.addView(topRow);
        content.addView(statusCard);
        content.addView(NhlAdBlockUi.createSpace(this, 12));

        // 2. Three Compact Stat Cards (side-by-side)
        LinearLayout statsRow = new LinearLayout(this);
        statsRow.setOrientation(LinearLayout.HORIZONTAL);
        statsRow.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        long lifetimeBlocked = mStore.getLifetimeBlocked();
        long lifetimeChecked = mStore.getLifetimeChecked();
        int pct = mStore.getBlockedPercentage();

        statsRow.addView(createCompactStatCard("Blocked", String.valueOf(lifetimeBlocked)));
        statsRow.addView(createStatGap());
        statsRow.addView(createCompactStatCard("Checked", String.valueOf(lifetimeChecked)));
        statsRow.addView(createStatGap());
        statsRow.addView(createCompactStatCard("Blocked %", pct + "%"));

        content.addView(statsRow);
        content.addView(NhlAdBlockUi.createSectionSpacer(this));

        // 3. Navigation Menu Card (zero vertical padding for card, rows own padding)
        LinearLayout menuCard = NhlAdBlockUi.createCard(this, true);

        menuCard.addView(NhlAdBlockUi.createNavRow(
                this,
                "aidan_nhl_adblock_settings",
                "Settings",
                "Configure web blocking, cosmetic filtering & site exclusions",
                () -> navigateTo("settings")
        ));
        menuCard.addView(NhlAdBlockUi.createDivider(this, true));

        menuCard.addView(NhlAdBlockUi.createNavRow(
                this,
                "aidan_nhl_adblock_filter",
                "Rules & Subscriptions",
                "Manage filter lists and custom rules",
                () -> navigateTo("rules")
        ));
        menuCard.addView(NhlAdBlockUi.createDivider(this, true));

        menuCard.addView(NhlAdBlockUi.createNavRow(
                this,
                "aidan_nhl_adblock_history",
                "Blocked History",
                mStore.isRecordHistory() ? "View recent blocked requests" : "Detailed logging (currently disabled)",
                () -> navigateTo("history")
        ));
        menuCard.addView(NhlAdBlockUi.createDivider(this, true));

        menuCard.addView(NhlAdBlockUi.createNavRow(
                this,
                "aidan_nhl_adblock_chart_bar",
                "Statistics",
                "Session and lifetime request totals",
                () -> navigateTo("statistics")
        ));

        content.addView(menuCard);
    }

    private View createCompactStatCard(String label, String value) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER);
        card.setPadding(dp(8), dp(12), dp(8), dp(12));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        card.setLayoutParams(lp);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(NhlAdBlockUi.getCardBgColor(this));
        bg.setCornerRadius(dp(8));
        card.setBackground(bg);

        TextView valView = new TextView(this);
        valView.setText(value);
        valView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        valView.setTypeface(Typeface.DEFAULT_BOLD);
        valView.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        valView.setGravity(Gravity.CENTER);
        card.addView(valView);

        TextView lblView = new TextView(this);
        lblView.setText(label);
        lblView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        lblView.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        lblView.setGravity(Gravity.CENTER);
        lblView.setPadding(0, dp(2), 0, 0);
        card.addView(lblView);

        return card;
    }

    private View createStatGap() {
        View v = new View(this);
        v.setLayoutParams(new LinearLayout.LayoutParams(dp(8), 1));
        return v;
    }

    // --- Settings Screen ---

    private void renderSettingsScreen(LinearLayout content) {
        boolean masterPaused = !mStore.isProtectionEnabled();
        String pausedSuffix = masterPaused ? "\nProtection is paused on the Ad Blocker screen." : "";

        LinearLayout card = NhlAdBlockUi.createCard(this, true);

        addToggleRow(card, "Web Ad Blocking", "Block advertising and tracking network requests in WebViews" + pausedSuffix, mStore.isEnabled(), (view, isChecked) -> {
            mStore.setEnabled(isChecked);
            AdBlockBridge.refreshProtection();
        });

        card.addView(NhlAdBlockUi.createDivider(this, false));

        addToggleRow(card, "Cosmetic Filtering", "Hide ad containers and placeholder whitespace in articles" + pausedSuffix, mStore.isCosmeticFiltering(), (view, isChecked) -> {
            mStore.setCosmeticFiltering(isChecked);
            AdBlockBridge.refreshProtection();
        });

        card.addView(NhlAdBlockUi.createDivider(this, false));

        addToggleRow(card, "Automatic Updates", "Periodically refresh filter list subscriptions in the background", mStore.isAutoUpdate(), (view, isChecked) -> {
            mStore.setAutoUpdate(isChecked);
        });

        card.addView(NhlAdBlockUi.createDivider(this, false));

        addToggleRow(card, "Record Blocked History", "Keep a private local log of recent blocked web requests", mStore.isRecordHistory(), (view, isChecked) -> {
            mStore.setRecordHistory(isChecked);
        });

        content.addView(card);
        content.addView(NhlAdBlockUi.createSectionSpacer(this));

        // Site Exclusions Card
        LinearLayout exclCard = NhlAdBlockUi.createCard(this, false);
        TextView exclHeader = new TextView(this);
        exclHeader.setText("Site Exclusions");
        exclHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        exclHeader.setTypeface(Typeface.DEFAULT_BOLD);
        exclHeader.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        exclCard.addView(exclHeader);

        TextView exclSub = new TextView(this);
        exclSub.setText("Web ad blocking and cosmetic rules are bypassed for excluded document hostnames.");
        exclSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        exclSub.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        exclSub.setPadding(0, dp(4), 0, dp(12));
        exclCard.addView(exclSub);

        Set<String> exclusions = mStore.getSiteExclusions();
        if (exclusions.isEmpty()) {
            TextView noneText = new TextView(this);
            noneText.setText("No sites excluded (default protection applies everywhere).");
            noneText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            noneText.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
            noneText.setPadding(0, 0, 0, dp(12));
            exclCard.addView(noneText);
        } else {
            for (String host : exclusions) {
                LinearLayout row = new LinearLayout(this);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(0, dp(6), 0, dp(6));

                TextView hostText = new TextView(this);
                hostText.setText(host);
                hostText.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
                hostText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                row.addView(hostText, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

                TextView removeBtn = new TextView(this);
                removeBtn.setText("Remove");
                removeBtn.setTextColor(0xFFEF5350);
                removeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                removeBtn.setPadding(dp(8), dp(4), dp(8), dp(4));
                removeBtn.setOnClickListener(v -> {
                    mStore.removeSiteExclusion(host);
                    AdBlockBridge.refreshProtection();
                    renderScreen("settings");
                });
                row.addView(removeBtn);
                exclCard.addView(row);
            }
            exclCard.addView(NhlAdBlockUi.createSpace(this, 8));
        }

        Button addExclBtn = NhlAdBlockUi.createPrimaryButton(this, "Add Site Exclusion", v -> promptAddExclusion());
        exclCard.addView(addExclBtn);

        content.addView(exclCard);
    }

    private void promptAddExclusion() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Add Site Exclusion");
        final EditText input = new EditText(this);
        input.setHint("e.g. example.nhl.com");
        input.setInputType(InputType.TYPE_TEXT_VARIATION_URI);
        builder.setView(input);
        builder.setPositiveButton("Add", (dialog, which) -> {
            String host = input.getText().toString().trim();
            if (!host.isEmpty()) {
                mStore.addSiteExclusion(host);
                AdBlockBridge.refreshProtection();
                renderScreen("settings");
            }
        });
        builder.setNegativeButton("Cancel", null);
        builder.show();
    }

    // --- Rules Screen ---

    private void renderRulesScreen(LinearLayout content) {
        // Update All Action Card
        LinearLayout actionsCard = NhlAdBlockUi.createCard(this, false);
        Button updateBtn = NhlAdBlockUi.createPrimaryButton(
                this,
                mRepo.isCompiling() ? "Updating / Compiling..." : "Update All Subscriptions Now",
                v -> {
                    v.setEnabled(false);
                    ((Button) v).setText("Updating...");
                    mRepo.updateAllSubscriptionsAsync(() -> runOnUiThread(() -> {
                        if (!isFinishing() && !isDestroyed()) {
                            mRuleMetadataReady = true;
                            refreshRuleCountViews();
                            renderScreen("rules");
                        }
                    }));
                }
        );
        updateBtn.setEnabled(!mRepo.isCompiling());
        actionsCard.addView(updateBtn);
        content.addView(actionsCard);
        content.addView(NhlAdBlockUi.createSectionSpacer(this));

        // Subscriptions List Card
        LinearLayout subCard = NhlAdBlockUi.createCard(this, true);

        // Header section inside card
        LinearLayout subHeaderRow = new LinearLayout(this);
        subHeaderRow.setOrientation(LinearLayout.VERTICAL);
        subHeaderRow.setPadding(dp(16), dp(16), dp(16), dp(8));
        TextView subHeader = new TextView(this);
        subHeader.setText("Filter List Subscriptions");
        subHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        subHeader.setTypeface(Typeface.DEFAULT_BOLD);
        subHeader.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        subHeaderRow.addView(subHeader);
        subCard.addView(subHeaderRow);

        List<RuleRepository.SubscriptionInfo> subs = mRepo.getSubscriptions();
        for (RuleRepository.SubscriptionInfo s : subs) {
            subCard.addView(NhlAdBlockUi.createDivider(this, false));

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(16), dp(12), dp(16), dp(12));

            LinearLayout textCol = new LinearLayout(this);
            textCol.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            textLp.setMarginEnd(dp(16));
            textCol.setLayoutParams(textLp);

            TextView name = new TextView(this);
            name.setText(s.name + (s.isBuiltin ? " (Built-in)" : ""));
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            name.setTypeface(Typeface.DEFAULT_BOLD);
            name.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
            textCol.addView(name);

            TextView counts = new TextView(this);
            counts.setText(formatSubscriptionMeta(s));
            counts.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            counts.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
            counts.setPadding(0, dp(2), 0, 0);
            textCol.addView(counts);
            mSubCountViews.put(s.id, counts);

            if (!s.isBuiltin) {
                TextView deleteBtn = new TextView(this);
                deleteBtn.setText("Remove Subscription");
                deleteBtn.setTextColor(0xFFEF5350);
                deleteBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                deleteBtn.setPadding(0, dp(4), 0, 0);
                deleteBtn.setOnClickListener(v -> {
                    mRepo.removeSubscription(s.id);
                    renderScreen("rules");
                });
                textCol.addView(deleteBtn);
            }

            File cachedFile = new File(mRepo.getListsDir(), s.id + ".txt");
            if (!s.id.equals("nhl-default") && !s.enabled && cachedFile.exists() && cachedFile.length() > 0) {
                TextView clearBtn = new TextView(this);
                clearBtn.setText("Delete Downloaded List");
                clearBtn.setTextColor(0xFFEF5350);
                clearBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                clearBtn.setPadding(0, dp(4), 0, 0);
                clearBtn.setOnClickListener(v -> {
                    mRepo.deleteSubscriptionFile(s.id);
                    renderScreen("rules");
                });
                textCol.addView(clearBtn);
            }

            row.addView(textCol);

            View toggle = NhlAdBlockUi.createNhlSwitch(this, s.enabled, (btn, isChecked) -> {
                refreshRuleCountViews();
                mRepo.setSubscriptionEnabled(s.id, isChecked, () -> runOnUiThread(() -> {
                    if (!isFinishing() && !isDestroyed()) {
                        mRuleMetadataReady = true;
                        refreshRuleCountViews();
                    }
                }));
            });
            row.addView(toggle);

            subCard.addView(row);
        }

        // Add Subscription Button at the bottom of the card
        LinearLayout addBtnRow = new LinearLayout(this);
        addBtnRow.setOrientation(LinearLayout.VERTICAL);
        addBtnRow.setPadding(dp(16), dp(12), dp(16), dp(16));
        Button addSubBtn = NhlAdBlockUi.createPrimaryButton(this, "Add Subscription URL", v -> promptAddSubscription());
        addBtnRow.addView(addSubBtn);
        subCard.addView(addBtnRow);

        content.addView(subCard);
        content.addView(NhlAdBlockUi.createSectionSpacer(this));

        // Custom Rules Card
        LinearLayout customCard = NhlAdBlockUi.createCard(this, false);
        TextView customHeader = new TextView(this);
        customHeader.setText("Custom Rules");
        customHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        customHeader.setTypeface(Typeface.DEFAULT_BOLD);
        customHeader.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        customCard.addView(customHeader);

        TextView customSub = new TextView(this);
        customSub.setText("Add custom uBlock/ABP network filters or element hiding rules (one per line, up to 256 KiB).");
        customSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        customSub.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        customSub.setPadding(0, dp(4), 0, dp(12));
        customCard.addView(customSub);

        final EditText customEdit = new EditText(this);
        customEdit.setText(mRepo.getCustomRules());
        customEdit.setHint("||example.com/ad^\nnhl.com##.custom-banner");
        customEdit.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        customEdit.setHintTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        customEdit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        customEdit.setMinLines(5);
        customEdit.setGravity(Gravity.TOP | Gravity.START);

        GradientDrawable editBg = new GradientDrawable();
        editBg.setColor(NhlAdBlockUi.isNightMode(this) ? 0xFF2A2A2A : 0xFFF5F5F5);
        editBg.setCornerRadius(dp(8));
        customEdit.setBackground(editBg);
        customEdit.setPadding(dp(12), dp(12), dp(12), dp(12));
        customCard.addView(customEdit);

        Button saveRulesBtn = NhlAdBlockUi.createPrimaryButton(this, "Save Custom Rules", v -> {
            try {
                mRepo.setCustomRules(customEdit.getText().toString());
                Toast.makeText(this, "Custom rules saved and compiled", Toast.LENGTH_SHORT).show();
            } catch (Exception e) {
                Toast.makeText(this, "Error: " + e.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
        customCard.addView(NhlAdBlockUi.createSpace(this, 12));
        customCard.addView(saveRulesBtn);

        content.addView(customCard);
    }

    private String formatSubscriptionMeta(RuleRepository.SubscriptionInfo s) {
        if (mRepo.isDownloading(s.id)) {
            return "Downloading filter list…";
        }
        File listFile = new File(mRepo.getListsDir(), s.id + ".txt");
        boolean fileExists = listFile.exists() && listFile.length() > 0;
        if (!fileExists) {
            if ("nhl-default".equals(s.id)) {
                return "Bundled with app";
            }
            return "Not downloaded · Turn on to download";
        }
        if (!mRuleMetadataReady && s.acceptedCount == 0 && (s.lastError == null || s.lastError.isEmpty())) {
            return "Loading rule counts…";
        }
        if (s.lastError != null && !s.lastError.isEmpty()) {
            return "Update failed: " + s.lastError;
        }
        String lastUpStr = s.lastUpdated > 0
                ? DateFormat.format("MMM dd, yyyy", new Date(s.lastUpdated)).toString()
                : "Bundled";
        return String.format(Locale.ROOT, "Accepted: %,d rules | Updated: %s", s.acceptedCount, lastUpStr);
    }

    private void refreshRuleCountViews() {
        if (!"rules".equals(mCurrentScreen) || isFinishing() || isDestroyed()) return;
        List<RuleRepository.SubscriptionInfo> subs = mRepo.getSubscriptions();
        for (RuleRepository.SubscriptionInfo s : subs) {
            TextView tv = mSubCountViews.get(s.id);
            if (tv != null) {
                tv.setText(formatSubscriptionMeta(s));
            }
        }
    }

    private void promptAddSubscription() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Add Subscription");
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(dp(16), dp(8), dp(16), dp(8));

        final EditText nameInput = new EditText(this);
        nameInput.setHint("List Name (e.g. OISD Basic)");
        layout.addView(nameInput);

        final EditText urlInput = new EditText(this);
        urlInput.setHint("HTTPS URL");
        urlInput.setInputType(InputType.TYPE_TEXT_VARIATION_URI);
        layout.addView(urlInput);

        builder.setView(layout);
        builder.setPositiveButton("Add", (dialog, which) -> {
            String name = nameInput.getText().toString().trim();
            String url = urlInput.getText().toString().trim();
            if (name.isEmpty()) name = "Subscription";
            if (!url.isEmpty()) {
                try {
                    mRepo.addSubscription(name, url);
                    renderScreen("rules");
                } catch (Exception e) {
                    Toast.makeText(this, "Error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                }
            }
        });
        builder.setNegativeButton("Cancel", null);
        builder.show();
    }

    // --- History Screen ---

    private void renderHistoryScreen(LinearLayout content) {
        if (!mStore.isRecordHistory()) {
            LinearLayout card = NhlAdBlockUi.createCard(this, false);
            TextView header = new TextView(this);
            header.setText("History Recording Disabled");
            header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            header.setTypeface(Typeface.DEFAULT_BOLD);
            header.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
            card.addView(header);

            TextView sub = new TextView(this);
            sub.setText("Detailed request logging is opt-in and stored only in private app storage. No history is collected while disabled.");
            sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            sub.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
            sub.setPadding(0, dp(4), 0, dp(16));
            card.addView(sub);

            Button enableBtn = NhlAdBlockUi.createPrimaryButton(this, "Enable History Recording", v -> {
                mStore.setRecordHistory(true);
                renderScreen("history");
            });
            card.addView(enableBtn);
            content.addView(card);
            return;
        }

        List<AdBlockStore.HistoryEntry> list = mStore.getHistory();

        LinearLayout headerCard = NhlAdBlockUi.createCard(this, false);
        LinearLayout hRow = new LinearLayout(this);
        hRow.setOrientation(LinearLayout.HORIZONTAL);
        hRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView title = new TextView(this);
        title.setText(String.format(Locale.ROOT, "Blocked Requests (%d)", list.size()));
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        hRow.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        Button clearBtn = NhlAdBlockUi.createPrimaryButton(this, "Clear", v -> {
            mStore.clearHistory();
            renderScreen("history");
        });
        hRow.addView(clearBtn);
        headerCard.addView(hRow);
        content.addView(headerCard);
        content.addView(NhlAdBlockUi.createSectionSpacer(this));

        if (list.isEmpty()) {
            LinearLayout emptyCard = NhlAdBlockUi.createCard(this, false);
            TextView empty = new TextView(this);
            empty.setText("No blocked requests recorded yet.");
            empty.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
            empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            emptyCard.addView(empty);
            content.addView(emptyCard);
        } else {
            LinearLayout listCard = NhlAdBlockUi.createCard(this, true);
            for (int i = 0; i < list.size(); i++) {
                if (i > 0) listCard.addView(NhlAdBlockUi.createDivider(this, false));
                AdBlockStore.HistoryEntry e = list.get(i);

                LinearLayout item = new LinearLayout(this);
                item.setOrientation(LinearLayout.VERTICAL);
                item.setPadding(dp(16), dp(10), dp(16), dp(10));

                TextView urlText = new TextView(this);
                urlText.setText(e.sanitizedUrl);
                urlText.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
                urlText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                urlText.setTypeface(Typeface.DEFAULT_BOLD);
                item.addView(urlText);

                TextView meta = new TextView(this);
                String timeStr = DateFormat.format("HH:mm:ss", new Date(e.timestamp)).toString();
                meta.setText(String.format(Locale.ROOT, "%s | Type: %s | Host: %s", timeStr, e.resourceType, e.documentHost));
                meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                meta.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
                item.addView(meta);

                listCard.addView(item);
            }
            content.addView(listCard);
        }
    }

    // --- Statistics Screen ---

    private void renderStatisticsScreen(LinearLayout content) {
        LinearLayout card = NhlAdBlockUi.createCard(this, false);

        TextView title = new TextView(this);
        title.setText("Web Request Statistics");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        card.addView(title);

        TextView sub = new TextView(this);
        sub.setText("Aggregate counts of inspected and blocked web requests in NHL WebViews.");
        sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        sub.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        sub.setPadding(0, dp(4), 0, dp(16));
        card.addView(sub);

        addStatRow(card, "Lifetime Blocked", String.valueOf(mStore.getLifetimeBlocked()));
        addStatRow(card, "Lifetime Checked", String.valueOf(mStore.getLifetimeChecked()));
        addStatRow(card, "Lifetime Block Ratio", mStore.getBlockedPercentage() + "%");
        card.addView(NhlAdBlockUi.createDivider(this, false));
        addStatRow(card, "Current Session Blocked", String.valueOf(mStore.getSessionBlocked()));
        addStatRow(card, "Current Session Checked", String.valueOf(mStore.getSessionChecked()));

        Button resetBtn = NhlAdBlockUi.createPrimaryButton(this, "Reset Statistics", v -> {
            new AlertDialog.Builder(this)
                    .setTitle("Reset Statistics")
                    .setMessage("Are you sure you want to reset all lifetime and session request counters?")
                    .setPositiveButton("Reset", (d, w) -> {
                        mStore.resetStatistics();
                        renderScreen("statistics");
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        });

        card.addView(NhlAdBlockUi.createSpace(this, 16));
        card.addView(resetBtn);
        content.addView(card);
    }

    // --- Helpers ---

    private void addToggleRow(LinearLayout parent, String title, String subtitle, boolean checked, Switch.OnCheckedChangeListener listener) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(12), dp(16), dp(12));

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);

        TextView tView = new TextView(this);
        tView.setText(title);
        tView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tView.setTypeface(Typeface.DEFAULT_BOLD);
        tView.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        texts.addView(tView);

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView sView = new TextView(this);
            sView.setText(subtitle);
            sView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            sView.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
            sView.setPadding(0, dp(2), 0, 0);
            texts.addView(sView);
        }

        LinearLayout.LayoutParams toggleTextLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
        toggleTextLp.setMarginEnd(dp(16));
        row.addView(texts, toggleTextLp);

        View s = NhlAdBlockUi.createNhlSwitch(this, checked, listener);
        row.addView(s);

        parent.addView(row);
    }

    private void addStatRow(LinearLayout parent, String label, String value) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(8), 0, dp(8));

        TextView lView = new TextView(this);
        lView.setText(label);
        lView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        lView.setTextColor(NhlAdBlockUi.getSecondaryTextColor(this));
        row.addView(lView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView vView = new TextView(this);
        vView.setText(value);
        vView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        vView.setTypeface(Typeface.DEFAULT_BOLD);
        vView.setTextColor(NhlAdBlockUi.getPrimaryTextColor(this));
        row.addView(vView);

        parent.addView(row);
    }
}
