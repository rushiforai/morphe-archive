package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.pdf.PdfRenderer;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import app.morphe.extension.sabp.EppyBook;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;
import app.morphe.extension.sabp.read.BookText;
import app.morphe.extension.sabp.read.ModelStore;
import app.morphe.extension.sabp.read.ReadAlong;
import app.morphe.extension.sabp.read.Transcriber;

/**
 * Read along: the paired EPUB/PDF follows the narration. The highlight is honest about accuracy:
 * the current sentence is emphasised only when the position comes from matched audio or exact
 * book timings; when it's an estimate the whole paragraph gets a soft highlight instead.
 */
public final class ReadTab implements PlayerSheet.Tab, ReadAlong.Listener {
    private final Host host;
    private final Context c;
    private final EppyTheme t;
    private final ReadAlong ra;
    private final FrameLayout root;
    private final LinearLayout statusBar;
    private final View statusDot;
    private final TextView statusText;
    private final LinearLayout actions;
    private final ListView list;
    private final LinearLayout empty;
    private final TextView backToCurrent;
    private BookText text;
    private int unit = -1;       // current word (or page)
    private int[] sentence = {-1, -1};
    private long userScrolledAt;
    private float textSp;
    private PdfPages pdf;
    private final Transcriber tr;
    private final TranscriptAdapter tAdapter;
    private boolean transcriptMode;
    private long lastTrRebuild, lastProgressAt;

    public ReadTab(Host host, EppyTheme t) {
        this.host = host;
        this.c = host.activity();
        this.t = t;
        this.ra = ReadAlong.get(c);
        textSp = EppyTheme.prefs(c).getFloat("readSize", 18f);
        tr = Transcriber.get(c);
        tAdapter = new TranscriptAdapter(c, t);
        tAdapter.textSp = textSp;
        root = new FrameLayout(c);
        LinearLayout col = Ui.column(c);
        root.addView(col);

        statusBar = Ui.row(c);
        statusBar.setPadding(Ui.dp(c, 20), Ui.dp(c, 2), Ui.dp(c, 16), Ui.dp(c, 6));
        statusDot = new View(c);
        statusBar.addView(statusDot, new LinearLayout.LayoutParams(Ui.dp(c, 8), Ui.dp(c, 8)));
        statusText = Ui.text(c, t, "", 12, 500, t.onSurfaceVariant);
        statusText.setPadding(Ui.dp(c, 8), 0, 0, 0);
        statusText.setMaxLines(2);
        statusBar.addView(statusText, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        statusBar.addView(Ui.iconButton(c, t, EppyIcon.MORE, t.onSurfaceVariant, 0, "Read along options", v -> options()));
        col.addView(statusBar);

        android.widget.HorizontalScrollView hs = new android.widget.HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        actions = Ui.row(c);
        actions.setPadding(Ui.dp(c, 16), 0, Ui.dp(c, 16), Ui.dp(c, 6));
        hs.addView(actions);
        col.addView(hs);

        list = SheetTabs.list(c);
        list.setPadding(Ui.dp(c, 12), Ui.dp(c, 8), Ui.dp(c, 12), Ui.dp(c, 120));
        list.setAdapter(adapter);
        list.setOnScrollListener(new AbsListView.OnScrollListener() {
            public void onScrollStateChanged(AbsListView v, int state) {
                if (state == SCROLL_STATE_TOUCH_SCROLL) userScrolledAt = SystemClock.elapsedRealtime();
            }

            public void onScroll(AbsListView v, int a, int b, int n) {
            }
        });
        list.setOnItemClickListener((p, v, pos, id) -> {
            if (transcriptMode) jumpToTranscript(pos);
            else jumpToPara(pos);
        });
        list.setOnItemLongClickListener((p, v, pos, id) -> {
            if (transcriptMode) {
                transcriptSheet(pos);
                return true;
            }
            paraSheet(pos);
            return true;
        });
        col.addView(list, Ui.lp(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

        empty = Ui.column(c);
        empty.setGravity(Gravity.CENTER_HORIZONTAL);
        empty.setPadding(Ui.dp(c, 32), Ui.dp(c, 24), Ui.dp(c, 32), Ui.dp(c, 24));
        root.addView(empty, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        backToCurrent = Ui.text(c, t, "Back to now", 14, 600, t.onPrimary);
        backToCurrent.setBackground(Ui.ripple(t, Ui.rounded(t.primary, Ui.dp(c, 20)), Ui.dp(c, 20)));
        backToCurrent.setPadding(Ui.dp(c, 20), Ui.dp(c, 10), Ui.dp(c, 20), Ui.dp(c, 10));
        backToCurrent.setVisibility(View.GONE);
        backToCurrent.setOnClickListener(v -> {
            userScrolledAt = 0;
            follow(true);
        });
        FrameLayout.LayoutParams bl = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        bl.bottomMargin = Ui.dp(c, 72);
        root.addView(backToCurrent, bl);
        ra.addListener(this);
        tr.addListener(this::onTranscriberChanged);
    }

    private void onTranscriberChanged() {
        long now = SystemClock.elapsedRealtime();
        if (now - lastTrRebuild < 1500) return;
        lastTrRebuild = now;
        rebuild();
    }

    @Override
    public View view() {
        return root;
    }

    @Override
    public void onReadAlongChanged() {
        rebuild();
    }

    private void rebuild() {
        if (!ra.enabled()) {
            list.setVisibility(View.GONE);
            statusBar.setVisibility(View.GONE);
            actions.removeAllViews();
            empty.setVisibility(View.VISIBLE);
            empty.removeAllViews();
            TextView h = Ui.text(c, t, "Read along is turned off", 19, 650, t.onSurface);
            h.setGravity(Gravity.CENTER);
            empty.addView(h);
            TextView p = Ui.text(c, t, "It was switched off in Settings → Diagnostics → Feature switches. Your pairings are kept.", 14, 400, t.onSurfaceVariant);
            p.setGravity(Gravity.CENTER);
            p.setPadding(0, Ui.dp(c, 8), 0, Ui.dp(c, 16));
            empty.addView(p);
            empty.addView(Ui.filledButton(c, t, "Open Diagnostics", v -> host.pushPage(DiagnosticsPage.KEY, null)));
            return;
        }
        EppyBook bk = host.player().book();
        boolean asr = bk != null && tr.enabled(bk.folderUri);
        boolean tMode = asr && !ra.hasDocument();
        if (tMode != transcriptMode) {
            transcriptMode = tMode;
            list.setAdapter(tMode ? tAdapter : adapter);
        }
        if (tMode) {
            rebuildTranscript(bk);
            return;
        }
        BookText nt = ra.text();
        if (nt != text) {
            text = nt;
            pdf = null;
            if (text != null && text.pagesOnly && ra.docUri() != null) pdf = new PdfPages(c, Uri.parse(ra.docUri()));
            unit = -1;
            adapter.notifyDataSetChanged();
        }
        ReadAlong.State s = ra.state();
        boolean showText = text != null && s != ReadAlong.State.ERROR;
        list.setVisibility(showText ? View.VISIBLE : View.GONE);
        empty.setVisibility(showText ? View.GONE : View.VISIBLE);
        statusBar.setVisibility(s == ReadAlong.State.NONE && ra.interruptedNotice() == null ? View.GONE : View.VISIBLE);
        int dot;
        String label;
        double pos = host.player().bookPositionSeconds();
        int level = pos >= 0 && text != null ? ra.levelAt(pos) : 0;
        switch (s) {
            case WORKING:
                dot = t.tertiary;
                label = ra.stage();
                break;
            case LOADING:
                dot = t.tertiary;
                label = ra.stage().isEmpty() ? "Loading" : ra.stage();
                break;
            case ERROR:
                dot = 0xFFE5484D;
                label = ra.errorTitle() != null ? ra.errorTitle() : "Problem";
                break;
            default:
                dot = level >= 2 ? t.primary : t.outline;
                label = level == 2 && ra.transcriptPassages() > 0 ? "Matched to the transcript" : levelName(level);
        }
        android.graphics.drawable.GradientDrawable d = new android.graphics.drawable.GradientDrawable();
        d.setShape(android.graphics.drawable.GradientDrawable.OVAL);
        d.setColor(dot);
        statusDot.setBackground(d);
        String msg = ra.interruptedNotice() != null ? ra.interruptedNotice() : ra.message();
        if (asr && s == ReadAlong.State.READY) {
            msg = (msg.isEmpty() ? "" : msg + " · ") + transcriberStatus(bk);
            long now = SystemClock.elapsedRealtime();
            if (now - lastProgressAt > 10_000) {
                lastProgressAt = now;
                tAdapter.refreshProgress(bk, null);
                if (ra.transcriptPassages() == 0) ra.refreshTranscriptMatches();
            }
        }
        statusText.setText(label + (msg.isEmpty() ? "" : " · " + msg));
        statusText.setMaxLines(4);
        statusText.setContentDescription("Read along status: " + statusText.getText());

        actions.removeAllViews();
        if (s == ReadAlong.State.WORKING || s == ReadAlong.State.LOADING) {
            addAction(Ui.chip(c, t, EppyIcon.CLOSE, "Stop", false, v -> ra.cancel()));
        }
        if (ra.interruptedNotice() != null) {
            addAction(Ui.chip(c, t, EppyIcon.CHECK, "OK", false, v -> ra.dismissInterruptedNotice()));
            addAction(Ui.chip(c, t, EppyIcon.HISTORY, "Rebuild", false, v -> {
                ra.dismissInterruptedNotice();
                ra.rebuild();
            }));
        }
        if (showText && !text.pagesOnly && !ra.alignment().hasOverlay() && s == ReadAlong.State.READY && ra.speechSupported()) {
            addAction(Ui.chip(c, t, EppyIcon.HEADPHONES, "Match by listening", false,
                    v -> host.ensureSpeechPermission(() -> ra.matchNow(host.player().bookPositionSeconds()))));
        }
        if (showText && !text.pagesOnly && bk != null && !asr) {
            addAction(Ui.chip(c, t, EppyIcon.SUBTITLES, "Transcribe for accuracy", false, v -> startTranscript(false)));
        }
        if (asr) addTranscriberActions();
        if (showText) {
            addAction(Ui.chip(c, t, 0, "A–", false, v -> setSize(textSp - 2)));
            addAction(Ui.chip(c, t, 0, "A+", false, v -> setSize(textSp + 2)));
        }

        empty.removeAllViews();
        if (!showText) {
            ImageView iv = new ImageView(c);
            iv.setImageDrawable(new EppyIcon(EppyIcon.LIBRARY, t.primary));
            empty.addView(iv, new LinearLayout.LayoutParams(Ui.dp(c, 48), Ui.dp(c, 48)));
            boolean err = s == ReadAlong.State.ERROR;
            TextView h = Ui.text(c, t, err ? (ra.errorTitle() != null ? ra.errorTitle() : "Couldn't use that file")
                    : s == ReadAlong.State.LOADING ? ra.stage() : "Read along with the book", 19, 650, t.onSurface);
            h.setGravity(Gravity.CENTER);
            h.setPadding(0, Ui.dp(c, 16), 0, Ui.dp(c, 8));
            empty.addView(h);
            TextView p = Ui.text(c, t, err || s == ReadAlong.State.LOADING ? ra.message()
                    : "Pair an EPUB or PDF of this book. eppy reads it on your phone, lines its chapters up with the audiobook's chapters, and follows along. You can correct the position by long-pressing a paragraph. Optional: match by listening to short clips with Android's on-device speech recogniser. Nothing is uploaded.",
                    14, 400, t.onSurfaceVariant);
            p.setGravity(Gravity.CENTER);
            p.setLineSpacing(Ui.dp(c, 3), 1f);
            empty.addView(p);
            if (!err && s != ReadAlong.State.LOADING && !ra.hasDocument() && bk != null) {
                h.setText("Make a read-along?");
                p.setText("eppy can listen to this audiobook on your phone and write down what's said, with the time of every word. "
                        + "It takes a while, so it runs in the background while you listen: a few minutes ahead of you on battery, "
                        + "and the whole book while the phone charges. Nothing is uploaded.\n\n"
                        + "Adding the book's EPUB or PDF makes it faster to follow and more accurate: eppy uses it as a reference for "
                        + "names and to find its place (it isn't copied word for word), then shows the book's own text. "
                        + "The transcript and the matched copy are saved in the audiobook's folder.");
                LinearLayout buttons = Ui.column(c);
                buttons.setGravity(Gravity.CENTER_HORIZONTAL);
                buttons.addView(Ui.filledButton(c, t, "Start read-along", v -> startTranscript(false)), fullWidth(0));
                buttons.addView(Ui.textButton(c, t, "Start with an EPUB or PDF", v -> startTranscript(true)), fullWidth(8));
                buttons.addView(Ui.textButton(c, t, "Use an EPUB or PDF only", v -> host.pickDocument()), fullWidth(0));
                TextView note = Ui.text(c, t, "The last option skips transcription: it follows the book by its length and chapter names, and you correct it by long-pressing.", 12, 400, t.onSurfaceVariant);
                note.setGravity(Gravity.CENTER);
                buttons.addView(note, fullWidth(4));
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.topMargin = Ui.dp(c, 20);
                empty.addView(buttons, lp);
            } else if (s != ReadAlong.State.LOADING) {
                LinearLayout buttons = Ui.row(c);
                buttons.setGravity(Gravity.CENTER);
                buttons.addView(Ui.filledButton(c, t, err ? "Choose another file" : "Choose EPUB or PDF", v -> host.pickDocument()));
                if (err && ra.hasDocument()) {
                    buttons.addView(Ui.space(c, 8, 1));
                    buttons.addView(Ui.textButton(c, t, "Retry", v -> ra.rebuild()));
                    buttons.addView(Ui.textButton(c, t, "Remove pairing", v -> ra.unpair()));
                }
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.topMargin = Ui.dp(c, 20);
                empty.addView(buttons, lp);
            }
        }
        refresh(false);
    }

    private LinearLayout.LayoutParams fullWidth(int topDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = Ui.dp(c, topDp);
        return lp;
    }

    private void addAction(View chip) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.rightMargin = Ui.dp(c, 8);
        actions.addView(chip, lp);
    }

    static String levelName(int level) {
        switch (level) {
            case 4:
                return "Exact";
            case 3:
                return "Manually corrected";
            case 2:
                return "Confirmed by listening";
            case 1:
                return "Approximate";
            default:
                return "Estimated";
        }
    }

    private void setSize(float sp) {
        textSp = Math.max(13f, Math.min(34f, sp));
        EppyTheme.prefs(c).edit().putFloat("readSize", textSp).apply();
        tAdapter.textSp = textSp;
        adapter.notifyDataSetChanged();
        tAdapter.notifyDataSetChanged();
    }

    // ---- the on-device transcript ---------------------------------------------------------------

    private void rebuildTranscript(EppyBook bk) {
        statusBar.setVisibility(View.VISIBLE);
        android.graphics.drawable.GradientDrawable d = new android.graphics.drawable.GradientDrawable();
        d.setShape(android.graphics.drawable.GradientDrawable.OVAL);
        Transcriber.State st = tr.state();
        boolean problem = st == Transcriber.State.ERROR || tr.stoppedAfterCrash() || tr.downloadError() != null;
        d.setColor(problem ? 0xFFE5484D : st == Transcriber.State.WORKING || tr.downloadProgress() >= 0 ? t.tertiary : t.primary);
        statusDot.setBackground(d);
        statusText.setText("Transcript · " + transcriberStatus(bk));
        statusText.setContentDescription("Read along status: " + statusText.getText());
        actions.removeAllViews();
        addTranscriberActions();
        addAction(Ui.chip(c, t, EppyIcon.BOOK, "Add EPUB or PDF", false, v -> host.pickDocument()));
        addAction(Ui.chip(c, t, 0, "A–", false, v -> setSize(textSp - 2)));
        addAction(Ui.chip(c, t, 0, "A+", false, v -> setSize(textSp + 2)));
        tr.ensureRunning();
        tAdapter.load(bk, () -> {
            boolean has = !tAdapter.isEmpty2();
            list.setVisibility(has ? View.VISIBLE : View.GONE);
            empty.setVisibility(has ? View.GONE : View.VISIBLE);
            if (!has) {
                empty.removeAllViews();
                TextView h = Ui.text(c, t, "Making the read-along", 19, 650, t.onSurface);
                h.setGravity(Gravity.CENTER);
                empty.addView(h);
                TextView p = Ui.text(c, t, "The first minutes appear here as soon as they're transcribed. Keep listening; "
                        + "it works a little ahead of you. " + transcriberStatus(bk), 14, 400, t.onSurfaceVariant);
                p.setGravity(Gravity.CENTER);
                p.setPadding(0, Ui.dp(c, 8), 0, 0);
                empty.addView(p);
            }
            refresh(false);
        });
    }

    private String transcriberStatus(EppyBook bk) {
        if (tr.downloadProgress() >= 0) return "Downloading the speech model · " + Math.round(tr.downloadProgress() * 100) + "%";
        if (tr.downloadError() != null) return tr.downloadError();
        if (tr.stoppedAfterCrash()) return "Transcription stopped after repeated problems";
        String pct = tAdapter.progressLabel();
        if (tr.boosted()) pct = (pct.isEmpty() ? "" : pct + " · ") + "sped up for " + Math.max(1, tr.boostRemainingMs() / 60_000) + " more min";
        switch (tr.state()) {
            case NO_MODEL:
                return "The speech model isn't downloaded";
            case WORKING:
                String sp = tr.speedLabel();
                return "Transcribing" + (pct.isEmpty() ? "" : " · " + pct) + (sp != null ? " · " + sp : "");
            case AHEAD:
                return "Ahead of you" + (pct.isEmpty() ? "" : " · " + pct) + " · the rest while charging";
            case DONE:
                return "The whole book is transcribed";
            case PAUSED_BATTERY:
            case PAUSED_HEAT:
            case ERROR:
                return tr.stateDetail() + (pct.isEmpty() ? "" : " · " + pct);
            case WAITING:
                return "Waits while nothing is playing" + (pct.isEmpty() ? "" : " · " + pct);
            default:
                return pct.isEmpty() ? "Starting" : pct;
        }
    }

    private void addTranscriberActions() {
        if (tr.downloadProgress() >= 0) {
            addAction(Ui.chip(c, t, EppyIcon.CLOSE, "Cancel download", false, v -> tr.cancelDownload()));
        } else if (!tr.modelReady()) {
            addAction(Ui.chip(c, t, EppyIcon.DOWNLOAD, "Download speech model", false, v -> askDownload(null)));
        } else if (tr.stoppedAfterCrash()) {
            addAction(Ui.chip(c, t, EppyIcon.REFRESH, "Try again", false, v -> tr.resetCrashes()));
        }
        if (tr.modelReady() && !tr.stoppedAfterCrash() && tr.state() != Transcriber.State.DONE) {
            addAction(Ui.chip(c, t, EppyIcon.SPEED, tr.boosted() ? "Sped up" : "Speed up", tr.boosted(), v -> {
                boolean on = !tr.boosted();
                tr.boost(on ? 30 * 60_000L : 0);
                if (on) Toast.makeText(c, "Transcribing at full speed for 30 minutes. Uses more battery.", Toast.LENGTH_SHORT).show();
                rebuild();
            }));
        }
    }

    /** "Start read-along": switches transcription on for this book, asking to download the model first. */
    private void startTranscript(boolean withDocument) {
        EppyBook bk = host.player().book();
        if (bk == null) return;
        Runnable go = () -> {
            tr.setEnabled(bk.folderUri, true);
            if (withDocument) host.pickDocument();
            rebuild();
        };
        if (tr.modelReady()) go.run();
        else askDownload(go);
    }

    private void askDownload(Runnable then) {
        Sheet sh = new Sheet(host.overlayRoot(), t, "Download the speech model?");
        TextView body = Ui.text(c, t, "To transcribe on your phone, eppy needs a speech model (Whisper, by OpenAI, run with whisper.cpp). "
                + "It's downloaded once from whisper.cpp's model page on Hugging Face and stays on this phone; your audio never leaves it."
                + (ModelStore.metered(c) ? "\n\nYou're on a metered connection (mobile data)." : ""), 14, 400, t.onSurfaceVariant);
        body.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 8));
        sh.content().addView(body);
        for (ModelStore.Model m : ModelStore.MODELS) {
            sh.item(EppyIcon.DOWNLOAD, m.label + " · " + m.sizeLabel(), m == ModelStore.BASE ? "Recommended" : null, () -> {
                tr.setModel(m);
                if (then != null) then.run();
                tr.downloadModel(null);
                rebuild();
            });
        }
        sh.item(EppyIcon.CLOSE, "Not now", null, () -> {
        });
        sh.show();
    }

    private void transcriptSheet(int pos) {
        TranscriptAdapter.Para p = tAdapter.para(pos);
        if (p == null || p.pending) return;
        new Sheet(host.overlayRoot(), t, Ui.time(p.t0))
                .item(EppyIcon.PLAY, "Play from here", null, () -> jumpToTranscript(pos))
                .item(EppyIcon.COPY, "Copy text", null, () -> {
                    android.content.ClipboardManager cm = (android.content.ClipboardManager) c.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (cm != null) cm.setPrimaryClip(android.content.ClipData.newPlainText("Transcript", p.text));
                    Toast.makeText(c, "Copied", Toast.LENGTH_SHORT).show();
                })
                .item(EppyIcon.SHARE, "Share", null, () -> {
                    android.content.Intent i = new android.content.Intent(android.content.Intent.ACTION_SEND);
                    i.setType("text/plain");
                    EppyBook bk = host.player().book();
                    i.putExtra(android.content.Intent.EXTRA_TEXT, p.text + (bk != null && bk.folderName != null ? "\n— " + bk.folderName + ", " + Ui.time(p.t0) : ""));
                    try {
                        c.startActivity(android.content.Intent.createChooser(i, "Share"));
                    } catch (Throwable ignored) {
                    }
                })
                .show();
    }

    private void jumpToTranscript(int pos) {
        TranscriptAdapter.Para p = tAdapter.para(pos);
        if (p == null || tAdapter.file() == null) return;
        EppyPlayer pl = host.player();
        if (pl.jumpTo(tAdapter.file(), (int) (p.t0 / 1000), pl.isPlaying())) userScrolledAt = 0;
    }

    private void refreshTranscript() {
        EppyPlayer pl = host.player();
        EppyBook bk = pl.book();
        if (bk == null) return;
        if (bk.currentFile != null && !bk.currentFile.equals(tAdapter.file())) {
            tAdapter.load(bk, () -> refresh(false));
            return;
        }
        double fp = pl.filePositionSeconds();
        if (fp < 0) return;
        int old = tAdapter.curPara, oldWord = tAdapter.curWord;
        boolean paraChanged = tAdapter.setPosition((long) (fp * 1000));
        if (paraChanged || oldWord != tAdapter.curWord) {
            updateTRow(old);
            updateTRow(tAdapter.curPara);
        }
        if (paraChanged && SystemClock.elapsedRealtime() - userScrolledAt >= 8000 && tAdapter.curPara >= 0) {
            if (t.reduceMotion) list.setSelectionFromTop(tAdapter.curPara, list.getHeight() / 4);
            else list.smoothScrollToPositionFromTop(tAdapter.curPara, list.getHeight() / 4, 300);
        }
        int cp = tAdapter.curPara;
        boolean away = SystemClock.elapsedRealtime() - userScrolledAt < 8000 && cp >= 0
                && (cp < list.getFirstVisiblePosition() || cp > list.getLastVisiblePosition());
        backToCurrent.setVisibility(away ? View.VISIBLE : View.GONE);
    }

    private void updateTRow(int i) {
        if (i < 0) return;
        View row = list.getChildAt(i - list.getFirstVisiblePosition());
        if (row instanceof TextView) tAdapter.bind((TextView) row, i);
    }

    @Override
    public void refresh(boolean full) {
        if (transcriptMode && !full) {
            refreshTranscript();
            return;
        }
        if (full) {
            EppyPlayer p = host.player();
            if (p.book() != null) ra.openBook(p.book().folderUri);
            rebuild();
            return;
        }
        if (text == null) return;
        double pos = host.player().bookPositionSeconds();
        if (pos < 0) return;
        int u = ra.unitAt(pos);
        if (u != unit) {
            int oldPara = unit >= 0 ? paraOf(unit) : -1;
            unit = u;
            sentence = text.pagesOnly ? new int[]{u, u} : text.sentence(u);
            int newPara = paraOf(u);
            updateRow(oldPara);
            updateRow(newPara);
            if (oldPara != newPara) follow(false);
        }
        boolean away = SystemClock.elapsedRealtime() - userScrolledAt < 8000 && !isVisible(paraOf(unit));
        backToCurrent.setVisibility(away ? View.VISIBLE : View.GONE);
    }

    private int paraOf(int u) {
        if (text == null) return 0;
        return text.pagesOnly ? Math.max(0, Math.min(text.paras.size() - 1, u)) : text.paraOfWord(u);
    }

    private boolean isVisible(int para) {
        return para >= list.getFirstVisiblePosition() && para <= list.getLastVisiblePosition();
    }

    private void follow(boolean force) {
        if (transcriptMode) {
            if (tAdapter.curPara >= 0) list.setSelectionFromTop(tAdapter.curPara, list.getHeight() / 4);
            return;
        }
        if (text == null || unit < 0) return;
        if (!force && SystemClock.elapsedRealtime() - userScrolledAt < 8000) return;
        int para = paraOf(unit);
        if (t.reduceMotion || force) list.setSelectionFromTop(para, list.getHeight() / 4);
        else list.smoothScrollToPositionFromTop(para, list.getHeight() / 4, 300);
    }

    private void updateRow(int para) {
        if (para < 0) return;
        View row = list.getChildAt(para - list.getFirstVisiblePosition());
        if (row instanceof TextView) bindText((TextView) row, para);
    }

    /** Sentence highlighting only where the position is confirmed, manual or exact. */
    private boolean precise() {
        double pos = host.player().bookPositionSeconds();
        return pos >= 0 && ra.levelAt(pos) >= 2;
    }

    private void bindText(TextView tv, int pos) {
        BookText.Para para = text.paras.get(pos);
        boolean current = unit >= 0 && paraOf(unit) == pos;
        boolean past = unit >= 0 && pos < paraOf(unit);
        int base = past ? EppyTheme.withAlpha(t.onSurface, 0.45f) : t.onSurface;
        tv.setTextColor(current ? t.onSurface : base);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, para.heading ? textSp + 4 : textSp);
        tv.setTypeface(EppyTheme.font(c, para.heading ? 650 : 400));
        if (current && !precise()) {
            // Estimate only: highlight the paragraph, not a sentence we can't vouch for.
            tv.setBackground(Ui.rounded(EppyTheme.withAlpha(t.primary, 0.10f), Ui.dp(c, 12)));
            tv.setText(para.text);
        } else if (current && para.wordCount > 0) {
            tv.setBackground(null);
            SpannableString s = new SpannableString(para.text);
            int a = Math.max(para.firstWord, sentence[0]), b = Math.min(para.firstWord + para.wordCount - 1, sentence[1]);
            if (a <= b) {
                int from = text.wordStart[a], to = text.wordEnd[b];
                to = extendToPunctuation(para.text, to);
                s.setSpan(new ForegroundColorSpan(t.onSurface), from, to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                s.setSpan(new BackgroundColorSpan(EppyTheme.withAlpha(t.primary, 0.18f)), from, to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                s.setSpan(new android.text.style.StyleSpan(Typeface.BOLD), from, to, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                if (from > 0) s.setSpan(new ForegroundColorSpan(EppyTheme.withAlpha(t.onSurface, 0.55f)), 0, from, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                if (to < para.text.length()) s.setSpan(new ForegroundColorSpan(EppyTheme.withAlpha(t.onSurface, 0.75f)), to, para.text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            tv.setText(s);
        } else {
            tv.setBackground(null);
            tv.setText(para.text);
        }
    }

    private static int extendToPunctuation(String s, int to) {
        while (to < s.length() && ".,!?;:”’\"')".indexOf(s.charAt(to)) >= 0) to++;
        return to;
    }

    private void jumpToPara(int pos) {
        if (text == null) return;
        int u = text.pagesOnly ? pos : text.paras.get(pos).firstWord;
        double sec = ra.timeOfUnit(u);
        if (host.player().jumpToBook(sec)) {
            userScrolledAt = 0;
            if (!precise()) Toast.makeText(c, "Jumped to the estimated spot. Long-press a paragraph to correct it.", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(c, "Couldn't jump: the book's length isn't known yet", Toast.LENGTH_SHORT).show();
        }
    }

    private void paraSheet(int pos) {
        new Sheet(host.overlayRoot(), t, null)
                .item(EppyIcon.CHECK, "I'm hearing this now", "Corrects the sync to this " + (text.pagesOnly ? "page" : "paragraph"), () -> {
                    int u = text.pagesOnly ? pos : text.paras.get(pos).firstWord;
                    if (!ra.syncHere(u, host.player().bookPositionSeconds())) {
                        Toast.makeText(c, "Not saved: this conflicts with the book's exact timings.", Toast.LENGTH_SHORT).show();
                    }
                    unit = -1;
                    refresh(false);
                })
                .item(EppyIcon.PLAY, "Play from here", precise() ? null : "Estimated position", () -> jumpToPara(pos))
                .show();
    }

    private void options() {
        Sheet sh = new Sheet(host.overlayRoot(), t, ra.docName());
        sh.item(EppyIcon.FOLDER, ra.hasDocument() ? "Pair a different file" : "Add the book's EPUB or PDF",
                ra.hasDocument() ? null : "Used as a reference: names, and finding its place in the book", host::pickDocument);
        if (ra.speechSupported()) {
            sh.item(EppyIcon.HEADPHONES, ra.autoSyncEnabled() ? "Turn off automatic matching" : "Turn on automatic matching",
                    "Every ~2 min of playback, listens to a 10 s clip of the audiobook file with Android's on-device recogniser. Requires the microphone permission (Android's rule for its speech service). The mic itself isn't used.",
                    () -> {
                        if (ra.autoSyncEnabled()) ra.setAutoSync(false);
                        else host.ensureSpeechPermission(() -> ra.setAutoSync(true));
                    });
        }
        EppyBook bk = host.player().book();
        if (bk != null && tr.enabled(bk.folderUri)) {
            if (tr.modelReady()) {
                sh.item(EppyIcon.SPEED, tr.boosted() ? "Back to gentle background work" : "Speed up for 30 minutes",
                        tr.boosted() ? null : "Works like while charging: more cores, no rests. Uses more battery", () -> {
                            tr.boost(tr.boosted() ? 0 : 30 * 60_000L);
                            rebuild();
                        });
            }
            sh.item(EppyIcon.CLOSE, "Stop transcribing this book", "What's done is kept; turn it on again any time", () -> {
                tr.setEnabled(bk.folderUri, false);
                rebuild();
            });
            sh.item(EppyIcon.DELETE, "Delete the transcript", "Removes eppy's copy; .transcript.srt files in the book folder stay", () -> {
                tr.setEnabled(bk.folderUri, false);
                tr.forget(bk.folderUri);
                rebuild();
            });
        } else if (bk != null) {
            sh.item(EppyIcon.SUBTITLES, "Transcribe this book", "On the phone, in the background, a little ahead of you", () -> startTranscript(false));
        }
        if (!ra.hasDocument()) {
            sh.show();
            return;
        }
        sh.item(EppyIcon.HISTORY, "Forget matches", "Keeps the file and chapter alignment; removes listening matches and manual corrections", ra::clearMatches);
        sh.item(EppyIcon.LIST, "Rebuild from scratch", "Re-reads the document and aligns again", ra::rebuild);
        sh.item(EppyIcon.CLOSE, "Remove pairing", "Removes the link and cached text. The audiobook and the file are untouched", ra::unpair);
        sh.show();
    }

    private final BaseAdapter adapter = new BaseAdapter() {
        public int getCount() {
            return text != null ? text.paras.size() : 0;
        }

        public Object getItem(int i) {
            return text.paras.get(i);
        }

        public long getItemId(int i) {
            return i;
        }

        @Override
        public int getViewTypeCount() {
            return 2;
        }

        @Override
        public int getItemViewType(int i) {
            return text != null && text.pagesOnly ? 1 : 0;
        }

        public View getView(int i, View convert, ViewGroup parent) {
            if (text.pagesOnly) return pageView(i, convert);
            TextView tv = convert instanceof TextView ? (TextView) convert : new TextView(c);
            tv.setPadding(Ui.dp(c, 12), Ui.dp(c, 8), Ui.dp(c, 12), Ui.dp(c, 8));
            tv.setLineSpacing(0, 1.35f);
            tv.setIncludeFontPadding(false);
            bindText(tv, i);
            return tv;
        }
    };

    private View pageView(int i, View convert) {
        ImageView iv = convert instanceof ImageView ? (ImageView) convert : new ImageView(c);
        iv.setAdjustViewBounds(true);
        iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
        int pad = Ui.dp(c, 6);
        iv.setPadding(pad, pad, pad, pad);
        boolean cur = unit >= 0 && paraOf(unit) == i;
        iv.setBackground(Ui.outlined(0xFFFFFFFF, cur ? t.primary : t.outlineVariant, Ui.dp(c, cur ? 3 : 1), Ui.dp(c, 8)));
        iv.setContentDescription("Page " + (i + 1) + (cur ? ", current (estimated)" : ""));
        iv.setImageBitmap(null);
        iv.setMinimumHeight(Ui.dp(c, 300));
        iv.setTag(i);
        if (pdf != null) pdf.render(i, list.getWidth() - Ui.dp(c, 36), bmp -> {
            if (Integer.valueOf(i).equals(iv.getTag())) iv.setImageBitmap(bmp);
        });
        return iv;
    }

    /** Renders PDF pages (for PDFs without a text layer or on Android < 15). */
    static final class PdfPages {
        interface Done {
            void done(Bitmap b);
        }

        private final Context c;
        private final Uri uri;
        private final LruCache<Integer, Bitmap> cache = new LruCache<Integer, Bitmap>(24 * 1024 * 1024) {
            @Override
            protected int sizeOf(Integer k, Bitmap b) {
                return b.getByteCount();
            }
        };
        private final java.util.concurrent.ExecutorService exec = java.util.concurrent.Executors.newSingleThreadExecutor();

        PdfPages(Context c, Uri uri) {
            this.c = c;
            this.uri = uri;
        }

        void render(int page, int width, Done done) {
            Bitmap hit = cache.get(page);
            if (hit != null) {
                done.done(hit);
                return;
            }
            final int w = Math.max(200, width);
            exec.execute(() -> {
                try (ParcelFileDescriptor pfd = c.getContentResolver().openFileDescriptor(uri, "r");
                     PdfRenderer r = new PdfRenderer(pfd);
                     PdfRenderer.Page p = r.openPage(page)) {
                    int h = Math.round(w * (p.getHeight() / (float) p.getWidth()));
                    Bitmap b = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                    b.eraseColor(0xFFFFFFFF);
                    p.render(b, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY);
                    cache.put(page, b);
                    new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> done.done(b));
                } catch (Throwable ignored) {
                }
            });
        }
    }
}
