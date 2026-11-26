package nl.johninnl.soundcloud;

import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/**
 * Serves SoundCloud's phone Home sections to the car media browser's Home tab.
 *
 * The car catalog's Home tab reads the legacy /discovery/cards feed, while the phone Home
 * uses GraphQL HOME_SDUI_QUERY. This loads the phone Home through the app's own SDUIService and
 * account session. Any failure returns null, so the original Home code runs unchanged.
 */
public final class HomeSections {
    private static final String TAG = "MorpheSoundCloudHome";
    private static final String GROUP_TITLE = "android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT";
    /** MediaCollection.DISCOVERY; the patch verifies this collection name in the app. */
    private static final String DISCOVERY_COLLECTION = "discover";
    private static final long TIMEOUT_SECONDS = 20;
    private static final long CACHE_MILLIS = 5 * 60 * 1000;

    private static volatile Object serviceProvider;
    private static Object service;
    private static List<Object> cached;
    private static long cachedAt;

    private HomeSections() {}

    /** Called by the patched Dagger factory constructor; holds the SDUIService provider. */
    public static void setServiceProvider(Object provider) {
        if (provider != null && provider != serviceProvider) {
            synchronized (HomeSections.class) {
                serviceProvider = provider;
                service = null;
                cached = null;
            }
        }
    }

    /** Called for the car Home root. Returns SoundCloud media items, or null to keep the original. */
    public static List<Object> load(Object mediaItemBuilder) {
        if (mediaItemBuilder == null || Looper.myLooper() == Looper.getMainLooper()) return null;
        try {
            synchronized (HomeSections.class) {
                if (cached != null && System.currentTimeMillis() - cachedAt < CACHE_MILLIS) return cached;
            }
            Object result = fetch();
            if (result == null) return null;
            List<Object> items = SduiHomeMapper.map(result, new AppItems(mediaItemBuilder));
            if (items.isEmpty()) return null;
            synchronized (HomeSections.class) {
                cached = items;
                cachedAt = System.currentTimeMillis();
            }
            return items;
        } catch (Throwable failure) {
            Log.w(TAG, "Home sections unavailable; keeping SoundCloud's car Home", failure);
            return null;
        }
    }

    private static Object fetch() throws Exception {
        Object sections = sectionsService();
        if (sections == null) return null;
        Waiter waiter = new Waiter();
        Object value = queryHome(sections, new Frame(waiter));
        if (isSuspended(value)) {
            if (!waiter.latch.await(TIMEOUT_SECONDS, TimeUnit.SECONDS)) return null;
            value = waiter.value;
        }
        if (value == null || value.getClass().getName().equals("kotlin.Result$Failure")) return null;
        return sectionsResult(value);
    }

    private static synchronized Object sectionsService() throws Exception {
        if (service != null) return service;
        Object provider = serviceProvider;
        if (provider == null) return null;
        service = provider.getClass().getMethod("get").invoke(provider);
        return service;
    }

    /** GraphQlResult.Success holds the response in its erased generic payload field. */
    static Object sectionsResult(Object response) throws IllegalAccessException {
        if (response.getClass().getName().endsWith(".ApiSDUIResponse")) return response;
        if (!response.getClass().getName().endsWith("GraphQlResult$Success")) return null;
        for (Class<?> type = response.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                field.setAccessible(true);
                Object value = field.get(response);
                if (value != null && value.getClass().getName().endsWith(".ApiSDUIResponse")) return value;
            }
        }
        return null;
    }

    static boolean isSuspended(Object value) {
        return value instanceof Enum && "COROUTINE_SUSPENDED".equals(((Enum<?>) value).name());
    }

    // Bridges. The patch replaces each body with a call to the app's own method.

    /** SDUIService's phone Home GraphQL request. */
    static Object queryHome(Object sectionsService, Continuation<Object> continuation) {
        return null;
    }

    /** MediaItemBuilder's playable item: (mediaId, title, subtitle, artwork template). */
    static Object playable(Object builder, String mediaId, String title, String subtitle, String artwork) {
        return null;
    }

    /** MediaItemBuilder's browsable item: (mediaId, title, subtitle, artwork template, grid). */
    static Object browsable(Object builder, String mediaId, String title, String subtitle, String artwork, boolean grid) {
        return null;
    }

    private static final class AppItems implements HomeMapper.Items {
        private final Object builder;

        AppItems(Object builder) {
            this.builder = builder;
        }

        @Override public Object playable(String mediaId, String title, String subtitle, String artwork) {
            return cover(HomeSections.playable(builder, mediaId, title, subtitle, artwork));
        }

        @Override public Object browsable(String mediaId, String title, String subtitle, String artwork) {
            return cover(HomeSections.browsable(builder, mediaId, title, subtitle, artwork, false));
        }

        /** Same format as SoundCloud's MediaIdKt.formatToString for the DISCOVERY collection. */
        @Override public String mediaId(String urnContent) {
            return new Uri.Builder().scheme("mediaId").path(urnContent)
                .appendQueryParameter("collection", DISCOVERY_COLLECTION).build().toString();
        }

        @Override public void group(Object item, String title) {
            Bundle extras = extras(item);
            if (extras != null) extras.putString(GROUP_TITLE, title);
        }
    }

    /** One ungrouped cover grid for music Home; collection children retain the app's track lists. */
    private static Object cover(Object item) {
        Bundle extras = extras(item);
        if (extras != null) {
            extras.remove(GROUP_TITLE);
            extras.putInt("android.media.browse.CONTENT_STYLE_SINGLE_ITEM_HINT", 2);
            extras.putInt("android.media.browse.CONTENT_STYLE_PLAYABLE_HINT", 1);
        }
        return item;
    }

    /** MediaItem -> MediaDescriptionCompat -> extras, located by type rather than renamed names. */
    static Bundle extras(Object item) {
        Object description = fieldOfType(item, "android.support.v4.media.MediaDescriptionCompat");
        Object extras = fieldOfType(description, Bundle.class.getName());
        return extras instanceof Bundle ? (Bundle) extras : null;
    }

    private static Object fieldOfType(Object owner, String typeName) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !field.getType().getName().equals(typeName)) continue;
                try {
                    field.setAccessible(true);
                    return field.get(owner);
                } catch (IllegalAccessException | RuntimeException unavailable) {
                    return null;
                }
            }
        }
        return null;
    }

    /** Receives the suspend result on SoundCloud's IO dispatcher. */
    private static final class Waiter implements Continuation<Object> {
        final CountDownLatch latch = new CountDownLatch(1);
        volatile Object value;

        @Override public CoroutineContext getContext() {
            return EmptyCoroutineContext.INSTANCE;
        }

        @Override public void resumeWith(Object result) {
            value = result;
            latch.countDown();
        }
    }

    /** SectionsService requires a ContinuationImpl caller frame; this one forwards the result. */
    private static final class Frame extends ContinuationImpl {
        Frame(Continuation<Object> completion) {
            super(completion);
        }

        @Override protected Object invokeSuspend(Object result) {
            return result;
        }
    }
}
