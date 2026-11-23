package app.ftl.extension.videodownloader;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;
import java.util.Map;

public final class PopupManage {
    private static final class Rule {
        final String host;
        final String file;
        final int value;

        Rule(String host, String file, int value) {
            this.host = host;
            this.file = file;
            this.value = value;
        }
    }

    private static final class Holder {
        View root;
        TextView num;
        TextView host;
        TextView chip;
        TextView kind;
        ImageView remove;
    }

    private final Activity activity;
    private final PopupUi ui;
    private final ArrayList<Rule> all = new ArrayList<Rule>();
    private final ArrayList<Rule> shown = new ArrayList<Rule>();
    private String query = "";

    private Dialog dialog;
    private RulesAdapter adapter;
    private TextView countView;
    private TextView emptyView;
    private LinearLayout searchBar;
    private EditText searchInput;
    private ImageView searchButton;

    private PopupManage(Activity activity) {
        this.activity = activity;
        this.ui = new PopupUi(activity);
    }

    public static void show(Activity activity) {
        try {
            new PopupManage(activity).open();
        } catch (Throwable t) {
            Toast.makeText(activity, "Unable to open popup rules", Toast.LENGTH_SHORT).show();
        }
    }

    private void open() {
        DisplayMetrics dm = activity.getResources().getDisplayMetrics();
        int sheetHeight = (int) (dm.heightPixels * 0.88f);

        dialog = ui.newSheet();
        LinearLayout root = ui.sheetRoot(0);

        root.addView(buildHeader(), ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 14, 0, 0));
        root.addView(buildSearchBar(), ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(46), 0, 12, 0, 0));
        searchBar.setVisibility(View.GONE);

        FrameLayout body = new FrameLayout(activity);
        ListView list = new ListView(activity);
        list.setDivider(null);
        list.setDividerHeight(0);
        list.setSelector(new ColorDrawable(Color.TRANSPARENT));
        list.setOverScrollMode(View.OVER_SCROLL_NEVER);
        list.setClipToPadding(false);
        list.setPadding(0, ui.dp(12), 0, ui.dp(24));
        list.setVerticalScrollBarEnabled(false);
        adapter = new RulesAdapter();
        list.setAdapter(adapter);
        body.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        emptyView = ui.text(14f, PopupUi.MUTED, false);
        emptyView.setGravity(Gravity.CENTER);
        emptyView.setLineSpacing(ui.dp(3), 1f);
        FrameLayout.LayoutParams ep = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        ep.gravity = Gravity.CENTER;
        body.addView(emptyView, ep);

        root.addView(body, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        reload();
        ui.present(dialog, root, sheetHeight, true);
    }

    private View buildHeader() {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout titles = new LinearLayout(activity);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(24f, PopupUi.INK, true);
        title.setText("Popup rules");
        countView = ui.text(13f, PopupUi.MUTED, false);
        titles.addView(title);
        titles.addView(countView, ui.lp(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 6, 0, 0));
        row.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        searchButton = ui.iconButton(PopupGlyph.SEARCH, PopupUi.INK, PopupUi.CARD, PopupUi.LINE, 42, 11);
        searchButton.setContentDescription("Search domains");
        searchButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggleSearch();
            }
        });
        row.addView(searchButton);

        TextView done = ui.text(15f, PopupUi.ACCENT, true);
        done.setText("Done");
        done.setGravity(Gravity.CENTER);
        done.setPadding(ui.dp(14), ui.dp(10), ui.dp(6), ui.dp(10));
        done.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        row.addView(done);
        return row;
    }

    private View buildSearchBar() {
        searchBar = new LinearLayout(activity);
        searchBar.setOrientation(LinearLayout.HORIZONTAL);
        searchBar.setGravity(Gravity.CENTER_VERTICAL);
        searchBar.setBackground(ui.shape(PopupUi.CARD, 23f, PopupUi.LINE));
        searchBar.setPadding(ui.dp(14), 0, ui.dp(6), 0);

        ImageView icon = new ImageView(activity);
        icon.setImageDrawable(new PopupGlyph(PopupGlyph.SEARCH, PopupUi.MUTED));
        icon.setScaleType(ImageView.ScaleType.FIT_XY);
        searchBar.addView(icon, new LinearLayout.LayoutParams(ui.dp(18), ui.dp(18)));

        searchInput = new EditText(activity);
        searchInput.setBackground(null);
        searchInput.setHint("Search domains");
        searchInput.setHintTextColor(0xFF9AA1B2);
        searchInput.setTextColor(PopupUi.INK);
        searchInput.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        searchInput.setSingleLine(true);
        searchInput.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        searchInput.setPadding(ui.dp(10), 0, ui.dp(6), 0);
        searchInput.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                query = s.toString().trim().toLowerCase(Locale.ROOT);
                applyFilter();
            }
        });
        searchInput.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, android.view.KeyEvent event) {
                hideKeyboard();
                return true;
            }
        });
        searchBar.addView(searchInput, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));

        ImageView clear = ui.iconButton(PopupGlyph.CLOSE, PopupUi.MUTED, PopupUi.CHIP_GRAY, 0, 32, 9);
        clear.setContentDescription("Clear search");
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                searchInput.setText("");
            }
        });
        searchBar.addView(clear);
        return searchBar;
    }

    private void toggleSearch() {
        boolean open = searchBar.getVisibility() != View.VISIBLE;
        if (open) {
            searchBar.setVisibility(View.VISIBLE);
            searchButton.setBackground(ui.ripple(ui.oval(PopupUi.ACCENT_SOFT, PopupUi.ACCENT)));
            searchInput.requestFocus();
            searchInput.post(new Runnable() {
                @Override
                public void run() {
                    InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
                    if (imm != null) {
                        imm.showSoftInput(searchInput, 0);
                    }
                }
            });
        } else {
            searchInput.setText("");
            hideKeyboard();
            searchBar.setVisibility(View.GONE);
            searchButton.setBackground(ui.ripple(ui.oval(PopupUi.CARD, PopupUi.LINE)));
        }
    }

    private void hideKeyboard() {
        InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null && searchInput != null) {
            imm.hideSoftInputFromWindow(searchInput.getWindowToken(), 0);
        }
    }

    private void reload() {
        all.clear();
        collect(PopupStore.REDIRECT);
        collect(PopupStore.WINDOW);
        Collections.sort(all, new Comparator<Rule>() {
            @Override
            public int compare(Rule a, Rule b) {
                return a.host.compareToIgnoreCase(b.host);
            }
        });
        applyFilter();
    }

    private void collect(String file) {
        Map<String, ?> map = activity.getSharedPreferences(file, 0).getAll();
        for (Map.Entry<String, ?> entry : map.entrySet()) {
            if (!(entry.getValue() instanceof Integer)) {
                continue;
            }
            int value = (Integer) entry.getValue();
            if (value != PopupStore.BLOCK && value != PopupStore.ALLOW) {
                continue;
            }
            if (PopupStore.REDIRECT.equals(file) && value != PopupStore.BLOCK) {
                continue;
            }
            all.add(new Rule(entry.getKey(), file, value));
        }
    }

    private void applyFilter() {
        shown.clear();
        for (Rule rule : all) {
            if (query.length() == 0 || rule.host.toLowerCase(Locale.ROOT).contains(query)) {
                shown.add(rule);
            }
        }
        int total = all.size();
        String noun = total == 1 ? " rule" : " rules";
        if (query.length() == 0) {
            countView.setText(total + noun);
        } else {
            countView.setText(shown.size() + " of " + total + noun);
        }
        if (shown.isEmpty()) {
            emptyView.setText(total == 0
                    ? "No popup rules yet\nBlocked and allowed sites show up here"
                    : "No matching domains");
            emptyView.setVisibility(View.VISIBLE);
        } else {
            emptyView.setVisibility(View.GONE);
        }
        if (adapter != null) {
            adapter.notifyDataSetChanged();
        }
    }

    private void remove(Rule rule) {
        PopupStore.remove(activity, rule.file, rule.host);
        all.remove(rule);
        applyFilter();
    }

    private final class RulesAdapter extends BaseAdapter {
        @Override
        public int getCount() {
            return shown.size();
        }

        @Override
        public Object getItem(int position) {
            return shown.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Holder h;
            View v = convertView;
            if (v == null) {
                h = buildRow();
                v = h.root;
                v.setTag(h);
            } else {
                h = (Holder) v.getTag();
            }
            final Rule rule = shown.get(position);
            String n = String.valueOf(position + 1);
            h.num.setText(n);
            h.num.setTextSize(TypedValue.COMPLEX_UNIT_SP, n.length() >= 3 ? 11f : 13f);
            h.host.setText(rule.host);
            boolean blocked = rule.value == PopupStore.BLOCK;
            h.chip.setText(blocked ? "Blocked" : "Allowed");
            h.chip.setTextColor(blocked ? PopupUi.RED : PopupUi.GREEN);
            h.chip.setBackground(ui.shape(blocked ? PopupUi.RED_SOFT : PopupUi.GREEN_SOFT, 10f, 0));
            h.kind.setText(PopupStore.REDIRECT.equals(rule.file) ? "Redirect" : "New window");
            h.remove.setContentDescription("Remove " + rule.host);
            h.remove.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    remove(rule);
                }
            });
            return v;
        }

        private Holder buildRow() {
            Holder h = new Holder();
            FrameLayout outer = new FrameLayout(activity);
            outer.setPadding(0, 0, 0, ui.dp(8));

            LinearLayout card = new LinearLayout(activity);
            card.setOrientation(LinearLayout.HORIZONTAL);
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setBackground(ui.shape(PopupUi.CARD, 18f, PopupUi.LINE));
            card.setPadding(ui.dp(12), ui.dp(12), ui.dp(10), ui.dp(12));

            h.num = ui.text(13f, PopupUi.ACCENT, true);
            h.num.setGravity(Gravity.CENTER);
            h.num.setMinWidth(ui.dp(32));
            h.num.setMinHeight(ui.dp(32));
            h.num.setPadding(ui.dp(8), 0, ui.dp(8), 0);
            h.num.setBackground(ui.shape(PopupUi.ACCENT_SOFT, 16f, 0));
            card.addView(h.num, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(32)));

            LinearLayout col = new LinearLayout(activity);
            col.setOrientation(LinearLayout.VERTICAL);
            h.host = ui.text(15f, PopupUi.INK, true);
            h.host.setMaxLines(2);
            h.host.setEllipsize(TextUtils.TruncateAt.END);
            h.host.setLineSpacing(ui.dp(2), 1f);
            col.addView(h.host);

            LinearLayout meta = new LinearLayout(activity);
            meta.setOrientation(LinearLayout.HORIZONTAL);
            meta.setGravity(Gravity.CENTER_VERTICAL);
            h.chip = ui.text(11f, PopupUi.RED, true);
            h.chip.setPadding(ui.dp(8), ui.dp(4), ui.dp(8), ui.dp(4));
            h.kind = ui.text(12f, PopupUi.MUTED, false);
            meta.addView(h.chip);
            meta.addView(h.kind, ui.lp(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, 8, 0, 0, 0));
            col.addView(meta, ui.lp(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, 0, 7, 0, 0));

            LinearLayout.LayoutParams cp = ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 12, 0, 8, 0);
            cp.weight = 1f;
            card.addView(col, cp);

            h.remove = ui.iconButton(PopupGlyph.CLOSE, PopupUi.RED, PopupUi.RED_SOFT, 0, 38, 11);
            card.addView(h.remove);

            outer.addView(card, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            h.root = outer;
            return h;
        }
    }
}
