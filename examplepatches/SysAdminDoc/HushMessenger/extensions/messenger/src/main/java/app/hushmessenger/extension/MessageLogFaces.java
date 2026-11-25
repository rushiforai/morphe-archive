package app.hushmessenger.extension;

import android.app.Notification;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * The faces the message log shows beside its chats and messages, read off the chat notifications the way their names
 * are: a group's picture, each sender's face in a group, and the other person's in a one-to-one chat. Each is a small
 * square picture sealed with the log's own key, one file per chat or sender, in a folder of its own, since
 * {@link MessageLogMedia#tidy} deletes anything in its folder no message points at. A face goes once no message of
 * its chat (or its sender) is left, and they all go with Clear. The callers hold the log's lock.
 */
final class MessageLogFaces {
    private MessageLogFaces() {}

    static final String DIR = "hush_message_log_faces";
    /** Faces are kept this many pixels square, about a 48 dp row's face on a dense phone. */
    static final int SIZE = 128;
    /** A face kept less than this long ago isn't read again, so a busy chat doesn't rewrite it with every message. */
    static final long FRESH_MS = 24L * 60 * 60 * 1000;
    /** All the faces together. Undo after Clear holds them in memory, so this stays small. */
    static final long MAX_TOTAL_BYTES = 4L * 1024 * 1024;
    /** One face past this was never written here. */
    private static final int MAX_BYTES = 256 * 1024;
    /** The sealed copy is the picture plus the nonce and the tag. */
    private static final int SEAL_BYTES = 12 + 16;
    /** A name is a digest, so nothing in it can point outside the folder. */
    private static final Pattern NAME = Pattern.compile("[0-9a-f]{64}");
    /** Messenger's own extra for a conversation's picture (Notification.EXTRA_CONVERSATION_ICON, Android 11). */
    static final String CONVERSATION_ICON = "android.conversationIcon";
    /** Behind a picture with see-through parts, which a face kept as a JPEG can't have. Mid grey reads on either look. */
    private static final int BACKDROP = 0xFF8A8D91;

    /** The file name of [thread]'s face: a group's picture, or the other person's in a one-to-one chat. */
    static String chatName(String thread) {
        return MessageLog.digest(thread == null ? "" : thread);
    }

    /** The file name of [sender]'s face in the group [thread]. */
    static String senderName(String thread, String sender) {
        return MessageLog.digest((thread == null ? "" : thread) + (char) 0 + (sender == null ? "" : sender));
    }

    static File file(Context context, String name) {
        if (context == null || name == null || !NAME.matcher(name).matches()) return null;
        return new File(new File(context.getFilesDir(), DIR), name);
    }

    /** The pictures a notification carries for one message: its chat's, and its sender's when that's someone else's. */
    static final class Found {
        final Icon chat;
        final Icon sender;

        Found(Icon chat, Icon sender) {
            this.chat = chat;
            this.sender = sender;
        }
    }

    /**
     * What [notification] shows for [sender]'s message in [thread]. A group's own picture is only ever its conversation
     * icon, since its large icon could be anyone's. A one-to-one chat takes its conversation icon, else the sender's
     * face on their line, else the large icon. Null when there's none. Only reads the extras, so it's cheap.
     */
    @SuppressWarnings("deprecation")
    static Found find(Notification notification, String thread, String sender) {
        if (notification == null || notification.extras == null) return null;
        Bundle extras = notification.extras;
        Icon chat = asIcon(extras.getParcelable(CONVERSATION_ICON));
        Icon face = sender == null || sender.isEmpty() ? null : personIcon(extras, sender);
        if (thread != null && ChatNotifications.oneToOne(thread)) {
            if (chat == null) chat = face;
            if (chat == null) chat = notification.getLargeIcon();
            if (chat == null && notification.largeIcon != null) chat = Icon.createWithBitmap(notification.largeIcon);
            face = null;
        }
        return chat == null && face == null ? null : new Found(chat, face);
    }

    private static Icon asIcon(Object value) {
        if (value instanceof Icon) return (Icon) value;
        if (value instanceof Bitmap) return Icon.createWithBitmap((Bitmap) value);
        return null;
    }

    /** The face on [sender]'s newest line, else on the notification's list of people. */
    @SuppressWarnings("deprecation")
    private static Icon personIcon(Bundle extras, String sender) {
        if (Build.VERSION.SDK_INT < 28) return null;
        Parcelable[] messages = extras.getParcelableArray(Notification.EXTRA_MESSAGES);
        if (messages != null) {
            for (int i = messages.length - 1; i >= 0; i--) {
                if (!(messages[i] instanceof Bundle)) continue;
                Icon icon = iconOf(((Bundle) messages[i]).get("sender_person"), sender);
                if (icon != null) return icon;
            }
        }
        ArrayList<?> people = extras.getParcelableArrayList(Notification.EXTRA_PEOPLE_LIST);
        if (people != null) for (Object person : people) {
            Icon icon = iconOf(person, sender);
            if (icon != null) return icon;
        }
        return null;
    }

    private static Icon iconOf(Object person, String sender) {
        if (!(person instanceof android.app.Person)) return null;
        CharSequence name = ((android.app.Person) person).getName();
        return name != null && sender.contentEquals(name) ? ((android.app.Person) person).getIcon() : null;
    }

    /**
     * Keeps what [found] shows, [thread]'s picture and [sender]'s face, sealed. A face kept within FRESH_MS stays as it
     * is. A face that can't be read is left out, and the message is still logged.
     */
    static void keep(Context context, String thread, String sender, Found found) {
        if (context == null || found == null || thread == null || thread.isEmpty()) return;
        File dir = new File(context.getFilesDir(), DIR);
        try {
            if (found.chat != null) seal(context, dir, chatName(thread), found.chat);
            if (found.sender != null && sender != null && !sender.isEmpty()) seal(context, dir, senderName(thread, sender), found.sender);
        } catch (Exception | OutOfMemoryError failure) {
            Settings.hookFailedPrivately(MessageLog.KEY, "Can't keep a face in the message log", failure);
        }
    }

    private static void seal(Context context, File dir, String name, Icon icon) throws Exception {
        File file = new File(dir, name);
        long now = System.currentTimeMillis(), at = file.lastModified();
        if (file.isFile() && now >= at && now - at < FRESH_MS) return;
        Bitmap square = square(context, icon);
        if (square == null) return;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        boolean written = square.compress(Bitmap.CompressFormat.JPEG, 88, out);
        square.recycle();
        if (!written || out.size() == 0 || out.size() > MAX_BYTES) return;
        if (!dir.mkdirs() && !dir.isDirectory()) throw new IOException("can't make " + DIR);
        MessageLog.sealInto(dir, name, out.toByteArray());
    }

    /** [icon] filling a SIZE square, cut to its middle like a profile picture is. Null when it has nothing to draw. */
    static Bitmap square(Context context, Icon icon) {
        Drawable drawable = icon.loadDrawable(context);
        if (drawable == null) return null;
        Bitmap square = Bitmap.createBitmap(SIZE, SIZE, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(square);
        canvas.drawColor(BACKDROP);
        int width = drawable.getIntrinsicWidth(), height = drawable.getIntrinsicHeight();
        if (width > 0 && height > 0) {
            float scale = Math.max(SIZE / (float) width, SIZE / (float) height);
            int across = Math.round(width * scale), down = Math.round(height * scale);
            int left = (SIZE - across) / 2, top = (SIZE - down) / 2;
            drawable.setBounds(left, top, left + across, top + down);
        } else {
            drawable.setBounds(0, 0, SIZE, SIZE);
        }
        drawable.draw(canvas);
        return square;
    }

    /** The face kept under [name], decoded, or null when there's none. Throws {@link MessageLog.Damaged} for one sealed with a key the log no longer has. */
    static Bitmap picture(Context context, String name) throws Exception {
        File file = file(context, name);
        byte[] face = file == null ? null : MessageLog.open(file, MAX_BYTES + SEAL_BYTES);
        return face == null || face.length == 0 ? null : BitmapFactory.decodeByteArray(face, 0, face.length);
    }

    /**
     * Deletes the faces no entry in [oldestFirst] calls for, then the faces of the chats heard from longest ago past
     * MAX_TOTAL_BYTES. A group's message calls for its group's picture and its sender's face, a one-to-one chat's for its
     * chat's.
     */
    static void tidy(Context context, List<MessageLog.Entry> oldestFirst) {
        File dir = new File(context.getFilesDir(), DIR);
        String[] names = dir.list();
        if (names == null) return;
        Set<String> seen = new HashSet<>();
        Set<String> wanted = new LinkedHashSet<>();
        for (int i = oldestFirst.size() - 1; i >= 0; i--) {
            MessageLog.Entry entry = oldestFirst.get(i);
            // Each chat and sender is worked out once, however many messages they have.
            if (!seen.add(entry.thread + (char) 0 + entry.sender)) continue;
            wanted.add(chatName(entry.thread));
            if (!entry.sender.isEmpty()) wanted.add(senderName(entry.thread, entry.sender));
        }
        Set<String> kept = new HashSet<>();
        long total = 0;
        for (String name : wanted) {
            File file = new File(dir, name);
            if (!file.isFile()) continue;
            total += file.length();
            if (total > MAX_TOTAL_BYTES) break;
            kept.add(name);
        }
        for (String name : names) {
            if (kept.contains(name)) continue;
            File file = new File(dir, name);
            if (!file.delete() && file.exists()) {
                Settings.hookFailedPrivately(MessageLog.KEY, "Can't delete a face from the message log", new IOException("delete failed: " + name));
            }
        }
        if (kept.isEmpty() && !dir.delete() && dir.exists()) {
            Settings.hookFailedPrivately(MessageLog.KEY, "Can't delete the message log's faces", new IOException("delete failed: " + DIR));
        }
    }

    /** Deletes every face and the folder. Returns whether none is left. */
    static boolean deleteAll(Context context) {
        File dir = new File(context.getFilesDir(), DIR);
        String[] names = dir.list();
        boolean deleted = true;
        if (names != null) for (String name : names) deleted &= new File(dir, name).delete();
        if (dir.exists()) deleted &= dir.delete();
        if (!deleted) Settings.hookFailedPrivately(MessageLog.KEY, "Can't delete the message log's faces", new IOException("delete failed: " + DIR));
        return deleted;
    }

    /** Every face, opened, for Undo after Clear. One that can't be opened is left out. */
    static Map<String, byte[]> openAll(Context context) {
        Map<String, byte[]> faces = new LinkedHashMap<>();
        String[] names = new File(context.getFilesDir(), DIR).list();
        if (names == null) return faces;
        long total = 0;
        for (String name : names) {
            File file = file(context, name);
            if (file == null) continue;
            try {
                byte[] face = MessageLog.open(file, MAX_BYTES + SEAL_BYTES);
                if (face == null || face.length == 0 || (total += face.length) > MAX_TOTAL_BYTES) continue;
                faces.put(name, face);
            } catch (Exception unreadable) {
                // Its chat comes back with the drawn face.
            }
        }
        return faces;
    }

    /** Seals the faces Undo held under the log's new key. A face kept since the clear is newer, so it stays. */
    static void restore(Context context, Map<String, byte[]> faces) throws Exception {
        if (faces == null || faces.isEmpty()) return;
        File dir = new File(context.getFilesDir(), DIR);
        if (!dir.mkdirs() && !dir.isDirectory()) throw new IOException("can't make " + DIR);
        for (Map.Entry<String, byte[]> face : faces.entrySet()) {
            File file = file(context, face.getKey());
            if (file != null && !file.exists()) MessageLog.sealInto(dir, face.getKey(), face.getValue());
        }
    }
}
