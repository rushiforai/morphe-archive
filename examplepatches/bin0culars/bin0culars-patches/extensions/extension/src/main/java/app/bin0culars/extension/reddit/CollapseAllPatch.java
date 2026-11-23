package app.bin0culars.extension.reddit;

import android.content.Context;
import android.view.Choreographer;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

public final class CollapseAllPatch {

    private static final Set<Object> REGISTERED_POST_CLICKS =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static final Function0<Object> OUR_CLICK = new Function0<Object>() {
        @Override
        public Object invoke() {
            handleCollapseAllTap();
            return null;
        }
    };
    private static final AtomicBoolean BATCH_IN_PROGRESS = new AtomicBoolean(false);

    private static volatile Context appContext;
    private static volatile Method cachedStartGroupMethod;
    private static volatile Method cachedEndGroupMethod;
    private static volatile Field cachedActionFunction0Field;
    private static volatile Object cachedOurAction;
    private static volatile Object cachedOurIcon;
    private static volatile Method cachedPillMethod;

    private static volatile WeakReference<Object> commentStoreRef;
    private static volatile Class<?> commentClass;
    private static volatile Method getDepthMethod;
    private static volatile Method getCollapsedMethod;
    private static volatile Method getKindWithIdMethod;

    private static final class CommentInfo {
        final String id;
        final int depth;
        final boolean collapsed;

        CommentInfo(String id, int depth, boolean collapsed) {
            this.id = id;
            this.depth = depth;
            this.collapsed = collapsed;
        }
    }

    private static final class OpBlock implements Function2<Object, Object, Object> {
        private final Object store;
        private final Object op;

        OpBlock(Object store, Object op) {
            this.store = store;
            this.op = op;
        }

        @Override
        public Object invoke(Object scope, Object continuation) {
            try {
                return dispatch(store, op, continuation);
            } catch (Throwable ignored) {
                return null;
            }
        }
    }

    private static String startGroupName() {
        return "";
    }

    private static String endGroupName() {
        return "";
    }

    private static String pillOwner() {
        return "";
    }

    private static String pillName() {
        return "";
    }

    private static List<?> commentIds(Object store) {
        return null;
    }

    private static Object commentById(Object store, Object id) {
        return null;
    }

    private static Object newCollapseOp(String id, Object scratch) {
        return null;
    }

    private static Object newExpandOp(String id, Object scratch) {
        return null;
    }

    private static Object dispatch(Object store, Object op, Object continuation) {
        return null;
    }

    private static void launch(Object store, Object block, Object scratch1, Object scratch2, int scratch3) {
    }

    public static void setCommentStore(Object store) {
        if (store != null) {
            commentStoreRef = new WeakReference<>(store);
        }
    }

    public static void registerPostCommentsClick(Object onClick) {
        if (onClick != null) {
            REGISTERED_POST_CLICKS.add(onClick);
        }
    }

    public static void drawCollapsePill(
            Object commentAction,
            Object commentIcon,
            Object style,
            Object slot,
            Object modifier,
            Object count,
            Object composer,
            int changed) {
        if (composer == null) {
            return;
        }
        try {
            if (cachedStartGroupMethod == null || cachedEndGroupMethod == null) {
                initComposerMethods(composer.getClass());
            }
            if (cachedStartGroupMethod == null || cachedEndGroupMethod == null) {
                return;
            }

            cachedStartGroupMethod.invoke(composer, 0x0B1C0055);
            try {
                if (BinocularsMods.isEnabled("collapse_all_button")
                        && commentAction != null
                        && isRegisteredPostClick(commentAction)) {
                    ensureOurAction(commentAction);
                    ensureOurIcon(commentIcon);
                    ensurePillMethod(commentAction);

                    if (cachedPillMethod != null && cachedOurAction != null && cachedOurIcon != null) {
                        cachedPillMethod.invoke(null, cachedOurAction, cachedOurIcon, style, slot, null, null, composer, 0);
                    }
                }
            } finally {
                cachedEndGroupMethod.invoke(composer, false);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void handleCollapseAllTap() {
        if (!BATCH_IN_PROGRESS.compareAndSet(false, true)) {
            return;
        }
        try {
            WeakReference<Object> ref = commentStoreRef;
            if (ref == null) {
                BATCH_IN_PROGRESS.set(false);
                return;
            }
            Object store = ref.get();
            if (store == null) {
                BATCH_IN_PROGRESS.set(false);
                return;
            }
            List<?> ids = commentIds(store);
            if (ids == null || ids.isEmpty()) {
                BATCH_IN_PROGRESS.set(false);
                return;
            }

            ensureCommentMethods(store.getClass().getClassLoader());
            if (commentClass == null || getDepthMethod == null || getCollapsedMethod == null || getKindWithIdMethod == null) {
                BATCH_IN_PROGRESS.set(false);
                return;
            }

            List<CommentInfo> comments = new ArrayList<>();
            for (Object id : ids) {
                if (id == null) {
                    continue;
                }
                String idStr = id.toString();
                Object commentObj = commentById(store, idStr);
                if (commentObj != null && commentClass.isInstance(commentObj)) {
                    int depth = ((Number) getDepthMethod.invoke(commentObj)).intValue();
                    boolean collapsed = Boolean.TRUE.equals(getCollapsedMethod.invoke(commentObj));
                    String kindWithId = (String) getKindWithIdMethod.invoke(commentObj);
                    if (kindWithId != null) {
                        comments.add(new CommentInfo(kindWithId, depth, collapsed));
                    }
                }
            }

            if (comments.isEmpty()) {
                BATCH_IN_PROGRESS.set(false);
                return;
            }

            int top = Integer.MAX_VALUE;
            for (CommentInfo c : comments) {
                if (c.depth < top) {
                    top = c.depth;
                }
            }

            String scope = BinocularsMods.getChoice("collapse_all_scope");
            int targetDepth = top;
            if ("replies".equals(scope)) {
                targetDepth = top + 1;
            } else if ("deep".equals(scope)) {
                targetDepth = top + 2;
            }

            boolean anyTargetNotCollapsed = false;
            for (CommentInfo c : comments) {
                if (c.depth == targetDepth && !c.collapsed) {
                    anyTargetNotCollapsed = true;
                    break;
                }
            }

            final List<Object> ops = new ArrayList<>();
            if (anyTargetNotCollapsed) {
                for (CommentInfo c : comments) {
                    if (c.depth == targetDepth && !c.collapsed) {
                        ops.add(newCollapseOp(c.id, null));
                    }
                }
            } else {
                for (CommentInfo c : comments) {
                    if (c.collapsed) {
                        ops.add(newExpandOp(c.id, null));
                    }
                }
            }

            if (ops.isEmpty()) {
                BATCH_IN_PROGRESS.set(false);
                return;
            }

            final Object currentStore = store;
            Choreographer.getInstance().postFrameCallback(new Choreographer.FrameCallback() {
                private int index = 0;

                @Override
                public void doFrame(long frameTimeNanos) {
                    try {
                        if (index < ops.size()) {
                            Object op = ops.get(index);
                            index++;
                            launch(currentStore, new OpBlock(currentStore, op), null, null, 0);
                        }
                        if (index < ops.size()) {
                            Choreographer.getInstance().postFrameCallback(this);
                        } else {
                            BATCH_IN_PROGRESS.set(false);
                        }
                    } catch (Throwable ignored) {
                        BATCH_IN_PROGRESS.set(false);
                    }
                }
            });
        } catch (Throwable ignored) {
            BATCH_IN_PROGRESS.set(false);
        }
    }

    private static void ensureCommentMethods(ClassLoader cl) {
        if (commentClass != null && getDepthMethod != null && getCollapsedMethod != null && getKindWithIdMethod != null) {
            return;
        }
        try {
            Class<?> clazz = null;
            if (cl != null) {
                try {
                    clazz = Class.forName("com.reddit.domain.model.Comment", false, cl);
                } catch (Throwable ignored) {
                }
            }
            if (clazz == null) {
                try {
                    clazz = Class.forName("com.reddit.domain.model.Comment");
                } catch (Throwable ignored) {
                }
            }
            if (clazz != null) {
                commentClass = clazz;
                getDepthMethod = findMethodNoArgs(clazz, "getDepth");
                getCollapsedMethod = findMethodNoArgs(clazz, "getCollapsed");
                getKindWithIdMethod = findMethodNoArgs(clazz, "getKindWithId");
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isRegisteredPostClick(Object commentAction) {
        try {
            if (cachedActionFunction0Field == null) {
                for (Field f : commentAction.getClass().getDeclaredFields()) {
                    if (Function0.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        cachedActionFunction0Field = f;
                        break;
                    }
                }
            }
            if (cachedActionFunction0Field != null) {
                Object onClick = cachedActionFunction0Field.get(commentAction);
                return onClick != null && REGISTERED_POST_CLICKS.contains(onClick);
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void ensureOurAction(Object commentAction) {
        if (cachedOurAction != null || commentAction == null) {
            return;
        }
        try {
            Context context = getAppContext();
            String desc = "";
            if (context != null) {
                int descId = context.getResources().getIdentifier(
                        "bin0culars_collapse_all_desc", "string", context.getPackageName());
                if (descId != 0) {
                    desc = context.getString(descId);
                }
            }
            for (Constructor<?> ctor : commentAction.getClass().getDeclaredConstructors()) {
                if (ctor.getParameterTypes().length == 7) {
                    ctor.setAccessible(true);
                    cachedOurAction = ctor.newInstance(desc, null, null, true, OUR_CLICK, 0L, 6);
                    break;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void ensureOurIcon(Object commentIcon) {
        if (cachedOurIcon != null || commentIcon == null) {
            return;
        }
        try {
            Context context = getAppContext();
            int drawableId = 0;
            if (context != null) {
                drawableId = context.getResources().getIdentifier("icon_caret_up_down", "drawable", context.getPackageName());
            }

            long size = 0L;
            boolean boolVal = false;
            for (Field f : commentIcon.getClass().getDeclaredFields()) {
                if (f.getType() == long.class) {
                    f.setAccessible(true);
                    size = f.getLong(commentIcon);
                } else if (f.getType() == boolean.class) {
                    f.setAccessible(true);
                    boolVal = f.getBoolean(commentIcon);
                }
            }

            for (Constructor<?> ctor : commentIcon.getClass().getDeclaredConstructors()) {
                Class<?>[] params = ctor.getParameterTypes();
                if (params.length == 3 && params[0] == long.class && params[1] == int.class && params[2] == boolean.class) {
                    ctor.setAccessible(true);
                    cachedOurIcon = ctor.newInstance(size, drawableId, boolVal);
                    break;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void ensurePillMethod(Object fallbackObject) {
        if (cachedPillMethod != null) {
            return;
        }
        try {
            String ownerName = pillOwner();
            String methodName = pillName();
            if (ownerName.isEmpty() || methodName.isEmpty()) {
                return;
            }
            Class<?> ownerClass = null;
            if (fallbackObject != null) {
                try {
                    ownerClass = Class.forName(ownerName, false, fallbackObject.getClass().getClassLoader());
                } catch (Throwable ignored) {
                }
            }
            if (ownerClass == null) {
                ownerClass = Class.forName(ownerName);
            }
            for (Method m : ownerClass.getDeclaredMethods()) {
                if (Modifier.isStatic(m.getModifiers())
                        && m.getName().equals(methodName)
                        && m.getParameterTypes().length == 8) {
                    m.setAccessible(true);
                    cachedPillMethod = m;
                    break;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void initComposerMethods(Class<?> composerClass) {
        try {
            String startName = startGroupName();
            String endName = endGroupName();
            if (startName.isEmpty() || endName.isEmpty()) {
                return;
            }
            cachedStartGroupMethod = findMethod(composerClass, startName, int.class);
            cachedEndGroupMethod = findMethod(composerClass, endName, boolean.class);
        } catch (Throwable ignored) {
        }
    }

    private static Method findMethodNoArgs(Class<?> clazz, String name) {
        try {
            Method m = clazz.getMethod(name);
            if (m != null) {
                m.setAccessible(true);
                return m;
            }
        } catch (Throwable ignored) {
        }
        Class<?> curr = clazz;
        while (curr != null) {
            for (Method m : curr.getDeclaredMethods()) {
                if (m.getName().equals(name) && m.getParameterTypes().length == 0) {
                    m.setAccessible(true);
                    return m;
                }
            }
            for (Class<?> iface : curr.getInterfaces()) {
                for (Method m : iface.getDeclaredMethods()) {
                    if (m.getName().equals(name) && m.getParameterTypes().length == 0) {
                        m.setAccessible(true);
                        return m;
                    }
                }
            }
            curr = curr.getSuperclass();
        }
        return null;
    }

    private static Method findMethod(Class<?> clazz, String name, Class<?> paramType) {
        try {
            Method m = clazz.getMethod(name, paramType);
            if (m != null) {
                m.setAccessible(true);
                return m;
            }
        } catch (Throwable ignored) {
        }
        Class<?> curr = clazz;
        while (curr != null) {
            for (Method m : curr.getDeclaredMethods()) {
                if (m.getName().equals(name)) {
                    Class<?>[] p = m.getParameterTypes();
                    if (p.length == 1 && p[0] == paramType) {
                        m.setAccessible(true);
                        return m;
                    }
                }
            }
            for (Class<?> iface : curr.getInterfaces()) {
                for (Method m : iface.getDeclaredMethods()) {
                    if (m.getName().equals(name)) {
                        Class<?>[] p = m.getParameterTypes();
                        if (p.length == 1 && p[0] == paramType) {
                            m.setAccessible(true);
                            return m;
                        }
                    }
                }
            }
            curr = curr.getSuperclass();
        }
        return null;
    }

    private static Context getAppContext() {
        if (appContext != null) {
            return appContext;
        }
        try {
            appContext = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {
        }
        return appContext;
    }
}
