package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.AtomicFile;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListView;
import android.widget.TextView;
import org.json.JSONObject;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.WeakHashMap;

/** Automatic logical anchors, independent of Android's version-specific Parcelable state.
 * Native restoration and explicit response links take precedence. No backup action is needed. */
public final class ReadingPosition {
    static final String ENABLED = "readingPositionRecovery";
    private static final WeakHashMap<Object, Session> SESSIONS = new WeakHashMap<>();
    private static final WeakHashMap<Object, ResumeTarget> RESUME_TARGETS = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final java.util.concurrent.ExecutorService WRITER = java.util.concurrent.Executors.newSingleThreadExecutor();
    private static final android.util.LruCache<String, JSONObject> RECENT = new android.util.LruCache<>(128);
    private static final String PROCESS=java.util.UUID.randomUUID().toString();
    private static final java.util.Map<String, int[]> LAYOUT_ANCHORS = new java.util.HashMap<>();
    private static long layoutDeadline;
    private static Anchor pausedAnchor;
    private static int pausedTask;
    private static long pausedAt;
    private static boolean pausedForConfiguration;
    private ReadingPosition() { }

    static boolean defaultEnabled(boolean websiteCards, boolean xPreview, boolean xCards) {
        return websiteCards || xPreview && xCards;
    }

    static boolean enabled(boolean hasOverride, boolean override, boolean websiteCards,
                           boolean xPreview, boolean xCards) {
        return hasOverride ? override : defaultEnabled(websiteCards, xPreview, xCards);
    }

    static boolean defaultEnabled(SharedPreferences preferences) {
        return preferences != null && defaultEnabled(
                preferences.getBoolean("siteCardsEnabled", false),
                preferences.getBoolean("xPostPreviewEnabled", false),
                preferences.getBoolean("xPostPreviewCard", false));
    }

    static boolean enabled(SharedPreferences preferences) {
        return preferences != null && enabled(
                preferences.contains(ENABLED), preferences.getBoolean(ENABLED, false),
                preferences.getBoolean("siteCardsEnabled", false),
                preferences.getBoolean("xPostPreviewEnabled", false),
                preferences.getBoolean("xPostPreviewCard", false));
    }

    static boolean enabled() {
        Context context = Haiagaru.applicationContextForExtension();
        return context != null && enabled(FeatureSwitches.prefs(context));
    }

    static boolean cardPreviewsEnabled() {
        Context context = Haiagaru.applicationContextForExtension();
        return context != null && defaultEnabled(FeatureSwitches.prefs(context));
    }

    public static void register(Object fragment) {
        ReporterArchiveLookup.opened(fragment);
        try {
            Session old = SESSIONS.remove(fragment);
            if (old != null) old.close();
            View root = (View) fragment.getClass().getMethod("getView").invoke(fragment);
            View list = FilterPosition.findListForBinding(root);
            XPostPreviewPosition.opening(list);
            ThreadWatchNavigation.register(fragment, list);
            ResponseNoteIndicator.register(fragment,list);
            if (!enabled()) return;
            Activity activity = (Activity) fragment.getClass().getMethod("getActivity").invoke(fragment);
            if (list == null || activity == null) return;
            Session session = new Session(fragment, activity, list);
            SESSIONS.put(fragment, session);
            list.getViewTreeObserver().addOnPreDrawListener(session);
            list.getViewTreeObserver().addOnScrollChangedListener(session);
            list.addOnAttachStateChangeListener(session);
        } catch (Exception error) { Log.w("HaiagaruPosition", "Cannot attach reading-position observer", error); }
    }

    /** 191 repopulates the ListView after the background DAT job completes. */
    public static void beforeLegacyRebuild(Object adapter) {
        if(Looper.myLooper()!=Looper.getMainLooper())return;
        for(Session session:SESSIONS.values()){
            if(!(session.list instanceof ListView)||!session.list.isShown()||session.openingAnchor==null
                    ||session.openingAnchor.explicit||session.openingAnchor.number<=1
                    ||android.os.SystemClock.uptimeMillis()-session.opened>12000
                    ||XPostPreviewPosition.hasUserInteraction(session.list))continue;
            android.widget.ListAdapter attached=((ListView)session.list).getAdapter();
            if(attached instanceof android.widget.WrapperListAdapter)
                attached=((android.widget.WrapperListAdapter)attached).getWrappedAdapter();
            if(attached==adapter)session.openingRebuild=true;
        }
    }

    static void beforeMediaRefresh(View list) {
        for(Session session:SESSIONS.values())if(session.list==list){
            XPostPreviewPosition.beforeListChange(list);
            return;
        }
    }

    static boolean mediaPending(View list) { return XPostPreviewPosition.pending(list); }
    static boolean nativeRestoring(View list) {
        for(Session session:SESSIONS.values())if(session.list==list)return session.restoring||session.openingRebuild;
        return false;
    }
    static void previewCaptured(View list) {
        for(Session session:SESSIONS.values())if(session.list==list){session.openingAnchor=null;session.openingRebuild=false;session.coldPreview=null;}
    }
    static void afterMediaRefresh(View list) {
        for(Session session:SESSIONS.values())if(session.list==list)session.onScrollChanged();
    }

    public static void save(Object fragment) {
        Session session = SESSIONS.get(fragment);
        if (session == null) return;
        session.save();
        try {
            Anchor current = session.anchor();
            if (current != null && current.number > 1) {
                Anchor saved = new Anchor(current.key, current.url, current.explicit,
                        current.number, current.offset, null);
                RESUME_TARGETS.put(fragment, new ResumeTarget(saved, android.os.SystemClock.uptimeMillis()));
            } else RESUME_TARGETS.remove(fragment);
        } catch (Exception error) {
            RESUME_TARGETS.remove(fragment);
            Log.w("HaiagaruPosition", "Cannot capture thread position before returning", error);
        }
    }

    /** Restore a retained thread only if returning from a child screen reset it to response 1. */
    public static void onResume(Object fragment) {
        ResumeTarget target = RESUME_TARGETS.remove(fragment);
        Session session = SESSIONS.get(fragment);
        if (target == null || session == null) return;
        long now = android.os.SystemClock.uptimeMillis();
        if (now - target.savedAt > 10_000L || target.anchor.number <= 1
                || ThreadWatchNavigation.pendingFor(fragment, session.list)) return;
        try {
            Anchor current = session.anchor();
            if (current == null || current.explicit || !target.anchor.key.equals(current.key)
                    || LAYOUT_ANCHORS.containsKey(current.key)) return;
            session.resumeTarget = target.anchor;
            session.resumeArmedAt = now;
            session.resumeUntil = now + 4_000L;
            session.nextResumeCheck = 0;
            session.list.postInvalidateOnAnimation();
        } catch (Exception error) {
            Log.w("HaiagaruPosition", "Cannot restore thread position after returning", error);
        }
    }

    static void saveActivity(Activity activity) {
        for (Session session : new java.util.ArrayList<>(SESSIONS.values())) {
            if (session.activity != activity) continue;
            session.save();
            try {
                Anchor anchor = session.anchor();
                if (anchor != null) {
                    pausedAnchor = new Anchor(anchor.key, anchor.url, anchor.explicit, anchor.number, anchor.offset, null);
                    pausedTask = activity.getTaskId();
                    pausedAt = android.os.SystemClock.uptimeMillis();
                    pausedForConfiguration = activity.isChangingConfigurations();
                }
            } catch (Exception ignored) { }
        }
    }

    static android.net.Uri captureForLayout(Activity activity) {
        android.net.Uri selected = null;
        for (Session session : new java.util.ArrayList<>(SESSIONS.values())) {
            if (session.activity != activity) continue;
            try {
                Anchor anchor = session.anchor();
                if (anchor == null) continue;
                session.save();
                LAYOUT_ANCHORS.put(anchor.key, new int[]{anchor.number, anchor.offset});
                layoutDeadline = android.os.SystemClock.uptimeMillis() + 30000;
                selected = android.net.Uri.parse(anchor.url);
            } catch (Exception error) { Log.w("HaiagaruPosition", "Cannot capture layout position", error); }
        }
        if (selected == null && pausedForConfiguration && pausedAnchor != null && pausedTask == activity.getTaskId()
                && android.os.SystemClock.uptimeMillis() - pausedAt < 5000) {
            LAYOUT_ANCHORS.put(pausedAnchor.key, new int[]{pausedAnchor.number, pausedAnchor.offset});
            layoutDeadline = android.os.SystemClock.uptimeMillis() + 30000;
            selected = android.net.Uri.parse(pausedAnchor.url);
        }
        return selected;
    }

    private static Object call(Object value, String method, Class<?>[] types, Object... args) throws Exception {
        Method target = value.getClass().getMethod(method, types);
        target.setAccessible(true);
        return target.invoke(value, args);
    }

    static Object response(Object row) throws Exception {
        if (row == null) return null;
        if (responseType(row.getClass().getName())) return row;
        // This runs during visible-anchor checks. Native row classes are stable,
        // so reuse the shared per-class field list instead of enumerating the
        // hierarchy and allocating a new fields array on each inspection.
        for (Field field : NativeFields.all(row.getClass())) {
            if (Modifier.isStatic(field.getModifiers()) || !responseType(field.getType().getName())) continue;
            field.setAccessible(true);
            return field.get(row);
        }
        return null;
    }

    private static boolean responseType(String name) {
        return name.equals("o.processAdDisplayErrorPostbackForUserError")
                || name.equals("o.BouncyCastleSocketAdapterCompanion") || name.equals("o.KeJ11");
    }

    static int number(Object value) throws Exception {
        if (value == null) return -1;
        return ((Number) ResponseArchiveEntry.field(value,
                value.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion") ? "l" : "o")).intValue();
    }

    private static final class Anchor {
        final String key;
        final String url;
        final boolean explicit;
        final int number, offset;
        final Object adapter;
        Anchor(String key, String url, boolean explicit, int number, int offset, Object adapter) {
            this.url = url;
            this.key = key; this.explicit = explicit; this.number = number; this.offset = offset; this.adapter = adapter;
        }
    }

    private static final class ResumeTarget {
        final Anchor anchor;
        final long savedAt;
        ResumeTarget(Anchor anchor, long savedAt) { this.anchor = anchor; this.savedAt = savedAt; }
    }

    private static final class Session implements ViewTreeObserver.OnPreDrawListener,
            ViewTreeObserver.OnScrollChangedListener, View.OnAttachStateChangeListener {
        final WeakReference<Object> fragment;
        final Activity activity;
        final View list;
        final long installed;
        final String version;
        long nextInspection;
        long nextReadMarkerInspection;
        int readMarkerInspections;
        long lastScroll;
        Object itemAdapter;
        Method itemAccessor, countAccessor, childPosition;
        String threadKey, threadUrl;
        boolean threadExplicit, threadMetadataResolved;
        final Runnable delayedSave = this::save;
        String inspectedKey, written;
        boolean closed, restoring;
        Anchor coldPreview, openingAnchor;
        Anchor resumeTarget;
        long resumeArmedAt, resumeUntil, nextResumeCheck;
        boolean openingRebuild, readMarkerHandled, readMarkerBaselinePending;
        long coldPreviewUntil;
        final long opened=android.os.SystemClock.uptimeMillis();

        Session(Object fragment, Activity activity, View list) throws Exception {
            this.fragment = new WeakReference<>(fragment); this.activity = activity; this.list = list;
            android.content.pm.PackageInfo info = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0);
            installed = info.lastUpdateTime;
            version = info.versionName;
        }

        Anchor anchor() throws Exception {
            Object owner = fragment.get();
            if (closed || owner == null || !list.isShown()) return null;
            Object adapter = call(list, "getAdapter", new Class<?>[0]);
            if (adapter == null) return null;
            if (itemAdapter != adapter) {
                itemAccessor = list instanceof ListView ? adapter.getClass().getMethod("getItem", int.class)
                        : FilterPosition.findItem(adapter);
                itemAccessor.setAccessible(true); itemAdapter = adapter;
                threadMetadataResolved=false;threadKey=null;threadUrl=null;
            }
            if (!(list instanceof ListView) && childPosition == null) {
                childPosition = list.getClass().getMethod("getChildAdapterPosition", View.class);
                childPosition.setAccessible(true);
            }
            ViewGroup children = (ViewGroup) list;
            for (int i = 0; i < children.getChildCount(); i++) {
                View child = children.getChildAt(i);
                if (child.getBottom() <= list.getPaddingTop()) continue;
                int index = list instanceof ListView ? ((ListView) list).getPositionForView(child)
                        : (Integer) childPosition.invoke(list, child);
                if (index < 0) continue;
                Object post = response(itemAccessor.invoke(adapter, index));
                int no = number(post);
                if (no < 1) continue;
                if(!threadMetadataResolved&&!resolveThreadMetadata(owner))return null;
                return new Anchor(threadKey,threadUrl,threadExplicit,no,
                        child.getTop()-list.getPaddingTop(),adapter);
            }
            return null;
        }

        /** Board metadata stays stable while this thread's response adapter is retained. */
        private boolean resolveThreadMetadata(Object owner)throws Exception{
            Object board=NativeThreadContext.board(owner,version);
            if(board==null)return false;
            String url=NativeThreadContext.url(board,version,1);
            if(url==null)return false;
            URI uri=URI.create(url);
            String host=uri.getHost();
            if(host==null)return false;
            if(host.endsWith(".5ch.io")||host.endsWith(".5ch.net")||host.endsWith(".2ch.net"))host="5ch";
            String key=host+uri.getPath().replaceFirst("/1/?$","/");
            boolean explicit=false;
            for(Field field:board.getClass().getDeclaredFields()){
                if(Modifier.isStatic(field.getModifiers())||field.getType()!=Integer.class)continue;
                field.setAccessible(true);
                if(field.get(board)!=null){explicit=true;break;}
            }
            threadKey=key;
            threadUrl=uri.toString().replaceFirst("/1/?$","/");
            threadExplicit=explicit;
            threadMetadataResolved=true;
            return true;
        }

        File file(String key) throws Exception {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(key.getBytes(StandardCharsets.UTF_8));
            StringBuilder name = new StringBuilder();
            for (byte b : hash) name.append(String.format(java.util.Locale.ROOT, "%02x", b));
            File directory = new File(activity.getFilesDir(), "haiagaru-reading-position");
            if (!directory.isDirectory() && !directory.mkdirs()) throw new java.io.IOException("Position directory unavailable");
            return new File(directory, name + ".json");
        }

        /** Keep ChMate's native unread boundary at the top when it opens below it. */
        boolean alignVisibleReadMarker(long now) throws Exception {
            if(readMarkerHandled||now-opened>30000||XPostPreviewPosition.hasUserInteraction(list)
                    ||XPostPreviewPosition.pending(list)||!(list instanceof ViewGroup))return false;
            if(now<nextReadMarkerInspection)return false;
            // Defer tree inspection while the user is actively scrolling. During the
            // first two seconds, retry quickly as native rows bind; after that, once
            // per second is enough to catch a delayed unread-boundary row.
            if(lastScroll>0&&now-lastScroll<250)return false;
            nextReadMarkerInspection=now+(readMarkerInspections<8?250:1000);
            readMarkerInspections++;
            Object adapter=call(list,"getAdapter",new Class<?>[0]);
            if(adapter==null)return false;
            if(itemAdapter!=adapter){
                itemAccessor=list instanceof ListView?adapter.getClass().getMethod("getItem",int.class):FilterPosition.findItem(adapter);
                itemAccessor.setAccessible(true);
                countAccessor=adapter.getClass().getMethod(list instanceof ListView?"getCount":"getItemCount");
                countAccessor.setAccessible(true);
                if(!(list instanceof ListView)){
                    childPosition=list.getClass().getMethod("getChildAdapterPosition",View.class);
                    childPosition.setAccessible(true);
                }
                itemAdapter=adapter;threadMetadataResolved=false;threadKey=null;threadUrl=null;
            }
            ViewGroup children=(ViewGroup)list;
            int count=((Number)countAccessor.invoke(adapter)).intValue();
            for(int i=0;i<children.getChildCount();i++){
                View child=children.getChildAt(i);
                if(child.getBottom()<=list.getPaddingTop()||child.getTop()>=list.getHeight()-list.getPaddingBottom())continue;
                int position=list instanceof ListView?((ListView)list).getPositionForView(child)
                        :((Number)childPosition.invoke(list,child)).intValue();
                if(position<0||position>=count)continue;
                Object row=itemAccessor.invoke(adapter,position);
                if(response(row)!=null||!readMarkerText(child))continue;
                readMarkerHandled=true;
                readMarkerBaselinePending=true;
                openingAnchor=null;openingRebuild=false;coldPreview=null;
                if(Math.abs(child.getTop()-list.getPaddingTop())>2
                        &&FilterPosition.jumpToAdapterPosition(list,position,0)){
                    restoring=true;
                    return true;
                }
                return false;
            }
            return false;
        }

        private boolean readMarkerText(View view){
            if(view.getVisibility()!=View.VISIBLE)return false;
            if(view instanceof TextView){
                CharSequence text=((TextView)view).getText();
                if(text==null)return false;
                int start=0,end=text.length();
                while(start<end&&Character.isWhitespace(text.charAt(start)))start++;
                while(end>start&&Character.isWhitespace(text.charAt(end-1)))end--;
                String marker="ここまで読んだ";
                if(end-start!=marker.length())return false;
                for(int i=0;i<marker.length();i++)if(text.charAt(start+i)!=marker.charAt(i))return false;
                return true;
            }
            if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)if(readMarkerText(group.getChildAt(i)))return true;}
            return false;
        }

        @Override public boolean onPreDraw() {
            if (closed || !list.isShown()) return true;
            if (restoring) {
                // setSelectionFromTop schedules another layout. Drawing the old children
                // here exposes the displaced frame between two corrections.
                if (list.isLayoutRequested()) return false;
                restoring = false;
                onScrollChanged();
            }
            // ViewTreeObserver belongs to the whole window. Retained tablet
            // fragments also receive callbacks while adjacent pages animate.
            // Never perform reflective anchor discovery on every 120 Hz frame.
            long now = android.os.SystemClock.uptimeMillis();
            if (!list.isShown()) return true;
            if (resumeTarget != null) {
                if (now > resumeUntil) resumeTarget = null;
                else if (now >= nextResumeCheck) {
                    nextResumeCheck = now + 150L;
                    try {
                        Anchor current = anchor();
                        if (current == null) { /* Wait for native rows to bind. */ }
                        else if (!resumeTarget.key.equals(current.key) || current.explicit
                                || ThreadWatchNavigation.pendingFor(fragment.get(), list)) {
                            resumeTarget = null;
                        } else if (current.number == resumeTarget.number
                                && Math.abs(current.offset - resumeTarget.offset) <= 2) {
                            // Give a posting Activity time to finish its asynchronous list refresh.
                            // A return can still be at the old row when onResume runs.
                            if (now - resumeArmedAt > 3_500L) resumeTarget = null;
                        } else if (!list.canScrollVertically(-1)) {
                            // Some native layouts begin at response 9 (headers/hidden rows precede
                            // it), so response number 1 is not a reliable test for a top reset.
                            Object owner = fragment.get();
                            if (owner != null && FilterPosition.jumpToResponse(owner,
                                    resumeTarget.number, resumeTarget.offset)) {
                                resumeTarget = null;
                                restoring = true;
                                return false;
                            }
                        } else {
                            // Wait briefly for ChMate to finish a pending layout or post refresh.
                        }
                    } catch (Exception unavailable) { resumeTarget = null; }
                }
            }
            try{if(alignVisibleReadMarker(now))return false;}
            catch(Exception unavailable){Log.w("HaiagaruPosition","Unread boundary alignment unavailable",unavailable);}
            if(readMarkerBaselinePending){
                readMarkerBaselinePending=false;
                try{Anchor current=anchor();if(current!=null){inspectedKey=current.key;onScrollChanged();}}
                catch(Exception ignored){}
                return true;
            }
            // Capture the displayed unread viewport, not an adapter index. The
            // saved position is relevant only during the initial 191 load.
            if(!XPostPreviewPosition.pending(list)&&version.contains("191")&&now-opened<12000&&!XPostPreviewPosition.hasUserInteraction(list)){
                try{
                    if(openingRebuild&&!list.isLayoutRequested()){
                        openingRebuild=false;
                        Anchor previous=openingAnchor;
                        openingAnchor=null;
                        Anchor current=anchor();
                        Object owner=fragment.get();
                        if(previous!=null&&current!=null&&owner!=null&&previous.key.equals(current.key)
                                &&(previous.number!=current.number||Math.abs(previous.offset-current.offset)>2)
                                &&FilterPosition.jumpToResponse(owner,previous.number,previous.offset)){
                            restoring=true;return false;
                        }
                    }
                }catch(Exception unavailable){openingRebuild=false;openingAnchor=null;}
            }else{openingRebuild=false;openingAnchor=null;}
            // A settled session only checks for a changed thread once per second;
            // do not inspect retained tablet panes during an active scroll.
            boolean settled = inspectedKey != null && coldPreview == null && now > layoutDeadline;
            if (settled && now - lastScroll < 200) return true;
            if (now < nextInspection) return true;
            nextInspection = now + (settled ? 1000 : 250);
            try {
                Anchor current = anchor();
                if(current==null)return true;
                if(!XPostPreviewPosition.pending(list)&&version.contains("191")&&now-opened<12000&&current.number>1
                        &&!openingRebuild&&!XPostPreviewPosition.hasUserInteraction(list))openingAnchor=current;
                if(XPostPreviewPosition.pending(list))return true;
                if(coldPreview!=null){
                    if(now>coldPreviewUntil||XPostPreviewPosition.hasUserInteraction(list)){coldPreview=null;onScrollChanged();}
                    else if(current.key.equals(coldPreview.key)){
                        list.postInvalidateDelayed(250);
                        Object owner=fragment.get();
                        if(owner!=null&&(current.number!=coldPreview.number||Math.abs(current.offset-coldPreview.offset)>2)
                                &&FilterPosition.jumpToResponse(owner,coldPreview.number,coldPreview.offset)){restoring=true;return false;}
                        return true;
                    }else coldPreview=null;
                }
                if(current.key.equals(inspectedKey))return true;
                if(readMarkerHandled){inspectedKey=current.key;onScrollChanged();return true;}
                if (android.os.SystemClock.uptimeMillis() > layoutDeadline) LAYOUT_ANCHORS.clear();
                int[] layout = LAYOUT_ANCHORS.get(current.key);
                if (layout != null) {
                    Object owner = fragment.get();
                    if (owner != null && FilterPosition.jumpToResponse(owner, layout[0], layout[1])) {
                        LAYOUT_ANCHORS.remove(current.key); inspectedKey = current.key;
                        restoring = true; return false;
                    }
                    return true;
                }
                // Inspect once per actual thread, before saving the initial response-1 frame.
                JSONObject saved = RECENT.get(current.key);
                if (saved == null) {
                    AtomicFile storage = new AtomicFile(file(current.key));
                    try {
                        saved = new JSONObject(new String(storage.readFully(), StandardCharsets.UTF_8));
                        RECENT.put(current.key, saved);
                    } catch (java.io.FileNotFoundException ignored) { }
                }
                boolean previews=cardPreviewsEnabled();
                if(saved!=null&&previews&&!current.explicit&&saved.optInt("number")>1
                        &&current.key.equals(saved.optString("thread"))
                        &&!PROCESS.equals(saved.optString("process"))
                        &&!XPostPreviewPosition.hasUserInteraction(list)){
                    // Let native unread restoration and first measurement finish.
                    // Do not overwrite the previous process anchor with a cold row-1 frame.
                    if(now<opened+1500){list.postInvalidateDelayed(250);return true;}
                    // A later native unread/end target takes precedence over the old viewport.
                    if(current.number>saved.optInt("number")){inspectedKey=current.key;onScrollChanged();return true;}
                    int target=saved.getInt("number");Object owner=fragment.get();
                    if(owner!=null&&FilterPosition.jumpToResponse(owner,target,saved.optInt("offset"))){
                        coldPreview=new Anchor(current.key,current.url,false,target,saved.optInt("offset"),null);
                        coldPreviewUntil=now+2500;inspectedKey=current.key;restoring=true;list.postInvalidateDelayed(250);return false;
                    }
                    if(now<opened+5000){list.postInvalidateDelayed(250);return true;}
                }
                if (saved != null && !current.explicit && current.number == 1
                        && saved.optLong("installed") != installed && saved.optInt("number") > 1
                        && current.key.equals(saved.optString("thread"))) {
                    // Wait for the requested response to be present in the native adapter.
                    // Never fall back to a raw adapter index (headers and filters can differ).
                    int target = saved.getInt("number");
                    Object owner = fragment.get();
                    if (owner != null && FilterPosition.jumpToResponse(owner, target, saved.optInt("offset"))) {
                        inspectedKey = current.key;
                        restoring = true;
                        return false;
                    }
                    return true;
                }
                inspectedKey = current.key;
                onScrollChanged();
            } catch (Exception error) { Log.w("HaiagaruPosition", "Reading-position restoration unavailable", error); }
            return true;
        }

        @Override public void onScrollChanged() {
            if (closed || restoring || coldPreview!=null || !list.isShown()) return;
            lastScroll = android.os.SystemClock.uptimeMillis();
            MAIN.removeCallbacks(delayedSave);
            MAIN.postDelayed(delayedSave, 400);
        }

        void save() {
            if (closed || restoring || coldPreview!=null) return;
            if (XPostPreviewPosition.pending(list))return;
            MAIN.removeCallbacks(delayedSave);
            try {
                Anchor current = anchor();
                if (current == null || !current.key.equals(inspectedKey)) return;
                String signature = current.key + ":" + current.number + ":" + current.offset;
                if (signature.equals(written)) return;
                JSONObject data = new JSONObject().put("thread", current.key).put("number", current.number)
                        .put("offset", current.offset).put("installed", installed).put("process", PROCESS);
                RECENT.put(current.key, data);
                written = signature;
                // AtomicFile.finishWrite includes a sync. Keep it off the UI thread,
                // with one ordered writer so the latest anchor is always written last.
                WRITER.execute(() -> {
                    try {
                        AtomicFile storage = new AtomicFile(file(current.key));
                        FileOutputStream output = storage.startWrite();
                        try { output.write(data.toString().getBytes(StandardCharsets.UTF_8)); storage.finishWrite(output); }
                        catch (Exception error) { storage.failWrite(output); throw error; }
                    } catch (Exception error) {
                        MAIN.post(() -> { if (signature.equals(written)) written = null; });
                        Log.w("HaiagaruPosition", "Cannot persist reading position", error);
                    }
                });
            } catch (Exception error) { Log.w("HaiagaruPosition", "Cannot persist reading position", error); }
        }

        void close() {
            save(); closed = true; MAIN.removeCallbacks(delayedSave);
            if (list.getViewTreeObserver().isAlive()) {
                list.getViewTreeObserver().removeOnPreDrawListener(this);
                list.getViewTreeObserver().removeOnScrollChangedListener(this);
            }
            list.removeOnAttachStateChangeListener(this);
        }
        @Override public void onViewDetachedFromWindow(View view) { close(); }
        @Override public void onViewAttachedToWindow(View view) { }
    }
}
