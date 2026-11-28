package app.xposed.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.SpannableStringBuilder;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;

/**
 * X-Posed's share sheet for a post: a preview of the post card, an editable caption, and the
 * post card handed to X's composer as a quote, a reply or a new post, or copied, saved or
 * shared to another app. Nothing is posted without the user.
 */
final class PostShareSheet {
    /** The intent extra that asks X's composer, through {@link #composerArgs}, for a quote. */
    private static final String EXTRA_QUOTED_POST = "app.xposed.extra.QUOTED_POST_ID";
    /** X's own extras of a share intent. */
    private static final String EXTRA_REPLIED_POST = "replied_tweet_id";
    private static final String EXTRA_ALT_TEXT = "android.intent.extra.STREAM_ALT_TEXT";
    private static final long DONE_MS = 3500;

    /** The mode chosen last, as X-Posed remembers it. Main thread. */
    private static PostCard.Mode lastMode = PostCard.Mode.QUOTE;

    private final Context context;
    private final Ui ui;
    private final Sheet sheet;
    private final Dialog dialog;
    private final PostCard card;
    private final CardImage.Subject subject;
    private final ComponentName composer;

    private Bitmap image;
    private boolean busy;
    private ImageView preview;
    private TextView status;
    private EditText caption;
    private LinearLayout modes;
    private TextView modeDescription, primary;
    private final Map<CardImage.Action, TextView> exports = new EnumMap<>(CardImage.Action.class);
    private final Runnable clearStatus = () -> setStatus(null, false);

    private PostShareSheet(Activity activity, PostCard card) {
        this.context = activity;
        this.card = card;
        ui = new Ui(activity);
        sheet = new Sheet(activity, ui, "Share evidence for @" + card.handle);
        dialog = sheet.dialog;
        subject = new CardImage.Subject("image", "Post card", "Share image", null);
        composer = composer(activity);
        // The caption field stays above the keyboard.
        dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        dialog.setOnDismissListener(d -> sheet.content.removeCallbacks(clearStatus));
    }

    /** Opens the sheet for post [postId] by [handle]. Main thread. */
    static void show(Activity activity, String handle, long postId) {
        Object post = Observed.canonicalPost(postId);
        if (post == null) {
            Toast.makeText(activity, "This post is no longer loaded. Open it, then share it from there.", Toast.LENGTH_LONG).show();
            return;
        }
        PostCard card;
        try {
            card = PostCard.of(post, handle, Lookup.peek(handle), System.currentTimeMillis());
        } catch (RuntimeException e) {
            Log.e(Hooks.TAG, "Couldn't read the post", e);
            Toast.makeText(activity, "Couldn't read this post.", Toast.LENGTH_LONG).show();
            return;
        }
        PostShareSheet s = new PostShareSheet(activity, card);
        s.build();
        s.dialog.show();
        s.loadImages();
    }

    private void build() {
        LinearLayout content = sheet.content;
        sheet.addGrabber();
        TextView title = ui.text("Share evidence", 20, true, ui.text);
        title.setAccessibilityHeading(true);
        content.addView(title, Ui.matchWidth());
        content.addView(ui.text("Account information for @" + card.handle, 14, false, ui.secondary), Ui.matchWidth());

        preview = new ImageView(context);
        preview.setAdjustViewBounds(true);
        preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        preview.setMaxHeight(ui.dp(context.getResources().getConfiguration().screenHeightDp) * 2 / 5);
        GradientDrawable frame = new GradientDrawable();
        frame.setCornerRadius(ui.dp(12));
        frame.setStroke(Math.max(1, ui.dp(1)), ui.divider);
        preview.setBackground(frame);
        int inset = Math.max(1, ui.dp(1));
        preview.setPadding(inset, inset, inset, inset);
        preview.setMinimumHeight(ui.dp(120));
        preview.setContentDescription("Evidence image for @" + card.handle + ". Enlarge preview");
        preview.setOnClickListener(v -> enlarge());
        preview.setEnabled(false);
        LinearLayout.LayoutParams previewLp = Ui.matchWidth();
        previewLp.topMargin = ui.dp(16);
        content.addView(preview, previewLp);

        TextView[] pills = new TextView[CardImage.Action.values().length];
        for (CardImage.Action action : CardImage.Action.values()) {
            TextView pill = ui.pill(exportLabel(action), false, v -> export(action));
            pill.setContentDescription(exportDescription(action));
            exports.put(action, pill);
            pills[action.ordinal()] = pill;
        }
        LinearLayout.LayoutParams exportLp = Ui.matchWidth();
        exportLp.topMargin = ui.dp(12);
        content.addView(sheet.buttonRow(pills), exportLp);

        status = ui.text("Creating the image\u2026", 13, false, ui.secondary);
        status.setPadding(0, ui.dp(8), 0, 0);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        content.addView(status, Ui.matchWidth());

        if (composer != null) {
            TextView heading = ui.text("Post on X", 17, true, ui.text);
            heading.setAccessibilityHeading(true);
            heading.setPadding(0, ui.dp(24), 0, ui.dp(4));
            content.addView(heading, Ui.matchWidth());
            content.addView(ui.text("Opens X's own post composer with this image attached and the text below. "
                    + "Nothing is posted until you tap Post there.", 13, false, ui.secondary), Ui.matchWidth());
            addCaption(content);
            addModes(content);
            primary = ui.pill("Open in X", true, v -> continueToX());
            primary.setContentDescription("Open X's post composer");
            LinearLayout.LayoutParams primaryLp = Ui.matchWidth();
            primaryLp.topMargin = ui.dp(20);
            content.addView(ui.wrapping(primary), primaryLp);
        }
        updateEnabled();
    }

    private void addCaption(LinearLayout content) {
        TextView label = ui.text("Post text", 15, true, ui.text);
        label.setPadding(0, ui.dp(20), 0, ui.dp(8));
        content.addView(label, Ui.matchWidth());

        caption = new EditText(context);
        caption.setText(PostCard.caption(card.location));
        caption.setTextColor(ui.text);
        caption.setHintTextColor(ui.secondary);
        caption.setTypeface(ui.regular);
        caption.setTextSize(16);
        caption.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        caption.setMinLines(3);
        caption.setGravity(Gravity.TOP | Gravity.START);
        caption.setFilters(new InputFilter[]{new InputFilter.LengthFilter(PostCard.CAPTION_LIMIT)});
        GradientDrawable box = new GradientDrawable();
        box.setCornerRadius(ui.dp(8));
        box.setStroke(Math.max(1, ui.dp(1)), ui.divider);
        caption.setBackground(box);
        int pad = ui.dp(12);
        caption.setPadding(pad, pad, pad, pad);
        label.setLabelFor(View.generateViewId());
        caption.setId(label.getLabelFor());
        content.addView(caption, Ui.matchWidth());

        LinearLayout meta = new LinearLayout(context);
        meta.setPadding(0, ui.dp(6), 0, 0);
        meta.addView(ui.text("You can still edit it in X", 13, false, ui.secondary),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView count = ui.text("", 13, false, ui.secondary);
        count.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_END);
        meta.addView(count);
        content.addView(meta, Ui.matchWidth());
        Runnable updateCount = () -> {
            int n = caption.length();
            count.setText(n + " / " + PostCard.CAPTION_LIMIT);
            count.setContentDescription(n + " of " + PostCard.CAPTION_LIMIT + " characters");
        };
        caption.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                updateCount.run();
            }
        });
        updateCount.run();
    }

    /** Quote, Reply and New post as a single choice, with what the chosen one does. */
    private void addModes(LinearLayout content) {
        TextView label = ui.text("Post as", 15, true, ui.text);
        label.setAccessibilityHeading(true);
        label.setPadding(0, ui.dp(20), 0, ui.dp(8));
        content.addView(label, Ui.matchWidth());
        modes = new LinearLayout(context);
        content.addView(modes, Ui.matchWidth());
        modeDescription = ui.text("", 13, false, ui.secondary);
        modeDescription.setPadding(0, ui.dp(8), 0, 0);
        modeDescription.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        content.addView(modeDescription, Ui.matchWidth());
        renderModes();
    }

    private void renderModes() {
        modes.removeAllViews();
        PostCard.Mode[] all = PostCard.Mode.values();
        TextView[] pills = new TextView[all.length];
        for (PostCard.Mode mode : all) {
            boolean selected = mode == lastMode;
            TextView pill = ui.pill(mode.label, selected, v -> {
                lastMode = mode;
                renderModes();
            });
            pill.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.setClassName(RadioButton.class.getName());
                    info.setCheckable(true);
                    info.setChecked(selected);
                }
            });
            pills[mode.ordinal()] = pill;
        }
        LinearLayout row = sheet.buttonRow(pills);
        modes.addView(row, Ui.matchWidth());
        modeDescription.setText(lastMode.description);
    }

    private CharSequence exportLabel(CardImage.Action action) {
        String label = action == CardImage.Action.COPY ? "Copy image" : action == CardImage.Action.SAVE ? "Save PNG" : "Share";
        TextView sizer = ui.text("", 15, true, ui.text);
        return new SpannableStringBuilder(Ui.inlineIcon(action.icon, ui.text, sizer.getTextSize() * 1.2f)).append("\u00A0\u00A0").append(label);
    }

    private static String exportDescription(CardImage.Action action) {
        switch (action) {
            case COPY:
                return "Copy the image";
            case SAVE:
                return "Save the image as a PNG";
            default:
                return "Share the image to another app";
        }
    }

    /** Loads the avatar and photos, then draws the card. */
    private void loadImages() {
        List<String> urls = new ArrayList<>();
        List<Integer> sizes = new ArrayList<>();
        if (card.avatarUrl != null && RemoteImages.cached(card.avatarUrl) == null) {
            urls.add(card.avatarUrl);
            sizes.add(48);
        }
        for (PostCard.Photo p : card.photos) {
            if (RemoteImages.cached(p.url) == null) {
                urls.add(p.url);
                sizes.add(card.photos.size() == 1 ? 360 : 180);
            }
        }
        if (urls.isEmpty()) {
            render();
            return;
        }
        int[] waiting = {urls.size()};
        float density = context.getResources().getDisplayMetrics().density;
        for (int i = 0; i < urls.size(); i++) {
            RemoteImages.load(urls.get(i), Math.round(sizes.get(i) * density), bitmap -> {
                if (--waiting[0] == 0 && dialog.isShowing()) render();
            });
        }
    }

    private void render() {
        try {
            image = CardImage.draw(context, PostCardView.build(ui, card, Hooks.version()), CardImage.MIN_POST_SCALE);
        } catch (RuntimeException | OutOfMemoryError e) {
            Log.e(Hooks.TAG, "Couldn't draw the post card", e);
            setStatus("Couldn't create the image.", true);
            return;
        }
        if (image == null) {
            setStatus("This post is too long to capture fully as an image.", true);
            return;
        }
        preview.setImageBitmap(image);
        preview.setEnabled(true);
        setStatus(null, false);
        updateEnabled();
    }

    private void export(CardImage.Action action) {
        if (busy || image == null) return;
        busy = true;
        updateEnabled();
        String text = caption != null ? caption.getText().toString().trim() : PostCard.caption(card.location);
        CardImage.Subject withText = action == CardImage.Action.SHARE
                ? new CardImage.Subject(subject.noun, subject.clipLabel, subject.shareTitle,
                (text.isEmpty() ? "" : text + " ") + PostCard.statusUrl(card.postId))
                : subject;
        CardImage.write(context, image, PostCard.fileName(card.handle, card.postId), action, withText, false, (message, failed) -> {
            busy = false;
            updateEnabled();
            setStatus(message, failed);
            if (!failed && message != null) sheet.content.postDelayed(clearStatus, DONE_MS);
        });
    }

    /** Writes the image where X can read it and opens X's composer with it. */
    private void continueToX() {
        if (busy || image == null || composer == null) return;
        busy = true;
        updateEnabled();
        setStatus("Opening X's composer\u2026", false);
        PostCard.Mode mode = lastMode;
        String text = PostCard.composerText(mode, caption.getText().toString(), card.handle);
        CardImage.shared(context, image, PostCard.fileName(card.handle, card.postId), (uri, message) -> {
            busy = false;
            updateEnabled();
            if (uri == null) {
                setStatus(message, true);
                return;
            }
            Intent intent = new Intent(Intent.ACTION_SEND)
                    .setComponent(composer)
                    .setType("image/png")
                    .putExtra(Intent.EXTRA_STREAM, uri)
                    .putExtra(Intent.EXTRA_TEXT, text)
                    .putExtra(EXTRA_ALT_TEXT, PostCard.altText(card))
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            intent.setClipData(ClipData.newRawUri(null, uri));
            if (mode == PostCard.Mode.REPLY) intent.putExtra(EXTRA_REPLIED_POST, card.postId);
            if (mode == PostCard.Mode.QUOTE) intent.putExtra(EXTRA_QUOTED_POST, card.postId);
            try {
                context.startActivity(intent);
                dialog.dismiss();
            } catch (ActivityNotFoundException | SecurityException e) {
                Log.w(Hooks.TAG, "Couldn't open X's composer", e);
                setStatus("Couldn't open X's composer. Save the image and add it in X instead.", true);
            }
        });
    }

    /** The image full screen; tapping anywhere or the close button returns to the sheet. */
    private void enlarge() {
        if (image == null) return;
        Dialog zoom = new Dialog(context, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
        zoom.setTitle("Enlarged evidence image");
        FrameLayout root = new FrameLayout(context);
        root.setBackgroundColor(0xF0000000);
        ImageView big = new ImageView(context);
        big.setImageBitmap(image);
        big.setScaleType(ImageView.ScaleType.FIT_CENTER);
        big.setContentDescription("Evidence image for @" + card.handle);
        int pad = ui.dp(16);
        big.setPadding(pad, pad, pad, pad);
        root.addView(big, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        ImageView close = new ImageView(context);
        close.setImageDrawable(Icons.CLOSE.asDrawable(Color.WHITE));
        int iconPad = ui.dp(12);
        close.setPadding(iconPad, iconPad, iconPad, iconPad);
        close.setContentDescription("Close enlarged preview");
        close.setOnClickListener(v -> zoom.dismiss());
        FrameLayout.LayoutParams closeLp = new FrameLayout.LayoutParams(ui.dp(48), ui.dp(48), Gravity.TOP | Gravity.END);
        closeLp.setMargins(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
        root.addView(close, closeLp);
        root.setOnClickListener(v -> zoom.dismiss());
        // Keep the close button clear of the status bar and cutouts.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            closeLp.topMargin = ui.dp(8) + insets.getSystemWindowInsetTop();
            close.setLayoutParams(closeLp);
            return insets;
        });
        zoom.setContentView(root);
        Window window = zoom.getWindow();
        if (window != null) window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        zoom.show();
    }

    private void updateEnabled() {
        boolean ready = image != null && !busy;
        for (TextView pill : exports.values()) {
            pill.setEnabled(ready);
            pill.setAlpha(ready ? 1f : 0.6f);
        }
        if (primary != null) {
            primary.setEnabled(ready);
            primary.setAlpha(ready ? 1f : 0.6f);
        }
    }

    private void setStatus(String message, boolean failed) {
        sheet.content.removeCallbacks(clearStatus);
        status.setText(message);
        status.setTextColor(failed ? ui.alert : ui.secondary);
        status.setVisibility(message != null ? View.VISIBLE : View.GONE);
    }

    /** X's composer activity for shared images, found by its well-known name; null when X has none. */
    private static ComponentName composer(Context context) {
        Intent probe = new Intent(Intent.ACTION_SEND).setType("image/png").setPackage(context.getPackageName());
        for (ResolveInfo r : context.getPackageManager().queryIntentActivities(probe, 0)) {
            if (r.activityInfo != null && r.activityInfo.name.endsWith(".ComposerActivity")) {
                return new ComponentName(r.activityInfo.packageName, r.activityInfo.name);
            }
        }
        return null;
    }

    /**
     * X's composer arguments for a share intent from {@link #continueToX} in Quote mode, or null
     * for X to read the intent itself. X's share handling has no quote, so the patch asks here.
     */
    static List<?> composerArgs(Intent intent, Object action) {
        if (intent == null || !Intent.ACTION_SEND.equals(action)) return null;
        long postId = intent.getLongExtra(EXTRA_QUOTED_POST, 0);
        if (postId <= 0) return null;
        Uri uri = intent.getParcelableExtra(Intent.EXTRA_STREAM);
        CharSequence text = intent.getCharSequenceExtra(Intent.EXTRA_TEXT);
        return Collections.singletonList(ModelBridge.quoteArgs(postId, text != null ? text.toString() : null,
                uri != null ? uri.toString() : null));
    }
}
