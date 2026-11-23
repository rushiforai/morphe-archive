package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.text.format.DateUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * The reply screen with Modern UI on: a card above the editor that says what is being replied to,
 * or that the comment or post is being edited. Joey's own parent view takes half the screen and
 * shows bare text, so it is hidden when the card can say the same. A card that would take too
 * much room starts collapsed and opens with a tap.
 */
public final class ReplyCard {
    private static final String TAG = "MM.ReplyCard";
    private static final String CARD = "mm_reply_card";
    /** Lines a card may take before it starts collapsed. */
    private static final int ROOMY = 8;
    private static final int PEEK = 3;

    private ReplyCard() {
    }

    /** Called as Joey sets up the parent view, which is during onCreate, so the work waits for it. */
    public static void prepare(Activity activity) {
        try {
            if (activity == null || !ModernUi.isModernUiEnabled(activity)) return;
            activity.getWindow().getDecorView().post(() -> apply(activity));
        } catch (Throwable t) {
            Log.e(TAG, "prepare", t);
        }
    }

    private static void apply(Activity activity) {
        try {
            View container = find(activity, "parentCommentContainer");
            if (container == null || !(container.getParent() instanceof LinearLayout)) return;
            LinearLayout parent = (LinearLayout) container.getParent();
            View old = parent.findViewWithTag(CARD);
            if (old != null) parent.removeView(old);

            boolean editComment = flag(activity, "e1");
            boolean editPost = flag(activity, "z1");
            Object target = field(activity, "m1");
            String kind = target == null ? "" : target.getClass().getName();
            ModernUi.Palette palette = ModernUi.getPalette(activity);

            View card = null;
            if (editComment || editPost) {
                card = tagCard(activity, palette, editPost ? "Editing your post" : "Editing your comment");
            } else if (kind.endsWith(".Submission")) {
                card = postCard(activity, palette, target);
            } else if (kind.endsWith(".Comment")) {
                card = commentCard(activity, palette, target);
            }
            if (card != null) {
                card.setTag(CARD);
                container.setVisibility(View.GONE);
                parent.addView(card, parent.indexOfChild(container));
            }
            View editor = find(activity, "ReplyEditor");
            if (editor instanceof EditText && !editComment && !editPost && card != null) {
                EditText input = (EditText) editor;
                if (TextUtils.isEmpty(input.getHint())) input.setHint("Write a reply…");
            }
        } catch (Throwable t) {
            Log.e(TAG, "apply", t);
        }
    }

    private static View commentCard(Activity activity, ModernUi.Palette palette, Object comment) {
        String author = text(comment, "N");
        String body = null;
        View joey = find(activity, "parentComment");
        if (joey instanceof TextView && !TextUtils.isEmpty(((TextView) joey).getText())) {
            body = ((TextView) joey).getText().toString();
        }
        if (TextUtils.isEmpty(body)) body = text(comment, "P");
        if (TextUtils.isEmpty(author) && TextUtils.isEmpty(body)) return null;
        String who = TextUtils.isEmpty(author) ? "" : "u/" + author;
        return build(activity, palette, who, age(comment), body, null);
    }

    private static View postCard(Activity activity, ModernUi.Palette palette, Object post) {
        String title = text(post, "d0");
        if (TextUtils.isEmpty(title)) return null;
        String sub = text(post, "Z");
        String domain = text(post, "R");
        String author = text(post, "N");
        StringBuilder line = new StringBuilder();
        if (!TextUtils.isEmpty(sub)) line.append("r/").append(sub);
        if (!TextUtils.isEmpty(domain) && !domain.startsWith("self.")) {
            if (line.length() > 0) line.append(" · ");
            line.append(domain);
        }
        if (!TextUtils.isEmpty(author)) {
            if (line.length() > 0) line.append(" · ");
            line.append("u/").append(author);
        }
        String body = text(post, "U");
        return build(activity, palette, line.toString(), age(post), body, title);
    }

    /** A one-line card that only says what the screen is doing. */
    private static View tagCard(Activity activity, ModernUi.Palette palette, String label) {
        float d = activity.getResources().getDisplayMetrics().density;
        TextView tag = new TextView(activity);
        tag.setText(label);
        tag.setTextColor(palette.accent);
        tag.setTextSize(13);
        tag.setPadding(Math.round(14 * d), Math.round(8 * d), Math.round(14 * d), Math.round(8 * d));
        tag.setBackground(round(palette.container, 12 * d));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins(Math.round(8 * d), Math.round(8 * d), Math.round(8 * d), Math.round(4 * d));
        tag.setLayoutParams(lp);
        return tag;
    }

    private static View build(Activity activity, ModernUi.Palette palette, String who, String age,
                              String body, String title) {
        float d = activity.getResources().getDisplayMetrics().density;
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(round(palette.container, 12 * d));
        int pad = Math.round(12 * d);
        card.setPadding(pad, Math.round(10 * d), pad, Math.round(10 * d));
        LinearLayout.LayoutParams outer = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        outer.setMargins(Math.round(8 * d), Math.round(8 * d), Math.round(8 * d), Math.round(4 * d));
        card.setLayoutParams(outer);

        LinearLayout head = new LinearLayout(activity);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        TextView who1 = new TextView(activity);
        String line = who + (TextUtils.isEmpty(age) ? "" : (who.isEmpty() ? "" : " · ") + age);
        who1.setText(line);
        who1.setTextColor(title == null ? palette.onSurface : palette.onSurfaceVariant);
        who1.setTextSize(12);
        if (title == null) who1.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        who1.setSingleLine(true);
        who1.setEllipsize(TextUtils.TruncateAt.END);
        head.addView(who1, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView chevron = new TextView(activity);
        chevron.setTextColor(palette.onSurfaceVariant);
        chevron.setTextSize(14);
        chevron.setVisibility(View.GONE);
        head.addView(chevron);

        if (title != null) {
            TextView heading = new TextView(activity);
            heading.setText(title);
            heading.setTextColor(palette.onSurface);
            heading.setTextSize(15);
            heading.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
            heading.setPadding(0, 0, 0, 0);
            card.addView(heading, 0, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        card.addView(head, title == null ? 0 : 1);

        if (TextUtils.isEmpty(body)) return card;
        ScrollView holder = new ScrollView(activity);
        holder.setOverScrollMode(View.OVER_SCROLL_NEVER);
        TextView text = new TextView(activity);
        text.setText(body.trim());
        text.setTextColor(palette.onSurfaceVariant);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setPadding(0, Math.round(4 * d), 0, 0);
        holder.addView(text, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        card.addView(holder, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int maxHeight = Math.round(activity.getResources().getDisplayMetrics().heightPixels * 0.40f);
        boolean[] open = new boolean[1];
        int[] lines = new int[1];
        Runnable paint = () -> {
            chevron.setText(open[0] ? "▴" : "▾");
            ViewGroup.LayoutParams lp = holder.getLayoutParams();
            if (open[0]) {
                text.setMaxLines(Integer.MAX_VALUE);
                text.setEllipsize(null);
                lp.height = lines[0] > ROOMY ? maxHeight : ViewGroup.LayoutParams.WRAP_CONTENT;
            } else {
                text.setMaxLines(PEEK);
                text.setEllipsize(TextUtils.TruncateAt.END);
                lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            }
            holder.setLayoutParams(lp);
        };
        // The line count is only known once the text has been laid out at this width.
        text.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (text.getWidth() == 0 || text.getLayout() == null) return true;
                text.getViewTreeObserver().removeOnPreDrawListener(this);
                lines[0] = text.getLineCount();
                open[0] = lines[0] <= ROOMY;
                if (lines[0] > PEEK) {
                    chevron.setVisibility(View.VISIBLE);
                    View.OnClickListener toggle = v -> {
                        open[0] = !open[0];
                        paint.run();
                    };
                    card.setOnClickListener(toggle);
                }
                paint.run();
                return true;
            }
        });
        return card;
    }

    private static String age(Object contribution) {
        try {
            Object value = contribution.getClass().getMethod("x").invoke(contribution);
            if (value instanceof Date) {
                return DateUtils.getRelativeTimeSpanString(((Date) value).getTime(), System.currentTimeMillis(),
                        DateUtils.MINUTE_IN_MILLIS, DateUtils.FORMAT_ABBREV_RELATIVE).toString();
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    private static String text(Object target, String method) {
        try {
            Method call = target.getClass().getMethod(method);
            Object value = call.invoke(target);
            return value instanceof String ? (String) value : "";
        } catch (Throwable t) {
            return "";
        }
    }

    private static GradientDrawable round(int color, float radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(radius);
        return shape;
    }

    private static View find(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    private static Object field(Activity activity, String name) {
        try {
            for (Class<?> type = activity.getClass(); type != null; type = type.getSuperclass()) {
                try {
                    Field f = type.getDeclaredField(name);
                    f.setAccessible(true);
                    return f.get(activity);
                } catch (NoSuchFieldException ignored) {
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean flag(Activity activity, String name) {
        return Boolean.TRUE.equals(field(activity, name));
    }
}
