package app.template.extension.artwork;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;

import java.lang.reflect.Proxy;

/** Shares Letterboxd's Glide cache and target cancellation with the picker. */
public final class ArtworkImages {
    private ArtworkImages() {}

    public interface Result {
        void loaded(boolean success);
    }

    public static void load(ImageView view, String url, Result result) {
        view.setImageDrawable(null);
        try {
            Object manager = manager(view);
            Object request = manager.getClass().getMethod("load", String.class).invoke(manager, url);
            feedback(request, result);
            request.getClass().getMethod("into", ImageView.class).invoke(request, view);
        } catch (ReflectiveOperationException e) {
            view.setImageResource(android.R.drawable.stat_notify_error);
            if (result != null) result.loaded(false);
        }
    }

    static void feedback(Object request, Result result) throws ReflectiveOperationException {
        Class<?> listener = Class.forName("com.bumptech.glide.request.RequestListener");
        Object callback = Proxy.newProxyInstance(listener.getClassLoader(), new Class<?>[]{listener},
                (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "onLoadFailed":
                            if (result != null) result.loaded(false);
                            return false;
                        case "onResourceReady":
                            if (result != null) result.loaded(true);
                            return false;
                        case "equals":
                            return proxy == args[0];
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        default:
                            return "Artwork image listener";
                    }
                });
        request.getClass().getMethod("listener", listener).invoke(request, callback);
        request.getClass().getMethod("error", int.class)
                .invoke(request, android.R.drawable.stat_notify_error);
    }

    public static void clear(ImageView view) {
        try {
            Object manager = manager(view);
            manager.getClass().getMethod("clear", View.class).invoke(manager, view);
        } catch (ReflectiveOperationException ignored) {
        }
        view.setImageDrawable((Drawable) null);
    }

    private static Object manager(ImageView view) throws ReflectiveOperationException {
        return Class.forName("com.bumptech.glide.Glide").getMethod("with", Context.class)
                .invoke(null, view.getContext());
    }
}
