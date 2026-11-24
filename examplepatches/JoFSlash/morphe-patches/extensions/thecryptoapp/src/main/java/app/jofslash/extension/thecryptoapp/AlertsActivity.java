package app.jofslash.extension.thecryptoapp;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;
import java.util.Locale;

/**
 * Self-contained, programmatic config screen for the custom price alerts. Styled to match The
 * Crypto App (card layout, royal-blue accent) via {@link Palette}, theme-aware for light/dark.
 * Registered in the host manifest with its own LAUNCHER intent-filter ("Crypto Alerts").
 */
public final class AlertsActivity extends Activity {

    static final String TAG = CustomAlerts.TAG;

    private static final String[] DIR_LABELS = {
            "Price above", "Price below", "24h change up (%)", "24h change down (%)"
    };
    private static final String[] DIR_VALUES = {
            AlertRule.ABOVE, AlertRule.BELOW, AlertRule.PCT_UP, AlertRule.PCT_DOWN
    };

    private Palette p;
    private ScrollView scroll;
    private TextView notificationsOff;
    private LinearLayout listContainer;
    private EditText symbolInput;
    private EditText targetInput;
    private EditText noteInput;
    private Spinner directionSpinner;
    private Switch repeatSwitch;
    private Button addButton;
    private Button cancelEditButton;

    private String editingId = null;

    private static long lastOpenCheckAt = 0L;
    private static final long OPEN_CHECK_MIN_GAP_MS = 30_000L;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            p = new Palette(this);
            AlertNotifier.ensureChannel(this);
            View root = buildRoot();
            p.setUpWindow(this, root);
            setContentView(root);
            render();
            askForNotifications();
        } catch (Throwable t) {
            Log.e(TAG, "ui: onCreate failed", t);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (notificationsOff != null) {
            notificationsOff.setVisibility(AlertNotifier.canNotify(this) ? View.GONE : View.VISIBLE);
        }
        render();
        long now = System.currentTimeMillis();
        if (now - lastOpenCheckAt < OPEN_CHECK_MIN_GAP_MS) return;
        lastOpenCheckAt = now;
        bg(() -> {
            try {
                AlertChecker.checkNow(getApplicationContext());
            } finally {
                runOnUiThread(this::render);
            }
        });
    }

    private View buildRoot() {
        scroll = new ScrollView(this);
        scroll.setBackgroundColor(p.screenBg);
        scroll.setFillViewport(true);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(p.dp(16), p.dp(16), p.dp(16), p.dp(24));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView header = new TextView(this);
        header.setText("Crypto Alerts");
        header.setTextSize(24);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(p.textPrimary);
        root.addView(header);

        TextView sub = new TextView(this);
        sub.setText("Custom price alerts. Free public API, no account, no Pro.");
        sub.setTextSize(12);
        sub.setTextColor(p.textSecondary);
        sub.setPadding(0, p.dp(2), 0, p.dp(12));
        root.addView(sub);

        // Shown while notifications are off: alerts are checked but can't reach you.
        notificationsOff = new TextView(this);
        notificationsOff.setText("Notifications are off for this app, so alerts can't reach you. "
                + "Met alerts wait until you turn them on.");
        notificationsOff.setTextSize(13);
        notificationsOff.setTextColor(p.down);
        notificationsOff.setPadding(0, 0, 0, p.dp(12));
        notificationsOff.setVisibility(View.GONE);
        root.addView(notificationsOff);

        root.addView(buildAddCard());
        root.addView(buildActionRow());

        TextView rulesHdr = new TextView(this);
        rulesHdr.setText("Your rules");
        rulesHdr.setTextSize(16);
        rulesHdr.setTypeface(Typeface.DEFAULT_BOLD);
        rulesHdr.setTextColor(p.textPrimary);
        rulesHdr.setPadding(0, p.dp(16), 0, p.dp(8));
        root.addView(rulesHdr);

        listContainer = new LinearLayout(this);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        root.addView(listContainer);

        return scroll;
    }

    private View buildAddCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(p.card());
        int pad = p.dp(16);
        card.setPadding(pad, pad, pad, pad);

        symbolInput = styledEdit("Symbol, e.g. BTCUSDT");
        symbolInput.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        symbolInput.setAllCaps(true);
        card.addView(symbolInput);

        targetInput = styledEdit("Target: price in USD, or percent for % rules");
        targetInput.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
        // The plain decimal key listener silently drops a typed comma, so "0,05" became "005" (a
        // target 100x too high). Accept both; the parser turns the comma into a dot.
        targetInput.setKeyListener(android.text.method.DigitsKeyListener.getInstance("0123456789.,"));
        card.addView(targetInput, lp(p.dp(10)));

        directionSpinner = new Spinner(this);
        ArrayAdapter<String> ad = new ArrayAdapter<>(this,
                android.R.layout.simple_spinner_item, DIR_LABELS);
        ad.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        directionSpinner.setAdapter(ad);
        card.addView(directionSpinner, lp(p.dp(10)));

        noteInput = styledEdit("Note (optional)");
        noteInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        card.addView(noteInput, lp(p.dp(10)));

        repeatSwitch = new Switch(this);
        repeatSwitch.setText("Repeat (off = one-time)");
        repeatSwitch.setTextColor(p.textPrimary);
        repeatSwitch.setChecked(true);
        card.addView(repeatSwitch, lp(p.dp(10)));

        addButton = primaryButton("Add rule", v -> onAddOrSave());
        card.addView(addButton, lp(p.dp(12)));

        // Shown only while editing, so an edit can be left without saving.
        cancelEditButton = secondaryButton("Cancel edit", v -> {
            exitEditMode();
            clearForm();
        });
        cancelEditButton.setVisibility(View.GONE);
        card.addView(cancelEditButton, lp(p.dp(8)));

        return wrapCardMargins(card);
    }

    private View buildActionRow() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);

        Button check = secondaryButton("Check now", v -> onCheckNow());
        LinearLayout.LayoutParams a = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        a.topMargin = p.dp(12);
        a.rightMargin = p.dp(6);
        row.addView(check, a);

        Button portfolio = secondaryButton("Portfolio", v -> openPortfolio());
        LinearLayout.LayoutParams b = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        b.topMargin = p.dp(12);
        b.leftMargin = p.dp(6);
        row.addView(portfolio, b);

        return row;
    }

    // --- styled view factories ---

    private EditText styledEdit(String hint) {
        EditText e = new EditText(this);
        e.setHint(hint);
        e.setTextColor(p.textPrimary);
        e.setHintTextColor(p.textSecondary);
        e.setBackground(p.inputBox());
        int pad = p.dp(12);
        e.setPadding(pad, pad, pad, pad);
        return e;
    }

    private Button primaryButton(String text, View.OnClickListener l) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setTextColor(0xFFFFFFFF);
        b.setBackground(p.primaryButton());
        b.setOnClickListener(l);
        return b;
    }

    private Button secondaryButton(String text, View.OnClickListener l) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setTextColor(p.textPrimary);
        b.setBackground(p.secondaryButton());
        b.setOnClickListener(l);
        return b;
    }

    private LinearLayout.LayoutParams lp(int topMargin) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = topMargin;
        return lp;
    }

    private View wrapCardMargins(View card) {
        LinearLayout holder = new LinearLayout(this);
        holder.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        holder.addView(card, lp);
        return holder;
    }

    // --- actions ---

    private void onAddOrSave() {
        try {
            symbolInput.setError(null);
            targetInput.setError(null);

            final String typed = symbolInput.getText().toString().trim();
            final String symbol = PriceFetcher.normalize(typed);
            // Some keyboards (e.g. a Slovak one) type a decimal comma.
            String targetStr = targetInput.getText().toString().trim().replace(',', '.');
            final String note = noteInput.getText().toString().trim();
            final boolean repeat = repeatSwitch.isChecked();
            final String direction = DIR_VALUES[directionSpinner.getSelectedItemPosition()];
            final boolean percent = AlertRule.PCT_UP.equals(direction) || AlertRule.PCT_DOWN.equals(direction);

            if (typed.isEmpty()) {
                symbolInput.setError("Enter a symbol, e.g. BTCUSDT");
                return;
            }
            if (symbol == null) {
                symbolInput.setError("Letters and digits only, e.g. BTCUSDT or BTC");
                return;
            }
            if (targetStr.isEmpty()) {
                targetInput.setError(percent ? "Enter a percent, e.g. 5" : "Enter a target price");
                return;
            }
            final double target;
            try {
                target = Double.parseDouble(targetStr);
            } catch (NumberFormatException e) {
                targetInput.setError("Not a number");
                return;
            }
            if (!(target > 0) || Double.isInfinite(target)) {
                targetInput.setError("Must be greater than 0");
                return;
            }
            if (AlertRule.PCT_DOWN.equals(direction) && target >= 100) {
                // A coin can't lose 100% or more in 24h, so the rule could never fire.
                targetInput.setError("A drop must be less than 100%");
                return;
            }

            final String display = PriceFetcher.baseOf(symbol);
            final String editing = editingId;

            addButton.setEnabled(false);
            addButton.setText(editing != null ? "Saving..." : "Checking symbol...");
            bg(() -> {
                final Double price = PriceFetcher.fetchPrice(getApplicationContext(), symbol);
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed()) return;
                    addButton.setEnabled(true);
                    // The rule may have been deleted while its symbol was checked.
                    if (editing != null && !editing.equals(editingId)) {
                        addButton.setText(editingId != null ? "Save" : "Add rule");
                        return;
                    }
                    addButton.setText(editing != null ? "Save" : "Add rule");
                    if (price == null) {
                        symbolInput.setError("Unknown or unavailable symbol");
                        return;
                    }
                    if (editing != null) {
                        AlertStore.update(this, editing, symbol, display, target, direction, note, repeat);
                        exitEditMode();
                        toast("Rule saved");
                    } else {
                        AlertStore.add(this, symbol, display, target, direction, note, repeat);
                        toast("Rule added");
                    }
                    clearForm();
                    render();
                });
            });
        } catch (Throwable t) {
            Log.e(TAG, "ui: add/save failed", t);
        }
    }

    private void clearForm() {
        symbolInput.setText("");
        targetInput.setText("");
        noteInput.setText("");
        directionSpinner.setSelection(0);
        repeatSwitch.setChecked(true);
    }

    private void beginEdit(AlertRule r) {
        editingId = r.id;
        symbolInput.setError(null);
        targetInput.setError(null);
        symbolInput.setText(r.symbol);
        targetInput.setText(PriceFormat.editable(r.targetPrice));
        noteInput.setText(r.note == null ? "" : r.note);
        repeatSwitch.setChecked(r.repeat);
        int idx = 0;
        for (int i = 0; i < DIR_VALUES.length; i++) if (DIR_VALUES[i].equals(r.direction)) idx = i;
        directionSpinner.setSelection(idx);
        addButton.setText("Save");
        cancelEditButton.setVisibility(View.VISIBLE);
        scroll.smoothScrollTo(0, 0);
        toast("Editing " + r.displayName + " - change and Save");
    }

    private void exitEditMode() {
        editingId = null;
        addButton.setText("Add rule");
        cancelEditButton.setVisibility(View.GONE);
    }

    private void onCheckNow() {
        toast("Checking prices...");
        bg(() -> {
            try {
                AlertChecker.checkNow(getApplicationContext());
            } finally {
                runOnUiThread(this::render);
            }
        });
    }

    private void openPortfolio() {
        try {
            startActivity(new Intent(this, PortfolioActivity.class));
        } catch (Throwable t) {
            Log.e(TAG, "ui: open portfolio failed", t);
        }
    }

    private void openChart(String symbol) {
        try {
            startActivity(new Intent(this, ChartActivity.class).putExtra("symbol", symbol));
        } catch (Throwable t) {
            Log.e(TAG, "ui: open chart failed", t);
        }
    }

    private void render() {
        try {
            listContainer.removeAllViews();
            List<AlertRule> rules = AlertStore.load(this);
            if (rules.isEmpty()) {
                TextView empty = new TextView(this);
                empty.setText("No rules yet. Add one above.");
                empty.setTextColor(p.textSecondary);
                listContainer.addView(empty);
                return;
            }
            for (final AlertRule r : rules) listContainer.addView(ruleCard(r));
        } catch (Throwable t) {
            Log.e(TAG, "ui: render failed", t);
        }
    }

    private View ruleCard(final AlertRule r) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setBackground(p.card());
        int pad = p.dp(14);
        card.setPadding(pad, pad, pad, pad);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = p.dp(10);
        card.setLayoutParams(cardLp);

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        card.addView(textCol, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        boolean up = r.isUpward();
        String arrow = up ? "↑" : "↓";
        int arrowColor = up ? p.up : p.down;

        String targetStr = r.isPercent()
                ? String.format(Locale.US, "%s %.2f%%", up ? "24h up" : "24h down", r.targetPrice)
                : (up ? "above " : "below ") + PriceFormat.money(r.targetPrice);
        TextView title = new TextView(this);
        title.setTextSize(16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(p.textPrimary);
        // Colored arrow + label, name in primary text.
        android.text.SpannableString span =
                new android.text.SpannableString(r.displayName + "  " + arrow + " " + targetStr);
        int arrowStart = r.displayName.length() + 2;
        span.setSpan(new android.text.style.ForegroundColorSpan(arrowColor),
                arrowStart, span.length(), android.text.Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        title.setText(span);
        textCol.addView(title);

        if (r.note != null && !r.note.isEmpty()) {
            TextView note = new TextView(this);
            note.setText(r.note);
            note.setTextColor(p.textSecondary);
            note.setTextSize(12);
            textCol.addView(note);
        }

        TextView status = new TextView(this);
        status.setTextSize(13);
        boolean haveReading = r.isPercent() ? r.hasLastPct : r.hasLastPrice;
        if (haveReading) {
            boolean met = r.conditionMet(r.hasLastPrice ? r.lastPrice : 0d,
                    r.hasLastPct ? r.lastPct : null);
            StringBuilder sb = new StringBuilder();
            if (r.isPercent()) {
                sb.append(String.format(Locale.US, "24h %+.2f%%", r.lastPct));
                if (r.hasLastPrice) sb.append("  ").append(PriceFormat.money(r.lastPrice));
            } else {
                sb.append("now ").append(PriceFormat.money(r.lastPrice));
            }
            sb.append(met ? "   ✓ met" : "   ✗ not met");
            status.setText(sb.toString());
            status.setTextColor(met ? p.up : p.down);
        } else {
            status.setText("not checked yet");
            status.setTextColor(p.textSecondary);
        }
        textCol.addView(status);

        if (!r.repeat) {
            TextView ot = new TextView(this);
            ot.setText("one-time");
            ot.setTextColor(p.gold);
            ot.setTextSize(11);
            textCol.addView(ot);
        }

        textCol.setClickable(true);
        textCol.setOnClickListener(v -> beginEdit(r));

        // Controls column
        LinearLayout ctrl = new LinearLayout(this);
        ctrl.setOrientation(LinearLayout.VERTICAL);
        ctrl.setGravity(Gravity.END);

        Switch enable = new Switch(this);
        enable.setChecked(r.enabled);
        enable.setOnCheckedChangeListener((b, checked) ->
                AlertStore.setEnabled(AlertsActivity.this, r.id, checked));
        ctrl.addView(enable);

        Button chart = secondaryButton("Chart", v -> openChart(r.symbol));
        chart.setTextSize(12);
        ctrl.addView(chart, lp(p.dp(6)));

        Button del = secondaryButton("Delete", v -> {
            if (r.id.equals(editingId)) {
                exitEditMode();
                clearForm();
            }
            AlertStore.delete(AlertsActivity.this, r.id);
            render();
        });
        del.setTextSize(12);
        del.setTextColor(p.down);
        ctrl.addView(del, lp(p.dp(6)));

        card.addView(ctrl);
        return card;
    }

    /**
     * Alerts are notifications, and on Android 13+ the app may post them only once the user allows
     * it. The host app asks for this itself only in some flows, so ask here when it isn't granted
     * yet (Android stops showing the prompt after the user says no twice).
     */
    private void askForNotifications() {
        try {
            if (android.os.Build.VERSION.SDK_INT < 33) return;
            String perm = "android.permission.POST_NOTIFICATIONS";
            if (checkSelfPermission(perm) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
                requestPermissions(new String[]{perm}, 1);
            }
        } catch (Throwable t) {
            Log.e(TAG, "ui: notification permission request failed", t);
        }
    }

    private void bg(Runnable r) {
        Thread t = new Thread(r, "CryptoAlerts-ui");
        t.setDaemon(true);
        t.start();
    }

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}
