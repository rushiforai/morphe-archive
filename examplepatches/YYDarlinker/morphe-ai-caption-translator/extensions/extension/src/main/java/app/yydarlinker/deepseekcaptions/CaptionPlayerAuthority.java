package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.Looper;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * The one player authority: owner identity, player type and display permission.
 *
 * <p>N36 separates two things that used to share one counter. Caption <em>render</em> revisions and
 * submission epochs exist only to invalidate drawing; the real player type is owned by this class and
 * is never filtered by a render identity. A caption clear, an AI toggle, a style change or a
 * relayout must not be able to discard a valid player notification.</p>
 *
 * <p>States: {@link #UNKNOWN} (no proven owner or no authoritative type yet — never permission to
 * display), {@link #COMPACT} (miniplayer/PiP/hidden — display refused), {@link #TRANSITIONING_TO_REGULAR}
 * (compact ended, player geometry not settled — display refused) and {@link #REGULAR} (authoritative
 * non-compact type on a valid owner — the only state that permits display). {@link #CLOSED} means the
 * owner or activity is gone.</p>
 */
final class CaptionPlayerAuthority {
    static final int UNKNOWN = 0, COMPACT = 1, TRANSITIONING_TO_REGULAR = 2, REGULAR = 3, CLOSED = 4;

    interface Listener {
        /** Called on the main thread after the state or owner changed; never during a notification lock. */
        void onAuthorityChanged();
    }

    private static final CopyOnWriteArrayList<Listener> listeners = new CopyOnWriteArrayList<>();

    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static WeakReference<View> decor = new WeakReference<>(null);
    private static String video = "";
    private static volatile long ownerEpoch;
    private static long notificationSequence;
    private static long batchSequence;
    private static long observedBatch = -1;
    private static boolean batchClosePosted;

    private static int state = UNKNOWN;
    /** Bounded evidence counters; production never branches on them. */
    static long stateWrites, settleRegularCalls, awardRestoreCalls;
    private static String playerType = "";
    private static boolean typeAuthoritative;
    /** Same-batch responsibilities are OR-merged; a new owner never inherits them. */
    private static boolean pendingOuterRestore;
    private static boolean pendingNativeScan;
    /** Set by a real notification or reconcile so the next surface pass may search despite the throttle. */
    private static boolean surfaceDirty;

    private static final android.os.Handler MAIN = new android.os.Handler(Looper.getMainLooper());
    private CaptionPlayerAuthority() {}

    static long ownerEpoch(){return ownerEpoch;}
    static long notificationSequence(){return notificationSequence;}
    static String playerType(){return playerType;}
    static int state(){return state;}
    static String stateName(){
        switch(state){
            case COMPACT: return "COMPACT";
            case TRANSITIONING_TO_REGULAR: return "TRANSITIONING_TO_REGULAR";
            case REGULAR: return "REGULAR";
            case CLOSED: return "CLOSED";
            default: return "UNKNOWN";
        }
    }

    static void addListener(Listener listener){
        if(listener!=null&&!listeners.contains(listener))listeners.add(listener);
    }
    static void removeListener(Listener listener){listeners.remove(listener);}

    static Activity activity(){return activity.get();}

    /** The decor view of the current owner, or null once the owner is not displayable. */
    static View decorView(){
        Activity current=activity.get();
        if(current==null||current.isFinishing()||current.getWindow()==null)return null;
        View view=current.getWindow().getDecorView();
        decor=new WeakReference<>(view);
        return view;
    }

    static boolean ownerValid(){
        Activity current=activity.get();
        return current!=null&&!current.isFinishing()&&!current.isDestroyed()&&current.getWindow()!=null;
    }

    /** True only for a proven non-compact player whose geometry was confirmed on this owner. */
    static boolean displayPermitted(){
        return state==REGULAR && ownerValid();
    }

    /** True while compact quarantine or an unsettled expansion owns the surface. */
    static boolean suppressing(){
        // Only a settled compact state or a real observation window suppresses work. UNKNOWN means
        // "no authoritative player type yet", which is still the ordinary non-compact case.
        return state==COMPACT || state==TRANSITIONING_TO_REGULAR;
    }
    /** No authoritative player type has been reported for the current owner yet. */
    static boolean unproven(){return state==UNKNOWN||state==CLOSED;}

    /** Bounded, non-sensitive identity for diagnostics. */
    static String shortId(){
        Activity current=activity.get();
        String activityName=current==null?"none":Integer.toHexString(System.identityHashCode(current));
        return "activity="+activityName+";video="+(video.isEmpty()?"none":video)
                +";authority_epoch="+ownerEpoch+";notification_seq="+notificationSequence;
    }

    static void setOwner(Activity next){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(() -> setOwner(next));return;}
        Activity current=activity.get();
        if(current==next){
            // Re-declaring the same owner after a close re-opens it as unproven instead of leaving the
            // session permanently closed: a new session on the same Activity starts from UNKNOWN.
            if(state==CLOSED&&next!=null){
                // Re-declared same owner after a close: re-open as unproven rather than staying closed.
                state=UNKNOWN;playerType="";typeAuthoritative=false;surfaceDirty=false;
                observedBatch=batchSequence;notifyListeners();
            }
            return;
        }
        activity=new WeakReference<>(next);
        ownerEpoch++;
        decor=new WeakReference<>(next==null?null:(next.getWindow()==null?null:next.getWindow().getDecorView()));
        // A new owner starts with no inherited type and no inherited recovery responsibility.
        state=next==null?CLOSED:UNKNOWN;
        playerType="";
        typeAuthoritative=false;
        pendingOuterRestore=false;
        pendingNativeScan=false;
        surfaceDirty=false;
        observedBatch=batchSequence;
        notifyListeners();
    }

    static void setVideo(String id){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(() -> setVideo(id));return;}
        String next=id==null?"":id.trim();
        if(next.equals(video))return;
        video=next;
        ownerEpoch++;
        state=UNKNOWN;
        playerType="";
        typeAuthoritative=false;
        pendingOuterRestore=false;
        pendingNativeScan=false;
        surfaceDirty=false;
        observedBatch=batchSequence;
        notifyListeners();
    }

    static void close(){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(() -> close());return;}
        state=CLOSED;
        playerType="";
        typeAuthoritative=false;
        pendingOuterRestore=false;
        pendingNativeScan=false;
        surfaceDirty=false;
        // A closed engine invalidates every notification that was queued before it, so a stale
        // off-main callback cannot reopen a new owner's quarantine.
        ownerEpoch++;
        notifyListeners();
    }

    /** True while the current observed batch still carries an unconsumed native scan responsibility. */
    static boolean consumeNativeScanResponsibility(){
        if(observedBatch!=batchSequence)return false;
        boolean owed=pendingNativeScan;
        pendingNativeScan=false;
        return owed;
    }

    static boolean outerRestoreOwed(){return observedBatch==batchSequence&&pendingOuterRestore;}
    static void clearOuterRestore(){pendingOuterRestore=false;}

    /**
     * Consumes the "a real player notification arrived" flag. Exactly one surface search is then
     * allowed even if it is inside the ordinary throttle window; the throttle still bounds all
     * subsequent repeated passes.
     */
    static boolean consumeSurfaceDirty(){
        boolean owed=surfaceDirty;
        surfaceDirty=false;
        return owed;
    }

    /**
     * One player notification, called on the main thread. Never performs a tree scan, a measurement,
     * a network call or a keystore read: it only merges the authoritative type and updates the state.
     */
    static void onNotification(String rawType,boolean outer){
        if(Looper.myLooper()!=Looper.getMainLooper()){MAIN.post(() -> onNotification(rawType,outer));return;}
        String type=rawType==null?"":rawType.trim().toUpperCase(Locale.ROOT);
        if(!batchClosePosted){
            batchSequence++;pendingOuterRestore=false;pendingNativeScan=false;
            batchClosePosted=true;
            final long batch=batchSequence;
            MAIN.post(() -> {if(batch==batchSequence)batchClosePosted=false;});
        }
        notificationSequence++;
        pendingNativeScan=true;
        surfaceDirty=true;
        if(outer)pendingOuterRestore=true;
        observedBatch=batchSequence;
        String previous=playerType;
        if(!type.isEmpty()){
            playerType=type;
            typeAuthoritative=true;
        }
        int previousState=state;
        applyState();
        // A real type change inside REGULAR (fullscreen <-> detail) keeps the same state value but is
        // still a genuine mode change, so listeners are notified and one render follows it. A repeated
        // identical type on a settled owner stays silent and costs nothing.
        if(state==previousState&&state==REGULAR&&!type.isEmpty()&&!type.equals(previous))
            notifyListeners();
    }

    /**
     * Bounded current-player check on re-bind, resume or an explicit AI re-enable, so recovery never
     * waits for a type callback that may legitimately never repeat.
     */
    static String reconcileCurrentPlayerType(){
        String resolved=OfficialPlayerTypeReader.read();
        if(resolved.isEmpty())return "";
        onNotification(resolved,false);
        return resolved;
    }

    static boolean hasAuthoritativeType(){return typeAuthoritative&&!playerType.isEmpty();}

    /** Non-compact authoritative callback with no compact predecessor: settle in one step. */
    static void noteRegular(){
        applyState();
    }

    static void resetForTests(){
        listeners.clear();
        activity=new WeakReference<>(null);
        decor=new WeakReference<>(null);
        video="";
        ownerEpoch=0;notificationSequence=0;batchSequence=0;observedBatch=-1;batchClosePosted=false;
        state=UNKNOWN;playerType="";typeAuthoritative=false;
        pendingOuterRestore=false;pendingNativeScan=false;
        OfficialPlayerTypeReader.resetForTests();
    }

    private static void applyState(){
        if(!ownerValid()){
            int previous=state;
            state=CLOSED;
            if(previous!=state)notifyListeners();
            return;
        }
        int previous=state;
        if(!typeAuthoritative){
            state=UNKNOWN;
            if(previous!=state)notifyListeners();
            return;
        }
        // A verified Shorts surface keeps its own isolation rule and is never treated as the compact
        // miniplayer state, exactly as the pre-N36 guard did.
        boolean compact=!CaptionSurface.isShorts()&&isCompactType(playerType);
        int next;
        if(compact)next=COMPACT;
        else if(state==COMPACT||state==TRANSITIONING_TO_REGULAR)next=TRANSITIONING_TO_REGULAR;
        else next=REGULAR;
        state=next;stateWrites++;
        if(previous!=next)notifyListeners();
    }

    /**
     * A verified Shorts surface is its own display permission: Shorts reports an inner player type and
     * may never deliver the regular one, but it was never compact in the first place.
     */
    static void noteShortsSurface(){
        if(!ownerValid()){close();return;}
        int previous=state;
        state=REGULAR;stateWrites++;
        typeAuthoritative=true;
        if(previous!=state)notifyListeners();
    }

    /** Called by the transition coordinator once real geometry settled on a valid, non-compact surface. */
    static void settleRegular(){settleRegularCalls++;
        if(!ownerValid()){close();return;}
        if(isCompactType(playerType))return;
        int previous=state;
        state=REGULAR;
        if(previous!=state)notifyListeners();
    }

    static boolean isCompactType(String rawType){
        String type=rawType==null?"":rawType.trim().toUpperCase(Locale.ROOT);
        if(type.isEmpty())return false;
        return type.equals("NONE")||type.equals("HIDDEN")||type.equals("INLINE_MINIMAL")
                ||type.equals("WATCH_WHILE_PICTURE_IN_PICTURE")||type.contains("MINIMAL")
                ||type.contains("MINIMIZED")||type.contains("PICTURE_IN_PICTURE")
                ||type.contains("DISMISSED");
    }

    private static void notifyListeners(){
        if(Looper.myLooper()!=Looper.getMainLooper())return;
        for(Listener listener:listeners){
            try { listener.onAuthorityChanged(); } catch(RuntimeException ignored) { }
        }
    }

    /**
     * Read-only adapter for the official public player-type surface. No private field reflection and
     * no modification of the official class: the Kotlin companion accessor is a public static method
     * in the shipped 1.45 extension library.
     */
    static final class OfficialPlayerTypeReader {
        private static final String PLAYER_TYPE="app.morphe.extension.youtube.shared.PlayerType";
        private static volatile boolean resolved;
        private static Method accessor;
        private static Field field;

        private OfficialPlayerTypeReader(){}

        static String read(){
            resolve();
            try {
                Object value=accessor==null?null:accessor.invoke(null);
                if(value==null&&field!=null)value=field.get(null);
                if(value==null)return "";
                String name=value instanceof Enum?(String)((Enum<?>)value).name():String.valueOf(value);
                return name==null?"":name.trim().toUpperCase(Locale.ROOT);
            } catch(Throwable failure){
                return "";
            }
        }

        static boolean available(){resolve();return accessor!=null||field!=null;}

        static void resetForTests(){resolved=false;accessor=null;field=null;}

        private static void resolve(){
            if(resolved)return;
            synchronized(OfficialPlayerTypeReader.class){
                if(resolved)return;
                resolved=true;
                Class<?> type;
                try { type=Class.forName(PLAYER_TYPE); } catch(Throwable missing){ return; }
                accessor=publicStatic(type,"access$getCurrentPlayerType$cp");
                if(accessor==null)accessor=publicStatic(type,"getCurrentPlayerType");
                if(accessor==null){
                    try {
                        Field candidate=type.getDeclaredField("currentPlayerType");
                        candidate.setAccessible(true);
                        field=candidate;
                    } catch(Throwable ignored){ field=null; }
                }
            }
        }

        private static Method publicStatic(Class<?> type,String name){
            try {
                Method method=type.getMethod(name);
                return Modifier.isStatic(method.getModifiers())?method:null;
            } catch(Throwable ignored){ return null; }
        }
    }
}
