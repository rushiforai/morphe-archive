package nl.johninnl.wuplay.test;

import android.app.Instrumentation;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;
import org.json.*;

/** Test APK only: read provider evidence with the actual target UID. */
public final class WuplayProbe extends Instrumentation {
    private Bundle arguments;
    public void onCreate(Bundle bundle) { arguments = bundle; start(); }
    private static Object field(Object object, String name) throws Exception {
        Field field = object.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(object);
    }
    private static Object call(Object object, String name, Class<?>[] types, Object... values) throws Exception {
        Method method = object.getClass().getDeclaredMethod(name, types); method.setAccessible(true); return method.invoke(object, values);
    }
    public void onStart() {
        Bundle result = new Bundle();
        try {
            waitForIdleSync();
            Context context = getTargetContext();
            ClassLoader loader = context.getClassLoader();
            String action = arguments.getString("action", "snapshot");
            if (action.equals("refresh")) {
                Class<?> channels = loader.loadClass("nl.johninnl.wuplay.CatalogChannels");
                Method refresh = channels.getDeclaredMethod("refresh", android.app.Application.class); refresh.setAccessible(true);
                result.putString("status", (String) refresh.invoke(null, context.getApplicationContext()));
            }
            if (action.equals("empty")) {
                Class<?> nativeClass = loader.loadClass("nl.johninnl.wuplay.NativeCatalogs");
                Constructor<?> ctor = nativeClass.getDeclaredConstructor(android.app.Application.class); ctor.setAccessible(true);
                Object api = ctor.newInstance(context.getApplicationContext());
                Object snapshot = call(api, "snapshot", new Class<?>[]{});
                Class<?> publisherClass = loader.loadClass("nl.johninnl.wuplay.CatalogPublisher");
                Constructor<?> publisherCtor = publisherClass.getDeclaredConstructor(Context.class); publisherCtor.setAccessible(true);
                Object publisher = publisherCtor.newInstance(context);
                for (Object definition : (List<?>) field(snapshot, "definitions")) if (((String) field(definition, "key")).endsWith("/" + arguments.getString("catalogId"))) {
                    call(publisher, "publish", new Class<?>[]{definition.getClass(), List.class}, definition, Collections.emptyList());
                }
            }
            JSONArray channels = new JSONArray(), programs = new JSONArray();
            try (Cursor cursor = context.getContentResolver().query(Uri.parse("content://android.media.tv/channel"),
                    new String[]{"_id", "package_name", "internal_provider_id", "display_name", "browsable"}, null, null, null)) {
                if (cursor == null) throw new AssertionError("Null channel cursor");
                while (cursor.moveToNext()) if (context.getPackageName().equals(cursor.getString(1))) {
                    JSONObject row = new JSONObject(); row.put("id",cursor.getLong(0)); row.put("key",cursor.getString(2)); row.put("name",cursor.getString(3)); row.put("browsable",cursor.getInt(4)); channels.put(row);
                }
            }
            try (Cursor cursor = context.getContentResolver().query(Uri.parse("content://android.media.tv/preview_program"),
                    new String[]{"_id", "channel_id", "package_name", "internal_provider_id", "title", "intent_uri", "poster_art_uri", "weight"}, null, null, null)) {
                if (cursor == null) throw new AssertionError("Null program cursor");
                while (cursor.moveToNext()) if (context.getPackageName().equals(cursor.getString(2))) {
                    JSONObject row = new JSONObject(); row.put("id",cursor.getLong(0)); row.put("channel",cursor.getLong(1)); row.put("key",cursor.getString(3));
                    row.put("title",cursor.getString(4)); row.put("intent",cursor.getString(5)); row.put("art",cursor.getString(6)); row.put("weight",cursor.getInt(7)); programs.put(row);
                }
            }
            JSONObject report = new JSONObject(); report.put("channels",channels); report.put("programs",programs);
            result.putString("report",report.toString()); finish(-1,result);
        } catch (Throwable failure) {
            result.putString("failure",android.util.Log.getStackTraceString(failure)); finish(0,result);
        }
    }
}
