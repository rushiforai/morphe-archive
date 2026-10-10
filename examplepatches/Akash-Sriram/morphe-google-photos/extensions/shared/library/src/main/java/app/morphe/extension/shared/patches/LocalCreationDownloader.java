package app.morphe.extension.shared.patches;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.media.ExifInterface;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.SimpleTimeZone;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Intercepts saving memory collages in Google Photos.
 * Instead of committing the collage solely to Google's cloud server (which debits account storage quota),
 * this downloader exports the image stream directly to the device's DCIM/Google Photos folder.
 * Google Photos then detects the local file and backs it up under the Pixel XL quota-free exemption.
 *
 * Highlight videos are intentionally NOT intercepted — Google Photos handles their export natively
 * via its own pending-download pipeline (Lbgth;), naming them <Fife_hash>-ExportedMemoryVideo.mp4
 * and later renaming to IMG_<yyyyMMdd_HHmmss>-VIDEO_HIGHLIGHT.mp4.
 *
 * It also hooks into SaveCreationMixin->e(bwel) to check if a collage has already been saved
 * locally. While the permanent saved flag (SharedPreferences) is set, the Save button is
 * suppressed/hidden (matching official behavior), even if the local file is deleted later.
 */
public class LocalCreationDownloader {
    public static final String ACTION_CLEAR_SAVED_MEMORIES = "app.morphe.action.CLEAR_SAVED_MEMORIES";
    private static final String TAG = "LocalCreationDownloader";
    private static final String PREFS_NAME = "morphe_saved_creations";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Set<String> sSavedKeys = Collections.synchronizedSet(new HashSet<>());
    private static final Map<String, Object> sCardMediaMap = new ConcurrentHashMap<>();
    private static final Map<Object, Object> sWsfMediaMap = new ConcurrentHashMap<>();
    private static volatile boolean sReceiverRegistered = false;
    private static volatile Context sAppContext = null;
    private static volatile java.lang.ref.WeakReference<Object> sCurrentMfyMixin = null;
    private static volatile java.lang.ref.WeakReference<Object> sCurrentPresenter = null;

    public static synchronized void clearSavedRegistry(Context context) {
        sSavedKeys.clear();
        sCardMediaMap.clear();
        sWsfMediaMap.clear();
        Context ctx = context != null ? context.getApplicationContext() : getApplicationContext();
        if (ctx != null) {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            prefs.edit().clear().commit();
        }
        // Clean up test collages in DCIM/Google Photos so testing from scratch is 100% clean
        try {
            File dir = getGooglePhotosDir();
            if (dir.exists()) {
                File[] files = dir.listFiles((d, name) -> name.contains("-COLLAGE") || name.contains("-ANIMATION"));
                if (files != null) {
                    for (File f : files) {
                        f.delete();
                    }
                }
            }
        } catch (Throwable ignored) {}
        Log.i(TAG, "Cleared saved memories registry and cleaned local test creations.");
    }

    private static void ensureReceiverRegistered(Context context) {
        if (sReceiverRegistered || context == null) return;
        synchronized (LocalCreationDownloader.class) {
            if (sReceiverRegistered) return;
            try {
                Context appCtx = context.getApplicationContext();
                BroadcastReceiver receiver = new BroadcastReceiver() {
                    @Override
                    public void onReceive(Context ctx, Intent intent) {
                        if (intent != null && ACTION_CLEAR_SAVED_MEMORIES.equals(intent.getAction())) {
                            clearSavedRegistry(ctx);
                            MAIN_HANDLER.post(() -> {
                                Toast.makeText(ctx, "Morphe: Saved memories registry reset", Toast.LENGTH_SHORT).show();
                            });
                        }
                    }
                };
                IntentFilter filter = new IntentFilter(ACTION_CLEAR_SAVED_MEMORIES);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    appCtx.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
                } else {
                    appCtx.registerReceiver(receiver, filter);
                }
                sReceiverRegistered = true;
                Log.i(TAG, "Registered broadcast receiver for " + ACTION_CLEAR_SAVED_MEMORIES);
            } catch (Throwable t) {
                Log.w(TAG, "Failed registering clear receiver", t);
            }
        }
    }

    /**
     * Interception entry point called directly from SaveCreationMixin (Lakxr->h).
     *
     * @param saveCreationMixin The SaveCreationMixin instance (this)
     * @param mediaList         The collection of media items (Collection<_1846>) to save
     * @return true if intercepted and handled locally; false to allow Google Photos standard cloud save
     */
    public static boolean onSaveRequested(Object saveCreationMixin, Object mediaList) {
        if (saveCreationMixin == null || mediaList == null) {
            return false;
        }

        try {
            Context context = extractContext(saveCreationMixin);
            if (context == null) {
                context = getApplicationContext();
            }
            if (context != null) {
                sAppContext = context.getApplicationContext();
                ensureReceiverRegistered(sAppContext);
            }

            Collection<?> items = (mediaList instanceof Collection)
                    ? (Collection<?>) mediaList
                    : null;
            if (items == null || items.isEmpty()) {
                return false;
            }

            // Check if all items in the request are already saved locally
            boolean allAlreadySaved = true;
            for (Object media : items) {
                if (media != null && !isCreationSaved(media)) {
                    allAlreadySaved = false;
                    break;
                }
            }

            if (allAlreadySaved) {
                Log.i(TAG, "Creation is already saved locally on device. Suppressing duplicate download.");
                notifySaveListeners(saveCreationMixin, mediaList);
                notifyStoryUi(saveCreationMixin);
                return true;
            }


            final Context appContext = sAppContext != null ? sAppContext : context.getApplicationContext();

            // Pre-validate that at least one item can be resolved to a downloadable URI.
            // If URI resolution fails (e.g. unknown obfuscation drift), gracefully fallback
            // to Google Photos standard cloud save so the user's save is never dropped.
            boolean canResolveLocally = false;
            for (Object media : items) {
                if (media != null && resolveMediaUri(appContext, media) != null) {
                    canResolveLocally = true;
                    break;
                }
            }

            if (!canResolveLocally) {
                Log.w(TAG, "Cannot resolve local URI for creation item(s). Falling back to Google Photos standard cloud save.");
                return false;
            }

            // Immediately mark items as saved synchronously to suppress consecutive clicks
            for (Object media : items) {
                if (media == null) continue;
                String itemKey = extractItemKey(media);
                CreationTime time = extractCreationTime(media);
                String fileName = (time != null && time.utcMs > 0) ? getOfficialCollageFileName(time) : null;
                long utcMs = time != null ? time.utcMs : 0;
                recordSavedItem(appContext, itemKey, null, fileName, null, utcMs);
            }

            // Immediately notify story UI and listeners so the button changes to Saved / hides
            notifySaveListeners(saveCreationMixin, mediaList);
            notifyStoryUi(saveCreationMixin);

            Log.i(TAG, "Intercepted creation save request for " + items.size() + " item(s). Redirecting to DCIM/Google Photos.");

            // Dispatch background save to avoid blocking the main UI thread
            EXECUTOR.execute(() -> {
                int successCount = 0;
                for (Object media : items) {
                    if (media == null) continue;
                    if (saveSingleItem(appContext, media)) {
                        successCount++;
                    }
                }

                final int saved = successCount;
                MAIN_HANDLER.post(() -> {
                    if (saved > 0) {
                        Log.i(TAG, "Successfully exported " + saved + " creation(s) to DCIM/Google Photos.");
                        notifySaveListeners(saveCreationMixin, mediaList);
                        notifyStoryUi(saveCreationMixin);
                    } else {
                        Log.w(TAG, "Failed to resolve local stream for creation item(s).");
                    }
                });
            });

            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Error during onSaveRequested interception", t);
            return false;
        }
    }

    /**
     * Intercepts saving Made-For-You creations from MFYCreationMixin (Lqkq->d).
     */
    public static boolean onMfySaveRequested(Object mfyMixin, Object mediaItem, String id) {
        if (mfyMixin == null || mediaItem == null) return false;
        try {
            sCurrentMfyMixin = new java.lang.ref.WeakReference<>(mfyMixin);
            Context context = extractContext(mfyMixin);
            if (context == null) context = getApplicationContext();
            if (context != null) {
                sAppContext = context.getApplicationContext();
                ensureReceiverRegistered(sAppContext);
            }
            final Context appContext = sAppContext != null ? sAppContext : (context != null ? context.getApplicationContext() : null);

            CreationTime time = extractCreationTime(mediaItem);
            String collageFileName = (time != null && time.utcMs > 0) ? getOfficialCollageFileName(time) : null;
            String animFileName = (time != null && time.utcMs > 0) ? ("IMG_" + time.formatLocalFileName() + "-ANIMATION.mp4") : null;
            File targetCollage = (collageFileName != null) ? new File(getGooglePhotosDir(), collageFileName) : null;
            File targetAnim = (animFileName != null) ? new File(getGooglePhotosDir(), animFileName) : null;
            boolean fileOnDisk = (targetCollage != null && targetCollage.exists()) || (targetAnim != null && targetAnim.exists());

            // If already saved AND the file is physically present on disk, suppress duplicate download
            if (fileOnDisk && (isCreationSaved(mediaItem) || isCardSaved(id))) {
                Log.i(TAG, "MFY creation " + id + " file exists and is already saved locally. Suppressing duplicate download.");
                recordCardSaved(id);
                updateMfySaveStatus(mfyMixin, id, true);
                return true;
            }

            // Immediately mark as saved in memory/prefs to prevent double clicks
            String itemKey = extractItemKey(mediaItem);
            long utcMs = time != null ? time.utcMs : 0;
            if (appContext != null) {
                recordSavedItem(appContext, itemKey, id, collageFileName, null, utcMs);
            }

            // Set saving status (saved = false) in MFY UI state flow immediately
            updateMfySaveStatus(mfyMixin, id, false);
            Log.i(TAG, "Intercepted MFY creation save for ID " + id + ". Redirecting to DCIM/Google Photos.");

            EXECUTOR.execute(() -> {
                if (appContext != null) {
                    boolean success = saveSingleItem(appContext, mediaItem);
                    MAIN_HANDLER.post(() -> {
                        if (success) {
                            recordCardSaved(id);
                            updateMfySaveStatus(mfyMixin, id, true);
                            Log.i(TAG, "Successfully exported MFY creation " + id + " to DCIM/Google Photos.");
                        } else {
                            Log.w(TAG, "Failed exporting MFY creation " + id);
                        }
                    });
                }
            });
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Error during onMfySaveRequested interception", t);
            return false;
        }
    }

    private static Object resolveStatusObject(boolean saved) {
        String[] classCandidates = saved
                ? new String[]{"qlq", "qoe", "qod"}
                : new String[]{"qlp", "qoc"};
        for (String cls : classCandidates) {
            try {
                Class<?> c = Class.forName(cls);
                Field aField = c.getDeclaredField("a");
                if (Modifier.isStatic(aField.getModifiers())) {
                    aField.setAccessible(true);
                    Object val = aField.get(null);
                    if (val != null) return val;
                }
            } catch (Throwable ignored) {}
        }
        return null;
    }

    public static void onMfyMixinBound(Object mfyMixin) {
        if (mfyMixin == null) return;
        try {
            sCurrentMfyMixin = new java.lang.ref.WeakReference<>(mfyMixin);
            Context ctx = getApplicationContext();
            if (ctx == null) return;
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            Map<String, ?> all = prefs.getAll();
            if (all == null || all.isEmpty()) return;

            Field bField = null;
            try {
                bField = mfyMixin.getClass().getDeclaredField("b");
            } catch (Throwable ignored) {}
            if (bField == null) {
                for (Field f : mfyMixin.getClass().getDeclaredFields()) {
                    String typeName = f.getType().getName();
                    if (typeName.contains("crny") || typeName.contains("StateFlow") || typeName.contains("ctcj")) {
                        bField = f;
                        break;
                    }
                }
            }

            if (bField != null) {
                bField.setAccessible(true);
                Object flow = bField.get(mfyMixin);
                if (flow != null) {
                    Method getVal = null;
                    try {
                        getVal = flow.getClass().getMethod("e");
                    } catch (NoSuchMethodException e) {
                        try {
                            getVal = flow.getClass().getMethod("getValue");
                        } catch (NoSuchMethodException ignored) {}
                    }
                    if (getVal != null) {
                        Object cur = getVal.invoke(flow);
                        Map<Object, Object> newMap = (cur instanceof Map) ? new HashMap<>((Map<?, ?>) cur) : new HashMap<>();
                        Object savedObj = resolveStatusObject(true);

                        if (savedObj != null) {
                            boolean changed = false;
                            for (String k : all.keySet()) {
                                if (k.startsWith("card_")) {
                                    newMap.put(k.substring(5), savedObj);
                                    changed = true;
                                } else if (k.startsWith("itm:")) {
                                    newMap.put(k, savedObj);
                                    changed = true;
                                }
                            }

                            if (changed) {
                                Method setVal = null;
                                try {
                                    setVal = flow.getClass().getMethod("f", Object.class);
                                } catch (NoSuchMethodException e) {
                                    try {
                                        setVal = flow.getClass().getMethod("setValue", Object.class);
                                    } catch (NoSuchMethodException ignored) {}
                                }
                                if (setVal != null) {
                                    setVal.invoke(flow, newMap);
                                    Log.d(TAG, "Pre-populated MFY state flow with saved creations in onMfyMixinBound");
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in onMfyMixinBound", t);
        }
    }

    private static void updateMfySaveStatus(Object mfyMixin, String id, boolean saved) {
        if (mfyMixin == null || id == null) return;
        try {
            Field bField = null;
            try {
                bField = mfyMixin.getClass().getDeclaredField("b");
            } catch (Throwable ignored) {}
            if (bField == null) {
                for (Field f : mfyMixin.getClass().getDeclaredFields()) {
                    String typeName = f.getType().getName();
                    if (typeName.contains("crny") || typeName.contains("StateFlow") || typeName.contains("ctcj")) {
                        bField = f;
                        break;
                    }
                }
            }

            if (bField != null) {
                bField.setAccessible(true);
                Object flow = bField.get(mfyMixin);
                if (flow != null) {
                    Method getVal = null;
                    try {
                        getVal = flow.getClass().getMethod("e");
                    } catch (NoSuchMethodException e) {
                        try {
                            getVal = flow.getClass().getMethod("getValue");
                        } catch (NoSuchMethodException ignored) {}
                    }
                    if (getVal != null) {
                        Object cur = getVal.invoke(flow);
                        Map<Object, Object> newMap = (cur instanceof Map) ? new HashMap<>((Map<?, ?>) cur) : new HashMap<>();
                        Object statusObj = resolveStatusObject(saved);
                        if (statusObj != null) {
                            newMap.put(id, statusObj);
                            Method setVal = null;
                            try {
                                setVal = flow.getClass().getMethod("f", Object.class);
                            } catch (NoSuchMethodException e) {
                                try {
                                    setVal = flow.getClass().getMethod("setValue", Object.class);
                                } catch (NoSuchMethodException ignored) {}
                            }
                            if (setVal != null) {
                                setVal.invoke(flow, newMap);
                                Log.i(TAG, "Updated MFY state flow for ID " + id + " to " + (saved ? "SAVED" : "SAVING"));
                            }
                        }
                    }
                }
            }

            // Remove from pending creations map d
            try {
                Field dField = mfyMixin.getClass().getDeclaredField("d");
                dField.setAccessible(true);
                Map<?, ?> dMap = (Map<?, ?>) dField.get(mfyMixin);
                if (dMap != null) {
                    dMap.remove(id);
                }
            } catch (Throwable ignored) {}
        } catch (Throwable t) {
            Log.w(TAG, "Could not update MFY status for " + id, t);
        }
    }


    public static boolean isCardSaved(String cardId) {
        if (cardId == null) return false;
        if (sSavedKeys.contains("card_" + cardId) || sSavedKeys.contains(cardId)) return true;
        Context ctx = getApplicationContext();
        if (ctx != null) {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            if (prefs.getBoolean("card_" + cardId, false) || prefs.getBoolean(cardId, false)) {
                sSavedKeys.add("card_" + cardId);
                sSavedKeys.add(cardId);
                return true;
            }
        }
        return false;
    }

    public static void recordCardSaved(String cardId) {
        if (cardId == null) return;
        sSavedKeys.add("card_" + cardId);
        sSavedKeys.add(cardId);
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                prefs.edit().putBoolean("card_" + cardId, true).putBoolean(cardId, true).commit();
            } catch (Throwable ignored) {}
        }
    }

    /**
     * Intercepts hero card creation in Create Tab (Lqlb->q / Lqno->q).
     * Caches the media item and if already saved locally with a physical file,
     * marks the card ID in presenter.j so the "Save" button starts in the "Saved" state.
     */
    public static void onCheckHeroCardSaved(Object presenter, String cardId, Object mediaItem) {
        if (presenter == null || cardId == null || mediaItem == null) return;
        try {
            sCurrentPresenter = new java.lang.ref.WeakReference<>(presenter);
            sCardMediaMap.put(cardId, mediaItem);
            Object wsf = null;
            try {
                for (String cls : new String[]{"wtz", "wsh", "wsg", "wss", "wuw"}) {
                    try {
                        Class<?> wsgClass = Class.forName(cls);
                        for (Method m : wsgClass.getMethods()) {
                            if (m.getParameterTypes().length == 1 &&
                                m.getParameterTypes()[0].isInstance(mediaItem) &&
                                m.getReturnType() != void.class &&
                                Modifier.isStatic(m.getModifiers())) {
                                wsf = m.invoke(null, mediaItem);
                                if (wsf != null) break;
                            }
                        }
                        if (wsf == null) {
                            for (java.lang.reflect.Constructor<?> c : wsgClass.getConstructors()) {
                                if (c.getParameterTypes().length == 2 &&
                                    c.getParameterTypes()[0].isInstance(mediaItem) &&
                                    c.getParameterTypes()[1] == boolean.class) {
                                    wsf = c.newInstance(mediaItem, false);
                                    if (wsf != null) break;
                                }
                            }
                        }
                    } catch (Throwable ignored) {}
                    if (wsf != null) break;
                }
            } catch (Throwable ignored) {}

            if (wsf != null) {
                sWsfMediaMap.put(wsf, mediaItem);
            }

            CreationTime time = extractCreationTime(mediaItem);
            String collageFileName = (time != null && time.utcMs > 0) ? getOfficialCollageFileName(time) : null;
            String animFileName = (time != null && time.utcMs > 0) ? ("IMG_" + time.formatLocalFileName() + "-ANIMATION.mp4") : null;
            File targetCollage = (collageFileName != null) ? new File(getGooglePhotosDir(), collageFileName) : null;
            File targetAnim = (animFileName != null) ? new File(getGooglePhotosDir(), animFileName) : null;
            boolean fileOnDisk = (targetCollage != null && targetCollage.exists()) || (targetAnim != null && targetAnim.exists());

            boolean saved = fileOnDisk && (isCreationSaved(mediaItem) || isCardSaved(cardId));
            if (saved) {
                recordCardSaved(cardId);
                updatePresenterSets(presenter, cardId, wsf, true);
                Log.i(TAG, "Marked hero card " + cardId + " as saved in Create Tab presenter");
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in onCheckHeroCardSaved", t);
        }
    }

    private static void updatePresenterSets(Object presenter, Object cardId, Object wsf, boolean saved) {
        if (presenter == null) return;
        try {
            for (Field f : presenter.getClass().getDeclaredFields()) {
                if (Set.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    Set set = (Set) f.get(presenter);
                    if (set != null) {
                        String name = f.getName();
                        if ("E".equals(name)) {
                            // E is the Saving (in-progress) set
                            if (saved) {
                                if (cardId != null) set.remove(cardId);
                                if (wsf != null) set.remove(wsf);
                            } else {
                                if (cardId != null) set.add(cardId);
                                if (wsf != null) set.add(wsf);
                            }
                        } else if ("j".equals(name)) {
                            // j is the Saved set
                            if (saved) {
                                if (cardId != null) set.add(cardId);
                                if (wsf != null) set.add(wsf);
                            } else {
                                if (cardId != null) set.remove(cardId);
                                if (wsf != null) set.remove(wsf);
                            }
                        } else {
                            if (saved) {
                                if (cardId != null) set.add(cardId);
                                if (wsf != null) set.add(wsf);
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error updating presenter sets", t);
        }
    }

    private static void updatePresenterStateFlow(Object presenter, Object cardId, Object wsf, boolean saved) {
        if (presenter == null) return;
        try {
            Object statusObj = resolveStatusObject(saved);
            for (Field f : presenter.getClass().getDeclaredFields()) {
                try {
                    f.setAccessible(true);
                    Object val = f.get(presenter);
                    if (val != null) {
                        String typeName = val.getClass().getName();
                        if (typeName.contains("StateFlow") || typeName.contains("ctcj") || typeName.contains("crny")) {
                            Method eMethod = null;
                            try {
                                eMethod = val.getClass().getMethod("e");
                            } catch (NoSuchMethodException e) {
                                try {
                                    eMethod = val.getClass().getMethod("getValue");
                                } catch (NoSuchMethodException ignored) {}
                            }
                            if (eMethod != null) {
                                Object qln = eMethod.invoke(val);
                                if (qln != null) {
                                    Field aField = null;
                                    for (Field qf : qln.getClass().getDeclaredFields()) {
                                        if (List.class.isAssignableFrom(qf.getType())) {
                                            aField = qf;
                                            break;
                                        }
                                    }
                                    if (aField != null) {
                                        aField.setAccessible(true);
                                        List<?> list = (List<?>) aField.get(qln);
                                        if (list != null) {
                                            boolean changed = false;
                                            List<Object> newList = new ArrayList<>();
                                            for (Object card : list) {
                                                if (card != null) {
                                                    boolean match = false;
                                                    for (Field cf : card.getClass().getDeclaredFields()) {
                                                        cf.setAccessible(true);
                                                        Object cv = cf.get(card);
                                                        if (wsf != null && wsf.equals(cv)) match = true;
                                                        if (cardId != null && cardId.equals(cv)) match = true;
                                                    }
                                                    if (match) {
                                                        for (Field cf : card.getClass().getDeclaredFields()) {
                                                            String cft = cf.getType().getName();
                                                            if (cft.startsWith("Lqlr") || cft.equals("qlr") ||
                                                                (statusObj != null && cf.getType().isInstance(statusObj))) {
                                                                cf.setAccessible(true);
                                                                cf.set(card, statusObj);
                                                                changed = true;
                                                            }
                                                        }
                                                    }
                                                    newList.add(card);
                                                }
                                            }
                                            if (changed) {
                                                Method fMethod = null;
                                                try {
                                                    fMethod = val.getClass().getMethod("f", Object.class);
                                                } catch (NoSuchMethodException e) {
                                                    try {
                                                        fMethod = val.getClass().getMethod("setValue", Object.class);
                                                    } catch (NoSuchMethodException ignored) {}
                                                }
                                                if (fMethod != null) {
                                                    aField.set(qln, newList);
                                                    fMethod.invoke(val, qln);
                                                    Log.i(TAG, "Updated hero card in StateFlow to " + (saved ? "SAVED" : "SAVING"));
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error updating presenter StateFlow", t);
        }
    }

    /**
     * Called when the user taps "Save" on a Create Tab hero card (Lqlb->n / Lqno->n).
     * Marks the card ID as saved immediately and dispatches background export to DCIM/Google Photos.
     */
    public static void onCreateHeroSaveRequested(Object presenter, Object wsf) {
        if (presenter == null || wsf == null) return;
        try {
            sCurrentPresenter = new java.lang.ref.WeakReference<>(presenter);
            Log.d(TAG, "onCreateHeroSaveRequested called with wsf: " + wsf);

            Object mediaItem = sWsfMediaMap.get(wsf);
            String targetCardId = null;

            // Inspect StateFlow to resolve cardId matching wsf
            for (Field f : presenter.getClass().getDeclaredFields()) {
                try {
                    f.setAccessible(true);
                    Object val = f.get(presenter);
                    if (val != null) {
                        String typeName = val.getClass().getName();
                        if (typeName.contains("StateFlow") || typeName.contains("ctcj") || typeName.contains("crny")) {
                            Method eMethod = null;
                            try {
                                eMethod = val.getClass().getMethod("e");
                            } catch (NoSuchMethodException e) {
                                try {
                                    eMethod = val.getClass().getMethod("getValue");
                                } catch (NoSuchMethodException ignored) {}
                            }
                            if (eMethod != null) {
                                Object qln = eMethod.invoke(val);
                                if (qln != null) {
                                    for (Field qf : qln.getClass().getDeclaredFields()) {
                                        if (List.class.isAssignableFrom(qf.getType())) {
                                            qf.setAccessible(true);
                                            List<?> list = (List<?>) qf.get(qln);
                                            if (list != null) {
                                                for (Object card : list) {
                                                    if (card != null) {
                                                        boolean matches = false;
                                                        String cardId = null;
                                                        for (Field cf : card.getClass().getDeclaredFields()) {
                                                            cf.setAccessible(true);
                                                            Object cv = cf.get(card);
                                                            if (wsf.equals(cv)) {
                                                                matches = true;
                                                            } else if (cv instanceof String && ((String) cv).startsWith("itm:")) {
                                                                cardId = (String) cv;
                                                            }
                                                        }
                                                        if (matches && cardId != null) {
                                                            targetCardId = cardId;
                                                            if (mediaItem == null) {
                                                                mediaItem = sCardMediaMap.get(cardId);
                                                            }
                                                            Log.i(TAG, "Hero card " + cardId + " resolved from presenter StateFlow");
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            }

            if (mediaItem == null && targetCardId != null) {
                mediaItem = sCardMediaMap.get(targetCardId);
            }

            // Immediately mark as saving in presenter and MFY state flow
            updatePresenterSets(presenter, targetCardId, wsf, false);
            updatePresenterStateFlow(presenter, targetCardId, wsf, false);
            if (sCurrentMfyMixin != null && sCurrentMfyMixin.get() != null && targetCardId != null) {
                updateMfySaveStatus(sCurrentMfyMixin.get(), targetCardId, false);
            }

            Context context = extractContext(presenter);
            if (context == null) context = getApplicationContext();
            if (context != null) {
                sAppContext = context.getApplicationContext();
                ensureReceiverRegistered(sAppContext);
            }
            final Context appContext = sAppContext != null ? sAppContext : (context != null ? context.getApplicationContext() : null);
            final Object finalMediaItem = mediaItem;
            final String finalCardId = targetCardId;
            final Object finalWsf = wsf;

            if (appContext != null && finalMediaItem != null) {
                Log.i(TAG, "Dispatching local download for hero card: " + (finalCardId != null ? finalCardId : wsf));
                EXECUTOR.execute(() -> {
                    boolean success = saveSingleItem(appContext, finalMediaItem);
                    MAIN_HANDLER.post(() -> {
                        if (success) {
                            if (finalCardId != null) {
                                recordCardSaved(finalCardId);
                            }
                            updatePresenterSets(presenter, finalCardId, finalWsf, true);
                            updatePresenterStateFlow(presenter, finalCardId, finalWsf, true);
                            if (sCurrentMfyMixin != null && sCurrentMfyMixin.get() != null && finalCardId != null) {
                                updateMfySaveStatus(sCurrentMfyMixin.get(), finalCardId, true);
                            }
                            Log.i(TAG, "Successfully exported hero card creation to DCIM/Google Photos and updated UI to Saved.");
                        } else {
                            Log.w(TAG, "Failed to download hero card creation locally.");
                        }
                    });
                });
            } else {
                Log.w(TAG, "Cannot trigger hero card download: appContext=" + appContext + ", mediaItem=" + finalMediaItem);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in onCreateHeroSaveRequested", t);
        }
    }

    public static class CreationTime {
        public final long utcMs;
        public final long tzOffsetMs;

        public CreationTime(long utcMs, long tzOffsetMs) {
            this.utcMs = utcMs;
            this.tzOffsetMs = tzOffsetMs;
        }

        public String formatLocalFileName() {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
            if (tzOffsetMs != 0) {
                sdf.setTimeZone(new SimpleTimeZone((int) tzOffsetMs, "photo_tz"));
            } else {
                sdf.setTimeZone(TimeZone.getDefault());
            }
            return sdf.format(new Date(utcMs));
        }

        public String formatUtcFileName() {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
            sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
            return sdf.format(new Date(utcMs));
        }
    }

    /**
     * Called directly from SaveCreationMixin->e(bwel) to check if an item is already saved.
     * When this returns true, the story button provider (Lakxp->c) returns null, causing
     * the Save button to vanish from the UI.
     * Once saved, this permanently remembers the item so deleting the local file after cloud
     * backup does not resurrect the Save button.
     */
    public static boolean isCreationSaved(Object mediaItem) {
        if (mediaItem == null) return false;
        try {
            Context ctx = getApplicationContext();
            if (ctx != null) {
                ensureReceiverRegistered(ctx);
            }

            String key = extractItemKey(mediaItem);
            CreationTime time = extractCreationTime(mediaItem);
            String fileName = (time != null && time.utcMs > 0) ? getOfficialCollageFileName(time) : null;
            String animFileName = (time != null && time.utcMs > 0) ? ("IMG_" + time.formatLocalFileName() + "-ANIMATION.mp4") : null;
            File targetCollage = (fileName != null) ? new File(getGooglePhotosDir(), fileName) : null;
            File targetAnim = (animFileName != null) ? new File(getGooglePhotosDir(), animFileName) : null;
            if ((targetCollage != null && targetCollage.exists()) || (targetAnim != null && targetAnim.exists())) {
                return true;
            }
            long utcMs = time != null ? time.utcMs : 0;

            if (key != null && sSavedKeys.contains(key)) return true;
            if (fileName != null && sSavedKeys.contains("file_" + fileName)) return true;
            if (animFileName != null && sSavedKeys.contains("file_" + animFileName)) return true;
            if (utcMs > 0 && sSavedKeys.contains("ts_" + utcMs)) return true;

            if (ctx != null) {
                SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                if (key != null && (prefs.getBoolean(key, false) || prefs.getBoolean(key + "_saved", false))) {
                    sSavedKeys.add(key);
                    return true;
                }
                if (fileName != null && prefs.getBoolean("file_" + fileName, false)) {
                    sSavedKeys.add("file_" + fileName);
                    return true;
                }
                if (utcMs > 0 && prefs.getBoolean("ts_" + utcMs, false)) {
                    sSavedKeys.add("ts_" + utcMs);
                    return true;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in isCreationSaved", t);
        }
        return false;
    }

    public static File getGooglePhotosDir() {
        return new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "Google Photos");
    }

    public static String getOfficialCollageFileName(CreationTime time) {
        return "IMG_" + time.formatLocalFileName() + "-COLLAGE.jpg";
    }

    public static String getOfficialCollageFileName(long timestamp) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US);
        sdf.setTimeZone(TimeZone.getDefault());
        return "IMG_" + sdf.format(new Date(timestamp)) + "-COLLAGE.jpg";
    }

    public static String getFileNameForKey(String key) {
        return "Collage_" + sanitizeFileName(key) + ".jpg";
    }

    private static String sanitizeFileName(String input) {
        if (input == null || input.isEmpty()) return "item";
        return input.replaceAll("[^a-zA-Z0-9._-]", "_");
    }

    /**
     * Extracts the historical capture timestamp (epoch ms) and timezone offset of the creation source media.
     * In Google Photos, media items implement bwep which provides h() -> bwol (Timestamp object).
     * bwol contains field e (UTC timestamp in ms) and field f (timezone offset in ms).
     */
    public static CreationTime extractCreationTime(Object mediaItem) {
        if (mediaItem == null) {
            return new CreationTime(System.currentTimeMillis(), 0);
        }

        // 1. Try bwep.h() returning bwol (Timestamp object in Google Photos)
        try {
            Method hMethod = mediaItem.getClass().getMethod("h");
            Object bwol = hMethod.invoke(mediaItem);
            if (bwol != null) {
                long utc = 0;
                long tzOffset = 0;
                try {
                    Field eField = bwol.getClass().getDeclaredField("e");
                    eField.setAccessible(true);
                    utc = eField.getLong(bwol);
                } catch (Throwable ignored) {}

                try {
                    Field fField = bwol.getClass().getDeclaredField("f");
                    fField.setAccessible(true);
                    tzOffset = fField.getLong(bwol);
                } catch (Throwable ignored) {}

                if (utc > 946684800000L && utc < System.currentTimeMillis() + 86400000L * 365) {
                    return new CreationTime(utc, tzOffset);
                }

                // If e field was missing/zero, try bwol.a() (wall-clock timestamp)
                try {
                    Method aMethod = bwol.getClass().getMethod("a");
                    Object res = aMethod.invoke(bwol);
                    if (res instanceof Number) {
                        long ts = ((Number) res).longValue();
                        if (ts > 946684800000L && ts < System.currentTimeMillis() + 86400000L * 365) {
                            return new CreationTime(ts, tzOffset);
                        }
                    }
                } catch (Throwable ignored) {}
            }
        } catch (Throwable ignored) {}

        // 2. Try reflection for TimestampFeature / DateHeaderFeature or any method returning bwol
        for (Method m : mediaItem.getClass().getMethods()) {
            if (m.getParameterTypes().length == 0) {
                String retName = m.getReturnType().getSimpleName();
                if (retName.equals("bwol") || retName.equals("bwze") || retName.contains("Timestamp")) {
                    try {
                        Object obj = m.invoke(mediaItem);
                        if (obj != null) {
                            long utc = 0;
                            long tzOffset = 0;
                            try {
                                Field eField = obj.getClass().getDeclaredField("e");
                                eField.setAccessible(true);
                                utc = eField.getLong(obj);
                            } catch (Throwable ignored) {}
                            try {
                                Field fField = obj.getClass().getDeclaredField("f");
                                fField.setAccessible(true);
                                tzOffset = fField.getLong(obj);
                            } catch (Throwable ignored) {}

                            if (utc > 946684800000L && utc < System.currentTimeMillis() + 86400000L * 365) {
                                return new CreationTime(utc, tzOffset);
                            }

                            Method aMethod = obj.getClass().getMethod("a");
                            long ts = ((Number) aMethod.invoke(obj)).longValue();
                            if (ts > 946684800000L && ts < System.currentTimeMillis() + 86400000L * 365) {
                                return new CreationTime(ts, tzOffset);
                            }
                        }
                    } catch (Throwable ignored) {}
                } else if (m.getReturnType() == long.class || m.getReturnType() == Long.class) {
                    String name = m.getName().toLowerCase(Locale.US);
                    if (name.contains("time") || name.contains("date") || name.contains("timestamp")) {
                        try {
                            long ts = ((Number) m.invoke(mediaItem)).longValue();
                            if (ts > 946684800000L && ts < System.currentTimeMillis() + 86400000L * 365) {
                                return new CreationTime(ts, 0);
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
        }

        return new CreationTime(System.currentTimeMillis(), 0);
    }

    public static long extractCreationTimestamp(Object mediaItem) {
        return extractCreationTime(mediaItem).utcMs;
    }

    /**
     * Extracts a stable identifier for a media item (_1846 / bwel).
     */
    public static String extractItemKey(Object mediaItem) {
        if (mediaItem == null) return null;

        // 1. Try bwep.e() returning long ID
        try {
            Method eMethod = mediaItem.getClass().getMethod("e");
            if (eMethod.getReturnType() == long.class || eMethod.getReturnType() == Long.class) {
                long id = ((Number) eMethod.invoke(mediaItem)).longValue();
                if (id != 0 && id != -1) {
                    return "id_" + id;
                }
            }
        } catch (Throwable ignored) {}

        // 2. Check 0-arg methods returning String
        for (Method m : mediaItem.getClass().getMethods()) {
            if (m.getParameterTypes().length == 0 && m.getReturnType() == String.class) {
                String name = m.getName().toLowerCase(Locale.US);
                if (name.contains("key") || name.contains("dedup") || name.equals("i")) {
                    try {
                        String val = (String) m.invoke(mediaItem);
                        if (val != null && val.length() > 5 && !val.contains("com.google") && !val.contains("@")) {
                            return val;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        }

        // 3. Check fields
        for (Field f : mediaItem.getClass().getDeclaredFields()) {
            if (f.getType() == String.class) {
                String name = f.getName().toLowerCase(Locale.US);
                if (name.contains("key") || name.contains("dedup")) {
                    try {
                        f.setAccessible(true);
                        String val = (String) f.get(mediaItem);
                        if (val != null && val.length() > 5 && !val.contains("com.google") && !val.contains("@")) {
                            return val;
                        }
                    } catch (Throwable ignored) {}
                }
            } else if (f.getType() == long.class) {
                try {
                    f.setAccessible(true);
                    long val = f.getLong(mediaItem);
                    if (val > 0) return "id_" + val;
                } catch (Throwable ignored) {}
            }
        }

        // 4. Fallback to hash code
        return "item_" + Math.abs(mediaItem.toString().hashCode());
    }

    private static String extractKeyFromUri(Uri uri) {
        if (uri == null) return null;
        String path = uri.getPath();
        if (path == null) return null;
        int lastSlash = path.lastIndexOf('/');
        if (lastSlash >= 0 && lastSlash < path.length() - 1) {
            String seg = path.substring(lastSlash + 1);
            int eq = seg.indexOf('=');
            if (eq > 0) seg = seg.substring(0, eq);
            if (seg.length() > 10) return seg;
        }
        return null;
    }

    private static boolean saveSingleItem(Context context, Object mediaItem) {
        Uri mediaUri = resolveMediaUri(context, mediaItem);
        if (mediaUri == null) {
            Log.w(TAG, "Could not resolve URI for media item: " + mediaItem);
            return false;
        }

        Log.d(TAG, "Resolved creation URI: " + mediaUri);
        ContentResolver resolver = context.getContentResolver();
        String mimeType = resolver.getType(mediaUri);
        if (mimeType == null) {
            mimeType = "image/jpeg";
        }

        boolean isVideo = mimeType.startsWith("video/");
        String extension = isVideo ? ".mp4" : ".jpg";
        if (isVideo && (mimeType.equals("video/mpeg") || mimeType.equals("video/mp4"))) {
            mimeType = "video/mp4";
        }

        CreationTime creationTime = extractCreationTime(mediaItem);
        String fileName = isVideo
                ? ("IMG_" + creationTime.formatLocalFileName() + "-ANIMATION.mp4")
                : ("IMG_" + creationTime.formatLocalFileName() + "-COLLAGE.jpg");
        File targetFile = new File(getGooglePhotosDir(), fileName);

        String itemKey = extractItemKey(mediaItem);
        String uriKey = extractKeyFromUri(mediaUri);

        // Download stream to a temporary cache file first
        File tempFile = null;
        try {
            tempFile = File.createTempFile("morphe_creation_", extension, context.getCacheDir());
            try (InputStream in = openMediaStream(resolver, mediaUri);
                 OutputStream out = new FileOutputStream(tempFile)) {
                if (in == null) {
                    Log.e(TAG, "Failed to open input stream for " + mediaUri);
                    return false;
                }
                byte[] buffer = new byte[16384];
                int len;
                while ((len = in.read(buffer)) > 0) {
                    out.write(buffer, 0, len);
                }
                out.flush();
            }

            // For JPEG images, inject EXIF capture timestamp into the temporary file
            if (!isVideo) {
                try {
                    ExifInterface exif = new ExifInterface(tempFile.getAbsolutePath());
                    SimpleDateFormat exifSdf = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss", Locale.US);
                    if (creationTime.tzOffsetMs != 0) {
                        exifSdf.setTimeZone(new SimpleTimeZone((int) creationTime.tzOffsetMs, "photo_tz"));
                    } else {
                        exifSdf.setTimeZone(TimeZone.getDefault());
                    }
                    String dateStr = exifSdf.format(new Date(creationTime.utcMs));
                    exif.setAttribute(ExifInterface.TAG_DATETIME_ORIGINAL, dateStr);
                    exif.setAttribute(ExifInterface.TAG_DATETIME, dateStr);
                    exif.setAttribute(ExifInterface.TAG_DATETIME_DIGITIZED, dateStr);

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && creationTime.tzOffsetMs != 0) {
                        int totalMinutes = (int) (creationTime.tzOffsetMs / 60000);
                        int hours = totalMinutes / 60;
                        int minutes = Math.abs(totalMinutes % 60);
                        String offsetStr = String.format(Locale.US, "%+03d:%02d", hours, minutes);
                        try {
                            exif.setAttribute("OffsetTimeOriginal", offsetStr);
                            exif.setAttribute("OffsetTime", offsetStr);
                            exif.setAttribute("OffsetTimeDigitized", offsetStr);
                        } catch (Throwable ignored) {}
                    }
                    exif.saveAttributes();
                    Log.d(TAG, "Embedded EXIF DateTimeOriginal: " + dateStr + " into " + fileName);
                } catch (Throwable t) {
                    Log.w(TAG, "Failed embedding EXIF attributes", t);
                }
            }

            // Clean up any existing file or MediaStore entry with this exact name or duplicate suffixes
            Uri tableUri = isVideo ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
            try {
                String basePrefix = fileName.substring(0, fileName.lastIndexOf('.'));
                String selection = "(" + MediaStore.MediaColumns.DISPLAY_NAME + "=? OR " +
                        MediaStore.MediaColumns.DISPLAY_NAME + " LIKE ?) AND " +
                        MediaStore.MediaColumns.RELATIVE_PATH + " LIKE ?";
                String[] selectionArgs = new String[]{fileName, basePrefix + " (%)%", "DCIM/Google Photos%"};
                resolver.delete(tableUri, selection, selectionArgs);
            } catch (Throwable ignored) {}

            try {
                if (targetFile.exists()) {
                    targetFile.delete();
                }
                File dir = getGooglePhotosDir();
                if (dir.exists()) {
                    String basePrefix = fileName.substring(0, fileName.lastIndexOf('.'));
                    File[] dups = dir.listFiles((d, name) -> name.startsWith(basePrefix + " (") && name.endsWith(extension));
                    if (dups != null) {
                        for (File df : dups) {
                            df.delete();
                        }
                    }
                }
            } catch (Throwable ignored) {}

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                values.put(MediaStore.MediaColumns.MIME_TYPE, mimeType);
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, "DCIM/Google Photos");
                values.put(MediaStore.MediaColumns.DATE_ADDED, creationTime.utcMs / 1000);
                values.put(MediaStore.MediaColumns.DATE_MODIFIED, creationTime.utcMs / 1000);
                if (isVideo) {
                    values.put(MediaStore.Video.Media.DATE_TAKEN, creationTime.utcMs);
                } else {
                    values.put(MediaStore.Images.Media.DATE_TAKEN, creationTime.utcMs);
                }
                values.put(MediaStore.MediaColumns.IS_PENDING, 1);

                Uri inserted = resolver.insert(tableUri, values);
                if (inserted == null) {
                    Log.e(TAG, "Failed to create MediaStore entry for " + fileName);
                    return false;
                }

                try (InputStream fin = new FileInputStream(tempFile);
                     OutputStream out = resolver.openOutputStream(inserted)) {
                    if (out == null) {
                        return false;
                    }
                    byte[] buffer = new byte[16384];
                    int len;
                    while ((len = fin.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                    out.flush();
                }

                values.clear();
                values.put(MediaStore.MediaColumns.IS_PENDING, 0);
                if (isVideo) {
                    values.put(MediaStore.Video.Media.DATE_TAKEN, creationTime.utcMs);
                } else {
                    values.put(MediaStore.Images.Media.DATE_TAKEN, creationTime.utcMs);
                }
                values.put(MediaStore.MediaColumns.DATE_ADDED, creationTime.utcMs / 1000);
                values.put(MediaStore.MediaColumns.DATE_MODIFIED, creationTime.utcMs / 1000);
                resolver.update(inserted, values, null, null);

                // Set file modification timestamp if accessible directly
                if (targetFile.exists()) {
                    targetFile.setLastModified(creationTime.utcMs);
                }

                // Index with MediaScanner so Google Photos sees it immediately
                MediaScannerConnection.scanFile(context,
                        new String[]{targetFile.getAbsolutePath()},
                        new String[]{mimeType},
                        null);

                recordSavedItem(context, itemKey, uriKey, fileName, targetFile.getAbsolutePath(), creationTime.utcMs);
                return true;
            } else {
                File dcimDir = getGooglePhotosDir();
                if (!dcimDir.exists() && !dcimDir.mkdirs()) {
                    Log.e(TAG, "Failed to create directory: " + dcimDir.getAbsolutePath());
                    return false;
                }

                try (InputStream fin = new FileInputStream(tempFile);
                     OutputStream out = new FileOutputStream(targetFile)) {
                    byte[] buffer = new byte[16384];
                    int len;
                    while ((len = fin.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                    out.flush();
                }

                targetFile.setLastModified(creationTime.utcMs);

                MediaScannerConnection.scanFile(context,
                        new String[]{targetFile.getAbsolutePath()},
                        new String[]{mimeType},
                        null);

                recordSavedItem(context, itemKey, uriKey, fileName, targetFile.getAbsolutePath(), creationTime.utcMs);
                return true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error streaming creation to local storage", t);
            return false;
        } finally {
            if (tempFile != null && tempFile.exists()) {
                tempFile.delete();
            }
        }
    }

    private static void recordSavedItem(Context context, String itemKey, String uriKey, String fileName, String filePath, long utcMs) {
        if (itemKey != null) {
            sSavedKeys.add(itemKey);
        }
        if (uriKey != null) {
            sSavedKeys.add(uriKey);
        }
        if (fileName != null) {
            sSavedKeys.add("file_" + fileName);
        }
        if (utcMs > 0) {
            sSavedKeys.add("ts_" + utcMs);
        }
        Context ctx = context != null ? context.getApplicationContext() : getApplicationContext();
        if (ctx == null) return;
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            SharedPreferences.Editor edit = prefs.edit();
            if (itemKey != null) {
                edit.putBoolean(itemKey, true);
                edit.putBoolean(itemKey + "_saved", true);
            }
            if (uriKey != null) {
                edit.putBoolean(uriKey, true);
                edit.putBoolean(uriKey + "_saved", true);
            }
            if (fileName != null) {
                edit.putBoolean("file_" + fileName, true);
            }
            if (utcMs > 0) {
                edit.putBoolean("ts_" + utcMs, true);
            }
            edit.commit(); // synchronous write
        } catch (Throwable ignored) {}
    }

    private static InputStream openMediaStream(ContentResolver resolver, Uri uri) throws Exception {
        String scheme = uri.getScheme();
        if ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) {
            String urlStr = uri.toString();

            // Force original quality for Fife (googleusercontent) URLs.
            if (urlStr.contains("googleusercontent.com") || urlStr.contains("lh3.google")) {
                int eqPos = urlStr.lastIndexOf('=');
                int slashAfterHost = urlStr.indexOf('/', urlStr.indexOf("://") + 3);
                if (eqPos > 0 && eqPos > slashAfterHost) {
                    String suffix = urlStr.substring(eqPos);
                    if (!suffix.contains("&") && !suffix.contains("?")) {
                        urlStr = urlStr.substring(0, eqPos) + "=d";
                    } else {
                        urlStr = urlStr.replaceAll("=s\\d+", "=d").replaceAll("=w\\d+-h\\d+", "=d");
                    }
                } else {
                    urlStr = urlStr + "=d";
                }
                Log.d(TAG, "Upgraded Fife URL to original quality: " + urlStr);
            }

            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) new java.net.URL(urlStr).openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(60000);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            int responseCode = conn.getResponseCode();
            if (responseCode >= 400) {
                Log.w(TAG, "HTTP " + responseCode + " for URL: " + urlStr + " — falling back to original URI");
                conn.disconnect();
                conn = (java.net.HttpURLConnection) new java.net.URL(uri.toString()).openConnection();
                conn.setConnectTimeout(15000);
                conn.setReadTimeout(60000);
                conn.setInstanceFollowRedirects(true);
            }
            return conn.getInputStream();
        } else {
            return resolver.openInputStream(uri);
        }
    }

    private static Uri tryResolveViaProvider(Object provider, Object mediaItem, String[] qualityClasses) {
        if (provider == null || mediaItem == null) return null;
        // Unwrap lazy/provider wrapper if present (e.g. Component / ahtz / Provider)
        try {
            Method unwrapMethod = provider.getClass().getMethod("a");
            if (unwrapMethod.getParameterTypes().length == 0) {
                Object unwrapped = unwrapMethod.invoke(provider);
                if (unwrapped != null && unwrapped != provider) {
                    provider = unwrapped;
                }
            }
        } catch (Throwable ignored) {}

        // 1. Try provider.a(mediaItem) or any 1-arg method taking mediaItem returning Uri
        try {
            for (Method pm : provider.getClass().getMethods()) {
                if (pm.getParameterTypes().length == 1 &&
                    pm.getParameterTypes()[0].isInstance(mediaItem) &&
                    Uri.class.isAssignableFrom(pm.getReturnType())) {
                    Uri uri = (Uri) pm.invoke(provider, mediaItem);
                    if (uri != null) return uri;
                }
            }
        } catch (Throwable ignored) {}

        // 2. Try 3-arg method taking (mediaItem, qualityEnum, int)
        for (String qClassName : qualityClasses) {
            try {
                Class<?> qClass = Class.forName(qClassName);
                Object origVal = null;
                try {
                    origVal = qClass.getField("d").get(null);
                } catch (Throwable ignored) {
                    try {
                        origVal = qClass.getField("c").get(null);
                    } catch (Throwable ignored2) {}
                }
                if (origVal != null) {
                    for (Method pm : provider.getClass().getMethods()) {
                        if (pm.getParameterTypes().length == 3 &&
                            pm.getParameterTypes()[0].isInstance(mediaItem) &&
                            Uri.class.isAssignableFrom(pm.getReturnType())) {
                            try {
                                Uri uri = (Uri) pm.invoke(provider, mediaItem, origVal, 0);
                                if (uri != null) return uri;
                            } catch (Throwable ignored) {}
                        }
                    }
                }
            } catch (ClassNotFoundException ignored) {}
        }
        return null;
    }

    private static Uri resolveMediaUri(Context context, Object mediaItem) {
        // Attempt 1: Photos DI Binder (cbar / bzoq / bzeq / ahug) with MediaUriProvider (woq / wor / wma / wmb / wiy / wiz)
        String[] binderClasses = {"cbar", "bzoq", "bzeq", "ahug"};
        String[] providerClasses = {"woq", "wor", "wma", "wmb", "wiy", "wiz"};
        String[] qualityClasses = {"wop", "wlz", "wiw"};

        for (String binderName : binderClasses) {
            try {
                Class<?> binderCls = Class.forName(binderName);
                for (String provName : providerClasses) {
                    try {
                        Class<?> provCls = Class.forName(provName);
                        Object provider = null;

                        // Try static method e(Context, Class) on binder
                        try {
                            Method eMethod = binderCls.getMethod("e", Context.class, Class.class);
                            provider = eMethod.invoke(null, context, provCls);
                        } catch (Throwable ignored) {}

                        // Try static method i(Context, Class) on binder
                        if (provider == null) {
                            try {
                                Method iMethod = binderCls.getMethod("i", Context.class, Class.class);
                                provider = iMethod.invoke(null, context, provCls);
                            } catch (Throwable ignored) {}
                        }

                        // Try static method b(Context, Class) / a(Context, Class)
                        if (provider == null) {
                            try {
                                Method bMethod = binderCls.getMethod("b", Context.class, Class.class);
                                provider = bMethod.invoke(null, context, provCls);
                            } catch (Throwable ignored) {}
                        }

                        if (provider != null) {
                            Uri uri = tryResolveViaProvider(provider, mediaItem, qualityClasses);
                            if (uri != null) return uri;
                        }
                    } catch (ClassNotFoundException ignored) {}
                }

                // Dynamic DI Binder Registry Fallback:
                // If known provider class names weren't present, inspect binder instance's internal bindings map
                try {
                    Method aMethod = binderCls.getMethod("a", Context.class);
                    Object binderInstance = aMethod.invoke(null, context);
                    if (binderInstance != null) {
                        for (Field bf : binderInstance.getClass().getDeclaredFields()) {
                            if (Map.class.isAssignableFrom(bf.getType())) {
                                bf.setAccessible(true);
                                Map<?, ?> map = (Map<?, ?>) bf.get(binderInstance);
                                if (map != null) {
                                    for (Object val : map.values()) {
                                        if (val instanceof Map) {
                                            for (Object innerVal : ((Map<?, ?>) val).values()) {
                                                Uri u = tryResolveViaProvider(innerVal, mediaItem, qualityClasses);
                                                if (u != null) return u;
                                            }
                                        } else if (val != null) {
                                            Uri u = tryResolveViaProvider(val, mediaItem, qualityClasses);
                                            if (u != null) return u;
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {}
            } catch (ClassNotFoundException ignored) {}
        }

        // Attempt 2: Check methods on mediaItem itself that return Uri
        try {
            for (Method m : mediaItem.getClass().getMethods()) {
                if (m.getParameterTypes().length == 0 && Uri.class.isAssignableFrom(m.getReturnType())) {
                    try {
                        Uri uri = (Uri) m.invoke(mediaItem);
                        if (uri != null && uri.toString().length() > 0) {
                            return uri;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ignored) {}

        // Attempt 3: Check fields on mediaItem for Uri
        try {
            for (Field f : mediaItem.getClass().getDeclaredFields()) {
                if (Uri.class.isAssignableFrom(f.getType())) {
                    try {
                        f.setAccessible(true);
                        Uri uri = (Uri) f.get(mediaItem);
                        if (uri != null && uri.toString().length() > 0) {
                            return uri;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable ignored) {}

        Log.w(TAG, "Failed resolving media URI via all providers for item: " + mediaItem);
        return null;
    }

    private static Context extractContext(Object mixin) {
        for (Field f : mixin.getClass().getDeclaredFields()) {
            if (Context.class.isAssignableFrom(f.getType())) {
                try {
                    f.setAccessible(true);
                    return (Context) f.get(mixin);
                } catch (Throwable ignored) {}
            }
        }
        return null;
    }

    private static Context getApplicationContext() {
        if (sAppContext != null) return sAppContext;
        try {
            Class<?> atCls = Class.forName("android.app.ActivityThread");
            Method caMethod = atCls.getMethod("currentApplication");
            Object app = caMethod.invoke(null);
            if (app instanceof Context) {
                sAppContext = ((Context) app).getApplicationContext();
                return sAppContext;
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static void notifySaveListeners(Object mixin, Object mediaList) {
        // Direct call to Lakxr->c(Lcchb) which notifies save listeners
        try {
            for (Method m : mixin.getClass().getDeclaredMethods()) {
                if (m.getName().equals("c") && m.getParameterTypes().length == 1) {
                    m.setAccessible(true);
                    m.invoke(mixin, mediaList);
                    Log.d(TAG, "Invoked mixin.c(mediaList) directly");
                    return;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed invoking mixin.c", t);
        }

        // Generic fallback for any 1-arg void method matching mediaList
        for (Method m : mixin.getClass().getDeclaredMethods()) {
            if (m.getReturnType() == void.class && m.getParameterTypes().length == 1) {
                if (m.getParameterTypes()[0].isInstance(mediaList) ||
                    m.getParameterTypes()[0].isAssignableFrom(mediaList.getClass())) {
                    try {
                        m.setAccessible(true);
                        m.invoke(mixin, mediaList);
                        Log.d(TAG, "Invoked notify method: " + m.getName());
                        return;
                    } catch (Throwable t) {
                        Log.w(TAG, "Failed invoking notify method", t);
                    }
                }
            }
        }
    }

    private static void notifyStoryUi(Object mixin) {
        try {
            for (Field f : mixin.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object wrapper = f.get(mixin);
                if (wrapper != null) {
                    Method getMethod = null;
                    try {
                        getMethod = wrapper.getClass().getMethod("a");
                    } catch (NoSuchMethodException ignored) {
                        try {
                            getMethod = wrapper.getClass().getMethod("get");
                        } catch (NoSuchMethodException ignored2) {}
                    }
                    if (getMethod != null) {
                        Object target = getMethod.invoke(wrapper);
                        if (target != null) {
                            for (Method tm : target.getClass().getDeclaredMethods()) {
                                if (tm.getParameterTypes().length == 0 && tm.getReturnType() == void.class) {
                                    if (tm.getName().equals("s") || tm.getName().equals("advance")) {
                                        tm.setAccessible(true);
                                        tm.invoke(target);
                                        Log.d(TAG, "Notified story UI via " + tm.getName());
                                        return;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not notify story UI: " + t.getMessage());
        }
    }
}
