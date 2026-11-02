package app.morphe.extension.shared.patches;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.media.ExifInterface;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
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
import java.lang.reflect.Constructor;
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
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.SimpleTimeZone;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
    private static final Map<String, Object> sIdMediaMap = new ConcurrentHashMap<>();
    private static final Map<String, String> sIdCardMap = new ConcurrentHashMap<>();
    private static final Map<Object, String> sWsfCardMap = new ConcurrentHashMap<>();
    private static final Map<String, Object> sCardWsfMap = new ConcurrentHashMap<>();
    private static volatile boolean sReceiverRegistered = false;
    private static volatile Context sAppContext = null;
    private static volatile java.lang.ref.WeakReference<Object> sCurrentMfyMixin = null;
    private static volatile java.lang.ref.WeakReference<Object> sCurrentPresenter = null;

    public static synchronized void clearMfySavedRegistry(Context context) {
        Context ctx = context != null ? context.getApplicationContext() : getApplicationContext();
        if (ctx != null) {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            SharedPreferences.Editor edit = prefs.edit();
            Map<String, ?> all = prefs.getAll();
            for (String key : all.keySet()) {
                if (key.startsWith("card_")) {
                    edit.remove(key);
                    String rawId = key.substring(5);
                    edit.remove(rawId);
                    sSavedKeys.remove(key);
                    sSavedKeys.remove(rawId);
                } else if (sCardMediaMap.containsKey(key)) {
                    edit.remove(key);
                    sSavedKeys.remove(key);
                    sSavedKeys.remove("card_" + key);
                }
            }
            edit.commit();
        }

        sSavedKeys.removeIf(k -> k.startsWith("card_"));
        for (String id : sCardMediaMap.keySet()) {
            sSavedKeys.remove(id);
        }
        sCardMediaMap.clear();
        sWsfMediaMap.clear();
        sIdMediaMap.clear();
        sIdCardMap.clear();
        sWsfCardMap.clear();
        sCardWsfMap.clear();

        // Reset active MfyMixin state flow
        if (sCurrentMfyMixin != null && sCurrentMfyMixin.get() != null) {
            try {
                Object mfyMixin = sCurrentMfyMixin.get();
                for (Field f : mfyMixin.getClass().getDeclaredFields()) {
                    String typeName = f.getType().getName();
                    if (typeName.contains("crny") || typeName.contains("StateFlow") || typeName.contains("ctcj") || typeName.contains("ctzv")) {
                        f.setAccessible(true);
                        Object flow = f.get(mfyMixin);
                        if (flow != null) {
                            Method setVal = null;
                            try {
                                setVal = flow.getClass().getMethod("f", Object.class);
                            } catch (NoSuchMethodException e) {
                                try {
                                    setVal = flow.getClass().getMethod("setValue", Object.class);
                                } catch (NoSuchMethodException ignored) {}
                            }
                            if (setVal != null) {
                                setVal.invoke(flow, new HashMap<>());
                                Log.i(TAG, "Cleared MFY state flow in clearMfySavedRegistry");
                            }
                        }
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "Failed clearing MfyMixin state flow", t);
            }
        }

        // Reset active Presenter state and sets
        final Object pres = (sCurrentPresenter != null) ? sCurrentPresenter.get() : sCurrentMfyDelegate;
        if (pres != null) {
            try {
                MAIN_HANDLER.post(() -> {
                    try {
                        updatePresenterSets(pres, null, null, false);
                        updatePresenterStateFlow(pres, null, null, false);
                        Method lMethod = pres.getClass().getMethod("l", boolean.class);
                        lMethod.invoke(pres, false);
                    } catch (Throwable ignored) {}
                });
                Log.i(TAG, "Cleared presenter saved sets and triggered refresh in clearMfySavedRegistry");
            } catch (Throwable t) {
                Log.w(TAG, "Failed clearing presenter in clearMfySavedRegistry", t);
            }
        }

        // Also clear made_for_you_creation_initial_data.pb across all accounts so fallback re-queries fresh state
        try {
            if (ctx != null) {
                File filesDir = ctx.getFilesDir();
                File accountStorage = new File(filesDir, "accountstorage");
                if (accountStorage.exists() && accountStorage.isDirectory()) {
                    File[] accts = accountStorage.listFiles();
                    if (accts != null) {
                        for (File acct : accts) {
                            File pb = new File(acct, "protodb/made_for_you_creation_initial_data.pb");
                            if (pb.exists()) {
                                if (pb.delete()) {
                                    Log.i(TAG, "Deleted MFY initial data pb: " + pb.getAbsolutePath());
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error deleting mfy initial data pb in clearMfySavedRegistry", t);
        }

        Log.i(TAG, "Cleared MFY saved creations registry.");
    }

    public static synchronized void clearStorySavedRegistry(Context context) {
        Context ctx = context != null ? context.getApplicationContext() : getApplicationContext();
        if (ctx != null) {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            SharedPreferences.Editor edit = prefs.edit();
            Map<String, ?> all = prefs.getAll();
            for (String key : all.keySet()) {
                if (!key.startsWith("card_") && !sCardMediaMap.containsKey(key)) {
                    edit.remove(key);
                }
            }
            edit.commit();
        }
        sSavedKeys.removeIf(k -> !k.startsWith("card_") && !sCardMediaMap.containsKey(k));

        Log.i(TAG, "Cleared Story saved creations registry.");
    }

    public static synchronized void clearSavedRegistry(Context context) {
        clearMfySavedRegistry(context);
        clearStorySavedRegistry(context);
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
                        if (appContext != null) {
                            Toast.makeText(appContext, "Saved creation to Google Photos", Toast.LENGTH_SHORT).show();
                        }
                    } else {
                        Log.w(TAG, "Failed to resolve local stream for creation item(s).");
                        if (appContext != null) {
                            Toast.makeText(appContext, "Failed to save creation", Toast.LENGTH_SHORT).show();
                        }
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

            final Object pres = (sCurrentPresenter != null) ? sCurrentPresenter.get() : sCurrentMfyDelegate;

            // Immediately mark THIS specific card as Saving... in StateFlow and mixin
            if (pres != null) {
                updateMfyCardTileState(pres, id, false, false);
            }
            updateMfySaveStatus(mfyMixin, id, false);

            // If already saved in registry, show Saved and cleanly remove it after short delay
            if (isCreationSaved(mediaItem) || isCardSaved(id)) {
                Log.i(TAG, "MFY creation " + id + " is already saved locally. Suppressing duplicate download.");
                recordCardSaved(id);
                if (pres != null) {
                    updateMfyCardTileState(pres, id, true, false);
                }
                updateMfySaveStatus(mfyMixin, id, true);
                MAIN_HANDLER.postDelayed(() -> {
                    if (pres != null) {
                        updateMfyCardTileState(pres, id, true, true);
                        try {
                            Method lMethod = pres.getClass().getMethod("l", boolean.class);
                            lMethod.invoke(pres, false);
                        } catch (Throwable ignored) {}
                    }
                    updateMfySaveStatus(mfyMixin, id, null);
                }, 700);
                return true;
            }

            CreationTime time = extractCreationTime(mediaItem);
            String collageFileName = (time != null && time.utcMs > 0) ? getOfficialCollageFileName(time) : null;
            String animFileName = (time != null && time.utcMs > 0) ? ("IMG_" + time.formatLocalFileName() + "-ANIMATION.mp4") : null;
            String itemKey = extractItemKey(mediaItem);
            long utcMs = time != null ? time.utcMs : 0;
            if (appContext != null) {
                recordSavedItem(appContext, itemKey, id, collageFileName, null, utcMs);
            }

            Log.i(TAG, "Intercepted MFY creation save for ID " + id + ". Exporting to DCIM/Google Photos in background.");

            EXECUTOR.execute(() -> {
                if (appContext != null) {
                    boolean success = saveSingleItem(appContext, mediaItem);
                    MAIN_HANDLER.post(() -> {
                        if (success) {
                            recordCardSaved(id);
                            Toast.makeText(appContext, "Saved creation to Google Photos", Toast.LENGTH_SHORT).show();
                            Log.i(TAG, "Successfully exported MFY creation " + id + " to DCIM/Google Photos.");
                            if (pres != null) {
                                updateMfyCardTileState(pres, id, true, false);
                            }
                            updateMfySaveStatus(mfyMixin, id, true);
                            MAIN_HANDLER.postDelayed(() -> {
                                if (pres != null) {
                                    updateMfyCardTileState(pres, id, true, true);
                                    try {
                                        Method lMethod = pres.getClass().getMethod("l", boolean.class);
                                        lMethod.invoke(pres, false);
                                    } catch (Throwable ignored) {}
                                }
                                updateMfySaveStatus(mfyMixin, id, null);
                            }, 700);
                        } else {
                            Toast.makeText(appContext, "Failed to save creation", Toast.LENGTH_SHORT).show();
                            Log.w(TAG, "Failed exporting MFY creation " + id);
                            if (pres != null) {
                                updateMfyCardTileState(pres, id, null, false);
                            }
                            updateMfySaveStatus(mfyMixin, id, null);
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

    private static volatile boolean sStatusInterfaceResolved = false;
    private static Class<?> sCachedStatusInterface = null;

    private static Class<?> getStatusInterface(ClassLoader cl) {
        if (sStatusInterfaceResolved) return sCachedStatusInterface;
        try {
            sCachedStatusInterface = Class.forName("soc", true, cl);
        } catch (Throwable t1) {
            try {
                sCachedStatusInterface = Class.forName("slm", true, cl);
            } catch (Throwable t2) {
                sCachedStatusInterface = null;
            }
        }
        sStatusInterfaceResolved = true;
        return sCachedStatusInterface;
    }

    private static Object resolveStatusObject(boolean saved) {
        ClassLoader cl = LocalCreationDownloader.class.getClassLoader();
        Class<?> statusInterface = getStatusInterface(cl);
        if (saved) {
            // sob.a represents Saved
            String[] savedClasses = new String[]{"sob", "sll"};
            for (String clsName : savedClasses) {
                try {
                    Class<?> cls = Class.forName(clsName, true, cl);
                    if (android.os.Parcelable.class.isAssignableFrom(cls) &&
                            (statusInterface == null || statusInterface.isAssignableFrom(cls))) {
                        Field f = cls.getDeclaredField("a");
                        f.setAccessible(true);
                        Object val = f.get(null);
                        if (val != null) return val;
                    }
                } catch (Throwable ignored) {}
            }
        } else {
            // soa.a represents Saving
            String[] savingClasses = new String[]{"soa", "slk"};
            for (String clsName : savingClasses) {
                try {
                    Class<?> cls = Class.forName(clsName, true, cl);
                    if (android.os.Parcelable.class.isAssignableFrom(cls) &&
                            (statusInterface == null || statusInterface.isAssignableFrom(cls))) {
                        Field f = cls.getDeclaredField("a");
                        f.setAccessible(true);
                        Object val = f.get(null);
                        if (val != null) return val;
                    }
                } catch (Throwable ignored) {}
            }
        }
        return null;
    }

    public static String extractCardIdFromSna(Object snaObj) {
        if (snaObj == null) return null;
        try {
            Field aField = snaObj.getClass().getDeclaredField("a");
            aField.setAccessible(true);
            Object idVal = aField.get(snaObj);
            return (idVal instanceof String) ? (String) idVal : null;
        } catch (Throwable t) {
            for (Field f : snaObj.getClass().getDeclaredFields()) {
                if (f.getType() == String.class) {
                    try {
                        f.setAccessible(true);
                        Object v = f.get(snaObj);
                        if (v != null) return (String) v;
                    } catch (Throwable ignored) {}
                }
            }
        }
        return null;
    }

    private static Object createUpdatedSna(Object originalTile, Object newStatus) {
        if (originalTile == null) return null;
        try {
            Class<?> snaClass = originalTile.getClass();
            Field aField = snaClass.getDeclaredField("a");
            Field bField = snaClass.getDeclaredField("b");
            Field cField = snaClass.getDeclaredField("c");
            Field hField = snaClass.getDeclaredField("h");
            Field dField = snaClass.getDeclaredField("d");
            Field eField = snaClass.getDeclaredField("e");
            Field gField = snaClass.getDeclaredField("g");
            aField.setAccessible(true);
            bField.setAccessible(true);
            cField.setAccessible(true);
            hField.setAccessible(true);
            dField.setAccessible(true);
            eField.setAccessible(true);
            gField.setAccessible(true);

            Object aVal = aField.get(originalTile);
            Object bVal = bField.get(originalTile);
            Object cVal = cField.get(originalTile);
            Object hVal = hField.get(originalTile);
            Object dVal = dField.get(originalTile);
            Object eVal = eField.get(originalTile);
            Object gVal = gField.get(originalTile);

            for (Constructor<?> ctor : snaClass.getConstructors()) {
                if (ctor.getParameterTypes().length == 8) {
                    ctor.setAccessible(true);
                    return ctor.newInstance(aVal, bVal, cVal, hVal, dVal, eVal, newStatus, gVal);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed creating updated sna tile", t);
        }
        return null;
    }

    private static Object createUpdatedSny(Object originalSny, List<?> newTiles) {
        if (originalSny == null) return null;
        try {
            Class<?> snyClass = originalSny.getClass();
            Field dField = snyClass.getDeclaredField("d");
            Field bField = snyClass.getDeclaredField("b");
            Field cField = snyClass.getDeclaredField("c");
            dField.setAccessible(true);
            bField.setAccessible(true);
            cField.setAccessible(true);

            int dVal = dField.getInt(originalSny);
            Object bVal = bField.get(originalSny);
            Object cVal = cField.get(originalSny);

            for (Constructor<?> ctor : snyClass.getConstructors()) {
                if (ctor.getParameterTypes().length == 4) {
                    ctor.setAccessible(true);
                    return ctor.newInstance(dVal, newTiles, bVal, cVal);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed creating updated sny", t);
        }
        return null;
    }

    public static void updateMfyCardTileState(Object presenter, String cardId, Boolean saved, boolean remove) {
        if (presenter == null || cardId == null) return;
        try {
            Field mField = null;
            try {
                mField = presenter.getClass().getDeclaredField("m");
            } catch (Throwable ignored) {}
            if (mField == null) {
                for (Field f : presenter.getClass().getDeclaredFields()) {
                    String tName = f.getType().getName();
                    if (tName.contains("culm") || tName.contains("StateFlow")) {
                        mField = f;
                        break;
                    }
                }
            }
            if (mField == null) return;
            mField.setAccessible(true);
            Object flow = mField.get(presenter);
            if (flow == null) return;

            Method getVal = null;
            try {
                getVal = flow.getClass().getMethod("e");
            } catch (NoSuchMethodException e) {
                try {
                    getVal = flow.getClass().getMethod("getValue");
                } catch (NoSuchMethodException ignored) {}
            }
            if (getVal == null) return;

            Object curSny = getVal.invoke(flow);
            if (curSny == null) return;

            Field aField = null;
            for (Field f : curSny.getClass().getDeclaredFields()) {
                if (List.class.isAssignableFrom(f.getType())) {
                    aField = f;
                    break;
                }
            }
            if (aField == null) return;
            aField.setAccessible(true);
            List<?> tiles = (List<?>) aField.get(curSny);
            if (tiles == null || tiles.isEmpty()) return;

            List<Object> newTiles = new ArrayList<>();
            boolean found = false;
            Object statusObj = (saved != null) ? resolveStatusObject(saved.booleanValue()) : null;

            for (Object tile : tiles) {
                if (tile == null) continue;
                String tileId = extractCardIdFromSna(tile);
                if (cardId.equals(tileId)) {
                    found = true;
                    if (remove) {
                        // Omit from newTiles
                        continue;
                    } else {
                        Object updatedTile = createUpdatedSna(tile, statusObj);
                        if (updatedTile != null) {
                            newTiles.add(updatedTile);
                        } else {
                            newTiles.add(tile);
                        }
                    }
                } else {
                    newTiles.add(tile);
                }
            }

            if (found) {
                Object newSny = createUpdatedSny(curSny, newTiles);
                if (newSny != null) {
                    Method setVal = null;
                    try {
                        setVal = flow.getClass().getMethod("f", Object.class);
                    } catch (NoSuchMethodException e) {
                        try {
                            setVal = flow.getClass().getMethod("setValue", Object.class);
                        } catch (NoSuchMethodException ignored) {}
                    }
                    if (setVal != null) {
                        setVal.invoke(flow, newSny);
                        Log.i(TAG, "updateMfyCardTileState: Successfully updated sny in StateFlow for " + cardId + " (saved=" + saved + ", remove=" + remove + ", newSize=" + newTiles.size() + ")");
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in updateMfyCardTileState", t);
        }
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
                    if (typeName.contains("crny") || typeName.contains("StateFlow") || typeName.contains("ctcj") || typeName.contains("ctzv")) {
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
                        // Purge any corrupted or non-status objects from map
                        ClassLoader cl = LocalCreationDownloader.class.getClassLoader();
                        Class<?> statusInterface = getStatusInterface(cl);
                        Iterator<Map.Entry<Object, Object>> it = newMap.entrySet().iterator();
                        while (it.hasNext()) {
                            Map.Entry<Object, Object> entry = it.next();
                            Object val = entry.getValue();
                            if (val == null || !(val instanceof android.os.Parcelable)) {
                                it.remove();
                                continue;
                            }
                            if (statusInterface != null && !statusInterface.isInstance(val)) {
                                it.remove();
                                continue;
                            }
                            String valCls = val.getClass().getName();
                            if (valCls.equals("qlq") || valCls.equals("qlp") || valCls.equals("qoe") || valCls.equals("qod") || valCls.equals("qoc")) {
                                it.remove();
                            }
                        }

                        Object savedObj = resolveStatusObject(true);

                        if (savedObj instanceof android.os.Parcelable) {
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

    private static void updateMfySaveStatus(Object mfyMixin, String id, Boolean saved) {
        if (mfyMixin == null || id == null) return;
        try {
            Field bField = null;
            try {
                bField = mfyMixin.getClass().getDeclaredField("b");
            } catch (Throwable ignored) {}
            if (bField == null) {
                for (Field f : mfyMixin.getClass().getDeclaredFields()) {
                    String typeName = f.getType().getName();
                    if (typeName.contains("crny") || typeName.contains("StateFlow") || typeName.contains("ctcj") || typeName.contains("ctzv")) {
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
                        // Purge any corrupted or non-status objects from map
                        ClassLoader cl = LocalCreationDownloader.class.getClassLoader();
                        Class<?> statusInterface = getStatusInterface(cl);
                        Iterator<Map.Entry<Object, Object>> it = newMap.entrySet().iterator();
                        while (it.hasNext()) {
                            Map.Entry<Object, Object> entry = it.next();
                            Object val = entry.getValue();
                            if (val == null || !(val instanceof android.os.Parcelable)) {
                                it.remove();
                                continue;
                            }
                            if (statusInterface != null && !statusInterface.isInstance(val)) {
                                it.remove();
                                continue;
                            }
                            String valCls = val.getClass().getName();
                            if (valCls.equals("qlq") || valCls.equals("qlp") || valCls.equals("qoe") || valCls.equals("qod") || valCls.equals("qoc")) {
                                it.remove();
                            }
                        }

                        if (saved == null) {
                            newMap.remove(id);
                        } else {
                            Object statusObj = resolveStatusObject(saved.booleanValue());
                            if (statusObj instanceof android.os.Parcelable) {
                                newMap.put(id, statusObj);
                            }
                        }

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
                            Log.i(TAG, "Updated MFY state flow for ID " + id + " to " + (saved == null ? "REMOVED" : (saved ? "SAVED" : "SAVING")));
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

    private static volatile Object sCurrentMfyDelegate;

    /**
     * Captures the MFYSectionDelegate instance at the beginning of snn.j execution
     * before p0 can be overwritten by local register allocations.
     */
    public static void onMfyDelegateInit(Object delegate) {
        if (delegate != null) {
            sCurrentMfyDelegate = delegate;
            sCurrentPresenter = new java.lang.ref.WeakReference<>(delegate);
        }
    }

    /**
     * Intercepts MFY creations loading in Create Tab (snn.j).
     * Filters out already saved creations and ensures that at least 8 (or all available) un-saved creations
     * are loaded from SQLite, replenishing the MFY carousel so it never collapses and always has fresh suggestions.
     */
    public static Object onMfyLoadCreations(Object snnDelegate, Object sngResult) {
        try {
            List<?> creations = null;
            if (sngResult != null) {
                for (Field f : sngResult.getClass().getDeclaredFields()) {
                    if (List.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        creations = (List<?>) f.get(sngResult);
                        break;
                    }
                }
            }

            // Filter out any creations that are already marked as saved
            List<Object> unSavedCreations = new ArrayList<>();
            if (creations != null) {
                for (Object item : creations) {
                    String cardId = extractCardIdFromSna(item);
                    if (cardId == null || !isCardSaved(cardId)) {
                        unSavedCreations.add(item);
                    }
                }
            }

            // If the loaded creations already have >= 3 un-saved items and no saved items were present, return them directly
            if (unSavedCreations.size() >= 3 && unSavedCreations.size() == (creations != null ? creations.size() : 0)) {
                Log.d(TAG, "onMfyLoadCreations: Loaded " + unSavedCreations.size() + " un-saved creations from proto/recent window.");
                return sngResult;
            }

            int currentCount = unSavedCreations.size();
            Log.i(TAG, "onMfyLoadCreations: Un-saved creations count (" + currentCount + ") < 3. Falling back to query all historical creations from assistant_cards...");

            Object delegate = snnDelegate;
            if (delegate == null || delegate instanceof Map || delegate instanceof Collection) {
                delegate = sCurrentMfyDelegate;
                if (delegate == null && sCurrentPresenter != null) {
                    delegate = sCurrentPresenter.get();
                }
            }
            if (delegate == null) {
                Log.w(TAG, "onMfyLoadCreations: delegate is null, cannot perform fallback");
                return sngResult;
            }

            // Find method d(Instant, boolean, Set) on snnDelegate
            Method queryAllMethod = null;
            for (Method m : delegate.getClass().getDeclaredMethods()) {
                Class<?>[] pTypes = m.getParameterTypes();
                if (pTypes.length == 3 && pTypes[1] == boolean.class && Set.class.isAssignableFrom(pTypes[2])) {
                    queryAllMethod = m;
                    break;
                }
            }

            if (queryAllMethod != null) {
                queryAllMethod.setAccessible(true);
                // First attempt: diverse categories (z=true)
                Object fallbackSng = queryAllMethod.invoke(delegate, null, true, new java.util.LinkedHashSet<>());
                List<?> fallbackList = extractListFromSng(fallbackSng);
                int fallbackCount = fallbackList != null ? fallbackList.size() : 0;
                Log.i(TAG, "onMfyLoadCreations: Fallback query (z=true) returned " + fallbackCount + " creations.");

                // If diverse query returned < 3 items, try all categories (z=false)
                if (fallbackCount < 3) {
                    fallbackSng = queryAllMethod.invoke(delegate, null, false, new java.util.LinkedHashSet<>());
                    fallbackList = extractListFromSng(fallbackSng);
                    fallbackCount = fallbackList != null ? fallbackList.size() : 0;
                    Log.i(TAG, "onMfyLoadCreations: Fallback query (z=false) returned " + fallbackCount + " creations.");
                }

                if (fallbackCount > 0) {
                    return fallbackSng;
                }
            } else {
                Log.w(TAG, "onMfyLoadCreations: Could not find d(Instant, boolean, Set) on " + delegate.getClass().getName());
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in onMfyLoadCreations fallback", t);
        }
        return sngResult;
    }

    private static List<?> extractListFromSng(Object sngObj) {
        if (sngObj == null) return null;
        try {
            for (Field f : sngObj.getClass().getDeclaredFields()) {
                if (List.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    return (List<?>) f.get(sngObj);
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    /**
     * Called at instruction 0 of snn.q(str, bzdj).
     * If the card has already been saved, returns true to signal q to return null immediately.
     * This causes snn.d to cleanly skip saved cards and pull the next un-saved creation from SQLite.
     */
    public static boolean shouldFilterMfyCard(Object presenter, String cardId, Object mediaItem) {
        if (presenter != null) {
            sCurrentPresenter = new java.lang.ref.WeakReference<>(presenter);
            sCurrentMfyDelegate = presenter;
        }
        if (cardId == null) return false;
        if (mediaItem != null) {
            sCardMediaMap.put(cardId, mediaItem);
        }
        try {
            boolean saved = isCreationSaved(mediaItem) || isCardSaved(cardId);
            if (saved) {
                recordCardSaved(cardId);
                updatePresenterSets(presenter, cardId, null, true);
                Log.d(TAG, "shouldFilterMfyCard: Skipping saved card " + cardId);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in shouldFilterMfyCard", t);
        }
        return false;
    }

    /**
     * Legacy hook retained for backward compatibility.
     */
    public static void onCheckHeroCardSaved(Object presenter, String cardId, Object mediaItem) {
        shouldFilterMfyCard(presenter, cardId, mediaItem);
    }

    private static void updatePresenterSets(Object presenter, Object cardId, Object wsf, boolean saved) {
        if (presenter == null) return;
        try {
            for (Field f : presenter.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object setObj = f.get(presenter);
                if (setObj == null) continue;

                String name = f.getName();
                boolean isE = "E".equals(name);
                boolean isJ = "j".equals(name);

                if (!isE && !isJ && !Set.class.isAssignableFrom(f.getType()) && !f.getType().getName().contains("KeySetView")) {
                    continue;
                }

                if (setObj instanceof Set) {
                    Set set = (Set) setObj;
                    if (isE) {
                        if (saved) {
                            if (cardId != null) set.remove(cardId);
                            if (wsf != null) set.remove(wsf);
                        } else {
                            if (cardId != null) set.add(cardId);
                            if (wsf != null) set.add(wsf);
                        }
                    } else if (isJ) {
                        if (saved) {
                            if (cardId != null) set.add(cardId);
                            if (wsf != null) set.add(wsf);
                        } else {
                            if (cardId != null) set.remove(cardId);
                            if (wsf != null) set.remove(wsf);
                            if (cardId == null && wsf == null) set.clear();
                        }
                    } else if (saved) {
                        if (cardId != null) set.add(cardId);
                        if (wsf != null) set.add(wsf);
                    } else if (cardId == null && wsf == null) {
                        set.clear();
                    }
                } else {
                    // Reflection for desugared ConcurrentHashMap$KeySetView
                    try {
                        Method addMethod = null;
                        Method removeMethod = null;
                        for (Method sm : setObj.getClass().getMethods()) {
                            if (sm.getName().equals("add") && sm.getParameterTypes().length == 1) addMethod = sm;
                            if (sm.getName().equals("remove") && sm.getParameterTypes().length == 1) removeMethod = sm;
                        }
                        if (isE) {
                            if (saved && removeMethod != null) {
                                if (cardId != null) removeMethod.invoke(setObj, cardId);
                                if (wsf != null) removeMethod.invoke(setObj, wsf);
                            } else if (!saved && addMethod != null) {
                                if (cardId != null) addMethod.invoke(setObj, cardId);
                                if (wsf != null) addMethod.invoke(setObj, wsf);
                            }
                        } else if (isJ) {
                            if (saved && addMethod != null) {
                                if (cardId != null) addMethod.invoke(setObj, cardId);
                                if (wsf != null) addMethod.invoke(setObj, wsf);
                            } else if (!saved) {
                                if (removeMethod != null) {
                                    if (cardId != null) removeMethod.invoke(setObj, cardId);
                                    if (wsf != null) removeMethod.invoke(setObj, wsf);
                                }
                                if (cardId == null && wsf == null) {
                                    try {
                                        Method clearMethod = setObj.getClass().getMethod("clear");
                                        clearMethod.invoke(setObj);
                                    } catch (Throwable ignored) {}
                                }
                            }
                        }
                    } catch (Throwable ignored) {}
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
                                                    if (cardId == null && wsf == null && !saved) {
                                                        match = true;
                                                    } else {
                                                        for (Field cf : card.getClass().getDeclaredFields()) {
                                                            cf.setAccessible(true);
                                                            Object cv = cf.get(card);
                                                            if (wsf != null && wsf.equals(cv)) match = true;
                                                            if (cardId != null && cardId.equals(cv)) match = true;
                                                        }
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
     * Called when the user taps "Save" on a Create Tab hero card (Lqlb->n / Lqno->n / Lskw->n).
     * Marks the card ID as saved immediately and dispatches background export to DCIM/Google Photos.
     */
    public static void onCreateHeroSaveRequested(Object presenter, Object wsf) {
        if (presenter == null || wsf == null) return;
        try {
            sCurrentPresenter = new java.lang.ref.WeakReference<>(presenter);
            Log.d(TAG, "onCreateHeroSaveRequested called with wsf: " + wsf);

            Object mediaItem = sWsfMediaMap.get(wsf);
            String targetCardId = sWsfCardMap.get(wsf);

            // 1. If mediaItem not in map, check presenter.k (ConcurrentHashMap<ysk, bypn>)
            if (mediaItem == null) {
                try {
                    Field kField = presenter.getClass().getDeclaredField("k");
                    kField.setAccessible(true);
                    Map<?, ?> kMap = (Map<?, ?>) kField.get(presenter);
                    if (kMap != null) {
                        Object bypn = kMap.get(wsf);
                        if (bypn != null) {
                            Log.d(TAG, "Resolved bypn from presenter.k: " + bypn);
                            mediaItem = bypn;
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // 2. If mediaItem still not found, match by idValue (e.g. idValue=2948)
            if (mediaItem == null || targetCardId == null) {
                try {
                    Pattern idPat = Pattern.compile("idValue=(\\d+)");
                    Matcher m = idPat.matcher(wsf.toString());
                    if (m.find()) {
                        String idVal = m.group(1);
                        if (mediaItem == null) {
                            mediaItem = sIdMediaMap.get(idVal);
                        }
                        if (targetCardId == null) {
                            targetCardId = sIdCardMap.get(idVal);
                        }
                    }
                } catch (Throwable ignored) {}
            }

            // 3. Fallback: inspect StateFlow in presenter
            if (targetCardId == null || mediaItem == null) {
                for (Field f : presenter.getClass().getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(presenter);
                        if (val != null) {
                            String typeName = val.getClass().getName();
                            if (typeName.contains("StateFlow") || typeName.contains("ctcj") || typeName.contains("crny") || typeName.contains("ctzv")) {
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
            }

            if (mediaItem == null && targetCardId != null) {
                mediaItem = sCardMediaMap.get(targetCardId);
            }

            // If targetCardId is still null, derive from mediaItem or wsf
            if (targetCardId == null) {
                if (mediaItem != null) {
                    targetCardId = extractItemKey(mediaItem);
                } else {
                    targetCardId = "hero_" + Math.abs(wsf.toString().hashCode());
                }
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
                            // Trigger presenter refresh if it has method l(boolean)
                            try {
                                Method lMethod = presenter.getClass().getMethod("l", boolean.class);
                                lMethod.invoke(presenter, false);
                            } catch (Throwable ignored) {}
                            Toast.makeText(appContext, "Saved creation to Google Photos", Toast.LENGTH_SHORT).show();
                            Log.i(TAG, "Successfully exported hero card creation to DCIM/Google Photos and updated UI to Saved.");
                        } else {
                            Toast.makeText(appContext, "Failed to save creation", Toast.LENGTH_SHORT).show();
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

            boolean loaded = tryLoadWithGlide(context, mediaItem, mediaUri, tempFile);
            if (!loaded) {
                Log.d(TAG, "Glide loading did not produce file, falling back to openMediaStream for " + mediaUri);
                try (InputStream in = openMediaStream(context, resolver, mediaUri);
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

    private static boolean tryLoadWithGlide(Context context, Object mediaItem, Uri mediaUri, File tempFile) {
        if (context == null || tempFile == null) return false;
        try {
            Class<?> glideClass = null;
            try {
                glideClass = Class.forName("mdm");
            } catch (Throwable t) {
                try {
                    glideClass = Class.forName("com.bumptech.glide.Glide");
                } catch (Throwable ignored) {}
            }
            if (glideClass == null) {
                Log.w(TAG, "Glide class not found");
                return false;
            }

            Method withMethod = null;
            for (Method m : glideClass.getMethods()) {
                if (Modifier.isStatic(m.getModifiers()) &&
                    m.getParameterTypes().length == 1 &&
                    m.getParameterTypes()[0] == Context.class &&
                    !m.getReturnType().equals(glideClass) &&
                    !m.getReturnType().equals(void.class)) {
                    withMethod = m;
                    break;
                }
            }
            if (withMethod == null) {
                try {
                    withMethod = glideClass.getMethod("e", Context.class);
                } catch (Throwable ignored) {}
            }
            if (withMethod == null) {
                try {
                    withMethod = glideClass.getMethod("with", Context.class);
                } catch (Throwable ignored) {}
            }
            if (withMethod == null) {
                Log.w(TAG, "Glide.with method not found");
                return false;
            }

            Object requestManager = withMethod.invoke(null, context);
            if (requestManager == null) {
                Log.w(TAG, "Glide.with(context) returned null");
                return false;
            }
            Log.d(TAG, "Resolved Glide requestManager: " + requestManager.getClass().getName());

            // 1. Try asFile() -> meu
            Method asFileMethod = null;
            try {
                asFileMethod = requestManager.getClass().getMethod("d");
            } catch (Throwable t) {
                try {
                    asFileMethod = requestManager.getClass().getMethod("asFile");
                } catch (Throwable ignored) {}
            }
            if (asFileMethod == null) {
                for (Method m : requestManager.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0 &&
                        (m.getName().equals("d") || m.getReturnType().getSimpleName().equals("meu"))) {
                        asFileMethod = m;
                        break;
                    }
                }
            }

            List<Object> targets = new ArrayList<>();
            if (mediaItem != null) targets.add(mediaItem);
            if (mediaUri != null) {
                targets.add(mediaUri.toString());
                targets.add(mediaUri);
            }

            if (asFileMethod != null) {
                for (Object model : targets) {
                    try {
                        Object requestBuilder = asFileMethod.invoke(requestManager);
                        if (requestBuilder != null && submitAndCopyFile(requestBuilder, model, tempFile)) {
                            Log.i(TAG, "Successfully loaded file via Glide asFile() for model: " + model.getClass().getSimpleName());
                            return true;
                        }
                    } catch (Throwable t) {
                        Log.d(TAG, "Glide asFile() failed for " + model + ": " + t.getMessage());
                    }
                }
            }

            // 2. Try asBitmap() -> meu
            Method asBitmapMethod = null;
            try {
                asBitmapMethod = requestManager.getClass().getMethod("b");
            } catch (Throwable t) {
                try {
                    asBitmapMethod = requestManager.getClass().getMethod("asBitmap");
                } catch (Throwable ignored) {}
            }
            if (asBitmapMethod == null) {
                for (Method m : requestManager.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0 &&
                        (m.getName().equals("b") || m.getReturnType().getSimpleName().equals("meu"))) {
                        asBitmapMethod = m;
                        break;
                    }
                }
            }

            if (asBitmapMethod != null) {
                for (Object model : targets) {
                    try {
                        Object requestBuilder = asBitmapMethod.invoke(requestManager);
                        if (requestBuilder != null && submitAndSaveBitmap(requestBuilder, model, tempFile)) {
                            Log.i(TAG, "Successfully loaded bitmap via Glide asBitmap() for model: " + model.getClass().getSimpleName());
                            return true;
                        }
                    } catch (Throwable t) {
                        Log.d(TAG, "Glide asBitmap() failed for " + model + ": " + t.getMessage());
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "tryLoadWithGlide failed with exception", t);
        }
        return false;
    }

    private static Method findLoadMethod(Object requestBuilder, Object model) {
        Class<?> modelClass = model.getClass();
        for (Method m : requestBuilder.getClass().getMethods()) {
            if (m.getParameterTypes().length == 1 &&
                m.getParameterTypes()[0].isAssignableFrom(modelClass) &&
                m.getReturnType().isAssignableFrom(requestBuilder.getClass())) {
                if (m.getName().equals("k") || m.getName().equals("l") || m.getName().equals("i") || m.getName().equals("load")) {
                    return m;
                }
            }
        }
        for (Method m : requestBuilder.getClass().getMethods()) {
            if (m.getParameterTypes().length == 1 &&
                m.getParameterTypes()[0] == Object.class &&
                m.getReturnType().isAssignableFrom(requestBuilder.getClass())) {
                return m;
            }
        }
        return null;
    }

    private static boolean submitAndCopyFile(Object requestBuilder, Object model, File tempFile) throws Exception {
        Method loadMethod = findLoadMethod(requestBuilder, model);
        if (loadMethod == null) return false;

        Object loadedBuilder = loadMethod.invoke(requestBuilder, model);
        if (loadedBuilder == null) loadedBuilder = requestBuilder;

        Method submitMethod = null;
        try {
            submitMethod = loadedBuilder.getClass().getMethod("u", int.class, int.class);
        } catch (Throwable t) {
            for (Method m : loadedBuilder.getClass().getMethods()) {
                if (m.getParameterTypes().length == 2 &&
                    m.getParameterTypes()[0] == int.class &&
                    m.getParameterTypes()[1] == int.class &&
                    Future.class.isAssignableFrom(m.getReturnType())) {
                    submitMethod = m;
                    break;
                }
            }
        }
        if (submitMethod == null) return false;

        Object futureTarget = submitMethod.invoke(loadedBuilder, Integer.MIN_VALUE, Integer.MIN_VALUE);
        if (!(futureTarget instanceof Future)) return false;

        Future<?> future = (Future<?>) futureTarget;
        Object result = future.get(20, TimeUnit.SECONDS);
        if (result instanceof File) {
            File sourceFile = (File) result;
            if (sourceFile.exists() && sourceFile.length() > 0) {
                try (InputStream fin = new FileInputStream(sourceFile);
                     OutputStream fout = new FileOutputStream(tempFile)) {
                    byte[] buf = new byte[16384];
                    int len;
                    while ((len = fin.read(buf)) > 0) {
                        fout.write(buf, 0, len);
                    }
                    fout.flush();
                }
                return tempFile.length() > 0;
            }
        }
        return false;
    }

    private static boolean submitAndSaveBitmap(Object requestBuilder, Object model, File tempFile) throws Exception {
        Method loadMethod = findLoadMethod(requestBuilder, model);
        if (loadMethod == null) return false;

        Object loadedBuilder = loadMethod.invoke(requestBuilder, model);
        if (loadedBuilder == null) loadedBuilder = requestBuilder;

        Method submitMethod = null;
        try {
            submitMethod = loadedBuilder.getClass().getMethod("u", int.class, int.class);
        } catch (Throwable t) {
            for (Method m : loadedBuilder.getClass().getMethods()) {
                if (m.getParameterTypes().length == 2 &&
                    m.getParameterTypes()[0] == int.class &&
                    m.getParameterTypes()[1] == int.class &&
                    Future.class.isAssignableFrom(m.getReturnType())) {
                    submitMethod = m;
                    break;
                }
            }
        }
        if (submitMethod == null) return false;

        Object futureTarget = submitMethod.invoke(loadedBuilder, Integer.MIN_VALUE, Integer.MIN_VALUE);
        if (!(futureTarget instanceof Future)) return false;

        Future<?> future = (Future<?>) futureTarget;
        Object result = future.get(20, TimeUnit.SECONDS);
        if (result instanceof Bitmap) {
            Bitmap bmp = (Bitmap) result;
            try (OutputStream fout = new FileOutputStream(tempFile)) {
                bmp.compress(Bitmap.CompressFormat.JPEG, 95, fout);
                fout.flush();
            }
            return tempFile.length() > 0;
        }
        return false;
    }

    public static String getAuthToken(Context context) {
        return getAuthToken(context, null);
    }

    public static String getAuthToken(Context context, String preferredAccountName) {
        if (context == null) context = sAppContext != null ? sAppContext : getApplicationContext();
        if (context == null) return null;
        try {
            AccountManager am = AccountManager.get(context);
            Account[] accounts = am.getAccountsByType("app.revanced");
            if (accounts == null || accounts.length == 0) {
                accounts = am.getAccountsByType("com.google");
            }
            if (accounts == null || accounts.length == 0) {
                return null;
            }
            String[] scopes = new String[] {
                "oauth2:https://www.googleapis.com/auth/photos",
                "oauth2:https://www.googleapis.com/auth/photos.image.readonly",
                "oauth2:openid https://www.googleapis.com/auth/mobileapps.native https://www.googleapis.com/auth/photos.native",
                "oauth2:openid"
            };
            Bundle options = new Bundle();
            try {
                options.putString("androidPackageName", context.getPackageName());
            } catch (Throwable ignored) {}

            String activeEmail = preferredAccountName;
            if (activeEmail == null || activeEmail.trim().isEmpty()) {
                try {
                    SharedPreferences photosAccounts = context.getSharedPreferences("accounts", Context.MODE_PRIVATE);
                    int activeKey = photosAccounts.getInt("key.active-account-key", -99);
                    if (activeKey >= 0) {
                        activeEmail = photosAccounts.getString(activeKey + ".account_name", null);
                    }
                } catch (Throwable ignored) {}
            }

            List<Account> orderedAccounts = new ArrayList<>();
            if (activeEmail != null) {
                for (Account acc : accounts) {
                    if (acc.name != null && acc.name.equalsIgnoreCase(activeEmail.trim())) {
                        orderedAccounts.add(acc);
                    }
                }
            }
            for (Account acc : accounts) {
                if (!orderedAccounts.contains(acc)) {
                    orderedAccounts.add(acc);
                }
            }

            for (Account acc : orderedAccounts) {
                for (String scope : scopes) {
                    try {
                        AccountManagerFuture<Bundle> future = am.getAuthToken(acc, scope, options, false, null, null);
                        Bundle bundle = future.getResult(4, TimeUnit.SECONDS);
                        if (bundle != null) {
                            String token = bundle.getString(AccountManager.KEY_AUTHTOKEN);
                            if (token != null && !token.isEmpty()) {
                                Log.d(TAG, "Successfully acquired auth token for " + acc.name + " scope " + scope);
                                return token;
                            }
                        }
                    } catch (Throwable ignored) {}
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed getting auth token", t);
        }
        return null;
    }

    private static InputStream openMediaStream(ContentResolver resolver, Uri uri) throws Exception {
        return openMediaStream(sAppContext != null ? sAppContext : getApplicationContext(), resolver, uri);
    }

    private static InputStream openMediaStream(Context context, ContentResolver resolver, Uri uri) throws Exception {
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

            String authToken = getAuthToken(context);
            java.net.HttpURLConnection conn = openHttpConnection(urlStr, authToken);
            int responseCode = conn.getResponseCode();
            if (responseCode >= 400) {
                Log.w(TAG, "HTTP " + responseCode + " for URL: " + urlStr + " — falling back to original URI");
                conn.disconnect();
                conn = openHttpConnection(uri.toString(), authToken);
                responseCode = conn.getResponseCode();
                if (responseCode >= 400 && authToken != null) {
                    Log.w(TAG, "HTTP " + responseCode + " with auth — trying anonymous connection to original URI");
                    conn.disconnect();
                    conn = openHttpConnection(uri.toString(), null);
                }
            }
            return conn.getInputStream();
        } else {
            return resolver.openInputStream(uri);
        }
    }

    private static java.net.HttpURLConnection openHttpConnection(String urlStr, String authToken) throws Exception {
        java.net.HttpURLConnection conn = (java.net.HttpURLConnection) new java.net.URL(urlStr).openConnection();
        conn.setConnectTimeout(15000);
        conn.setReadTimeout(60000);
        conn.setInstanceFollowRedirects(true);
        conn.setRequestProperty("User-Agent", "Mozilla/5.0");
        if (authToken != null && !authToken.isEmpty()) {
            conn.setRequestProperty("Authorization", "Bearer " + authToken);
            Log.d(TAG, "Attached Authorization Bearer token to HTTP request");
        }
        return conn;
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

        // Attempt 4: Direct regex extraction of Fife URL from mediaItem.toString()
        try {
            String str = mediaItem.toString();
            Pattern fifePattern = Pattern.compile("https?://[a-zA-Z0-9.-]*googleusercontent\\.com/[^'\"\\s,\\]\\}]+");
            Matcher fm = fifePattern.matcher(str);
            if (fm.find()) {
                String url = fm.group();
                Log.d(TAG, "Extracted Fife URL from mediaItem toString: " + url);
                return Uri.parse(url);
            }
            Pattern generalUrlPattern = Pattern.compile("https?://[^'\"\\s,\\]\\}]+");
            Matcher gm = generalUrlPattern.matcher(str);
            if (gm.find()) {
                String url = gm.group();
                Log.d(TAG, "Extracted URL from mediaItem toString: " + url);
                return Uri.parse(url);
            }
            // Check for mediaKey in toString
            Pattern keyPattern = Pattern.compile("(?:mediaKey='|itm:)([A-Za-z0-9_-]{20,})");
            Matcher km = keyPattern.matcher(str);
            if (km.find()) {
                String key = km.group(1);
                String fifeUrl = "https://lh3.googleusercontent.com/" + key + "=d";
                Log.d(TAG, "Constructed Fife URL from mediaKey in toString: " + fifeUrl);
                return Uri.parse(fifeUrl);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error matching URL in toString", t);
        }

        // Attempt 5: Extract URL from mediaItem features (e.g. MediaDisplayFeature -> RemoteMediaModel / FifeUrl)
        try {
            String url = extractUrlFromObject(mediaItem, 0);
            if (url != null && !url.isEmpty()) {
                Log.d(TAG, "Resolved creation URL from mediaItem features: " + url);
                return Uri.parse(url);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Error in extractUrlFromObject", t);
        }

        Log.w(TAG, "Failed resolving media URI via all providers for item: " + mediaItem);
        return null;
    }

    private static String extractUrlFromObject(Object obj, int depth) {
        return extractUrlFromObject(obj, depth, new HashSet<>());
    }

    private static String extractUrlFromObject(Object obj, int depth, Set<Object> visited) {
        if (obj == null || depth > 4 || !visited.add(obj)) return null;
        if (obj instanceof String) {
            String s = (String) obj;
            if (s.startsWith("http://") || s.startsWith("https://")) {
                return s;
            }
            return null;
        }
        if (obj instanceof Uri) {
            Uri u = (Uri) obj;
            String s = u.toString();
            if (s.startsWith("http://") || s.startsWith("https://")) {
                return s;
            }
            return null;
        }

        // Check if toString() contains a googleusercontent URL
        try {
            String str = obj.toString();
            if (str != null && str.contains("googleusercontent.com")) {
                Pattern fifePattern = Pattern.compile("https?://[a-zA-Z0-9.-]*googleusercontent\\.com/[^'\"\\s,\\]\\}]+");
                Matcher fm = fifePattern.matcher(str);
                if (fm.find()) {
                    return fm.group();
                }
            }
        } catch (Throwable ignored) {}

        if (obj instanceof Iterable) {
            for (Object item : (Iterable<?>) obj) {
                String res = extractUrlFromObject(item, depth + 1, visited);
                if (res != null) return res;
            }
            return null;
        }
        if (obj instanceof Map) {
            for (Object val : ((Map<?, ?>) obj).values()) {
                String res = extractUrlFromObject(val, depth + 1, visited);
                if (res != null) return res;
            }
            return null;
        }

        Class<?> clazz = obj.getClass();
        if (clazz.getName().startsWith("java.lang.") || clazz.getName().startsWith("android.os.")) {
            return null;
        }

        for (Method m : clazz.getMethods()) {
            if (m.getParameterTypes().length == 0 &&
                (m.getReturnType() == String.class || Uri.class.isAssignableFrom(m.getReturnType()))) {
                String mName = m.getName().toLowerCase(Locale.US);
                if (mName.contains("url") || mName.contains("uri") || mName.contains("link") || mName.contains("fife") || mName.equals("a") || mName.equals("b")) {
                    try {
                        Object ret = m.invoke(obj);
                        String res = extractUrlFromObject(ret, depth + 1, visited);
                        if (res != null) return res;
                    } catch (Throwable ignored) {}
                }
            }
        }

        for (Field f : clazz.getDeclaredFields()) {
            try {
                f.setAccessible(true);
                Object val = f.get(obj);
                if (val != null) {
                    String res = extractUrlFromObject(val, depth + 1, visited);
                    if (res != null) return res;
                }
            } catch (Throwable ignored) {}
        }
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

    /**
     * Safely validates and casts candidate creation state in koo.a.
     * Prevents ClassCastException (e.g. cfdb cannot be cast to slm) when saving creations in the Create tab.
     * If candidate is an instance of Parcelable (which all slm creation states implement), returns candidate.
     * If candidate is not Parcelable (e.g. Flogger logger cfdb), returns skm.f (the original valid state)
     * so that the equality check Intrinsics.areEqual(newSlm, skm.f) evaluates to true and safely skips updating.
     */
    public static Object safeSlm(Object candidate, Object skm) {
        if (candidate == null) {
            return null;
        }
        ClassLoader cl = LocalCreationDownloader.class.getClassLoader();
        Class<?> statusInterface = getStatusInterface(cl);
        if (candidate instanceof android.os.Parcelable) {
            if (statusInterface == null || statusInterface.isInstance(candidate)) {
                String clsName = candidate.getClass().getName();
                if (!clsName.equals("qlq") && !clsName.equals("qlp") && !clsName.equals("qoe") && !clsName.equals("qod") && !clsName.equals("qoc")) {
                    return candidate;
                }
            }
        }
        if (skm != null) {
            try {
                for (Field f : skm.getClass().getDeclaredFields()) {
                    if (f.getName().equals("f") || android.os.Parcelable.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        Object original = f.get(skm);
                        if (original instanceof android.os.Parcelable) {
                            if (statusInterface == null || statusInterface.isInstance(original)) {
                                return original;
                            }
                        }
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "safeSlm fallback error: " + t.getMessage());
            }
        }
        return null;
    }

    public static Integer resolveBucketId(Integer bucketId) {
        if (bucketId != null) {
            return bucketId;
        }
        return -1739773001;
    }

    public static int resolveBucketIdInt(Integer bucketId) {
        if (bucketId != null) {
            return bucketId.intValue();
        }
        return -1739773001;
    }
}

