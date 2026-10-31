package app.morphe.extension.sabp.ui;

import android.app.Service;
import android.text.format.DateUtils;
import android.widget.LinearLayout;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyPlayer;

/**
 * History, from SABP's own data:
 * <ul>
 *     <li>Recently played books (each book's last-played time in SABP's library), with resume;</li>
 *     <li>this book's position history: SABP's list of starts, pauses, jumps and skips since the
 *     book was opened in this session (SABP keeps it in memory only), tap to go back there —
 *     the same list as the classic History screen, used to undo an accidental jump.</li>
 * </ul>
 */
public final class HistoryPage extends Page {
    public static final String KEY = "history";

    public HistoryPage(Host host) {
        super(host, KEY, null, "History", true);
        build();
    }

    private void build() {
        body.removeAllViews();
        EppyPlayer p = host.player();

        sectionTitle("This book");
        LinearLayout pos = card();
        List<Object[]> nodes = positionHistory();
        EppyBook b = p.book();
        if (b == null) note(pos, "No book playing.");
        else if (nodes.isEmpty()) note(pos, "No position changes yet in this session. SABP records starts, pauses, rewinds, skips and jumps here while the app is running.");
        else {
            note(pos, "Tap an entry to go back to that moment. SABP keeps this list until the app is closed.");
            int shown = 0;
            for (int i = nodes.size() - 1; i >= 0 && shown < 60; i--, shown++) {
                Object[] n = nodes.get(i);
                String action = (String) n[0];
                String file = (String) n[1];
                int at = (Integer) n[2];
                EppyBook.FileItem f = b.file(file);
                int bookPos = f != null && f.start >= 0 ? f.start + at : -1;
                String where = bookPos >= 0 ? Ui.time(bookPos * 1000L) : Ui.time(at * 1000L) + (file != null ? " · " + file : "");
                pos.addView(Ui.linkRow(c, t, icon(action), actionName(action), where, v -> {
                    Ui.haptic(v, t);
                    p.jumpTo(file, at, p.isPlaying());
                }));
            }
        }

        sectionTitle("Recently played");
        LinearLayout recent = card();
        ArrayList<EppyPlayer.Book> books = new ArrayList<>(p.allBooks());
        books.removeIf(x -> x.lastPlayed <= 0);
        Collections.sort(books, (x, y) -> Long.compare(y.lastPlayed, x.lastPlayed));
        if (books.isEmpty()) note(recent, "Books you play show up here.");
        for (EppyPlayer.Book bk : books) {
            String when = DateUtils.getRelativeTimeSpanString(bk.lastPlayed, System.currentTimeMillis(), DateUtils.MINUTE_IN_MILLIS).toString();
            float pr = bk.progress();
            String sub = when + (pr >= 0 ? " · " + Math.round(pr * 100) + "%" : "")
                    + (bk.length > 0 && bk.position >= 0 ? " · " + Ui.duration(Math.max(0, bk.length - bk.position)) + " left" : "");
            recent.addView(Ui.linkRow(c, t, EppyIcon.PLAY, bk.title, sub, v -> host.playBook(bk, true)));
        }
    }

    private static int icon(String action) {
        switch (action) {
            case "Back":
                return EppyIcon.REWIND;
            case "Fwd":
                return EppyIcon.FORWARD;
            case "Next":
            case "Prev":
                return EppyIcon.SKIP_NEXT;
            case "Pause":
                return EppyIcon.PAUSE;
            case "Sleep":
                return EppyIcon.MOON;
            case "Start":
                return EppyIcon.PLAY;
            default:
                return EppyIcon.HISTORY;
        }
    }

    private static String actionName(String action) {
        switch (action) {
            case "Start":
                return "Started playing";
            case "Pause":
                return "Paused";
            case "Back":
                return "Rewound";
            case "Fwd":
                return "Skipped forward";
            case "Next":
                return "Next file";
            case "Prev":
                return "Previous file";
            case "ManualSetPosition":
                return "Moved the position";
            case "Sleep":
                return "Sleep timer stopped playback";
            default:
                return action;
        }
    }

    /** {action, file, seconds} of the current book's BookHistoryNode list (in memory in SABP). */
    static List<Object[]> positionHistory() {
        ArrayList<Object[]> out = new ArrayList<>();
        Service s = EppyBridge.getPlayerService();
        if (s == null) return out;
        try {
            Object bookData = null;
            for (Field f : s.getClass().getDeclaredFields()) {
                if (f.getType().getName().equals(EppyBridge.SABP_PACKAGE + ".BookData")) {
                    f.setAccessible(true);
                    bookData = f.get(s);
                }
            }
            if (bookData == null) return out;
            String nodeClass = EppyBridge.SABP_PACKAGE + ".BookHistoryNode";
            for (Field f : bookData.getClass().getDeclaredFields()) {
                if (!Modifier.isTransient(f.getModifiers()) || !List.class.isAssignableFrom(f.getType())) continue;
                f.setAccessible(true);
                Object v = f.get(bookData);
                if (!(v instanceof List)) continue;
                for (Object n : new ArrayList<>((List<?>) v)) {
                    if (n == null || !n.getClass().getName().equals(nodeClass)) continue;
                    out.add(new Object[]{String.valueOf(get(n, "mAction")), (String) get(n, "mFileName"), toInt(get(n, "mFilePosition"))});
                }
            }
        } catch (Throwable ignored) {
        }
        return out;
    }

    private static Object get(Object o, String name) {
        try {
            Field f = o.getClass().getDeclaredField(name);
            f.setAccessible(true);
            return f.get(o);
        } catch (Throwable t) {
            return null;
        }
    }

    private static int toInt(Object o) {
        return o instanceof Integer ? (Integer) o : 0;
    }
}
