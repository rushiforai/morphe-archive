/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.graphics.RectF;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import org.robolectric.RuntimeEnvironment;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/** Telegram's file cells, messages and documents as the file icon hooks read them, and a probe for tests outside this package. */
public final class FileIconsForTests {
    /** The resource Telegram's Shared media cell sets for a file's icon. */
    static final int STOCK_ICON = android.R.drawable.ic_dialog_info;

    private FileIconsForTests() {}

    /** With the switch on, an APK in Shared media gets its glyph in place of Telegram's icon. */
    public static boolean on() {
        SharedCellView cell = new SharedCellView(RuntimeEnvironment.getApplication(),
                new Msg(new Doc(1, false, "app.apk", null), null, null));
        FileIcons.sharedIcon(cell.icon, STOCK_ICON);
        return cell.icon.getDrawable() instanceof FileIcons.Glyph && cell.icon.resources.isEmpty();
    }

    /** A document: its server id, whether the server has a thumbnail of it, its name and type. */
    static class Doc implements FileIcons.Document {
        final long id;
        final boolean thumb;
        final String name;
        final String mime;

        Doc(long id, boolean thumb, String name, String mime) {
            this.id = id;
            this.thumb = thumb;
            this.name = name;
            this.mime = mime;
        }

        @Override public long id() { return id; }
        @Override public boolean hasThumb() { return thumb; }
        @Override public String fileName() { return name; }
        @Override public String mime() { return mime; }
    }

    /** A message with its document, the path it was sent from and where its download is kept. */
    static final class Msg implements FileIcons.Message {
        final Object document;
        final String attachPath;
        final File cachePath;
        /** How many times a worker looked for the downloaded file. */
        final AtomicInteger lookedFor = new AtomicInteger();

        Msg(Object document, String attachPath, File cachePath) {
            this.document = document;
            this.attachPath = attachPath;
            this.cachePath = cachePath;
        }

        @Override public Object document() { return document; }
        @Override public String attachPath() { return attachPath; }

        @Override public File cachePath() {
            lookedFor.incrementAndGet();
            return cachePath;
        }
    }

    /** An icon that remembers each resource set on it. */
    static final class IconView extends ImageView {
        final List<Integer> resources = new ArrayList<>();

        IconView(Context context) {
            super(context);
        }

        @Override public void setImageResource(int resId) {
            resources.add(resId);
            super.setImageResource(resId);
        }
    }

    /** A Shared media file cell: the file's icon with its extension label over it. */
    static final class SharedCellView extends FrameLayout implements FileIcons.SharedCell {
        final IconView icon;
        final TextView label;
        Object message;

        SharedCellView(Context context, Object message) {
            super(context);
            this.message = message;
            icon = new IconView(context);
            label = new TextView(context);
            addView(icon, new LayoutParams(120, 120));
            addView(label);
        }

        @Override public Object message() { return message; }
        @Override public Object label() { return label; }
    }

    /** A chat message cell that counts how often it was asked to draw again. */
    static final class ChatView extends View implements FileIcons.ChatCell {
        final Object message;
        int invalidated;

        ChatView(Context context, Object message) {
            super(context);
            this.message = message;
        }

        @Override public Object message() { return message; }

        @Override public void invalidate() {
            invalidated++;
            super.invalidate();
        }
    }

    /** A chat file's circle: the icon it shows, the cell it's drawn in and where. */
    static final class Circle implements FileIcons.Progress {
        final int icon;
        final Object parent;
        final RectF rect;

        Circle(int icon, Object parent, RectF rect) {
            this.icon = icon;
            this.parent = parent;
            this.rect = rect;
        }

        @Override public int icon() { return icon; }
        @Override public Object parent() { return parent; }
        @Override public RectF rect() { return rect; }
    }
}
