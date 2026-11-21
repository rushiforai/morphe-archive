package app.morphe.extension.boost;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.RelativeLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;

/**
 * Share shortcuts on posts and comments: holding a post's share button copies its link, and an
 * optional share button on comments shares the comment's link on tap and copies it on hold.
 */
final class ShareShortcuts {
    private static final int HOLDER_TAG = 0x7f5d0002;
    private ShareShortcuts() { }

    /** A post's share button: tap keeps Boost's share menu, hold copies the post's link. */
    static void post(Object holder) {
        View row = view(holder);
        if (row == null) return;
        int id = row.getResources().getIdentifier("submission_header_share", "id", row.getContext().getPackageName());
        View share = id == 0 ? null : row.findViewById(id);
        if (share == null) return;
        share.setTag(HOLDER_TAG, new WeakReference<>(holder));
        share.setOnLongClickListener(button -> copy(button, postLink(holderOf(button))));
    }

    /** Comments: a share button next to reply, if it's turned on in Shikify Settings. */
    static void comment(Object holder) {
        View row = view(holder);
        if (row == null) return;
        Context context = row.getContext();
        int replyId = context.getResources().getIdentifier("item_comment_reply", "id", context.getPackageName());
        View reply = replyId == 0 ? null : row.findViewById(replyId);
        if (!(reply instanceof ImageButton) || !(reply.getParent() instanceof RelativeLayout)) return;
        RelativeLayout bar = (RelativeLayout) reply.getParent();
        ImageButton share = (ImageButton) bar.findViewWithTag("shikify_comment_share");
        boolean wanted = SurfaceSettingsActivity.enabled(context, "comment_share", true);
        if (share == null) {
            if (!wanted) return;
            share = create((ImageButton) reply, bar);
            if (share == null) return;
        }
        share.setVisibility(wanted ? View.VISIBLE : View.GONE);
        share.setTag(HOLDER_TAG, new WeakReference<>(holder));
    }

    /** Matches the reply button, then slots in between reply and whatever reply was anchored to. */
    private static ImageButton create(ImageButton reply, RelativeLayout bar) {
        Context context = reply.getContext();
        int icon = context.getResources().getIdentifier("ic_share_18dp", "drawable", context.getPackageName());
        if (icon == 0 || !(reply.getLayoutParams() instanceof RelativeLayout.LayoutParams)) return null;
        RelativeLayout.LayoutParams replyParams = (RelativeLayout.LayoutParams) reply.getLayoutParams();
        ImageButton share = new ImageButton(context);
        share.setTag("shikify_comment_share");
        share.setId(View.generateViewId());
        share.setImageResource(icon);
        share.setImageTintList(reply.getImageTintList());
        share.setScaleType(reply.getScaleType());
        if (reply.getBackground() != null && reply.getBackground().getConstantState() != null) share.setBackground(reply.getBackground().getConstantState().newDrawable().mutate());
        else share.setBackground(null);
        share.setPadding(reply.getPaddingLeft(), reply.getPaddingTop(), reply.getPaddingRight(), reply.getPaddingBottom());
        share.setContentDescription("Share");
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(replyParams.width, replyParams.height);
        int[] rules = replyParams.getRules();
        for (int verb : new int[]{RelativeLayout.LEFT_OF, RelativeLayout.START_OF, RelativeLayout.CENTER_VERTICAL, RelativeLayout.ALIGN_PARENT_BOTTOM, RelativeLayout.ALIGN_PARENT_TOP})
            if (rules[verb] != 0) params.addRule(verb, rules[verb]);
        bar.addView(share, params);
        replyParams.addRule(RelativeLayout.LEFT_OF, share.getId());
        replyParams.addRule(RelativeLayout.START_OF, share.getId());
        reply.setLayoutParams(replyParams);
        share.setOnClickListener(button -> send(button, commentLink(holderOf(button))));
        share.setOnLongClickListener(button -> copy(button, commentLink(holderOf(button))));
        return share;
    }

    private static Object holderOf(View view) {
        Object tag = view.getTag(HOLDER_TAG);
        return tag instanceof WeakReference ? ((WeakReference<?>) tag).get() : null;
    }

    private static View view(Object holder) {
        Object value = holder == null ? null : CommentsChromeTweaks.field(holder, "a");
        return value instanceof View ? (View) value : null;
    }

    /** The same links Boost's Share permalink option uses. */
    static String postLink(Object holder) {
        try {
            Object post = holder == null ? null : CommentsChromeTweaks.field(holder, "h0");
            return post == null ? null : (String) post.getClass().getMethod("p").invoke(post);
        } catch (ReflectiveOperationException | RuntimeException error) { return null; }
    }

    static String commentLink(Object holder) {
        try {
            Object comment = holder == null ? null : CommentsChromeTweaks.field(holder, "b0");
            return comment == null ? null : (String) comment.getClass().getMethod("s").invoke(comment);
        } catch (ReflectiveOperationException | RuntimeException error) { return null; }
    }

    static boolean copy(View view, String link) {
        if (link == null || link.isEmpty()) return false;
        Context context = view.getContext();
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return false;
        clipboard.setPrimaryClip(ClipData.newPlainText("Link", link));
        view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        // Android 13 and later show their own clipboard confirmation.
        if (Build.VERSION.SDK_INT < 33) Toast.makeText(context, "Link copied", Toast.LENGTH_SHORT).show();
        return true;
    }

    private static void send(View view, String link) {
        if (link == null || link.isEmpty()) return;
        Intent intent = new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, link);
        try { view.getContext().startActivity(Intent.createChooser(intent, null)); } catch (RuntimeException ignored) { }
    }
}
