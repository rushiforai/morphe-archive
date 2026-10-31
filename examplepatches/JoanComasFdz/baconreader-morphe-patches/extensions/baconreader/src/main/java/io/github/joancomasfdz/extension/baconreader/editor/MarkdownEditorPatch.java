// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.editor;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * The text boxes for comments, replies, edits, messages and text posts: as big as the screen allows, a bar with
 * Reddit's formats above them, and the markdown shown formatted while typing (see {@link MarkdownHighlighter}).
 * The app's own format bar ("A" in the toolbar) is replaced.
 */
@SuppressWarnings("unused")
public final class MarkdownEditorPatch {
    private static final String ATTACHED_TAG = "revanced_markdown_editor";
    /** The replied comment or post takes at most this part of the reply screen; the text box the rest. */
    private static final float REPLIED_MAX_HEIGHT = 0.35f;

    private MarkdownEditorPatch() {
    }

    // region Hooks

    /**
     * Injected after PostActivity.onCreate (comments, replies, edits) and ComposeMessageActivity.onCreate set their
     * layout: set up once onCreate has finished (the app's format bar is made after the layout).
     */
    public static void onEditorScreen(Activity activity) {
        activity.getWindow().getDecorView().post(() -> {
            try {
                EditText editText = activity.findViewById(id("replyText"));
                if (editText == null) editText = activity.findViewById(id("messageText"));
                if (editText == null) return;
                removeAppFormatBar(activity.findViewById(id("formatContainer")));
                attach(editText);
            } catch (Exception ex) {
                ErrorDialog.printException(() -> "Could not set up the markdown editor", ex);
            }
        });
    }

    /** Injected before SubmitTextPage.onCreateView returns its view (text posts). */
    public static void onEditorView(View view) {
        try {
            EditText editText = view.findViewById(id("replyText"));
            if (editText == null) return;
            attach(editText);
            // The app's format bar belongs to the activity: remove it once the page is in it.
            view.post(() -> {
                Context context = view.getContext();
                if (context instanceof Activity) {
                    removeAppFormatBar(((Activity) context).findViewById(id("formatContainer")));
                }
            });
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not set up the markdown editor", ex);
        }
    }

    /**
     * Injected after onCreateOptionsMenu of the editors inflates the menu: the app's format button ("A") is replaced by the
     * bar. It cannot be hidden (the app shows it again), so it gets an empty, disabled view.
     */
    public static void hideFormatButton(Menu menu) {
        try {
            MenuItem item = menu.findItem(id("action_format"));
            if (item == null) return;
            View empty = new View(Utils.getContext());
            empty.setLayoutParams(new ViewGroup.LayoutParams(0, 0));
            item.setActionView(empty);
            item.setEnabled(false);
            item.setVisible(false);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not hide the format button", ex);
        }
    }

    // endregion

    private static void removeAppFormatBar(View formatContainer) {
        if (!(formatContainer instanceof ViewGroup)) return;
        ((ViewGroup) formatContainer).removeAllViews();
        formatContainer.setVisibility(View.GONE);
    }

    private static void attach(final EditText editText) {
        if (ATTACHED_TAG.equals(editText.getTag())) return;
        editText.setTag(ATTACHED_TAG);
        Context context = editText.getContext();

        // Live formatting.
        final MarkdownHighlighter highlighter = new MarkdownHighlighter(
                editText.getCurrentTextColor(), accentColor(context, editText.getCurrentTextColor()));
        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                highlighter.highlight(s);
            }
        });
        highlighter.highlight(editText.getText());

        // As tall as possible, text from the top.
        editText.setMaxLines(Integer.MAX_VALUE);
        editText.setGravity(Gravity.TOP | Gravity.START);

        View bar = formatBar(editText);
        ViewGroup parent = (ViewGroup) editText.getParent();
        int replyContainer = id("replyTextContainer");
        if (parent.getId() == replyContainer && parent.getId() != 0) {
            layoutReplyScreen(editText, parent, bar);
            showScrollbar(editText); // The box scrolls its text.
        } else {
            insertAbove(parent, editText, bar);
            fillScrollView(editText);
        }
    }

    // region Size

    /**
     * Reply screen (make_comment): the replied comment scrolls above, at most a third of the screen; the bar and
     * the text box fill the rest, instead of a box of at most 8 lines at the bottom.
     */
    private static void layoutReplyScreen(EditText editText, ViewGroup container, View bar) {
        container.addView(bar, 0, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams editParams = (LinearLayout.LayoutParams) editText.getLayoutParams();
        editParams.height = 0;
        editParams.weight = 1;
        editText.setLayoutParams(editParams);

        View scroll = ((Activity) editText.getContext()).findViewById(id("scrollContainer"));
        if (!(scroll instanceof ScrollView) || !(container.getLayoutParams() instanceof RelativeLayout.LayoutParams)) {
            return;
        }
        RelativeLayout.LayoutParams containerParams = (RelativeLayout.LayoutParams) container.getLayoutParams();
        containerParams.height = ViewGroup.LayoutParams.MATCH_PARENT;
        containerParams.addRule(RelativeLayout.BELOW, scroll.getId());
        container.setLayoutParams(containerParams);

        RelativeLayout.LayoutParams scrollParams = (RelativeLayout.LayoutParams) scroll.getLayoutParams();
        scrollParams.removeRule(RelativeLayout.ABOVE);
        scrollParams.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        scroll.setLayoutParams(scrollParams);

        // Long replied texts scroll within a third of the screen (also with the keyboard open).
        final View root = (View) container.getParent();
        root.addOnLayoutChangeListener((v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            ScrollView scrollView = (ScrollView) scroll;
            if (scrollView.getChildCount() == 0) return;
            int max = Math.round((bottom - top) * REPLIED_MAX_HEIGHT);
            int content = scrollView.getChildAt(0).getMeasuredHeight();
            int height = content > max ? max : ViewGroup.LayoutParams.WRAP_CONTENT;
            RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) scrollView.getLayoutParams();
            if (params.height != height) {
                params.height = height;
                scrollView.post(() -> scrollView.setLayoutParams(params));
            }
        });
    }

    /** Messages and text posts: the box grows until the scrolling page fills the screen. */
    private static void fillScrollView(final EditText editText) {
        editText.post(() -> {
            ScrollView scroll = null;
            for (ViewParent parent = editText.getParent(); parent != null; parent = parent.getParent()) {
                if (parent instanceof ScrollView) {
                    scroll = (ScrollView) parent;
                    break;
                }
            }
            if (scroll == null) {
                editText.setMinLines(8);
                return;
            }
            final ScrollView scrollView = scroll;
            showScrollbar(scrollView); // The page scrolls, with the box in it.
            final int minimum = editText.getLineHeight() * 4;
            View.OnLayoutChangeListener fill = (v, l, t, r, b, ol, ot, or, ob) -> {
                if (scrollView.getChildCount() == 0) return;
                int free = scrollView.getHeight() - scrollView.getPaddingTop() - scrollView.getPaddingBottom()
                        - scrollView.getChildAt(0).getHeight();
                int height = Math.max(minimum, editText.getHeight() + free);
                if (Math.abs(height - editText.getMinHeight()) > 1) {
                    editText.post(() -> editText.setMinHeight(height));
                }
            };
            scrollView.addOnLayoutChangeListener(fill);
            scrollView.requestLayout();
        });
    }

    /**
     * A scrollbar on the right that stays while there is more text than fits (Android draws none when everything
     * fits), so it shows how much text there is.
     */
    private static void showScrollbar(View view) {
        Context context = view.getContext();
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
            android.graphics.drawable.GradientDrawable thumb = new android.graphics.drawable.GradientDrawable();
            thumb.setColor((secondaryTextColor(context) & 0x00FFFFFF) | 0x99000000);
            thumb.setCornerRadius(dp(context, 2));
            thumb.setSize(dp(context, 4), dp(context, 32));
            view.setVerticalScrollbarThumbDrawable(thumb); // Also sets up scrollbars for a view without them.
        }
        view.setVerticalScrollBarEnabled(true);
        view.setScrollbarFadingEnabled(false);
        view.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);
    }

    private static void insertAbove(ViewGroup parent, EditText editText, View bar) {
        if (parent instanceof LinearLayout) {
            parent.addView(bar, parent.indexOfChild(editText), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else if (parent instanceof RelativeLayout
                && editText.getLayoutParams() instanceof RelativeLayout.LayoutParams) {
            // The bar takes the box's place; the box goes below it.
            RelativeLayout.LayoutParams editParams = (RelativeLayout.LayoutParams) editText.getLayoutParams();
            RelativeLayout.LayoutParams barParams = new RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            int[] rules = editParams.getRules();
            for (int verb = 0; verb < rules.length; verb++) {
                if (rules[verb] != 0) barParams.addRule(verb, rules[verb]);
            }
            barParams.setMargins(editParams.leftMargin, editParams.topMargin, editParams.rightMargin, 0);
            bar.setId(View.generateViewId());
            parent.addView(bar, barParams);
            editParams.removeRule(RelativeLayout.ALIGN_PARENT_TOP);
            editParams.addRule(RelativeLayout.BELOW, bar.getId());
            editParams.topMargin = 0;
            editText.setLayoutParams(editParams);
        } else {
            parent.addView(bar, parent.indexOfChild(editText));
        }
    }

    // endregion

    // region Format bar

    private static View formatBar(EditText editText) {
        Context context = editText.getContext();
        LinearLayout buttons = new LinearLayout(context);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.CENTER_VERTICAL);

        add(buttons, styled("B", new StyleSpan(Typeface.BOLD)), "revanced_markdown_bold",
                () -> MarkdownActions.wrap(editText, "**", "**"));
        add(buttons, styled("I", new StyleSpan(Typeface.ITALIC)), "revanced_markdown_italic",
                () -> MarkdownActions.wrap(editText, "*", "*"));
        add(buttons, styled("S", new StrikethroughSpan()), "revanced_markdown_strikethrough",
                () -> MarkdownActions.wrap(editText, "~~", "~~"));
        add(buttons, "x²", "revanced_markdown_superscript",
                () -> MarkdownActions.wrap(editText, "^(", ")"));
        add(buttons, ">!", "revanced_markdown_spoiler",
                () -> MarkdownActions.wrap(editText, ">!", "!<"));
        add(buttons, "</>", "revanced_markdown_code",
                () -> MarkdownActions.wrap(editText, "`", "`"));
        add(buttons, "🔗", "revanced_markdown_link", () -> MarkdownActions.link(editText));
        add(buttons, "H", "revanced_markdown_heading", () -> MarkdownActions.heading(editText));
        add(buttons, "•", "revanced_markdown_bullets", () -> MarkdownActions.prefixLines(editText, "* ", false));
        add(buttons, "1.", "revanced_markdown_numbers", () -> MarkdownActions.prefixLines(editText, "", true));
        add(buttons, "❝", "revanced_markdown_quote", () -> MarkdownActions.prefixLines(editText, "> ", false));
        add(buttons, "{ }", "revanced_markdown_code_block",
                () -> MarkdownActions.prefixLines(editText, "    ", false));
        add(buttons, "▦", "revanced_markdown_table", () -> MarkdownActions.block(editText,
                "| " + str("revanced_markdown_table_column") + " | " + str("revanced_markdown_table_column")
                        + " |\n|---|---|\n|  |  |"));
        add(buttons, "—", "revanced_markdown_rule", () -> MarkdownActions.block(editText, "---"));

        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.setFillViewport(true);
        scroll.addView(buttons);

        // The buttons scroll; the character counter stays at the end of the row.
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(scroll, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        CharacterCounter counter = new CharacterCounter(editText, secondaryTextColor(context),
                accentColor(context, editText.getCurrentTextColor()));
        row.addView(counter.view(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return row;
    }

    private static CharSequence styled(String label, Object span) {
        SpannableString text = new SpannableString(label);
        text.setSpan(span, 0, label.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return text;
    }

    private static void add(LinearLayout bar, CharSequence label, String description, Runnable action) {
        Context context = bar.getContext();
        TextView button = new TextView(context);
        button.setText(label);
        button.setContentDescription(str(description));
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        button.setTextColor(secondaryTextColor(context));
        button.setGravity(Gravity.CENTER);
        button.setMinWidth(dp(context, 44));
        button.setPadding(dp(context, 10), dp(context, 10), dp(context, 10), dp(context, 10));
        button.setBackground(themeDrawable(context, android.R.attr.selectableItemBackgroundBorderless));
        button.setOnClickListener(v -> {
            try {
                action.run();
            } catch (Exception ex) {
                ErrorDialog.printException(() -> "Could not apply the format", ex);
            }
        });
        bar.addView(button, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    // endregion

    // region Utilities

    private static int id(String name) {
        return ResourceUtils.getIdentifier(ResourceType.ID, name);
    }

    private static int secondaryTextColor(Context context) {
        int attribute = ResourceUtils.getIdentifier(ResourceType.ATTR, "secondaryTextColor");
        TypedValue value = new TypedValue();
        if (attribute != 0 && context.getTheme().resolveAttribute(attribute, value, true)) {
            return value.resourceId != 0 ? context.getColor(value.resourceId) : value.data;
        }
        return 0xFF888888;
    }

    private static int accentColor(Context context, int fallback) {
        TypedArray array = context.getTheme().obtainStyledAttributes(new int[]{android.R.attr.colorAccent});
        try {
            return array.getColor(0, fallback);
        } finally {
            array.recycle();
        }
    }

    private static android.graphics.drawable.Drawable themeDrawable(Context context, int attribute) {
        TypedValue value = new TypedValue();
        if (!context.getTheme().resolveAttribute(attribute, value, true) || value.resourceId == 0) return null;
        return context.getDrawable(value.resourceId);
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    // endregion
}
