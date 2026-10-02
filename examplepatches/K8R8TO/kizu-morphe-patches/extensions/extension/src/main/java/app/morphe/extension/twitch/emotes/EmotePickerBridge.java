package app.morphe.extension.twitch.emotes;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import io.github.bakwudo.uyu.extension.settings.Settings;
import io.github.bakwudo.uyu.extension.Utils;

public final class EmotePickerBridge {
    private static final String TAG = "KizuPicker";
    private static final ConcurrentHashMap<String, String> IMAGE_URLS = new ConcurrentHashMap<>();

    private static final String T_ASSET = "tv.twitch.android.models.emotes.EmoteModelAssetType";
    private static final String T_KIND = "tv.twitch.android.models.emotes.EmoteModelType";
    private static final String T_MODEL_GENERIC = "tv.twitch.android.models.emotes.EmoteModel$Generic";
    private static final String T_MESSAGE_INPUT = "tv.twitch.android.shared.emotes.models.EmoteMessageInput";
    private static final String T_CLICKED_UNLOCKED =
            "tv.twitch.android.shared.emotes.emotepicker.models.ClickedEmote$Unlocked";
    private static final String T_UI_MODEL =
            "tv.twitch.android.shared.emotes.emotepicker.models.EmoteUiModel";
    private static final String T_IMAGE_DESCRIPTOR =
            "tv.twitch.android.shared.emotes.emotepicker.models.EmoteImageDescriptor";

    private EmotePickerBridge() {
    }

    public static String getEmoteUrl(String id) {
        if (id == null || !id.startsWith("KIZU-")) return null;
        return IMAGE_URLS.get(id);
    }

    public static void addAutocomplete(Object rawList) {
        if (!Settings.EMOTES_AUTOCOMPLETE.get() || !(rawList instanceof List)) return;
        try {
            @SuppressWarnings("unchecked")
            List<Object> list = (List<Object>) rawList;
            ClassLoader cl = EmotePickerBridge.class.getClassLoader();
            Class<?> setClass = Class.forName("tv.twitch.android.models.emotes.EmoteSet", false, cl);
            Class<?> genericSet = Class.forName("tv.twitch.android.models.emotes.EmoteSet$GenericEmoteSet", false, cl);
            for (Object set : list) {
                try {
                    Method getSetId = setClass.getMethod("getSetId");
                    if ("KIZU_EMOTE_SET".equals(String.valueOf(getSetId.invoke(set)))) return;
                } catch (Throwable ignored) {
                }
            }

            String channel = EmoteSupport.getCurrentChannelId();
            List<Entry> entries = loadForChannel(channel);
            if (entries.isEmpty() || list.isEmpty()) return;

            Class<?> assetType = Class.forName(T_ASSET, false, cl);
            Class<?> modelKind = Class.forName(T_KIND, false, cl);
            Class<?> modelGeneric = Class.forName(T_MODEL_GENERIC, false, cl);
            List<Object> models = new ArrayList<>(entries.size());
            for (Entry entry : entries) {
                String id = "KIZU-" + Integer.toHexString(entry.code.hashCode()) + "-" +
                        Integer.toHexString(entry.url.hashCode());
                IMAGE_URLS.put(id, entry.url);
                Object asset = enumConstant(assetType, entry.animated ? "ANIMATED" : "STATIC");
                Object kind = enumConstant(modelKind, "OTHER");
                models.add(newInstanceMatching(modelGeneric, id, entry.code, asset, kind));
            }

            Object set = newInstanceMatching(genericSet, "KIZU_EMOTE_SET", models);
            list.add(set);
        } catch (Throwable t) {
            Log.e(TAG, "addAutocomplete failed", t);
        }
    }

    public static void onPickerOpened(Object ignored) {
        try {
            String channel = EmoteSupport.getCurrentChannelId();
            if (channel != null && !channel.isEmpty()) {
                Log.d(TAG, "picker channel=" + channel);
            }
        } catch (Throwable t) {
            Log.w(TAG, "onPickerOpened failed", t);
        }
    }

    /** Injects third-party emotes into Twitch's existing picker model list. */
    public static Object mergeGlobal(Object uiSet) {
        if (!Settings.EMOTES_PICKER.get() || uiSet == null) {
            return uiSet;
        }

        try {
            List<Entry> entries = loadForChannel(EmoteSupport.getCurrentChannelId());
            if (entries.isEmpty()) {
                return uiSet;
            }

            Method getHeader = findNoArgMethod(uiSet.getClass(), "c", "getHeader");
            if (getHeader == null) {
                getHeader = findObjectGetterByType(uiSet.getClass(),
                        "tv.twitch.android.shared.emotes.emotepicker.models.EmoteHeaderUiModel");
            }
            if (getHeader != null) {
                Object header = getHeader.invoke(uiSet);
                Method getSection = findNoArgMethod(header.getClass(), "getEmotePickerSection");
                if (getSection != null) {
                    Object section = getSection.invoke(header);
                    String sectionName = section == null ? "" : section.toString();
                    if (!"ALL".equals(sectionName)) {
                        return uiSet;
                    }
                }
            }

            Method getEmotes = findNoArgMethod(uiSet.getClass(), "b", "getEmotes");
            if (getEmotes == null) {
                getEmotes = findListReturningGetter(uiSet.getClass());
            }
            if (getEmotes == null) {
                throw new NoSuchMethodException("EmoteUiSet emote-list getter not found");
            }

            Object raw = getEmotes.invoke(uiSet);
            if (!(raw instanceof List)) {
                return uiSet;
            }

            @SuppressWarnings("unchecked")
            List<Object> list = (List<Object>) raw;
            Set<String> existingCodes = new HashSet<>();
            for (Object item : list) {
                extractCode(item, existingCodes);
            }

            ClassLoader cl = uiSet.getClass().getClassLoader();
            int added = 0;
            for (Entry entry : entries) {
                if (existingCodes.contains(entry.code)) continue;
                Object model = buildUiModel(cl, entry);
                if (model != null) {
                    list.add(model);
                    existingCodes.add(entry.code);
                    added++;
                }
            }

            Log.d(TAG, "picker added " + added + "/" + entries.size());
            return uiSet;
        } catch (Throwable t) {
            Log.e(TAG, "mergeGlobal failed", t);
            return uiSet;
        }
    }

    private static List<Entry> loadForChannel(String channelId) {
        try {
            List<Emote> source = EmoteSupport.getAllForChannel(channelId);
            if (source == null || source.isEmpty()) {
                return java.util.Collections.emptyList();
            }
            List<Entry> out = new ArrayList<>(source.size());
            for (Emote value : source) {
                if (value == null || value.name == null || value.name.isEmpty() ||
                        value.url == null || value.url.isEmpty()) {
                    continue;
                }
                out.add(new Entry(value.name, value.url, value.animated));
            }
            return out;
        } catch (Throwable t) {
            Log.e(TAG, "loadForChannel failed", t);
            return java.util.Collections.emptyList();
        }
    }

    private static Object buildUiModel(ClassLoader cl, Entry entry) throws Exception {
        Class<?> assetType = Class.forName(T_ASSET, false, cl);
        Class<?> modelKind = Class.forName(T_KIND, false, cl);
        Class<?> modelGeneric = Class.forName(T_MODEL_GENERIC, false, cl);
        Class<?> messageInput = Class.forName(T_MESSAGE_INPUT, false, cl);
        Class<?> clickedUnlocked = Class.forName(T_CLICKED_UNLOCKED, false, cl);
        Class<?> uiModel = Class.forName(T_UI_MODEL, false, cl);
        Class<?> imageDescriptor = Class.forName(T_IMAGE_DESCRIPTOR, false, cl);

        Object asset = enumConstant(assetType, entry.animated ? "ANIMATED" : "STATIC");
        Object kind = enumConstant(modelKind, "OTHER");

        String syntheticId = "KIZU-" + Integer.toHexString(entry.code.hashCode()) + "-" +
                Integer.toHexString(entry.url.hashCode());

        IMAGE_URLS.put(syntheticId, entry.url);

        Object emoteModel = newInstanceMatching(
                modelGeneric, syntheticId, entry.code, asset, kind
        );
        Object input = newInstanceMatching(
                messageInput, entry.code, syntheticId, false
        );

        Object clicked = newInstanceMatching(
                clickedUnlocked,
                emoteModel,
                input,
                null,
                null,
                12,
                null
        );

        Context context = Utils.getContext();
        int widthRes = context == null ? 0 :
                context.getResources().getIdentifier("emote_picker_emote_size", "dimen",
                        context.getPackageName());
        int paddingRes = context == null ? 0 :
                context.getResources().getIdentifier("emote_picker_emote_padding", "dimen",
                        context.getPackageName());

        Object descriptor = enumConstant(imageDescriptor, "NONE");
        return newInstanceMatching(
                uiModel,
                syntheticId,
                clicked,
                asset,
                descriptor,
                widthRes,
                paddingRes == 0 ? null : Integer.valueOf(paddingRes)
        );
    }

    private static Method findNoArgMethod(Class<?> cls, String... names) {
        for (String name : names) {
            try {
                Method m = cls.getMethod(name);
                if (m.getParameterCount() == 0) return m;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Method findObjectGetterByType(Class<?> cls, String typeName) {
        for (Method method : cls.getMethods()) {
            if (method.getParameterCount() == 0 &&
                    method.getReturnType().getName().equals(typeName)) {
                return method;
            }
        }
        return null;
    }

    private static Method findListReturningGetter(Class<?> cls) {
        for (Method method : cls.getMethods()) {
            if (method.getParameterCount() == 0 &&
                    List.class.isAssignableFrom(method.getReturnType())) {
                return method;
            }
        }
        return null;
    }

    private static void extractCode(Object uiModel, Set<String> out) {
        if (uiModel == null) return;
        try {
            Object clicked = findObjectField(uiModel, "clickedEmote", "b");
            if (clicked == null) return;
            Object input = findObjectField(clicked, "emoteMessageInput");
            if (input == null) {
                for (Method m : clicked.getClass().getMethods()) {
                    if (m.getParameterCount() == 0 &&
                            m.getReturnType().getName().endsWith("EmoteMessageInput")) {
                        input = m.invoke(clicked);
                        break;
                    }
                }
            }
            if (input == null) return;
            Object code = findObjectField(input, "code");
            if (code != null) out.add(String.valueOf(code));
        } catch (Throwable ignored) {
        }
    }

    private static Object findObjectField(Object owner, String... names) {
        for (String name : names) {
            try {
                java.lang.reflect.Field field = owner.getClass().getDeclaredField(name);
                field.setAccessible(true);
                return field.get(owner);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object newInstanceMatching(Class<?> cls, Object... args) throws Exception {
        for (Constructor<?> constructor : cls.getDeclaredConstructors()) {
            Class<?>[] types = constructor.getParameterTypes();
            if (types.length != args.length) continue;

            boolean compatible = true;
            for (int i = 0; i < types.length; i++) {
                if (args[i] == null) {
                    if (types[i].isPrimitive()) {
                        compatible = false;
                        break;
                    }
                    continue;
                }
                if (!wrapPrimitive(types[i]).isAssignableFrom(args[i].getClass())) {
                    compatible = false;
                    break;
                }
            }
            if (!compatible) continue;
            constructor.setAccessible(true);
            return constructor.newInstance(args);
        }
        throw new NoSuchMethodException(cls.getName() + " has no compatible constructor");
    }

    private static Object enumConstant(Class<?> cls, String name) throws Exception {
        @SuppressWarnings({"rawtypes", "unchecked"})
        Object value = Enum.valueOf((Class<? extends Enum>) cls, name);
        return value;
    }

    private static Class<?> wrapPrimitive(Class<?> type) {
        if (!type.isPrimitive()) return type;
        if (type == boolean.class) return Boolean.class;
        if (type == byte.class) return Byte.class;
        if (type == short.class) return Short.class;
        if (type == int.class) return Integer.class;
        if (type == long.class) return Long.class;
        if (type == float.class) return Float.class;
        if (type == double.class) return Double.class;
        if (type == char.class) return Character.class;
        return type;
    }

    private static final class Entry {
        final String code;
        final String url;
        final boolean animated;

        Entry(String code, String url, boolean animated) {
            this.code = code;
            this.url = url;
            this.animated = animated;
        }
    }
}
