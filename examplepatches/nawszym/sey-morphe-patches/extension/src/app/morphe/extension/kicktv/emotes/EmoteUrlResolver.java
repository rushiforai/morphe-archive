package app.morphe.extension.kicktv.emotes;

import android.content.Context;

import app.morphe.extension.kicktv.base.MorpheContext;

/**
 * Replacement for the stock emote URL lookup in j40.i.
 *
 * <p>KICK builds every emote image URL by formatting the
 * {@code chat_emotes_url} resource with the emote id and a width. That hook
 * receives the id string from the patched inline-content object. When the id
 * belongs to a third-party emote the provider CDN URL is returned instead;
 * every real KICK emote falls back to the stock resource formatting.</p>
 */
public final class EmoteUrlResolver {

    private EmoteUrlResolver() {
    }

    public static String resolve(Context context, int resId, Object[] args) {
        if (args != null && args.length > 0 && args[0] != null) {
            try {
                int id = Integer.parseInt(String.valueOf(args[0]));
                String url = EmoteStore.urlFor(id);
                if (url != null && !url.isEmpty()) {
                    return url;
                }
            } catch (Throwable ignored) {
                // Not a numeric emote id: use the stock URL.
            }
        }

        Context target = context;
        if (target == null) {
            target = MorpheContext.getAppContext();
        }
        if (target == null || args == null) {
            return "";
        }

        try {
            return target.getString(resId, args);
        } catch (Throwable t) {
            return "";
        }
    }
}
