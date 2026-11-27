package dev.jason.gboardpatches.extension.customstickers;

import android.content.Context;
import android.net.Uri;
import android.util.Log;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

/** Adds the user's packs in front of the packs Gboard parsed from its sticker service. */
public final class GboardCustomStickersRuntime {
    private static final String TAG = "GboardPatches";
    static final String PACK_ID_PREFIX = "gboard_patches_custom_stickers_";

    private GboardCustomStickersRuntime() { }

    /**
     * Whether the pack is in Gboard's "added" sticker packs, the only ones its Stickers header
     * shows. Null when Gboard's sticker store cannot be reached.
     */
    public static Boolean isShownInKeyboard(Context context, String packId) {
        try {
            return favorites(context).contains(PACK_ID_PREFIX + packId);
        } catch (Throwable failure) {
            Log.w(TAG, "Failed to read Gboard sticker favorites", failure);
            return null;
        }
    }

    /** Adds the pack to the front of Gboard's added packs, or removes it. */
    public static boolean setShownInKeyboard(Context context, String packId, boolean shown) {
        try {
            Favorites favorites = favorites(context);
            // The store notifies its listeners even when nothing changes, so skip no-ops.
            if (favorites.contains(PACK_ID_PREFIX + packId) != shown) {
                favorites.update.invoke(favorites.store, PACK_ID_PREFIX + packId, shown, true);
            }
            return true;
        } catch (Throwable failure) {
            Log.w(TAG, "Failed to update Gboard sticker favorites", failure);
            return false;
        }
    }

    private static final class Favorites {
        final Object store;
        final Method list;
        final Method update;

        Favorites(Object store) throws NoSuchMethodException {
            this.store = store;
            list = store.getClass().getMethod("b");
            update = store.getClass().getMethod("c", String.class, boolean.class, boolean.class);
        }

        boolean contains(String id) throws ReflectiveOperationException {
            return ((List<?>) list.invoke(store)).contains(id);
        }
    }

    private static volatile Favorites cachedFavorites;

    /**
     * shortcut: obfuscated Gboard 18.5.4 path gzx.b(ctx).get().d.h = the in-memory favorites
     * store (ikn over exp_sticker_prefs "favorites"); move to version bindings when porting.
     * Settings and the keyboard share this process, and the store hangs off the gzx singleton,
     * so one lookup is reused for the life of the process.
     */
    private static Favorites favorites(Context context) throws ReflectiveOperationException {
        Favorites favorites = cachedFavorites;
        if (favorites != null) return favorites;
        ClassLoader loader = GboardCustomStickersRuntime.class.getClassLoader();
        Class<?> supplierType = Class.forName("gzx", false, loader);
        Object supplier = supplierType.getMethod("b", Context.class)
                .invoke(null, context.getApplicationContext());
        Object client = supplierType.getMethod("get").invoke(supplier);
        Object stickerClient = client.getClass().getField("d").get(client);
        favorites = new Favorites(stickerClient.getClass().getField("h").get(stickerClient));
        cachedFavorites = favorites;
        return favorites;
    }

    /** Patched in before the sticker pack parser returns its ImmutableList of packs. */
    public static Object appendCustomPacks(Object stockPacks) {
        try {
            if (!(stockPacks instanceof List)) return stockPacks;
            Context context = GboardFlagRuntimeContext.resolveContext();
            // Files live in credential-encrypted storage, unreadable before the first unlock.
            if (context == null || !GboardFlagRuntimeContext.isUserUnlocked(context)) {
                return stockPacks;
            }
            List<GboardCustomStickersStore.Pack> packs = GboardCustomStickersStore.load(context);
            if (packs.isEmpty()) return stockPacks;
            return merge(context, (List<?>) stockPacks, packs);
        } catch (Throwable failure) {
            Log.w(TAG, "Failed to add custom sticker packs", failure);
            return stockPacks;
        }
    }

    private static Object merge(Context context, List<?> stockPacks,
            List<GboardCustomStickersStore.Pack> packs) throws ReflectiveOperationException {
        StickerTypes types = StickerTypes.resolve(stockPacks.getClass().getClassLoader());
        Object noKeywords = types.copyOf(Collections.emptyList());
        List<Object> merged = new ArrayList<>();
        for (GboardCustomStickersStore.Pack pack : packs) {
            List<Object> stickers = new ArrayList<>();
            Uri cover = null;
            for (String fileName : pack.stickers) {
                File file = GboardCustomStickersStore.stickerFile(context, pack.id, fileName);
                if (!file.isFile()) continue;
                Uri uri = Uri.fromFile(file);
                if (cover == null || fileName.equals(pack.cover)) cover = uri;
                stickers.add(types.newSticker(pack.id + "/" + fileName, uri, pack.name, noKeywords));
            }
            // Gboard rejects packs without stickers, so empty packs stay hidden.
            if (cover == null) continue;
            merged.add(types.newPack(PACK_ID_PREFIX + pack.id, cover, pack.name,
                    types.copyOf(stickers)));
        }
        if (merged.isEmpty()) return stockPacks;
        merged.addAll(stockPacks);
        return types.copyOf(merged);
    }

    /**
     * shortcut: obfuscated Gboard 18.5.4 names (wns ImmutableList, han StickerPack, hai Sticker,
     * qkg network feature, ham tab, xfr content type); move to version bindings when porting.
     */
    private static final class StickerTypes {
        private static volatile StickerTypes cached;

        private final ClassLoader loader;
        private final Method copyOf;
        private final Constructor<?> stickerConstructor;
        private final Constructor<?> packConstructor;
        private final Object localFeature;
        private final Object stickerTab;
        private final Object stickerContentType;

        private StickerTypes(ClassLoader loader) throws ReflectiveOperationException {
            this.loader = loader;
            Class<?> listType = Class.forName("wns", false, loader);
            Class<?> featureType = Class.forName("qkg", false, loader);
            Class<?> tabType = Class.forName("ham", false, loader);
            Class<?> contentType = Class.forName("xfr", false, loader);
            copyOf = listType.getDeclaredMethod("o", Collection.class);
            stickerConstructor = Class.forName("hai", false, loader).getDeclaredConstructor(
                    String.class, Uri.class, String.class, featureType, String.class,
                    contentType, listType);
            packConstructor = Class.forName("han", false, loader).getDeclaredConstructor(
                    String.class, Uri.class, String.class, featureType, tabType, String.class,
                    listType, String.class);
            // "Local" network feature: these images never go through the sticker image fetcher.
            localFeature = featureType.getDeclaredField("d").get(null);
            stickerTab = enumConstant(tabType, "STICKER");
            stickerContentType = enumConstant(contentType, "EXPRESSION_STICKER");
        }

        static StickerTypes resolve(ClassLoader loader) throws ReflectiveOperationException {
            StickerTypes types = cached;
            if (types == null || types.loader != loader) {
                types = new StickerTypes(loader);
                cached = types;
            }
            return types;
        }

        Object copyOf(Collection<?> items) throws ReflectiveOperationException {
            return copyOf.invoke(null, items);
        }

        Object newSticker(String id, Uri uri, String description, Object keywords)
                throws ReflectiveOperationException {
            return stickerConstructor.newInstance(id, uri, description, localFeature, "sticker",
                    stickerContentType, keywords);
        }

        Object newPack(String id, Uri cover, String name, Object stickers)
                throws ReflectiveOperationException {
            return packConstructor.newInstance(id, cover, name, localFeature, stickerTab, "",
                    stickers, name);
        }

        @SuppressWarnings({"unchecked", "rawtypes"})
        private static Object enumConstant(Class<?> type, String name) {
            return Enum.valueOf((Class) type, name);
        }
    }
}
