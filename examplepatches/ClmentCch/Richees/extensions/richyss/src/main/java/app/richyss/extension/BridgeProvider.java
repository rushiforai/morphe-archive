package app.richyss.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONObject;

/**
 * Exported ContentProvider injected into Discord by the Richyss Bridge patch.
 *
 * <p>Endpoints:</p>
 * <ul>
 *     <li>{@code content://com.discord.richyss.bridge/status} — bridge and Discord version</li>
 *     <li>{@code content://com.discord.richyss.bridge/presence} — last stored payload</li>
 *     <li>{@code call("setPresence", json)} — validate and store a payload</li>
 *     <li>{@code call("clearPresence", null)} — forget the payload</li>
 * </ul>
 *
 * <p>Only the Richyss package (and the shell/root uid used by debugging tools) is
 * accepted. The provider never reads Discord's account credentials and never
 * performs network requests.</p>
 */
public final class BridgeProvider extends ContentProvider {
    public static final String AUTHORITY = "com.discord.richyss.bridge";
    public static final String TAG = "RichyssBridge";

    private BridgeStore store;

    @Override
    public boolean onCreate() {
        store = BridgeStore.forContext(getContext());
        return true;
    }

    @Override
    public String getType(Uri uri) {
        return "application/json";
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection,
                        String[] selectionArgs, String sortOrder) {
        if (!isAllowedCaller()) {
            return null;
        }
        MatrixCursor cursor = new MatrixCursor(new String[]{"json"});
        String path = uri == null ? "" : uri.getPath();
        try {
            if ("/presence".equals(path)) {
                JSONObject presence = store.readPresence();
                cursor.addRow(new Object[]{presence == null ? "null" : presence.toString()});
            } else {
                cursor.addRow(new Object[]{statusJson().toString()});
            }
        } catch (Exception e) {
            Log.w(TAG, "query failed", e);
            return null;
        }
        return cursor;
    }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        Bundle result = new Bundle();
        if (!isAllowedCaller()) {
            result.putBoolean("ok", false);
            result.putString("error", "Caller not allowed");
            return result;
        }
        try {
            switch (method == null ? "" : method) {
                case "setPresence": {
                    JSONObject payload = BridgeProtocol.parsePresence(arg);
                    payload.put("updatedAt", System.currentTimeMillis());
                    store.writePresence(payload);
                    result.putBoolean("ok", true);
                    result.putString("json", payload.toString());
                    Log.i(TAG, "Presence stored: " + payload.optString("activityName"));
                    break;
                }
                case "clearPresence": {
                    store.deletePresence();
                    result.putBoolean("ok", true);
                    result.putString("json", statusJson().toString());
                    break;
                }
                case "status": {
                    result.putBoolean("ok", true);
                    result.putString("json", statusJson().toString());
                    break;
                }
                default: {
                    result.putBoolean("ok", false);
                    result.putString("error", "Unknown method: " + method);
                }
            }
        } catch (BridgeProtocol.InvalidPayloadException e) {
            result.putBoolean("ok", false);
            result.putString("error", e.getMessage());
        } catch (Exception e) {
            result.putBoolean("ok", false);
            result.putString("error", "Bridge failure: " + e.getMessage());
            Log.w(TAG, "call failed", e);
        }
        return result;
    }

    private JSONObject statusJson() {
        JSONObject meta = store.readMeta();
        return BridgeProtocol.buildStatus(
                meta.optString("discordVersion", ""),
                store.updatedAt(),
                null
        );
    }

    /**
     * Checks the calling uid instead of relying on android:permission so the patch
     * does not need to declare a signature-level permission in Discord's manifest.
     */
    private boolean isAllowedCaller() {
        int uid = Binder.getCallingUid();
        if (uid == 0 || uid == android.os.Process.myUid()) {
            return true;
        }
        PackageManager pm = getContext() == null ? null : getContext().getPackageManager();
        if (pm == null) {
            return false;
        }
        String[] packages = pm.getPackagesForUid(uid);
        if (packages == null) {
            return false;
        }
        for (String packageName : packages) {
            if (BridgeProtocol.isAllowedPackage(packageName)) {
                return true;
            }
        }
        Log.w(TAG, "Rejected bridge caller uid " + uid);
        return false;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException("Use call(\"setPresence\", json)");
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        if (!isAllowedCaller()) {
            return 0;
        }
        store.deletePresence();
        return 1;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Use call(\"setPresence\", json)");
    }
}
