package app.morphe.extension.shared.patches.toolkit;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import java.util.Calendar;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.app.KeyguardManager;
import android.hardware.biometrics.BiometricPrompt;
import android.net.Uri;
import android.os.Build;
import android.os.CancellationSignal;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.util.Pair;
import android.widget.HorizontalScrollView;
import android.media.MediaScannerConnection;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.util.TypedValue;
import android.util.Size;
import android.media.ThumbnailUtils;
import android.provider.MediaStore;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.PhenotypeFlagManager;
import app.morphe.extension.shared.patches.PhenotypeFlagManager.MaterialVectorDrawable;
import app.morphe.extension.shared.patches.PhenotypeFlagManager.Theme;

import android.util.LruCache;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 1:1 Complete Native Google Photos Toolkit Dialog.
 * Follows the authoritative 3-step workflow from google_photos_toolkit.user.js:
 *   Step 1: Choose Source (7 sources)
 *   Step 2: Filter Media (All 21 filters with Space inside, Similarity perceptual hash)
 *   Step 3: Choose Action (All 14 actions)
 * Follows Flag Manager's Material 3 Theme tokens (theme.surface, 28dp rounded modal, M3 colors).
 */
public class NativeToolkitDialog {

    private static final ExecutorService THREAD_POOL = Executors.newFixedThreadPool(4, new ThreadFactory() {
        private final AtomicInteger threadNumber = new AtomicInteger(1);
        @Override
        public Thread newThread(Runnable r) {
            Thread t = new Thread(r, "ToolkitWorker-" + threadNumber.getAndIncrement());
            t.setPriority(Thread.NORM_PRIORITY - 1);
            return t;
        }
    });

    private static final int MAX_CACHE_SIZE_BYTES = (int) Math.min(25 * 1024 * 1024, Runtime.getRuntime().maxMemory() / 8);
    private static final LruCache<String, Bitmap> THUMB_CACHE = new LruCache<String, Bitmap>(MAX_CACHE_SIZE_BYTES) {
        @Override
        protected int sizeOf(String key, Bitmap bitmap) {
            return bitmap != null ? bitmap.getByteCount() : 0;
        }
    };
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public static void clearCache() {
        THUMB_CACHE.evictAll();
    }
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("MMM d, yyyy • h:mm a", Locale.getDefault());
    private static final SimpleDateFormat FILE_DATE_FORMAT = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault());

    private static StorageScanner.AccountInfo currentAccount = null;
    private static StorageScanner.FilterCriteria currentCriteria = new StorageScanner.FilterCriteria();
    private static List<StorageScanner.MediaItem> allQueriedItems = new ArrayList<>();
    private static List<StorageScanner.AlbumInfo> availableAlbums = new ArrayList<>();
    private static final AtomicInteger sScanSequence = new AtomicInteger(0);
    private static Runnable sRepopulateAlbumCardsRunnable = null;
    private static volatile boolean sLockedFolderAuthenticated = false;
    public enum SortOrder {
        DATE_DESC("Date (Newest first)", "Newest"),
        DATE_ASC("Date (Oldest first)", "Oldest"),
        SIZE_DESC("File Size (Largest first)", "Largest"),
        SIZE_ASC("File Size (Smallest first)", "Smallest"),
        QUOTA_DESC("Cloud Quota Impact", "Quota"),
        NAME_ASC("File Name (A → Z)", "Name");

        public final String fullLabel;
        public final String shortLabel;
        SortOrder(String fullLabel, String shortLabel) {
            this.fullLabel = fullLabel;
            this.shortLabel = shortLabel;
        }
    }

    private static SortOrder currentSortOrder = SortOrder.DATE_DESC;
    private static ProgressBar sProgressBar = null;
    private static TextView sTvProgressInfo = null;

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        activity.runOnUiThread(() -> {
            try {
                showDialogInternal(activity);
            } catch (Throwable t) {
                Logger.printException(() -> "Error showing NativeToolkitDialog", t);
                Toast.makeText(activity, "Error opening Toolkit: " + t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

    private static void showDialogInternal(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        Theme theme = Theme.get(activity);

        currentCriteria = new StorageScanner.FilterCriteria();
        currentSortOrder = SortOrder.DATE_DESC;
        allQueriedItems.clear();
        availableAlbums.clear();

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(theme.surface, 28 * density));
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            root.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), 28 * density);
                }
            });
            root.setClipToOutline(true);
        }
        root.setTag("no_avatar");

        // State holder references
        final Runnable[] runScanRef = new Runnable[1];

        // ─────────────────────────────────────────────────────────────────────
        // Top Header Bar
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout topBar = new LinearLayout(activity);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        int tbPad = (int) (16 * density);
        topBar.setPadding(tbPad, (int) (12 * density), (int) (10 * density), (int) (8 * density));

        FrameLayout iconContainer = new FrameLayout(activity);
        int icBox = (int) (34 * density);
        LinearLayout.LayoutParams icBoxLp = new LinearLayout.LayoutParams(icBox, icBox);
        icBoxLp.setMargins(0, 0, (int) (10 * density), 0);
        iconContainer.setLayoutParams(icBoxLp);
        GradientDrawable icBg = new GradientDrawable();
        icBg.setCornerRadius(10 * density);
        icBg.setColor(theme.surfaceContainer);
        iconContainer.setBackground(icBg);

        ImageView ivLead = new ImageView(activity);
        ivLead.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_TOOLKIT, theme.primary));
        int ivLeadSize = (int) (20 * density);
        FrameLayout.LayoutParams ivLeadLp = new FrameLayout.LayoutParams(ivLeadSize, ivLeadSize, Gravity.CENTER);
        ivLead.setLayoutParams(ivLeadLp);
        iconContainer.addView(ivLead);
        topBar.addView(iconContainer);

        LinearLayout titleCol = new LinearLayout(activity);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        titleCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Google Photos Toolkit");
        tvTitle.setTextSize(17.5f);
        tvTitle.setTextColor(theme.textPrimary);
        tvTitle.setTypeface(null, Typeface.BOLD);
        titleCol.addView(tvTitle);

        if (currentAccount == null) {
            currentAccount = StorageScanner.getActiveAccount(activity);
        }
        if (currentAccount != null) {
            StorageScanner.ensureArchiveConsistency(currentAccount);
        }

        THREAD_POOL.execute(() -> {
            if (currentAccount != null) {
                availableAlbums = StorageScanner.getAvailableAlbums(currentAccount);
                if (sRepopulateAlbumCardsRunnable != null) {
                    sRepopulateAlbumCardsRunnable.run();
                }
            }
        });

        TextView tvSub = new TextView(activity);
        String accLabel = currentAccount != null ? currentAccount.accountName : "No Account";
        tvSub.setText(accLabel + " (Active Account)");
        tvSub.setTextSize(11.5f);
        tvSub.setTextColor(theme.textSecondary);
        titleCol.addView(tvSub);
        topBar.addView(titleCol);

        View btnRefresh = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_REFRESH, theme.textSecondary), (int) (40 * density), (int) (20 * density));
        btnRefresh.setTag("no_avatar");
        btnRefresh.setContentDescription("refresh");
        topBar.addView(btnRefresh);

        View btnClose = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, theme.textSecondary), (int) (40 * density), (int) (20 * density));
        btnClose.setTag("no_avatar");
        btnClose.setContentDescription("close");
        topBar.addView(btnClose);
        root.addView(topBar);

        // Divider
        View divTop = new View(activity);
        divTop.setBackgroundColor(theme.outline);
        divTop.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (1 * density)));
        root.addView(divTop);

        // ─────────────────────────────────────────────────────────────────────
        // Main Container (Adaptive Dual-Pane for Tablets, Single-Pane for Phones)
        // ─────────────────────────────────────────────────────────────────────
        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);
        boolean isLandscape = activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;

        TextView tvScanButtonLabel = new TextView(activity);
        TextView tvResultsStatus = new TextView(activity);
        LinearLayout resultsListContainer = new LinearLayout(activity);
        resultsListContainer.setOrientation(LinearLayout.VERTICAL);

        Set<String> selectedMediaKeys = new HashSet<>();
        boolean[] isGridViewRef = new boolean[]{true};
        Map<String, TextView> actionButtonsMap = new HashMap<>();
        final int[] currentPageRef = new int[]{0};
        Runnable[] updateSelectionSummaryRef = new Runnable[1];
        Runnable[] updateChipsAndBadgeRef = new Runnable[1];
        Runnable[] onRefreshRef = new Runnable[1];

        // ─────────────────────────────────────────────────────────────────────
        // Query Execution Engine
        // ─────────────────────────────────────────────────────────────────────
        runScanRef[0] = () -> {
            final int scanSeq = sScanSequence.incrementAndGet();
            MAIN_HANDLER.post(() -> {
                tvResultsStatus.setText("Scanning media matching filters...");
                tvScanButtonLabel.setText("Scanning...");
                if (sProgressBar != null) sProgressBar.setVisibility(View.VISIBLE);
            });
            THREAD_POOL.execute(() -> {
                try {
                    if (scanSeq != sScanSequence.get()) return;
                    if (currentAccount == null) {
                        currentAccount = StorageScanner.getActiveAccount(activity);
                    }
                    if (currentAccount != null) {
                        availableAlbums = StorageScanner.getAvailableAlbums(currentAccount);
                        if (sRepopulateAlbumCardsRunnable != null) {
                            sRepopulateAlbumCardsRunnable.run();
                        }
                        StorageScanner.syncPendingLocalTrash(activity, currentAccount.accountId);
                    }

                    List<StorageScanner.MediaItem> items = StorageScanner.queryMedia(currentAccount, currentCriteria);
                    if (scanSeq != sScanSequence.get()) return;

                    List<StorageScanner.MediaItem> resultItems = new ArrayList<>(items);

                    // If Similarity filter active, compute hashes & cluster
                    if (currentCriteria.similarityThreshold > 0 && !items.isEmpty()) {
                        int hSize = currentCriteria.imageHeight > 0 ? currentCriteria.imageHeight : 16;
                        int maxCandidates = Math.min(items.size(), 100);
                        List<StorageScanner.MediaItem> candidates = new ArrayList<>(items.subList(0, maxCandidates));

                        MAIN_HANDLER.post(() -> {
                            if (scanSeq == sScanSequence.get()) {
                                tvResultsStatus.setText("Clustering visual similarity (checking top " + maxCandidates + " items)...");
                            }
                        });

                        int accId = currentAccount != null ? currentAccount.accountId : 0;
                        int workerThreads = Math.min(4, Math.max(2, Runtime.getRuntime().availableProcessors()));
                        ExecutorService thumbPool = Executors.newFixedThreadPool(workerThreads);
                        CountDownLatch latch = new CountDownLatch(candidates.size());

                        for (StorageScanner.MediaItem it : candidates) {
                            thumbPool.execute(() -> {
                                try {
                                    Bitmap bm = null;
                                    String url = it.remoteUrl != null ? it.remoteUrl : "";
                                    synchronized (THUMB_CACHE) {
                                        bm = THUMB_CACHE.get(url);
                                    }
                                    if (bm == null && !url.isEmpty()) {
                                        bm = fetchThumbSync(activity, url, accId);
                                        if (bm != null) {
                                            synchronized (THUMB_CACHE) {
                                                THUMB_CACHE.put(url, bm);
                                            }
                                        }
                                    }
                                    if (bm != null) {
                                        it.perceptualHash = StorageScanner.calculateAverageHash(bm, hSize);
                                    }
                                } catch (Throwable ignored) {
                                } finally {
                                    latch.countDown();
                                }
                            });
                        }

                        try {
                            latch.await(30, TimeUnit.SECONDS);
                        } catch (InterruptedException ignored) {}
                        thumbPool.shutdown();

                        if (scanSeq != sScanSequence.get()) return;

                        List<List<StorageScanner.MediaItem>> clusters = StorageScanner.clusterSimilarItems(candidates, currentCriteria.similarityThreshold, hSize);
                        resultItems = new ArrayList<>();
                        if (!clusters.isEmpty()) {
                            for (List<StorageScanner.MediaItem> cl : clusters) resultItems.addAll(cl);
                        }
                    }

                    if (currentCriteria.similarityThreshold <= 0) {
                        sortMediaItems(resultItems, currentSortOrder);
                    }

                    if (scanSeq != sScanSequence.get()) return;

                    final List<StorageScanner.MediaItem> finalResults = resultItems;
                    final Set<String> newSelectedKeys = new HashSet<>();
                    for (StorageScanner.MediaItem it : finalResults) {
                        newSelectedKeys.add(getItemKey(it));
                    }

                    MAIN_HANDLER.post(() -> {
                        if (scanSeq != sScanSequence.get()) return;
                        if (sProgressBar != null) sProgressBar.setVisibility(View.GONE);
                        allQueriedItems = new ArrayList<>(finalResults);
                        selectedMediaKeys.clear();
                        selectedMediaKeys.addAll(newSelectedKeys);

                        tvScanButtonLabel.setText("Scan & Filter (" + allQueriedItems.size() + ")");
                        int consuming = 0;
                        long totalQuotaBytes = 0;
                        for (StorageScanner.MediaItem it : allQueriedItems) {
                            if (it.quotaBytes > 0) {
                                consuming++;
                                totalQuotaBytes += it.quotaBytes;
                            }
                        }
                        tvResultsStatus.setText(allQueriedItems.size() + " matched • " + consuming + " consuming (" + StorageScanner.formatBytes(totalQuotaBytes) + ")");
                        currentPageRef[0] = 0;
                        if (updateSelectionSummaryRef[0] != null) updateSelectionSummaryRef[0].run();
                        renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
                        if (updateChipsAndBadgeRef[0] != null) updateChipsAndBadgeRef[0].run();
                    });
                } catch (Throwable t) {
                    Logger.printException(() -> "Error in runScan", t);
                    MAIN_HANDLER.post(() -> {
                        if (scanSeq != sScanSequence.get()) return;
                        if (sProgressBar != null) sProgressBar.setVisibility(View.GONE);
                        tvScanButtonLabel.setText("Scan & Filter");
                        tvResultsStatus.setText("Scan error: " + t.getMessage());
                    });
                }
            });
        };

        if (isLarge && isLandscape) {
            buildTabletStudioLayout(activity, root, density, theme, tvScanButtonLabel, tvResultsStatus,
                    resultsListContainer, actionButtonsMap, selectedMediaKeys, isGridViewRef,
                    currentPageRef, runScanRef, updateSelectionSummaryRef, onRefreshRef);
        } else {
            LinearLayout leftPane;
            LinearLayout rightPane;

            if (isLarge) {
                LinearLayout dualPaneContainer = new LinearLayout(activity);
                dualPaneContainer.setOrientation(LinearLayout.HORIZONTAL);
                dualPaneContainer.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

                ScrollView leftScroll = new ScrollView(activity);
                leftScroll.setLayoutParams(new LinearLayout.LayoutParams((int) (290 * density), ViewGroup.LayoutParams.MATCH_PARENT));
                leftScroll.setPadding(tbPad, (int) (8 * density), (int) (12 * density), (int) (24 * density));
                leftScroll.setClipToPadding(false);

                leftPane = new LinearLayout(activity);
                leftPane.setOrientation(LinearLayout.VERTICAL);
                leftPane.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                leftScroll.addView(leftPane);

                View centerDivider = new View(activity);
                centerDivider.setBackgroundColor(theme.outline);
                centerDivider.setLayoutParams(new LinearLayout.LayoutParams((int) (1 * density), ViewGroup.LayoutParams.MATCH_PARENT));

                ScrollView rightScroll = new ScrollView(activity);
                rightScroll.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1.0f));
                rightScroll.setPadding((int) (14 * density), (int) (8 * density), tbPad, (int) (24 * density));
                rightScroll.setClipToPadding(false);

                rightPane = new LinearLayout(activity);
                rightPane.setOrientation(LinearLayout.VERTICAL);
                rightPane.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                rightScroll.addView(rightPane);

                dualPaneContainer.addView(leftScroll);
                dualPaneContainer.addView(centerDivider);
                dualPaneContainer.addView(rightScroll);
                root.addView(dualPaneContainer);
            } else {
                ScrollView mainScrollView = new ScrollView(activity);
                mainScrollView.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
                mainScrollView.setPadding(tbPad, (int) (8 * density), tbPad, (int) (76 * density));
                mainScrollView.setClipToPadding(false);

                LinearLayout workflowLayout = new LinearLayout(activity);
                workflowLayout.setOrientation(LinearLayout.VERTICAL);
                workflowLayout.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                mainScrollView.addView(workflowLayout);
                root.addView(mainScrollView);

                leftPane = workflowLayout;
                rightPane = workflowLayout;
            }

        // ─────────────────────────────────────────────────────────────────────
        // STEP 1: CHOOSE SOURCE (Collapsible)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout sourceHeaderRow = new LinearLayout(activity);
        sourceHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        sourceHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
        sourceHeaderRow.setPadding(0, (int) (12 * density), 0, (int) (8 * density));
        sourceHeaderRow.setClickable(true);
        sourceHeaderRow.setFocusable(true);

        TextView badge1 = new TextView(activity);
        badge1.setText("1");
        badge1.setTextSize(11f);
        badge1.setTypeface(null, Typeface.BOLD);
        badge1.setTextColor(theme.onPrimary);
        badge1.setGravity(Gravity.CENTER);
        int b1Size = (int) (20 * density);
        LinearLayout.LayoutParams b1Lp = new LinearLayout.LayoutParams(b1Size, b1Size);
        b1Lp.rightMargin = (int) (8 * density);
        badge1.setLayoutParams(b1Lp);
        badge1.setBackground(createRoundedDrawable(theme.primary, 10 * density));
        sourceHeaderRow.addView(badge1);

        TextView tvSourceTitle = new TextView(activity);
        tvSourceTitle.setText("Choose Source");
        tvSourceTitle.setTextSize(14f);
        tvSourceTitle.setTypeface(null, Typeface.BOLD);
        tvSourceTitle.setTextColor(theme.textPrimary);
        sourceHeaderRow.addView(tvSourceTitle);

        TextView tvSourceActiveBadge = new TextView(activity);
        tvSourceActiveBadge.setText(currentCriteria.source.displayName);
        tvSourceActiveBadge.setTextSize(10.5f);
        tvSourceActiveBadge.setTypeface(null, Typeface.BOLD);
        tvSourceActiveBadge.setTextColor(theme.onPrimaryContainer);
        tvSourceActiveBadge.setBackground(createRoundedDrawable(theme.primaryContainer, 10 * density));
        int sabPadH = (int) (7 * density);
        int sabPadV = (int) (2 * density);
        tvSourceActiveBadge.setPadding(sabPadH, sabPadV, sabPadH, sabPadV);
        LinearLayout.LayoutParams sabLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sabLp.leftMargin = (int) (8 * density);
        tvSourceActiveBadge.setLayoutParams(sabLp);
        sourceHeaderRow.addView(tvSourceActiveBadge);

        View sourceHeaderSpacer = new View(activity);
        sourceHeaderRow.addView(sourceHeaderSpacer, new LinearLayout.LayoutParams(0, 0, 1f));

        ImageView ivSourceChevron = new ImageView(activity);
        ivSourceChevron.setTag("no_avatar");
        ivSourceChevron.setContentDescription("collapse");
        ivSourceChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
        ivSourceChevron.setLayoutParams(new LinearLayout.LayoutParams((int) (20 * density), (int) (20 * density)));
        sourceHeaderRow.addView(ivSourceChevron);

        leftPane.addView(sourceHeaderRow);

        View sourceSelectorContainer;
        StorageScanner.SourceType[] sources = StorageScanner.SourceType.values();
        List<TextView> sourceViews = new ArrayList<>();

        if (isLarge && isLandscape) {
            LinearLayout sourceGrid = new LinearLayout(activity);
            sourceGrid.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams sgLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            sgLp.bottomMargin = (int) (6 * density);
            sourceGrid.setLayoutParams(sgLp);

            int cols = 4;
            LinearLayout currentRow = null;
            for (int i = 0; i < sources.length; i++) {
                final StorageScanner.SourceType src = sources[i];
                if (i % cols == 0) {
                    currentRow = new LinearLayout(activity);
                    currentRow.setOrientation(LinearLayout.HORIZONTAL);
                    LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    if (i > 0) rowLp.topMargin = (int) (4 * density);
                    currentRow.setLayoutParams(rowLp);
                    sourceGrid.addView(currentRow);
                }

                TextView pill = new TextView(activity);
                pill.setText(src.displayName);
                pill.setTextSize(11f);
                pill.setTypeface(null, Typeface.BOLD);
                pill.setClickable(true);
                pill.setFocusable(true);
                pill.setGravity(Gravity.CENTER);
                pill.setMinHeight((int) (30 * density));
                int pH = (int) (4 * density);
                int pV = (int) (5.5f * density);
                pill.setPadding(pH, pV, pH, pV);
                LinearLayout.LayoutParams pLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                if (i % cols != cols - 1) pLp.rightMargin = (int) (5 * density);
                pill.setLayoutParams(pLp);

                boolean isSelected = (src == currentCriteria.source);
                pill.setTextColor(isSelected ? theme.onPrimaryContainer : theme.textSecondary);
                pill.setBackground(createRoundedDrawable(isSelected ? theme.primaryContainer : theme.surfaceContainer, 12 * density));

                sourceViews.add(pill);
                if (currentRow != null) currentRow.addView(pill);
            }
            if (currentRow != null) {
                int remainder = sources.length % cols;
                if (remainder != 0) {
                    int missing = cols - remainder;
                    for (int m = 0; m < missing; m++) {
                        View spacer = new View(activity);
                        LinearLayout.LayoutParams spLp = new LinearLayout.LayoutParams(0, 0, 1f);
                        if (m < missing - 1) spLp.rightMargin = (int) (5 * density);
                        spacer.setLayoutParams(spLp);
                        currentRow.addView(spacer);
                    }
                }
            }
            sourceSelectorContainer = sourceGrid;
        } else {
            HorizontalScrollView hSourceScroll = new HorizontalScrollView(activity);
            hSourceScroll.setHorizontalScrollBarEnabled(false);
            LinearLayout.LayoutParams hssLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            hssLp.bottomMargin = (int) (6 * density);
            hSourceScroll.setLayoutParams(hssLp);

            LinearLayout sourcePillsInner = new LinearLayout(activity);
            sourcePillsInner.setOrientation(LinearLayout.HORIZONTAL);

            for (StorageScanner.SourceType src : sources) {
                TextView pill = new TextView(activity);
                pill.setText(src.displayName);
                pill.setTextSize(12f);
                pill.setTypeface(null, Typeface.BOLD);
                pill.setClickable(true);
                pill.setFocusable(true);
                int pH = (int) (12 * density);
                int pV = (int) (6.5f * density);
                pill.setPadding(pH, pV, pH, pV);
                LinearLayout.LayoutParams pLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                pLp.rightMargin = (int) (6 * density);
                pill.setLayoutParams(pLp);

                boolean isSelected = (src == currentCriteria.source);
                pill.setTextColor(isSelected ? theme.onPrimaryContainer : theme.textSecondary);
                pill.setBackground(createRoundedDrawable(isSelected ? theme.primaryContainer : theme.surfaceContainer, 12 * density));

                sourceViews.add(pill);
                sourcePillsInner.addView(pill);
            }
            hSourceScroll.addView(sourcePillsInner);
            sourceSelectorContainer = hSourceScroll;
        }

        sourceHeaderRow.setOnClickListener(v -> {
            boolean isExpanded = (sourceSelectorContainer.getVisibility() == View.VISIBLE);
            if (isExpanded) {
                sourceSelectorContainer.setVisibility(View.GONE);
                ivSourceChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_DOWN, theme.textSecondary));
            } else {
                sourceSelectorContainer.setVisibility(View.VISIBLE);
                ivSourceChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
            }
        });

        leftPane.addView(sourceSelectorContainer);

        // Step 2, 3, 4 state & controllers (specific to phone/portrait layout)
        Map<String, View>[] filterCardsRef = new Map[1];
        final LinearLayout[] filtersAccordionContainerRef = new LinearLayout[1];
        TextView[] tvFiltersTitleRef = new TextView[1];

        Runnable onFilterChanged = () -> {
            updateActionStates(currentCriteria.source, currentCriteria, actionButtonsMap);
            if (updateChipsAndBadgeRef[0] != null) updateChipsAndBadgeRef[0].run();
            if (runScanRef[0] != null) runScanRef[0].run();
        };

        // Wire Source pill click listener
        for (int i = 0; i < sources.length; i++) {
            final StorageScanner.SourceType src = sources[i];
            TextView pill = sourceViews.get(i);
            pill.setOnClickListener(v -> {
                Runnable applySourceChange = () -> {
                    currentCriteria.source = src;
                    tvSourceActiveBadge.setText(src.displayName);
                    for (int j = 0; j < sources.length; j++) {
                        boolean sel = (sources[j] == currentCriteria.source);
                        sourceViews.get(j).setTextColor(sel ? theme.onPrimaryContainer : theme.textSecondary);
                        sourceViews.get(j).setBackground(createRoundedDrawable(sel ? theme.primaryContainer : theme.surfaceContainer, 12 * density));
                    }
                    int count = updateFilterVisibility(activity, src, filterCardsRef[0], filtersAccordionContainerRef[0], density);
                    if (tvFiltersTitleRef[0] != null) {
                        tvFiltersTitleRef[0].setText("Configure Filters (" + count + ")");
                    }
                    updateActionStates(src, currentCriteria, actionButtonsMap);
                    onFilterChanged.run();
                };

                if (src == StorageScanner.SourceType.LOCKED && !sLockedFolderAuthenticated) {
                    authenticateLockedFolderAccess(activity, () -> {
                        sLockedFolderAuthenticated = true;
                        applySourceChange.run();
                    }, () -> {
                        Toast.makeText(activity, "Biometric authentication required to view Locked Folder", Toast.LENGTH_SHORT).show();
                    });
                    return;
                }
                applySourceChange.run();
            });
        }

        // ─────────────────────────────────────────────────────────────────────
        // STEP 2: CONFIGURE FILTERS (Collapsible Section + Active Filter Chips)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout filterHeaderRow = new LinearLayout(activity);
        filterHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        filterHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
        filterHeaderRow.setPadding(0, (int) (12 * density), 0, (int) (8 * density));
        filterHeaderRow.setClickable(true);
        filterHeaderRow.setFocusable(true);

        TextView badge2 = new TextView(activity);
        badge2.setText("2");
        badge2.setTextSize(11f);
        badge2.setTypeface(null, Typeface.BOLD);
        badge2.setTextColor(theme.onPrimary);
        badge2.setGravity(Gravity.CENTER);
        int b2Size = (int) (20 * density);
        LinearLayout.LayoutParams b2Lp = new LinearLayout.LayoutParams(b2Size, b2Size);
        b2Lp.rightMargin = (int) (8 * density);
        badge2.setLayoutParams(b2Lp);
        badge2.setBackground(createRoundedDrawable(theme.primary, 10 * density));
        filterHeaderRow.addView(badge2);

        TextView tvFiltersTitle = new TextView(activity);
        tvFiltersTitleRef[0] = tvFiltersTitle;
        tvFiltersTitle.setText("Configure Filters");
        tvFiltersTitle.setTextSize(14f);
        tvFiltersTitle.setTypeface(null, Typeface.BOLD);
        tvFiltersTitle.setTextColor(theme.textPrimary);
        filterHeaderRow.addView(tvFiltersTitle);

        TextView tvFiltersActiveBadge = new TextView(activity);
        tvFiltersActiveBadge.setTextSize(10.5f);
        tvFiltersActiveBadge.setTypeface(null, Typeface.BOLD);
        tvFiltersActiveBadge.setTextColor(theme.textSecondary);
        tvFiltersActiveBadge.setBackground(createRoundedDrawable(theme.surfaceContainer, 10 * density));
        tvFiltersActiveBadge.setText("All Media (No filters)");
        tvFiltersActiveBadge.setSingleLine(true);
        tvFiltersActiveBadge.setEllipsize(TextUtils.TruncateAt.END);
        int fabPadH = (int) (7 * density);
        int fabPadV = (int) (2 * density);
        tvFiltersActiveBadge.setPadding(fabPadH, fabPadV, fabPadH, fabPadV);
        LinearLayout.LayoutParams fabLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        fabLp.leftMargin = (int) (8 * density);
        fabLp.rightMargin = (int) (6 * density);
        tvFiltersActiveBadge.setLayoutParams(fabLp);
        filterHeaderRow.addView(tvFiltersActiveBadge);

        ImageView ivFiltersChevron = new ImageView(activity);
        ivFiltersChevron.setTag("no_avatar");
        ivFiltersChevron.setContentDescription("collapse");
        ivFiltersChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
        LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams((int) (20 * density), (int) (20 * density));
        ivFiltersChevron.setLayoutParams(ivLp);
        filterHeaderRow.addView(ivFiltersChevron);

        leftPane.addView(filterHeaderRow);

        // Active Filter Chips Row
        HorizontalScrollView hChipsScroll = new HorizontalScrollView(activity);
        hChipsScroll.setHorizontalScrollBarEnabled(false);
        hChipsScroll.setVisibility(View.GONE);
        LinearLayout.LayoutParams hcsLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hcsLp.bottomMargin = (int) (6 * density);
        hChipsScroll.setLayoutParams(hcsLp);

        LinearLayout chipsContainer = new LinearLayout(activity);
        chipsContainer.setOrientation(LinearLayout.HORIZONTAL);
        chipsContainer.setGravity(Gravity.CENTER_VERTICAL);
        hChipsScroll.addView(chipsContainer);
        leftPane.addView(hChipsScroll);

        LinearLayout filtersAccordionContainer = new LinearLayout(activity);
        filtersAccordionContainer.setOrientation(LinearLayout.VERTICAL);
        filtersAccordionContainerRef[0] = filtersAccordionContainer;
        leftPane.addView(filtersAccordionContainer);

        LinearLayout filterActionRow = new LinearLayout(activity);
        filterActionRow.setOrientation(LinearLayout.HORIZONTAL);
        filterActionRow.setPadding(0, (int) (10 * density), 0, (int) (14 * density));

        filterCardsRef[0] = build21FiltersAccordion(activity, filtersAccordionContainer, density, theme, onFilterChanged);
        int initialFilterCount = updateFilterVisibility(activity, currentCriteria.source, filterCardsRef[0], filtersAccordionContainer, density);
        tvFiltersTitle.setText("Configure Filters (" + initialFilterCount + ")");

        // Scan / Filter Trigger Buttons

        TextView btnResetFilters = new TextView(activity);
        btnResetFilters.setText("Reset Filters");
        btnResetFilters.setTextSize(13f);
        btnResetFilters.setTypeface(null, Typeface.BOLD);
        btnResetFilters.setTextColor(theme.primary);
        btnResetFilters.setGravity(Gravity.CENTER);
        btnResetFilters.setPadding((int) (14 * density), (int) (9 * density), (int) (14 * density), (int) (9 * density));
        btnResetFilters.setBackground(createActionPillDrawable(theme.surfaceContainer, 16 * density));
        LinearLayout.LayoutParams rfLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        rfLp.rightMargin = (int) (8 * density);
        btnResetFilters.setLayoutParams(rfLp);
        filterActionRow.addView(btnResetFilters);

        LinearLayout btnApplyScan = new LinearLayout(activity);
        btnApplyScan.setOrientation(LinearLayout.HORIZONTAL);
        btnApplyScan.setGravity(Gravity.CENTER);
        btnApplyScan.setClickable(true);
        btnApplyScan.setFocusable(true);
        btnApplyScan.setBackground(createActionPillDrawable(theme.primary, 16 * density));
        btnApplyScan.setPadding((int) (16 * density), (int) (9 * density), (int) (16 * density), (int) (9 * density));
        btnApplyScan.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.4f));

        tvScanButtonLabel.setText("Apply & Scan");
        tvScanButtonLabel.setTextSize(13.5f);
        tvScanButtonLabel.setTypeface(null, Typeface.BOLD);
        tvScanButtonLabel.setTextColor(theme.onPrimary);
        btnApplyScan.addView(tvScanButtonLabel);
        filterActionRow.addView(btnApplyScan);
        leftPane.addView(filterActionRow);

        updateChipsAndBadgeRef[0] = () -> {
            List<Pair<String, Runnable>> activeList = getActiveFilterList(currentCriteria);
            int activeCount = activeList.size();
            if (activeCount > 0) {
                StringBuilder summary = new StringBuilder();
                for (int i = 0; i < Math.min(activeList.size(), 2); i++) {
                    if (i > 0) summary.append(", ");
                    summary.append(activeList.get(i).first);
                }
                if (activeList.size() > 2) summary.append("...");
                tvFiltersActiveBadge.setText(activeCount + " Active: " + summary.toString());
                tvFiltersActiveBadge.setTextColor(theme.onPrimaryContainer);
                tvFiltersActiveBadge.setBackground(createRoundedDrawable(theme.primaryContainer, 10 * density));
                tvFiltersActiveBadge.setVisibility(View.VISIBLE);
                hChipsScroll.setVisibility(View.VISIBLE);
            } else {
                tvFiltersActiveBadge.setText("All Media (No filters)");
                tvFiltersActiveBadge.setTextColor(theme.textSecondary);
                tvFiltersActiveBadge.setBackground(createRoundedDrawable(theme.surfaceContainer, 10 * density));
                tvFiltersActiveBadge.setVisibility(View.VISIBLE);
                hChipsScroll.setVisibility(View.GONE);
            }

            chipsContainer.removeAllViews();
            for (Pair<String, Runnable> item : activeList) {
                LinearLayout chip = new LinearLayout(activity);
                chip.setOrientation(LinearLayout.HORIZONTAL);
                chip.setGravity(Gravity.CENTER_VERTICAL);
                chip.setBackground(createRoundedDrawable(theme.primaryContainer, 12 * density));
                int cPadH = (int) (10 * density);
                int cPadV = (int) (4 * density);
                chip.setPadding(cPadH, cPadV, (int) (8 * density), cPadV);
                LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                cLp.rightMargin = (int) (6 * density);
                chip.setLayoutParams(cLp);

                TextView tvChip = new TextView(activity);
                tvChip.setText(item.first);
                tvChip.setTextSize(11f);
                tvChip.setTypeface(null, Typeface.BOLD);
                tvChip.setTextColor(theme.onPrimaryContainer);
                chip.addView(tvChip);

                TextView tvClose = new TextView(activity);
                tvClose.setText(" ✕");
                tvClose.setTextSize(12f);
                tvClose.setTypeface(null, Typeface.BOLD);
                tvClose.setTextColor(theme.onPrimaryContainer);
                tvClose.setPadding((int) (4 * density), 0, 0, 0);
                chip.addView(tvClose);

                chip.setClickable(true);
                chip.setFocusable(true);
                chip.setOnClickListener(v -> {
                    item.second.run();
                    filterCardsRef[0] = build21FiltersAccordion(activity, filtersAccordionContainer, density, theme, onFilterChanged);
                    int cCount = updateFilterVisibility(activity, currentCriteria.source, filterCardsRef[0], filtersAccordionContainer, density);
                    if (tvFiltersTitleRef[0] != null) tvFiltersTitleRef[0].setText("Configure Filters (" + cCount + ")");
                    onFilterChanged.run();
                });
                chipsContainer.addView(chip);
            }
        };

        // Header click toggles filter accordion expansion
        filterHeaderRow.setOnClickListener(v -> {
            boolean isExpanded = (filtersAccordionContainer.getVisibility() == View.VISIBLE);
            if (isExpanded) {
                filtersAccordionContainer.setVisibility(View.GONE);
                filterActionRow.setVisibility(View.GONE);
                ivFiltersChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_DOWN, theme.textSecondary));
            } else {
                filtersAccordionContainer.setVisibility(View.VISIBLE);
                filterActionRow.setVisibility(View.VISIBLE);
                ivFiltersChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
            }
        });

        btnResetFilters.setOnClickListener(v -> {
            StorageScanner.SourceType savedSource = currentCriteria.source;
            currentCriteria = new StorageScanner.FilterCriteria();
            currentCriteria.source = savedSource;
            filterCardsRef[0] = build21FiltersAccordion(activity, filtersAccordionContainer, density, theme, onFilterChanged);
            int rCount = updateFilterVisibility(activity, currentCriteria.source, filterCardsRef[0], filtersAccordionContainer, density);
            if (tvFiltersTitleRef[0] != null) tvFiltersTitleRef[0].setText("Configure Filters (" + rCount + ")");
            onFilterChanged.run();
            Toast.makeText(activity, "Reset all filters to default", Toast.LENGTH_SHORT).show();
        });

        btnApplyScan.setOnClickListener(v -> {
            // Auto-collapse filters on apply so preview is immediately prominent
            filtersAccordionContainer.setVisibility(View.GONE);
            filterActionRow.setVisibility(View.GONE);
            ivFiltersChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_DOWN, theme.textSecondary));
            onFilterChanged.run();
        });

        // ─────────────────────────────────────────────────────────────────────
        // STEP 3: CHOOSE ACTION (13 Actions, Collapsible)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout actionHeaderRow = new LinearLayout(activity);
        actionHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        actionHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
        actionHeaderRow.setPadding(0, (int) (12 * density), 0, (int) (8 * density));
        actionHeaderRow.setClickable(true);
        actionHeaderRow.setFocusable(true);

        TextView badge3 = new TextView(activity);
        badge3.setText("3");
        badge3.setTextSize(11f);
        badge3.setTypeface(null, Typeface.BOLD);
        badge3.setTextColor(theme.onPrimary);
        badge3.setGravity(Gravity.CENTER);
        int b3Size = (int) (20 * density);
        LinearLayout.LayoutParams b3Lp = new LinearLayout.LayoutParams(b3Size, b3Size);
        b3Lp.rightMargin = (int) (8 * density);
        badge3.setLayoutParams(b3Lp);
        badge3.setBackground(createRoundedDrawable(theme.primary, 10 * density));
        actionHeaderRow.addView(badge3);

        TextView tvActionsTitle = new TextView(activity);
        tvActionsTitle.setText("Choose Action (13)");
        tvActionsTitle.setTextSize(14f);
        tvActionsTitle.setTypeface(null, Typeface.BOLD);
        tvActionsTitle.setTextColor(theme.textPrimary);
        actionHeaderRow.addView(tvActionsTitle);

        TextView tvActionsActiveBadge = new TextView(activity);
        tvActionsActiveBadge.setText("0 selected");
        tvActionsActiveBadge.setTextSize(10.5f);
        tvActionsActiveBadge.setTypeface(null, Typeface.BOLD);
        tvActionsActiveBadge.setTextColor(theme.onPrimaryContainer);
        tvActionsActiveBadge.setBackground(createRoundedDrawable(theme.primaryContainer, 10 * density));
        int aabPadH = (int) (7 * density);
        int aabPadV = (int) (2 * density);
        tvActionsActiveBadge.setPadding(aabPadH, aabPadV, aabPadH, aabPadV);
        LinearLayout.LayoutParams aabLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        aabLp.leftMargin = (int) (8 * density);
        tvActionsActiveBadge.setLayoutParams(aabLp);
        actionHeaderRow.addView(tvActionsActiveBadge);

        View actionHeaderSpacer = new View(activity);
        actionHeaderRow.addView(actionHeaderSpacer, new LinearLayout.LayoutParams(0, 0, 1f));

        ImageView ivActionsChevron = new ImageView(activity);
        ivActionsChevron.setTag("no_avatar");
        ivActionsChevron.setContentDescription("collapse");
        ivActionsChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
        ivActionsChevron.setLayoutParams(new LinearLayout.LayoutParams((int) (20 * density), (int) (20 * density)));
        actionHeaderRow.addView(ivActionsChevron);

        rightPane.addView(actionHeaderRow);

        ItemsProvider selectedItemsProvider = () -> {
            List<StorageScanner.MediaItem> list = new ArrayList<>();
            for (StorageScanner.MediaItem it : allQueriedItems) {
                if (selectedMediaKeys.contains(getItemKey(it))) {
                    list.add(it);
                }
            }
            return list;
        };

        LinearLayout actionGrid = buildActionButtonsGrid(activity, density, theme, selectedItemsProvider, runScanRef, actionButtonsMap);
        updateActionStates(currentCriteria.source, currentCriteria, actionButtonsMap);
        rightPane.addView(actionGrid);

        actionHeaderRow.setOnClickListener(v -> {
            boolean isExpanded = (actionGrid.getVisibility() == View.VISIBLE);
            if (isExpanded) {
                actionGrid.setVisibility(View.GONE);
                ivActionsChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_DOWN, theme.textSecondary));
            } else {
                actionGrid.setVisibility(View.VISIBLE);
                ivActionsChevron.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
            }
        });

        // Visual Material Progress Bar
        sProgressBar = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        sProgressBar.setIndeterminate(true);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            sProgressBar.setIndeterminateTintList(ColorStateList.valueOf(theme.primary));
        }
        sProgressBar.setVisibility(View.GONE);
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (4 * density));
        pbLp.topMargin = (int) (8 * density);
        pbLp.bottomMargin = (int) (4 * density);
        sProgressBar.setLayoutParams(pbLp);
        rightPane.addView(sProgressBar);

        sTvProgressInfo = new TextView(activity);
        sTvProgressInfo.setTextSize(11.5f);
        sTvProgressInfo.setTextColor(theme.primary);
        sTvProgressInfo.setGravity(Gravity.CENTER);
        sTvProgressInfo.setVisibility(View.GONE);
        LinearLayout.LayoutParams piLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        piLp.topMargin = (int) (2 * density);
        piLp.bottomMargin = (int) (6 * density);
        sTvProgressInfo.setLayoutParams(piLp);
        rightPane.addView(sTvProgressInfo);

        // ─────────────────────────────────────────────────────────────────────
        // STEP 4: MATCHED MEDIA RESULTS
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout resultsHeader = new LinearLayout(activity);
        resultsHeader.setOrientation(LinearLayout.VERTICAL);
        resultsHeader.setPadding(0, (int) (8 * density), 0, (int) (6 * density));

        LinearLayout resTitleRow = createSectionHeader(activity, 4, "Matched Media Results", density, theme);
        resultsHeader.addView(resTitleRow);

        HorizontalScrollView hControlsScroll = new HorizontalScrollView(activity);
        hControlsScroll.setHorizontalScrollBarEnabled(false);
        LinearLayout.LayoutParams hctrlLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hctrlLp.topMargin = (int) (1 * density);
        hctrlLp.bottomMargin = (int) (5 * density);
        hControlsScroll.setLayoutParams(hctrlLp);

        LinearLayout controlsRow = new LinearLayout(activity);
        controlsRow.setOrientation(LinearLayout.HORIZONTAL);
        controlsRow.setGravity(Gravity.CENTER_VERTICAL);
        controlsRow.setPadding((int) (28 * density), 0, 0, 0);

        TextView btnSelectAll = new TextView(activity);
        btnSelectAll.setText("All");
        btnSelectAll.setTextSize(11f);
        btnSelectAll.setTypeface(null, Typeface.BOLD);
        btnSelectAll.setTextColor(theme.primary);
        btnSelectAll.setBackground(createActionPillDrawable(theme.surfaceContainer, 10 * density));
        btnSelectAll.setPadding((int) (8 * density), (int) (3 * density), (int) (8 * density), (int) (3 * density));
        LinearLayout.LayoutParams allLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        allLp.rightMargin = (int) (5 * density);
        btnSelectAll.setLayoutParams(allLp);
        btnSelectAll.setClickable(true);
        btnSelectAll.setFocusable(true);
        controlsRow.addView(btnSelectAll);

        TextView btnClearSelect = new TextView(activity);
        btnClearSelect.setText("None");
        btnClearSelect.setTextSize(11f);
        btnClearSelect.setTypeface(null, Typeface.BOLD);
        btnClearSelect.setTextColor(theme.textSecondary);
        btnClearSelect.setBackground(createActionPillDrawable(theme.surfaceContainer, 10 * density));
        btnClearSelect.setPadding((int) (8 * density), (int) (3 * density), (int) (8 * density), (int) (3 * density));
        LinearLayout.LayoutParams noneLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        noneLp.rightMargin = (int) (6 * density);
        btnClearSelect.setLayoutParams(noneLp);
        btnClearSelect.setClickable(true);
        btnClearSelect.setFocusable(true);
        controlsRow.addView(btnClearSelect);

        TextView btnSort = new TextView(activity);
        btnSort.setText("↕ " + currentSortOrder.shortLabel);
        btnSort.setTextSize(11f);
        btnSort.setTypeface(null, Typeface.BOLD);
        btnSort.setTextColor(theme.textPrimary);
        btnSort.setBackground(createActionPillDrawable(theme.surfaceContainer, 10 * density));
        btnSort.setPadding((int) (8 * density), (int) (3 * density), (int) (8 * density), (int) (3 * density));
        LinearLayout.LayoutParams sortLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sortLp.rightMargin = (int) (6 * density);
        btnSort.setLayoutParams(sortLp);
        btnSort.setClickable(true);
        btnSort.setFocusable(true);
        controlsRow.addView(btnSort);

        TextView btnToggleView = new TextView(activity);
        btnToggleView.setText(isGridViewRef[0] ? "⊞ Grid" : "☰ List");
        btnToggleView.setTextSize(11f);
        btnToggleView.setTypeface(null, Typeface.BOLD);
        btnToggleView.setTextColor(theme.onPrimaryContainer);
        btnToggleView.setBackground(createActionPillDrawable(theme.primaryContainer, 10 * density));
        btnToggleView.setPadding((int) (9 * density), (int) (3 * density), (int) (9 * density), (int) (3 * density));
        btnToggleView.setClickable(true);
        btnToggleView.setFocusable(true);
        controlsRow.addView(btnToggleView);

        hControlsScroll.addView(controlsRow);
        resultsHeader.addView(hControlsScroll);

        tvResultsStatus.setText("Scanning items...");
        tvResultsStatus.setTextSize(11.5f);
        tvResultsStatus.setTextColor(theme.textSecondary);
        tvResultsStatus.setPadding((int) (28 * density), 0, 0, 0);
        resultsHeader.addView(tvResultsStatus);
        rightPane.addView(resultsHeader);

        rightPane.addView(resultsListContainer);



        updateSelectionSummaryRef[0] = () -> {
            int selCount = selectedMediaKeys.size();
            tvActionsActiveBadge.setText(selCount + " selected");
        };

        btnSort.setOnClickListener(v -> {
            showSortPickerDialog(activity, () -> {
                btnSort.setText("↕ " + currentSortOrder.shortLabel);
                sortMediaItems(allQueriedItems, currentSortOrder);
                currentPageRef[0] = 0;
                renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
            }, density, theme);
        });

        btnSelectAll.setOnClickListener(v -> {
            for (StorageScanner.MediaItem it : allQueriedItems) {
                selectedMediaKeys.add(getItemKey(it));
            }
            updateSelectionSummaryRef[0].run();
            renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
        });

        btnClearSelect.setOnClickListener(v -> {
            selectedMediaKeys.clear();
            updateSelectionSummaryRef[0].run();
            renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
        });

        btnToggleView.setOnClickListener(v -> {
            isGridViewRef[0] = !isGridViewRef[0];
            btnToggleView.setText(isGridViewRef[0] ? "⊞ Grid" : "☰ List");
            renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
        });

        onRefreshRef[0] = () -> {
            currentCriteria = new StorageScanner.FilterCriteria();
            currentSortOrder = SortOrder.DATE_DESC;
            selectedMediaKeys.clear();
            if (updateSelectionSummaryRef[0] != null) updateSelectionSummaryRef[0].run();

            tvSourceActiveBadge.setText(currentCriteria.source.displayName);
            for (int j = 0; j < sources.length; j++) {
                boolean sel = (sources[j] == currentCriteria.source);
                sourceViews.get(j).setTextColor(sel ? theme.onPrimaryContainer : theme.textSecondary);
                sourceViews.get(j).setBackground(createRoundedDrawable(sel ? theme.primaryContainer : theme.surfaceContainer, 12 * density));
            }
            filterCardsRef[0] = build21FiltersAccordion(activity, filtersAccordionContainer, density, theme, onFilterChanged);
            int rCount = updateFilterVisibility(activity, currentCriteria.source, filterCardsRef[0], filtersAccordionContainer, density);
            if (tvFiltersTitleRef[0] != null) tvFiltersTitleRef[0].setText("Configure Filters (" + rCount + ")");
            updateActionStates(currentCriteria.source, currentCriteria, actionButtonsMap);
            if (updateChipsAndBadgeRef[0] != null) updateChipsAndBadgeRef[0].run();

            THREAD_POOL.execute(() -> {
                if (currentAccount != null) {
                    availableAlbums = StorageScanner.getAvailableAlbums(currentAccount);
                    if (sRepopulateAlbumCardsRunnable != null) {
                        sRepopulateAlbumCardsRunnable.run();
                    }
                }
            });

            if (runScanRef[0] != null) runScanRef[0].run();
        };
    }

    btnRefresh.setOnClickListener(v -> {
        if (onRefreshRef[0] != null) onRefreshRef[0].run();
        Toast.makeText(activity, "Toolkit refreshed", Toast.LENGTH_SHORT).show();
    });

        btnClose.setOnClickListener(v -> dialog.dismiss());

        // Window size - popup-friendly (94% width, 88% height)
        dialog.setContentView(root);
        dialog.setOnDismissListener(d -> {
            if (PhenotypeFlagManager.getCurrentOpenDialog() == dialog) {
                PhenotypeFlagManager.setCurrentOpenDialog(null);
            }
            sProgressBar = null;
            sTvProgressInfo = null;
            allQueriedItems.clear();
            availableAlbums.clear();
            sRepopulateAlbumCardsRunnable = null;
            currentCriteria = new StorageScanner.FilterCriteria();
            clearCache();
            sLockedFolderAuthenticated = false;
        });
        dialog.show();
        PhenotypeFlagManager.setCurrentOpenDialog(dialog);
        PhenotypeFlagManager.updateDockTabState(activity, PhenotypeFlagManager.DOCK_TAB_TOOLKIT);

        // Responsive popup window sizing with clean rounded geometry (adaptive up to 920dp on tablet)
        PhenotypeFlagManager.applyAdaptiveDialogBounds(dialog, activity);

        // Run initial scan
        runScanRef[0].run();
    }

    private interface OnIndexSelectedListener {
        void onSelected(int index);
    }

    private static LinearLayout createStepBadgeWithLabel(Activity activity, String stepNum, String label, float density, Theme theme) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        TextView badge = new TextView(activity);
        badge.setText(stepNum);
        badge.setTextSize(11f);
        badge.setTypeface(null, Typeface.BOLD);
        badge.setTextColor(theme.onPrimary);
        badge.setGravity(Gravity.CENTER);
        int bSize = (int) (20 * density);
        LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(bSize, bSize);
        bLp.rightMargin = (int) (6 * density);
        badge.setLayoutParams(bLp);
        badge.setBackground(createRoundedDrawable(theme.primary, 10 * density));
        row.addView(badge);

        TextView tv = new TextView(activity);
        tv.setText(label);
        tv.setTextSize(11f);
        tv.setTypeface(null, Typeface.BOLD);
        tv.setTextColor(theme.textPrimary);
        row.addView(tv);

        return row;
    }

    private static TextView createCanvasToolbarButton(Activity activity, String text, int textColor, float density, Theme theme) {
        TextView btn = new TextView(activity);
        btn.setText(text);
        btn.setTextSize(11f);
        btn.setTypeface(null, Typeface.BOLD);
        btn.setTextColor(textColor);
        btn.setBackground(createActionPillDrawable(theme.surfaceContainer, 8 * density));
        btn.setPadding((int) (8 * density), (int) (3 * density), (int) (8 * density), (int) (3 * density));
        btn.setClickable(true);
        btn.setFocusable(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = (int) (5 * density);
        btn.setLayoutParams(lp);
        return btn;
    }

    private static LinearLayout createSegmentedGroup(Activity activity, String[] options, int selectedIdx, float density, Theme theme, OnIndexSelectedListener listener) {
        LinearLayout group = new LinearLayout(activity);
        group.setOrientation(LinearLayout.HORIZONTAL);
        group.setBackground(createRoundedDrawable(theme.surface, 8 * density));
        group.setPadding((int) (2 * density), (int) (2 * density), (int) (2 * density), (int) (2 * density));

        List<TextView> pills = new ArrayList<>();
        final int[] currentIdx = new int[]{selectedIdx};

        Runnable updatePills = () -> {
            for (int i = 0; i < options.length; i++) {
                boolean sel = (i == currentIdx[0]);
                TextView p = pills.get(i);
                p.setTextColor(sel ? theme.onPrimary : theme.textSecondary);
                p.setBackground(createRoundedDrawable(sel ? theme.primary : Color.TRANSPARENT, 6 * density));
            }
        };

        for (int i = 0; i < options.length; i++) {
            final int idx = i;
            TextView p = new TextView(activity);
            p.setText(options[i]);
            p.setTextSize(10f);
            p.setTypeface(null, Typeface.BOLD);
            p.setSingleLine(true);
            p.setLines(1);
            p.setIncludeFontPadding(false);
            p.setGravity(Gravity.CENTER);
            p.setClickable(true);
            p.setFocusable(true);
            p.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
            LinearLayout.LayoutParams pLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            p.setLayoutParams(pLp);
            p.setOnClickListener(v -> {
                currentIdx[0] = idx;
                updatePills.run();
                if (listener != null) listener.onSelected(idx);
            });
            pills.add(p);
            group.addView(p);
        }
        updatePills.run();
        return group;
    }

    private static EditText createFilterStudioInput(Activity activity, String placeholder, String initialText, float density, Theme theme, SimpleConsumer onText, Runnable onFilterChanged) {
        EditText et = new EditText(activity);
        et.setHint(placeholder);
        et.setHintTextColor(theme.textTertiary);
        et.setTextColor(theme.textPrimary);
        et.setTextSize(11f);
        et.setSingleLine(true);
        et.setBackground(createRoundedDrawable(theme.searchInputBg, 6 * density));
        int padH = (int) (8 * density);
        int padV = (int) (4 * density);
        et.setPadding(padH, padV, padH, padV);
        if (initialText != null && !initialText.isEmpty()) et.setText(initialText);
        et.addTextChangedListener(new DebounceWatcher(onText, onFilterChanged));
        return et;
    }

    private static void showTabletAlbumSelectionDialog(Activity activity, Theme theme, float density, Runnable onFilterChanged) {
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackground(createRoundedDrawable(theme.surface, 16 * density));
        int p = (int) (18 * density);
        box.setPadding(p, p, p, (int) (14 * density));

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Select Target Albums");
        tvTitle.setTextSize(15f);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setTextColor(theme.textPrimary);
        box.addView(tvTitle);

        ScrollView scroll = new ScrollView(activity);
        scroll.setLayoutParams(new LinearLayout.LayoutParams((int) (380 * density), (int) (300 * density)));
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(content);

        populateAlbumCheckboxes(activity, theme, content, () -> {}, false, onFilterChanged);
        box.addView(scroll);

        TextView btnDone = new TextView(activity);
        btnDone.setText("Done");
        btnDone.setTextSize(12.5f);
        btnDone.setTypeface(null, Typeface.BOLD);
        btnDone.setTextColor(theme.onPrimary);
        btnDone.setGravity(Gravity.CENTER);
        btnDone.setBackground(createActionPillDrawable(theme.primary, 10 * density));
        btnDone.setPadding((int) (16 * density), (int) (8 * density), (int) (16 * density), (int) (8 * density));
        btnDone.setOnClickListener(v -> d.dismiss());
        LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        btnLp.topMargin = (int) (12 * density);
        btnDone.setLayoutParams(btnLp);
        box.addView(btnDone);

        d.setContentView(box);
        if (d.getWindow() != null) d.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        d.show();
    }

    private static void buildTabletStudioLayout(
            Activity activity, LinearLayout root, float density, Theme theme,
            TextView tvScanButtonLabel, TextView tvResultsStatus, LinearLayout resultsListContainer,
            Map<String, TextView> actionButtonsMap, Set<String> selectedMediaKeys,
            boolean[] isGridViewRef, int[] currentPageRef, Runnable[] runScanRef,
            Runnable[] updateSelectionSummaryRef, Runnable[] onRefreshRef) {

        int p16 = (int) (16 * density);
        int p6 = (int) (6 * density);

        Runnable onFilterChanged = () -> {
            updateActionStates(currentCriteria.source, currentCriteria, actionButtonsMap);
            if (runScanRef[0] != null) runScanRef[0].run();
        };

        // ─────────────────────────────────────────────────────────────────────
        // STEP 1: CHOOSE SOURCE (7 Symmetrical Pills with Icons)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout sourceRow = new LinearLayout(activity);
        sourceRow.setOrientation(LinearLayout.HORIZONTAL);
        sourceRow.setGravity(Gravity.CENTER_VERTICAL);
        sourceRow.setPadding(p16, p6, p16, p6);
        sourceRow.setBackgroundColor(theme.surfaceContainer);

        LinearLayout step1Header = createStepBadgeWithLabel(activity, "1", "SOURCE", density, theme);
        LinearLayout.LayoutParams s1HdrLp = new LinearLayout.LayoutParams((int) (96 * density), ViewGroup.LayoutParams.WRAP_CONTENT);
        step1Header.setLayoutParams(s1HdrLp);
        sourceRow.addView(step1Header);

        LinearLayout pillsContainer = new LinearLayout(activity);
        pillsContainer.setOrientation(LinearLayout.HORIZONTAL);
        pillsContainer.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final StorageScanner.SourceType[] sources = StorageScanner.SourceType.values();
        final int[] sourceIcons = new int[]{
                MaterialVectorDrawable.TYPE_PHOTO,
                MaterialVectorDrawable.TYPE_SEARCH,
                MaterialVectorDrawable.TYPE_FOLDER,
                MaterialVectorDrawable.TYPE_SHARE,
                MaterialVectorDrawable.TYPE_STAR,
                MaterialVectorDrawable.TYPE_DELETE,
                MaterialVectorDrawable.TYPE_LOCK
        };

        final List<TextView> sourceViews = new ArrayList<>();
        Runnable updateSourceStyles = () -> {
            for (int i = 0; i < sources.length; i++) {
                boolean isSelected = (sources[i] == currentCriteria.source);
                TextView pill = sourceViews.get(i);
                pill.setTextColor(isSelected ? theme.onPrimary : theme.textSecondary);
                pill.setBackground(createRoundedDrawable(isSelected ? theme.primary : theme.surface, 10 * density));
                MaterialVectorDrawable d = new MaterialVectorDrawable(sourceIcons[i], isSelected ? theme.onPrimary : theme.textSecondary);
                d.setBounds(0, 0, (int) (13 * density), (int) (13 * density));
                pill.setCompoundDrawables(d, null, null, null);
            }
        };

        for (int i = 0; i < sources.length; i++) {
            final StorageScanner.SourceType src = sources[i];
            TextView pill = new TextView(activity);
            pill.setText(src.displayName);
            pill.setTextSize(11f);
            pill.setTypeface(null, Typeface.BOLD);
            pill.setGravity(Gravity.CENTER);
            pill.setClickable(true);
            pill.setFocusable(true);
            pill.setSingleLine(true);
            pill.setEllipsize(TextUtils.TruncateAt.END);
            pill.setMinHeight((int) (32 * density));
            pill.setCompoundDrawablePadding((int) (4 * density));
            int padH = (int) (4 * density);
            int padV = (int) (4 * density);
            pill.setPadding(padH, padV, padH, padV);

            LinearLayout.LayoutParams pLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            if (i < sources.length - 1) pLp.rightMargin = (int) (5 * density);
            pill.setLayoutParams(pLp);

            sourceViews.add(pill);
            pillsContainer.addView(pill);

            pill.setOnClickListener(v -> {
                Runnable applySourceChange = () -> {
                    currentCriteria.source = src;
                    updateSourceStyles.run();
                    updateActionStates(src, currentCriteria, actionButtonsMap);
                    onFilterChanged.run();
                };

                if (src == StorageScanner.SourceType.LOCKED && !sLockedFolderAuthenticated) {
                    authenticateLockedFolderAccess(activity, () -> {
                        sLockedFolderAuthenticated = true;
                        applySourceChange.run();
                    }, () -> {
                        Toast.makeText(activity, "Biometric authentication required to view Locked Folder", Toast.LENGTH_SHORT).show();
                    });
                    return;
                }
                applySourceChange.run();
            });
        }
        updateSourceStyles.run();
        sourceRow.addView(pillsContainer);
        root.addView(sourceRow);

        View div1 = new View(activity);
        div1.setBackgroundColor(theme.outline);
        div1.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (1 * density)));
        root.addView(div1);

        // ─────────────────────────────────────────────────────────────────────
        // STEP 2: FILTERS STUDIO (4 Category Tabs & Compact Inspector Panel)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout filterStudioContainer = new LinearLayout(activity);
        filterStudioContainer.setOrientation(LinearLayout.VERTICAL);
        filterStudioContainer.setPadding(p16, (int) (6 * density), p16, (int) (6 * density));

        LinearLayout fsTopBar = new LinearLayout(activity);
        fsTopBar.setOrientation(LinearLayout.HORIZONTAL);
        fsTopBar.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams fsTbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        fsTbLp.bottomMargin = (int) (6 * density);
        fsTopBar.setLayoutParams(fsTbLp);

        LinearLayout step2Header = createStepBadgeWithLabel(activity, "2", "FILTERS STUDIO", density, theme);
        fsTopBar.addView(step2Header);

        TextView tvStudioBadge = new TextView(activity);
        tvStudioBadge.setText("18 Available • 0 Active");
        tvStudioBadge.setTextSize(10f);
        tvStudioBadge.setTypeface(null, Typeface.BOLD);
        tvStudioBadge.setTextColor(theme.onPrimaryContainer);
        tvStudioBadge.setBackground(createRoundedDrawable(theme.primaryContainer, 8 * density));
        int sPadH = (int) (8 * density);
        int sPadV = (int) (2.5f * density);
        tvStudioBadge.setPadding(sPadH, sPadV, sPadH, sPadV);
        LinearLayout.LayoutParams sbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sbLp.leftMargin = (int) (8 * density);
        tvStudioBadge.setLayoutParams(sbLp);
        fsTopBar.addView(tvStudioBadge);

        TextView btnResetFilters = new TextView(activity);
        btnResetFilters.setText("Reset");
        btnResetFilters.setTextSize(10.5f);
        btnResetFilters.setTypeface(null, Typeface.BOLD);
        btnResetFilters.setTextColor(theme.primary);
        btnResetFilters.setBackground(createActionPillDrawable(theme.surfaceContainer, 8 * density));
        btnResetFilters.setPadding((int) (8 * density), (int) (2.5f * density), (int) (8 * density), (int) (2.5f * density));
        btnResetFilters.setClickable(true);
        LinearLayout.LayoutParams rfbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rfbLp.leftMargin = (int) (6 * density);
        btnResetFilters.setLayoutParams(rfbLp);
        fsTopBar.addView(btnResetFilters);

        View fsSpacer = new View(activity);
        fsTopBar.addView(fsSpacer, new LinearLayout.LayoutParams(0, 0, 1f));

        LinearLayout categoryTabsGroup = new LinearLayout(activity);
        categoryTabsGroup.setOrientation(LinearLayout.HORIZONTAL);
        categoryTabsGroup.setBackground(createRoundedDrawable(theme.surfaceContainer, 10 * density));
        categoryTabsGroup.setPadding((int) (2 * density), (int) (2 * density), (int) (2 * density), (int) (2 * density));

        String[] categoryTitles = new String[]{
                "Time & Dimensions (4)",
                "Media & Storage (4)",
                "Status & Flags (6)",
                "Search & Sort (4)"
        };
        int[] categoryIcons = new int[]{
                MaterialVectorDrawable.TYPE_CALENDAR,
                MaterialVectorDrawable.TYPE_TAG,
                MaterialVectorDrawable.TYPE_SHIELD,
                MaterialVectorDrawable.TYPE_SORT
        };

        final int[] activeTabIdx = new int[]{0};
        final List<TextView> categoryTabViews = new ArrayList<>();
        final List<View> categoryPanels = new ArrayList<>();

        FrameLayout panelsContainer = new FrameLayout(activity);
        panelsContainer.setBackground(createRoundedDrawable(theme.surfaceContainer, 12 * density));
        panelsContainer.setPadding((int) (10 * density), (int) (8 * density), (int) (10 * density), (int) (8 * density));
        panelsContainer.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        Runnable updateTabStyles = () -> {
            for (int t = 0; t < categoryTitles.length; t++) {
                boolean active = (t == activeTabIdx[0]);
                TextView tabBtn = categoryTabViews.get(t);
                tabBtn.setTextColor(active ? theme.onPrimary : theme.textSecondary);
                tabBtn.setBackground(createRoundedDrawable(active ? theme.primary : Color.TRANSPARENT, 8 * density));
                MaterialVectorDrawable d = new MaterialVectorDrawable(categoryIcons[t], active ? theme.onPrimary : theme.textSecondary);
                d.setBounds(0, 0, (int) (12 * density), (int) (12 * density));
                tabBtn.setCompoundDrawables(d, null, null, null);
                categoryPanels.get(t).setVisibility(active ? View.VISIBLE : View.GONE);
            }
        };

        for (int t = 0; t < categoryTitles.length; t++) {
            final int tabIdx = t;
            TextView tabBtn = new TextView(activity);
            tabBtn.setText(categoryTitles[t]);
            tabBtn.setTextSize(11f);
            tabBtn.setTypeface(null, Typeface.BOLD);
            tabBtn.setGravity(Gravity.CENTER);
            tabBtn.setClickable(true);
            tabBtn.setFocusable(true);
            tabBtn.setCompoundDrawablePadding((int) (4 * density));
            tabBtn.setPadding((int) (10 * density), (int) (5 * density), (int) (10 * density), (int) (5 * density));
            categoryTabViews.add(tabBtn);
            categoryTabsGroup.addView(tabBtn);

            tabBtn.setOnClickListener(v -> {
                activeTabIdx[0] = tabIdx;
                updateTabStyles.run();
            });
        }
        fsTopBar.addView(categoryTabsGroup);
        filterStudioContainer.addView(fsTopBar);

        Runnable updateFilterBadge = () -> {
            int active = getActiveFilterList(currentCriteria).size();
            tvStudioBadge.setText("18 Available • " + active + " Active");
        };

        // ── Panel 0: Time & Dimensions ──
        LinearLayout panelTimeSize = new LinearLayout(activity);
        panelTimeSize.setOrientation(LinearLayout.HORIZONTAL);
        panelTimeSize.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Left 56%: Date Interval (Generous width to accommodate dual segmented groups & pickers)
        LinearLayout p0Left = new LinearLayout(activity);
        p0Left.setOrientation(LinearLayout.VERTICAL);
        p0Left.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.25f));

        LinearLayout p0DateHdr = new LinearLayout(activity);
        p0DateHdr.setOrientation(LinearLayout.HORIZONTAL);
        p0DateHdr.setGravity(Gravity.CENTER_VERTICAL);
        p0DateHdr.setPadding(0, 0, 0, (int) (3 * density));

        TextView tvDateIntervalTitle = new TextView(activity);
        tvDateIntervalTitle.setText("Date Interval");
        tvDateIntervalTitle.setTextSize(11f);
        tvDateIntervalTitle.setTypeface(null, Typeface.BOLD);
        tvDateIntervalTitle.setTextColor(theme.textPrimary);
        MaterialVectorDrawable calIcn = new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CALENDAR, theme.primary);
        calIcn.setBounds(0, 0, (int) (12 * density), (int) (12 * density));
        tvDateIntervalTitle.setCompoundDrawables(calIcn, null, null, null);
        tvDateIntervalTitle.setCompoundDrawablePadding((int) (4 * density));
        p0DateHdr.addView(tvDateIntervalTitle);

        View p0dHdrSpacer = new View(activity);
        p0DateHdr.addView(p0dHdrSpacer, new LinearLayout.LayoutParams(0, 0, 1f));

        LinearLayout grpRange = createSegmentedGroup(activity, new String[]{"Include", "Exclude"},
                "exclude".equals(currentCriteria.intervalType) ? 1 : 0, density, theme, idx -> {
                    currentCriteria.intervalType = (idx == 1) ? "exclude" : "include";
                    updateFilterBadge.run();
                    onFilterChanged.run();
                });
        LinearLayout.LayoutParams grpRangeLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        grpRangeLp.rightMargin = (int) (4 * density);
        grpRange.setLayoutParams(grpRangeLp);
        p0DateHdr.addView(grpRange);

        LinearLayout grpDateType = createSegmentedGroup(activity, new String[]{"Taken", "Uploaded"},
                "uploaded".equals(currentCriteria.dateType) ? 1 : 0, density, theme, idx -> {
                    currentCriteria.dateType = (idx == 1) ? "uploaded" : "taken";
                    updateFilterBadge.run();
                    onFilterChanged.run();
                });
        p0DateHdr.addView(grpDateType);
        p0Left.addView(p0DateHdr);

        // Date Pickers Row (From -> To [Clear])
        LinearLayout p0DateRow = new LinearLayout(activity);
        p0DateRow.setOrientation(LinearLayout.HORIZONTAL);
        p0DateRow.setGravity(Gravity.CENTER_VERTICAL);

        SimpleDateFormat dFmt = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
        SimpleDateFormat tFmt = new SimpleDateFormat("HH:mm", Locale.getDefault());

        TextView btnFrom = new TextView(activity);
        btnFrom.setText(currentCriteria.lowerBoundaryDate > 0
                ? (dFmt.format(new Date(currentCriteria.lowerBoundaryDate)) + " " + tFmt.format(new Date(currentCriteria.lowerBoundaryDate)))
                : "From: Any Date");
        btnFrom.setTextSize(10.5f);
        btnFrom.setTypeface(null, Typeface.BOLD);
        btnFrom.setTextColor(currentCriteria.lowerBoundaryDate > 0 ? theme.primary : theme.textSecondary);
        btnFrom.setBackground(createRoundedDrawable(theme.surface, 8 * density));
        btnFrom.setGravity(Gravity.CENTER);
        btnFrom.setPadding((int) (8 * density), (int) (5 * density), (int) (8 * density), (int) (5 * density));
        btnFrom.setClickable(true);
        LinearLayout.LayoutParams bfLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        bfLp.rightMargin = (int) (4 * density);
        btnFrom.setLayoutParams(bfLp);
        p0DateRow.addView(btnFrom);

        TextView tvArrow = new TextView(activity);
        tvArrow.setText("→");
        tvArrow.setTextSize(11f);
        tvArrow.setTypeface(null, Typeface.BOLD);
        tvArrow.setTextColor(theme.textTertiary);
        tvArrow.setPadding((int) (2 * density), 0, (int) (2 * density), 0);
        p0DateRow.addView(tvArrow);

        TextView btnTo = new TextView(activity);
        btnTo.setText(currentCriteria.higherBoundaryDate > 0
                ? (dFmt.format(new Date(currentCriteria.higherBoundaryDate)) + " " + tFmt.format(new Date(currentCriteria.higherBoundaryDate)))
                : "To: Any Date");
        btnTo.setTextSize(10.5f);
        btnTo.setTypeface(null, Typeface.BOLD);
        btnTo.setTextColor(currentCriteria.higherBoundaryDate > 0 ? theme.primary : theme.textSecondary);
        btnTo.setBackground(createRoundedDrawable(theme.surface, 8 * density));
        btnTo.setGravity(Gravity.CENTER);
        btnTo.setPadding((int) (8 * density), (int) (5 * density), (int) (8 * density), (int) (5 * density));
        btnTo.setClickable(true);
        LinearLayout.LayoutParams btLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        btLp.leftMargin = (int) (4 * density);
        btLp.rightMargin = (int) (6 * density);
        btnTo.setLayoutParams(btLp);
        p0DateRow.addView(btnTo);

        TextView btnDateClear = new TextView(activity);
        btnDateClear.setText("Clear");
        btnDateClear.setTextSize(10.5f);
        btnDateClear.setTypeface(null, Typeface.BOLD);
        btnDateClear.setTextColor(theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A);
        btnDateClear.setBackground(createActionPillDrawable(theme.surface, 8 * density));
        btnDateClear.setPadding((int) (8 * density), (int) (5 * density), (int) (8 * density), (int) (5 * density));
        btnDateClear.setClickable(true);
        p0DateRow.addView(btnDateClear);

        btnFrom.setOnClickListener(v -> {
            Calendar c = Calendar.getInstance();
            if (currentCriteria.lowerBoundaryDate > 0) c.setTimeInMillis(currentCriteria.lowerBoundaryDate);
            DatePickerDialog dpd = new DatePickerDialog(activity, (view, year, month, dayOfMonth) -> {
                c.set(Calendar.YEAR, year);
                c.set(Calendar.MONTH, month);
                c.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                TimePickerDialog tpd = new TimePickerDialog(activity, (view2, hourOfDay, minute) -> {
                    c.set(Calendar.HOUR_OF_DAY, hourOfDay);
                    c.set(Calendar.MINUTE, minute);
                    currentCriteria.lowerBoundaryDate = c.getTimeInMillis();
                    btnFrom.setText(dFmt.format(c.getTime()) + " " + tFmt.format(c.getTime()));
                    btnFrom.setTextColor(theme.primary);
                    updateFilterBadge.run();
                    onFilterChanged.run();
                }, c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), true);
                tpd.show();
            }, c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH));
            dpd.show();
        });

        btnTo.setOnClickListener(v -> {
            Calendar c = Calendar.getInstance();
            if (currentCriteria.higherBoundaryDate > 0) c.setTimeInMillis(currentCriteria.higherBoundaryDate);
            DatePickerDialog dpd = new DatePickerDialog(activity, (view, year, month, dayOfMonth) -> {
                c.set(Calendar.YEAR, year);
                c.set(Calendar.MONTH, month);
                c.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                TimePickerDialog tpd = new TimePickerDialog(activity, (view2, hourOfDay, minute) -> {
                    c.set(Calendar.HOUR_OF_DAY, hourOfDay);
                    c.set(Calendar.MINUTE, minute);
                    currentCriteria.higherBoundaryDate = c.getTimeInMillis();
                    btnTo.setText(dFmt.format(c.getTime()) + " " + tFmt.format(c.getTime()));
                    btnTo.setTextColor(theme.primary);
                    updateFilterBadge.run();
                    onFilterChanged.run();
                }, c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), true);
                tpd.show();
            }, c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH));
            dpd.show();
        });

        btnDateClear.setOnClickListener(v -> {
            currentCriteria.lowerBoundaryDate = 0;
            currentCriteria.higherBoundaryDate = 0;
            btnFrom.setText("From: Any Date");
            btnFrom.setTextColor(theme.textSecondary);
            btnTo.setText("To: Any Date");
            btnTo.setTextColor(theme.textSecondary);
            updateFilterBadge.run();
            onFilterChanged.run();
        });

        p0Left.addView(p0DateRow);
        panelTimeSize.addView(p0Left);

        View p0Div = new View(activity);
        p0Div.setBackgroundColor(theme.outline);
        LinearLayout.LayoutParams p0DivLp = new LinearLayout.LayoutParams((int) (1 * density), ViewGroup.LayoutParams.MATCH_PARENT);
        p0DivLp.leftMargin = (int) (12 * density);
        p0DivLp.rightMargin = (int) (12 * density);
        p0Div.setLayoutParams(p0DivLp);
        panelTimeSize.addView(p0Div);

        // Right 50%: Size, Resolution, Duration (3 sub-columns)
        LinearLayout p0Right = new LinearLayout(activity);
        p0Right.setOrientation(LinearLayout.HORIZONTAL);
        p0Right.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        // Subcol 1: Size (MB)
        LinearLayout colSize = new LinearLayout(activity);
        colSize.setOrientation(LinearLayout.VERTICAL);
        colSize.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView tvSizeTitle = new TextView(activity);
        tvSizeTitle.setText("Size (MB)");
        tvSizeTitle.setTextSize(10.5f);
        tvSizeTitle.setTypeface(null, Typeface.BOLD);
        tvSizeTitle.setTextColor(theme.textPrimary);
        colSize.addView(tvSizeTitle);
        LinearLayout rowSizeIn = new LinearLayout(activity);
        rowSizeIn.setOrientation(LinearLayout.HORIZONTAL);
        rowSizeIn.setGravity(Gravity.CENTER_VERTICAL);
        EditText etMinSize = createFilterStudioInput(activity, "> Min", currentCriteria.lowerBoundarySize > 0 ? StorageScanner.formatBytes(currentCriteria.lowerBoundarySize) : "", density, theme, s -> {
            currentCriteria.lowerBoundarySize = parseBytesInput(s);
            updateFilterBadge.run();
        }, onFilterChanged);
        EditText etMaxSize = createFilterStudioInput(activity, "< Max", currentCriteria.higherBoundarySize > 0 ? StorageScanner.formatBytes(currentCriteria.higherBoundarySize) : "", density, theme, s -> {
            currentCriteria.higherBoundarySize = parseBytesInput(s);
            updateFilterBadge.run();
        }, onFilterChanged);
        etMinSize.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        etMaxSize.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        rowSizeIn.addView(etMinSize);
        TextView tvSizeDash = new TextView(activity);
        tvSizeDash.setText("–");
        tvSizeDash.setTextColor(theme.textTertiary);
        tvSizeDash.setPadding((int) (2 * density), 0, (int) (2 * density), 0);
        rowSizeIn.addView(tvSizeDash);
        rowSizeIn.addView(etMaxSize);
        colSize.addView(rowSizeIn);
        LinearLayout.LayoutParams csLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        csLp.rightMargin = (int) (6 * density);
        colSize.setLayoutParams(csLp);
        p0Right.addView(colSize);

        // Subcol 2: Resolution
        LinearLayout colRes = new LinearLayout(activity);
        colRes.setOrientation(LinearLayout.VERTICAL);
        colRes.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView tvResTitle = new TextView(activity);
        tvResTitle.setText("Resolution");
        tvResTitle.setTextSize(10.5f);
        tvResTitle.setTypeface(null, Typeface.BOLD);
        tvResTitle.setTextColor(theme.textPrimary);
        colRes.addView(tvResTitle);
        LinearLayout rowResIn = new LinearLayout(activity);
        rowResIn.setOrientation(LinearLayout.HORIZONTAL);
        rowResIn.setGravity(Gravity.CENTER_VERTICAL);
        EditText etMinRes = createFilterStudioInput(activity, "Min px", currentCriteria.minWidth > 0 ? String.valueOf(currentCriteria.minWidth) : "", density, theme, s -> {
            try { currentCriteria.minWidth = Integer.parseInt(s); } catch (Exception e) { currentCriteria.minWidth = 0; }
            updateFilterBadge.run();
        }, onFilterChanged);
        EditText etMaxRes = createFilterStudioInput(activity, "Max px", currentCriteria.maxWidth > 0 ? String.valueOf(currentCriteria.maxWidth) : "", density, theme, s -> {
            try { currentCriteria.maxWidth = Integer.parseInt(s); } catch (Exception e) { currentCriteria.maxWidth = 0; }
            updateFilterBadge.run();
        }, onFilterChanged);
        etMinRes.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        etMaxRes.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        rowResIn.addView(etMinRes);
        TextView tvResX = new TextView(activity);
        tvResX.setText("×");
        tvResX.setTextColor(theme.textTertiary);
        tvResX.setPadding((int) (2 * density), 0, (int) (2 * density), 0);
        rowResIn.addView(tvResX);
        rowResIn.addView(etMaxRes);
        colRes.addView(rowResIn);
        LinearLayout.LayoutParams crLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        crLp.rightMargin = (int) (6 * density);
        colRes.setLayoutParams(crLp);
        p0Right.addView(colRes);

        // Subcol 3: Duration (s)
        LinearLayout colDur = new LinearLayout(activity);
        colDur.setOrientation(LinearLayout.VERTICAL);
        colDur.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView tvDurTitle = new TextView(activity);
        tvDurTitle.setText("Duration (s)");
        tvDurTitle.setTextSize(10.5f);
        tvDurTitle.setTypeface(null, Typeface.BOLD);
        tvDurTitle.setTextColor(theme.textPrimary);
        colDur.addView(tvDurTitle);
        LinearLayout rowDurIn = new LinearLayout(activity);
        rowDurIn.setOrientation(LinearLayout.HORIZONTAL);
        rowDurIn.setGravity(Gravity.CENTER_VERTICAL);
        EditText etMinDur = createFilterStudioInput(activity, "Min s", currentCriteria.minDuration > 0 ? String.valueOf(currentCriteria.minDuration) : "", density, theme, s -> {
            try { currentCriteria.minDuration = Float.parseFloat(s); } catch (Exception e) { currentCriteria.minDuration = 0; }
            updateFilterBadge.run();
        }, onFilterChanged);
        EditText etMaxDur = createFilterStudioInput(activity, "Max s", currentCriteria.maxDuration > 0 ? String.valueOf(currentCriteria.maxDuration) : "", density, theme, s -> {
            try { currentCriteria.maxDuration = Float.parseFloat(s); } catch (Exception e) { currentCriteria.maxDuration = 0; }
            updateFilterBadge.run();
        }, onFilterChanged);
        etMinDur.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        etMaxDur.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        rowDurIn.addView(etMinDur);
        TextView tvDurDash = new TextView(activity);
        tvDurDash.setText("–");
        tvDurDash.setTextColor(theme.textTertiary);
        tvDurDash.setPadding((int) (2 * density), 0, (int) (2 * density), 0);
        rowDurIn.addView(tvDurDash);
        rowDurIn.addView(etMaxDur);
        colDur.addView(rowDurIn);
        colDur.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        p0Right.addView(colDur);

        panelTimeSize.addView(p0Right);
        categoryPanels.add(panelTimeSize);
        panelsContainer.addView(panelTimeSize);

        // ── Panel 1: Media & Storage (4 Columns) ──
        LinearLayout panelMediaStorage = new LinearLayout(activity);
        panelMediaStorage.setOrientation(LinearLayout.HORIZONTAL);
        panelMediaStorage.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // 1. Media Type
        LinearLayout colType = new LinearLayout(activity);
        colType.setOrientation(LinearLayout.VERTICAL);
        TextView tvType = new TextView(activity);
        tvType.setText("Media Type");
        tvType.setTextSize(10.5f);
        tvType.setTypeface(null, Typeface.BOLD);
        tvType.setTextColor(theme.textPrimary);
        colType.addView(tvType);
        int typeIdx = "image".equals(currentCriteria.mediaType) ? 1 : "video".equals(currentCriteria.mediaType) ? 2 : "live".equals(currentCriteria.mediaType) ? 3 : 0;
        colType.addView(createSegmentedGroup(activity, new String[]{"Any", "Photo", "Video", "Live"}, typeIdx, density, theme, idx -> {
            currentCriteria.mediaType = (idx == 1) ? "image" : (idx == 2) ? "video" : (idx == 3) ? "live" : null;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams ctLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        ctLp.rightMargin = (int) (6 * density);
        colType.setLayoutParams(ctLp);
        panelMediaStorage.addView(colType);

        // 2. Quality
        LinearLayout colQuality = new LinearLayout(activity);
        colQuality.setOrientation(LinearLayout.VERTICAL);
        TextView tvQual = new TextView(activity);
        tvQual.setText("Quality");
        tvQual.setTextSize(10.5f);
        tvQual.setTypeface(null, Typeface.BOLD);
        tvQual.setTextColor(theme.textPrimary);
        colQuality.addView(tvQual);
        int qualIdx = "original".equals(currentCriteria.quality) ? 1 : "storage-saver".equals(currentCriteria.quality) ? 2 : 0;
        colQuality.addView(createSegmentedGroup(activity, new String[]{"Any", "Original", "Saver"}, qualIdx, density, theme, idx -> {
            currentCriteria.quality = (idx == 1) ? "original" : (idx == 2) ? "storage-saver" : null;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams cqLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cqLp.rightMargin = (int) (6 * density);
        colQuality.setLayoutParams(cqLp);
        panelMediaStorage.addView(colQuality);

        // 3. Storage Quota (Space)
        LinearLayout colQuota = new LinearLayout(activity);
        colQuota.setOrientation(LinearLayout.VERTICAL);
        TextView tvQuota = new TextView(activity);
        tvQuota.setText("Storage Quota");
        tvQuota.setTextSize(10.5f);
        tvQuota.setTypeface(null, Typeface.BOLD);
        tvQuota.setTextColor(theme.textPrimary);
        colQuota.addView(tvQuota);
        int spaceIdx = (currentCriteria.space == StorageScanner.SpaceFilter.CONSUMING) ? 1 : (currentCriteria.space == StorageScanner.SpaceFilter.NON_CONSUMING) ? 2 : 0;
        colQuota.addView(createSegmentedGroup(activity, new String[]{"Any", "Consuming", "Free"}, spaceIdx, density, theme, idx -> {
            currentCriteria.space = (idx == 1) ? StorageScanner.SpaceFilter.CONSUMING : (idx == 2) ? StorageScanner.SpaceFilter.NON_CONSUMING : StorageScanner.SpaceFilter.ANY;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams cquLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cquLp.rightMargin = (int) (6 * density);
        colQuota.setLayoutParams(cquLp);
        panelMediaStorage.addView(colQuota);

        // 4. Similarity Threshold
        LinearLayout colSim = new LinearLayout(activity);
        colSim.setOrientation(LinearLayout.VERTICAL);
        TextView tvSim = new TextView(activity);
        tvSim.setText("Similarity Threshold");
        tvSim.setTextSize(10.5f);
        tvSim.setTypeface(null, Typeface.BOLD);
        tvSim.setTextColor(theme.textPrimary);
        colSim.addView(tvSim);
        EditText etSim = createFilterStudioInput(activity, "0.01 - 1.0 (e.g. 0.90)", currentCriteria.similarityThreshold > 0 ? String.valueOf(currentCriteria.similarityThreshold) : "", density, theme, s -> {
            try { currentCriteria.similarityThreshold = Float.parseFloat(s); } catch (Exception e) { currentCriteria.similarityThreshold = 0; }
            updateFilterBadge.run();
        }, onFilterChanged);
        colSim.addView(etSim);
        colSim.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        panelMediaStorage.addView(colSim);

        panelMediaStorage.setVisibility(View.GONE);
        categoryPanels.add(panelMediaStorage);
        panelsContainer.addView(panelMediaStorage);

        // ── Panel 2: Status & Flags (6 Columns) ──
        LinearLayout panelStatusFlags = new LinearLayout(activity);
        panelStatusFlags.setOrientation(LinearLayout.HORIZONTAL);
        panelStatusFlags.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // 1. Backup
        LinearLayout colBackup = new LinearLayout(activity);
        colBackup.setOrientation(LinearLayout.VERTICAL);
        TextView tvBkp = new TextView(activity);
        tvBkp.setText("Backup");
        tvBkp.setTextSize(10.5f);
        tvBkp.setTypeface(null, Typeface.BOLD);
        tvBkp.setTextColor(theme.textPrimary);
        colBackup.addView(tvBkp);
        int bkpIdx = "full".equals(currentCriteria.uploadStatus) ? 1 : 0;
        colBackup.addView(createSegmentedGroup(activity, new String[]{"Any", "Cloud"}, bkpIdx, density, theme, idx -> {
            currentCriteria.uploadStatus = (idx == 1) ? "full" : null;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams cbkLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cbkLp.rightMargin = (int) (4 * density);
        colBackup.setLayoutParams(cbkLp);
        panelStatusFlags.addView(colBackup);

        // 2. Archive
        LinearLayout colArch = new LinearLayout(activity);
        colArch.setOrientation(LinearLayout.VERTICAL);
        TextView tvArch = new TextView(activity);
        tvArch.setText("Archive");
        tvArch.setTextSize(10.5f);
        tvArch.setTypeface(null, Typeface.BOLD);
        tvArch.setTextColor(theme.textPrimary);
        colArch.addView(tvArch);
        int archIdx = Boolean.TRUE.equals(currentCriteria.archived) ? 1 : 0;
        colArch.addView(createSegmentedGroup(activity, new String[]{"Active", "Archived"}, archIdx, density, theme, idx -> {
            currentCriteria.archived = (idx == 1) ? Boolean.TRUE : null;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams carLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        carLp.rightMargin = (int) (4 * density);
        colArch.setLayoutParams(carLp);
        panelStatusFlags.addView(colArch);

        // 3. Favorites
        LinearLayout colFav = new LinearLayout(activity);
        colFav.setOrientation(LinearLayout.VERTICAL);
        TextView tvFav = new TextView(activity);
        tvFav.setText("Favorites");
        tvFav.setTextSize(10.5f);
        tvFav.setTypeface(null, Typeface.BOLD);
        tvFav.setTextColor(theme.textPrimary);
        colFav.addView(tvFav);
        int favIdx = Boolean.TRUE.equals(currentCriteria.favorite) ? 1 : currentCriteria.excludeFavorites ? 2 : 0;
        colFav.addView(createSegmentedGroup(activity, new String[]{"Any", "Only", "Omit"}, favIdx, density, theme, idx -> {
            currentCriteria.favorite = (idx == 1) ? Boolean.TRUE : null;
            currentCriteria.excludeFavorites = (idx == 2);
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams cfvLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cfvLp.rightMargin = (int) (4 * density);
        colFav.setLayoutParams(cfvLp);
        panelStatusFlags.addView(colFav);

        // 4. Shared
        LinearLayout colShared = new LinearLayout(activity);
        colShared.setOrientation(LinearLayout.VERTICAL);
        TextView tvSh = new TextView(activity);
        tvSh.setText("Shared");
        tvSh.setTextSize(10.5f);
        tvSh.setTypeface(null, Typeface.BOLD);
        tvSh.setTextColor(theme.textPrimary);
        colShared.addView(tvSh);
        int shIdx = currentCriteria.excludeShared ? 1 : 0;
        colShared.addView(createSegmentedGroup(activity, new String[]{"Include", "Omit"}, shIdx, density, theme, idx -> {
            currentCriteria.excludeShared = (idx == 1);
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams cshLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cshLp.rightMargin = (int) (4 * density);
        colShared.setLayoutParams(cshLp);
        panelStatusFlags.addView(colShared);

        // 5. Ownership
        LinearLayout colOwn = new LinearLayout(activity);
        colOwn.setOrientation(LinearLayout.VERTICAL);
        TextView tvOwn = new TextView(activity);
        tvOwn.setText("Ownership");
        tvOwn.setTextSize(10.5f);
        tvOwn.setTypeface(null, Typeface.BOLD);
        tvOwn.setTextColor(theme.textPrimary);
        colOwn.addView(tvOwn);
        int ownIdx = Boolean.TRUE.equals(currentCriteria.owned) ? 1 : 0;
        colOwn.addView(createSegmentedGroup(activity, new String[]{"Any", "Mine"}, ownIdx, density, theme, idx -> {
            currentCriteria.owned = (idx == 1) ? Boolean.TRUE : null;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams coLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        coLp.rightMargin = (int) (4 * density);
        colOwn.setLayoutParams(coLp);
        panelStatusFlags.addView(colOwn);

        // 6. Location
        LinearLayout colLoc = new LinearLayout(activity);
        colLoc.setOrientation(LinearLayout.VERTICAL);
        TextView tvLoc = new TextView(activity);
        tvLoc.setText("Location");
        tvLoc.setTextSize(10.5f);
        tvLoc.setTypeface(null, Typeface.BOLD);
        tvLoc.setTextColor(theme.textPrimary);
        colLoc.addView(tvLoc);
        int locIdx = Boolean.TRUE.equals(currentCriteria.hasLocation) ? 1 : 0;
        colLoc.addView(createSegmentedGroup(activity, new String[]{"Any", "GPS"}, locIdx, density, theme, idx -> {
            currentCriteria.hasLocation = (idx == 1) ? Boolean.TRUE : null;
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        colLoc.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        panelStatusFlags.addView(colLoc);

        panelStatusFlags.setVisibility(View.GONE);
        categoryPanels.add(panelStatusFlags);
        panelsContainer.addView(panelStatusFlags);

        // ── Panel 3: Search & Sort (4 Columns) ──
        LinearLayout panelSearchSort = new LinearLayout(activity);
        panelSearchSort.setOrientation(LinearLayout.HORIZONTAL);
        panelSearchSort.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // 1. Sort Order
        LinearLayout colSort = new LinearLayout(activity);
        colSort.setOrientation(LinearLayout.VERTICAL);
        TextView tvSo = new TextView(activity);
        tvSo.setText("Sort Order");
        tvSo.setTextSize(10.5f);
        tvSo.setTypeface(null, Typeface.BOLD);
        tvSo.setTextColor(theme.textPrimary);
        colSort.addView(tvSo);
        int sortIdx = currentCriteria.sortBySize ? 1 : 0;
        colSort.addView(createSegmentedGroup(activity, new String[]{"Date", "Size (Desc)"}, sortIdx, density, theme, idx -> {
            currentCriteria.sortBySize = (idx == 1);
            updateFilterBadge.run();
            onFilterChanged.run();
        }));
        LinearLayout.LayoutParams csoLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        csoLp.rightMargin = (int) (6 * density);
        colSort.setLayoutParams(csoLp);
        panelSearchSort.addView(colSort);

        // 2. Search Query
        LinearLayout colQuery = new LinearLayout(activity);
        colQuery.setOrientation(LinearLayout.VERTICAL);
        TextView tvQ = new TextView(activity);
        tvQ.setText("Search Query");
        tvQ.setTextSize(10.5f);
        tvQ.setTypeface(null, Typeface.BOLD);
        tvQ.setTextColor(theme.textPrimary);
        colQuery.addView(tvQ);
        EditText etQuery = createFilterStudioInput(activity, "Query keywords...", currentCriteria.searchQuery != null ? currentCriteria.searchQuery : "", density, theme, s -> {
            currentCriteria.searchQuery = s;
            updateFilterBadge.run();
        }, onFilterChanged);
        colQuery.addView(etQuery);
        LinearLayout.LayoutParams cqyLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cqyLp.rightMargin = (int) (6 * density);
        colQuery.setLayoutParams(cqyLp);
        panelSearchSort.addView(colQuery);

        // 3. Filename Regex
        LinearLayout colFile = new LinearLayout(activity);
        colFile.setOrientation(LinearLayout.VERTICAL);
        TextView tvFn = new TextView(activity);
        tvFn.setText("Filename Regex");
        tvFn.setTextSize(10.5f);
        tvFn.setTypeface(null, Typeface.BOLD);
        tvFn.setTextColor(theme.textPrimary);
        colFile.addView(tvFn);
        EditText etFile = createFilterStudioInput(activity, "e.g. IMG_.*\\.jpg", currentCriteria.fileNameRegex != null ? currentCriteria.fileNameRegex : "", density, theme, s -> {
            currentCriteria.fileNameRegex = s;
            updateFilterBadge.run();
        }, onFilterChanged);
        colFile.addView(etFile);
        LinearLayout.LayoutParams cflLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        cflLp.rightMargin = (int) (6 * density);
        colFile.setLayoutParams(cflLp);
        panelSearchSort.addView(colFile);

        // 4. Caption / Description & Album Selector
        LinearLayout colDesc = new LinearLayout(activity);
        colDesc.setOrientation(LinearLayout.VERTICAL);
        TextView tvDc = new TextView(activity);
        tvDc.setText("Caption / Target");
        tvDc.setTextSize(10.5f);
        tvDc.setTypeface(null, Typeface.BOLD);
        tvDc.setTextColor(theme.textPrimary);
        colDesc.addView(tvDc);

        if (currentCriteria.source == StorageScanner.SourceType.ALBUMS) {
            TextView btnAlbums = new TextView(activity);
            btnAlbums.setText(!currentCriteria.albumsInclude.isEmpty() ? (currentCriteria.albumsInclude.size() + " Albums Selected") : "Select Albums...");
            btnAlbums.setTextSize(11f);
            btnAlbums.setTypeface(null, Typeface.BOLD);
            btnAlbums.setTextColor(theme.primary);
            btnAlbums.setBackground(createActionPillDrawable(theme.surface, 8 * density));
            btnAlbums.setGravity(Gravity.CENTER);
            btnAlbums.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
            btnAlbums.setOnClickListener(v -> showTabletAlbumSelectionDialog(activity, theme, density, onFilterChanged));
            colDesc.addView(btnAlbums);
        } else {
            EditText etDesc = createFilterStudioInput(activity, "Caption text...", currentCriteria.descriptionRegex != null ? currentCriteria.descriptionRegex : "", density, theme, s -> {
                currentCriteria.descriptionRegex = s;
                updateFilterBadge.run();
            }, onFilterChanged);
            colDesc.addView(etDesc);
        }
        colDesc.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        panelSearchSort.addView(colDesc);

        panelSearchSort.setVisibility(View.GONE);
        categoryPanels.add(panelSearchSort);
        panelsContainer.addView(panelSearchSort);

        filterStudioContainer.addView(panelsContainer);
        root.addView(filterStudioContainer);

        btnResetFilters.setOnClickListener(v -> {
            currentCriteria = new StorageScanner.FilterCriteria();
            updateSourceStyles.run();
            updateTabStyles.run();
            updateFilterBadge.run();
            onFilterChanged.run();
            Toast.makeText(activity, "Filters reset", Toast.LENGTH_SHORT).show();
        });

        View div2 = new View(activity);
        div2.setBackgroundColor(theme.outline);
        div2.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (1 * density)));
        root.addView(div2);

        // ─────────────────────────────────────────────────────────────────────
        // STEP 3: CHOOSE ACTION (BELOW FILTERS! 2 Symmetrical Rows x 7 Columns)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout actionsRow = new LinearLayout(activity);
        actionsRow.setOrientation(LinearLayout.HORIZONTAL);
        actionsRow.setGravity(Gravity.CENTER_VERTICAL);
        actionsRow.setPadding(p16, (int) (6 * density), p16, (int) (6 * density));
        actionsRow.setBackgroundColor(theme.surfaceContainer);

        LinearLayout step3Header = createStepBadgeWithLabel(activity, "3", "ACTIONS", density, theme);
        LinearLayout.LayoutParams s3HdrLp = new LinearLayout.LayoutParams((int) (96 * density), ViewGroup.LayoutParams.WRAP_CONTENT);
        step3Header.setLayoutParams(s3HdrLp);
        actionsRow.addView(step3Header);

        updateSelectionSummaryRef[0] = () -> {
            int selCount = selectedMediaKeys.size();
            int total = allQueriedItems.size();
            int consuming = 0;
            long totalQuotaBytes = 0;
            for (StorageScanner.MediaItem it : allQueriedItems) {
                if (it.quotaBytes > 0) {
                    consuming++;
                    totalQuotaBytes += it.quotaBytes;
                }
            }
            tvResultsStatus.setText(total + " matched • " + selCount + " selected • " + consuming + " consuming (" + StorageScanner.formatBytes(totalQuotaBytes) + ")");
        };

        LinearLayout actionsGrid = new LinearLayout(activity);
        actionsGrid.setOrientation(LinearLayout.VERTICAL);
        actionsGrid.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        String[][] actionDefsRow1 = new String[][]{
                {"toNewAlbum", "New Album", String.valueOf(MaterialVectorDrawable.TYPE_ADD)},
                {"toExistingAlbum", "Add to Album", String.valueOf(MaterialVectorDrawable.TYPE_FOLDER)},
                {"removeFromAlbum", "Remove Album", String.valueOf(MaterialVectorDrawable.TYPE_COLLAPSE)},
                {"setDateFromFilename", "Date Name", String.valueOf(MaterialVectorDrawable.TYPE_CALENDAR)},
                {"toArchive", "Archive", String.valueOf(MaterialVectorDrawable.TYPE_ARCHIVE)},
                {"unArchive", "Un-Archive", String.valueOf(MaterialVectorDrawable.TYPE_EXPAND)},
                {"toFavorite", "Favorite", String.valueOf(MaterialVectorDrawable.TYPE_STAR)}
        };

        String[][] actionDefsRow2 = new String[][]{
                {"unFavorite", "Un-Favorite", String.valueOf(MaterialVectorDrawable.TYPE_STAR)},
                {"lock", "To Locker", String.valueOf(MaterialVectorDrawable.TYPE_LOCK)},
                {"unLock", "Unlock", String.valueOf(MaterialVectorDrawable.TYPE_LOCK)},
                {"toTrash", "Trash", String.valueOf(MaterialVectorDrawable.TYPE_DELETE)},
                {"restoreTrash", "Restore", String.valueOf(MaterialVectorDrawable.TYPE_REFRESH)},
                {"exportDcim", "Export DCIM", String.valueOf(MaterialVectorDrawable.TYPE_DOWNLOAD)},
                {"exportMetadata", "Export CSV", String.valueOf(MaterialVectorDrawable.TYPE_EXPORT)}
        };

        ItemsProvider selectedItemsProvider = () -> {
            List<StorageScanner.MediaItem> list = new ArrayList<>();
            for (StorageScanner.MediaItem it : allQueriedItems) {
                if (selectedMediaKeys.contains(getItemKey(it))) {
                    list.add(it);
                }
            }
            return list;
        };

        String[][][] allActionRows = new String[][][]{actionDefsRow1, actionDefsRow2};
        for (int r = 0; r < 2; r++) {
            LinearLayout gridRow = new LinearLayout(activity);
            gridRow.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams grLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            if (r > 0) grLp.topMargin = (int) (4 * density);
            gridRow.setLayoutParams(grLp);

            String[][] rowDefs = allActionRows[r];
            for (int c = 0; c < 7; c++) {
                final String actionId = rowDefs[c][0];
                final String actionLabel = rowDefs[c][1];
                final int iconType = Integer.parseInt(rowDefs[c][2]);

                TextView btn = new TextView(activity);
                btn.setText(actionLabel);
                btn.setTextSize(10.5f);
                btn.setTypeface(null, Typeface.BOLD);
                btn.setTextColor(theme.textPrimary);
                btn.setGravity(Gravity.CENTER);
                btn.setClickable(true);
                btn.setFocusable(true);
                btn.setSingleLine(true);
                btn.setEllipsize(TextUtils.TruncateAt.END);
                btn.setMinHeight((int) (28 * density));
                btn.setBackground(createActionPillDrawable(theme.surface, 8 * density));
                btn.setPadding((int) (3 * density), (int) (3 * density), (int) (3 * density), (int) (3 * density));

                MaterialVectorDrawable d = new MaterialVectorDrawable(iconType, theme.primary);
                d.setBounds(0, 0, (int) (12 * density), (int) (12 * density));
                btn.setCompoundDrawables(d, null, null, null);
                btn.setCompoundDrawablePadding((int) (3 * density));

                LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                if (c < 6) bLp.rightMargin = (int) (5 * density);
                btn.setLayoutParams(bLp);

                btn.setOnClickListener(v -> {
                    if (btn.getAlpha() < 0.6f) {
                        String disabledHint = getActionDisabledHint(actionId, currentCriteria);
                        Toast.makeText(activity, disabledHint != null ? disabledHint : "Action not applicable for current source", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    performActionClick(activity, actionId, actionLabel, selectedItemsProvider, runScanRef, density, theme);
                });

                actionButtonsMap.put(actionId, btn);
                gridRow.addView(btn);
            }
            actionsGrid.addView(gridRow);
        }
        actionsRow.addView(actionsGrid);
        root.addView(actionsRow);

        updateActionStates(currentCriteria.source, currentCriteria, actionButtonsMap);

        View div3 = new View(activity);
        div3.setBackgroundColor(theme.outline);
        div3.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (1 * density)));
        root.addView(div3);

        // ─────────────────────────────────────────────────────────────────────
        // STEP 4: MATCHED MEDIA RESULTS CANVAS (Below Actions Spanning 100% Width)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout resultsCanvas = new LinearLayout(activity);
        resultsCanvas.setOrientation(LinearLayout.VERTICAL);
        resultsCanvas.setPadding(p16, (int) (6 * density), p16, (int) (6 * density));
        resultsCanvas.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

        LinearLayout tb = new LinearLayout(activity);
        tb.setOrientation(LinearLayout.HORIZONTAL);
        tb.setGravity(Gravity.CENTER_VERTICAL);
        tb.setPadding(0, 0, 0, (int) (4 * density));

        LinearLayout step4Header = createStepBadgeWithLabel(activity, "4", "MATCHED MEDIA RESULTS", density, theme);
        tb.addView(step4Header);

        tvResultsStatus.setText("Scanning media...");
        tvResultsStatus.setTextSize(11f);
        tvResultsStatus.setTextColor(theme.textSecondary);
        LinearLayout.LayoutParams rsLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rsLp.leftMargin = (int) (10 * density);
        tvResultsStatus.setLayoutParams(rsLp);
        tb.addView(tvResultsStatus);

        View tbSpacer = new View(activity);
        tb.addView(tbSpacer, new LinearLayout.LayoutParams(0, 0, 1f));

        TextView btnSort = createCanvasToolbarButton(activity, "↕ " + currentSortOrder.shortLabel, theme.textPrimary, density, theme);
        TextView btnViewToggle = createCanvasToolbarButton(activity, isGridViewRef[0] ? "⊞ Grid" : "☰ List", theme.onPrimaryContainer, density, theme);
        btnViewToggle.setBackground(createActionPillDrawable(theme.primaryContainer, 8 * density));

        tb.addView(btnSort);
        tb.addView(btnViewToggle);

        TextView btnScan = new TextView(activity);
        tvScanButtonLabel.setText("Apply & Scan");
        tvScanButtonLabel.setTextSize(11.5f);
        tvScanButtonLabel.setTypeface(null, Typeface.BOLD);
        tvScanButtonLabel.setTextColor(theme.onPrimary);
        btnScan.setText("Apply & Scan");
        btnScan.setTextSize(11.5f);
        btnScan.setTypeface(null, Typeface.BOLD);
        btnScan.setTextColor(theme.onPrimary);
        btnScan.setBackground(createActionPillDrawable(theme.primary, 10 * density));
        btnScan.setPadding((int) (12 * density), (int) (5 * density), (int) (12 * density), (int) (5 * density));
        btnScan.setClickable(true);
        btnScan.setFocusable(true);
        LinearLayout.LayoutParams sbtnLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sbtnLp.leftMargin = (int) (8 * density);
        btnScan.setLayoutParams(sbtnLp);
        btnScan.setOnClickListener(v -> {
            if (runScanRef[0] != null) runScanRef[0].run();
        });
        tb.addView(btnScan);
        resultsCanvas.addView(tb);

        sProgressBar = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        sProgressBar.setIndeterminate(true);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            sProgressBar.setIndeterminateTintList(ColorStateList.valueOf(theme.primary));
        }
        sProgressBar.setVisibility(View.GONE);
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (3 * density));
        pbLp.bottomMargin = (int) (4 * density);
        sProgressBar.setLayoutParams(pbLp);
        resultsCanvas.addView(sProgressBar);

        ScrollView resultsScroll = new ScrollView(activity);
        resultsScroll.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        resultsScroll.setClipToPadding(false);
        resultsScroll.addView(resultsListContainer);
        resultsCanvas.addView(resultsScroll);

        root.addView(resultsCanvas);

        btnSort.setOnClickListener(v -> {
            showSortPickerDialog(activity, () -> {
                btnSort.setText("↕ " + currentSortOrder.shortLabel);
                sortMediaItems(allQueriedItems, currentSortOrder);
                currentPageRef[0] = 0;
                renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
            }, density, theme);
        });

        btnViewToggle.setOnClickListener(v -> {
            isGridViewRef[0] = !isGridViewRef[0];
            btnViewToggle.setText(isGridViewRef[0] ? "⊞ Grid" : "☰ List");
            renderResults(activity, resultsListContainer, allQueriedItems, selectedMediaKeys, isGridViewRef[0], updateSelectionSummaryRef[0], density, theme, currentPageRef);
        });

        onRefreshRef[0] = () -> {
            currentCriteria = new StorageScanner.FilterCriteria();
            currentSortOrder = SortOrder.DATE_DESC;
            selectedMediaKeys.clear();
            if (updateSelectionSummaryRef[0] != null) updateSelectionSummaryRef[0].run();
            updateSourceStyles.run();
            updateTabStyles.run();
            updateFilterBadge.run();
            btnSort.setText("↕ " + currentSortOrder.shortLabel);
            updateActionStates(currentCriteria.source, currentCriteria, actionButtonsMap);
            THREAD_POOL.execute(() -> {
                if (currentAccount != null) {
                    availableAlbums = StorageScanner.getAvailableAlbums(currentAccount);
                    if (sRepopulateAlbumCardsRunnable != null) {
                        sRepopulateAlbumCardsRunnable.run();
                    }
                }
            });
            if (runScanRef[0] != null) runScanRef[0].run();
        };
    }

    private static List<Pair<String, Runnable>> getActiveFilterList(StorageScanner.FilterCriteria crit) {
        List<Pair<String, Runnable>> list = new ArrayList<>();
        if (!crit.albumsInclude.isEmpty()) {
            list.add(new Pair<>("Albums: " + crit.albumsInclude.size(), () -> crit.albumsInclude.clear()));
        }
        if (crit.searchQuery != null && !crit.searchQuery.trim().isEmpty()) {
            String q = crit.searchQuery.trim();
            if (q.length() > 12) q = q.substring(0, 10) + "..";
            list.add(new Pair<>("Search: \"" + q + "\"", () -> crit.searchQuery = ""));
        }
        if (!crit.albumsExclude.isEmpty()) {
            list.add(new Pair<>("Excl. Albums: " + crit.albumsExclude.size(), () -> crit.albumsExclude.clear()));
        }
        if (crit.lowerBoundaryDate > 0 || crit.higherBoundaryDate > 0) {
            list.add(new Pair<>("Date (" + crit.intervalType + ")", () -> {
                crit.lowerBoundaryDate = 0;
                crit.higherBoundaryDate = 0;
            }));
        }
        if (crit.fileNameRegex != null && !crit.fileNameRegex.trim().isEmpty()) {
            String fn = crit.fileNameRegex.trim();
            if (fn.length() > 12) fn = fn.substring(0, 10) + "..";
            list.add(new Pair<>("File: " + fn, () -> crit.fileNameRegex = ""));
        }
        if (crit.descriptionRegex != null && !crit.descriptionRegex.trim().isEmpty()) {
            String desc = crit.descriptionRegex.trim();
            if (desc.length() > 12) desc = desc.substring(0, 10) + "..";
            list.add(new Pair<>("Desc: " + desc, () -> crit.descriptionRegex = ""));
        }
        if (crit.space != null && crit.space != StorageScanner.SpaceFilter.ANY) {
            list.add(new Pair<>("Space: " + crit.space.name().toLowerCase(), () -> crit.space = StorageScanner.SpaceFilter.ANY));
        }
        if (crit.similarityThreshold > 0) {
            list.add(new Pair<>("Similarity: " + (int) (crit.similarityThreshold * 100) + "%", () -> crit.similarityThreshold = 0f));
        }
        if (crit.lowerBoundarySize > 0 || crit.higherBoundarySize > 0) {
            list.add(new Pair<>("Size Range", () -> {
                crit.lowerBoundarySize = 0;
                crit.higherBoundarySize = 0;
            }));
        }
        if (crit.minWidth > 0 || crit.maxWidth > 0 || crit.minHeight > 0 || crit.maxHeight > 0) {
            list.add(new Pair<>("Resolution", () -> {
                crit.minWidth = 0;
                crit.maxWidth = 0;
                crit.minHeight = 0;
                crit.maxHeight = 0;
            }));
        }
        if (crit.minDuration > 0 || crit.maxDuration > 0) {
            list.add(new Pair<>("Duration", () -> {
                crit.minDuration = 0;
                crit.maxDuration = 0;
            }));
        }
        if (crit.quality != null) {
            list.add(new Pair<>("Quality: " + crit.quality, () -> crit.quality = null));
        }
        if (crit.mediaType != null) {
            list.add(new Pair<>("Type: " + crit.mediaType, () -> crit.mediaType = null));
        }
        if (crit.uploadStatus != null) {
            list.add(new Pair<>("Upload: " + crit.uploadStatus, () -> crit.uploadStatus = null));
        }
        if (crit.archived != null) {
            list.add(new Pair<>("Archived: " + (crit.archived ? "Yes" : "No"), () -> crit.archived = null));
        }
        if (crit.owned != null) {
            list.add(new Pair<>("Owned: " + (crit.owned ? "Yes" : "No"), () -> crit.owned = null));
        }
        if (crit.hasLocation != null || crit.boundSouth != null) {
            list.add(new Pair<>("Location", () -> {
                crit.hasLocation = null;
                crit.boundSouth = null;
                crit.boundWest = null;
                crit.boundNorth = null;
                crit.boundEast = null;
            }));
        }
        if (crit.favorite != null) {
            list.add(new Pair<>("Favorite: " + (crit.favorite ? "Yes" : "No"), () -> crit.favorite = null));
        }
        if (crit.excludeShared) {
            list.add(new Pair<>("Excl. Shared", () -> crit.excludeShared = false));
        }
        if (crit.excludeFavorites) {
            list.add(new Pair<>("Excl. Favs", () -> crit.excludeFavorites = false));
        }
        if (!crit.sortBySize) {
            list.add(new Pair<>("Sort: Default", () -> crit.sortBySize = true));
        }
        return list;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Section Header Builder (Step Badges)
    // ─────────────────────────────────────────────────────────────────────────
    private static LinearLayout createSectionHeader(Activity activity, int stepNum, String title, float density, Theme theme) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, (int) (12 * density), 0, (int) (8 * density));

        TextView badge = new TextView(activity);
        badge.setText(String.valueOf(stepNum));
        badge.setTextSize(11f);
        badge.setTypeface(null, Typeface.BOLD);
        badge.setTextColor(theme.onPrimary);
        badge.setGravity(Gravity.CENTER);
        int bSize = (int) (20 * density);
        LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(bSize, bSize);
        bLp.rightMargin = (int) (8 * density);
        badge.setLayoutParams(bLp);
        badge.setBackground(createRoundedDrawable(theme.primary, 10 * density));
        row.addView(badge);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText(title);
        tvTitle.setTextSize(14f);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setTextColor(theme.textPrimary);
        row.addView(tvTitle);

        return row;
    }

    private static void populateAlbumCheckboxes(Activity activity, Theme theme, LinearLayout content, Runnable updateBadge, boolean isExclude, Runnable onFilterChanged) {
        content.removeAllViews();
        if (availableAlbums.isEmpty()) {
            TextView tvEmpty = new TextView(activity);
            tvEmpty.setText("No albums loaded.");
            tvEmpty.setTextColor(theme.textSecondary);
            content.addView(tvEmpty);
        } else {
            for (StorageScanner.AlbumInfo alb : availableAlbums) {
                CheckBox cb = new CheckBox(activity);
                String label = isExclude ? "Exclude: " + alb.title : alb.title + " (" + alb.itemCount + ")";
                cb.setText(label);
                cb.setTextColor(theme.textPrimary);
                List<String> list = isExclude ? currentCriteria.albumsExclude : currentCriteria.albumsInclude;
                cb.setChecked(list.contains(alb.mediaKey));
                cb.setOnCheckedChangeListener((b, c) -> {
                    if (c) {
                        if (!list.contains(alb.mediaKey)) list.add(alb.mediaKey);
                    } else {
                        list.remove(alb.mediaKey);
                    }
                    if (updateBadge != null) updateBadge.run();
                    if (onFilterChanged != null) onFilterChanged.run();
                });
                content.addView(cb);
            }
        }
        if (updateBadge != null) updateBadge.run();
    }

    // ─────────────────────────────────────────────────────────────────────────
    // STEP 2: All 21 Filters Accordion Builder (Direct from user.js)
    // ─────────────────────────────────────────────────────────────────────────
    private static Map<String, View> build21FiltersAccordion(Activity activity, LinearLayout container, float density, Theme theme, Runnable onFilterChanged) {
        container.removeAllViews();
        Set<String> expandedSet = new HashSet<>();
        Map<String, View> cards = new HashMap<>();

        LinearLayout[] includeAlbumsContentRef = new LinearLayout[1];
        Runnable[] includeAlbumsBadgeRef = new Runnable[1];
        LinearLayout[] excludeAlbumsContentRef = new LinearLayout[1];
        Runnable[] excludeAlbumsBadgeRef = new Runnable[1];

        // 1. Select Albums
        cards.put("includeAlbums", addFilterCard(activity, container, density, theme, expandedSet, "Select Albums",
                "Target specific albums (Albums source)",
                () -> currentCriteria.albumsInclude.isEmpty() ? null : currentCriteria.albumsInclude.size() + " selected",
                (content, updateBadge) -> {
                    includeAlbumsContentRef[0] = content;
                    includeAlbumsBadgeRef[0] = updateBadge;
                    populateAlbumCheckboxes(activity, theme, content, updateBadge, false, onFilterChanged);
                }));

        // 2. Search Query
        cards.put("search", addFilterCard(activity, container, density, theme, expandedSet, "Search Query",
                "Query search results",
                () -> (currentCriteria.searchQuery != null && !currentCriteria.searchQuery.trim().isEmpty()) ? "\"" + currentCriteria.searchQuery.trim() + "\"" : null,
                (content, updateBadge) -> {
                    EditText et = createFilterInput(activity, density, theme, "Enter search query...");
                    et.setText(currentCriteria.searchQuery != null ? currentCriteria.searchQuery : "");
                    et.addTextChangedListener(new DebounceWatcher(s -> {
                        currentCriteria.searchQuery = s;
                        updateBadge.run();
                    }, onFilterChanged));
                    content.addView(et);
                }));

        // 3. Exclude Albums
        cards.put("excludeAlbums", addFilterCard(activity, container, density, theme, expandedSet, "Exclude Albums",
                "Omit media present in selected albums",
                () -> currentCriteria.albumsExclude.isEmpty() ? null : currentCriteria.albumsExclude.size() + " excluded",
                (content, updateBadge) -> {
                    excludeAlbumsContentRef[0] = content;
                    excludeAlbumsBadgeRef[0] = updateBadge;
                    populateAlbumCheckboxes(activity, theme, content, updateBadge, true, onFilterChanged);
                }));

        // 4. Date Interval
        cards.put("dateInterval", addFilterCard(activity, container, density, theme, expandedSet, "Date Interval",
                "Filter by capture or upload timestamps",
                () -> {
                    SimpleDateFormat badgeFmt = new SimpleDateFormat("yyyy/MM/dd", Locale.getDefault());
                    if (currentCriteria.lowerBoundaryDate > 0 && currentCriteria.higherBoundaryDate > 0) {
                        return badgeFmt.format(new Date(currentCriteria.lowerBoundaryDate)) + " - " + badgeFmt.format(new Date(currentCriteria.higherBoundaryDate));
                    } else if (currentCriteria.lowerBoundaryDate > 0) {
                        return "From " + badgeFmt.format(new Date(currentCriteria.lowerBoundaryDate));
                    } else if (currentCriteria.higherBoundaryDate > 0) {
                        return "To " + badgeFmt.format(new Date(currentCriteria.higherBoundaryDate));
                    }
                    return null;
                },
                (content, updateBadge) -> {
                    LinearLayout rowFrom = createDateTimePickerRow(activity, density, theme, "From Date & Time:", currentCriteria.lowerBoundaryDate, epochMs -> {
                        currentCriteria.lowerBoundaryDate = epochMs;
                        updateBadge.run();
                        if (onFilterChanged != null) onFilterChanged.run();
                    });

                    LinearLayout rowTo = createDateTimePickerRow(activity, density, theme, "To Date & Time:", currentCriteria.higherBoundaryDate, epochMs -> {
                        currentCriteria.higherBoundaryDate = epochMs;
                        updateBadge.run();
                        if (onFilterChanged != null) onFilterChanged.run();
                    });
                    addHorizontalOrStackedInputs(activity, content, density, rowFrom, rowTo);

                    RadioGroup rgInt = createRadioGroup(activity, new String[]{"Include Range", "Exclude Range"},
                            "include".equals(currentCriteria.intervalType) ? 0 : 1, theme, idx -> {
                                currentCriteria.intervalType = idx == 0 ? "include" : "exclude";
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rgInt);

                    RadioGroup rgType = createRadioGroup(activity, new String[]{"Date Taken", "Date Uploaded"},
                            "taken".equals(currentCriteria.dateType) ? 0 : 1, theme, idx -> {
                                currentCriteria.dateType = idx == 0 ? "taken" : "uploaded";
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rgType);
                }));

        // 5. Filename Regex
        cards.put("filename", addFilterCard(activity, container, density, theme, expandedSet, "Filename",
                "Regex matching on file name",
                () -> (currentCriteria.fileNameRegex != null && !currentCriteria.fileNameRegex.trim().isEmpty()) ? currentCriteria.fileNameRegex.trim() : null,
                (content, updateBadge) -> {
                    EditText et = createFilterInput(activity, density, theme, "Regex (e.g. ^IMG_.*\\.jpg$)");
                    et.setText(currentCriteria.fileNameRegex != null ? currentCriteria.fileNameRegex : "");
                    et.addTextChangedListener(new DebounceWatcher(s -> {
                        currentCriteria.fileNameRegex = s;
                        updateBadge.run();
                    }, onFilterChanged));
                    content.addView(et);

                    RadioGroup rg = createRadioGroup(activity, new String[]{"Include Matches", "Exclude Matches"},
                            "include".equals(currentCriteria.fileNameMatchType) ? 0 : 1, theme, idx -> {
                                currentCriteria.fileNameMatchType = idx == 0 ? "include" : "exclude";
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 6. Description Regex
        cards.put("description", addFilterCard(activity, container, density, theme, expandedSet, "Description",
                "Regex matching on caption/EXIF",
                () -> (currentCriteria.descriptionRegex != null && !currentCriteria.descriptionRegex.trim().isEmpty()) ? currentCriteria.descriptionRegex.trim() : null,
                (content, updateBadge) -> {
                    EditText et = createFilterInput(activity, density, theme, "Regex (e.g. vacation)");
                    et.setText(currentCriteria.descriptionRegex != null ? currentCriteria.descriptionRegex : "");
                    et.addTextChangedListener(new DebounceWatcher(s -> {
                        currentCriteria.descriptionRegex = s;
                        updateBadge.run();
                    }, onFilterChanged));
                    content.addView(et);

                    RadioGroup rg = createRadioGroup(activity, new String[]{"Include Matches", "Exclude Matches"},
                            "include".equals(currentCriteria.descriptionMatchType) ? 0 : 1, theme, idx -> {
                                currentCriteria.descriptionMatchType = idx == 0 ? "include" : "exclude";
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 7. Space (Inside filters accordion!)
        cards.put("space", addFilterCard(activity, container, density, theme, expandedSet, "Space",
                "Filter storage quota impact",
                () -> currentCriteria.space == StorageScanner.SpaceFilter.CONSUMING ? "Consuming Quota" :
                        currentCriteria.space == StorageScanner.SpaceFilter.NON_CONSUMING ? "Non-Consuming" : null,
                (content, updateBadge) -> {
                    int sel = currentCriteria.space == StorageScanner.SpaceFilter.CONSUMING ? 1 :
                            currentCriteria.space == StorageScanner.SpaceFilter.NON_CONSUMING ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Consuming Quota", "Non-Consuming (Free / 0 B)"},
                            sel, theme, idx -> {
                                currentCriteria.space = idx == 1 ? StorageScanner.SpaceFilter.CONSUMING :
                                        idx == 2 ? StorageScanner.SpaceFilter.NON_CONSUMING : StorageScanner.SpaceFilter.ANY;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 8. Similarity
        cards.put("similarity", addFilterCard(activity, container, density, theme, expandedSet, "Similarity",
                "Group visually similar images via perceptual hashing",
                () -> currentCriteria.similarityThreshold > 0 ? "Threshold " + currentCriteria.similarityThreshold : null,
                (content, updateBadge) -> {
                    TextView tvNote = new TextView(activity);
                    tvNote.setText("Calculates 64-bit dHash/aHash distances between thumbnails to cluster duplicates.\nTip: Filter by Size, Date or Album first to quickly cluster candidates.");
                    tvNote.setTextSize(11.5f);
                    tvNote.setTextColor(theme.textSecondary);
                    tvNote.setPadding(0, 0, 0, (int) (6 * density));
                    content.addView(tvNote);

                    EditText etThresh = createFilterInput(activity, density, theme, "Threshold (0.01 - 1.0, e.g. 0.90)");
                    if (currentCriteria.similarityThreshold > 0) etThresh.setText(String.valueOf(currentCriteria.similarityThreshold));
                    etThresh.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.similarityThreshold = Float.parseFloat(s); } catch (Exception e) { currentCriteria.similarityThreshold = 0; }
                        updateBadge.run();
                    }, onFilterChanged));

                    EditText etH = createFilterInput(activity, density, theme, "Image Hash Size (default: 16)");
                    etH.setText(String.valueOf(currentCriteria.imageHeight));
                    etH.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.imageHeight = Integer.parseInt(s); } catch (Exception e) { currentCriteria.imageHeight = 16; }
                        updateBadge.run();
                    }, onFilterChanged));
                    addHorizontalOrStackedInputs(activity, content, density, etThresh, etH);
                }));

        // 9. Size
        cards.put("size", addFilterCard(activity, container, density, theme, expandedSet, "Size",
                "Filter by file size (bytes or e.g. 5MB, 1.5GB)",
                () -> {
                    if (currentCriteria.lowerBoundarySize > 0 && currentCriteria.higherBoundarySize > 0) {
                        return StorageScanner.formatBytes(currentCriteria.lowerBoundarySize) + " - " + StorageScanner.formatBytes(currentCriteria.higherBoundarySize);
                    } else if (currentCriteria.lowerBoundarySize > 0) {
                        return "> " + StorageScanner.formatBytes(currentCriteria.lowerBoundarySize);
                    } else if (currentCriteria.higherBoundarySize > 0) {
                        return "< " + StorageScanner.formatBytes(currentCriteria.higherBoundarySize);
                    }
                    return null;
                },
                (content, updateBadge) -> {
                    EditText etMin = createFilterInput(activity, density, theme, "More Than (e.g. 5MB, 5000000)");
                    if (currentCriteria.lowerBoundarySize > 0) etMin.setText(StorageScanner.formatBytes(currentCriteria.lowerBoundarySize));
                    etMin.addTextChangedListener(new DebounceWatcher(s -> {
                        currentCriteria.lowerBoundarySize = parseBytesInput(s);
                        updateBadge.run();
                    }, onFilterChanged));

                    EditText etMax = createFilterInput(activity, density, theme, "Less Than (e.g. 50MB, 50000000)");
                    if (currentCriteria.higherBoundarySize > 0) etMax.setText(StorageScanner.formatBytes(currentCriteria.higherBoundarySize));
                    etMax.addTextChangedListener(new DebounceWatcher(s -> {
                        currentCriteria.higherBoundarySize = parseBytesInput(s);
                        updateBadge.run();
                    }, onFilterChanged));
                    addHorizontalOrStackedInputs(activity, content, density, etMin, etMax);
                }));

        // 10. Resolution
        cards.put("resolution", addFilterCard(activity, container, density, theme, expandedSet, "Resolution",
                "Width and height in pixels",
                () -> (currentCriteria.minWidth > 0 || currentCriteria.maxWidth > 0 || currentCriteria.minHeight > 0 || currentCriteria.maxHeight > 0) ? "Resolution set" : null,
                (content, updateBadge) -> {
                    EditText etMinW = createFilterInput(activity, density, theme, "Min Width (px)");
                    if (currentCriteria.minWidth > 0) etMinW.setText(String.valueOf(currentCriteria.minWidth));
                    etMinW.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.minWidth = Integer.parseInt(s); } catch (Exception e) { currentCriteria.minWidth = 0; }
                        updateBadge.run();
                    }, onFilterChanged));

                    EditText etMaxW = createFilterInput(activity, density, theme, "Max Width (px)");
                    if (currentCriteria.maxWidth > 0) etMaxW.setText(String.valueOf(currentCriteria.maxWidth));
                    etMaxW.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.maxWidth = Integer.parseInt(s); } catch (Exception e) { currentCriteria.maxWidth = 0; }
                        updateBadge.run();
                    }, onFilterChanged));
                    addHorizontalOrStackedInputs(activity, content, density, etMinW, etMaxW);

                    EditText etMinH = createFilterInput(activity, density, theme, "Min Height (px)");
                    if (currentCriteria.minHeight > 0) etMinH.setText(String.valueOf(currentCriteria.minHeight));
                    etMinH.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.minHeight = Integer.parseInt(s); } catch (Exception e) { currentCriteria.minHeight = 0; }
                        updateBadge.run();
                    }, onFilterChanged));

                    EditText etMaxH = createFilterInput(activity, density, theme, "Max Height (px)");
                    if (currentCriteria.maxHeight > 0) etMaxH.setText(String.valueOf(currentCriteria.maxHeight));
                    etMaxH.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.maxHeight = Integer.parseInt(s); } catch (Exception e) { currentCriteria.maxHeight = 0; }
                        updateBadge.run();
                    }, onFilterChanged));
                    addHorizontalOrStackedInputs(activity, content, density, etMinH, etMaxH);
                }));

        // 11. Duration
        cards.put("duration", addFilterCard(activity, container, density, theme, expandedSet, "Duration",
                "Video length in seconds",
                () -> (currentCriteria.minDuration > 0 || currentCriteria.maxDuration > 0) ? "Duration set" : null,
                (content, updateBadge) -> {
                    EditText etMinD = createFilterInput(activity, density, theme, "Min Duration (s)");
                    if (currentCriteria.minDuration > 0) etMinD.setText(String.valueOf(currentCriteria.minDuration));
                    etMinD.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.minDuration = Float.parseFloat(s); } catch (Exception e) { currentCriteria.minDuration = 0; }
                        updateBadge.run();
                    }, onFilterChanged));

                    EditText etMaxD = createFilterInput(activity, density, theme, "Max Duration (s)");
                    if (currentCriteria.maxDuration > 0) etMaxD.setText(String.valueOf(currentCriteria.maxDuration));
                    etMaxD.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.maxDuration = Float.parseFloat(s); } catch (Exception e) { currentCriteria.maxDuration = 0; }
                        updateBadge.run();
                    }, onFilterChanged));
                    addHorizontalOrStackedInputs(activity, content, density, etMinD, etMaxD);
                }));

        // 12. Quality
        cards.put("quality", addFilterCard(activity, container, density, theme, expandedSet, "Quality",
                "Storage saver vs original quality",
                () -> "original".equals(currentCriteria.quality) ? "Original" :
                        "storage-saver".equals(currentCriteria.quality) ? "Storage Saver" : null,
                (content, updateBadge) -> {
                    int sel = "original".equals(currentCriteria.quality) ? 1 : "storage-saver".equals(currentCriteria.quality) ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Original", "Storage Saver"},
                            sel, theme, idx -> {
                                currentCriteria.quality = idx == 1 ? "original" : idx == 2 ? "storage-saver" : null;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 13. Type
        cards.put("type", addFilterCard(activity, container, density, theme, expandedSet, "Type",
                "Image, video, or live photo",
                () -> "image".equals(currentCriteria.mediaType) ? "Images" :
                        "video".equals(currentCriteria.mediaType) ? "Videos" :
                                "live".equals(currentCriteria.mediaType) ? "Live Photos" : null,
                (content, updateBadge) -> {
                    int sel = "image".equals(currentCriteria.mediaType) ? 1 : "video".equals(currentCriteria.mediaType) ? 2 : "live".equals(currentCriteria.mediaType) ? 3 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Images", "Videos", "Live Photos"},
                            sel, theme, idx -> {
                                currentCriteria.mediaType = idx == 1 ? "image" : idx == 2 ? "video" : idx == 3 ? "live" : null;
                                Logger.printInfo(() -> "Type filter changed: idx=" + idx + ", mediaType=" + currentCriteria.mediaType);
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 14. Upload Status
        cards.put("uploadStatus", addFilterCard(activity, container, density, theme, expandedSet, "Upload Status",
                "Full vs partial backup",
                () -> "full".equals(currentCriteria.uploadStatus) ? "Full" :
                        "partial".equals(currentCriteria.uploadStatus) ? "Partial" : null,
                (content, updateBadge) -> {
                    int sel = "full".equals(currentCriteria.uploadStatus) ? 1 : "partial".equals(currentCriteria.uploadStatus) ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Full", "Partial"},
                            sel, theme, idx -> {
                                currentCriteria.uploadStatus = idx == 1 ? "full" : idx == 2 ? "partial" : null;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 15. Archived
        cards.put("archive", addFilterCard(activity, container, density, theme, expandedSet, "Archived",
                "Archive status",
                () -> Boolean.TRUE.equals(currentCriteria.archived) ? "Archived" :
                        Boolean.FALSE.equals(currentCriteria.archived) ? "Unarchived" : null,
                (content, updateBadge) -> {
                    int sel = Boolean.TRUE.equals(currentCriteria.archived) ? 1 : Boolean.FALSE.equals(currentCriteria.archived) ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Yes", "No"},
                            sel, theme, idx -> {
                                currentCriteria.archived = idx == 1 ? Boolean.TRUE : idx == 2 ? Boolean.FALSE : null;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 16. Ownership
        cards.put("owned", addFilterCard(activity, container, density, theme, expandedSet, "Ownership",
                "Owned vs not owned",
                () -> Boolean.TRUE.equals(currentCriteria.owned) ? "Owned" :
                        Boolean.FALSE.equals(currentCriteria.owned) ? "Not Owned" : null,
                (content, updateBadge) -> {
                    int sel = Boolean.TRUE.equals(currentCriteria.owned) ? 1 : Boolean.FALSE.equals(currentCriteria.owned) ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Owned", "Not Owned"},
                            sel, theme, idx -> {
                                currentCriteria.owned = idx == 1 ? Boolean.TRUE : idx == 2 ? Boolean.FALSE : null;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 17. Location & Bounding Box
        cards.put("location", addFilterCard(activity, container, density, theme, expandedSet, "Location",
                "GPS coordinates & geographic area",
                () -> Boolean.TRUE.equals(currentCriteria.hasLocation) ? "Has Location" :
                        Boolean.FALSE.equals(currentCriteria.hasLocation) ? "No Location" :
                                (currentCriteria.boundSouth != null || currentCriteria.boundNorth != null) ? "Geo Bounded" : null,
                (content, updateBadge) -> {
                    int sel = Boolean.TRUE.equals(currentCriteria.hasLocation) ? 1 : Boolean.FALSE.equals(currentCriteria.hasLocation) ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Has Location", "No Location"},
                            sel, theme, idx -> {
                                currentCriteria.hasLocation = idx == 1 ? Boolean.TRUE : idx == 2 ? Boolean.FALSE : null;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);

                    EditText etS = createFilterInput(activity, density, theme, "South Latitude (-90 to 90)");
                    etS.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.boundSouth = Double.parseDouble(s); } catch (Exception e) { currentCriteria.boundSouth = null; }
                        updateBadge.run();
                    }, onFilterChanged));
                    content.addView(etS);

                    EditText etN = createFilterInput(activity, density, theme, "North Latitude (-90 to 90)");
                    etN.addTextChangedListener(new DebounceWatcher(s -> {
                        try { currentCriteria.boundNorth = Double.parseDouble(s); } catch (Exception e) { currentCriteria.boundNorth = null; }
                        updateBadge.run();
                    }, onFilterChanged));
                    content.addView(etN);
                }));

        // 18. Favorite
        cards.put("favorite", addFilterCard(activity, container, density, theme, expandedSet, "Favorite",
                "Favorite / starred status",
                () -> Boolean.TRUE.equals(currentCriteria.favorite) ? "Favorited" :
                        Boolean.FALSE.equals(currentCriteria.favorite) ? "Not Favorited" : null,
                (content, updateBadge) -> {
                    int sel = Boolean.TRUE.equals(currentCriteria.favorite) ? 1 : Boolean.FALSE.equals(currentCriteria.favorite) ? 2 : 0;
                    RadioGroup rg = createRadioGroup(activity, new String[]{"Any", "Yes", "No"},
                            sel, theme, idx -> {
                                currentCriteria.favorite = idx == 1 ? Boolean.TRUE : idx == 2 ? Boolean.FALSE : null;
                                updateBadge.run();
                                if (onFilterChanged != null) onFilterChanged.run();
                            });
                    content.addView(rg);
                }));

        // 19. Exclude Shared Links
        cards.put("excludeShared", addFilterCard(activity, container, density, theme, expandedSet, "Exclude Shared",
                "Omit shared links",
                () -> currentCriteria.excludeShared ? "Active" : null,
                (content, updateBadge) -> {
                    CheckBox cbShared = new CheckBox(activity);
                    cbShared.setText("Exclude Shared Links");
                    cbShared.setTextColor(theme.textPrimary);
                    cbShared.setChecked(currentCriteria.excludeShared);
                    cbShared.setOnCheckedChangeListener((b, c) -> {
                        currentCriteria.excludeShared = c;
                        updateBadge.run();
                        if (onFilterChanged != null) onFilterChanged.run();
                    });
                    content.addView(cbShared);
                }));

        // 20. Exclude Favorites
        cards.put("excludeFavorites", addFilterCard(activity, container, density, theme, expandedSet, "Exclude Favorites",
                "Omit favorited items",
                () -> currentCriteria.excludeFavorites ? "Active" : null,
                (content, updateBadge) -> {
                    CheckBox cbFav = new CheckBox(activity);
                    cbFav.setText("Exclude Favorites");
                    cbFav.setTextColor(theme.textPrimary);
                    cbFav.setChecked(currentCriteria.excludeFavorites);
                    cbFav.setOnCheckedChangeListener((b, c) -> {
                        currentCriteria.excludeFavorites = c;
                        updateBadge.run();
                        if (onFilterChanged != null) onFilterChanged.run();
                    });
                    content.addView(cbFav);
                }));

        // 21. Sort by Size
        cards.put("sortBySize", addFilterCard(activity, container, density, theme, expandedSet, "Sorting",
                "Result sort order",
                () -> currentCriteria.sortBySize ? "Sort by size" : null,
                (content, updateBadge) -> {
                    CheckBox cbSort = new CheckBox(activity);
                    cbSort.setText("Sort by size");
                    cbSort.setTextColor(theme.textPrimary);
                    cbSort.setChecked(currentCriteria.sortBySize);
                    cbSort.setOnCheckedChangeListener((b, c) -> {
                        currentCriteria.sortBySize = c;
                        updateBadge.run();
                        if (onFilterChanged != null) onFilterChanged.run();
                    });
                    content.addView(cbSort);
                }));

        sRepopulateAlbumCardsRunnable = () -> {
            activity.runOnUiThread(() -> {
                if (includeAlbumsContentRef[0] != null) {
                    populateAlbumCheckboxes(activity, theme, includeAlbumsContentRef[0], includeAlbumsBadgeRef[0], false, onFilterChanged);
                }
                if (excludeAlbumsContentRef[0] != null) {
                    populateAlbumCheckboxes(activity, theme, excludeAlbumsContentRef[0], excludeAlbumsBadgeRef[0], true, onFilterChanged);
                }
            });
        };

        return cards;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // STEP 3: Choose Action Grid Builder (All 14 Actions from user.js)
    // ─────────────────────────────────────────────────────────────────────────
    public interface ItemsProvider {
        List<StorageScanner.MediaItem> get();
    }

    private static void performActionClick(Activity activity, String actionId, String actionLabel,
                                           ItemsProvider itemsProvider, Runnable[] refreshRunner,
                                           float density, Theme theme) {
        List<StorageScanner.MediaItem> items = itemsProvider.get();
        if (items.isEmpty()) {
            if ("toTrash".equals(actionId) && currentCriteria.source == StorageScanner.SourceType.ALBUMS && !currentCriteria.albumsInclude.isEmpty()) {
                String param = TextUtils.join(",", currentCriteria.albumsInclude);
                showActionConfirmDialog(activity, "Delete " + currentCriteria.albumsInclude.size() + " empty album(s)?", () -> {
                    executeDbActionAsync(activity, actionId, items, param, refreshRunner);
                }, density, theme);
                return;
            }
            Toast.makeText(activity, "No matching items to perform " + actionLabel, Toast.LENGTH_SHORT).show();
            return;
        }

        if ("exportDcim".equals(actionId)) {
            exportItemsToDcim(activity, items, density, theme);
        } else if ("exportMetadata".equals(actionId)) {
            exportCsvFile(activity, items);
        } else if ("toNewAlbum".equals(actionId)) {
            showNewAlbumDialog(activity, items, refreshRunner, density, theme);
        } else if ("toExistingAlbum".equals(actionId)) {
            showAlbumPickerDialog(activity, items, refreshRunner, density, theme);
        } else if ("removeFromAlbum".equals(actionId)) {
            String param = (currentCriteria.source == StorageScanner.SourceType.ALBUMS && !currentCriteria.albumsInclude.isEmpty())
                    ? TextUtils.join(",", currentCriteria.albumsInclude) : null;
            showActionConfirmDialog(activity, "Remove " + items.size() + " item(s) from album?", () -> {
                executeDbActionAsync(activity, actionId, items, param, refreshRunner);
            }, density, theme);
        } else if ("lock".equals(actionId)) {
            int count = items.size();
            String title = (count == 1) ? "Move to Locked Folder?" : ("Move " + count + " items to Locked Folder?");
            int accountId = (currentAccount != null) ? currentAccount.accountId : -1;
            boolean backupEnabled = StorageScanner.isLockedFolderBackupEnabled(activity, accountId);
            String msg = backupEnabled
                    ? "These photos & videos will be hidden and won’t show up as you scroll through Google Photos or in other apps."
                    : "These photos & videos will be hidden and won’t show up as you scroll through Google Photos or in other apps, and won’t be backed up.";
            showActionConfirmDialog(activity, title, msg, "Move", () -> {
                executeDbActionAsync(activity, actionId, items, null, refreshRunner);
            }, density, theme);
        } else if ("unLock".equals(actionId)) {
            int count = items.size();
            String title = (count == 1) ? "Move out of Locked Folder?" : ("Move " + count + " items out of Locked Folder?");
            int accountId = (currentAccount != null) ? currentAccount.accountId : -1;
            boolean lockerBackupEnabled = StorageScanner.isLockedFolderBackupEnabled(activity, accountId);
            int localCount = 0;
            for (StorageScanner.MediaItem it : items) {
                boolean backedUp = it.isCloudBackedUp || StorageScanner.isItemCloudBackedUp(it);
                if (!lockerBackupEnabled || !backedUp) {
                    localCount++;
                }
            }
            StringBuilder msgBuilder = new StringBuilder();
            if (localCount == 0) {
                msgBuilder.append("These photos & videos will be moved out of Locked Folder and will appear in your Google Photos library.");
            } else {
                msgBuilder.append("These photos & videos will no longer be hidden and can now show up as you scroll through Google Photos or in other apps.");
                msgBuilder.append("\n\n⚠️ Storage Notice:\n");
                if (localCount == count) {
                    msgBuilder.append("These items are stored locally only without cloud backup. Moving them out will place them into local device storage (under device folders, e.g. DCIM/Pictures) and will not appear in your cloud photos timeline until backed up.");
                } else {
                    msgBuilder.append(localCount).append(" of these items are stored locally only without cloud backup. Moving them out will place them into local device storage (under device folders, e.g. DCIM/Pictures) and will not appear in your cloud photos timeline until backed up.");
                }
            }
            showActionConfirmDialog(activity, title, msgBuilder.toString(), "Move out", () -> {
                executeDbActionAsync(activity, actionId, items, null, refreshRunner);
            }, density, theme);
        } else if ("setDateFromFilename".equals(actionId)) {
            showActionConfirmDialog(activity, "Update date from filename for " + items.size() + " item(s)?", () -> {
                executeDbActionAsync(activity, actionId, items, null, refreshRunner);
            }, density, theme);
        } else if ("toTrash".equals(actionId)) {
            String param = null;
            String confirmMsg;
            if (currentCriteria.source == StorageScanner.SourceType.ALBUMS && !currentCriteria.albumsInclude.isEmpty()) {
                param = TextUtils.join(",", currentCriteria.albumsInclude);
                confirmMsg = "Move " + items.size() + " items to Trash and delete " + currentCriteria.albumsInclude.size() + " album(s)?";
            } else {
                confirmMsg = "Move " + items.size() + " items to Trash?";
            }
            final String targetAlbumKeys = param;
            showActionConfirmDialog(activity, confirmMsg, () -> {
                executeDbActionAsync(activity, actionId, items, targetAlbumKeys, refreshRunner);
            }, density, theme);
        } else {
            executeDbActionAsync(activity, actionId, items, null, refreshRunner);
        }
    }

    private static LinearLayout buildActionButtonsGrid(Activity activity, float density, Theme theme,
                                                        ItemsProvider itemsProvider, Runnable[] refreshRunner,
                                                        Map<String, TextView> actionButtonsOut) {
        LinearLayout container = new LinearLayout(activity);
        container.setOrientation(LinearLayout.VERTICAL);

        String[][] actions = new String[][]{
                {"toNewAlbum", "New Album"},
                {"toExistingAlbum", "Add to Album"},
                {"removeFromAlbum", "Remove from Album"},
                {"setDateFromFilename", "Date from Name"},
                {"toArchive", "Archive"},
                {"unArchive", "Un-Archive"},
                {"toFavorite", "Favorite"},
                {"unFavorite", "Un-Favorite"},
                {"lock", "Move to Locker"},
                {"unLock", "Unlock"},
                {"toTrash", "Trash"},
                {"restoreTrash", "Restore"},
                {"exportDcim", "Export to DCIM"},
                {"exportMetadata", "Export Metadata (CSV)"}
        };

        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);
        boolean isLandscape = activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        int actionCols = isLarge ? (isLandscape ? 4 : 3) : 2;

        LinearLayout currentRow = null;
        for (int i = 0; i < actions.length; i++) {
            final String actionId = actions[i][0];
            final String actionLabel = actions[i][1];

            if (i % actionCols == 0) {
                currentRow = new LinearLayout(activity);
                currentRow.setOrientation(LinearLayout.HORIZONTAL);
                currentRow.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                container.addView(currentRow);
            }

            TextView btn = new TextView(activity);
            btn.setText(actionLabel);
            btn.setTextSize(isLarge && isLandscape ? 11f : 12.5f);
            btn.setTypeface(null, Typeface.BOLD);
            btn.setTextColor(theme.textPrimary);
            btn.setGravity(Gravity.CENTER);
            btn.setClickable(true);
            btn.setFocusable(true);
            int padV = (int) ((isLarge && isLandscape ? 5 : 9) * density);
            int padH = (int) ((isLarge && isLandscape ? 4 : 8) * density);
            btn.setPadding(padH, padV, padH, padV);
            if (isLarge && isLandscape) {
                btn.setMinHeight((int) (32 * density));
            }
            btn.setBackground(createActionPillDrawable(theme.surfaceContainer, 12 * density));

            LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            bLp.bottomMargin = (int) ((isLarge && isLandscape ? 4 : 6) * density);
            if (i % actionCols != actionCols - 1) bLp.rightMargin = (int) (6 * density);
            btn.setLayoutParams(bLp);

            btn.setOnClickListener(v -> {
                if (btn.getAlpha() < 0.6f) {
                    // Action disabled for current source/context
                    String disabledHint = getActionDisabledHint(actionId, currentCriteria);
                    Toast.makeText(activity, disabledHint != null ? disabledHint : "Action not applicable for current source", Toast.LENGTH_SHORT).show();
                    return;
                }
                performActionClick(activity, actionId, actionLabel, itemsProvider, refreshRunner, density, theme);
            });

            if (actionButtonsOut != null) actionButtonsOut.put(actionId, btn);
            if (currentRow != null) currentRow.addView(btn);
        }

        int remainder = actions.length % actionCols;
        if (remainder != 0 && currentRow != null) {
            for (int r = remainder; r < actionCols; r++) {
                View emptySpacer = new View(activity);
                LinearLayout.LayoutParams spLp = new LinearLayout.LayoutParams(0, 0, 1f);
                if (r < actionCols - 1) spLp.rightMargin = (int) (6 * density);
                emptySpacer.setLayoutParams(spLp);
                currentRow.addView(emptySpacer);
            }
        }

        return container;
    }

    private static String getActionDisabledHint(String actionId, StorageScanner.FilterCriteria crit) {
        if ("toTrash".equals(actionId)) {
            return "Items are already in Trash";
        }
        if ("restoreTrash".equals(actionId)) return "Source must be Trash to restore items";
        if ("toArchive".equals(actionId)) {
            if (crit.source == StorageScanner.SourceType.LOCKED) return "Cannot archive items in Locked Folder";
            return "Items are already archived";
        }
        if ("unArchive".equals(actionId)) return "Items are not archived";
        if ("toFavorite".equals(actionId)) {
            if (crit.source == StorageScanner.SourceType.LOCKED) return "Cannot favorite items in Locked Folder";
            return "Items are already favorited";
        }
        if ("unFavorite".equals(actionId)) return "Items are not favorited";
        if ("removeFromAlbum".equals(actionId)) return "Source must be Albums with an active album selected";
        if ("lock".equals(actionId)) {
            if (crit.source == StorageScanner.SourceType.LOCKED) return "Items are already in Locked Folder";
            if (crit.source == StorageScanner.SourceType.TRASH) return "Cannot move Trash items to Locked Folder";
            return null;
        }
        if ("unLock".equals(actionId)) return "Source must be Locked Folder to unlock items";
        if ("setDateFromFilename".equals(actionId)) return "Cannot update date for items in Trash";
        if ("toNewAlbum".equals(actionId) || "toExistingAlbum".equals(actionId)) {
            if (crit.source == StorageScanner.SourceType.TRASH) return "Cannot add Trash items to albums";
        }
        return null;
    }

    private static void updateActionStates(StorageScanner.SourceType src, StorageScanner.FilterCriteria crit, Map<String, TextView> actionButtons) {
        if (actionButtons == null || actionButtons.isEmpty()) return;

        boolean isLocked = (src == StorageScanner.SourceType.LOCKED);
        boolean isTrash = (src == StorageScanner.SourceType.TRASH);

        boolean archivedOnly = Boolean.TRUE.equals(crit.archived);
        boolean archivedExcluded = Boolean.FALSE.equals(crit.archived);
        boolean favoritesOnly = Boolean.TRUE.equals(crit.favorite) || src == StorageScanner.SourceType.FAVORITES;
        boolean favoritesExcluded = Boolean.FALSE.equals(crit.favorite) || crit.excludeFavorites;

        setActionState(actionButtons.get("toNewAlbum"), !isTrash);
        setActionState(actionButtons.get("toExistingAlbum"), !isTrash);
        setActionState(actionButtons.get("removeFromAlbum"), !isLocked && src == StorageScanner.SourceType.ALBUMS && !crit.albumsInclude.isEmpty());

        setActionState(actionButtons.get("toTrash"), !isTrash);
        setActionState(actionButtons.get("restoreTrash"), isTrash);

        setActionState(actionButtons.get("toArchive"), !isLocked && !isTrash && !archivedOnly);
        setActionState(actionButtons.get("unArchive"), !isLocked && !isTrash && !archivedExcluded);

        setActionState(actionButtons.get("toFavorite"), !isLocked && !isTrash && !favoritesOnly && src != StorageScanner.SourceType.FAVORITES);
        setActionState(actionButtons.get("unFavorite"), !isLocked && !isTrash && !favoritesExcluded);

        setActionState(actionButtons.get("lock"), !isTrash && !isLocked);
        setActionState(actionButtons.get("unLock"), isLocked);
        setActionState(actionButtons.get("setDateFromFilename"), !isTrash);
        setActionState(actionButtons.get("exportMetadata"), true);
    }

    private static void setActionState(TextView btn, boolean enabled) {
        if (btn == null) return;
        btn.setAlpha(enabled ? 1.0f : 0.35f);
    }

    private static void showNewAlbumDialog(Activity activity, List<StorageScanner.MediaItem> items, Runnable[] refreshRunner, float density, Theme theme) {
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackground(createRoundedDrawable(theme.surface, 20 * density));
        int p = (int) (20 * density);
        box.setPadding(p, p, p, (int) (14 * density));

        TextView tv = new TextView(activity);
        tv.setText("Add " + items.size() + " items to New Album");
        tv.setTextSize(15f);
        tv.setTextColor(theme.textPrimary);
        tv.setTypeface(null, Typeface.BOLD);
        box.addView(tv);

        EditText et = createFilterInput(activity, density, theme, "Album title...");
        LinearLayout.LayoutParams etLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        etLp.topMargin = (int) (12 * density);
        etLp.bottomMargin = (int) (12 * density);
        et.setLayoutParams(etLp);
        box.addView(et);

        LinearLayout btnRow = new LinearLayout(activity);
        btnRow.setOrientation(LinearLayout.HORIZONTAL);
        btnRow.setGravity(Gravity.END);

        TextView btnCancel = new TextView(activity);
        btnCancel.setText("Cancel");
        btnCancel.setTextSize(13f);
        btnCancel.setTextColor(theme.primary);
        btnCancel.setPadding((int) (14 * density), (int) (8 * density), (int) (14 * density), (int) (8 * density));
        btnCancel.setBackground(createActionPillDrawable(theme.surfaceContainer, 14 * density));
        btnCancel.setOnClickListener(v -> d.dismiss());
        btnRow.addView(btnCancel);

        TextView btnCreate = new TextView(activity);
        btnCreate.setText("Create & Add");
        btnCreate.setTextSize(13f);
        btnCreate.setTypeface(null, Typeface.BOLD);
        btnCreate.setTextColor(theme.onPrimary);
        btnCreate.setPadding((int) (16 * density), (int) (8 * density), (int) (16 * density), (int) (8 * density));
        btnCreate.setBackground(createActionPillDrawable(theme.primary, 14 * density));
        LinearLayout.LayoutParams okLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        okLp.leftMargin = (int) (8 * density);
        btnCreate.setLayoutParams(okLp);
        btnCreate.setOnClickListener(v -> {
            String title = et.getText() != null ? et.getText().toString().trim() : "";
            if (title.isEmpty()) {
                Toast.makeText(activity, "Please enter an album title", Toast.LENGTH_SHORT).show();
                return;
            }
            d.dismiss();
            executeDbActionAsync(activity, "toNewAlbum", items, title, refreshRunner);
        });
        btnRow.addView(btnCreate);

        box.addView(btnRow);
        d.setContentView(box);
        d.show();

        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout((int) (screenWidth * 0.90f), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private static void showAlbumPickerDialog(Activity activity, List<StorageScanner.MediaItem> items, Runnable[] refreshRunner, float density, Theme theme) {
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackground(createRoundedDrawable(theme.surface, 20 * density));
        int p = (int) (16 * density);
        box.setPadding(p, p, p, (int) (12 * density));

        TextView tv = new TextView(activity);
        tv.setText("Select Album (" + items.size() + " items)");
        tv.setTextSize(15f);
        tv.setTextColor(theme.textPrimary);
        tv.setTypeface(null, Typeface.BOLD);
        tv.setPadding(0, 0, 0, (int) (8 * density));
        box.addView(tv);

        EditText etSearch = createFilterInput(activity, density, theme, "Search album...");
        box.addView(etSearch);

        ScrollView sv = new ScrollView(activity);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (260 * density));
        svLp.topMargin = (int) (6 * density);
        svLp.bottomMargin = (int) (10 * density);
        sv.setLayoutParams(svLp);

        LinearLayout albumListLayout = new LinearLayout(activity);
        albumListLayout.setOrientation(LinearLayout.VERTICAL);
        sv.addView(albumListLayout);
        box.addView(sv);

        // Load albums in background
        THREAD_POOL.execute(() -> {
            List<StorageScanner.AlbumInfo> allAlbums = StorageScanner.getAvailableAlbums(currentAccount);
            MAIN_HANDLER.post(() -> {
                Runnable populate = () -> {
                    albumListLayout.removeAllViews();
                    String query = etSearch.getText() != null ? etSearch.getText().toString().trim().toLowerCase() : "";
                    int shown = 0;
                    for (StorageScanner.AlbumInfo alb : allAlbums) {
                        if (!query.isEmpty() && !alb.title.toLowerCase().contains(query)) {
                            continue;
                        }
                        shown++;
                        TextView albRow = new TextView(activity);
                        albRow.setText(alb.title + " (" + alb.itemCount + ")");
                        albRow.setTextSize(13f);
                        albRow.setTextColor(theme.textPrimary);
                        albRow.setPadding((int) (12 * density), (int) (10 * density), (int) (12 * density), (int) (10 * density));
                        albRow.setBackground(createActionPillDrawable(theme.surfaceContainer, 10 * density));
                        albRow.setClickable(true);
                        albRow.setFocusable(true);
                        LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                        rLp.bottomMargin = (int) (4 * density);
                        albRow.setLayoutParams(rLp);

                        albRow.setOnClickListener(v -> {
                            d.dismiss();
                            executeDbActionAsync(activity, "toExistingAlbum", items, alb.mediaKey, refreshRunner);
                        });
                        albumListLayout.addView(albRow);
                    }
                    if (shown == 0) {
                        TextView tvEmpty = new TextView(activity);
                        tvEmpty.setText("No albums found.");
                        tvEmpty.setTextSize(12.5f);
                        tvEmpty.setTextColor(theme.textSecondary);
                        tvEmpty.setGravity(Gravity.CENTER);
                        tvEmpty.setPadding(0, (int) (16 * density), 0, (int) (16 * density));
                        albumListLayout.addView(tvEmpty);
                    }
                };

                populate.run();
                etSearch.addTextChangedListener(new TextWatcher() {
                    @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                    @Override public void onTextChanged(CharSequence s, int start, int before, int count) { populate.run(); }
                    @Override public void afterTextChanged(Editable s) {}
                });
            });
        });

        LinearLayout btnRow = new LinearLayout(activity);
        btnRow.setOrientation(LinearLayout.HORIZONTAL);
        btnRow.setGravity(Gravity.END);

        TextView btnCancel = new TextView(activity);
        btnCancel.setText("Cancel");
        btnCancel.setTextSize(13f);
        btnCancel.setTextColor(theme.primary);
        btnCancel.setPadding((int) (14 * density), (int) (8 * density), (int) (14 * density), (int) (8 * density));
        btnCancel.setBackground(createActionPillDrawable(theme.surfaceContainer, 14 * density));
        btnCancel.setOnClickListener(v -> d.dismiss());
        btnRow.addView(btnCancel);

        box.addView(btnRow);
        d.setContentView(box);
        d.show();

        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout((int) (screenWidth * 0.90f), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private static void executeDbActionAsync(Activity activity, String actionId, List<StorageScanner.MediaItem> items, String param, Runnable[] refreshRunner) {
        MAIN_HANDLER.post(() -> {
            if (sProgressBar != null) sProgressBar.setVisibility(View.VISIBLE);
            if (sTvProgressInfo != null) {
                sTvProgressInfo.setText("Processing " + (items != null ? items.size() : 0) + " items...");
                sTvProgressInfo.setVisibility(View.VISIBLE);
            }
        });
        StorageScanner.sActionProgressCallback = msg -> {
            MAIN_HANDLER.post(() -> {
                if (sTvProgressInfo != null) {
                    sTvProgressInfo.setText(msg);
                    sTvProgressInfo.setVisibility(View.VISIBLE);
                }
            });
        };
        THREAD_POOL.execute(() -> {
            StorageScanner.ActionResult res = StorageScanner.executeDatabaseAction(activity, currentAccount, actionId, items, param);
            StorageScanner.sActionProgressCallback = null;
            MAIN_HANDLER.post(() -> {
                if (sProgressBar != null) sProgressBar.setVisibility(View.GONE);
                if (sTvProgressInfo != null) {
                    sTvProgressInfo.setText("");
                    sTvProgressInfo.setVisibility(View.GONE);
                }
                Toast.makeText(activity, res.message, Toast.LENGTH_SHORT).show();
                if (res.success) {
                    if ("toTrash".equals(actionId) && currentCriteria.source == StorageScanner.SourceType.ALBUMS) {
                        currentCriteria.albumsInclude.clear();
                    }
                    if (currentAccount != null) {
                        availableAlbums = StorageScanner.getAvailableAlbums(currentAccount);
                        if (sRepopulateAlbumCardsRunnable != null) {
                            sRepopulateAlbumCardsRunnable.run();
                        }
                    }
                    if (refreshRunner != null && refreshRunner[0] != null) {
                        refreshRunner[0].run();
                    }
                }
            });
        });
    }

    private static void exportCsvFile(Activity activity, List<StorageScanner.MediaItem> items) {
        THREAD_POOL.execute(() -> {
            try {
                File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
                if (!dir.exists()) dir.mkdirs();
                String name = "Google_Photos_Toolkit_" + FILE_DATE_FORMAT.format(new Date()) + ".csv";
                File file = new File(dir, name);
                String csv = StorageScanner.exportToCsv(items);
                try (FileOutputStream fos = new FileOutputStream(file)) {
                    fos.write(csv.getBytes(StandardCharsets.UTF_8));
                }
                MAIN_HANDLER.post(() -> {
                    Toast.makeText(activity, "Saved CSV with " + items.size() + " items to Download/" + name, Toast.LENGTH_LONG).show();
                });
            } catch (Throwable t) {
                MAIN_HANDLER.post(() -> {
                    Toast.makeText(activity, "Export failed: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                });
            }
        });
    }

    private static void sortMediaItems(List<StorageScanner.MediaItem> items, SortOrder order) {
        if (items == null || items.size() <= 1) return;
        items.sort((a, b) -> {
            switch (order) {
                case DATE_ASC:
                    return Long.compare(a.captureTimestamp, b.captureTimestamp);
                case SIZE_DESC:
                    return Long.compare(b.sizeBytes, a.sizeBytes);
                case SIZE_ASC:
                    return Long.compare(a.sizeBytes, b.sizeBytes);
                case QUOTA_DESC:
                    int qComp = Long.compare(b.quotaBytes > 0 ? 1 : 0, a.quotaBytes > 0 ? 1 : 0);
                    if (qComp != 0) return qComp;
                    return Long.compare(b.quotaBytes, a.quotaBytes);
                case NAME_ASC:
                    String na = a.filename != null ? a.filename : "";
                    String nb = b.filename != null ? b.filename : "";
                    return na.compareToIgnoreCase(nb);
                case DATE_DESC:
                default:
                    return Long.compare(b.captureTimestamp, a.captureTimestamp);
            }
        });
    }

    private static void showSortPickerDialog(Activity activity, Runnable onSortChanged, float density, Theme theme) {
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackground(createRoundedDrawable(theme.surface, 20 * density));
        int p = (int) (18 * density);
        box.setPadding(p, p, p, (int) (14 * density));

        TextView tv = new TextView(activity);
        tv.setText("Sort Results By");
        tv.setTextSize(15f);
        tv.setTextColor(theme.textPrimary);
        tv.setTypeface(null, Typeface.BOLD);
        box.addView(tv);

        TextView sub = new TextView(activity);
        sub.setText("Choose sorting criteria for matched items:");
        sub.setTextSize(11.5f);
        sub.setTextColor(theme.textSecondary);
        sub.setPadding(0, (int) (4 * density), 0, (int) (10 * density));
        box.addView(sub);

        for (SortOrder order : SortOrder.values()) {
            boolean isCur = (order == currentSortOrder);

            LinearLayout optRow = new LinearLayout(activity);
            optRow.setOrientation(LinearLayout.HORIZONTAL);
            optRow.setGravity(Gravity.CENTER_VERTICAL);
            optRow.setPadding((int) (12 * density), (int) (10 * density), (int) (12 * density), (int) (10 * density));
            optRow.setBackground(createActionPillDrawable(isCur ? theme.primaryContainer : theme.surfaceContainer, 10 * density));
            LinearLayout.LayoutParams oLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            oLp.bottomMargin = (int) (6 * density);
            optRow.setLayoutParams(oLp);

            TextView optTv = new TextView(activity);
            optTv.setText(order.fullLabel);
            optTv.setTextSize(12.5f);
            optTv.setTypeface(null, isCur ? Typeface.BOLD : Typeface.NORMAL);
            optTv.setTextColor(isCur ? theme.onPrimaryContainer : theme.textPrimary);
            optRow.addView(optTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            if (isCur) {
                TextView check = new TextView(activity);
                check.setText("✓");
                check.setTextSize(13f);
                check.setTypeface(null, Typeface.BOLD);
                check.setTextColor(theme.primary);
                optRow.addView(check);
            }

            optRow.setClickable(true);
            optRow.setFocusable(true);
            optRow.setOnClickListener(v -> {
                currentSortOrder = order;
                d.dismiss();
                if (onSortChanged != null) onSortChanged.run();
            });
            box.addView(optRow);
        }

        d.setContentView(box);
        d.show();

        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int sw = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (sw * 0.88f), (int) (380 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private static void copyFile(File src, File dst) throws Exception {
        try (InputStream in = new FileInputStream(src);
             FileOutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[65536];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            out.flush();
        }
    }

    private static File downloadRemoteFileGlide(Context context, String urlStr, int accountId) {
        if (urlStr == null || urlStr.trim().isEmpty()) return null;
        if (context == null) context = app.morphe.extension.shared.Utils.getContext();
        if (context == null) return null;

        try {
            Object requestManager = getGlideRequestManager(context);
            if (requestManager == null) return null;

            // Find as(Class) method
            Object fileReqBuilder = null;
            for (Method m : requestManager.getClass().getMethods()) {
                Class<?>[] pt = m.getParameterTypes();
                if (pt.length == 1 && pt[0] == Class.class && m.getReturnType() != void.class) {
                    try {
                        fileReqBuilder = m.invoke(requestManager, File.class);
                        if (fileReqBuilder != null) break;
                    } catch (Throwable ignored) {}
                }
            }

            if (fileReqBuilder == null) return null;
            Object req = loadGlideRequestBuilder(fileReqBuilder, urlStr, accountId);
            if (req != null) {
                for (Method m : req.getClass().getMethods()) {
                    Class<?>[] pt = m.getParameterTypes();
                    if (pt.length == 2 && pt[0] == int.class && pt[1] == int.class && java.util.concurrent.Future.class.isAssignableFrom(m.getReturnType())) {
                        java.util.concurrent.Future<?> future = (java.util.concurrent.Future<?>) m.invoke(req, Integer.MIN_VALUE, Integer.MIN_VALUE);
                        if (future != null) {
                            Object res = future.get(35, java.util.concurrent.TimeUnit.SECONDS);
                            if (res instanceof File) {
                                File f = (File) res;
                                if (f.exists() && f.length() > 0) {
                                    Logger.printInfo(() -> "downloadRemoteFileGlide downloaded full-res file: " + f.length() + " bytes");
                                    return f;
                                }
                            }
                        }
                        break;
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> "downloadRemoteFileGlide error: " + t.getMessage());
        }
        return null;
    }

    private static void downloadRemoteFile(String urlStr, File dst) throws Exception {
        URL u = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) u.openConnection();
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(15000);
        conn.setInstanceFollowRedirects(true);
        try (InputStream in = conn.getInputStream();
             FileOutputStream out = new FileOutputStream(dst)) {
            byte[] buf = new byte[65536];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            out.flush();
        }
    }

    private static void exportItemsToDcim(Activity activity, List<StorageScanner.MediaItem> items, float density, Theme theme) {
        if (items == null || items.isEmpty()) return;

        Dialog progressDialog = new Dialog(activity);
        progressDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        progressDialog.setCancelable(false);

        LinearLayout pRoot = new LinearLayout(activity);
        pRoot.setOrientation(LinearLayout.VERTICAL);
        pRoot.setPadding((int) (20 * density), (int) (18 * density), (int) (20 * density), (int) (18 * density));
        pRoot.setBackground(createRoundedDrawable(theme.surface, 20 * density));

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Exporting to DCIM");
        tvTitle.setTextSize(16f);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setTextColor(theme.textPrimary);
        pRoot.addView(tvTitle);

        TextView tvStatus = new TextView(activity);
        tvStatus.setText("Preparing 0 / " + items.size() + "...");
        tvStatus.setTextSize(12f);
        tvStatus.setTextColor(theme.textSecondary);
        tvStatus.setPadding(0, (int) (6 * density), 0, (int) (12 * density));
        pRoot.addView(tvStatus);

        ProgressBar pBar = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        pBar.setMax(items.size());
        pBar.setProgress(0);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            pBar.setProgressTintList(ColorStateList.valueOf(theme.primary));
        }
        LinearLayout.LayoutParams pLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (6 * density));
        pRoot.addView(pBar, pLp);

        TextView btnCancel = new TextView(activity);
        btnCancel.setText("Cancel");
        btnCancel.setTextSize(12f);
        btnCancel.setTypeface(null, Typeface.BOLD);
        btnCancel.setTextColor(theme.primary);
        btnCancel.setGravity(Gravity.END);
        btnCancel.setPadding(0, (int) (12 * density), 0, 0);
        final boolean[] isCancelled = new boolean[]{false};
        btnCancel.setOnClickListener(v -> {
            isCancelled[0] = true;
            btnCancel.setText("Cancelling...");
        });
        pRoot.addView(btnCancel);

        progressDialog.setContentView(pRoot);
        progressDialog.show();
        Window pw = progressDialog.getWindow();
        if (pw != null) {
            pw.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int sw = activity.getResources().getDisplayMetrics().widthPixels;
            pw.setLayout(Math.min((int) (sw * 0.88f), (int) (400 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
        }

        THREAD_POOL.execute(() -> {
            int successCount = 0;
            int skippedCount = 0;
            List<String> exportedPaths = new ArrayList<>();
            File dcimDir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "GooglePhotos_Export");
            if (!dcimDir.exists()) dcimDir.mkdirs();

            for (int i = 0; i < items.size(); i++) {
                if (isCancelled[0]) break;
                StorageScanner.MediaItem item = items.get(i);
                final int currentIdx = i + 1;
                MAIN_HANDLER.post(() -> {
                    tvStatus.setText("Exporting " + currentIdx + " of " + items.size() + "\n" + (item.filename != null ? item.filename : "item"));
                    pBar.setProgress(currentIdx);
                });

                try {
                    String baseName = (item.filename != null && !item.filename.trim().isEmpty())
                            ? item.filename.trim()
                            : ("photo_" + item.captureTimestamp + (item.mimeType != null && item.mimeType.contains("video") ? ".mp4" : ".jpg"));
                    if (!baseName.contains(".")) {
                        baseName += (item.mimeType != null && item.mimeType.contains("video")) ? ".mp4" : ".jpg";
                    }

                    File destFile = new File(dcimDir, baseName);
                    int count = 1;
                    while (destFile.exists()) {
                        int dot = baseName.lastIndexOf('.');
                        if (dot > 0) {
                            destFile = new File(dcimDir, baseName.substring(0, dot) + "_" + count + baseName.substring(dot));
                        } else {
                            destFile = new File(dcimDir, baseName + "_" + count);
                        }
                        count++;
                    }

                    boolean copied = false;
                    // 1. Direct file path from remoteUrl
                    if (item.remoteUrl != null && (item.remoteUrl.startsWith("/") || item.remoteUrl.startsWith("file://"))) {
                        String localP = item.remoteUrl.startsWith("file://") ? item.remoteUrl.substring(7) : item.remoteUrl;
                        File localFile = new File(localP);
                        if (localFile.exists() && localFile.canRead()) {
                            copyFile(localFile, destFile);
                            copied = destFile.exists() && destFile.length() > 0;
                        }
                    }

                    // 2. Query local_media SQLite path via dedupKey
                    if (!copied && currentAccount != null) {
                        String localDbPath = StorageScanner.resolveLocalFilePath(currentAccount, item.dedupKey);
                        if (localDbPath != null) {
                            File lf = new File(localDbPath);
                            if (lf.exists() && lf.canRead()) {
                                copyFile(lf, destFile);
                                copied = destFile.exists() && destFile.length() > 0;
                            }
                        }
                    }

                    // 3. Authenticated Google Photos Glide download
                    if (!copied && item.remoteUrl != null && (item.remoteUrl.startsWith("http://") || item.remoteUrl.startsWith("https://"))) {
                        int accountId = currentAccount != null ? currentAccount.accountId : -1;
                        File remoteCachedFile = downloadRemoteFileGlide(activity, item.remoteUrl, accountId);
                        if (remoteCachedFile != null && remoteCachedFile.exists() && remoteCachedFile.length() > 0) {
                            copyFile(remoteCachedFile, destFile);
                            copied = destFile.exists() && destFile.length() > 0;
                        }

                        // 3b. Fallback to cached bitmap from fetchThumbSync if full-res network download failed
                        if (!copied) {
                            Bitmap bm = fetchThumbSync(activity, item.remoteUrl, accountId);
                            if (bm != null) {
                                try (FileOutputStream fos = new FileOutputStream(destFile)) {
                                    bm.compress(Bitmap.CompressFormat.JPEG, 95, fos);
                                    fos.flush();
                                    copied = destFile.exists() && destFile.length() > 0;
                                } catch (Throwable ignored) {}
                            }
                        }

                        // 3c. Fallback to direct HTTP stream
                        if (!copied) {
                            try {
                                String dlUrl = item.remoteUrl;
                                if (dlUrl.contains("=")) {
                                    dlUrl = dlUrl.replaceAll("=.*$", "=d");
                                } else {
                                    dlUrl = dlUrl + "=d";
                                }
                                downloadRemoteFile(dlUrl, destFile);
                                copied = destFile.exists() && destFile.length() > 0;
                            } catch (Throwable ignored) {}
                        }
                    }

                    if (copied) {
                        successCount++;
                        exportedPaths.add(destFile.getAbsolutePath());
                    } else {
                        skippedCount++;
                    }
                } catch (Throwable t) {
                    Logger.printException(() -> "Error exporting item " + item.filename, t);
                    skippedCount++;
                }
            }

            final int finalSuccess = successCount;
            final int finalSkipped = skippedCount;
            if (!exportedPaths.isEmpty()) {
                String[] pathsArray = exportedPaths.toArray(new String[0]);
                try {
                    MediaScannerConnection.scanFile(activity, pathsArray, null, (path, uri) -> {
                        Logger.printInfo(() -> "Exported & indexed in DCIM: " + path);
                    });
                } catch (Throwable t) {
                    Logger.printException(() -> "Error calling MediaScannerConnection", t);
                }
            }

            MAIN_HANDLER.post(() -> {
                if (progressDialog.isShowing()) progressDialog.dismiss();
                String msg = "Exported " + finalSuccess + " item(s) to DCIM/GooglePhotos_Export";
                if (finalSkipped > 0) msg += " (" + finalSkipped + " skipped/failed)";
                Toast.makeText(activity, msg, Toast.LENGTH_LONG).show();
            });
        });
    }

    private static void showPhotoInspectorDialog(Activity activity, StorageScanner.MediaItem currentItem,
                                                 List<StorageScanner.MediaItem> allItems,
                                                 Set<String> selectedKeys,
                                                 Runnable onSelectionChanged,
                                                 float density, Theme theme) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed() || currentItem == null) return;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        ScrollView scroll = new ScrollView(activity);
        scroll.setVerticalScrollBarEnabled(false);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(theme.surface, 24 * density));
        int p = (int) (18 * density);
        root.setPadding(p, p, p, (int) (16 * density));

        // 1. Header (Title + Close)
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("📷 Media Inspector");
        tvTitle.setTextSize(16f);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setTextColor(theme.textPrimary);
        header.addView(tvTitle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        View btnClose = createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, theme.textSecondary), (int) (32 * density), (int) (18 * density));
        btnClose.setOnClickListener(v -> dialog.dismiss());
        header.addView(btnClose);
        root.addView(header);

        // 2. High-Res Preview Image
        FrameLayout previewFrame = new FrameLayout(activity);
        LinearLayout.LayoutParams pfLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (240 * density));
        pfLp.topMargin = (int) (12 * density);
        pfLp.bottomMargin = (int) (12 * density);
        previewFrame.setLayoutParams(pfLp);
        previewFrame.setBackground(createRoundedDrawable(theme.surfaceContainer, 14 * density));
        previewFrame.setClipToOutline(true);

        ImageView previewIv = new ImageView(activity);
        previewIv.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        previewIv.setScaleType(ImageView.ScaleType.FIT_CENTER);
        previewFrame.addView(previewIv);

        int accId = currentAccount != null ? currentAccount.accountId : 0;
        loadThumbAsync(activity, previewIv, currentItem.remoteUrl, accId);

        if (currentItem.duration > 0 || (currentItem.mimeType != null && currentItem.mimeType.contains("video"))) {
            TextView tvVid = new TextView(activity);
            tvVid.setText("▶ " + (currentItem.duration > 0 ? (int) currentItem.duration + "s" : "Video"));
            tvVid.setTextSize(11f);
            tvVid.setTypeface(null, Typeface.BOLD);
            tvVid.setTextColor(Color.WHITE);
            tvVid.setBackground(createRoundedDrawable(0xAA000000, 6 * density));
            tvVid.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
            FrameLayout.LayoutParams vLp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.START);
            vLp.setMargins((int) (8 * density), 0, 0, (int) (8 * density));
            previewFrame.addView(tvVid, vLp);
        }
        root.addView(previewFrame);

        // 3. Technical Metadata Breakdown Card
        LinearLayout metaCard = new LinearLayout(activity);
        metaCard.setOrientation(LinearLayout.VERTICAL);
        metaCard.setBackground(createRoundedDrawable(theme.surfaceContainer, 12 * density));
        metaCard.setPadding((int) (14 * density), (int) (12 * density), (int) (14 * density), (int) (12 * density));

        TextView tvFilename = new TextView(activity);
        tvFilename.setText(currentItem.filename != null ? currentItem.filename : "Unknown");
        tvFilename.setTextSize(13.5f);
        tvFilename.setTypeface(null, Typeface.BOLD);
        tvFilename.setTextColor(theme.textPrimary);
        metaCard.addView(tvFilename);

        String resStr = (currentItem.width > 0 && currentItem.height > 0)
                ? (currentItem.width + " × " + currentItem.height) : "Standard resolution";
        String quotaStr = currentItem.quotaBytes > 0
                ? ("-" + currentItem.getFormattedQuota() + " (Consumes storage)")
                : "Free (0 B • Storage saver / Pixel perk)";
        String stateStr = (currentItem.isArchived ? "Archived • " : "")
                + (currentItem.isFavorite ? "Favorite • " : "")
                + (currentItem.trashTimestamp > 0 ? "In Trash" : "Active in Library");

        String[][] metaRows = new String[][]{
                {"📐 Resolution", resStr},
                {"📦 File Size", currentItem.getFormattedSize()},
                {"☁️ Quota Impact", quotaStr},
                {"📅 Date Captured", currentItem.captureTimestamp > 0 ? DATE_FORMAT.format(new Date(currentItem.captureTimestamp)) : "Unknown"},
                {"🏷️ MIME Type", currentItem.mimeType != null && !currentItem.mimeType.isEmpty() ? currentItem.mimeType : "image/jpeg"},
                {"📂 Media State", stateStr}
        };

        for (String[] row : metaRows) {
            LinearLayout r = new LinearLayout(activity);
            r.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rLp.topMargin = (int) (5 * density);
            r.setLayoutParams(rLp);

            TextView k = new TextView(activity);
            k.setText(row[0]);
            k.setTextSize(11.5f);
            k.setTextColor(theme.textSecondary);
            k.setLayoutParams(new LinearLayout.LayoutParams((int) (110 * density), ViewGroup.LayoutParams.WRAP_CONTENT));
            r.addView(k);

            TextView v = new TextView(activity);
            v.setText(row[1]);
            v.setTextSize(11.5f);
            v.setTypeface(null, Typeface.BOLD);
            v.setTextColor(theme.textPrimary);
            v.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            r.addView(v);

            metaCard.addView(r);
        }

        if (currentItem.caption != null && !currentItem.caption.trim().isEmpty()) {
            TextView tvCap = new TextView(activity);
            tvCap.setText("💬 " + currentItem.caption.trim());
            tvCap.setTextSize(11.5f);
            tvCap.setTextColor(theme.primary);
            tvCap.setPadding(0, (int) (6 * density), 0, 0);
            metaCard.addView(tvCap);
        }

        root.addView(metaCard);

        // 4. Duplicate / Visual Similarity Cluster Comparison (if clusterId > 0)
        if (currentItem.clusterId > 0 && allItems != null) {
            List<StorageScanner.MediaItem> clusterMembers = new ArrayList<>();
            for (StorageScanner.MediaItem it : allItems) {
                if (it.clusterId == currentItem.clusterId) clusterMembers.add(it);
            }

            if (clusterMembers.size() > 1) {
                LinearLayout clusterBox = new LinearLayout(activity);
                clusterBox.setOrientation(LinearLayout.VERTICAL);
                clusterBox.setBackground(createRoundedDrawable(theme.surfaceContainer, 12 * density));
                clusterBox.setPadding((int) (12 * density), (int) (10 * density), (int) (12 * density), (int) (10 * density));
                LinearLayout.LayoutParams cbLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                cbLp.topMargin = (int) (10 * density);
                clusterBox.setLayoutParams(cbLp);

                TextView tvClustTitle = new TextView(activity);
                tvClustTitle.setText("Visual Similarity Cluster #" + currentItem.clusterId + " (" + clusterMembers.size() + " items)");
                tvClustTitle.setTextSize(12.5f);
                tvClustTitle.setTypeface(null, Typeface.BOLD);
                tvClustTitle.setTextColor(theme.primary);
                clusterBox.addView(tvClustTitle);

                TextView tvClustDesc = new TextView(activity);
                tvClustDesc.setText("Tap any candidate to inspect details. Keep the best quality photo and delete the rest.");
                tvClustDesc.setTextSize(11f);
                tvClustDesc.setTextColor(theme.textSecondary);
                tvClustDesc.setPadding(0, (int) (2 * density), 0, (int) (8 * density));
                clusterBox.addView(tvClustDesc);

                HorizontalScrollView hsv = new HorizontalScrollView(activity);
                hsv.setHorizontalScrollBarEnabled(false);
                LinearLayout hRow = new LinearLayout(activity);
                hRow.setOrientation(LinearLayout.HORIZONTAL);

                for (StorageScanner.MediaItem cand : clusterMembers) {
                    boolean isCur = cand.dedupKey != null && cand.dedupKey.equals(currentItem.dedupKey);

                    LinearLayout cCol = new LinearLayout(activity);
                    cCol.setOrientation(LinearLayout.VERTICAL);
                    cCol.setGravity(Gravity.CENTER_HORIZONTAL);
                    int m = (int) (4 * density);
                    LinearLayout.LayoutParams ccLp = new LinearLayout.LayoutParams((int) (90 * density), ViewGroup.LayoutParams.WRAP_CONTENT);
                    ccLp.setMargins(m, m, m, m);
                    cCol.setLayoutParams(ccLp);
                    cCol.setBackground(createRoundedDrawable(isCur ? theme.primaryContainer : theme.surfaceContainer, 8 * density));
                    cCol.setPadding((int) (4 * density), (int) (4 * density), (int) (4 * density), (int) (6 * density));

                    ImageView cThumb = new ImageView(activity);
                    cThumb.setLayoutParams(new LinearLayout.LayoutParams((int) (82 * density), (int) (82 * density)));
                    cThumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
                    cThumb.setBackground(createRoundedDrawable(theme.surfaceContainer, 6 * density));
                    cThumb.setClipToOutline(true);
                    loadThumbAsync(activity, cThumb, cand.remoteUrl, accId);
                    cCol.addView(cThumb);

                    TextView tvCandSize = new TextView(activity);
                    tvCandSize.setText(cand.getFormattedSize());
                    tvCandSize.setTextSize(10f);
                    tvCandSize.setTypeface(null, Typeface.BOLD);
                    tvCandSize.setTextColor(theme.textPrimary);
                    tvCandSize.setPadding(0, (int) (3 * density), 0, 0);
                    cCol.addView(tvCandSize);

                    TextView tvCandTag = new TextView(activity);
                    tvCandTag.setText(isCur ? "Viewing" : "Candidate");
                    tvCandTag.setTextSize(9f);
                    tvCandTag.setTextColor(isCur ? theme.primary : theme.textSecondary);
                    cCol.addView(tvCandTag);

                    cCol.setClickable(true);
                    cCol.setFocusable(true);
                    cCol.setOnClickListener(v -> {
                        dialog.dismiss();
                        showPhotoInspectorDialog(activity, cand, allItems, selectedKeys, onSelectionChanged, density, theme);
                    });
                    hRow.addView(cCol);
                }
                hsv.addView(hRow);
                clusterBox.addView(hsv);

                // Smart action: Keep this photo
                TextView btnKeepThis = new TextView(activity);
                btnKeepThis.setText("🌟 Keep This Photo (Select " + (clusterMembers.size() - 1) + " Others for Deletion)");
                btnKeepThis.setTextSize(11.5f);
                btnKeepThis.setTypeface(null, Typeface.BOLD);
                btnKeepThis.setTextColor(theme.onPrimary);
                btnKeepThis.setGravity(Gravity.CENTER);
                btnKeepThis.setBackground(createActionPillDrawable(theme.primary, 10 * density));
                btnKeepThis.setPadding((int) (12 * density), (int) (8 * density), (int) (12 * density), (int) (8 * density));
                LinearLayout.LayoutParams ktLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                ktLp.topMargin = (int) (10 * density);
                btnKeepThis.setLayoutParams(ktLp);
                btnKeepThis.setClickable(true);
                btnKeepThis.setFocusable(true);
                btnKeepThis.setOnClickListener(v -> {
                    String curKey = getItemKey(currentItem);
                    selectedKeys.remove(curKey);
                    int count = 0;
                    for (StorageScanner.MediaItem other : clusterMembers) {
                        String oKey = getItemKey(other);
                        if (!oKey.equals(curKey)) {
                            selectedKeys.add(oKey);
                            count++;
                        }
                    }
                    if (onSelectionChanged != null) onSelectionChanged.run();
                    Toast.makeText(activity, "Selected " + count + " duplicates for deletion/archive", Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                });
                clusterBox.addView(btnKeepThis);

                root.addView(clusterBox);
            }
        }

        // 5. Footer Row (Toggle Selection & Close)
        LinearLayout footer = new LinearLayout(activity);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        LinearLayout.LayoutParams fLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        fLp.topMargin = (int) (16 * density);
        footer.setLayoutParams(fLp);

        String itemKey = getItemKey(currentItem);
        TextView btnToggleSelect = new TextView(activity);
        btnToggleSelect.setTextSize(12f);
        btnToggleSelect.setTypeface(null, Typeface.BOLD);
        btnToggleSelect.setPadding((int) (14 * density), (int) (8 * density), (int) (14 * density), (int) (8 * density));

        Runnable updateBtnSelectVisual = () -> {
            boolean isSel = selectedKeys.contains(itemKey);
            if (isSel) {
                btnToggleSelect.setText("✓ Selected (Tap to Deselect)");
                btnToggleSelect.setTextColor(theme.onPrimary);
                btnToggleSelect.setBackground(createActionPillDrawable(theme.primary, 10 * density));
            } else {
                btnToggleSelect.setText("＋ Select for Batch Action");
                btnToggleSelect.setTextColor(theme.textPrimary);
                btnToggleSelect.setBackground(createActionPillDrawable(theme.surfaceContainer, 10 * density));
            }
        };
        updateBtnSelectVisual.run();

        btnToggleSelect.setClickable(true);
        btnToggleSelect.setFocusable(true);
        btnToggleSelect.setOnClickListener(v -> {
            if (selectedKeys.contains(itemKey)) {
                selectedKeys.remove(itemKey);
            } else {
                selectedKeys.add(itemKey);
            }
            updateBtnSelectVisual.run();
            if (onSelectionChanged != null) onSelectionChanged.run();
        });
        footer.addView(btnToggleSelect);

        TextView btnDone = new TextView(activity);
        btnDone.setText("Close");
        btnDone.setTextSize(12f);
        btnDone.setTypeface(null, Typeface.BOLD);
        btnDone.setTextColor(theme.primary);
        btnDone.setPadding((int) (14 * density), (int) (8 * density), (int) (14 * density), (int) (8 * density));
        btnDone.setClickable(true);
        btnDone.setFocusable(true);
        btnDone.setOnClickListener(v -> dialog.dismiss());
        footer.addView(btnDone);

        root.addView(footer);

        scroll.addView(root);
        dialog.setContentView(scroll);
        dialog.setOnDismissListener(d -> {
            previewIv.setImageDrawable(null);
        });
        dialog.show();

        Window w = dialog.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int sw = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (sw * 0.94f), (int) (520 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Results List Renderer
    // ─────────────────────────────────────────────────────────────────────────
    // ─────────────────────────────────────────────────────────────────────────
    private static final int PAGE_SIZE_GRID = 48;
    private static final int PAGE_SIZE_LIST = 30;

    private static TextView createNavButton(Activity activity, String text, boolean enabled, float density, Theme theme) {
        TextView btn = new TextView(activity);
        btn.setText(text);
        btn.setTextSize(11f);
        btn.setTypeface(null, Typeface.BOLD);
        btn.setPadding((int) (10 * density), (int) (5 * density), (int) (10 * density), (int) (5 * density));
        btn.setGravity(Gravity.CENTER);
        if (enabled) {
            btn.setTextColor(theme.textPrimary);
            btn.setBackground(createActionPillDrawable(theme.surfaceContainer, 8 * density));
            btn.setClickable(true);
            btn.setFocusable(true);
        } else {
            btn.setTextColor(theme.isDark ? 0x44FFFFFF : 0x44000000);
            btn.setBackground(createActionPillDrawable(theme.isDark ? 0x1AFFFFFF : 0x0D000000, 8 * density));
            btn.setClickable(false);
            btn.setFocusable(false);
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins((int) (2 * density), 0, (int) (2 * density), 0);
        btn.setLayoutParams(lp);
        return btn;
    }

    private static View createPaginationBar(Activity activity, int[] currentPageRef, int totalPages, int start, int end, int totalItems,
                                            List<StorageScanner.MediaItem> items, Set<String> selectedKeys,
                                            Runnable onSelectionChanged, Runnable reRender, float density, Theme theme) {
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.VERTICAL);
        bar.setPadding(0, (int) (4 * density), 0, (int) (6 * density));

        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);

        // Count how many on this page are currently selected
        int pageSelectedCount = 0;
        for (int i = start; i < end; i++) {
            if (selectedKeys.contains(getItemKey(items.get(i)))) {
                pageSelectedCount++;
            }
        }
        final boolean allPageSelected = (pageSelectedCount == (end - start)) && (end > start);

        if (isLarge) {
            LinearLayout singleRow = new LinearLayout(activity);
            singleRow.setOrientation(LinearLayout.HORIZONTAL);
            singleRow.setGravity(Gravity.CENTER_VERTICAL);
            singleRow.setPadding((int) (4 * density), (int) (2 * density), (int) (4 * density), (int) (4 * density));

            TextView tvInfo = new TextView(activity);
            tvInfo.setText("Page " + (currentPageRef[0] + 1) + " of " + totalPages + " • " + (start + 1) + "–" + end + " of " + totalItems);
            tvInfo.setTextSize(11f);
            tvInfo.setTextColor(theme.textSecondary);
            tvInfo.setTypeface(null, Typeface.BOLD);
            singleRow.addView(tvInfo);

            View spacerLeft = new View(activity);
            singleRow.addView(spacerLeft, new LinearLayout.LayoutParams(0, 0, 1f));

            if (totalPages > 1) {
                TextView btnFirst = createNavButton(activity, "⇤ First", currentPageRef[0] > 0, density, theme);
                btnFirst.setOnClickListener(v -> {
                    if (currentPageRef[0] > 0) {
                        currentPageRef[0] = 0;
                        if (reRender != null) reRender.run();
                    }
                });
                singleRow.addView(btnFirst);

                TextView btnPrev = createNavButton(activity, "◀ Prev", currentPageRef[0] > 0, density, theme);
                btnPrev.setOnClickListener(v -> {
                    if (currentPageRef[0] > 0) {
                        currentPageRef[0]--;
                        if (reRender != null) reRender.run();
                    }
                });
                singleRow.addView(btnPrev);

                TextView tvPageLabel = new TextView(activity);
                tvPageLabel.setText(" " + (currentPageRef[0] + 1) + " / " + totalPages + " ");
                tvPageLabel.setTextSize(11.5f);
                tvPageLabel.setTextColor(theme.textPrimary);
                tvPageLabel.setTypeface(null, Typeface.BOLD);
                tvPageLabel.setGravity(Gravity.CENTER);
                tvPageLabel.setPadding((int) (6 * density), 0, (int) (6 * density), 0);
                singleRow.addView(tvPageLabel);

                TextView btnNext = createNavButton(activity, "Next ▶", currentPageRef[0] < totalPages - 1, density, theme);
                btnNext.setOnClickListener(v -> {
                    if (currentPageRef[0] < totalPages - 1) {
                        currentPageRef[0]++;
                        if (reRender != null) reRender.run();
                    }
                });
                singleRow.addView(btnNext);

                TextView btnLast = createNavButton(activity, "Last ⇥", currentPageRef[0] < totalPages - 1, density, theme);
                btnLast.setOnClickListener(v -> {
                    if (currentPageRef[0] < totalPages - 1) {
                        currentPageRef[0] = totalPages - 1;
                        if (reRender != null) reRender.run();
                    }
                });
                singleRow.addView(btnLast);
            }

            View spacerRight = new View(activity);
            singleRow.addView(spacerRight, new LinearLayout.LayoutParams(0, 0, 1f));

            TextView btnAll = createCanvasToolbarButton(activity, "All", theme.primary, density, theme);
            btnAll.setOnClickListener(v -> {
                for (StorageScanner.MediaItem it : items) {
                    selectedKeys.add(getItemKey(it));
                }
                if (onSelectionChanged != null) onSelectionChanged.run();
                if (reRender != null) reRender.run();
            });
            singleRow.addView(btnAll);

            TextView btnNone = createCanvasToolbarButton(activity, "None", theme.textSecondary, density, theme);
            btnNone.setOnClickListener(v -> {
                selectedKeys.clear();
                if (onSelectionChanged != null) onSelectionChanged.run();
                if (reRender != null) reRender.run();
            });
            singleRow.addView(btnNone);

            TextView btnInvert = createCanvasToolbarButton(activity, "Invert", theme.textSecondary, density, theme);
            btnInvert.setOnClickListener(v -> {
                Set<String> inverted = new HashSet<>();
                for (StorageScanner.MediaItem it : items) {
                    String key = getItemKey(it);
                    if (!selectedKeys.contains(key)) inverted.add(key);
                }
                selectedKeys.clear();
                selectedKeys.addAll(inverted);
                if (onSelectionChanged != null) onSelectionChanged.run();
                if (reRender != null) reRender.run();
            });
            singleRow.addView(btnInvert);

            TextView btnPageSelect = new TextView(activity);
            btnPageSelect.setText(allPageSelected ? "Clear Page (" + (end - start) + ")" : "Select Page (" + (end - start) + ")");
            btnPageSelect.setTextSize(11f);
            btnPageSelect.setTextColor(allPageSelected ? theme.primary : theme.textPrimary);
            btnPageSelect.setTypeface(null, Typeface.BOLD);
            btnPageSelect.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
            btnPageSelect.setBackground(createActionPillDrawable(theme.surfaceContainer, 8 * density));
            btnPageSelect.setClickable(true);
            btnPageSelect.setFocusable(true);
            LinearLayout.LayoutParams psLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            psLp.leftMargin = (int) (4 * density);
            btnPageSelect.setLayoutParams(psLp);
            btnPageSelect.setOnClickListener(v -> {
                for (int i = start; i < end; i++) {
                    String key = getItemKey(items.get(i));
                    if (allPageSelected) {
                        selectedKeys.remove(key);
                    } else {
                        selectedKeys.add(key);
                    }
                }
                if (onSelectionChanged != null) onSelectionChanged.run();
                if (reRender != null) reRender.run();
            });
            singleRow.addView(btnPageSelect);

            bar.addView(singleRow);
            return bar;
        }

        // Phone: 2-row layout unchanged
        // Row 1: Item counts and "Select Page" / "Clear Page"
        LinearLayout row1 = new LinearLayout(activity);
        row1.setOrientation(LinearLayout.HORIZONTAL);
        row1.setGravity(Gravity.CENTER_VERTICAL);
        row1.setPadding((int) (2 * density), 0, (int) (2 * density), (int) (4 * density));

        TextView tvInfo = new TextView(activity);
        tvInfo.setText("Page " + (currentPageRef[0] + 1) + " of " + totalPages + " • " + (start + 1) + "–" + end + " of " + totalItems);
        tvInfo.setTextSize(11.5f);
        tvInfo.setTextColor(theme.textSecondary);
        tvInfo.setTypeface(null, Typeface.BOLD);
        LinearLayout.LayoutParams infoLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        row1.addView(tvInfo, infoLp);

        TextView btnPageSelect = new TextView(activity);
        btnPageSelect.setText(allPageSelected ? "Clear Page (" + (end - start) + ")" : "Select Page (" + (end - start) + ")");
        btnPageSelect.setTextSize(11f);
        btnPageSelect.setTextColor(allPageSelected ? theme.primary : theme.textPrimary);
        btnPageSelect.setTypeface(null, Typeface.BOLD);
        btnPageSelect.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
        btnPageSelect.setBackground(createActionPillDrawable(theme.surfaceContainer, 8 * density));
        btnPageSelect.setClickable(true);
        btnPageSelect.setFocusable(true);
        btnPageSelect.setOnClickListener(v -> {
            for (int i = start; i < end; i++) {
                String key = getItemKey(items.get(i));
                if (allPageSelected) {
                    selectedKeys.remove(key);
                } else {
                    selectedKeys.add(key);
                }
            }
            if (onSelectionChanged != null) onSelectionChanged.run();
            if (reRender != null) reRender.run();
        });
        row1.addView(btnPageSelect);
        bar.addView(row1);

        // Row 2: Navigation buttons (First, Prev, Page, Next, Last)
        if (totalPages > 1) {
            LinearLayout row2 = new LinearLayout(activity);
            row2.setOrientation(LinearLayout.HORIZONTAL);
            row2.setGravity(Gravity.CENTER);
            row2.setPadding(0, (int) (2 * density), 0, 0);

            // First button
            TextView btnFirst = createNavButton(activity, "⇤ First", currentPageRef[0] > 0, density, theme);
            btnFirst.setOnClickListener(v -> {
                if (currentPageRef[0] > 0) {
                    currentPageRef[0] = 0;
                    if (reRender != null) reRender.run();
                }
            });
            row2.addView(btnFirst);

            // Prev button
            TextView btnPrev = createNavButton(activity, "◀ Prev", currentPageRef[0] > 0, density, theme);
            btnPrev.setOnClickListener(v -> {
                if (currentPageRef[0] > 0) {
                    currentPageRef[0]--;
                    if (reRender != null) reRender.run();
                }
            });
            row2.addView(btnPrev);

            // Page label
            TextView tvPageLabel = new TextView(activity);
            tvPageLabel.setText(" " + (currentPageRef[0] + 1) + " / " + totalPages + " ");
            tvPageLabel.setTextSize(12f);
            tvPageLabel.setTextColor(theme.textPrimary);
            tvPageLabel.setTypeface(null, Typeface.BOLD);
            tvPageLabel.setGravity(Gravity.CENTER);
            tvPageLabel.setPadding((int) (6 * density), 0, (int) (6 * density), 0);
            row2.addView(tvPageLabel);

            // Next button
            TextView btnNext = createNavButton(activity, "Next ▶", currentPageRef[0] < totalPages - 1, density, theme);
            btnNext.setOnClickListener(v -> {
                if (currentPageRef[0] < totalPages - 1) {
                    currentPageRef[0]++;
                    if (reRender != null) reRender.run();
                }
            });
            row2.addView(btnNext);

            // Last button
            TextView btnLast = createNavButton(activity, "Last ⇥", currentPageRef[0] < totalPages - 1, density, theme);
            btnLast.setOnClickListener(v -> {
                if (currentPageRef[0] < totalPages - 1) {
                    currentPageRef[0] = totalPages - 1;
                    if (reRender != null) reRender.run();
                }
            });
            row2.addView(btnLast);

            bar.addView(row2);
        }

        return bar;
    }

    private static void renderResults(Activity activity, LinearLayout container, List<StorageScanner.MediaItem> items,
                                      Set<String> selectedKeys, boolean isGrid, Runnable onSelectionChanged,
                                      float density, Theme theme) {
        renderResults(activity, container, items, selectedKeys, isGrid, onSelectionChanged, density, theme, new int[]{0});
    }

    private static void renderResults(Activity activity, LinearLayout container, List<StorageScanner.MediaItem> rawItems,
                                      Set<String> selectedKeys, boolean isGrid, Runnable onSelectionChanged,
                                      float density, Theme theme, int[] currentPageRef) {
        container.removeAllViews();
        final List<StorageScanner.MediaItem> items = (rawItems != null) ? new ArrayList<>(rawItems) : new ArrayList<>();
        if (items.isEmpty()) {
            TextView tvEmpty = new TextView(activity);
            tvEmpty.setText("No media items matched the selected filters.");
            tvEmpty.setTextSize(13f);
            tvEmpty.setTextColor(theme.textSecondary);
            tvEmpty.setGravity(Gravity.CENTER);
            tvEmpty.setPadding(0, (int) (20 * density), 0, (int) (20 * density));
            container.addView(tvEmpty);
            return;
        }

        if (currentPageRef == null) currentPageRef = new int[]{0};
        int pageSize = isGrid ? PAGE_SIZE_GRID : PAGE_SIZE_LIST;
        int totalPages = Math.max(1, (int) Math.ceil((double) items.size() / pageSize));
        if (currentPageRef[0] >= totalPages) currentPageRef[0] = totalPages - 1;
        if (currentPageRef[0] < 0) currentPageRef[0] = 0;

        int start = currentPageRef[0] * pageSize;
        int end = Math.min(start + pageSize, items.size());
        int accId = currentAccount != null ? currentAccount.accountId : 0;

        final int[] finalCurrentPageRef = currentPageRef;
        Runnable reRender = () -> renderResults(activity, container, items, selectedKeys, isGrid, onSelectionChanged, density, theme, finalCurrentPageRef);

        // Top Pagination Bar
        View topBar = createPaginationBar(activity, finalCurrentPageRef, totalPages, start, end, items.size(), items, selectedKeys, onSelectionChanged, reRender, density, theme);
        container.addView(topBar);

        if (isGrid) {
            // Adaptive Square Tile Grid (3 cols on phone, 4 cols on tablet portrait, 8 cols on tablet landscape)
            int colCount = 3;
            if (PhenotypeFlagManager.isLargeScreen(activity)) {
                boolean isLandscape = activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
                colCount = isLandscape ? 8 : 4;
            }
            LinearLayout currentRow = null;
            for (int i = start; i < end; i++) {
                if (i >= items.size()) break;
                int colIndex = i - start;
                if (colIndex % colCount == 0) {
                    currentRow = new LinearLayout(activity);
                    currentRow.setOrientation(LinearLayout.HORIZONTAL);
                    LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    rLp.bottomMargin = (int) (3 * density);
                    currentRow.setLayoutParams(rLp);
                    container.addView(currentRow);
                }

                final StorageScanner.MediaItem item = items.get(i);
                final String itemKey = getItemKey(item);

                FrameLayout tile = new FrameLayout(activity) {
                    @Override
                    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                        super.onMeasure(widthMeasureSpec, widthMeasureSpec);
                    }
                };
                LinearLayout.LayoutParams tLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                int m = (int) (2 * density);
                tLp.setMargins(m, m, m, m);
                tile.setLayoutParams(tLp);
                tile.setBackground(createRoundedDrawable(theme.surfaceContainer, 8 * density));
                tile.setClipToOutline(true);

                ImageView thumb = new ImageView(activity);
                thumb.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                thumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
                tile.addView(thumb);

                // Video indicator
                if (item.duration > 0 || (item.mimeType != null && item.mimeType.startsWith("video"))) {
                    TextView tvVid = new TextView(activity);
                    tvVid.setText("▶ " + (item.duration > 0 ? (int) item.duration + "s" : ""));
                    tvVid.setTextSize(9f);
                    tvVid.setTypeface(null, Typeface.BOLD);
                    tvVid.setTextColor(Color.WHITE);
                    tvVid.setBackground(createRoundedDrawable(0xAA000000, 4 * density));
                    tvVid.setPadding((int) (4 * density), (int) (1.5f * density), (int) (4 * density), (int) (1.5f * density));
                    FrameLayout.LayoutParams vLp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.START);
                    vLp.setMargins((int) (4 * density), 0, 0, (int) (4 * density));
                    tile.addView(tvVid, vLp);
                }

                // Quota badge pill
                TextView badge = new TextView(activity);
                badge.setTextSize(8.5f);
                badge.setTypeface(null, Typeface.BOLD);
                badge.setPadding((int) (4 * density), (int) (1.5f * density), (int) (4 * density), (int) (1.5f * density));
                badge.setBackground(createRoundedDrawable(0xBB000000, 4 * density));
                if (item.quotaBytes > 0) {
                    badge.setText("-" + item.getFormattedQuota());
                    badge.setTextColor(0xFFFFB4AB);
                } else {
                    badge.setText("Free");
                    badge.setTextColor(0xFF70F7E3);
                }
                FrameLayout.LayoutParams bLp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
                bLp.setMargins(0, 0, (int) (4 * density), (int) (4 * density));
                tile.addView(badge, bLp);

                // Checkbox touch target container
                FrameLayout checkContainer = new FrameLayout(activity);
                int ccSize = (int) (38 * density);
                FrameLayout.LayoutParams ccLp = new FrameLayout.LayoutParams(ccSize, ccSize, Gravity.TOP | Gravity.START);
                checkContainer.setLayoutParams(ccLp);

                TextView check = new TextView(activity);
                int chSize = (int) (22 * density);
                FrameLayout.LayoutParams chLp = new FrameLayout.LayoutParams(chSize, chSize, Gravity.TOP | Gravity.START);
                chLp.setMargins((int) (5 * density), (int) (5 * density), 0, 0);
                check.setLayoutParams(chLp);
                check.setGravity(Gravity.CENTER);
                check.setTextSize(11f);
                check.setTypeface(null, Typeface.BOLD);
                checkContainer.addView(check);

                Runnable updateCheckVisual = () -> {
                    boolean sel = selectedKeys.contains(itemKey);
                    if (sel) {
                        check.setText("✓");
                        check.setTextColor(theme.onPrimary);
                        check.setBackground(createRoundedDrawable(theme.primary, 11 * density));
                    } else {
                        check.setText("");
                        GradientDrawable uncheckGd = createRoundedDrawable(0x55000000, 11 * density);
                        uncheckGd.setStroke((int) (1.5f * density), 0xDDFFFFFF);
                        check.setBackground(uncheckGd);
                    }
                };
                updateCheckVisual.run();

                checkContainer.setClickable(true);
                checkContainer.setFocusable(true);
                checkContainer.setOnClickListener(v -> {
                    if (selectedKeys.contains(itemKey)) {
                        selectedKeys.remove(itemKey);
                    } else {
                        selectedKeys.add(itemKey);
                    }
                    updateCheckVisual.run();
                    if (onSelectionChanged != null) onSelectionChanged.run();
                });
                tile.addView(checkContainer);

                tile.setClickable(true);
                tile.setFocusable(true);
                tile.setOnClickListener(v -> {
                    showPhotoInspectorDialog(activity, item, items, selectedKeys, onSelectionChanged, density, theme);
                });
                tile.setOnLongClickListener(v -> {
                    showPhotoInspectorDialog(activity, item, items, selectedKeys, onSelectionChanged, density, theme);
                    return true;
                });

                loadThumbAsync(activity, thumb, item.remoteUrl, accId);
                currentRow.addView(tile);
            }

            int remainder = (end - start) % colCount;
            if (remainder != 0 && currentRow != null) {
                for (int r = remainder; r < colCount; r++) {
                    View emptySpacer = new View(activity);
                    currentRow.addView(emptySpacer, new LinearLayout.LayoutParams(0, 0, 1f));
                }
            }
        } else {
            // Detailed List View
            for (int i = start; i < end; i++) {
                if (i >= items.size()) break;
                final StorageScanner.MediaItem item = items.get(i);
                final String itemKey = getItemKey(item);

                LinearLayout card = new LinearLayout(activity);
                card.setOrientation(LinearLayout.HORIZONTAL);
                card.setGravity(Gravity.CENTER_VERTICAL);
                int padH = (int) (10 * density);
                int padV = (int) (8 * density);
                card.setPadding(padH, padV, padH, padV);
                card.setBackground(createCardDrawable(false, density, theme));
                LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                cLp.bottomMargin = (int) (5 * density);
                card.setLayoutParams(cLp);

                // Checkbox
                TextView check = new TextView(activity);
                int chSize = (int) (22 * density);
                LinearLayout.LayoutParams chLp = new LinearLayout.LayoutParams(chSize, chSize);
                chLp.rightMargin = (int) (10 * density);
                check.setLayoutParams(chLp);
                check.setGravity(Gravity.CENTER);
                check.setTextSize(11f);
                check.setTypeface(null, Typeface.BOLD);

                Runnable updateCheckVisual = () -> {
                    boolean sel = selectedKeys.contains(itemKey);
                    if (sel) {
                        check.setText("✓");
                        check.setTextColor(theme.onPrimary);
                        check.setBackground(createRoundedDrawable(theme.primary, 11 * density));
                    } else {
                        check.setText("");
                        GradientDrawable uncheckGd = createRoundedDrawable(theme.surfaceContainer, 11 * density);
                        uncheckGd.setStroke((int) (1.5f * density), theme.outline);
                        check.setBackground(uncheckGd);
                    }
                };
                updateCheckVisual.run();

                check.setClickable(true);
                check.setFocusable(true);
                check.setOnClickListener(v -> {
                    if (selectedKeys.contains(itemKey)) {
                        selectedKeys.remove(itemKey);
                    } else {
                        selectedKeys.add(itemKey);
                    }
                    updateCheckVisual.run();
                    if (onSelectionChanged != null) onSelectionChanged.run();
                });
                card.addView(check);

                ImageView thumb = new ImageView(activity);
                int thSize = (int) (44 * density);
                thumb.setLayoutParams(new LinearLayout.LayoutParams(thSize, thSize));
                thumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
                thumb.setBackground(createRoundedDrawable(theme.surfaceContainer, 8 * density));
                thumb.setClipToOutline(true);
                card.addView(thumb);

                LinearLayout textCol = new LinearLayout(activity);
                textCol.setOrientation(LinearLayout.VERTICAL);
                LinearLayout.LayoutParams tLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                tLp.setMargins((int) (10 * density), 0, (int) (6 * density), 0);
                textCol.setLayoutParams(tLp);

                TextView tvName = new TextView(activity);
                tvName.setText(item.filename);
                tvName.setTextSize(13f);
                tvName.setTypeface(null, Typeface.BOLD);
                tvName.setTextColor(theme.textPrimary);
                tvName.setSingleLine(true);
                tvName.setEllipsize(TextUtils.TruncateAt.END);
                textCol.addView(tvName);

                String sub = item.getFormattedSize();
                if (item.captureTimestamp > 0) sub += " • " + DATE_FORMAT.format(new Date(item.captureTimestamp));
                if (item.clusterId > 0) sub += " • Similar #" + item.clusterId;
                if (item.caption != null && !item.caption.trim().isEmpty()) {
                    sub += "\n💬 " + item.caption.trim();
                }

                TextView tvSub = new TextView(activity);
                tvSub.setText(sub);
                tvSub.setTextSize(11f);
                tvSub.setTextColor(theme.textSecondary);
                textCol.addView(tvSub);
                card.addView(textCol);

                TextView badge = new TextView(activity);
                badge.setTextSize(11f);
                badge.setTypeface(null, Typeface.BOLD);
                badge.setPadding((int) (8 * density), (int) (3 * density), (int) (8 * density), (int) (3 * density));
                if (item.quotaBytes > 0) {
                    badge.setText("-" + item.getFormattedQuota());
                    badge.setTextColor(theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A);
                    badge.setBackground(createRoundedDrawable(theme.isDark ? 0xFF3E1E1E : 0xFFFFDAD6, 8 * density));
                } else {
                    badge.setText("Free 0B");
                    badge.setTextColor(theme.isDark ? 0xFF70F7E3 : 0xFF006A60);
                    badge.setBackground(createRoundedDrawable(theme.isDark ? 0xFF1D3E38 : 0xFFCCE8E3, 8 * density));
                }
                card.addView(badge);

                card.setClickable(true);
                card.setFocusable(true);
                card.setOnClickListener(v -> {
                    showPhotoInspectorDialog(activity, item, items, selectedKeys, onSelectionChanged, density, theme);
                });
                card.setOnLongClickListener(v -> {
                    showPhotoInspectorDialog(activity, item, items, selectedKeys, onSelectionChanged, density, theme);
                    return true;
                });

                loadThumbAsync(activity, thumb, item.remoteUrl, accId);
                container.addView(card);
            }
        }

        // Bottom Pagination Bar (when items span multiple pages)
        if (totalPages > 1) {
            View bottomBar = createPaginationBar(activity, finalCurrentPageRef, totalPages, start, end, items.size(), items, selectedKeys, onSelectionChanged, reRender, density, theme);
            container.addView(bottomBar);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Universal Dynamic Glide & Thumbnail Resolvers
    // ─────────────────────────────────────────────────────────────────────────
    private static volatile Method sGlideWithMethod = null;
    private static volatile boolean sGlideResolved = false;
    private static volatile boolean sLoggedGlideStrategy = false;

    private static Object getGlideRequestManager(Context context) {
        if (context == null) context = app.morphe.extension.shared.Utils.getContext();
        if (context == null) return null;

        if (!sGlideResolved) {
            synchronized (NativeToolkitDialog.class) {
                if (!sGlideResolved) {
                    String[] knownGlideClasses = ToolkitMappings.GLIDE_SINGLETON_CLASSES;
                    for (String name : knownGlideClasses) {
                        try {
                            Class<?> clazz = Class.forName(name);
                            Method m = clazz.getMethod("e", Context.class);
                            sGlideWithMethod = m;
                            Logger.printInfo(() -> "Resolved Glide singleton via: " + name);
                            break;
                        } catch (Throwable ignored) {}
                    }
                    sGlideResolved = true;
                }
            }
        }

        if (sGlideWithMethod != null) {
            try {
                return sGlideWithMethod.invoke(null, context);
            } catch (Throwable t) {
                Logger.printInfo(() -> "getGlideRequestManager invoke failed: " + t.getMessage());
            }
        }
        return null;
    }

    private static Object loadGlideRequestBuilder(Object requestManager, String urlStr, int accountId) {
        if (requestManager == null || urlStr == null) return null;
        try {
            Class<?> rmClass = requestManager.getClass();

            // 1. Try RemoteMediaModel for HTTP/HTTPS
            Object model = null;
            if (urlStr.startsWith("http://") || urlStr.startsWith("https://")) {
                String[][] modelPairs = ToolkitMappings.REMOTE_MEDIA_MODEL_PAIRS;
                for (String[] pair : modelPairs) {
                    try {
                        Class<?> mClass = Class.forName(pair[0]);
                        Class<?> oClass = Class.forName(pair[1]);
                        Object defaultOptions = oClass.getField("a").get(null);
                        Constructor<?> ctor = mClass.getConstructor(String.class, int.class, oClass);
                        model = ctor.newInstance(urlStr, accountId, defaultOptions);
                        if (model != null) {
                            if (!sLoggedGlideStrategy) {
                                Logger.printInfo(() -> "Loaded RemoteMediaModel via: " + pair[0]);
                            }
                            break;
                        }
                    } catch (Throwable ignored) {}
                }
            }

            // Primary strategy: request RequestBuilder<Bitmap> or RequestBuilder<Drawable> directly, then call .load(targetModel)
            Object targetModel = (model != null) ? model : (urlStr.startsWith("content://") || urlStr.startsWith("file://") ? Uri.parse(urlStr) : urlStr);

            // Strategy 1: Direct RequestManager load methods (mju.l for Object, mju.m for String, mju.j for Uri in 7.97.0)
            String[] rmCandidateNames = (model != null) ? new String[]{"l", "load"} : new String[]{"l", "m", "j", "load"};
            for (String mName : rmCandidateNames) {
                for (Method m : rmClass.getMethods()) {
                    if (m.getName().equals(mName)) {
                        Class<?>[] pt = m.getParameterTypes();
                        if (pt.length == 1) {
                            Object arg = null;
                            if (pt[0].isInstance(targetModel) || pt[0] == Object.class) {
                                arg = targetModel;
                            } else if (pt[0] == String.class && targetModel instanceof String) {
                                arg = targetModel;
                            } else if (pt[0] == Uri.class && targetModel instanceof Uri) {
                                arg = targetModel;
                            }
                            if (arg != null) {
                                final Object finalArg = arg;
                                try {
                                    m.setAccessible(true);
                                    Object rb = m.invoke(requestManager, finalArg);
                                    if (rb != null && isValidTranscodeTarget(rb) && isModelSet(rb) && hasIntoImageViewMethod(rb)) {
                                        if (!sLoggedGlideStrategy) {
                                            sLoggedGlideStrategy = true;
                                            Logger.printInfo(() -> "Loaded RequestBuilder via rm." + mName + "(" + finalArg.getClass().getSimpleName() + ")");
                                        }
                                        return rb;
                                    }
                                } catch (Throwable ignored) {}
                            }
                        }
                    }
                }
            }

            // Strategy 2: Pre-create RequestBuilder<Bitmap> or RequestBuilder<Drawable>, then invoke .load() (.k / .l / .m / .load)
            Object baseRb = createBitmapOrDrawableRequestBuilder(requestManager);
            if (baseRb != null) {
                String[] rbCandidateNames = new String[]{"k", "l", "m", "load"};
                for (String mName : rbCandidateNames) {
                    for (Method lm : baseRb.getClass().getMethods()) {
                        if (lm.getName().equals(mName)) {
                            Class<?>[] pt = lm.getParameterTypes();
                            if (pt.length == 1) {
                                Object arg = null;
                                if (pt[0].isInstance(targetModel) || pt[0] == Object.class) {
                                    arg = targetModel;
                                } else if (pt[0] == String.class && targetModel instanceof String) {
                                    arg = targetModel;
                                } else if (pt[0] == Uri.class && targetModel instanceof Uri) {
                                    arg = targetModel;
                                }
                                if (arg != null) {
                                    final Object finalArg = arg;
                                    try {
                                        lm.setAccessible(true);
                                        Object finalRb = lm.invoke(baseRb, finalArg);
                                        if (finalRb != null && isValidTranscodeTarget(finalRb) && isModelSet(finalRb) && hasIntoImageViewMethod(finalRb)) {
                                            if (!sLoggedGlideStrategy) {
                                                sLoggedGlideStrategy = true;
                                                Logger.printInfo(() -> "Loaded RequestBuilder via baseRb." + mName + "(" + finalArg.getClass().getSimpleName() + ")");
                                            }
                                            return finalRb;
                                        }
                                    } catch (Throwable ignored) {}
                                }
                            }
                        }
                    }
                }
            }

            // Strategy 3: Dynamic scan across all methods on RequestManager EXCLUDING known non-load methods
            for (Method m : rmClass.getMethods()) {
                String mn = m.getName();
                if (mn.equals("equals") || mn.equals("e") || mn.equals("d") || mn.equals("a") || mn.equals("c") || mn.equals("b")) continue;
                Class<?> rt = m.getReturnType();
                if (rt == void.class || rt.isPrimitive() || rt == Boolean.class || rt == boolean.class || rt == Object.class) continue;
                Class<?>[] pt = m.getParameterTypes();
                if (pt.length == 1) {
                    Object arg = null;
                    if (pt[0].isInstance(targetModel) || pt[0] == Object.class) {
                        arg = targetModel;
                    } else if (pt[0] == String.class && targetModel instanceof String) {
                        arg = targetModel;
                    } else if (pt[0] == Uri.class && targetModel instanceof Uri) {
                        arg = targetModel;
                    }
                    if (arg != null) {
                        try {
                            m.setAccessible(true);
                            Object res = m.invoke(requestManager, arg);
                            if (res != null && isValidTranscodeTarget(res) && isModelSet(res) && hasIntoImageViewMethod(res)) {
                                if (!sLoggedGlideStrategy) {
                                    sLoggedGlideStrategy = true;
                                    Logger.printInfo(() -> "Loaded RequestBuilder via fallback rm." + mn);
                                }
                                return res;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
        } catch (Throwable t) {
            Throwable cause = t.getCause() != null ? t.getCause() : t;
            Logger.printInfo(() -> "loadGlideRequestBuilder error: " + cause.getClass().getSimpleName() + ": " + cause.getMessage());
        }
        return null;
    }

    private static boolean isModelSet(Object requestBuilder) {
        if (requestBuilder == null) return false;
        try {
            for (Class<?> c = requestBuilder.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                try {
                    java.lang.reflect.Field f = c.getDeclaredField("H");
                    if (f.getType() == boolean.class) {
                        f.setAccessible(true);
                        return f.getBoolean(requestBuilder);
                    }
                } catch (NoSuchFieldException ignored) {}
            }
            // Fallback: check any boolean field that is true on the RequestBuilder
            for (Class<?> c = requestBuilder.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (f.getType() == boolean.class) {
                        f.setAccessible(true);
                        if (f.getBoolean(requestBuilder)) {
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static boolean isValidTranscodeTarget(Object requestBuilder) {
        if (requestBuilder == null) return false;
        try {
            for (Class<?> c = requestBuilder.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (f.getType() == Class.class) {
                        f.setAccessible(true);
                        Class<?> target = (Class<?>) f.get(requestBuilder);
                        if (target != null) {
                            if (File.class.isAssignableFrom(target)) {
                                return false;
                            }
                            if (Bitmap.class.isAssignableFrom(target) || Drawable.class.isAssignableFrom(target)) {
                                return true;
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return true;
    }

    private static Object createBitmapOrDrawableRequestBuilder(Object requestManager) {
        if (requestManager == null) return null;
        Class<?> rmClass = requestManager.getClass();
        // 1. Try as(Bitmap.class) or as(Drawable.class)
        for (Method m : rmClass.getMethods()) {
            if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == Class.class && !m.getReturnType().isPrimitive()) {
                try {
                    m.setAccessible(true);
                    Object rb = m.invoke(requestManager, Bitmap.class);
                    if (rb != null && hasIntoImageViewMethod(rb)) {
                        return rb;
                    }
                    rb = m.invoke(requestManager, Drawable.class);
                    if (rb != null && hasIntoImageViewMethod(rb)) {
                        return rb;
                    }
                } catch (Throwable ignored) {}
            }
        }
        // 2. Try zero-arg asBitmap() / asDrawable()
        for (Method m : rmClass.getMethods()) {
            if (m.getParameterTypes().length == 0 && !m.getReturnType().isPrimitive() && !m.getReturnType().equals(Object.class) && !m.getReturnType().equals(void.class)) {
                try {
                    m.setAccessible(true);
                    Object rb = m.invoke(requestManager);
                    if (rb != null && hasIntoImageViewMethod(rb)) {
                        return rb;
                    }
                } catch (Throwable ignored) {}
            }
        }
        return null;
    }

    private static boolean hasIntoImageViewMethod(Object requestBuilder) {
        if (requestBuilder == null) return false;
        if (!isValidTranscodeTarget(requestBuilder)) return false;
        try {
            for (Method m : requestBuilder.getClass().getMethods()) {
                Class<?>[] pt = m.getParameterTypes();
                if (pt.length == 1 && ImageView.class.isAssignableFrom(pt[0])) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static boolean applyGlideInto(Object requestBuilder, ImageView iv) {
        if (requestBuilder == null || iv == null) return false;
        try {
            for (Method m : requestBuilder.getClass().getMethods()) {
                Class<?>[] pt = m.getParameterTypes();
                if (pt.length == 1 && ImageView.class.isAssignableFrom(pt[0])) {
                    m.setAccessible(true);
                    m.invoke(requestBuilder, iv);
                    return true;
                }
            }
        } catch (Throwable t) {
            Throwable cause = t.getCause() != null ? t.getCause() : t;
            Logger.printInfo(() -> "applyGlideInto error: " + cause.getClass().getSimpleName() + ": " + cause.getMessage());
        }
        return false;
    }

    private static Bitmap submitGlideFuture(Object requestBuilder, int w, int h) {
        if (requestBuilder == null) return null;
        try {
            for (Method m : requestBuilder.getClass().getMethods()) {
                Class<?>[] pt = m.getParameterTypes();
                if (pt.length == 2 && pt[0] == int.class && pt[1] == int.class && java.util.concurrent.Future.class.isAssignableFrom(m.getReturnType())) {
                    m.setAccessible(true);
                    java.util.concurrent.Future<?> future = (java.util.concurrent.Future<?>) m.invoke(requestBuilder, w, h);
                    if (future != null) {
                        Object result = future.get(8, java.util.concurrent.TimeUnit.SECONDS);
                        if (result instanceof Bitmap) {
                            return (Bitmap) result;
                        } else if (result instanceof android.graphics.drawable.BitmapDrawable) {
                            return ((android.graphics.drawable.BitmapDrawable) result).getBitmap();
                        } else if (result instanceof android.graphics.drawable.Drawable) {
                            android.graphics.drawable.Drawable d = (android.graphics.drawable.Drawable) result;
                            int dw = d.getIntrinsicWidth() > 0 ? d.getIntrinsicWidth() : w;
                            int dh = d.getIntrinsicHeight() > 0 ? d.getIntrinsicHeight() : h;
                            Bitmap b = Bitmap.createBitmap(dw, dh, Bitmap.Config.ARGB_8888);
                            Canvas c = new Canvas(b);
                            d.setBounds(0, 0, dw, dh);
                            d.draw(c);
                            return b;
                        }
                    }
                    break;
                }
            }
        } catch (Throwable t) {
            Throwable cause = t.getCause() != null ? t.getCause() : t;
            Logger.printInfo(() -> "submitGlideFuture error: " + cause.getClass().getSimpleName() + ": " + cause.getMessage());
        }
        return null;
    }

    private static Bitmap loadLocalThumbnail(Context context, String urlStr) {
        if (urlStr == null || context == null) return null;
        try {
            if (urlStr.startsWith("content://") || urlStr.startsWith("file://") || urlStr.startsWith("/")) {
                if (Build.VERSION.SDK_INT >= 29) {
                    Uri uri = urlStr.startsWith("content://") ? Uri.parse(urlStr) : Uri.fromFile(new File(urlStr));
                    return context.getContentResolver().loadThumbnail(uri, new Size(128, 128), null);
                } else {
                    String path = urlStr.startsWith("file://") ? Uri.parse(urlStr).getPath() : urlStr;
                    return ThumbnailUtils.createImageThumbnail(path, MediaStore.Images.Thumbnails.MINI_KIND);
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static Bitmap fetchThumbSync(Context context, String urlStr, int accountId) {
        if (urlStr == null || urlStr.trim().isEmpty()) return null;
        if (context == null) context = app.morphe.extension.shared.Utils.getContext();
        if (context == null) return null;

        // 1. Primary for local media
        if (urlStr.startsWith("content://") || urlStr.startsWith("file://") || urlStr.startsWith("/")) {
            Bitmap local = loadLocalThumbnail(context, urlStr);
            if (local != null) return local;
        }

        // 2. Native Google Photos Glide loading
        try {
            Object rm = getGlideRequestManager(context);
            if (rm != null) {
                Object reqBuilder = loadGlideRequestBuilder(rm, urlStr, accountId);
                if (reqBuilder != null) {
                    Bitmap b = submitGlideFuture(reqBuilder, 128, 128);
                    if (b != null) return b;
                }
            }
        } catch (Throwable tGlide) {
            Logger.printInfo(() -> "fetchThumbSync Glide error: " + tGlide.getMessage());
        }

        // 3. Secondary fallback: raw HTTP connection (works for unauthenticated public URLs)
        try {
            String thumbUrl = urlStr.replace("=s0-d", "=s140-c");
            URL u = new URL(thumbUrl);
            HttpURLConnection conn = (HttpURLConnection) u.openConnection();
            conn.setConnectTimeout(2500);
            conn.setReadTimeout(2500);
            try (InputStream is = conn.getInputStream()) {
                BitmapFactory.Options opts = new BitmapFactory.Options();
                opts.inPreferredConfig = Bitmap.Config.RGB_565;
                return BitmapFactory.decodeStream(is, null, opts);
            }
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void loadThumbAsync(Activity activity, ImageView iv, String urlStr, int accountId) {
        iv.setImageDrawable(null);
        iv.setTag(urlStr);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        if (urlStr == null || urlStr.trim().isEmpty()) return;

        // 1. Memory cache check
        Bitmap cached = THUMB_CACHE.get(urlStr);
        if (cached != null) {
            iv.setImageBitmap(cached);
            return;
        }

        // 2. Instant local media loading for on-device photos
        if (urlStr.startsWith("content://") || urlStr.startsWith("file://") || urlStr.startsWith("/")) {
            THREAD_POOL.execute(() -> {
                Bitmap bm = loadLocalThumbnail(activity, urlStr);
                if (bm != null) {
                    THUMB_CACHE.put(urlStr, bm);
                    MAIN_HANDLER.post(() -> {
                        if (urlStr.equals(iv.getTag())) {
                            iv.setImageBitmap(bm);
                        }
                    });
                }
            });
            return;
        }

        // 3. Native Google Photos Glide loading
        try {
            Object rm = getGlideRequestManager(activity);
            if (rm != null) {
                Object reqBuilder = loadGlideRequestBuilder(rm, urlStr, accountId);
                if (reqBuilder != null && applyGlideInto(reqBuilder, iv)) {
                    return;
                }
            }
        } catch (Throwable tGlide) {
            Logger.printInfo(() -> "Glide loadThumbAsync error: " + tGlide.getMessage());
        }

        // 4. Background fetch fallback
        THREAD_POOL.execute(() -> {
            Bitmap bm = fetchThumbSync(activity, urlStr, accountId);
            if (bm != null) {
                THUMB_CACHE.put(urlStr, bm);
                MAIN_HANDLER.post(() -> {
                    if (urlStr.equals(iv.getTag())) {
                        iv.setImageBitmap(bm);
                    }
                });
            }
        });
    }

    // ─────────────────────────────────────────────────────────────────────────
    // UI Helpers (Theme Tokens & Reusable Cards)
    // ─────────────────────────────────────────────────────────────────────────
    public interface FilterStateProvider {
        String getActiveLabel();
    }

    public interface CardContentBuilder {
        void build(LinearLayout content, Runnable updateBadge);
    }

    private static View addFilterCard(Activity activity, LinearLayout container, float density, Theme theme,
                                      Set<String> expandedSet, String title, String subtitle,
                                      FilterStateProvider stateProvider, CardContentBuilder builder) {
        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);
        boolean isLandscape = activity != null && activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        boolean isCompact = isLarge && isLandscape;

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        int padH = (int) ((isCompact ? 9 : 14) * density);
        int padV = (int) ((isCompact ? 5.5f : 10) * density);
        card.setPadding(padH, padV, padH, padV);
        card.setBackground(createCardDrawable(false, density, theme));
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.bottomMargin = (int) ((isCompact ? 3.5f : 6) * density);
        card.setLayoutParams(cardLp);

        LinearLayout topRow = new LinearLayout(activity);
        topRow.setOrientation(LinearLayout.HORIZONTAL);
        topRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvT = new TextView(activity);
        tvT.setText(title);
        tvT.setTextSize(isCompact ? 11.5f : 13.5f);
        tvT.setTypeface(null, Typeface.BOLD);
        tvT.setTextColor(theme.textPrimary);
        topRow.addView(tvT, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView tvBadge = new TextView(activity);
        tvBadge.setTextSize(isCompact ? 9.5f : 10.5f);
        tvBadge.setTypeface(null, Typeface.BOLD);
        tvBadge.setTextColor(theme.onPrimary);
        tvBadge.setBackground(createActionPillDrawable(theme.primary, 10 * density));
        int bPadH = (int) ((isCompact ? 6 : 8) * density);
        int bPadV = (int) ((isCompact ? 2 : 2.5f) * density);
        tvBadge.setPadding(bPadH, bPadV, bPadH, bPadV);
        LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bLp.rightMargin = (int) ((isCompact ? 5 : 8) * density);
        tvBadge.setLayoutParams(bLp);
        tvBadge.setVisibility(View.GONE);
        topRow.addView(tvBadge);

        ImageView ivChev = new ImageView(activity);
        ivChev.setTag("no_avatar");
        ivChev.setContentDescription("expand/collapse");
        int chevType = expandedSet.contains(title) ? MaterialVectorDrawable.TYPE_CHEVRON_UP : MaterialVectorDrawable.TYPE_CHEVRON_DOWN;
        ivChev.setImageDrawable(new MaterialVectorDrawable(chevType, theme.textSecondary));
        int chevSize = (int) ((isCompact ? 16 : 20) * density);
        ivChev.setLayoutParams(new LinearLayout.LayoutParams(chevSize, chevSize));
        topRow.addView(ivChev);
        card.addView(topRow);

        final TextView tvS;
        if (subtitle != null && !subtitle.isEmpty()) {
            tvS = new TextView(activity);
            tvS.setText(subtitle);
            tvS.setTextSize(11.5f);
            tvS.setTextColor(theme.textSecondary);
            tvS.setPadding(0, (int) (2 * density), 0, 0);
            if (isCompact) {
                tvS.setVisibility(expandedSet.contains(title) ? View.VISIBLE : View.GONE);
            }
            card.addView(tvS);
        } else {
            tvS = null;
        }

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(0, (int) (10 * density), 0, (int) (4 * density));
        content.setVisibility(expandedSet.contains(title) ? View.VISIBLE : View.GONE);

        Runnable updateBadge = () -> {
            String label = stateProvider != null ? stateProvider.getActiveLabel() : null;
            if (label != null && !label.isEmpty()) {
                tvBadge.setText(label);
                tvBadge.setVisibility(View.VISIBLE);
                card.setBackground(createCardDrawable(true, density, theme));
            } else {
                tvBadge.setVisibility(View.GONE);
                card.setBackground(createCardDrawable(false, density, theme));
            }
        };

        builder.build(content, updateBadge);
        updateBadge.run();
        card.addView(content);

        Runnable collapseThis = () -> {
            expandedSet.remove(title);
            content.setVisibility(View.GONE);
            if (tvS != null && isCompact) tvS.setVisibility(View.GONE);
            ivChev.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_DOWN, theme.textSecondary));
        };
        card.setTag(collapseThis);

        View.OnClickListener toggle = v -> {
            if (expandedSet.contains(title)) {
                collapseThis.run();
            } else {
                // Smart Accordion: collapse sibling filter cards so only one stays open
                for (int i = 0; i < container.getChildCount(); i++) {
                    View child = container.getChildAt(i);
                    Object tag = child.getTag();
                    if (tag instanceof Runnable) {
                        ((Runnable) tag).run();
                    } else if (child instanceof ViewGroup) {
                        ViewGroup vg = (ViewGroup) child;
                        for (int j = 0; j < vg.getChildCount(); j++) {
                            Object cTag = vg.getChildAt(j).getTag();
                            if (cTag instanceof Runnable) {
                                ((Runnable) cTag).run();
                            }
                        }
                    }
                }
                expandedSet.clear();
                expandedSet.add(title);
                content.setVisibility(View.VISIBLE);
                if (tvS != null && isCompact) tvS.setVisibility(View.VISIBLE);
                ivChev.setImageDrawable(new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CHEVRON_UP, theme.textSecondary));
            }
        };

        card.setClickable(true);
        card.setOnClickListener(toggle);
        return card;
    }

    private static void addHorizontalOrStackedInputs(Activity activity, LinearLayout content, float density, View v1, View v2) {
        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);
        boolean isLandscape = activity != null && activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        if (isLarge && isLandscape) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams p1 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            p1.rightMargin = (int) (4 * density);
            v1.setLayoutParams(p1);
            row.addView(v1);

            LinearLayout.LayoutParams p2 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            p2.leftMargin = (int) (4 * density);
            v2.setLayoutParams(p2);
            row.addView(v2);

            content.addView(row);
        } else {
            content.addView(v1);
            content.addView(v2);
        }
    }

    private static int updateFilterVisibility(Activity activity, StorageScanner.SourceType src, Map<String, View> filterCards, LinearLayout container, float density) {
        if (filterCards == null || filterCards.isEmpty()) return 0;

        // Hide all initially
        for (View v : filterCards.values()) {
            if (v != null) v.setVisibility(View.GONE);
        }

        View v;

        // 1. Permanent Filters (Always visible on ALL sources including TRASH, matching user.js)
        if ((v = filterCards.get("dateInterval")) != null) v.setVisibility(View.VISIBLE);
        if ((v = filterCards.get("similarity")) != null) v.setVisibility(View.VISIBLE);
        if ((v = filterCards.get("duration")) != null) v.setVisibility(View.VISIBLE);
        if ((v = filterCards.get("type")) != null) v.setVisibility(View.VISIBLE);
        if ((v = filterCards.get("sortBySize")) != null) v.setVisibility(View.VISIBLE);

        // 2. Albums-only filter
        if (src == StorageScanner.SourceType.ALBUMS) {
            if ((v = filterCards.get("includeAlbums")) != null) v.setVisibility(View.VISIBLE);
        }

        // 3. Search-only filter
        if (src == StorageScanner.SourceType.SEARCH) {
            if ((v = filterCards.get("search")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("favorite")) != null) v.setVisibility(View.VISIBLE);
        }

        // 4. Filters visible in Library, Search, and Favorites
        if (src == StorageScanner.SourceType.LIBRARY || src == StorageScanner.SourceType.SEARCH || src == StorageScanner.SourceType.FAVORITES) {
            if ((v = filterCards.get("owned")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("uploadStatus")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("archive")) != null) v.setVisibility(View.VISIBLE);
        }

        // 5. Library-only filter
        if (src == StorageScanner.SourceType.LIBRARY) {
            if ((v = filterCards.get("excludeFavorites")) != null) v.setVisibility(View.VISIBLE);
        }

        // 6. Metadata filters visible everywhere EXCEPT Trash
        if (src != StorageScanner.SourceType.TRASH) {
            if ((v = filterCards.get("quality")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("size")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("resolution")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("location")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("filename")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("description")) != null) v.setVisibility(View.VISIBLE);
            if ((v = filterCards.get("space")) != null) v.setVisibility(View.VISIBLE);

            if (src != StorageScanner.SourceType.LOCKED) {
                if ((v = filterCards.get("excludeAlbums")) != null) v.setVisibility(View.VISIBLE);
            }
            if (src != StorageScanner.SourceType.SHARED) {
                if ((v = filterCards.get("excludeShared")) != null) v.setVisibility(View.VISIBLE);
            }
        }

        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);
        boolean isLandscape = activity != null && activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;

        if (container != null) {
            container.removeAllViews();
            List<View> visibleCards = new ArrayList<>();
            for (View card : filterCards.values()) {
                if (card != null && card.getVisibility() == View.VISIBLE) {
                    ViewGroup p = (ViewGroup) card.getParent();
                    if (p != null) p.removeView(card);
                    visibleCards.add(card);
                }
            }

            if (isLarge && isLandscape) {
                for (int i = 0; i < visibleCards.size(); i += 2) {
                    LinearLayout row = new LinearLayout(activity);
                    row.setOrientation(LinearLayout.HORIZONTAL);
                    LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    row.setLayoutParams(rLp);

                    View c1 = visibleCards.get(i);
                    LinearLayout.LayoutParams c1Lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
                    c1Lp.rightMargin = (int) (3 * density);
                    c1Lp.bottomMargin = (int) (3.5f * density);
                    c1.setLayoutParams(c1Lp);
                    row.addView(c1);

                    if (i + 1 < visibleCards.size()) {
                        View c2 = visibleCards.get(i + 1);
                        LinearLayout.LayoutParams c2Lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
                        c2Lp.leftMargin = (int) (3 * density);
                        c2Lp.bottomMargin = (int) (3.5f * density);
                        c2.setLayoutParams(c2Lp);
                        row.addView(c2);
                    } else {
                        View spacer = new View(activity);
                        LinearLayout.LayoutParams spLp = new LinearLayout.LayoutParams(0, 0, 1.0f);
                        spLp.leftMargin = (int) (3 * density);
                        spacer.setLayoutParams(spLp);
                        row.addView(spacer);
                    }
                    container.addView(row);
                }
            } else {
                for (View card : visibleCards) {
                    LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    cLp.bottomMargin = (int) (6 * density);
                    card.setLayoutParams(cLp);
                    container.addView(card);
                }
            }
            return visibleCards.size();
        }

        int visibleCount = 0;
        for (View card : filterCards.values()) {
            if (card != null && card.getVisibility() == View.VISIBLE) {
                visibleCount++;
            }
        }
        return visibleCount;
    }

    public interface OnDateTimeSelectedListener {
        void onSelected(long epochMs);
    }

    private static LinearLayout createDateTimePickerRow(Activity activity, float density, Theme theme, String label, long initialEpochMs, OnDateTimeSelectedListener listener) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, (int) (4 * density), 0, (int) (8 * density));

        TextView tvLabel = new TextView(activity);
        tvLabel.setText(label);
        tvLabel.setTextSize(12f);
        tvLabel.setTypeface(null, Typeface.BOLD);
        tvLabel.setTextColor(theme.textPrimary);
        tvLabel.setPadding(0, 0, 0, (int) (4 * density));
        row.addView(tvLabel);

        LinearLayout pickerControls = new LinearLayout(activity);
        pickerControls.setOrientation(LinearLayout.HORIZONTAL);
        pickerControls.setGravity(Gravity.CENTER_VERTICAL);

        Calendar cal = Calendar.getInstance();
        if (initialEpochMs > 0) {
            cal.setTimeInMillis(initialEpochMs);
        }

        final long[] selectedTime = new long[]{initialEpochMs};

        SimpleDateFormat dFmt = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
        SimpleDateFormat tFmt = new SimpleDateFormat("HH:mm", Locale.getDefault());

        TextView btnDate = new TextView(activity);
        btnDate.setText(initialEpochMs > 0 ? dFmt.format(new Date(initialEpochMs)) : "Select Date");
        btnDate.setTextSize(12.5f);
        btnDate.setTextColor(initialEpochMs > 0 ? theme.primary : theme.textSecondary);
        btnDate.setGravity(Gravity.CENTER);
        btnDate.setPadding((int) (12 * density), (int) (8 * density), (int) (12 * density), (int) (8 * density));
        btnDate.setBackground(createRoundedDrawable(theme.searchInputBg, 8 * density));
        LinearLayout.LayoutParams dateLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.2f);
        dateLp.rightMargin = (int) (6 * density);
        btnDate.setLayoutParams(dateLp);

        TextView btnTime = new TextView(activity);
        btnTime.setText(initialEpochMs > 0 ? tFmt.format(new Date(initialEpochMs)) : "Select Time");
        btnTime.setTextSize(12.5f);
        btnTime.setTextColor(initialEpochMs > 0 ? theme.primary : theme.textSecondary);
        btnTime.setGravity(Gravity.CENTER);
        btnTime.setPadding((int) (12 * density), (int) (8 * density), (int) (12 * density), (int) (8 * density));
        btnTime.setBackground(createRoundedDrawable(theme.searchInputBg, 8 * density));
        LinearLayout.LayoutParams timeLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        timeLp.rightMargin = (int) (6 * density);
        btnTime.setLayoutParams(timeLp);

        TextView btnClear = new TextView(activity);
        btnClear.setText("Clear");
        btnClear.setTextSize(11.5f);
        btnClear.setTextColor(theme.isDark ? 0xFFFFB4AB : 0xFFBA1A1A);
        btnClear.setGravity(Gravity.CENTER);
        btnClear.setPadding((int) (10 * density), (int) (8 * density), (int) (10 * density), (int) (8 * density));
        btnClear.setBackground(createRoundedDrawable(theme.surfaceContainer, 8 * density));

        btnDate.setOnClickListener(v -> {
            DatePickerDialog dpd = new DatePickerDialog(activity, (view, year, month, dayOfMonth) -> {
                cal.set(Calendar.YEAR, year);
                cal.set(Calendar.MONTH, month);
                cal.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                selectedTime[0] = cal.getTimeInMillis();
                btnDate.setText(dFmt.format(cal.getTime()));
                btnDate.setTextColor(theme.primary);
                listener.onSelected(selectedTime[0]);
            }, cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH));
            dpd.show();
        });

        btnTime.setOnClickListener(v -> {
            TimePickerDialog tpd = new TimePickerDialog(activity, (view, hourOfDay, minute) -> {
                cal.set(Calendar.HOUR_OF_DAY, hourOfDay);
                cal.set(Calendar.MINUTE, minute);
                cal.set(Calendar.SECOND, 0);
                selectedTime[0] = cal.getTimeInMillis();
                btnTime.setText(tFmt.format(cal.getTime()));
                btnTime.setTextColor(theme.primary);
                listener.onSelected(selectedTime[0]);
            }, cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE), true);
            tpd.show();
        });

        btnClear.setOnClickListener(v -> {
            selectedTime[0] = 0;
            btnDate.setText("Select Date");
            btnDate.setTextColor(theme.textSecondary);
            btnTime.setText("Select Time");
            btnTime.setTextColor(theme.textSecondary);
            listener.onSelected(0);
        });

        pickerControls.addView(btnDate);
        pickerControls.addView(btnTime);
        pickerControls.addView(btnClear);
        row.addView(pickerControls);
        return row;
    }

    public static long parseBytesInput(String s) {
        if (s == null) return 0;
        String str = s.trim().toUpperCase(Locale.ROOT).replace(",", "");
        if (str.isEmpty()) return 0;
        try {
            if (str.endsWith("GB") || str.endsWith("G")) {
                String num = str.replaceAll("[A-Z]", "").trim();
                return (long) (Double.parseDouble(num) * 1024L * 1024L * 1024L);
            } else if (str.endsWith("MB") || str.endsWith("M")) {
                String num = str.replaceAll("[A-Z]", "").trim();
                return (long) (Double.parseDouble(num) * 1024L * 1024L);
            } else if (str.endsWith("KB") || str.endsWith("K")) {
                String num = str.replaceAll("[A-Z]", "").trim();
                return (long) (Double.parseDouble(num) * 1024L);
            } else {
                return Long.parseLong(str);
            }
        } catch (Exception ignored) {
            return 0;
        }
    }

    private static EditText createFilterInput(Activity activity, float density, Theme theme, String hint) {
        EditText et = new EditText(activity);
        et.setHint(hint);
        et.setTextSize(13.5f);
        et.setTextColor(theme.textPrimary);
        et.setHintTextColor(theme.textSecondary);
        et.setBackground(createRoundedDrawable(theme.searchInputBg, 12 * density));
        int p = (int) (12 * density);
        et.setPadding(p, (int) (10 * density), p, (int) (10 * density));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = (int) (6 * density);
        et.setLayoutParams(lp);
        return et;
    }

    public interface OnRadioSelected {
        void onSelected(int index);
    }

    private static RadioGroup createRadioGroup(Activity activity, String[] labels, int defaultIdx, Theme theme, OnRadioSelected listener) {
        RadioGroup rg = new RadioGroup(activity);
        boolean isLarge = PhenotypeFlagManager.isLargeScreen(activity);
        boolean isLandscape = activity != null && activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        float density = activity.getResources().getDisplayMetrics().density;

        if (isLarge && isLandscape) {
            rg.setOrientation(RadioGroup.HORIZONTAL);
            LinearLayout.LayoutParams rgLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rgLp.topMargin = (int) (4 * density);
            rgLp.bottomMargin = (int) (4 * density);
            rg.setLayoutParams(rgLp);

            int selectedId = -1;
            for (int i = 0; i < labels.length; i++) {
                RadioButton rb = new RadioButton(activity);
                int id = View.generateViewId();
                rb.setId(id);
                rb.setTag(i);
                rb.setText(labels[i]);
                rb.setTextSize(labels.length > 3 ? 10.5f : 11.5f);
                rb.setTypeface(null, Typeface.BOLD);
                rb.setGravity(Gravity.CENTER);
                rb.setButtonDrawable(new ColorDrawable(Color.TRANSPARENT));

                int padV = (int) (6.5f * density);
                int padH = (int) (4 * density);
                rb.setPadding(padH, padV, padH, padV);

                boolean isChecked = (i == defaultIdx);
                rb.setTextColor(isChecked ? theme.onPrimaryContainer : theme.textSecondary);
                rb.setBackground(createActionPillDrawable(isChecked ? theme.primaryContainer : theme.surfaceContainer, 10 * density));

                RadioGroup.LayoutParams rLp = new RadioGroup.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
                if (i > 0) rLp.leftMargin = (int) (4 * density);
                rb.setLayoutParams(rLp);

                rg.addView(rb);
                if (isChecked) {
                    selectedId = id;
                }
            }

            if (selectedId != -1) {
                rg.check(selectedId);
            }

            rg.setOnCheckedChangeListener((group, checkedId) -> {
                for (int c = 0; c < group.getChildCount(); c++) {
                    View child = group.getChildAt(c);
                    if (child instanceof RadioButton) {
                        boolean checked = (child.getId() == checkedId);
                        child.setBackground(createActionPillDrawable(checked ? theme.primaryContainer : theme.surfaceContainer, 10 * density));
                        ((RadioButton) child).setTextColor(checked ? theme.onPrimaryContainer : theme.textSecondary);
                    }
                }
                View v = group.findViewById(checkedId);
                if (v != null && v.getTag() instanceof Integer) {
                    listener.onSelected((Integer) v.getTag());
                }
            });
        } else {
            rg.setOrientation(RadioGroup.VERTICAL);
            int selectedId = -1;
            int padV = (int) (6 * density);
            for (int i = 0; i < labels.length; i++) {
                RadioButton rb = new RadioButton(activity);
                int id = View.generateViewId();
                rb.setId(id);
                rb.setTag(i);
                rb.setText(labels[i]);
                rb.setTextSize(13f);
                rb.setTextColor(theme.textPrimary);
                rb.setPadding(rb.getPaddingLeft(), padV, rb.getPaddingRight(), padV);
                rg.addView(rb);
                if (i == defaultIdx) {
                    selectedId = id;
                }
            }
            if (selectedId != -1) {
                rg.check(selectedId);
            }
            rg.setOnCheckedChangeListener((group, checkedId) -> {
                View v = group.findViewById(checkedId);
                if (v != null && v.getTag() instanceof Integer) {
                    int idx = (Integer) v.getTag();
                    listener.onSelected(idx);
                } else {
                    for (int i = 0; i < group.getChildCount(); i++) {
                        if (group.getChildAt(i).getId() == checkedId) {
                            listener.onSelected(i);
                            break;
                        }
                    }
                }
            });
        }
        return rg;
    }

    private static void showActionConfirmDialog(Activity activity, String msg, Runnable onConfirm, float density, Theme theme) {
        showActionConfirmDialog(activity, null, msg, "Confirm", onConfirm, density, theme);
    }

    private static void showActionConfirmDialog(Activity activity, String title, String msg, String confirmBtnText, Runnable onConfirm, float density, Theme theme) {
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackground(createRoundedDrawable(theme.surface, 20 * density));
        int p = (int) (20 * density);
        box.setPadding(p, p, p, (int) (14 * density));

        if (title != null && !title.isEmpty()) {
            TextView tvTitle = new TextView(activity);
            tvTitle.setText(title);
            tvTitle.setTextSize(16f);
            tvTitle.setTextColor(theme.textPrimary);
            tvTitle.setTypeface(null, Typeface.BOLD);
            tvTitle.setPadding(0, 0, 0, (int) (8 * density));
            box.addView(tvTitle);
        }

        TextView tv = new TextView(activity);
        tv.setText(msg);
        tv.setTextSize(13.5f);
        tv.setTextColor(title != null ? theme.textSecondary : theme.textPrimary);
        if (title == null) {
            tv.setTypeface(null, Typeface.BOLD);
        }
        tv.setLineSpacing(0, 1.15f);
        box.addView(tv);

        LinearLayout btnRow = new LinearLayout(activity);
        btnRow.setOrientation(LinearLayout.HORIZONTAL);
        btnRow.setGravity(Gravity.END);
        btnRow.setPadding(0, (int) (16 * density), 0, 0);

        TextView btnCancel = new TextView(activity);
        btnCancel.setText("Cancel");
        btnCancel.setTextSize(13f);
        btnCancel.setTextColor(theme.primary);
        btnCancel.setPadding((int) (14 * density), (int) (8 * density), (int) (14 * density), (int) (8 * density));
        btnCancel.setBackground(createActionPillDrawable(theme.surfaceContainer, 14 * density));
        btnCancel.setOnClickListener(v -> d.dismiss());
        btnRow.addView(btnCancel);

        TextView btnOk = new TextView(activity);
        btnOk.setText(confirmBtnText != null ? confirmBtnText : "Confirm");
        btnOk.setTextSize(13f);
        btnOk.setTypeface(null, Typeface.BOLD);
        btnOk.setTextColor(theme.onPrimary);
        btnOk.setPadding((int) (16 * density), (int) (8 * density), (int) (16 * density), (int) (8 * density));
        btnOk.setBackground(createActionPillDrawable(theme.isDark ? 0xFFBA1A1A : 0xFFB3261E, 14 * density));
        LinearLayout.LayoutParams okLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        okLp.leftMargin = (int) (8 * density);
        btnOk.setLayoutParams(okLp);
        btnOk.setOnClickListener(v -> {
            d.dismiss();
            if (onConfirm != null) onConfirm.run();
        });
        btnRow.addView(btnOk);

        box.addView(btnRow);
        d.setContentView(box);
        d.show();

        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (screenWidth * 0.88f), (int) (400 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
            w.setGravity(Gravity.CENTER);
        }
    }

    private static String getItemKey(StorageScanner.MediaItem it) {
        if (it == null) return "";
        if (it.mediaKey != null && !it.mediaKey.isEmpty()) return it.mediaKey;
        if (it.filename != null && !it.filename.isEmpty()) return it.filename;
        return String.valueOf(it.dedupKey);
    }

    private static class DebounceWatcher implements TextWatcher {
        private final SimpleConsumer consumer;
        private final Runnable onDebounced;
        private Runnable pending;

        DebounceWatcher(SimpleConsumer consumer, Runnable onDebounced) {
            this.consumer = consumer;
            this.onDebounced = onDebounced;
        }

        @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
        @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
            consumer.accept(s.toString());
            if (onDebounced != null) {
                if (pending != null) MAIN_HANDLER.removeCallbacks(pending);
                pending = onDebounced;
                MAIN_HANDLER.postDelayed(pending, 450);
            }
        }
        @Override public void afterTextChanged(Editable s) {}
    }

    private static class SimpleWatcher implements TextWatcher {
        private final SimpleConsumer consumer;
        SimpleWatcher(SimpleConsumer consumer) { this.consumer = consumer; }
        @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
        @Override public void onTextChanged(CharSequence s, int start, int before, int count) { consumer.accept(s.toString()); }
        @Override public void afterTextChanged(Editable s) {}
    }

    private interface SimpleConsumer {
        void accept(String s);
    }

    private static GradientDrawable createRoundedDrawable(int color, float radiusPx) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(radiusPx);
        gd.setColor(color);
        return gd;
    }

    private static GradientDrawable createCardDrawable(boolean active, float density, Theme theme) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(14 * density);
        gd.setColor(active ? theme.cardActive : theme.card);
        gd.setStroke(active ? (int) (1.5f * density) : (int) (1 * density),
                active ? theme.cardBorderActive : theme.cardBorder);
        return gd;
    }

    private static Drawable createActionPillDrawable(int bgColor, float radiusPx) {
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(radiusPx);
        shape.setColor(bgColor);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            GradientDrawable mask = new GradientDrawable();
            mask.setCornerRadius(radiusPx);
            mask.setColor(Color.WHITE);
            ColorStateList rippleColor = ColorStateList.valueOf(0x22888888);
            return new RippleDrawable(rippleColor, shape, mask);
        }
        return shape;
    }

    private static View createHeaderIconButton(Activity activity, Drawable iconDrawable, int touchSizePx, int iconSizePx) {
        FrameLayout box = new FrameLayout(activity);
        box.setClickable(true);
        box.setFocusable(true);
        box.setTag("toolkit_no_avatar");
        box.setLayoutParams(new LinearLayout.LayoutParams(touchSizePx, touchSizePx));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            TypedValue outValue = new TypedValue();
            activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, outValue, true);
            box.setBackgroundResource(outValue.resourceId);
        }

        ImageView iv = new ImageView(activity);
        iv.setImageDrawable(iconDrawable);
        FrameLayout.LayoutParams ivLp = new FrameLayout.LayoutParams(iconSizePx, iconSizePx, Gravity.CENTER);
        iv.setLayoutParams(ivLp);
        box.addView(iv);
        return box;
    }

    private static View createHeaderIconButton(Activity activity, Drawable iconDrawable, int touchSizePx) {
        return createHeaderIconButton(activity, iconDrawable, touchSizePx, (int) (touchSizePx * 0.5f));
    }

    private static View createHeaderIconButton(Activity activity, int color, int touchSizePx) {
        return createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, color), touchSizePx, (int) (touchSizePx * 0.5f));
    }

    private static View createHeaderIconButton(Activity activity, String iconText, int color, int touchSizePx) {
        return createHeaderIconButton(activity, new MaterialVectorDrawable(MaterialVectorDrawable.TYPE_CLOSE, color), touchSizePx, (int) (touchSizePx * 0.5f));
    }

    private static void authenticateLockedFolderAccess(Activity activity, Runnable onSuccess, Runnable onCancelled) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            if (onCancelled != null) onCancelled.run();
            return;
        }

        try {
            KeyguardManager km = (KeyguardManager) activity.getSystemService(Context.KEYGUARD_SERVICE);
            if (km != null && !km.isDeviceSecure()) {
                if (onSuccess != null) onSuccess.run();
                return;
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                BiometricPrompt.Builder builder = new BiometricPrompt.Builder(activity)
                        .setTitle("Locked Folder")
                        .setDescription("Authenticate to view private media in Locked Folder");

                java.util.concurrent.Executor executor = r -> MAIN_HANDLER.post(r);

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    builder.setAllowedAuthenticators(
                            android.hardware.biometrics.BiometricManager.Authenticators.BIOMETRIC_STRONG |
                            android.hardware.biometrics.BiometricManager.Authenticators.DEVICE_CREDENTIAL
                    );
                } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    builder.setDeviceCredentialAllowed(true);
                } else {
                    builder.setNegativeButton("Cancel", executor, (d, w) -> {
                        if (onCancelled != null) onCancelled.run();
                    });
                }

                CancellationSignal signal = new CancellationSignal();
                BiometricPrompt prompt = builder.build();
                prompt.authenticate(signal, executor, new BiometricPrompt.AuthenticationCallback() {
                    @Override
                    public void onAuthenticationSucceeded(BiometricPrompt.AuthenticationResult result) {
                        MAIN_HANDLER.post(() -> {
                            if (onSuccess != null) onSuccess.run();
                        });
                    }

                    @Override
                    public void onAuthenticationError(int errorCode, CharSequence errString) {
                        MAIN_HANDLER.post(() -> {
                            if (onCancelled != null) onCancelled.run();
                        });
                    }

                    @Override
                    public void onAuthenticationFailed() {
                        // Let biometric prompt handle retry on mismatches
                    }
                });
                return;
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Biometric authentication error", t);
        }

        if (onSuccess != null) onSuccess.run();
    }
}
