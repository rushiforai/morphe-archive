package app.hushmessenger.extension;

import android.Manifest;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;
import java.io.File;
import java.io.IOException;

/**
 * Opens the phone's camera app for the chat's camera button and hands the photo back the way a photo picked in another
 * app comes back. The chat's own code then copies it and opens it in Messenger's editor for that chat. Not exported, and
 * it draws nothing but the Photo or Video choice when Ask photo or video is on (#168): the camera app is the only other
 * screen the person sees. A video comes back the same way a single video picked in the gallery does.
 */
public final class CameraActivity extends Activity {
    /** Messenger's request code for a photo picked in another app. The patch checks the chat fragment reads it. */
    static final int EXTERNAL_MEDIA_REQUEST = 1112;
    static final String KEY = "system_camera";
    /** Under the camera switch: ask Photo or Video first instead of always taking a photo. */
    static final String ASK = "system_camera_ask";
    private static final int CAPTURE = 1;
    private static final int PERMISSION = 2;
    private static final String PENDING = "hush_camera_photo";
    private static final String CHOOSING = "hush_camera_choosing";
    /** Messenger copies the photo as soon as it's back, so older captures are only leftovers. */
    static final long KEEP_MS = 10 * 60 * 1000L;
    /** The name of the photo last handed back to the chat, the only one Messenger's copy checks let through. */
    static volatile String handedBack;

    File photo;
    /** The Photo or Video choice while it's up, so a rotation puts it back. */
    android.app.Dialog choice;

    /** The capture screen when Android knows it and its provider under this package's own name, otherwise null. */
    static Intent captureIntent(Context context) {
        String own = context.getPackageName();
        Intent intent = new Intent().setClassName(own, CameraActivity.class.getName());
        PackageManager packages = context.getPackageManager();
        ResolveInfo screen = packages.resolveActivity(intent, 0);
        ProviderInfo provider = packages.resolveContentProvider(own + CameraProvider.AUTHORITY_SUFFIX, 0);
        // A Root Mount install keeps the stock manifest, so neither exists there and Messenger's camera stays.
        if (screen == null || screen.activityInfo == null || !own.equals(screen.activityInfo.packageName) ||
            provider == null || !own.equals(provider.packageName) || !CameraProvider.class.getName().equals(provider.name)) return null;
        return intent;
    }

    static boolean isCapture(Context context, Intent intent) {
        ComponentName target = intent == null ? null : intent.getComponent();
        return context != null && target != null && context.getPackageName().equals(target.getPackageName()) &&
            CameraActivity.class.getName().equals(target.getClassName());
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) {
            // Android stopped Messenger while the camera app was open. The camera's answer still comes back here.
            String name = state.getString(PENDING);
            if (name != null) photo = new File(CameraProvider.directory(this), name);
            else if (state.getBoolean(CHOOSING)) choose();
            return;
        }
        if (needsPermission()) requestPermissions(new String[] {Manifest.permission.CAMERA}, PERMISSION);
        else start();
    }

    private void start() {
        if (Settings.preferences != null && Settings.preferences.getBoolean(ASK, false)) choose();
        else capture(false);
    }

    /** Photo or Video, the way Messenger's own camera offers both. Backing out leaves the chat as it was. */
    private void choose() {
        SettingsText text = new SettingsText(this);
        choice = new android.app.AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
            .setItems(new CharSequence[] {text.get("camera_photo"), text.get("camera_video")}, (dialog, which) -> {
                choice = null;
                capture(which == 1);
            })
            .setOnCancelListener(dialog -> {
                choice = null;
                setResult(RESULT_CANCELED);
                finish();
            })
            .show();
    }

    @Override protected void onDestroy() {
        if (choice != null) choice.dismiss();
        super.onDestroy();
    }

    /** Android refuses the camera action to an app that asks for the camera permission and doesn't hold it. Messenger asks. */
    private boolean needsPermission() {
        if (checkSelfPermission(Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) return false;
        try {
            PackageInfo info = getPackageManager().getPackageInfo(getPackageName(), PackageManager.GET_PERMISSIONS);
            if (info.requestedPermissions != null) for (String name : info.requestedPermissions) {
                if (Manifest.permission.CAMERA.equals(name)) return true;
            }
        } catch (PackageManager.NameNotFoundException error) {
            Log.w("HushMessenger", "Can't read Messenger's permissions", error);
        }
        return false;
    }

    private void capture(boolean video) {
        try {
            File folder = CameraProvider.directory(this);
            removeLeftovers(folder, System.currentTimeMillis());
            if (!folder.isDirectory() && !folder.mkdirs()) throw new IOException("No camera folder");
            long now = System.currentTimeMillis();
            File next = new File(folder, video ? "VID_" + now + ".mp4" : "IMG_" + now + ".jpg");
            if (!next.createNewFile()) throw new IOException("The photo file already exists");
            photo = next;
            Uri uri = CameraProvider.uriFor(this, next);
            Intent camera = new Intent(video ? MediaStore.ACTION_VIDEO_CAPTURE : MediaStore.ACTION_IMAGE_CAPTURE).putExtra(MediaStore.EXTRA_OUTPUT, uri)
                .addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION | Intent.FLAG_GRANT_READ_URI_PERMISSION);
            camera.setClipData(ClipData.newRawUri("", uri));
            startActivityForResult(camera, CAPTURE);
        } catch (ActivityNotFoundException error) {
            give("camera_missing");
        } catch (IOException | RuntimeException error) {
            Settings.hookFailedPrivately(KEY, "Can't open the phone's camera app", error);
            give("camera_failed");
        }
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        if (requestCode != PERMISSION) return;
        if (results.length > 0 && results[0] == PackageManager.PERMISSION_GRANTED) start();
        else give("camera_permission");
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != CAPTURE) return;
        File taken = photo;
        Uri saved = data == null ? null : data.getData();
        if (resultCode == RESULT_OK && taken != null && taken.length() > 0) {
            Uri uri = CameraProvider.uriFor(this, taken);
            handedBack = taken.getName();
            setResult(RESULT_OK, new Intent().setDataAndType(uri, CameraProvider.typeOf(taken.getName())).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
        } else if (resultCode == RESULT_OK && taken != null && taken.getName().startsWith(CameraProvider.VIDEO) && saved != null) {
            // Some camera apps save a video to their own gallery and only say where. That one comes back like a gallery pick.
            if (!taken.delete() && taken.exists()) Log.w("HushMessenger", "Can't remove an empty camera video");
            String type = null;
            try {
                type = getContentResolver().getType(saved);
            } catch (RuntimeException unreadable) {
                Log.w("HushMessenger", "Can't read the camera video's type", unreadable);
            }
            setResult(RESULT_OK, new Intent().setDataAndType(saved, type != null && type.startsWith("video/") ? type : "video/mp4")
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
        } else {
            if (taken != null && !taken.delete() && taken.exists()) Log.w("HushMessenger", "Can't remove an empty camera photo");
            setResult(RESULT_CANCELED);
        }
        photo = null;
        finish();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (photo != null) state.putString(PENDING, photo.getName());
        else if (choice != null) state.putBoolean(CHOOSING, true);
    }

    /** Ends with no photo, so the chat stays as it was. */
    private void give(String message) {
        File unused = photo;
        if (unused != null && !unused.delete() && unused.exists()) Log.w("HushMessenger", "Can't remove an unused camera photo");
        photo = null;
        Toast.makeText(this, new SettingsText(this).get(message), Toast.LENGTH_LONG).show();
        setResult(RESULT_CANCELED);
        finish();
    }

    static void removeLeftovers(File folder, long now) {
        File[] files = folder.listFiles();
        if (files == null) return;
        for (File file : files) {
            if (now - file.lastModified() > KEEP_MS && !file.delete() && file.exists()) Log.w("HushMessenger", "Can't remove an old camera photo");
        }
    }
}
