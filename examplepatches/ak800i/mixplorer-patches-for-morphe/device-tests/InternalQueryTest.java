package dev.local.mixplorer.internaltest;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.Arrays;

public class InternalQueryTest extends Instrumentation {
    private Bundle arguments;

    @Override
    public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        this.arguments = arguments;
        start();
    }

    @Override
    public void onStart() {
        Bundle result = new Bundle();
        try {
            Context target = getTargetContext();
            if (Process.myUid() != target.getApplicationInfo().uid) {
                throw new AssertionError("Test must run under the provider's own UID");
            }
            Uri uri = Uri.parse(arguments.getString("uri"));
            String expected = arguments.getString("expected");
            String[] columns = {"_data", "path", "_display_name", "_size"};
            try (Cursor cursor = target.getContentResolver().query(uri, columns, null, null, null)) {
                if (cursor == null || !cursor.moveToFirst()) {
                    throw new AssertionError("Same-UID query returned no row");
                }
                String data = cursor.getString(cursor.getColumnIndexOrThrow("_data"));
                String path = cursor.getString(cursor.getColumnIndexOrThrow("path"));
                if (!expected.equals(data) || !expected.equals(path)) {
                    throw new AssertionError("Internal _data/path changed: " + data + " / " + path);
                }
                byte[] uriHash;
                byte[] pathHash;
                try (InputStream input = target.getContentResolver().openInputStream(uri)) {
                    uriHash = digest(input);
                }
                try (InputStream input = new FileInputStream(data)) {
                    pathHash = digest(input);
                }
                if (!Arrays.equals(uriHash, pathHash)) {
                    throw new AssertionError("Internal raw-path and URI payloads differ");
                }
                result.putString("_data", data);
                result.putString("path", path);
                result.putString("name", cursor.getString(cursor.getColumnIndexOrThrow("_display_name")));
                result.putLong("size", cursor.getLong(cursor.getColumnIndexOrThrow("_size")));
            }
            result.putInt("uid", Process.myUid());
            result.putString("status", "PASS: Same-UID _data and path alias preserved; both payload reads match");
            finish(Activity.RESULT_OK, result);
        } catch (Throwable failure) {
            result.putString("status", "FAIL: " + failure);
            finish(Activity.RESULT_CANCELED, result);
        }
    }

    private byte[] digest(InputStream input) throws Exception {
        if (input == null) {
            throw new AssertionError("Null file stream");
        }
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] buffer = new byte[8192];
        int count;
        while ((count = input.read(buffer)) != -1) {
            digest.update(buffer, 0, count);
        }
        return digest.digest();
    }
}