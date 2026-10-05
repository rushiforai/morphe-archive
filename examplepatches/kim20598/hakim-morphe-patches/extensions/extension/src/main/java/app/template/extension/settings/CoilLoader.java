package app.template.extension.settings;

import android.content.Context;
import android.widget.ImageView;

/**
 * Loads an image URL into an {@link ImageView} using Coil — the same library Letterboxd's own
 * {@code PosterView.setImageURL} uses. Reflection-wrapped so the patch still compiles if a
 * future Letterboxd update drops Coil; in that case the ImageView stays on its background colour.
 */
public final class CoilLoader {

    private CoilLoader() {}

    public static void load(Context ctx, String url, ImageView target) {
        if (url == null || url.isEmpty() || target == null) return;

        // Try Coil first (Letterboxd bundles it).
        if (tryCoil(ctx, url, target)) return;

        // Try Glide next (also bundled — used by PosterView's default path).
        tryGlide(ctx, url, target);
    }

    private static boolean tryCoil(Context ctx, String url, ImageView target) {
        try {
            Class<?> coilClass = Class.forName("coil.Coil");
            Object imageLoader = coilClass.getMethod("imageLoader", Context.class).invoke(null, ctx);
            Class<?> imageLoaderClass = Class.forName("coil.ImageLoader");
            Class<?> builderClass = Class.forName("coil.request.ImageRequest$Builder");
            Object builder = builderClass.getConstructor(Context.class).newInstance(ctx);
            builderClass.getMethod("data", Object.class).invoke(builder, url);
            builderClass.getMethod("target", ImageView.class).invoke(builder, target);
            Object request = builderClass.getMethod("build").invoke(builder);
            imageLoaderClass.getMethod("enqueue", Class.forName("coil.request.ImageRequest"))
                    .invoke(imageLoader, request);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void tryGlide(Context ctx, String url, ImageView target) {
        try {
            Class<?> glide = Class.forName("com.bumptech.glide.Glide");
            Object requestManager = glide.getMethod("with", Context.class).invoke(null, ctx);
            Class<?> requestManagerClass = Class.forName("com.bumptech.glide.RequestManager");
            Object requestBuilder = requestManagerClass.getMethod("load", String.class)
                    .invoke(requestManager, url);
            Class<?> requestBuilderClass = Class.forName("com.bumptech.glide.RequestBuilder");
            requestBuilderClass.getMethod("into", ImageView.class).invoke(requestBuilder, target);
        } catch (Throwable ignored) {
            // Neither library worked — leave the ImageView on its background.
        }
    }
}
