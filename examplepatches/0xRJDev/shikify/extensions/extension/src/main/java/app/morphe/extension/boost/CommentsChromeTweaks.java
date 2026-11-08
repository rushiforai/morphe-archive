package app.morphe.extension.boost;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

/** Mappings verified against the official Boost 1.14.3 APK (SHA-256 in README). */
public final class CommentsChromeTweaks {
    private static final WeakHashMap<View, WeakReference<Header>> HEADERS = new WeakHashMap<>();
    // App classes live for the process lifetime. Cache absent fields too: repeated
    // superclass walks and NoSuchFieldExceptions are particularly costly while scrolling.
    private static final Map<Class<?>,Map<String,Field>> FIELDS = new HashMap<>();
    private CommentsChromeTweaks() { }

    public static void onFragmentResume(Object fragment) {
        if(materialYouEnabled())ThreadPositionTweaks.resume(fragment);
        if(materialYouEnabled()) CommentsScreenTweaks.attach(fragment);
        if(!dynamicHeaderEnabled())return;
        try {
            Object value = field(fragment, "mRecyclerView");
            if (!(value instanceof ViewGroup)) return;
            ViewGroup recycler = (ViewGroup) value;
            WeakReference<Header> previous = HEADERS.get(recycler);
            if (previous != null && previous.get() != null) return;
            Activity activity = activity(recycler.getContext());
            if(activity!=null && !SurfaceSettingsActivity.enabled(activity,"dynamic_header"))return;
            Object toolbar = field(activity, "toolbar");
            if (!(toolbar instanceof Toolbar)) return;
            // Boost renames RecyclerView nested types and LinearLayoutManager methods.
            // Never link extension bytecode against the unobfuscated AndroidX APIs.
            Object manager = field(fragment, "D");
            if (manager == null) return;
            Header header = new Header(fragment, recycler, (Toolbar) toolbar, manager);
            HEADERS.put(recycler, new WeakReference<>(header));
            recycler.getViewTreeObserver().addOnPreDrawListener(header);
            recycler.addOnAttachStateChangeListener(header);
        } catch (Exception | LinkageError e) {
        }
    }
    public static void onFragmentPause(Object fragment) {
        if(materialYouEnabled())ThreadPositionTweaks.pause(fragment);
        CommentsScreenTweaks.detach(fragment);
        Object value = field(fragment, "mRecyclerView");
        if (!(value instanceof View)) return;
        WeakReference<Header> ref = HEADERS.remove((View) value);
        Header header = ref == null ? null : ref.get();
        if (header != null) header.detach();
    }
    // Enabled independently by the selected comment patches. Keep one native bind hook.
    public static boolean dynamicHeaderEnabled() { return false; }
    public static boolean materialYouEnabled() { return false; }
    public static boolean commentLayoutEnabled() { return false; }
    public static boolean mediaPeekEnabled() { return false; }
    public static boolean inlineMediaEnabled() { return false; }
    public static boolean hideDividersEnabled() { return false; }
    public static boolean swipeActionsEnabled() { return false; }
    public static void onCommentBind(Object holder) {
        if(materialYouEnabled()){CommentsScreenTweaks.bindComment(holder);Haptics.tap(field(holder,"voteUpButton"));Haptics.tap(field(holder,"voteDownButton"));}
        if (commentLayoutEnabled()) CommentLayoutTweaks.bind(holder);
        MediaPreviewTweaks.bindComment(holder);
        if (hideDividersEnabled()) beforeCommentBind(holder);
        if (swipeActionsEnabled()) CommentSwipeActions.bind(holder);
    }
    /** Called by the native comments adapter after the actual holder binder returns. */
    public static void onRowBound(Object holder) {
        try {
            if(commentLayoutEnabled())CommentLayoutTweaks.onBound(holder);
            if(materialYouEnabled())CommentsScreenTweaks.onBound(holder);
        }catch(RuntimeException | LinkageError error){}
    }
    /** Called at bind ENTRY, before Boost reuses the holder's p0 register. */
    public static void beforeCommentBind(Object holder) {
        if(materialYouEnabled())CommentsScreenTweaks.bindLoadMore(holder);
        if(!hideDividersEnabled())return;
        // Transparent instead of GONE: retain the divider's measured height and spacing.
        Object line = field(holder, "topLine");
        if (line instanceof View) ((View) line).setAlpha(0f);
        Object root = field(holder, "a"); // RecyclerView$a0.itemView, verified in the APK.
        if (root instanceof View) hideDividers((View) root);
    }
    private static void hideDividers(View view) {
        // Restrict traversal to comment/load-more rows. IndentView is never changed.
        if (view.getClass().getName().equals("com.google.android.material.divider.MaterialDivider")) {
            view.setAlpha(0f);
        } else if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) hideDividers(group.getChildAt(i));
        }
    }
    private static final class Header implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        final Object fragment, manager;
        final ViewGroup recycler;
        final Toolbar toolbar;
        String lastSubreddit;
        TextView titleView, subtitleView;
        boolean titleClickable, subtitleClickable;
        final View.OnClickListener openSubreddit = this::openSubreddit;
        void openSubreddit(View view) {
            Object submission = field(fragment, "c");
            if (submission == null || TextUtils.isEmpty(string(submission, "S"))) return;
            try {
                ClassLoader loader = submission.getClass().getClassLoader();
                Class<?> model = Class.forName("com.rubenmayayo.reddit.models.reddit.SubscriptionViewModel", true, loader);
                Class<?> post = Class.forName("com.rubenmayayo.reddit.models.reddit.SubmissionModel", true, loader);
                Object subscription = model.getConstructor(post).newInstance(submission);
                Class.forName("az1", true, loader).getMethod("G", Context.class, model)
                    .invoke(null, toolbar.getContext(), subscription);
            } catch (Exception | LinkageError error) {
            }
        }
        CharSequence originalTitle, originalSubtitle, appliedTitle, appliedSubtitle;
        boolean collapsed;
        TextView formattedTitle;
        float originalTitleSize;
        Header(Object fragment, ViewGroup recycler, Toolbar toolbar, Object manager)
                throws NoSuchMethodException {
            this.fragment = fragment;
            this.recycler = recycler;
            this.toolbar = toolbar;
            this.manager = manager;
            originalTitle = toolbar.getTitle();
            originalSubtitle = toolbar.getSubtitle();
        }
        @Override public boolean onPreDraw() {
            try {
                // Preserve native subtitle changes (sorting, search, and comment count updates).
                if (!collapsed || !TextUtils.equals(toolbar.getTitle(), appliedTitle))
                    originalTitle = toolbar.getTitle();
                if (!collapsed || !TextUtils.equals(toolbar.getSubtitle(), appliedSubtitle))
                    originalSubtitle = toolbar.getSubtitle();
                Object submission = field(fragment, "c");
                String title = string(submission, "a0");
                String subreddit = string(submission, "S");
                boolean beyond = !TextUtils.isEmpty(title) && !TextUtils.isEmpty(subreddit);
                if (beyond) {
                    if (!subreddit.equals(lastSubreddit)) {
                        lastSubreddit = subreddit;
                        appliedTitle = "r/" + subreddit;
                    }
                    appliedSubtitle = title;
                    setText(appliedTitle, appliedSubtitle);
                    formatViews();
                    matchTitleSize();
                    collapsed = true;
                } else if (collapsed) {
                    setText(originalTitle, originalSubtitle);
                    restoreTitleSize();
                    clearClicks();
                    collapsed = false;
                }
            } catch (Exception | LinkageError e) {
                detach();
            }
            return true;
        }
        void clearClicks() {
            if (titleView != null) { titleView.setOnClickListener(null); titleView.setClickable(titleClickable); }
            if (subtitleView != null) { subtitleView.setOnClickListener(null); subtitleView.setClickable(subtitleClickable); }
            titleView = subtitleView = null;
        }
        TextView cachedTextView(TextView cached,CharSequence expected) {
            if(cached!=null && cached.getParent()==toolbar && TextUtils.equals(cached.getText(),expected))return cached;
            return textView(toolbar,expected);
        }
        void formatViews() {
            TextView title = cachedTextView(titleView, toolbar.getTitle());
            TextView subtitle = cachedTextView(subtitleView, toolbar.getSubtitle());
            if (title == titleView && subtitle == subtitleView) return;
            clearClicks();
            titleView = title; subtitleView = subtitle;
            if (title != null) { titleClickable = title.isClickable(); format(title); }
            if (subtitle != null && subtitle != title) { subtitleClickable = subtitle.isClickable(); format(subtitle); }
        }
        void format(TextView text) {
            // Calling setSingleLine on every pre-draw repeatedly requests layout.
            text.setSingleLine(true);
            text.setEllipsize(TextUtils.TruncateAt.END);
            text.setOnClickListener(openSubreddit);
        }
        void setText(CharSequence title, CharSequence subtitle) {
            if (!TextUtils.equals(toolbar.getTitle(), title)) toolbar.setTitle(title);
            if (!TextUtils.equals(toolbar.getSubtitle(), subtitle)) toolbar.setSubtitle(subtitle);
        }
        void matchTitleSize() {
            TextView title = cachedTextView(titleView, toolbar.getTitle());
            TextView subtitle = cachedTextView(subtitleView, toolbar.getSubtitle());
            if (title == null || subtitle == null || title == subtitle) return;
            if (formattedTitle != title) {
                restoreTitleSize();
                formattedTitle = title;
                originalTitleSize = title.getTextSize();
            }
            if (title.getTextSize() != subtitle.getTextSize())
                title.setTextSize(TypedValue.COMPLEX_UNIT_PX, subtitle.getTextSize());
        }
        void restoreTitleSize() {
            if (formattedTitle != null) {
                formattedTitle.setTextSize(TypedValue.COMPLEX_UNIT_PX, originalTitleSize);
                formattedTitle = null;
            }
        }
        void detach() {
            if (collapsed) setText(originalTitle, originalSubtitle);
            restoreTitleSize();
            clearClicks();
            collapsed = false;
            ViewTreeObserver observer = recycler.getViewTreeObserver();
            if (observer.isAlive()) observer.removeOnPreDrawListener(this);
            recycler.removeOnAttachStateChangeListener(this);
            HEADERS.remove(recycler);
        }
        @Override public void onViewAttachedToWindow(View view) { }
        @Override public void onViewDetachedFromWindow(View view) { detach(); }
    }
    private static TextView textView(Toolbar toolbar, CharSequence text) {
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof TextView && TextUtils.equals(((TextView) child).getText(), text))
                return (TextView) child;
        }
        return null;
    }
    static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        return context instanceof Activity ? (Activity) context : null;
    }
    static Field accessor(Object target,String name) {
        if(target==null || name==null)return null;
        synchronized(FIELDS) {
            Class<?> owner=target.getClass();Map<String,Field> fields=FIELDS.get(owner);
            if(fields==null){fields=new HashMap<>();FIELDS.put(owner,fields);}
            if(!fields.containsKey(name)) {
                Field found=null;
                for(Class<?> type=owner;type!=null;type=type.getSuperclass()) {
                    try{found=type.getDeclaredField(name);found.setAccessible(true);break;}
                    catch(NoSuchFieldException ignored) { }
                    catch(SecurityException ignored){break;}
                }
                fields.put(name,found);
            }
            return fields.get(name);
        }
    }
    static Object field(Object target,String name) {
        Field cached=accessor(target,name);
        if(cached!=null)try{return cached.get(target);}catch(ReflectiveOperationException | SecurityException ignored) { }
        return null;
    }
    private static String string(Object target, String name) {
        Object value = field(target, name);
        return value instanceof String ? (String) value : "";
    }
}
