package app.wordfeudwordfinder.extension.ui;

import android.content.Context;
import android.graphics.Typeface;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.wordfeudwordfinder.extension.solver.Move;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Framework {@link BaseAdapter} for the overlay's {@code ListView} of moves (spec section 9). Each row shows
 * the word and, below it, direction / rack tiles used / bonuses; the score on the right. The selected row
 * is highlighted. Rows are built in code and recycled via convertView. All texts come from {@link Strings}
 * (via {@link OverlayFormat}).
 */
public final class MoveListAdapter extends BaseAdapter {
    private final Context ctx;
    private final Theme theme;
    private final String lang;
    private final float density;
    private final Typeface inter;
    private final Typeface interBold;
    private final Typeface mono;

    private List<Move> moves = Collections.emptyList();
    private int selected = -1;

    public MoveListAdapter(Context ctx, Theme theme, String lang) {
        this.ctx = ctx;
        this.theme = theme;
        this.lang = lang;
        this.density = ctx.getResources().getDisplayMetrics().density;
        this.inter = Fonts.inter(ctx);
        this.interBold = Fonts.interBold(ctx);
        this.mono = Fonts.mono(ctx);
    }

    /** Replaces the list (copied); the selection is reset to none. Call on the UI thread. */
    public void setMoves(List<Move> list) {
        moves = list == null ? Collections.<Move>emptyList() : new ArrayList<>(list);
        selected = -1;
        notifyDataSetChanged();
    }

    /** Highlights row {@code position}; -1 (or out of range) for none. Call on the UI thread. */
    public void setSelected(int position) {
        selected = position >= 0 && position < moves.size() ? position : -1;
        notifyDataSetChanged();
    }

    public int getSelected() {
        return selected;
    }

    @Override
    public int getCount() {
        return moves.size();
    }

    @Override
    public Move getItem(int position) {
        return moves.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Row row;
        View v = convertView;
        if (v != null && v.getTag() instanceof Row) {
            row = (Row) v.getTag();
        } else {
            row = new Row();
            v = buildRow(row);
        }
        Move m = moves.get(position);
        row.word.setText(m.word);
        row.detail.setText(OverlayFormat.detail(lang, m));
        row.score.setText(OverlayFormat.scoreText(lang, m.score));
        v.setBackgroundColor(position == selected ? theme.surfaceSelected : theme.surface);
        return v;
    }

    private View buildRow(Row row) {
        int padH = dp(16);
        int padV = dp(8);

        LinearLayout root = new LinearLayout(ctx);
        root.setOrientation(LinearLayout.HORIZONTAL);
        root.setGravity(Gravity.CENTER_VERTICAL);
        root.setPadding(padH, padV, padH, padV);
        root.setMinimumHeight(dp(52));
        root.setLayoutParams(new AbsListView.LayoutParams(
                AbsListView.LayoutParams.MATCH_PARENT, AbsListView.LayoutParams.WRAP_CONTENT));

        LinearLayout texts = new LinearLayout(ctx);
        texts.setOrientation(LinearLayout.VERTICAL);
        root.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        row.word = text(17, theme.textPrimary, mono);
        row.word.setTypeface(mono, Typeface.BOLD);
        texts.addView(row.word);

        row.detail = text(13, theme.textSecondary, inter);
        texts.addView(row.detail);

        row.score = text(17, theme.textPrimary, interBold);
        row.score.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(12);
        root.addView(row.score, lp);

        root.setTag(row);
        return root;
    }

    private TextView text(int sp, int color, Typeface face) {
        TextView t = new TextView(ctx);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        t.setTypeface(face);
        t.setSingleLine(true);
        t.setEllipsize(TextUtils.TruncateAt.END);
        return t;
    }

    private int dp(int v) {
        return Math.round(v * density);
    }

    private static final class Row {
        TextView word;
        TextView detail;
        TextView score;
    }
}
