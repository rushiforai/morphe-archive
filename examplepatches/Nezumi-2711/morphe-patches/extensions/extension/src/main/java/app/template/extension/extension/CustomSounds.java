package app.template.extension.extension;

import android.app.Activity;
import android.app.Fragment;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.AudioAttributes;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public final class CustomSounds extends Fragment {
    private static final String PREFS = "nezumi_settings";
    private static final String KIND = "sound_kind";
    public static final String NOTIFICATION = "custom_notification_sound";
    public static final String RINGTONE = "custom_ringtone";
    private static final int PICK_SOUND = 1043;
    private Runnable onChanged;

    private static boolean validKind(String kind) {
        return NOTIFICATION.equals(kind) || RINGTONE.equals(kind);
    }

    private static File selectedFile(Context context, String kind) {
        if (context == null || !validKind(kind)) return null;
        String name = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(kind, null);
        if (name == null || !name.startsWith("nezumi-sound-") || name.contains("/")) return null;
        File file = new File(context.getFilesDir(), name);
        return file.isFile() && file.length() > 0 ? file : null;
    }

    public static boolean isSelected(Context context, String kind) {
        return selectedFile(context, kind) != null;
    }

    public static Notification.Builder notificationBuilder(Context context, String channelId) {
        return new Notification.Builder(context, customChannel(context, channelId));
    }

    static String customChannel(Context context, String channelId) {
        File file = selectedFile(context, NOTIFICATION);
        if (file == null || channelId == null) return channelId;
        try {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            NotificationChannel original = manager.getNotificationChannel(channelId);
            if (original == null || original.getSound() == null
                    || original.getImportance() < NotificationManager.IMPORTANCE_DEFAULT) return channelId;
            AudioAttributes attributes = original.getAudioAttributes();
            int usage = attributes == null ? AudioAttributes.USAGE_NOTIFICATION : attributes.getUsage();
            if (usage != AudioAttributes.USAGE_NOTIFICATION && (usage < 7 || usage > 10)) return channelId;
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256")
                .digest(channelId.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            String key = android.util.Base64.encodeToString(digest,
                android.util.Base64.NO_WRAP | android.util.Base64.URL_SAFE);
            String customId = "nezumi_sound_" + key + "_" + file.getName();
            if (manager.getNotificationChannel(customId) == null) {
                NotificationChannel channel = new NotificationChannel(customId,
                    original.getName(), original.getImportance());
                channel.setDescription(original.getDescription());
                channel.setGroup(original.getGroup());
                channel.setShowBadge(original.canShowBadge());
                channel.enableLights(original.shouldShowLights());
                channel.setLightColor(original.getLightColor());
                channel.setVibrationPattern(original.getVibrationPattern());
                channel.enableVibration(original.shouldVibrate());
                channel.setLockscreenVisibility(original.getLockscreenVisibility());
                channel.setBypassDnd(original.canBypassDnd());
                if (Build.VERSION.SDK_INT >= 29) channel.setAllowBubbles(original.canBubble());
                if (Build.VERSION.SDK_INT >= 30 && original.getConversationId() != null) {
                    channel.setConversationId(original.getParentChannelId(), original.getConversationId());
                }
                Uri sound = new Uri.Builder().scheme("content")
                    .authority(context.getPackageName() + ".nezumi.sounds")
                    .appendPath(file.getName()).build();
                int flags = Intent.FLAG_GRANT_READ_URI_PERMISSION;
                try {
                    context.grantUriPermission("android", sound, flags);
                } catch (SecurityException ignored) {
                }
                try {
                    context.grantUriPermission("com.android.systemui", sound, flags);
                } catch (SecurityException ignored) {
                }
                channel.setSound(sound, attributes);
                manager.createNotificationChannel(channel);
            }
            return customId;
        } catch (Exception failure) {
            android.util.Log.w("NezumiSounds", "Custom notification channel unavailable; using original");
            return channelId;
        }
    }

    public static void reset(Context context, String kind) {
        File previous = selectedFile(context, kind);
        if (context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().remove(kind).commit()
                && previous != null) previous.delete();
    }

    public static void setRingtoneDataSource(MediaPlayer player, Context context, Uri original)
            throws IOException {
        setDataSource(player, context, original, RINGTONE);
    }

    public static void setNotificationDataSource(MediaPlayer player, Context context, Uri original)
            throws IOException {
        setDataSource(player, context, original, NOTIFICATION);
    }

    private static void setDataSource(MediaPlayer player, Context context, Uri original, String kind)
            throws IOException {
        File file = selectedFile(context, kind);
        if (file != null) {
            try {
                player.setDataSource(file.getAbsolutePath());
                return;
            } catch (IOException | RuntimeException failure) {
                android.util.Log.w("NezumiSounds", "Custom sound unavailable; using original");
            }
        }
        player.setDataSource(context, original);
    }

    public static boolean pick(Context context, String kind, Runnable onChanged) {
        if (!validKind(kind)) return false;
        while (context instanceof ContextWrapper && !(context instanceof Activity)) {
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) return false;
            context = base;
        }
        if (!(context instanceof Activity)) return false;
        Activity activity = (Activity) context;
        if (activity.isFinishing() || (Build.VERSION.SDK_INT >= 26
            && activity.getFragmentManager().isStateSaved())) return false;
        CustomSounds fragment = new CustomSounds();
        Bundle arguments = new Bundle();
        arguments.putString(KIND, kind);
        fragment.setArguments(arguments);
        fragment.onChanged = onChanged;
        activity.getFragmentManager().beginTransaction().add(fragment, "nezumi-sound-picker").commit();
        return true;
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) return;
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("audio/*");
        try {
            startActivityForResult(intent, PICK_SOUND);
        } catch (ActivityNotFoundException failure) {
            Toast.makeText(getActivity(), "Cannot open audio picker", Toast.LENGTH_SHORT).show();
            getFragmentManager().beginTransaction().remove(this).commit();
        }
    }

    @Override public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != PICK_SOUND) return;
        if (resultCode == Activity.RESULT_OK && data != null && data.getData() != null) {
            try {
                save(getActivity(), getArguments().getString(KIND), data.getData());
                if (onChanged != null) onChanged.run();
                Toast.makeText(getActivity(), "Sound saved", Toast.LENGTH_SHORT).show();
            } catch (Exception failure) {
                Toast.makeText(getActivity(), "Could not load this audio file", Toast.LENGTH_SHORT).show();
            }
        }
        getFragmentManager().beginTransaction().remove(this).commit();
    }

    private static void save(Context context, String kind, Uri uri) throws IOException {
        if (!validKind(kind)) throw new IllegalArgumentException("Unknown sound type");
        File file = File.createTempFile("nezumi-sound-", ".audio", context.getFilesDir());
        boolean saved = false;
        try {
            try (InputStream input = context.getContentResolver().openInputStream(uri);
                 FileOutputStream output = new FileOutputStream(file)) {
                if (input == null) throw new IOException("Missing audio document");
                byte[] buffer = new byte[8192];
                long size = 0;
                int count;
                while ((count = input.read(buffer)) != -1) {
                    size += count;
                    if (size > 20L * 1024 * 1024) throw new IOException("Audio exceeds 20 MiB");
                    output.write(buffer, 0, count);
                }
                if (size == 0) throw new IOException("Empty audio document");
            }
            MediaPlayer probe = new MediaPlayer();
            try (java.io.FileInputStream input = new java.io.FileInputStream(file)) {
                probe.setDataSource(input.getFD());
                probe.prepare();
                if (probe.getDuration() <= 0) throw new IOException("Invalid audio duration");
            } finally {
                probe.release();
            }
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            File previous = selectedFile(context, kind);
            if (!prefs.edit().putString(kind, file.getName()).commit()) throw new IOException("Sound not saved");
            saved = true;
            if (previous != null) previous.delete();
        } finally {
            if (!saved) file.delete();
        }
    }
}