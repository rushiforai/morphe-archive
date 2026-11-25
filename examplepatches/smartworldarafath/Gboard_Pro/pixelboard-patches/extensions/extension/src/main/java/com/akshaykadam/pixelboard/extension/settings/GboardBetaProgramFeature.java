package com.akshaykadam.pixelboard.extension.settings;

import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.os.Build;
import android.provider.OpenableColumns;
import android.text.InputType;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.akshaykadam.pixelboard.extension.updater.GboardBetaManager;
import com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateManager;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Additional -> Beta Program hub containing "Beta version testing" and "New features (Beta)".
 */
public final class GboardBetaProgramFeature implements GboardPatchesSettingsContract.Feature {

    private final Context context;

    public GboardBetaProgramFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Beta Program";
    }

    @Override
    public String getEntrySummary() {
        return "Beta version testing & experimental features";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Arrays.asList(
                new BetaVersionTestingFeature(context),
                new NewBetaFeaturesFeature(context)
        );
    }

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        final Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
        boolean featuresEnabled = GboardBetaManager.isBetaFeaturesSliderEnabled(ctx);

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Beta version testing",
                "Pre-release beta APKs, testing features & beta bug reports",
                true,
                () -> GboardPatchesSettingsContract.openFeature(host, new BetaVersionTestingFeature(ctx))
        ));
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "New features (Beta)",
                featuresEnabled
                        ? "Experimental features slider is ON"
                        : "Turn on to preview upcoming beta features",
                true,
                () -> GboardPatchesSettingsContract.openFeature(host, new NewBetaFeaturesFeature(ctx))
        ));

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
        sections.add(new GboardPatchesSettingsContract.Section("BETA PROGRAM", rows));

        return new GboardPatchesSettingsContract.Screen(
                "Beta Program",
                null,
                "Beta Program",
                "Early access beta APK testing and upcoming experimental features",
                Collections.emptyList(),
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false
        );
    }

    /**
     * Screen for pre-release Beta APK testing, real-time animated downloads,
     * emoji-free testing notes, and beta-only bug reports with up to 5 screenshots.
     */
    public static final class BetaVersionTestingFeature implements GboardPatchesSettingsContract.Feature {

        private static final String GITHUB_ISSUES_NEW_URL =
                "https://github.com/smartworldarafath/Gboard_Pro/issues/new";
        private static final int MAX_SCREENSHOTS = 5;

        private final Context context;
        private final List<Uri> attachedScreenshots = new ArrayList<>();
        private boolean initialCheckTriggered = false;

        public BetaVersionTestingFeature(Context context) {
            this.context = context;
        }

        @Override
        public String getEntryTitle() {
            return "Beta version testing";
        }

        @Override
        public String getEntrySummary() {
            return "Pre-release APK testing & beta bug reporting";
        }

        @Override
        public boolean isAvailable(Context context) {
            return true;
        }

        @Override
        public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
        }

        @Override
        public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
            return new GboardPatchesSettingsContract.Screen(
                    "Beta version testing",
                    null,
                    "Beta version testing",
                    "Pre-release beta builds and testing feedback",
                    Collections.emptyList(),
                    Collections.emptyList(),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    null,
                    false
            );
        }

        public View buildTestingView(
                final GboardPatchesSettingsActivity activity,
                final GboardM3Helper.Palette palette) {
            final boolean liquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(activity);
            final GboardBetaManager betaManager = GboardBetaManager.getInstance();

            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            // 1. English Pre-release Testing Notice Card
            LinearLayout noticeCard = createSectionCard(activity, palette, liquidGlass);
            noticeCard.addView(createSectionLabel(activity, palette, "BETA TESTING NOTICE"));
            TextView noticeText = new TextView(activity);
            noticeText.setText(
                    "Beta versions are released here for testing before an upcoming stable version launches. "
                    + "Because these builds are pre-release test versions, app crashes, unexpected glitches, or features "
                    + "not working properly may happen and bugs can be present. If you would like to test new upcoming "
                    + "versions prior to the next stable release, you can download and use them from here.");
            noticeText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            noticeText.setLineSpacing(GboardM3Helper.dpF(activity, 2f), 1.25f);
            noticeText.setTextColor(palette.textSecondary);
            LinearLayout.LayoutParams noticeLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            noticeLp.topMargin = GboardM3Helper.dp(activity, 8);
            noticeCard.addView(noticeText, noticeLp);
            addCardWithMargin(root, activity, noticeCard, 14);

            // 2. Beta APK Download & Real-time Progress Card
            LinearLayout apkCard = createSectionCard(activity, palette, liquidGlass);
            apkCard.addView(createSectionLabel(activity, palette, "BETA APK RELEASE"));

            final TextView apkHeadline = new TextView(activity);
            apkHeadline.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
            apkHeadline.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            apkHeadline.setTextColor(palette.textPrimary);
            LinearLayout.LayoutParams hlLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            hlLp.topMargin = GboardM3Helper.dp(activity, 8);
            apkCard.addView(apkHeadline, hlLp);

            final TextView apkSubtext = new TextView(activity);
            apkSubtext.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            apkSubtext.setLineSpacing(GboardM3Helper.dpF(activity, 1.5f), 1.2f);
            apkSubtext.setTextColor(palette.textSecondary);
            LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            subLp.topMargin = GboardM3Helper.dp(activity, 4);
            apkCard.addView(apkSubtext, subLp);

            final LinearLayout progressGroup = new LinearLayout(activity);
            progressGroup.setOrientation(LinearLayout.VERTICAL);
            progressGroup.setVisibility(View.GONE);
            LinearLayout.LayoutParams pgLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            pgLp.topMargin = GboardM3Helper.dp(activity, 12);

            final ProgressBar progressBar = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
            progressBar.setMax(1000);
            progressBar.setProgress(0);
            progressBar.setProgressDrawable(createAnimatedProgressDrawable(activity, palette));
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, GboardM3Helper.dp(activity, 8));
            progressGroup.addView(progressBar, barLp);

            LinearLayout metricsRow = new LinearLayout(activity);
            metricsRow.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams mrLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            mrLp.topMargin = GboardM3Helper.dp(activity, 6);

            final TextView bytesSpeedView = new TextView(activity);
            bytesSpeedView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            bytesSpeedView.setTextColor(palette.textSecondary);
            metricsRow.addView(bytesSpeedView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            final TextView percentView = new TextView(activity);
            percentView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            percentView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            percentView.setTextColor(palette.accent);
            metricsRow.addView(percentView);

            progressGroup.addView(metricsRow, mrLp);
            apkCard.addView(progressGroup, pgLp);

            final TextView apkActionBtn = createActionPillButton(activity, palette, liquidGlass, "Check for Beta APK");
            LinearLayout.LayoutParams btnLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, GboardM3Helper.dp(activity, 48));
            btnLp.topMargin = GboardM3Helper.dp(activity, 14);
            apkCard.addView(apkActionBtn, btnLp);
            addCardWithMargin(root, activity, apkCard, 14);

            // 3. New Testing Features Bullet Card (strictly zero emojis)
            LinearLayout featuresCard = createSectionCard(activity, palette, liquidGlass);
            featuresCard.addView(createSectionLabel(activity, palette, "NEW TESTING FEATURES"));
            final LinearLayout featuresBulletsContainer = new LinearLayout(activity);
            featuresBulletsContainer.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams fbLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            fbLp.topMargin = GboardM3Helper.dp(activity, 8);
            featuresCard.addView(featuresBulletsContainer, fbLp);
            addCardWithMargin(root, activity, featuresCard, 14);

            final Runnable[] refreshApkAndFeatures = new Runnable[1];
            refreshApkAndFeatures[0] = () -> {
                GboardBetaManager.DownloadState st = betaManager.getDownloadState();
                GboardBetaManager.BetaBuildInfo info = betaManager.getActiveBetaBuild();

                if (st == GboardBetaManager.DownloadState.CHECKING) {
                    apkHeadline.setText("Checking for active beta testing build...");
                    apkSubtext.setText("Looking for an active beta APK published for testing.");
                    progressGroup.setVisibility(View.GONE);
                    apkActionBtn.setText("Checking...");
                    apkActionBtn.setEnabled(false);
                    apkActionBtn.setAlpha(0.6f);
                } else if (info == null) {
                    apkHeadline.setText("No beta version testing is active");
                    apkSubtext.setText("Currently there is no beta testing APK published. When a new beta APK is uploaded for testing, it will appear here for download.");
                    progressGroup.setVisibility(View.GONE);
                    apkActionBtn.setText("Check for Beta APK");
                    apkActionBtn.setEnabled(true);
                    apkActionBtn.setAlpha(1f);
                } else if (st == GboardBetaManager.DownloadState.DOWNLOADING) {
                    apkHeadline.setText("Gboard Pro " + info.version);
                    apkSubtext.setText("Downloading " + info.apkFileName);
                    progressGroup.setVisibility(View.VISIBLE);
                    int pct = betaManager.getProgressPercent();
                    int targetProg = pct * 10;
                    ObjectAnimator anim = ObjectAnimator.ofInt(progressBar, "progress", progressBar.getProgress(), targetProg);
                    anim.setDuration(180L);
                    anim.setInterpolator(new DecelerateInterpolator());
                    anim.start();
                    percentView.setText(pct + "%");
                    String speedStr = betaManager.getSpeedMbps() > 0.05f
                            ? String.format(Locale.US, "%.1f MB/s", betaManager.getSpeedMbps())
                            : "Starting...";
                    bytesSpeedView.setText(formatSizeMb(betaManager.getDownloadedBytes())
                            + " / " + formatSizeMb(betaManager.getTotalBytes()) + "  (" + speedStr + ")");
                    apkActionBtn.setText("Downloading Beta APK (" + pct + "%)");
                    apkActionBtn.setEnabled(false);
                    apkActionBtn.setAlpha(0.75f);
                } else if (st == GboardBetaManager.DownloadState.COMPLETED) {
                    apkHeadline.setText("Gboard Pro " + info.version);
                    apkSubtext.setText("Beta APK downloaded and ready to install.");
                    progressGroup.setVisibility(View.VISIBLE);
                    progressBar.setProgress(1000);
                    percentView.setText("100%");
                    bytesSpeedView.setText(formatSizeMb(betaManager.getTotalBytes()) + " completed");
                    apkActionBtn.setText("Install Beta APK");
                    apkActionBtn.setEnabled(true);
                    apkActionBtn.setAlpha(1f);
                } else {
                    apkHeadline.setText("Gboard Pro " + info.version);
                    String sizeText = info.apkSizeBytes > 0 ? (" (" + formatSizeMb(info.apkSizeBytes) + ")") : "";
                    String extraErr = (st == GboardBetaManager.DownloadState.ERROR && !TextUtils.isEmpty(betaManager.getLastError()))
                            ? (" - " + betaManager.getLastError()) : "";
                    apkSubtext.setText(info.apkFileName + sizeText + extraErr);
                    progressGroup.setVisibility(View.GONE);
                    apkActionBtn.setText("Download Beta APK");
                    apkActionBtn.setEnabled(true);
                    apkActionBtn.setAlpha(1f);
                }

                // Populate emoji-free testing feature bullets
                featuresBulletsContainer.removeAllViews();
                List<String> rawBullets = (info != null && !info.testingFeatures.isEmpty())
                        ? info.testingFeatures
                        : Collections.singletonList("No active beta testing build features are listed right now.");
                for (int i = 0; i < rawBullets.size(); i++) {
                    String cleanLine = GboardBetaManager.stripEmojis(rawBullets.get(i));
                    if (TextUtils.isEmpty(cleanLine)) continue;
                    LinearLayout row = new LinearLayout(activity);
                    row.setOrientation(LinearLayout.HORIZONTAL);
                    LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    if (i > 0) rLp.topMargin = GboardM3Helper.dp(activity, 6);

                    TextView dot = new TextView(activity);
                    dot.setText("\u2022");
                    dot.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                    dot.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                    dot.setTextColor(palette.accent);
                    dot.setPadding(0, 0, GboardM3Helper.dp(activity, 8), 0);
                    row.addView(dot);

                    TextView lineTv = new TextView(activity);
                    lineTv.setText(cleanLine);
                    lineTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                    lineTv.setLineSpacing(GboardM3Helper.dpF(activity, 1.5f), 1.2f);
                    lineTv.setTextColor(palette.textSecondary);
                    row.addView(lineTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                    featuresBulletsContainer.addView(row, rLp);
                }
            };

            apkActionBtn.setOnClickListener(v -> {
                GboardBetaManager.BetaBuildInfo info = betaManager.getActiveBetaBuild();
                GboardBetaManager.DownloadState st = betaManager.getDownloadState();
                if (info == null) {
                    betaManager.checkForActiveBetaApk(activity, (found, err) -> {
                        refreshApkAndFeatures[0].run();
                        if (found == null) {
                            Toast.makeText(activity,
                                    err != null ? err : "Currently no beta version testing is active.",
                                    Toast.LENGTH_SHORT).show();
                        }
                    });
                    refreshApkAndFeatures[0].run();
                } else if (st == GboardBetaManager.DownloadState.COMPLETED && betaManager.getDownloadedApkUri() != null) {
                    PixelBoardUpdateManager.promptInstallApk(activity, betaManager.getDownloadedApkUri());
                } else if (st != GboardBetaManager.DownloadState.DOWNLOADING) {
                    betaManager.downloadBetaApk(activity, info, refreshApkAndFeatures[0]);
                }
            });

            refreshApkAndFeatures[0].run();
            if (!initialCheckTriggered) {
                initialCheckTriggered = true;
                betaManager.checkForActiveBetaApk(activity, false, (found, err) -> refreshApkAndFeatures[0].run());
            }

            // 4. Beta Bug Report & Feedback Form (ONLY active when a beta version is installed)
            final boolean betaInstalled = GboardBetaManager.isBetaVersionInstalled(activity);
            final String installedBetaVersion = GboardBetaManager.getInstalledBetaLabel(activity);
            final String deviceSummary = buildDeviceSummary();

            LinearLayout reportCard = createSectionCard(activity, palette, liquidGlass);
            reportCard.addView(createSectionLabel(activity, palette, "BETA BUG REPORT & FEEDBACK"));

            TextView gateBanner = new TextView(activity);
            gateBanner.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            gateBanner.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            gateBanner.setPadding(
                    GboardM3Helper.dp(activity, 12), GboardM3Helper.dp(activity, 8),
                    GboardM3Helper.dp(activity, 12), GboardM3Helper.dp(activity, 8));
            GradientDrawable bannerBg = new GradientDrawable();
            bannerBg.setCornerRadius(GboardM3Helper.dp(activity, 10));
            if (betaInstalled) {
                gateBanner.setText("Beta installed (" + installedBetaVersion + ") - Feedback active");
                gateBanner.setTextColor(palette.accent);
                bannerBg.setColor(GboardM3Helper.blendAlpha(palette.accent, 0.14f));
            } else {
                gateBanner.setText("Unavailable on stable build - Install a beta version to report beta bugs");
                gateBanner.setTextColor(0xFFD97706);
                bannerBg.setColor(0x22D97706);
            }
            gateBanner.setBackground(bannerBg);
            LinearLayout.LayoutParams gbLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            gbLp.topMargin = GboardM3Helper.dp(activity, 8);
            reportCard.addView(gateBanner, gbLp);

            reportCard.addView(createFieldLabel(activity, palette, "Device model", 12));
            final EditText deviceInput = createStyledEditText(
                    activity, palette, liquidGlass, "Device model", deviceSummary, false, betaInstalled);
            deviceInput.setImeOptions(EditorInfo.IME_ACTION_NEXT);
            reportCard.addView(deviceInput);

            reportCard.addView(createFieldLabel(activity, palette, "App beta version (Auto)", 12));
            final EditText versionInput = createStyledEditText(
                    activity, palette, liquidGlass, "Beta version", installedBetaVersion, false, false);
            versionInput.setKeyListener(null);
            versionInput.setFocusable(false);
            reportCard.addView(versionInput);

            reportCard.addView(createFieldLabel(activity, palette, "Issue title", 12));
            final EditText titleInput = createStyledEditText(
                    activity, palette, liquidGlass, "Enter issue title", "", false, betaInstalled);
            titleInput.setImeOptions(EditorInfo.IME_ACTION_NEXT);
            reportCard.addView(titleInput);

            reportCard.addView(createFieldLabel(activity, palette, "Issue description", 12));
            final EditText descInput = createStyledEditText(
                    activity, palette, liquidGlass,
                    "Describe the bug, steps to reproduce, and what happened...",
                    "", true, betaInstalled);
            descInput.setMinLines(4);
            descInput.setMaxLines(9);
            reportCard.addView(descInput);

            reportCard.addView(createFieldLabel(activity, palette, "Screenshots (up to 5)", 12));

            HorizontalScrollView thumbScroll = new HorizontalScrollView(activity);
            thumbScroll.setHorizontalScrollBarEnabled(false);
            thumbScroll.setVisibility(View.GONE);
            final LinearLayout thumbStrip = new LinearLayout(activity);
            thumbStrip.setOrientation(LinearLayout.HORIZONTAL);
            thumbScroll.addView(thumbStrip);
            LinearLayout.LayoutParams tsLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            tsLp.bottomMargin = GboardM3Helper.dp(activity, 10);
            reportCard.addView(thumbScroll, tsLp);

            final TextView attachBtn = createSecondaryPillButton(activity, palette, liquidGlass, "Attach Screenshots (0/5)");
            attachBtn.setEnabled(betaInstalled);
            attachBtn.setAlpha(betaInstalled ? 1f : 0.45f);
            LinearLayout.LayoutParams abLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, GboardM3Helper.dp(activity, 44));
            abLp.bottomMargin = GboardM3Helper.dp(activity, 14);
            reportCard.addView(attachBtn, abLp);

            final Runnable[] refreshThumbnails = new Runnable[1];
            refreshThumbnails[0] = () -> {
                thumbStrip.removeAllViews();
                int count = attachedScreenshots.size();
                thumbScroll.setVisibility(count > 0 ? View.VISIBLE : View.GONE);
                attachBtn.setText(count >= MAX_SCREENSHOTS
                        ? "Maximum 5 screenshots attached"
                        : "Attach Screenshots (" + count + "/" + MAX_SCREENSHOTS + ")");
                boolean canAdd = betaInstalled && count < MAX_SCREENSHOTS;
                attachBtn.setEnabled(canAdd);
                attachBtn.setAlpha(canAdd ? 1f : 0.45f);

                for (int i = 0; i < count; i++) {
                    final int removeIdx = i;
                    final Uri uri = attachedScreenshots.get(i);
                    FrameLayout cell = new FrameLayout(activity);
                    LinearLayout.LayoutParams cellLp = new LinearLayout.LayoutParams(
                            GboardM3Helper.dp(activity, 76), GboardM3Helper.dp(activity, 76));
                    if (i > 0) cellLp.leftMargin = GboardM3Helper.dp(activity, 8);

                    ImageView img = new ImageView(activity);
                    img.setScaleType(ImageView.ScaleType.CENTER_CROP);
                    GradientDrawable frameBg = new GradientDrawable();
                    frameBg.setCornerRadius(GboardM3Helper.dp(activity, 12));
                    frameBg.setColor(palette.surfaceAlt);
                    frameBg.setStroke(GboardM3Helper.dp(activity, 1), palette.surfaceStroke);
                    img.setBackground(frameBg);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        img.setClipToOutline(true);
                    }
                    Bitmap thumb = decodeSampledThumbnail(activity, uri, GboardM3Helper.dp(activity, 76));
                    if (thumb != null) {
                        img.setImageBitmap(thumb);
                    } else {
                        img.setImageResource(android.R.drawable.ic_menu_gallery);
                    }
                    cell.addView(img, new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

                    TextView removeBadge = new TextView(activity);
                    removeBadge.setText("\u00D7");
                    removeBadge.setGravity(Gravity.CENTER);
                    removeBadge.setTextColor(Color.WHITE);
                    removeBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                    removeBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                    GradientDrawable badgeCircle = new GradientDrawable();
                    badgeCircle.setShape(GradientDrawable.OVAL);
                    badgeCircle.setColor(0xCC111318);
                    removeBadge.setBackground(badgeCircle);
                    FrameLayout.LayoutParams rbLp = new FrameLayout.LayoutParams(
                            GboardM3Helper.dp(activity, 22), GboardM3Helper.dp(activity, 22));
                    rbLp.gravity = Gravity.TOP | Gravity.END;
                    rbLp.topMargin = GboardM3Helper.dp(activity, 4);
                    rbLp.rightMargin = GboardM3Helper.dp(activity, 4);
                    removeBadge.setOnClickListener(rv -> {
                        if (!betaInstalled) return;
                        if (removeIdx >= 0 && removeIdx < attachedScreenshots.size()) {
                            attachedScreenshots.remove(removeIdx);
                            refreshThumbnails[0].run();
                        }
                    });
                    cell.addView(removeBadge, rbLp);
                    thumbStrip.addView(cell, cellLp);
                }
            };

            attachBtn.setOnClickListener(v -> {
                if (!betaInstalled) {
                    Toast.makeText(activity,
                            "Beta bug reporting is only available when a beta version is installed.",
                            Toast.LENGTH_SHORT).show();
                    return;
                }
                if (attachedScreenshots.size() >= MAX_SCREENSHOTS) {
                    Toast.makeText(activity, "Maximum 5 screenshots allowed.", Toast.LENGTH_SHORT).show();
                    return;
                }
                activity.launchBetaScreenshotPicker(pickedUris -> {
                    if (pickedUris == null || pickedUris.isEmpty()) return;
                    for (Uri uri : pickedUris) {
                        if (attachedScreenshots.size() >= MAX_SCREENSHOTS) break;
                        if (uri != null && !attachedScreenshots.contains(uri)) {
                            attachedScreenshots.add(uri);
                        }
                    }
                    refreshThumbnails[0].run();
                });
            });
            refreshThumbnails[0].run();

            TextView submitBetaBtn = createActionPillButton(activity, palette, liquidGlass, "Submit Bug Report");
            submitBetaBtn.setEnabled(betaInstalled);
            submitBetaBtn.setAlpha(betaInstalled ? 1f : 0.45f);
            LinearLayout.LayoutParams subBtnLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, GboardM3Helper.dp(activity, 48));
            reportCard.addView(submitBetaBtn, subBtnLp);

            submitBetaBtn.setOnClickListener(v -> {
                if (!betaInstalled) {
                    Toast.makeText(activity,
                            "Beta feedback only works when a beta version is installed.",
                            Toast.LENGTH_SHORT).show();
                    return;
                }
                String titleStr = titleInput.getText() != null ? titleInput.getText().toString().trim() : "";
                String descStr = descInput.getText() != null ? descInput.getText().toString().trim() : "";
                if (TextUtils.isEmpty(titleStr)) {
                    titleInput.setError("Please enter an issue title");
                    titleInput.requestFocus();
                    return;
                }
                if (TextUtils.isEmpty(descStr)) {
                    descInput.setError("Please describe the issue");
                    descInput.requestFocus();
                    return;
                }
                String deviceStr = deviceInput.getText() != null && !TextUtils.isEmpty(deviceInput.getText().toString().trim())
                        ? deviceInput.getText().toString().trim()
                        : deviceSummary;
                submitBetaFeedbackToGitHub(
                        activity,
                        deviceStr,
                        installedBetaVersion,
                        titleStr,
                        descStr,
                        attachedScreenshots);
            });

            addCardWithMargin(root, activity, reportCard, 12);
            return root;
        }

        private static void submitBetaFeedbackToGitHub(
                Activity activity,
                String deviceModel,
                String betaVersion,
                String issueTitle,
                String issueDescription,
                List<Uri> screenshots) {
            StringBuilder body = new StringBuilder();
            body.append("### Beta Bug Report\n\n");
            body.append("- **App Beta Version:** `").append(betaVersion).append("`\n");
            body.append("- **Device Model:** `").append(deviceModel).append("`\n");
            body.append("- **Attached Screenshots:** ").append(screenshots != null ? screenshots.size() : 0).append("/5\n");
            if (screenshots != null && !screenshots.isEmpty()) {
                for (int i = 0; i < screenshots.size(); i++) {
                    body.append("  ").append(i + 1).append(". `")
                            .append(resolveDisplayName(activity, screenshots.get(i)))
                            .append("`\n");
                }
            }
            body.append("\n### Description\n").append(issueDescription).append('\n');

            try {
                ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null) {
                    cm.setPrimaryClip(ClipData.newPlainText("Gboard Pro Beta Report", body.toString()));
                }
            } catch (Throwable ignored) {
            }

            try {
                Uri uri = Uri.parse(GITHUB_ISSUES_NEW_URL).buildUpon()
                        .appendQueryParameter("title", "[Beta Bug] " + issueTitle)
                        .appendQueryParameter("labels", "beta-bug")
                        .appendQueryParameter("body", body.toString())
                        .build();
                Intent browserIntent = new Intent(Intent.ACTION_VIEW, uri);
                browserIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(browserIntent);
                String msg = (screenshots != null && !screenshots.isEmpty())
                        ? "Report copied & GitHub opened. Attach your " + screenshots.size() + " screenshot(s) in the browser."
                        : "Beta bug report opened in GitHub";
                Toast.makeText(activity, msg, Toast.LENGTH_LONG).show();
            } catch (Throwable t) {
                Toast.makeText(activity, "Report copied to clipboard", Toast.LENGTH_SHORT).show();
            }
        }

        private static Bitmap decodeSampledThumbnail(Context ctx, Uri uri, int targetPx) {
            if (ctx == null || uri == null) return null;
            try {
                BitmapFactory.Options bounds = new BitmapFactory.Options();
                bounds.inJustDecodeBounds = true;
                try (InputStream is = ctx.getContentResolver().openInputStream(uri)) {
                    if (is == null) return null;
                    BitmapFactory.decodeStream(is, null, bounds);
                }
                int sample = 1;
                while ((bounds.outWidth / sample) > targetPx * 2 || (bounds.outHeight / sample) > targetPx * 2) {
                    sample *= 2;
                }
                BitmapFactory.Options opts = new BitmapFactory.Options();
                opts.inSampleSize = sample;
                try (InputStream is = ctx.getContentResolver().openInputStream(uri)) {
                    if (is == null) return null;
                    return BitmapFactory.decodeStream(is, null, opts);
                }
            } catch (Throwable ignored) {
                return null;
            }
        }

        private static String resolveDisplayName(Context ctx, Uri uri) {
            if (ctx == null || uri == null) return "screenshot.png";
            try (Cursor c = ctx.getContentResolver().query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
                if (c != null && c.moveToFirst()) {
                    String name = c.getString(0);
                    if (!TextUtils.isEmpty(name)) return name;
                }
            } catch (Throwable ignored) {
            }
            String last = uri.getLastPathSegment();
            return !TextUtils.isEmpty(last) ? last : "screenshot.png";
        }

        private static LayerDrawable createAnimatedProgressDrawable(Context ctx, GboardM3Helper.Palette palette) {
            int radius = GboardM3Helper.dp(ctx, 999);
            GradientDrawable bg = new GradientDrawable();
            bg.setCornerRadius(radius);
            bg.setColor(palette.surfaceAlt);

            GradientDrawable fill = new GradientDrawable();
            fill.setCornerRadius(radius);
            fill.setColor(palette.accent);
            ClipDrawable clip = new ClipDrawable(fill, Gravity.START, ClipDrawable.HORIZONTAL);

            LayerDrawable layer = new LayerDrawable(new android.graphics.drawable.Drawable[]{bg, clip});
            layer.setId(0, android.R.id.background);
            layer.setId(1, android.R.id.progress);
            return layer;
        }

        private static LinearLayout createSectionCard(Context ctx, GboardM3Helper.Palette palette, boolean liquidGlass) {
            LinearLayout card = new LinearLayout(ctx);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(
                    GboardM3Helper.dp(ctx, 18),
                    GboardM3Helper.dp(ctx, 16),
                    GboardM3Helper.dp(ctx, 18),
                    GboardM3Helper.dp(ctx, 18));
            if (liquidGlass) {
                card.setBackground(GboardM3Helper.createLiquidGlassCardDrawable(ctx, palette, 24, false));
                card.setElevation(GboardM3Helper.dpF(ctx, 2f));
            } else {
                card.setBackground(GboardM3Helper.createCardDrawable(
                        palette.surface, palette.surfaceStroke, GboardM3Helper.dp(ctx, 16)));
                card.setElevation(0f);
            }
            return card;
        }

        private static void addCardWithMargin(LinearLayout root, Context ctx, View card, int bottomDp) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.bottomMargin = GboardM3Helper.dp(ctx, bottomDp);
            root.addView(card, lp);
        }

        private static TextView createSectionLabel(Context ctx, GboardM3Helper.Palette palette, String text) {
            TextView tv = new TextView(ctx);
            tv.setText(text);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            tv.setLetterSpacing(0.08f);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            tv.setTextColor(palette.accent);
            return tv;
        }

        private static TextView createFieldLabel(Context ctx, GboardM3Helper.Palette palette, String text, int topDp) {
            TextView tv = new TextView(ctx);
            tv.setText(text);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            tv.setTextColor(palette.textSecondary);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.topMargin = GboardM3Helper.dp(ctx, topDp);
            lp.bottomMargin = GboardM3Helper.dp(ctx, 6);
            tv.setLayoutParams(lp);
            return tv;
        }

        private static EditText createStyledEditText(
                Context ctx,
                GboardM3Helper.Palette palette,
                boolean liquidGlass,
                String hint,
                String initialValue,
                boolean multiline,
                boolean enabled) {
            EditText edit = new EditText(ctx);
            edit.setHint(hint);
            edit.setText(initialValue);
            edit.setEnabled(enabled);
            edit.setAlpha(enabled ? 1f : 0.55f);
            edit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            edit.setTextColor(palette.textPrimary);
            edit.setHintTextColor(GboardM3Helper.blendAlpha(palette.textSecondary, 0.72f));
            edit.setPadding(
                    GboardM3Helper.dp(ctx, 14), GboardM3Helper.dp(ctx, 11),
                    GboardM3Helper.dp(ctx, 14), GboardM3Helper.dp(ctx, 11));
            if (multiline) {
                edit.setSingleLine(false);
                edit.setGravity(Gravity.TOP | Gravity.START);
                edit.setInputType(InputType.TYPE_CLASS_TEXT
                        | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                        | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
            } else {
                edit.setSingleLine(true);
                edit.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
                edit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
            }
            GradientDrawable bg = new GradientDrawable();
            bg.setCornerRadius(GboardM3Helper.dp(ctx, liquidGlass ? 16 : 12));
            int fill = liquidGlass
                    ? (palette.isAmoled ? 0xFF10131C : (palette.isNight ? 0xFF232736 : 0xB8FFFFFF))
                    : palette.surfaceAlt;
            int stroke = liquidGlass
                    ? (palette.isAmoled ? 0x33A8C7FA : (palette.isNight ? 0x30FFFFFF : 0xFFCFD6EC))
                    : palette.surfaceStroke;
            bg.setColor(fill);
            bg.setStroke(GboardM3Helper.dp(ctx, 1), stroke);
            edit.setBackground(bg);
            edit.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return edit;
        }

        private static TextView createActionPillButton(
                Context ctx,
                GboardM3Helper.Palette palette,
                boolean liquidGlass,
                String label) {
            TextView btn = new TextView(ctx);
            btn.setText(label);
            btn.setGravity(Gravity.CENTER);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            btn.setClickable(true);
            btn.setFocusable(true);
            if (liquidGlass) {
                btn.setTextColor(palette.isAmoled || palette.isNight ? 0xFFF5F7FF : 0xFF1A2236);
                btn.setBackground(GboardM3Helper.createLiquidGlassPillButtonDrawable(ctx, palette));
                btn.setElevation(GboardM3Helper.dpF(ctx, 3f));
            } else {
                float lum = (0.299f * Color.red(palette.accent)
                        + 0.587f * Color.green(palette.accent)
                        + 0.114f * Color.blue(palette.accent)) / 255f;
                btn.setTextColor(lum > 0.58f ? 0xFF121318 : Color.WHITE);
                btn.setBackground(GboardM3Helper.createClickableCardDrawable(
                        palette.accent, Color.TRANSPARENT, palette.ripple, GboardM3Helper.dp(ctx, 999)));
                btn.setElevation(0f);
            }
            return btn;
        }

        private static TextView createSecondaryPillButton(
                Context ctx,
                GboardM3Helper.Palette palette,
                boolean liquidGlass,
                String label) {
            TextView btn = new TextView(ctx);
            btn.setText(label);
            btn.setGravity(Gravity.CENTER);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            btn.setClickable(true);
            btn.setFocusable(true);
            btn.setTextColor(palette.accent);
            btn.setBackground(GboardM3Helper.createClickableCardDrawable(
                    palette.surfaceAlt, palette.surfaceStroke, palette.ripple,
                    GboardM3Helper.dp(ctx, liquidGlass ? 999 : 12)));
            btn.setElevation(0f);
            return btn;
        }

        private static String buildDeviceSummary() {
            String manufacturer = Build.MANUFACTURER != null ? Build.MANUFACTURER.trim() : "";
            String model = Build.MODEL != null ? Build.MODEL.trim() : "";
            String combined;
            if (!manufacturer.isEmpty() && model.toLowerCase(Locale.US).startsWith(manufacturer.toLowerCase(Locale.US))) {
                combined = model;
            } else if (!manufacturer.isEmpty() && !model.isEmpty()) {
                combined = manufacturer + " " + model;
            } else {
                combined = !model.isEmpty() ? model : "Android Device";
            }
            return combined + " (Android " + Build.VERSION.RELEASE + ", SDK " + Build.VERSION.SDK_INT + ")";
        }

        private static String formatSizeMb(long bytes) {
            if (bytes <= 0L) return "0.0 MB";
            return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
        }
    }

    /**
     * Screen for opting in to upcoming experimental features planned for future stable releases.
     */
    public static final class NewBetaFeaturesFeature implements GboardPatchesSettingsContract.Feature {

        private final Context context;

        public NewBetaFeaturesFeature(Context context) {
            this.context = context;
        }

        @Override
        public String getEntryTitle() {
            return "New features (Beta)";
        }

        @Override
        public String getEntrySummary() {
            return "Opt in to preview experimental features for future stable releases";
        }

        @Override
        public boolean isAvailable(Context context) {
            return true;
        }

        @Override
        public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
        }

        @Override
        public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
            final Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
            boolean enabled = GboardBetaManager.isBetaFeaturesSliderEnabled(ctx);

            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

            List<GboardPatchesSettingsContract.Row> sliderRows = new ArrayList<>();
            sliderRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    "Enable New Features (Beta)",
                    "Turn ON to display experimental features currently being tested for future stable releases",
                    true,
                    enabled,
                    value -> {
                        GboardBetaManager.setBetaFeaturesSliderEnabled(ctx, value);
                        GboardPatchesSettingsContract.refresh(host);
                    }
            ));
            sections.add(new GboardPatchesSettingsContract.Section("BETA FEATURES SWITCH", sliderRows));

            if (enabled) {
                List<GboardPatchesSettingsContract.Row> featureRows = new ArrayList<>();
                List<GboardBetaManager.BetaFeatureItem> active = GboardBetaManager.getActiveExperimentalBetaFeatures(ctx);
                if (active.isEmpty()) {
                    featureRows.add(new GboardPatchesSettingsContract.DetailRow(
                            "No new beta features available right now",
                            "There are currently no experimental features in active testing. New upcoming features for future stable versions will appear here automatically when added.",
                            true
                    ));
                } else {
                    for (GboardBetaManager.BetaFeatureItem item : active) {
                        featureRows.add(new GboardPatchesSettingsContract.DetailRow(
                                item.title,
                                item.summary,
                                true
                        ));
                    }
                }
                sections.add(new GboardPatchesSettingsContract.Section("CURRENTLY TESTING BETA FEATURES", featureRows));
            }

            return new GboardPatchesSettingsContract.Screen(
                    "New features (Beta)",
                    null,
                    "New features (Beta)",
                    "Upcoming experimental features planned for future stable releases",
                    Collections.emptyList(),
                    sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    null,
                    false
            );
        }
    }
}
