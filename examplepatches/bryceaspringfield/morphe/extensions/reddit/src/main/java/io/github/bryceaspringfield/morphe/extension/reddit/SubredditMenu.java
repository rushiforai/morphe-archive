package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;
import static io.github.bryceaspringfield.morphe.extension.reddit.Strings.t;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.List;

final class SubredditMenu {
    static final int CREATE_POST = 0x4D52_4350;
    private static final String ITEM = "com.reddit.subreddit.bottomsheet.SubredditBottomSheetActionMenu$Item";
    private static final String SUBREDDIT = "com.reddit.domain.model.Subreddit";
    private static volatile String subreddit;

    private SubredditMenu() {
    }

    static boolean createHidden() {
        try {
            Object setting = Class.forName("app.morphe.extension.reddit.settings.Settings")
                    .getField("HIDE_CREATE_BUTTON").get(null);
            return Boolean.TRUE.equals(setting.getClass().getMethod("get").invoke(setting));
        } catch (Exception ex) {
            return false;
        }
    }

    private static String nameOf(Object builder) throws Exception {
        for (Field field : builder.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            Object value = field.get(builder);
            if (value != null && value.getClass().getName().equals(SUBREDDIT)) {
                return (String) value.getClass().getMethod("getDisplayName").invoke(value);
            }
        }
        return null;
    }

    private static Object icon(Class<?> type) {
        Object[] icons = type.getEnumConstants();
        if (icons == null) return null;
        for (String wanted : new String[]{"Add", "Create", "Edit", "Posts", "Post"}) {
            for (Object icon : icons) if (((Enum<?>) icon).name().equalsIgnoreCase(wanted)) return icon;
        }
        return null;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    static void add(Object builder, Object items) {
        try {
            if (!(items instanceof List) || !createHidden()) return;
            String name = nameOf(builder);
            if (name == null || name.isEmpty()) return;
            subreddit = name;
            for (Constructor<?> constructor : Class.forName(ITEM).getConstructors()) {
                Class<?>[] types = constructor.getParameterTypes();
                if (types.length != 7 || types[0] != int.class || types[1] != String.class || types[4] != boolean.class
                        || types[6] != Bundle.class) continue;
                ((List) items).add(0, constructor.newInstance(CREATE_POST, t("Create post"), icon(types[2]), null,
                        false, null, null));
                Log.i(TAG, "subreddit menu: Create post added for r/" + name);
                return;
            }
            Log.e(TAG, "subreddit menu: the item's constructor is missing");
        } catch (Exception ex) {
            Log.e(TAG, "subreddit menu failure", ex);
        }
    }

    @SuppressLint("PrivateApi")
    static boolean tapped(int id) {
        if (id != CREATE_POST) return false;
        try {
            String name = subreddit;
            Context context = (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication")
                    .invoke(null);
            if (name == null || context == null) return true;
            Intent intent = new Intent(Intent.ACTION_VIEW,
                    new Uri.Builder().scheme("https").authority("www.reddit.com").appendPath("r").appendPath(name)
                            .appendPath("submit").build());
            intent.setPackage(context.getPackageName());
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Log.i(TAG, "subreddit menu: Create post opened for r/" + name);
        } catch (Exception ex) {
            Log.e(TAG, "subreddit menu tap failure", ex);
        }
        return true;
    }
}
