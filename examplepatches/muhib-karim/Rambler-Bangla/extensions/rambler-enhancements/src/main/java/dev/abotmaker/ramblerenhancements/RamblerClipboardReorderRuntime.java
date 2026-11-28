/*
 * Rambler Bangla - Tap-and-hold drag-to-reorder runtime for Gboard 18.5.4 Clipboard.
 *
 * Copyright (C) 2026 muhib-karim & Rambler Bangla contributors (GPL-3.0).
 */
package dev.abotmaker.ramblerenhancements;

import android.content.ContentProviderOperation;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewConfiguration;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Enables tap-and-hold drag-to-reorder on Gboard's clipboard RecyclerView while preserving:
 * <ul>
 *   <li>Swipe left/right to delete with Undo toast</li>
 *   <li>Stationary tap-and-hold (without dragging) to open Gboard's Pin / Delete / Paste menu</li>
 *   <li>Section boundaries (Pinned stays in Pinned, Recent stays in Recent; headers stay locked)</li>
 *   <li>Persistent order across reopens/reboots via ClipboardContentProvider timestamp reassignment</li>
 * </ul>
 */
public final class RamblerClipboardReorderRuntime {
    private static final String TAG = "RamblerClipReorder";

    /** ItemTouchHelper.UP | DOWN | LEFT | RIGHT */
    static final int DRAG_DIRS_ALL = 0x0F;
    /** makeMovementFlags(DRAG_DIRS_ALL, 0) = DRAG_DIRS_ALL | (DRAG_DIRS_ALL << 16) */
    static final int DRAG_MOVEMENT_BITS = DRAG_DIRS_ALL | (DRAG_DIRS_ALL << 16);
    static final int ACTION_STATE_DRAG = 2;

    private static final ExecutorService DB_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Map<Object, DragSession> SESSIONS =
            Collections.synchronizedMap(new WeakHashMap<Object, DragSession>());
    private static volatile AdapterReflection cachedReflection;

    private RamblerClipboardReorderRuntime() {
    }

    static final class DragSession {
        Object activeHolder;
        boolean movedDuringDrag;
        boolean draggedVisually;
        int lastTargetPosition = -1;
    }

    /** Called from patched fqi.i()Z (isLongPressDragEnabled). */
    public static boolean isLongPressDragEnabled(Object adapter) {
        try {
            if (adapter == null) {
                return false;
            }
            AdapterReflection ref = reflectionFor(adapter);
            if (ref == null || ref.isEditMode(adapter)) {
                return false;
            }
            Context context = ref.context(adapter);
            return RamblerEnhancementsSettings.readClipboardDragReorderEnabled(context);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Called from patched fqi.c(RecyclerView, ViewHolder)I (getMovementFlags). */
    public static int computeMovementFlags(Object adapter, Object viewHolder, int stockFlags) {
        if (stockFlags == 0 || adapter == null || viewHolder == null) {
            return stockFlags;
        }
        try {
            if (!isLongPressDragEnabled(adapter)) {
                return stockFlags;
            }
            return stockFlags | DRAG_MOVEMENT_BITS;
        } catch (Throwable ignored) {
            return stockFlags;
        }
    }

    /** Called from patched fqi.f(ViewHolder, int)V (onSelectedChanged). */
    public static void onSelectedChanged(Object adapter, Object viewHolder, int actionState) {
        if (adapter == null || actionState != ACTION_STATE_DRAG || viewHolder == null) {
            return;
        }
        try {
            DragSession session = sessionFor(adapter);
            session.activeHolder = viewHolder;
            session.movedDuringDrag = false;
            session.draggedVisually = false;
            session.lastTargetPosition = holderAdapterPosition(viewHolder);
            View itemView = holderItemView(viewHolder);
            if (itemView != null) {
                itemView.setScaleX(1.03f);
                itemView.setScaleY(1.03f);
                itemView.setAlpha(0.94f);
                try {
                    itemView.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                } catch (Throwable ignored) {
                    // Best-effort haptic lift.
                }
            }
        } catch (Throwable err) {
            logWarn("onSelectedChanged failed", err);
        }
    }

    /** Called from patched fqi.e(...)V when actionState == ACTION_STATE_DRAG. */
    public static void onDragDraw(Object adapter, Object viewHolder, float dX, float dY) {
        if (adapter == null || viewHolder == null) {
            return;
        }
        try {
            View itemView = holderItemView(viewHolder);
            if (itemView != null) {
                itemView.setAlpha(0.94f);
                DragSession session = sessionFor(adapter);
                if (session.activeHolder == viewHolder && !session.draggedVisually) {
                    int slop = 16;
                    try {
                        Context ctx = itemView.getContext();
                        if (ctx != null) {
                            slop = Math.max(8, ViewConfiguration.get(ctx).getScaledTouchSlop());
                        }
                    } catch (Throwable ignored) {
                        // Use fallback slop.
                    }
                    if (Math.abs(dX) > slop || Math.abs(dY) > slop) {
                        session.draggedVisually = true;
                    }
                }
            }
        } catch (Throwable err) {
            logWarn("onDragDraw failed", err);
        }
    }

    /** Called from patched fqi.j(RecyclerView, ViewHolder, ViewHolder)Z (onMove). */
    @SuppressWarnings("unchecked")
    public static boolean onMove(Object adapter, Object recyclerView, Object sourceHolder, Object targetHolder) {
        if (adapter == null || sourceHolder == null || targetHolder == null) {
            return false;
        }
        try {
            AdapterReflection ref = reflectionFor(adapter);
            if (ref == null || ref.isEditMode(adapter)) {
                return false;
            }
            Context context = ref.context(adapter);
            if (!RamblerEnhancementsSettings.readClipboardDragReorderEnabled(context)) {
                return false;
            }
            int fromPos = holderAdapterPosition(sourceHolder);
            int toPos = holderAdapterPosition(targetHolder);
            List<Object> items = ref.items(adapter);
            if (items == null || !canMoveWithinSameSection(ref, items, fromPos, toPos)) {
                return false;
            }
            Object moved = items.remove(fromPos);
            items.add(toPos, moved);
            ref.notifyItemMoved(adapter, fromPos, toPos);

            DragSession session = sessionFor(adapter);
            session.movedDuringDrag = true;
            session.draggedVisually = true;
            session.lastTargetPosition = toPos;
            return true;
        } catch (Throwable err) {
            logWarn("onMove failed", err);
            return false;
        }
    }

    /** Called from patched fqi.d(RecyclerView, ViewHolder)V (clearView). */
    public static void onClearView(Object adapter, Object recyclerView, Object viewHolder) {
        if (viewHolder != null) {
            try {
                View itemView = holderItemView(viewHolder);
                if (itemView != null) {
                    itemView.setScaleX(1.0f);
                    itemView.setScaleY(1.0f);
                    itemView.setAlpha(1.0f);
                }
            } catch (Throwable ignored) {
                // Best-effort visual reset.
            }
        }
        if (adapter == null) {
            return;
        }
        try {
            DragSession session = sessionFor(adapter);
            boolean wasThisDrag = session.activeHolder == viewHolder && viewHolder != null;
            boolean moved = session.movedDuringDrag;
            boolean draggedVisually = session.draggedVisually;
            int targetPos = session.lastTargetPosition;
            if (wasThisDrag) {
                session.activeHolder = null;
                session.movedDuringDrag = false;
                session.draggedVisually = false;
                session.lastTargetPosition = -1;
            }
            if (!wasThisDrag) {
                return;
            }
            if (moved) {
                persistSectionOrder(adapter, viewHolder, targetPos);
            } else if (!draggedVisually) {
                // Stationary tap-and-hold: preserve Gboard's stock Pin / Paste / Delete popup.
                final View itemView = holderItemView(viewHolder);
                if (itemView != null) {
                    itemView.post(() -> {
                        try {
                            if (itemView.isAttachedToWindow()) {
                                itemView.performLongClick();
                            }
                        } catch (Throwable ignored) {
                            // Never disrupt clipboard UI.
                        }
                    });
                }
            }
        } catch (Throwable err) {
            logWarn("onClearView failed", err);
        }
    }

    /**
     * Pure helper (unit-tested): assigns strictly descending timestamps from the existing
     * section timestamps so reordered items persist in exact drag order without altering
     * recent-item TTL windows.
     */
    static long[] computeStrictlyDescendingTimestamps(long[] originalSectionMillis) {
        if (originalSectionMillis == null || originalSectionMillis.length == 0) {
            return new long[0];
        }
        long[] sorted = Arrays.copyOf(originalSectionMillis, originalSectionMillis.length);
        Arrays.sort(sorted);
        long[] desc = new long[sorted.length];
        for (int i = 0; i < sorted.length; i++) {
            desc[i] = sorted[sorted.length - 1 - i];
        }
        for (int i = 1; i < desc.length; i++) {
            if (desc[i] >= desc[i - 1]) {
                desc[i] = desc[i - 1] - 1L;
            }
        }
        return desc;
    }

    /**
     * Pure helper (unit-tested): validates that {@code fromPos} and {@code toPos} belong to the
     * same contiguous non-header section (Recent ↔ Recent or Pinned ↔ Pinned).
     */
    static boolean canMoveWithinSameSection(int[] sectionKinds, int fromPos, int toPos) {
        if (sectionKinds == null || fromPos < 0 || toPos < 0
                || fromPos >= sectionKinds.length || toPos >= sectionKinds.length
                || fromPos == toPos) {
            return false;
        }
        int kind = sectionKinds[fromPos];
        if (kind <= 0 || sectionKinds[toPos] != kind) {
            return false;
        }
        int lo = Math.min(fromPos, toPos);
        int hi = Math.max(fromPos, toPos);
        for (int i = lo; i <= hi; i++) {
            if (sectionKinds[i] != kind) {
                return false;
            }
        }
        return true;
    }

    private static boolean canMoveWithinSameSection(
            AdapterReflection ref, List<Object> items, int fromPos, int toPos) throws Throwable {
        if (fromPos < 0 || toPos < 0 || fromPos >= items.size() || toPos >= items.size() || fromPos == toPos) {
            return false;
        }
        int kind = ref.sectionKind(items.get(fromPos));
        if (kind <= 0 || ref.sectionKind(items.get(toPos)) != kind) {
            return false;
        }
        int lo = Math.min(fromPos, toPos);
        int hi = Math.max(fromPos, toPos);
        for (int i = lo; i <= hi; i++) {
            if (ref.sectionKind(items.get(i)) != kind) {
                return false;
            }
        }
        return true;
    }

    private static void persistSectionOrder(Object adapter, Object viewHolder, int fallbackPos) {
        try {
            AdapterReflection ref = reflectionFor(adapter);
            if (ref == null) {
                return;
            }
            Context context = ref.context(adapter);
            List<Object> items = ref.items(adapter);
            if (context == null || items == null || items.isEmpty()) {
                return;
            }
            int pos = holderAdapterPosition(viewHolder);
            if (pos < 0 || pos >= items.size()) {
                pos = fallbackPos;
            }
            if (pos < 0 || pos >= items.size()) {
                return;
            }
            int kind = ref.sectionKind(items.get(pos));
            if (kind <= 0) {
                return;
            }
            int start = pos;
            while (start > 0 && ref.sectionKind(items.get(start - 1)) == kind) {
                start--;
            }
            int end = pos;
            while (end + 1 < items.size() && ref.sectionKind(items.get(end + 1)) == kind) {
                end++;
            }
            int count = end - start + 1;
            if (count < 2) {
                return;
            }
            List<Object> sectionClips = new ArrayList<Object>(count);
            long[] originalMillis = new long[count];
            for (int i = 0; i < count; i++) {
                Object clip = items.get(start + i);
                sectionClips.add(clip);
                originalMillis[i] = ref.clipTimestampMillis(clip);
            }
            long[] targetMillis = computeStrictlyDescendingTimestamps(originalMillis);
            Object keyboard = ref.keyboard(adapter);
            final List<Object> changedClips = new ArrayList<Object>(count);
            for (int i = 0; i < count; i++) {
                if (originalMillis[i] != targetMillis[i]) {
                    Object clip = sectionClips.get(i);
                    ref.updateClipTimestamp(keyboard, clip, targetMillis[i]);
                    changedClips.add(clip);
                }
            }
            if (changedClips.isEmpty()) {
                return;
            }
            final Context appContext = context.getApplicationContext() != null
                    ? context.getApplicationContext()
                    : context;
            final AdapterReflection finalRef = ref;
            DB_EXECUTOR.execute(() -> {
                try {
                    finalRef.persistUpdatedClips(appContext, changedClips);
                } catch (Throwable err) {
                    logWarn("Failed to persist reordered clipboard items", err);
                }
            });
        } catch (Throwable err) {
            logWarn("persistSectionOrder failed", err);
        }
    }

    private static DragSession sessionFor(Object adapter) {
        synchronized (SESSIONS) {
            DragSession existing = SESSIONS.get(adapter);
            if (existing == null) {
                existing = new DragSession();
                SESSIONS.put(adapter, existing);
            }
            return existing;
        }
    }

    private static int holderAdapterPosition(Object viewHolder) {
        if (viewHolder == null) {
            return -1;
        }
        try {
            Method m = viewHolder.getClass().getMethod("b");
            Object res = m.invoke(viewHolder);
            return res instanceof Integer ? ((Integer) res).intValue() : -1;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    private static View holderItemView(Object viewHolder) {
        if (viewHolder == null) {
            return null;
        }
        Class<?> cls = viewHolder.getClass();
        while (cls != null && cls != Object.class) {
            try {
                Field f = cls.getDeclaredField("a");
                if (View.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    Object v = f.get(viewHolder);
                    return v instanceof View ? (View) v : null;
                }
            } catch (NoSuchFieldException ignored) {
                // Walk superclass (kr).
            } catch (Throwable ignored) {
                return null;
            }
            cls = cls.getSuperclass();
        }
        return null;
    }

    private static AdapterReflection reflectionFor(Object adapter) {
        AdapterReflection cached = cachedReflection;
        if (cached != null && cached.adapterClass == adapter.getClass()) {
            return cached;
        }
        try {
            AdapterReflection created = new AdapterReflection(adapter.getClass());
            cachedReflection = created;
            return created;
        } catch (Throwable err) {
            logWarn("Failed to bind clipboard adapter reflection", err);
            return null;
        }
    }

    private static void logWarn(String message, Throwable err) {
        try {
            Log.w(TAG, message, err);
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    private static final class AdapterReflection {
        final Class<?> adapterClass;
        final Field contextField;
        final Field editModeField;
        final Field itemsField;
        final Field keyboardField;
        final Method notifyItemMovedMethod;

        final Class<?> clipClass;
        final Field clipIdField;
        final Field clipTimestampField;
        final Method clipViewTypeMethod;
        final Method clipIsPinnedMethod;
        final Method clipIsSpecialMethod;
        final Method clipUriMethod;

        final Class<?> queryUtilsClass;
        final Method buildUriMethod;
        final Method buildUpsertOpMethod;
        volatile Method keyboardRenameTimestampMethod;
        volatile boolean keyboardRenameLookupDone;

        AdapterReflection(Class<?> adapterClass) throws Throwable {
            this.adapterClass = adapterClass;
            ClassLoader loader = adapterClass.getClassLoader();
            this.contextField = declaredField(adapterClass, "e");
            this.editModeField = declaredField(adapterClass, "f");
            this.itemsField = declaredField(adapterClass, "n");
            this.keyboardField = declaredField(adapterClass, "w");
            this.notifyItemMovedMethod = adapterClass.getMethod("gG", int.class, int.class);

            this.clipClass = Class.forName("fpk", false, loader);
            this.clipIdField = declaredField(clipClass, "d");
            this.clipTimestampField = declaredField(clipClass, "e");
            this.clipViewTypeMethod = clipClass.getMethod("g");
            this.clipIsPinnedMethod = clipClass.getMethod("n");
            this.clipIsSpecialMethod = clipClass.getMethod("o");
            this.clipUriMethod = clipClass.getMethod("j");

            this.queryUtilsClass = Class.forName("fqr", false, loader);
            this.buildUriMethod = queryUtilsClass.getMethod("d", Context.class, int.class, long.class);
            this.buildUpsertOpMethod = queryUtilsClass.getMethod("b", Uri.class, clipClass);
        }

        private static Field declaredField(Class<?> cls, String name) throws NoSuchFieldException {
            Field f = cls.getDeclaredField(name);
            f.setAccessible(true);
            return f;
        }

        Context context(Object adapter) throws Throwable {
            Object v = contextField.get(adapter);
            return v instanceof Context ? (Context) v : null;
        }

        boolean isEditMode(Object adapter) throws Throwable {
            return editModeField.getBoolean(adapter);
        }

        @SuppressWarnings("unchecked")
        List<Object> items(Object adapter) throws Throwable {
            Object v = itemsField.get(adapter);
            return v instanceof List ? (List<Object>) v : null;
        }

        Object keyboard(Object adapter) throws Throwable {
            return keyboardField.get(adapter);
        }

        void notifyItemMoved(Object adapter, int fromPos, int toPos) throws Throwable {
            notifyItemMovedMethod.invoke(adapter, Integer.valueOf(fromPos), Integer.valueOf(toPos));
        }

        /**
         * Returns 0 for headers / invalid items, 1 for Recent, 2 for Pinned, 3 for Special.
         */
        int sectionKind(Object clip) throws Throwable {
            if (clip == null || !clipClass.isInstance(clip)) {
                return 0;
            }
            long id = clipIdField.getLong(clip);
            if (id < 0L) {
                return 0;
            }
            Object viewType = clipViewTypeMethod.invoke(clip);
            if (!(viewType instanceof Integer) || ((Integer) viewType).intValue() != 0) {
                return 0;
            }
            if (Boolean.TRUE.equals(clipIsPinnedMethod.invoke(clip))) {
                return 2;
            }
            if (Boolean.TRUE.equals(clipIsSpecialMethod.invoke(clip))) {
                return 3;
            }
            return 1;
        }

        long clipTimestampMillis(Object clip) throws Throwable {
            Object instant = clipTimestampField.get(clip);
            if (instant == null) {
                return 0L;
            }
            Method toEpochMilli = instant.getClass().getMethod("toEpochMilli");
            Object res = toEpochMilli.invoke(instant);
            return res instanceof Number ? ((Number) res).longValue() : 0L;
        }

        void updateClipTimestamp(Object keyboard, Object clip, long newMillis) throws Throwable {
            Object existingInstant = clipTimestampField.get(clip);
            if (existingInstant == null) {
                return;
            }
            Class<?> instantClass = existingInstant.getClass();
            Method ofEpochMilli = instantClass.getMethod("ofEpochMilli", long.class);
            Object newInstant = ofEpochMilli.invoke(null, Long.valueOf(newMillis));

            // If this is an image clip, use ClipboardKeyboard.ab(fpk, Instant) so the backing
            // image file is renamed cleanly alongside the new timestamp.
            Object uriObj = clipUriMethod.invoke(clip);
            String uriStr = uriObj instanceof String ? (String) uriObj : null;
            if (!TextUtils.isEmpty(uriStr) && keyboard != null) {
                Method renameMethod = resolveKeyboardRenameMethod(keyboard.getClass(), instantClass);
                if (renameMethod != null) {
                    renameMethod.invoke(keyboard, clip, newInstant);
                    return;
                }
            }
            clipTimestampField.set(clip, newInstant);
        }

        private Method resolveKeyboardRenameMethod(Class<?> keyboardClass, Class<?> instantClass) {
            if (keyboardRenameLookupDone) {
                return keyboardRenameTimestampMethod;
            }
            Method found = null;
            try {
                Method direct = keyboardClass.getDeclaredMethod("ab", clipClass, instantClass);
                direct.setAccessible(true);
                found = direct;
            } catch (NoSuchMethodException ignored) {
                for (Method m : keyboardClass.getDeclaredMethods()) {
                    Class<?>[] params = m.getParameterTypes();
                    if (m.getReturnType() == void.class
                            && params.length == 2
                            && params[0] == clipClass
                            && params[1] == instantClass) {
                        m.setAccessible(true);
                        found = m;
                        break;
                    }
                }
            }
            keyboardRenameTimestampMethod = found;
            keyboardRenameLookupDone = true;
            return found;
        }

        void persistUpdatedClips(Context context, List<Object> clips) throws Throwable {
            ArrayList<ContentProviderOperation> ops = new ArrayList<ContentProviderOperation>(clips.size());
            String authority = null;
            for (Object clip : clips) {
                long id = clipIdField.getLong(clip);
                Uri uri = (Uri) buildUriMethod.invoke(null, context, Integer.valueOf(1), Long.valueOf(id));
                if (uri == null) {
                    continue;
                }
                if (authority == null) {
                    authority = uri.getAuthority();
                }
                ContentProviderOperation op = (ContentProviderOperation) buildUpsertOpMethod.invoke(null, uri, clip);
                if (op != null) {
                    ops.add(op);
                }
            }
            if (!ops.isEmpty() && !TextUtils.isEmpty(authority)) {
                context.getContentResolver().applyBatch(authority, ops);
            }
        }
    }
}
