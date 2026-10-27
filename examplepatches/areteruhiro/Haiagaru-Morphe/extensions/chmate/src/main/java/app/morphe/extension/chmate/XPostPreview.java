package app.morphe.extension.chmate;

import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.QuoteSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;
import android.widget.EditText;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/** Native, display-only previews. Never changes DAT, NG input or outgoing post text. */
public final class XPostPreview {
    static void addCacheSettings(android.widget.LinearLayout layout, android.app.Activity activity) {
        android.widget.TextView note = new android.widget.TextView(activity);
        note.setText("X投稿プレビューの取得済みデータは端末内に7日間保存します（最大128投稿・16MiB）。再起動後やオフライン時も有効なキャッシュを使用します。投稿が変更・削除されても保存期間中は以前の内容を表示する場合があります。画像・動画ファイルのキャッシュとは別です。");
        layout.addView(note);
        android.widget.Button button = new android.widget.Button(activity);
        button.setText("X投稿プレビューのキャッシュを削除"); layout.addView(button);
        button.setOnClickListener(v -> new HaiagaruDialog.Builder(activity)
                .setMessage("保存済みのX投稿プレビューを削除しますか？次に表示する際は再取得します。")
                .setNegativeButton("キャンセル", null).setPositiveButton("削除", (d, w) -> {
                    button.setEnabled(false);
                    new Thread(() -> {
                        XPostMetadata.clear();
                        MAIN.post(() -> {
                            synchronized (CACHE) { CACHE.clear(); ++revision; }
                            IDS.evictAll(); DIRTY.clear();
                            if (!activity.isFinishing() && !activity.isDestroyed()) {
                                button.setEnabled(true);
                                android.widget.Toast.makeText(activity,"X投稿プレビューのキャッシュを削除しました",android.widget.Toast.LENGTH_SHORT).show();
                            }
                        });
                    }, "Haiagaru-X-cache-clear").start();
                }).show());
    }
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(2, 2, 30,
            TimeUnit.SECONDS, new ArrayBlockingQueue<>(32), new ThreadPoolExecutor.AbortPolicy());
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LinkedHashMap<String, Entry> CACHE = new LinkedHashMap<>();
    // At most 128 small bodies / 256K characters. Never cache rendered spans or Views.
    private static final android.util.LruCache<String, String[]> IDS = new android.util.LruCache<String, String[]>(262_144) {
        @Override protected int sizeOf(String body, String[] ids) { return Math.max(2048, body.length()); }
    };
    private static final java.util.WeakHashMap<TextView, Boolean> DIRTY = new java.util.WeakHashMap<>();
    private static boolean refreshPosted;
    private static volatile int revision;
    private static final java.util.WeakHashMap<TextView, Boolean> BOUND = new java.util.WeakHashMap<>();
    private static final java.util.WeakHashMap<TextView, RowState> ROWS = new java.util.WeakHashMap<>();
    // Native position restoration inflates a detached copy of a row. Its expansion
    // state must match the displayed row rather than depend on a TextView instance.
    private static final android.util.LruCache<String,RowState> ROW_STATES = new android.util.LruCache<String,RowState>(262_144) {
        @Override protected int sizeOf(String source,RowState state){return Math.max(2048,source.length());}
    };
    // Native body TextViews call onBound from their overridden setText. Our own
    // preview writes must not enter that binding hook again (191/226/242).
    private static final ThreadLocal<TextView> WRITING = new ThreadLocal<>();
    private static final class RowState {
        final String source;
        final java.util.HashSet<String> expanded = new java.util.HashSet<>();
        RowState(String source) { this.source = source; }
    }
    private static final class Entry {
        Data data;
        long expires;
        long staleUntil;
        boolean pending;
        long retry;
        int failures;
        final List<WeakReference<TextView>> views = new ArrayList<>();
    }
    private static final class Marker {
        final int revision;
        final boolean full;
        final boolean collapsible;
        final boolean card;
        final boolean actions;
        final String[] ids;
        final Data[] data;
        final boolean[] expanded;
        final boolean needsFetch;
        final RowState state;
        Marker(int revision, String[] ids, Data[] data, boolean[] expanded, boolean needsFetch,RowState state) {
            this.revision = revision;
            this.full = Haiagaru.xPostPreviewFullText();
            this.collapsible = Haiagaru.xPostPreviewCollapsible();
            this.card = Haiagaru.xPostPreviewCard();
            this.actions = Haiagaru.xPostPreviewActions();
            this.ids = ids; this.data = data; this.expanded = expanded; this.needsFetch = needsFetch;
            this.state=state;
        }
        boolean current(TextView view, boolean fetch) {
            if (revision != XPostPreview.revision || full != Haiagaru.xPostPreviewFullText()
                    || collapsible != Haiagaru.xPostPreviewCollapsible() || card != Haiagaru.xPostPreviewCard()
                    || actions != Haiagaru.xPostPreviewActions()
                    || fetch && needsFetch) return false;
            synchronized (CACHE) {
                long now = android.os.SystemClock.elapsedRealtime();
                for (int i = 0; i < ids.length; i++) {
                    boolean open = !collapsible || state != null && state.expanded.contains(ids[i]);
                    if (open != expanded[i]) return false;
                    Entry entry=CACHE.get(ids[i]);
                    if (open && cached(entry, now) != data[i]) return false;
                    if (fetch && open && entry!=null && now>=entry.expires && !entry.pending && now>=entry.retry) return false;
                }
            }
            return true;
        }
    }
    private static Data cached(Entry entry, long now) {
        return entry == null || now>=entry.expires&&now>=entry.staleUntil ? null : entry.data;
    }
    private static String[] ids(CharSequence source) {
        String text = source.toString();
        String[] ids = IDS.get(text);
        if (ids == null) { ids = XMediaAttachments.postIds(text); IDS.put(text, ids); }
        return ids;
    }
    static final class Data {
        final String id, author, handle, text, date, excerpt;
        Data(String id, String author, String handle, String text, String date) {
            this.id = id; this.author = author; this.handle = handle; this.text = text; this.date = date;
            excerpt = text.codePointCount(0, text.length()) > 140
                    ? text.substring(0, text.offsetByCodePoints(0, 140)) + "…" : text;
        }
    }

    static Data parse(String json, String expectedId) throws Exception {
        JSONObject post = new JSONObject(json);
        if (!expectedId.equals(post.optString("id_str"))) return null;
        JSONObject user = post.optJSONObject("user");
        String text = post.optString("text", "");
        String full = post.optString("full_text", "");
        JSONObject extended = post.optJSONObject("extended_tweet");
        if (extended != null && extended.optString("full_text").length() > full.length())
            full = extended.optString("full_text");
        JSONObject note = post.optJSONObject("note_tweet");
        if (note != null) {
            JSONObject results = note.optJSONObject("note_tweet_results");
            JSONObject result = results == null ? null : results.optJSONObject("result");
            String noteText = result == null ? note.optString("text", "") : result.optString("text", "");
            if (noteText.length() > full.length()) full = noteText;
        }
        if (full.length() > text.length()) text = full;
        if (user == null || text.isEmpty() || text.length() > 50_000) return null;
        String handle = user.optString("screen_name", "");
        if (!handle.matches("[A-Za-z0-9_]{1,50}")) return null;
        return new Data(expectedId, user.optString("name", "").substring(0,
                Math.min(200, user.optString("name", "").length())), handle, text,
                post.optString("created_at", ""));
    }

    static void apply(TextView view) {
        apply(view, false);
    }

    private static void apply(TextView view, boolean force) {
        if (view instanceof EditText || Looper.myLooper() != Looper.getMainLooper()) return;
        SiteCards.onBound(view);
        CharSequence source = SiteCards.strip(view.getText());
        if (!(source instanceof Spanned) || source instanceof Editable) return;
        Spanned spans = (Spanned) source;
        Marker[] markers = spans.getSpans(0, source.length(), Marker.class);
        boolean enabled = Haiagaru.xPostPreviewEnabled();
        if (markers.length > 0) {
            if (!force && enabled && markers[0].current(view, true)) return;
            source = source.subSequence(0, spans.getSpanStart(markers[0]));
        }
        if (!enabled) {
            if (markers.length > 0) setText(view, source);
            return;
        }
        if (!view.isShown()) return;
        if (source.length() > 100_000) return;
        CharSequence result = decorate(source, view, true);
        if (result != source) setText(view, result);
        else if (markers.length > 0) setText(view, source);
    }

    /** Warm previews must be present before native row measurement/restored pixel offsets. */
    static CharSequence prepare(CharSequence source) {
        return prepare(source, null);
    }

    private static CharSequence prepare(CharSequence source, TextView view) {
        source = SiteCards.strip(source);
        if (!Haiagaru.xPostPreviewEnabled() || !(source instanceof Spanned)
                || source.length() > 100_000) return source;
        Spanned spanned = (Spanned) source;
        Marker[] markers = spanned.getSpans(0, source.length(), Marker.class);
        if (markers.length > 0) {
            if (markers[0].current(view, false)) return source;
            source = source.subSequence(0, spanned.getSpanStart(markers[0]));
        }
        return decorate(source, view, false);
    }

    /** Called after native binding; covers recycled rows even when no global layout fires. */
    public static void onBound(Object object) {
        if (object == WRITING.get() || SiteCards.writing(object) || Looper.myLooper() != Looper.getMainLooper()) return;
        DirectBodySelection.prepare(object);
        SiteCards.onBound(object);
        if (!(object instanceof TextView) || object instanceof EditText || !Haiagaru.xPostPreviewEnabled()) return;
        TextView view = (TextView) object;
        CharSequence source = SiteCards.strip(view.getText());
        if (!(source instanceof Spanned) || source instanceof Editable || source.length() > 100_000) return;
        CharSequence cached = prepare(source, view);
        if (cached != source) setText(view, cached);
        if (cached instanceof Spanned) {
            Marker[] markers = ((Spanned) cached).getSpans(0, cached.length(), Marker.class);
            if (markers.length > 0 && markers[0].current(view, true)) return;
        }
        if (ids(source).length == 0) return;
        if (BOUND.put(view, Boolean.TRUE) != null) return;
        WeakReference<TextView> reference = new WeakReference<>(view);
        view.post(() -> {
            TextView current = reference.get();
            if (current == null) return;
            BOUND.remove(current);
            apply(current);
        });
    }

    private static void setText(TextView view, CharSequence source) {
        TextView previous = WRITING.get();
        WRITING.set(view);
        try {
            XPostPreviewPosition.beforeChange(view);
            view.setText(SiteCards.decorate(source, view), TextView.BufferType.SPANNABLE);
        } finally {
            if (previous == null) WRITING.remove();
            else WRITING.set(previous);
        }
    }

    static String originalText(CharSequence source) {
        if (source instanceof Spanned) {
            Spanned spans = (Spanned) source;
            Marker[] markers = spans.getSpans(0, source.length(), Marker.class);
            if (markers.length > 0) source = source.subSequence(0, spans.getSpanStart(markers[0]));
        }
        return source.toString();
    }

    static void toggle(TextView view, String id) {
        CharSequence source=view.getText();
        if (!(source instanceof Spanned)) return;
        Spanned spans=(Spanned)source;
        Marker[] markers=spans.getSpans(0,source.length(),Marker.class);
        if(markers.length>0)source=source.subSequence(0,spans.getSpanStart(markers[0]));
        if (!java.util.Arrays.asList(ids(source)).contains(id)) return;
        RowState state=rowState(view,source);
        if(!state.expanded.remove(id))state.expanded.add(id);
        apply(view,true);
    }

    private static RowState rowState(TextView view, CharSequence source) {
        RowState state=view==null?null:ROWS.get(view);
        String key=source.toString();
        if(state==null || !state.source.equals(key)) {
            state=ROW_STATES.get(key);
            if(state==null){state=new RowState(key);ROW_STATES.put(key,state);}
            if(view!=null)ROWS.put(view,state);
        }
        return state;
    }

    private static CharSequence decorate(CharSequence source, TextView view, boolean fetch) {
        SpannableStringBuilder result = null;
        int currentRevision = revision;
        boolean collapsible=Haiagaru.xPostPreviewCollapsible();
        boolean card=Haiagaru.xPostPreviewCard();
        String[] ids = ids(source);
        if (ids.length == 0) return source;
        Data[] snapshot = new Data[ids.length];
        boolean[] open = new boolean[ids.length];
        boolean needsFetch = false;
        RowState state = collapsible ? rowState(view, source) : null;
        for (int i = 0; i < ids.length; i++) {
            String id = ids[i];
            boolean expanded=!collapsible || state!=null && state.expanded.contains(id);
            open[i] = expanded;
            Data data;
            if (fetch && expanded && view != null) data = lookup(id, view);
            else synchronized (CACHE) { data = cached(CACHE.get(id), android.os.SystemClock.elapsedRealtime()); }
            snapshot[i] = expanded ? data : null;
            if (expanded && data == null && !fetch) needsFetch = true;
            if (data == null && !collapsible) continue;
            if (result == null) result = new SpannableStringBuilder(source);
            int start = result.length();
            result.append("\n\n");
            if(collapsible) {
                int toggleStart=result.length();
                result.append(expanded ? "▼ X投稿のプレビューを閉じる" : "▶ X投稿のプレビューを表示");
                result.setSpan(new XPostPreviewTouch.ToggleLink(id),toggleStart,result.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                if(!expanded) { if(card)XPostPreviewCard.add(result,start+2,view); continue; }
                result.append("\n");
                if(data==null) {
                    result.append("読み込み中／取得できない場合は元のURLを開いてください");
                    if(card)XPostPreviewCard.add(result,start+2,view);
                    continue;
                }
            }
            int author = result.length();
            if (card) result.append(data.author).append("  · X\n@").append(data.handle).append("\n\n");
            else result.append(data.author).append("  @").append(data.handle).append("  · X\n");
            result.setSpan(new StyleSpan(Typeface.BOLD), author, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            String body = Haiagaru.xPostPreviewFullText() ? data.text : data.excerpt;
            result.append(body);
            if (!data.date.isEmpty()) result.append(card ? "\n\n" : "\n").append(data.date);
            result.append(card ? "\n\n投稿を開く" : "\n投稿を開く");
            result.setSpan(new XPostPreviewTouch.PostLink("https://x.com/" + data.handle + "/status/" + id),
                    result.length() - 5, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            if (Haiagaru.xPostPreviewActions()) {
                result.append("\n\n");
                appendAction(result, "返信", XPostPreviewTouch.actionUrl("reply", id), false);
                result.append("　");
                appendAction(result, "リポスト", XPostPreviewTouch.actionUrl("repost", id), false);
                result.append("　");
                appendAction(result, "いいね", XPostPreviewTouch.actionUrl("like", id), false);
                result.append("\n");
                appendAction(result, "リンクをコピー", "https://x.com/" + data.handle + "/status/" + id, true);
            }
            if (card) XPostPreviewCard.add(result,start+2,view);
            else result.setSpan(new QuoteSpan(), start + 2, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            result.setSpan(new RelativeSizeSpan(.9f), start, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        if (result != null) {
            result.setSpan(new Marker(currentRevision, ids, snapshot, open, needsFetch,state), source.length(), result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            return result;
        }
        return source;
    }

    private static void appendAction(SpannableStringBuilder result, String label, String url, boolean copy) {
        int start = result.length();
        result.append(label);
        result.setSpan(new XPostPreviewTouch.ActionLink(url, copy), start, result.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    private static Data lookup(String id, TextView view) {
        Entry entry;
        synchronized (CACHE) {
            entry = CACHE.get(id);
            if (entry == null) {
                if (CACHE.size() >= 128) {
                    String remove = null;
                    for (java.util.Map.Entry<String, Entry> old : CACHE.entrySet())
                        if (!old.getValue().pending) { remove = old.getKey(); break; }
                    if (remove == null) return null;
                    CACHE.remove(remove);
                }
                entry = new Entry();
                CACHE.put(id, entry);
            }
            if (entry.data != null && android.os.SystemClock.elapsedRealtime() < entry.expires) return entry.data;
            Data retained=cached(entry,android.os.SystemClock.elapsedRealtime());
            if (!entry.pending && android.os.SystemClock.elapsedRealtime() < entry.retry) return retained;
            entry.views.removeIf(reference -> reference.get() == null);
            boolean subscribed = false;
            for (WeakReference<TextView> reference : entry.views) if (reference.get() == view) subscribed = true;
            if (!subscribed && entry.views.size() < 32) entry.views.add(new WeakReference<>(view));
            if (!entry.pending) {
                entry.pending = true;
                final Entry target = entry;
                try { WORKER.execute(() -> resolve(id, target)); }
                catch (java.util.concurrent.RejectedExecutionException full) {
                    entry.pending = false;
                    entry.retry = android.os.SystemClock.elapsedRealtime() + 10_000;
                    scheduleRetry(id, entry, 10_000);
                }
            }
            return retained;
        }
    }

    private static void resolve(String id, Entry entry) {
        synchronized (CACHE) { if (CACHE.get(id) != entry) return; }
        Data data = null;
        try {
            if (Haiagaru.xPostPreviewEnabled()) {
                String json = XPostMetadata.fetchPreview(id);
                if (json != null) data = parse(json, id);
            }
        } catch (Exception ignored) {
            // Protected/deleted/limited posts keep the original link, not a fake empty tweet.
        }
        List<WeakReference<TextView>> views;
        synchronized (CACHE) {
            if (CACHE.get(id) != entry) return; // Clear/eviction invalidated this in-flight request.
            long now=android.os.SystemClock.elapsedRealtime();
            if(data!=null){
                entry.data=data;
                entry.expires=now+900_000;
                entry.staleUntil=now+7L*24*60*60*1000;
            }else if(cached(entry,now)==null)entry.data=null;
            entry.pending = false;
            entry.failures = data == null ? entry.failures + 1 : 0;
            entry.retry = android.os.SystemClock.elapsedRealtime() + (entry.failures <= 2 ? 10_000 : 120_000);
            views = new ArrayList<>(entry.views);
            entry.views.clear();
            if (data == null && entry.failures <= 2) entry.views.addAll(views);
        }
        refresh(views);
        if (data == null && entry.failures <= 2) scheduleRetry(id, entry, 10_100);
    }

    // Several completed posts in a row should cause one rewrite, not one per post.
    // Limit each turn so a large visible thread cannot monopolize the UI queue.
    private static void refresh(List<WeakReference<TextView>> views) {
        refresh(views, false);
    }
    private static void refresh(List<WeakReference<TextView>> views, boolean retry) {
        MAIN.post(() -> {
            for (WeakReference<TextView> reference : views) {
                TextView view = reference.get();
                if (view != null) DIRTY.put(view, retry || Boolean.TRUE.equals(DIRTY.get(view)));
            }
            if (!refreshPosted && !DIRTY.isEmpty()) {
                refreshPosted = true;
                MAIN.postDelayed(XPostPreview::refreshBatch, 16);
            }
        });
    }
    private static void refreshBatch() {
        List<TextView> batch = new ArrayList<>();
        List<Boolean> retry = new ArrayList<>();
        java.util.Iterator<TextView> iterator = DIRTY.keySet().iterator();
        while (iterator.hasNext() && batch.size() < 8) {
            TextView view = iterator.next(); batch.add(view); retry.add(DIRTY.get(view)); iterator.remove();
        }
        for (int i = 0; i < batch.size(); i++) {
            TextView view = batch.get(i);
            if (view != null && view.isAttachedToWindow() && view.isShown()) apply(view, Boolean.TRUE.equals(retry.get(i)));
        }
        refreshPosted = !DIRTY.isEmpty();
        if (refreshPosted) MAIN.postDelayed(XPostPreview::refreshBatch, 16);
    }

    private static void scheduleRetry(String id, Entry entry, long delay) {
        MAIN.postDelayed(() -> {
            List<WeakReference<TextView>> views;
            synchronized (CACHE) {
                if (CACHE.get(id) != entry) return;
                views = new ArrayList<>(entry.views); entry.views.clear();
            }
            if (!Haiagaru.xPostPreviewEnabled()) return;
            refresh(views, true);
        }, delay);
    }
}
