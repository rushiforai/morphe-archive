package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;

import java.util.ArrayList;
import java.util.List;

/**
 * Apps bar: the Apple Music wordmark, the browse tabs (Início/Rádio/Biblioteca) and the
 * shortcuts to Buscar, Conta and Atualizações. It collapses to two rows on a phone
 * (brand + icon shortcuts, tabs underneath) and stays on one row on TV/head unit; a wide
 * window that is not wide enough for the labelled shortcuts (rotated phone) keeps one row
 * with the icon shortcuts.
 */
public final class TopBar extends LinearLayout {

    public interface Listener {
        void onTabSelected(int index);

        void onSearch();

        void onAccount();

        void onUpdates();

        /** D-pad DOWN from the chrome: jump into the screen content. */
        void onDownFromChrome();
    }

    private final Listener listener;
    private final LinearLayout tabsRow;
    private final LinearLayout actionsRow;
    private final List<TabView> tabs = new ArrayList<TabView>();

    public TopBar(Context context, Listener listener) {
        super(context);
        this.listener = listener;
        setOrientation(VERTICAL);
        setPadding(Tokens.dp(16), Tokens.dp(10), Tokens.dp(16), Tokens.dp(2));

        if (Tokens.wide()) {
            LinearLayout row = row(context);
            addView(row, new LinearLayout.LayoutParams(
                    LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
            row.addView(brand(context));
            tabsRow = row(context);
            LinearLayout.LayoutParams tabsParams = new LinearLayout.LayoutParams(
                    LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            tabsParams.leftMargin = Tokens.dp(18);
            row.addView(tabsRow, tabsParams);
            row.addView(grow(context));
            actionsRow = row(context);
            // A wide-but-short window (a rotated phone is ~780 dp wide) has no room for
            // the three labelled shortcuts next to the brand and the tabs, so it falls
            // back to the icon shortcuts instead of clipping "Atualizações".
            buildActions(context, Tokens.screenWidthDp() >= 900f);
            row.addView(actionsRow);
        } else {
            LinearLayout head = row(context);
            addView(head, new LinearLayout.LayoutParams(
                    LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
            head.addView(brand(context));
            head.addView(grow(context));
            actionsRow = row(context);
            buildActions(context, false);
            head.addView(actionsRow);

            HorizontalScrollView scroll = new HorizontalScrollView(context);
            scroll.setHorizontalScrollBarEnabled(false);
            LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(
                    LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
            scrollParams.topMargin = Tokens.dp(4);
            addView(scroll, scrollParams);
            tabsRow = row(context);
            scroll.addView(tabsRow);
        }
    }

    private void buildActions(Context context, boolean labelled) {
        if (labelled) {
            Pill search = Pill.surface(context, Icons.SEARCH, "Buscar");
            search.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onSearch();
                }
            });
            search.setOnKeyListener(chromeDown());
            Pill account = Pill.surface(context, Icons.ACCOUNT, "Conta");
            account.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onAccount();
                }
            });
            account.setOnKeyListener(chromeDown());
            Pill updates = Pill.surface(context, Icons.REFRESH, "Atualizações");
            updates.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onUpdates();
                }
            });
            updates.setOnKeyListener(chromeDown());
            addAction(search, Tokens.dp(8));
            addAction(account, Tokens.dp(8));
            addAction(updates, 0);
        } else {
            addAction(iconAction(context, Icons.SEARCH, "Buscar", new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onSearch();
                }
            }), Tokens.dp(2));
            addAction(iconAction(context, Icons.ACCOUNT, "Conta", new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onAccount();
                }
            }), Tokens.dp(2));
            addAction(iconAction(context, Icons.REFRESH, "Atualizações", new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onUpdates();
                }
            }), 0);
        }
    }

    private OnKeyListener chromeDown() {
        return new OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (event.getAction() == KeyEvent.ACTION_DOWN
                        && keyCode == KeyEvent.KEYCODE_DPAD_DOWN) {
                    listener.onDownFromChrome();
                    return true;
                }
                return false;
            }
        };
    }

    private void addAction(View view, int leftMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        params.leftMargin = leftMargin;
        params.gravity = Gravity.CENTER_VERTICAL;
        actionsRow.addView(view, params);
    }

    private View iconAction(Context context, int icon, CharSequence description,
                            OnClickListener click) {
        CircleButton button = new CircleButton(context, icon, 40f, Tokens.SURFACE,
                Tokens.TEXT, 20f);
        button.setContentDescription(description);
        button.setOnClickListener(click);
        button.setOnKeyListener(chromeDown());
        return button;
    }

    private static LinearLayout row(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        return row;
    }

    private static View grow(Context context) {
        View spacer = new View(context);
        spacer.setLayoutParams(new LinearLayout.LayoutParams(0, 1, 1f));
        return spacer;
    }

    private static TextView brand(Context context) {
        TextView brand = Inter.text(context, "Apple Music", 20f, Inter.BOLD, Tokens.ACCENT);
        brand.setLetterSpacing(0.01f);
        brand.setSingleLine(true);
        return brand;
    }

    public void setTabs(String[] titles, int selected) {
        tabsRow.removeAllViews();
        tabs.clear();
        for (int i = 0; i < titles.length; i++) {
            final int index = i;
            TabView tab = new TabView(getContext(), titles[i]);
            tab.setOnClickListener(new OnClickListener() {
                @Override
                public void onClick(View v) {
                    listener.onTabSelected(index);
                }
            });
            tab.setOnKeyListener(new OnKeyListener() {
                @Override
                public boolean onKey(View v, int keyCode, KeyEvent event) {
                    if (event.getAction() == KeyEvent.ACTION_DOWN
                            && keyCode == KeyEvent.KEYCODE_DPAD_DOWN) {
                        listener.onDownFromChrome();
                        return true;
                    }
                    return false;
                }
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
            params.rightMargin = Tokens.dp(4);
            tabsRow.addView(tab, params);
            tabs.add(tab);
        }
        for (int i = 0; i < tabs.size(); i++) {
            TabView tab = tabs.get(i);
            tab.setId(View.generateViewId());
            if (i > 0) tab.setNextFocusLeftId(tabs.get(i - 1).getId());
            if (i < tabs.size() - 1) tab.setNextFocusRightId(tabs.get(i + 1).getId());
        }
        select(selected);
    }

    public void select(int index) {
        for (int i = 0; i < tabs.size(); i++) {
            tabs.get(i).setSelected(i == index);
        }
    }

    public View tabAt(int index) {
        if (index < 0 || index >= tabs.size()) return null;
        return tabs.get(index);
    }
}
