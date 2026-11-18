package app.template.extension.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.function.IntFunction;

/** Request table shared by live diagnostics and saved activity. */
final class RequestListView extends LinearLayout {
    private static final int TEXT = 0xff212121, MUTED = 0xff666666;
    private final ListView events;
    private final RequestAdapter requests = new RequestAdapter();
    private long expandedNumber = -1;

    static final class Row {
        final String offset, duration, name, response;

        Row(String offset, String duration, String name, String response) {
            this.offset = offset;
            this.duration = duration;
            this.name = name;
            this.response = response;
        }
    }

    RequestListView(Context context, String emptyMessage) {
        super(context);
        setOrientation(VERTICAL);
        LinearLayout columns = new LinearLayout(context);
        columns.setPadding(dp(16), dp(10), dp(16), dp(10));
        columns.setBackgroundColor(0xffd9efec);
        LinearLayout.LayoutParams columnParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        TextView time = text("Time", 14, TEXT);
        time.setTypeface(null, Typeface.BOLD);
        columns.addView(time, new LinearLayout.LayoutParams(dp(100), ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView name = text("Request / response", 14, TEXT);
        name.setTypeface(null, Typeface.BOLD);
        columns.addView(name);
        addView(columns, columnParams);

        android.widget.FrameLayout listArea = new android.widget.FrameLayout(context);
        addView(listArea, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        events = new ListView(context);
        events.setDivider(new android.graphics.drawable.ColorDrawable(0xffd9dfe2));
        events.setDividerHeight(dp(1));
        events.setAdapter(requests);
        listArea.addView(events, new android.widget.FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        TextView empty = text(emptyMessage, 14, MUTED);
        empty.setPadding(dp(16), dp(16), dp(16), 0);
        listArea.addView(empty);
        events.setEmptyView(empty);
        events.setOnItemClickListener((parent, view, position, id) -> {
            RequestRowView row = (RequestRowView) view;
            android.text.Layout layout = row.response.getLayout();
            if (layout != null && layout.getLineCount() > 0
                    && layout.getEllipsisCount(layout.getLineCount() - 1) > 0) {
                expandedNumber = id;
                requests.notifyDataSetChanged();
            } else {
                ClipboardManager clipboard = getContext().getSystemService(ClipboardManager.class);
                if (clipboard == null || row.response.length() == 0) return;
                clipboard.setPrimaryClip(ClipData.newPlainText("Printer response", row.response.getText()));
                if (android.os.Build.VERSION.SDK_INT < 33) {
                    Toast.makeText(getContext(), "Response copied", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    void setRows(long firstNumber, int count, IntFunction<Row> rows) {
        requests.firstNumber = firstNumber;
        requests.count = count;
        requests.rows = rows;
        if (expandedNumber < firstNumber || expandedNumber - firstNumber >= count) resetExpansion();
        requests.notifyDataSetChanged();
    }

    void resetExpansion() {
        expandedNumber = -1;
    }

    void setOnRowLongClick(java.util.function.IntConsumer showDetails) {
        events.setOnItemLongClickListener((parent, view, position, id) -> {
            showDetails.accept(position);
            return true;
        });
    }

    private int dp(float value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(getContext());
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private final class RequestRowView extends LinearLayout {
        final TextView number = text("", 12, MUTED);
        final TextView offset = text("", 14, TEXT);
        final TextView duration = text("", 13, 0xff777d86);
        final TextView name = text("", 15, TEXT);
        final TextView response = text("", 14, 0xff343c47);

        RequestRowView() {
            super(RequestListView.this.getContext());
            setPadding(dp(16), dp(11), dp(16), dp(11));
            LinearLayout times = new LinearLayout(RequestListView.this.getContext());
            times.setOrientation(VERTICAL);
            times.addView(number);
            times.addView(offset);
            times.addView(duration);
            addView(times, new LayoutParams(dp(100), ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout values = new LinearLayout(RequestListView.this.getContext());
            values.setOrientation(VERTICAL);
            name.setTypeface(null, Typeface.BOLD);
            values.addView(name);
            values.addView(response);
            addView(values, new LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        }
    }

    private final class RequestAdapter extends BaseAdapter {
        long firstNumber;
        int count;
        IntFunction<Row> rows;

        @Override public int getCount() { return count; }
        @Override public Row getItem(int position) { return rows.apply(position); }
        @Override public long getItemId(int position) { return firstNumber + position; }
        @Override public boolean hasStableIds() { return true; }

        @Override public View getView(int position, View recycled, ViewGroup parent) {
            RequestRowView row = recycled == null ? new RequestRowView() : (RequestRowView) recycled;
            Row item = getItem(position);
            long number = getItemId(position);
            row.number.setText("#" + number);
            row.offset.setText(item.offset);
            row.duration.setText(item.duration);
            row.name.setText(item.name);
            boolean expanded = number == expandedNumber;
            row.response.setMaxLines(expanded ? Integer.MAX_VALUE : 3);
            row.response.setEllipsize(expanded ? null : android.text.TextUtils.TruncateAt.END);
            row.response.setText(item.response);
            return row;
        }
    }
}
