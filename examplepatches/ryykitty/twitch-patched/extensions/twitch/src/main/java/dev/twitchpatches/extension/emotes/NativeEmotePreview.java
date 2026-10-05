package dev.twitchpatches.extension.emotes;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

final class NativeEmotePreview {
    private Dialog active;

    // Injected native preview bridges.
    private static Dialog createDialog(Context context) { return null; }
    private static int[] resourceIds() { return new int[0]; }

    void open(TextView source, Emote emote, Drawable drawable) {
        Context context = source.getContext();
        Activity activity = activity(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed() || drawable == null) return;
        close();
        int[] ids = resourceIds();
        if (ids.length != 6) return;
        Dialog dialog = createDialog(context);
        if (dialog == null) return;
        View root = LayoutInflater.from(dialog.getContext()).inflate(ids[0], null, false);
        ViewGroup content = root.findViewById(ids[1]);
        View originalImage = content.findViewById(ids[2]);
        TextView name = content.findViewById(ids[3]);
        TextView provider = content.findViewById(ids[4]);
        ViewGroup parent = (ViewGroup) content.getParent();
        for (int index = 0; index < parent.getChildCount(); index++) {
            View child = parent.getChildAt(index);
            child.setVisibility(child == content ? View.VISIBLE : View.GONE);
        }
        for (int index = 0; index < content.getChildCount(); index++) {
            View child = content.getChildAt(index);
            child.setVisibility(child == originalImage || child == name || child == provider ? View.VISIBLE : View.GONE);
        }
        ImageView image = new ImageView(dialog.getContext());
        image.setId(originalImage.getId());
        image.setLayoutParams(originalImage.getLayoutParams());
        image.setScaleType(ImageView.ScaleType.FIT_CENTER);
        image.setImageDrawable(drawable);
        image.setContentDescription(emote.code);
        int imageIndex = content.indexOfChild(originalImage);
        content.removeView(originalImage);
        content.addView(image, imageIndex);
        content.setPadding(content.getPaddingLeft(), content.getPaddingTop(), content.getPaddingRight(),
                source.getResources().getDimensionPixelSize(ids[5]));
        name.setText(emote.code);
        provider.setText(emote.url.startsWith("https://cdn.betterttv.net/") ? "BTTV emote" : "7TV emote");
        dialog.setContentView(root);
        dialog.setTitle(emote.code);
        dialog.setOnDismissListener(ignored -> {
            if (drawable instanceof Animatable) ((Animatable) drawable).stop();
            image.setImageDrawable(null);
            if (active == dialog) active = null;
        });
        active = dialog;
        dialog.show();
        if (drawable instanceof Animatable) ((Animatable) drawable).start();
        Log.i("TwitchPatchesEmotes", "native emote preview opened");
    }

    void close() {
        Dialog dialog = active;
        active = null;
        if (dialog != null) dialog.dismiss();
    }

    private static Activity activity(Context context) {
        for (int depth = 0; depth < 8; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) return null;
            context = base;
        }
        return null;
    }
}
