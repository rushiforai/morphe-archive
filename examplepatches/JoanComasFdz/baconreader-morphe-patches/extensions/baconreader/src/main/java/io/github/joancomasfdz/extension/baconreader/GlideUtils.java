// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;

import java.io.File;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Future;

import app.morphe.extension.shared.Logger;

/**
 * Glide is bundled in BaconReader and not obfuscated. It is called through reflection.
 */
public final class GlideUtils {
    public interface LoadCallback {
        void onReady();

        void onFailed();
    }

    /** Attempts to load an image before it is reported as failed. */
    public static final int MAX_ATTEMPTS = 3;
    /** Delay before the second attempt; it grows with each attempt. */
    public static final long RETRY_DELAY_MS = 1000;

    /** Called when a request is done; retrying only helps when the failure was not a permanent one. */
    private interface RequestCallback {
        void onReady();

        void onFailed(boolean retry);
    }

    /** The last request of each view, so a retry does not replace what the view shows now. */
    private static final Map<ImageView, Object> LATEST = new WeakHashMap<>();

    private GlideUtils() {
    }

    /**
     * The request manager of the view's activity. Glide.with(View) would use the fragment showing the view
     * when it is attached, and the requests of a fragment Glide considers stopped never run.
     */
    public static Object with(View view) throws Exception {
        return Class.forName("com.bumptech.glide.Glide")
                .getMethod("with", Context.class)
                .invoke(null, view.getContext());
    }

    /**
     * Loads an image into the view.
     *
     * @param thumbnailUrl An image shown until the image is loaded, or null.
     * @param callback     Called when the image is ready or failed to load, or null.
     */
    public static void load(ImageView imageView, String url, String thumbnailUrl,
                            final LoadCallback callback) throws Exception {
        load(imageView, String.class, url, thumbnailUrl, callback);
    }

    /**
     * Loads a downloaded image into the view.
     *
     * @param thumbnailUrl An image shown until the image is loaded, or null.
     * @param callback     Called when the image is ready or failed to load, or null.
     */
    public static void load(ImageView imageView, File file, String thumbnailUrl,
                            final LoadCallback callback) throws Exception {
        load(imageView, File.class, file, thumbnailUrl, callback);
    }

    private static void load(ImageView imageView, Class<?> modelType, Object model, String thumbnailUrl,
                             LoadCallback callback) throws Exception {
        load(imageView, modelType, model, thumbnailUrl, callback, new Object(), 1);
    }

    private static void load(final ImageView imageView, final Class<?> modelType, final Object model,
                             final String thumbnailUrl, final LoadCallback callback, final Object request,
                             final int attempt) throws Exception {
        LATEST.put(imageView, request);
        Object requestManager = with(imageView);
        Object requestBuilder = requestManager.getClass().getMethod("load", modelType).invoke(requestManager, model);
        if (thumbnailUrl != null) {
            Method load = requestManager.getClass().getMethod("load", String.class);
            Class<?> requestBuilderClass = Class.forName("com.bumptech.glide.RequestBuilder");
            Object thumbnail = load.invoke(requestManager, thumbnailUrl);
            requestBuilder = requestBuilder.getClass().getMethod("thumbnail", requestBuilderClass)
                    .invoke(requestBuilder, thumbnail);
        }
        requestBuilder = withListener(requestBuilder, new RequestCallback() {
            @Override
            public void onReady() {
                if (callback != null) callback.onReady();
            }

            @Override
            public void onFailed(boolean retry) {
                // Try again, unless the view shows something else now.
                if (retry && attempt < MAX_ATTEMPTS && LATEST.get(imageView) == request) {
                    imageView.postDelayed(() -> {
                        if (LATEST.get(imageView) != request) return;
                        try {
                            load(imageView, modelType, model, thumbnailUrl, callback, request, attempt + 1);
                        } catch (Exception ex) {
                            Logger.printInfo(() -> "Could not load the image again", ex);
                            if (callback != null) callback.onFailed();
                        }
                    }, RETRY_DELAY_MS * attempt);
                    return;
                }
                if (callback != null) callback.onFailed();
            }
        });
        requestBuilder.getClass().getMethod("into", ImageView.class).invoke(requestBuilder, imageView);
    }

    /**
     * Loads a request the app built into the view, trying again when it fails.
     */
    public static void intoWithRetry(Object requestBuilder, ImageView imageView) {
        intoWithRetry(requestBuilder, imageView, null);
    }

    /**
     * Loads a request the app built into the view, trying again when it fails.
     *
     * @param onFailed Run when the last attempt fails, or null.
     */
    public static void intoWithRetry(Object requestBuilder, ImageView imageView, Runnable onFailed) {
        intoWithRetry(requestBuilder, imageView, new Object(), 1, onFailed);
    }

    private static void intoWithRetry(final Object requestBuilder, final ImageView imageView, final Object request,
                                      final int attempt, final Runnable onFailed) {
        try {
            LATEST.put(imageView, request);
            Object withRetry = withListener(requestBuilder, new RequestCallback() {
                @Override
                public void onReady() {
                }

                @Override
                public void onFailed(boolean retry) {
                    if (LATEST.get(imageView) != request) return;
                    if (!retry || attempt >= MAX_ATTEMPTS) {
                        if (onFailed != null) onFailed.run();
                        return;
                    }
                    imageView.postDelayed(() -> {
                        if (LATEST.get(imageView) == request) {
                            intoWithRetry(requestBuilder, imageView, request, attempt + 1, onFailed);
                        }
                    }, RETRY_DELAY_MS * attempt);
                }
            });
            withRetry.getClass().getMethod("into", ImageView.class).invoke(withRetry, imageView);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not load the image", ex);
        }
    }

    /**
     * Adds a listener (com.bumptech.glide.request.RequestListener, implemented at runtime) to a request.
     */
    private static Object withListener(Object requestBuilder, final RequestCallback callback) throws Exception {
        Class<?> listenerClass = Class.forName("com.bumptech.glide.request.RequestListener");
        Object listener = Proxy.newProxyInstance(listenerClass.getClassLoader(), new Class<?>[]{listenerClass},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) {
                        switch (method.getName()) {
                            case "onResourceReady":
                                callback.onReady();
                                return false; // Let Glide set the image.
                            case "onLoadFailed":
                                Logger.printInfo(() -> "Could not load " + args[1] + ": " + args[0]);
                                callback.onFailed(isRetryable(args[0]));
                                return false;
                            case "equals":
                                return proxy == args[0];
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "toString":
                                return "GlideUtilsListener";
                            default:
                                return null;
                        }
                    }
                });
        return requestBuilder.getClass().getMethod("listener", listenerClass).invoke(requestBuilder, listener);
    }

    /**
     * Loads an image at the given size, trying again when it fails. Blocks: call it on a background thread.
     */
    public static Drawable fetch(View view, String url, int width, int height) throws Exception {
        for (int attempt = 1; ; attempt++) {
            try {
                Object requestManager = with(view);
                Object requestBuilder = requestManager.getClass().getMethod("load", String.class)
                        .invoke(requestManager, url);
                Object future = requestBuilder.getClass().getMethod("submit", int.class, int.class)
                        .invoke(requestBuilder, width, height);
                return (Drawable) ((Future<?>) future).get();
            } catch (Exception ex) {
                if (attempt >= MAX_ATTEMPTS || !isRetryable(ex.getCause())) throw ex;
                final int failed = attempt;
                Logger.printInfo(() -> "Could not load " + url + " (attempt " + failed + "), trying again");
                Thread.sleep(RETRY_DELAY_MS * attempt);
            }
        }
    }

    /**
     * If loading again could help: not when the server answered that the image is not there or not allowed
     * (a missing or expired image), only for network trouble and server errors.
     *
     * @param error The com.bumptech.glide.load.engine.GlideException of the failed load, or null.
     */
    static boolean isRetryable(Object error) {
        if (error == null) return true;
        try {
            if (!error.getClass().getName().equals("com.bumptech.glide.load.engine.GlideException")) return true;
            java.util.List<?> causes = (java.util.List<?>) error.getClass().getMethod("getRootCauses").invoke(error);
            if (causes == null || causes.isEmpty()) return true;
            for (Object cause : causes) {
                if (!cause.getClass().getName().equals("com.bumptech.glide.load.HttpException")) return true;
                int code = (Integer) cause.getClass().getMethod("getStatusCode").invoke(cause);
                if (code < 400 || code >= 500 || code == 408 || code == 429) return true;
            }
            return false;
        } catch (Exception ex) {
            return true;
        }
    }

    public static void clear(View view) {
        LATEST.remove(view);
        try {
            Object requestManager = with(view);
            requestManager.getClass().getMethod("clear", View.class).invoke(requestManager, view);
        } catch (Exception ignored) {
        }
    }
}
