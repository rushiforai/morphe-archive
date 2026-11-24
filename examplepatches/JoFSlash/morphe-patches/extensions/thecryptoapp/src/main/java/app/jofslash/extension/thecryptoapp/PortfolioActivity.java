package app.jofslash.extension.thecryptoapp;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Local, manual portfolio: add holdings (symbol + amount), see per-holding value and the total
 * from live prices (batched via {@link PriceFetcher}). Pure local storage, no wallet/exchange
 * connection, no API keys. Styled with {@link Palette}.
 */
public final class PortfolioActivity extends Activity {

    static final String TAG = CustomAlerts.TAG;

    private Palette p;
    private ScrollView scroll;
    private LinearLayout listContainer;
    private TextView totalView;
    private EditText symbolInput;
    private EditText amountInput;
    private Button addButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            p = new Palette(this);
            View root = buildRoot();
            p.setUpWindow(this, root);
            setContentView(root);
            // onResume, which always follows, does the first refresh.
        } catch (Throwable t) {
            Log.e(TAG, "portfolio: onCreate failed", t);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        refresh();
    }

    private View buildRoot() {
        scroll = new ScrollView(this);
        scroll.setBackgroundColor(p.screenBg);
        scroll.setFillViewport(true);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(p.dp(16), p.dp(16), p.dp(16), p.dp(24));
        scroll.addView(root);

        TextView header = new TextView(this);
        header.setText("Portfolio");
        header.setTextSize(24);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(p.textPrimary);
        root.addView(header);

        totalView = new TextView(this);
        totalView.setTextSize(18);
        totalView.setTextColor(p.textPrimary);
        totalView.setPadding(0, p.dp(4), 0, p.dp(12));
        totalView.setText("Total: ...");
        root.addView(totalView);

        // Add card
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

        amountInput = styledEdit("Amount held, e.g. 0.5");
        amountInput.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
        // The plain decimal key listener silently drops a typed comma, so "0,05" became "005" (a
        // target 100x too high). Accept both; the parser turns the comma into a dot.
        amountInput.setKeyListener(android.text.method.DigitsKeyListener.getInstance("0123456789.,"));
        LinearLayout.LayoutParams alp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        alp.topMargin = p.dp(10);
        card.addView(amountInput, alp);

        addButton = new Button(this);
        addButton.setText("Add holding");
        addButton.setAllCaps(false);
        addButton.setTextColor(0xFFFFFFFF);
        addButton.setBackground(p.primaryButton());
        addButton.setOnClickListener(v -> onAdd());
        LinearLayout.LayoutParams blp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        blp.topMargin = p.dp(12);
        card.addView(addButton, blp);

        root.addView(card);

        TextView hdr = new TextView(this);
        hdr.setText("Holdings");
        hdr.setTextSize(16);
        hdr.setTypeface(Typeface.DEFAULT_BOLD);
        hdr.setTextColor(p.textPrimary);
        hdr.setPadding(0, p.dp(16), 0, p.dp(8));
        root.addView(hdr);

        listContainer = new LinearLayout(this);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        root.addView(listContainer);

        return scroll;
    }

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

    private void onAdd() {
        symbolInput.setError(null);
        amountInput.setError(null);
        final String typed = symbolInput.getText().toString().trim();
        final String symbol = PriceFetcher.normalize(typed);
        // Some keyboards (e.g. a Slovak one) type a decimal comma.
        String amtStr = amountInput.getText().toString().trim().replace(',', '.');
        if (typed.isEmpty()) {
            symbolInput.setError("Enter a symbol");
            return;
        }
        if (symbol == null) {
            symbolInput.setError("Letters and digits only, e.g. BTCUSDT or BTC");
            return;
        }
        if (amtStr.isEmpty()) {
            amountInput.setError("Enter an amount");
            return;
        }
        final double amount;
        try {
            amount = Double.parseDouble(amtStr);
        } catch (NumberFormatException e) {
            amountInput.setError("Not a number");
            return;
        }
        if (!(amount > 0) || Double.isInfinite(amount)) {
            amountInput.setError("Must be greater than 0");
            return;
        }
        final String display = PriceFetcher.baseOf(symbol);

        addButton.setEnabled(false);
        addButton.setText("Checking symbol...");
        new Thread(() -> {
            final Double price = PriceFetcher.fetchPrice(getApplicationContext(), symbol);
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                addButton.setEnabled(true);
                addButton.setText("Add holding");
                if (price == null) {
                    symbolInput.setError("Unknown or unavailable symbol");
                    return;
                }
                PortfolioStore.add(this, symbol, display, amount);
                symbolInput.setText("");
                amountInput.setText("");
                toast("Holding added");
                refresh();
            });
        }, "CryptoPortfolio-add").start();
    }

    private void refresh() {
        try {
            List<Holding> holdings = PortfolioStore.load(this);
            renderList(holdings, null);
            if (holdings.isEmpty()) {
                totalView.setText("Total: $0");
                return;
            }
            totalView.setText("Total: ...");
            Set<String> symbols = new LinkedHashSet<>();
            for (Holding h : holdings) symbols.add(h.symbol);
            new Thread(() -> {
                final PriceFetcher.PriceMap pm = PriceFetcher.fetchAll(getApplicationContext(), symbols);
                runOnUiThread(() -> {
                    if (!isFinishing() && !isDestroyed()) renderList(PortfolioStore.load(this), pm);
                });
            }, "CryptoPortfolio-refresh").start();
        } catch (Throwable t) {
            Log.e(TAG, "portfolio: refresh failed", t);
        }
    }

    private void renderList(List<Holding> holdings, PriceFetcher.PriceMap pm) {
        try {
            listContainer.removeAllViews();
            double total = 0d;
            boolean haveAll = pm != null;
            if (holdings.isEmpty()) {
                TextView empty = new TextView(this);
                empty.setText("No holdings yet. Add one above.");
                empty.setTextColor(p.textSecondary);
                listContainer.addView(empty);
                return;
            }
            for (final Holding h : holdings) {
                Double price = pm == null ? null : pm.prices.get(h.symbol);
                Double value = price == null ? null : price * h.amount;
                if (value != null) total += value; else haveAll = false;
                listContainer.addView(holdingCard(h, price, value));
            }
            if (pm != null) {
                totalView.setText("Total: " + PriceFormat.money(total) + (haveAll ? "" : " (partial)"));
            }
        } catch (Throwable t) {
            Log.e(TAG, "portfolio: render failed", t);
        }
    }

    private View holdingCard(final Holding h, Double price, Double value) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setBackground(p.card());
        int pad = p.dp(14);
        card.setPadding(pad, pad, pad, pad);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = p.dp(10);
        card.setLayoutParams(lp);

        LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        card.addView(col, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView title = new TextView(this);
        title.setText(String.format(Locale.US, "%s  x%s", h.displayName, PriceFormat.editable(h.amount)));
        title.setTextColor(p.textPrimary);
        title.setTextSize(16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        col.addView(title);

        TextView detail = new TextView(this);
        detail.setTextSize(13);
        detail.setTextColor(p.textSecondary);
        if (price == null) {
            detail.setText("price unavailable");
        } else {
            detail.setText(String.format(Locale.US, "@ %s  =  %s",
                    PriceFormat.money(price), PriceFormat.money(value == null ? 0d : value)));
        }
        col.addView(detail);

        Button del = new Button(this);
        del.setText("Delete");
        del.setAllCaps(false);
        del.setTextColor(p.down);
        del.setBackground(p.secondaryButton());
        del.setTextSize(12);
        del.setOnClickListener(v -> {
            PortfolioStore.delete(PortfolioActivity.this, h.id);
            refresh();
        });
        card.addView(del);

        return card;
    }

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}
