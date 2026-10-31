package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.read.FileTranscript;
import app.morphe.extension.sabp.read.Transcriber;

/**
 * Read-along without a book file: the on-device transcript of the file you're listening to, in
 * paragraphs, with the word being spoken highlighted from Whisper's own word timings. Parts that
 * aren't transcribed yet show as a placeholder.
 */
final class TranscriptAdapter extends BaseAdapter {
    static final class Para {
        long t0, t1;
        String text;
        final List<FileTranscript.Word> words = new ArrayList<>();
        int[] ws, we; // character offsets of each word in text
        boolean pending;
    }

    private final Context c;
    private final EppyTheme t;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService loader = Executors.newSingleThreadExecutor();
    private List<Para> paras = new ArrayList<>();
    private String file, folder;
    private boolean loading;
    /** {transcribed ms, total ms} for the whole book, refreshed with each load. */
    long[] progress = {0, 0};
    float textSp = 18f;
    int curPara = -1, curWord = -1;

    TranscriptAdapter(Context c, EppyTheme t) {
        this.c = c;
        this.t = t;
    }

    String file() {
        return file;
    }

    boolean isEmpty2() {
        return paras.isEmpty();
    }

    Para para(int i) {
        return i >= 0 && i < paras.size() ? paras.get(i) : null;
    }

    /** Reloads the current file's transcript in the background; {@code done} runs on the main thread. */
    void load(EppyBook b, Runnable done) {
        if (b == null || b.currentFile == null || loading) return;
        loading = true;
        final String f = b.currentFile, fo = b.folderUri;
        final Transcriber tr = Transcriber.get(c);
        loader.execute(() -> {
            List<Para> out = build(tr.transcript(fo, f));
            long[] pr = tr.progress(b);
            main.post(() -> {
                loading = false;
                progress = pr;
                boolean switched = !f.equals(file);
                file = f;
                folder = fo;
                paras = out;
                if (switched) {
                    curPara = -1;
                    curWord = -1;
                }
                notifyDataSetChanged();
                if (done != null) done.run();
            });
        });
    }

    static List<Para> build(FileTranscript ft) {
        List<Para> out = new ArrayList<>();
        if (ft == null) return out;
        Para cur = null;
        long lastEnd = -1;
        int segsInPara = 0;
        for (FileTranscript.Seg s : ft.segs) {
            if (s.words.isEmpty()) continue;
            // Untranscribed stretch before this segment.
            if (lastEnd >= 0 ? s.t0 - lastEnd > 20_000 && !ft.isCovered((lastEnd + s.t0) / 2) : s.t0 > 20_000 && !ft.isCovered(s.t0 / 2)) {
                finish(cur, out);
                cur = null;
                Para p = new Para();
                p.pending = true;
                p.t0 = Math.max(0, lastEnd);
                p.t1 = s.t0;
                out.add(p);
            }
            boolean newPara = cur == null || s.t0 - lastEnd > 1500 || segsInPara >= 8
                    || (segsInPara >= 4 && cur.words.size() > 0 && endsSentence(cur.words.get(cur.words.size() - 1).text));
            if (newPara) {
                finish(cur, out);
                cur = new Para();
                cur.t0 = s.t0;
                segsInPara = 0;
            }
            cur.words.addAll(s.words);
            cur.t1 = s.t1;
            segsInPara++;
            lastEnd = s.t1;
        }
        finish(cur, out);
        long tail = Math.max(0, lastEnd);
        if (ft.durationMs > 0 && ft.firstGap(tail) >= 0) {
            Para p = new Para();
            p.pending = true;
            p.t0 = tail;
            p.t1 = ft.durationMs;
            out.add(p);
        }
        return out;
    }

    private static boolean endsSentence(String w) {
        return w.endsWith(".") || w.endsWith("?") || w.endsWith("!") || w.endsWith(".\"") || w.endsWith(".”");
    }

    private static void finish(Para p, List<Para> out) {
        if (p == null || p.words.isEmpty()) return;
        StringBuilder b = new StringBuilder();
        p.ws = new int[p.words.size()];
        p.we = new int[p.words.size()];
        for (int i = 0; i < p.words.size(); i++) {
            if (b.length() > 0) b.append(' ');
            p.ws[i] = b.length();
            b.append(p.words.get(i).text);
            p.we[i] = b.length();
        }
        p.text = b.toString();
        out.add(p);
    }

    /** Refreshes the whole-book progress in the background (for the document view too). */
    void refreshProgress(EppyBook b, Runnable done) {
        if (b == null) return;
        final Transcriber tr = Transcriber.get(c);
        loader.execute(() -> {
            long[] pr = tr.progress(b);
            main.post(() -> {
                progress = pr;
                if (done != null) done.run();
            });
        });
    }

    /** "41 min of 33 h 46 min transcribed (2%)". */
    String progressLabel() {
        long[] pr = progress;
        if (pr[1] <= 0) return "";
        double pct = 100.0 * pr[0] / pr[1];
        String p = pct > 0 && pct < 1 ? "<1%" : Math.round(pct) + "%";
        return span(pr[0]) + " of " + span(pr[1]) + " transcribed (" + p + ")";
    }

    static String span(long ms) {
        long min = ms / 60_000;
        return min >= 60 ? (min / 60) + " h " + (min % 60) + " min" : min + " min";
    }

    /** Updates the current paragraph/word for a position in the file; true when the paragraph changed. */
    boolean setPosition(long ms) {
        int pi = -1;
        int lo = 0, hi = paras.size() - 1;
        while (lo <= hi) {
            int mid = (lo + hi) >>> 1;
            if (paras.get(mid).t0 <= ms) {
                pi = mid;
                lo = mid + 1;
            } else hi = mid - 1;
        }
        int wi = -1;
        Para p = para(pi);
        if (p != null && !p.pending) {
            for (int i = 0; i < p.words.size(); i++) if (p.words.get(i).t0 <= ms) wi = i;
        }
        boolean changed = pi != curPara;
        if (changed || wi != curWord) {
            curPara = pi;
            curWord = wi;
        }
        return changed;
    }

    @Override
    public int getCount() {
        return paras.size();
    }

    @Override
    public Object getItem(int i) {
        return paras.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    @Override
    public View getView(int i, View convert, ViewGroup parent) {
        TextView tv = convert instanceof TextView ? (TextView) convert : new TextView(c);
        tv.setPadding(Ui.dp(c, 12), Ui.dp(c, 8), Ui.dp(c, 12), Ui.dp(c, 8));
        tv.setLineSpacing(0, 1.35f);
        tv.setIncludeFontPadding(false);
        bind(tv, i);
        return tv;
    }

    void bind(TextView tv, int i) {
        Para p = paras.get(i);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, p.pending ? Math.max(13f, textSp - 3) : textSp);
        tv.setTypeface(EppyTheme.font(c, 400), p.pending ? Typeface.ITALIC : Typeface.NORMAL);
        tv.setBackground(null);
        if (p.pending) {
            tv.setTextColor(t.onSurfaceVariant);
            if (i == curPara) {
                tv.setBackground(Ui.rounded(EppyTheme.withAlpha(t.tertiary, 0.10f), Ui.dp(c, 12)));
                tv.setText("You're here, in a part that isn't transcribed yet (" + Ui.time(p.t0) + "–" + Ui.time(p.t1)
                        + "). eppy is working from where you're listening; the text appears here within a minute or two.");
            } else {
                tv.setText(Ui.time(p.t0) + "–" + Ui.time(p.t1) + " · not transcribed yet. It's done a few minutes ahead of where you listen, and the whole book while the phone charges.");
            }
            tv.setContentDescription(tv.getText());
            return;
        }
        boolean current = i == curPara, past = curPara >= 0 && i < curPara;
        if (!current) {
            tv.setTextColor(past ? EppyTheme.withAlpha(t.onSurface, 0.45f) : t.onSurface);
            tv.setText(p.text);
            return;
        }
        tv.setTextColor(t.onSurface);
        tv.setBackground(Ui.rounded(EppyTheme.withAlpha(t.primary, 0.08f), Ui.dp(c, 12)));
        SpannableString s = new SpannableString(p.text);
        if (curWord >= 0 && curWord < p.ws.length) {
            int a = p.ws[curWord], z = p.we[curWord];
            s.setSpan(new BackgroundColorSpan(EppyTheme.withAlpha(t.primary, 0.25f)), a, z, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            s.setSpan(new StyleSpan(Typeface.BOLD), a, z, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            if (z < p.text.length()) s.setSpan(new ForegroundColorSpan(EppyTheme.withAlpha(t.onSurface, 0.75f)), z, p.text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        tv.setText(s);
    }
}
