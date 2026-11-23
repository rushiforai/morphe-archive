package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.lang.reflect.Method;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class GboardAppUpdatesActivity extends Activity {

    private static final String GITHUB_API_URL = "https://api.github.com/repos/smartworldarafath/Gboard_Pro/releases/latest";
    private static final String CURRENT_VERSION = com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION;

    private GboardM3Helper.Palette palette;
    private Handler mainHandler;

    private TextView statusTitle;
    private TextView statusDescription;
    private TextView versionBadge;
    private LinearLayout releaseNotesCard;
    private TextView releaseNotesText;
    private LinearLayout progressContainer;
    private ProgressBar downloadProgressBar;
    private TextView progressText;
    private LinearLayout actionButton;
    private TextView actionButtonLabel;

    private String latestVersionTag = "";
    private String latestReleaseName = "";
    private String latestReleaseBody = "";
    private String downloadApkUrl = "";
    private File downloadedApkFile = null;

    private boolean isChecking = false;
    private boolean isDownloading = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        try {
            setTheme(GboardM3Helper.resolveActivityTheme(this));
        } catch (Throwable ignored) {
        }
        super.onCreate(savedInstanceState);

        try {
            palette = GboardM3Helper.Palette.forContext(this);
            mainHandler = new Handler(Looper.getMainLooper());
            GboardM3Helper.initActivity(this, palette);

            LinearLayout root = new LinearLayout(this);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(palette.windowBackground);
            root.setLayoutParams(new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            root.addView(GboardM3Helper.createToolbar(this, "Gboard Pro Updates", palette));

            ScrollView scrollView = new ScrollView(this);
            scrollView.setFillViewport(true);
            scrollView.setVerticalScrollBarEnabled(false);

            LinearLayout content = new LinearLayout(this);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 8),
                    GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 28));

            // Version Info Card
            content.addView(buildCurrentVersionCard());

            // Status Card
            content.addView(buildStatusCard());

            // Release Notes Card (hidden initially)
            releaseNotesCard = (LinearLayout) buildReleaseNotesCard();
            content.addView(releaseNotesCard);

            // Progress Card (hidden initially)
            progressContainer = (LinearLayout) buildProgressCard();
            content.addView(progressContainer);

            // Action Button (Check for updates / Download / Install)
            content.addView(buildActionButton());

            scrollView.addView(content);
            root.addView(scrollView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            setContentView(root);

            // Auto-check for update on launch
            checkForUpdates(false);
        } catch (Throwable t) {
            Log.e("GboardAppUpdates", "Error in onCreate", t);
            fallbackView(t);
        }
    }

    private void fallbackView(Throwable t) {
        try {
            LinearLayout fallback = new LinearLayout(this);
            fallback.setOrientation(LinearLayout.VERTICAL);
            fallback.setPadding(32, 64, 32, 32);
            TextView tv = new TextView(this);
            tv.setText("Gboard Pro Updates\nVersion: 1.0.4\n\nCheck for the latest APK releases at:\nhttps://github.com/smartworldarafath/Gboard_Pro/releases");
            tv.setTextSize(16f);
            fallback.addView(tv);
            setContentView(fallback);
        } catch (Throwable ignored) {
        }
    }

    private View buildCurrentVersionCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 20)));
        card.setPadding(GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 16),
                GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 16));

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);

        TextView label = new TextView(this);
        label.setText("INSTALLED VERSION");
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        label.setTypeface(Typeface.DEFAULT_BOLD);
        label.setTextColor(palette.accent);
        textCol.addView(label);

        TextView verText = new TextView(this);
        verText.setText("Gboard Pro v" + CURRENT_VERSION);
        verText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        verText.setTypeface(Typeface.DEFAULT_BOLD);
        verText.setTextColor(palette.textPrimary);
        LinearLayout.LayoutParams verLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        verLp.topMargin = GboardM3Helper.dp(this, 2);
        textCol.addView(verText, verLp);

        card.addView(textCol, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        versionBadge = new TextView(this);
        versionBadge.setText("Latest");
        versionBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        versionBadge.setTypeface(Typeface.DEFAULT_BOLD);
        versionBadge.setTextColor(palette.onAccentContainer);
        versionBadge.setBackground(GboardM3Helper.createCardDrawable(
                palette.accentContainer, Color.TRANSPARENT, GboardM3Helper.dp(this, 10)));
        versionBadge.setPadding(GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4),
                GboardM3Helper.dp(this, 10), GboardM3Helper.dp(this, 4));
        card.addView(versionBadge);

        return card;
    }

    private View buildStatusCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 20)));
        card.setPadding(GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 18),
                GboardM3Helper.dp(this, 18), GboardM3Helper.dp(this, 18));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = GboardM3Helper.dp(this, 12);
        card.setLayoutParams(lp);

        statusTitle = new TextView(this);
        statusTitle.setText("Checking for updates...");
        statusTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16.5f);
        statusTitle.setTypeface(Typeface.DEFAULT_BOLD);
        statusTitle.setTextColor(palette.textPrimary);
        card.addView(statusTitle);

        statusDescription = new TextView(this);
        statusDescription.setText("Connecting to official repository releases...");
        statusDescription.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        statusDescription.setTextColor(palette.textSecondary);
        statusDescription.setLineSpacing(GboardM3Helper.dp(this, 2), 1.15f);
        LinearLayout.LayoutParams descLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        descLp.topMargin = GboardM3Helper.dp(this, 6);
        card.addView(statusDescription, descLp);

        return card;
    }

    private View buildReleaseNotesCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surfaceAlt, palette.surfaceStroke, GboardM3Helper.dp(this, 18)));
        card.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 14),
                GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 16));
        card.setVisibility(View.GONE);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = GboardM3Helper.dp(this, 12);
        card.setLayoutParams(lp);

        TextView header = new TextView(this);
        header.setText("WHAT'S NEW IN THIS RELEASE");
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(palette.accent);
        card.addView(header);

        releaseNotesText = new TextView(this);
        releaseNotesText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        releaseNotesText.setTextColor(palette.textPrimary);
        releaseNotesText.setLineSpacing(GboardM3Helper.dp(this, 2), 1.15f);
        LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        textLp.topMargin = GboardM3Helper.dp(this, 8);
        card.addView(releaseNotesText, textLp);

        return card;
    }

    private View buildProgressCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(GboardM3Helper.createCardDrawable(
                palette.surface, palette.surfaceStroke, GboardM3Helper.dp(this, 18)));
        card.setPadding(GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 14),
                GboardM3Helper.dp(this, 16), GboardM3Helper.dp(this, 14));
        card.setVisibility(View.GONE);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = GboardM3Helper.dp(this, 12);
        card.setLayoutParams(lp);

        progressText = new TextView(this);
        progressText.setText("Downloading update: 0%");
        progressText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        progressText.setTypeface(Typeface.DEFAULT_BOLD);
        progressText.setTextColor(palette.textPrimary);
        card.addView(progressText);

        downloadProgressBar = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        downloadProgressBar.setMax(100);
        downloadProgressBar.setProgress(0);
        downloadProgressBar.setIndeterminate(false);
        LinearLayout.LayoutParams pbLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, GboardM3Helper.dp(this, 8));
        pbLp.topMargin = GboardM3Helper.dp(this, 8);
        card.addView(downloadProgressBar, pbLp);

        return card;
    }

    private View buildActionButton() {
        actionButton = new LinearLayout(this);
        actionButton.setOrientation(LinearLayout.HORIZONTAL);
        actionButton.setGravity(Gravity.CENTER);
        actionButton.setBackground(GboardM3Helper.createClickableCardDrawable(
                palette.accent, Color.TRANSPARENT, palette.ripple, GboardM3Helper.dp(this, 22)));
        actionButton.setPadding(GboardM3Helper.dp(this, 20), GboardM3Helper.dp(this, 15),
                GboardM3Helper.dp(this, 20), GboardM3Helper.dp(this, 15));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = GboardM3Helper.dp(this, 18);
        actionButton.setLayoutParams(lp);

        actionButtonLabel = new TextView(this);
        actionButtonLabel.setText("Check for updates");
        actionButtonLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        actionButtonLabel.setTypeface(Typeface.DEFAULT_BOLD);
        actionButtonLabel.setTextColor(palette.isNight ? 0xFF00325B : 0xFFFFFFFF);
        actionButton.addView(actionButtonLabel);

        actionButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                handleActionButtonClick();
            }
        });

        return actionButton;
    }

    private void handleActionButtonClick() {
        if (isChecking || isDownloading) return;

        if (downloadedApkFile != null && downloadedApkFile.exists()) {
            installApk(downloadedApkFile);
        } else if (!downloadApkUrl.isEmpty()) {
            downloadUpdate(downloadApkUrl);
        } else {
            checkForUpdates(true);
        }
    }

    private void checkForUpdates(final boolean userInitiated) {
        if (isChecking) return;
        isChecking = true;
        actionButton.setEnabled(false);
        actionButtonLabel.setText("Checking...");

        statusTitle.setText("Checking for updates...");
        statusDescription.setText("Connecting to official repository releases...");

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    URL url = new URL(GITHUB_API_URL);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("GET");
                    conn.setRequestProperty("User-Agent", "Gboard-Pro-Android-App");
                    conn.setConnectTimeout(8000);
                    conn.setReadTimeout(8000);

                    int responseCode = conn.getResponseCode();
                    if (responseCode == 200) {
                        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                        StringBuilder response = new StringBuilder();
                        String line;
                        while ((line = in.readLine()) != null) {
                            response.append(line);
                        }
                        in.close();

                        parseReleaseResponse(response.toString(), userInitiated);
                    } else {
                        onCheckFailed("Server response code: " + responseCode, userInitiated);
                    }
                } catch (final Throwable e) {
                    onCheckFailed(e.getMessage() != null ? e.getMessage() : "Network connection failed", userInitiated);
                }
            }
        }).start();
    }

    private void parseReleaseResponse(String jsonString, final boolean userInitiated) {
        try {
            JSONObject obj = new JSONObject(jsonString);
            latestVersionTag = obj.optString("tag_name", "").replace("v", "").trim();
            latestReleaseName = obj.optString("name", "Gboard Pro v" + latestVersionTag);
            latestReleaseBody = obj.optString("body", "");

            downloadApkUrl = "";
            JSONArray assets = obj.optJSONArray("assets");
            if (assets != null) {
                for (int i = 0; i < assets.length(); i++) {
                    JSONObject asset = assets.getJSONObject(i);
                    String name = asset.optString("name", "");
                    if (name.endsWith(".apk")) {
                        if (name.contains("arm64-v8a") || downloadApkUrl.isEmpty()) {
                            downloadApkUrl = asset.optString("browser_download_url", "");
                        }
                    }
                }
            }

            final boolean hasUpdate = isVersionNewer(latestVersionTag, CURRENT_VERSION);

            mainHandler.post(new Runnable() {
                @Override
                public void run() {
                    isChecking = false;
                    actionButton.setEnabled(true);

                    if (hasUpdate) {
                        statusTitle.setText("New Update Available: v" + latestVersionTag);
                        statusDescription.setText("A newer stable version of Gboard Pro is ready for installation. Tap below to download and install.");
                        versionBadge.setText("Update Available");
                        versionBadge.setTextColor(0xFFFFFFFF);
                        versionBadge.setBackground(GboardM3Helper.createCardDrawable(0xFFE64A19, Color.TRANSPARENT, GboardM3Helper.dp(GboardAppUpdatesActivity.this, 10)));

                        if (!latestReleaseBody.isEmpty()) {
                            releaseNotesText.setText(latestReleaseBody.trim());
                            releaseNotesCard.setVisibility(View.VISIBLE);
                        }

                        actionButtonLabel.setText("Download & Install Update");
                    } else {
                        statusTitle.setText("Gboard Pro is up to date");
                        statusDescription.setText("You are currently running the latest official version (v" + CURRENT_VERSION + "). Check back later for upcoming releases!");
                        versionBadge.setText("Latest Version");
                        releaseNotesCard.setVisibility(View.GONE);
                        actionButtonLabel.setText("Check Again");
                        if (userInitiated) {
                            Toast.makeText(GboardAppUpdatesActivity.this, "Gboard Pro is up to date!", Toast.LENGTH_SHORT).show();
                        }
                    }
                }
            });
        } catch (Throwable t) {
            onCheckFailed("Failed to parse release information", userInitiated);
        }
    }

    private boolean isVersionNewer(String latest, String current) {
        try {
            String[] lParts = latest.split("\\.");
            String[] cParts = current.split("\\.");
            int len = Math.max(lParts.length, cParts.length);
            for (int i = 0; i < len; i++) {
                int l = i < lParts.length ? Integer.parseInt(lParts[i].replaceAll("[^0-9]", "")) : 0;
                int c = i < cParts.length ? Integer.parseInt(cParts[i].replaceAll("[^0-9]", "")) : 0;
                if (l > c) return true;
                if (l < c) return false;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private void onCheckFailed(final String errorMsg, final boolean userInitiated) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                isChecking = false;
                actionButton.setEnabled(true);
                actionButtonLabel.setText("Check Again");
                statusTitle.setText("Unable to check for updates");
                statusDescription.setText("Could not reach GitHub repository: " + errorMsg);
                if (userInitiated) {
                    Toast.makeText(GboardAppUpdatesActivity.this, "Update check failed: " + errorMsg, Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private void downloadUpdate(final String downloadUrl) {
        if (isDownloading) return;
        isDownloading = true;

        progressContainer.setVisibility(View.VISIBLE);
        downloadProgressBar.setProgress(0);
        progressText.setText("Connecting to download server...");

        actionButton.setEnabled(false);
        actionButtonLabel.setText("Downloading...");

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    URL url = new URL(downloadUrl);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestProperty("User-Agent", "Gboard-Pro-Android-App");
                    conn.setConnectTimeout(10000);
                    conn.setReadTimeout(15000);
                    conn.connect();

                    int fileLength = conn.getContentLength();
                    InputStream input = conn.getInputStream();

                    File cacheDir = getExternalCacheDir();
                    if (cacheDir == null) {
                        cacheDir = getCacheDir();
                    }
                    downloadedApkFile = new File(cacheDir, "Gboard_Pro-" + latestVersionTag + ".apk");
                    FileOutputStream output = new FileOutputStream(downloadedApkFile);

                    byte[] data = new byte[4096];
                    long total = 0;
                    int count;
                    while ((count = input.read(data)) != -1) {
                        total += count;
                        if (fileLength > 0) {
                            final int progress = (int) (total * 100 / fileLength);
                            mainHandler.post(new Runnable() {
                                @Override
                                public void run() {
                                    downloadProgressBar.setProgress(progress);
                                    progressText.setText("Downloading update: " + progress + "%");
                                }
                            });
                        }
                        output.write(data, 0, count);
                    }

                    output.flush();
                    output.close();
                    input.close();

                    mainHandler.post(new Runnable() {
                        @Override
                        public void run() {
                            isDownloading = false;
                            actionButton.setEnabled(true);
                            actionButtonLabel.setText("Install Update");
                            progressText.setText("Download complete (100%)");
                            statusTitle.setText("Download Finished");
                            statusDescription.setText("The new update has been downloaded successfully. Tap Install Update to proceed.");

                            installApk(downloadedApkFile);
                        }
                    });

                } catch (final Throwable e) {
                    mainHandler.post(new Runnable() {
                        @Override
                        public void run() {
                            isDownloading = false;
                            actionButton.setEnabled(true);
                            actionButtonLabel.setText("Retry Download");
                            progressText.setText("Download failed");
                            Toast.makeText(GboardAppUpdatesActivity.this, "Download error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }
        }).start();
    }

    private void installApk(File apkFile) {
        if (apkFile == null || !apkFile.exists()) {
            Toast.makeText(this, "APK file not found", Toast.LENGTH_SHORT).show();
            return;
        }

        try {
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_GRANT_READ_URI_PERMISSION);

            Uri uri;
            try {
                Class<?> fpClass = Class.forName("androidx.core.content.FileProvider");
                Method getUriMethod = fpClass.getMethod("getUriForFile", Context.class, String.class, File.class);
                uri = (Uri) getUriMethod.invoke(null, this, getPackageName() + ".fileprovider", apkFile);
            } catch (Throwable t) {
                uri = Uri.fromFile(apkFile);
            }

            intent.setDataAndType(uri, "application/vnd.android.package-archive");
            startActivity(intent);
        } catch (Throwable e) {
            Toast.makeText(this, "Cannot prompt install: " + e.getMessage(), Toast.LENGTH_LONG).show();
            try {
                Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://github.com/smartworldarafath/Gboard_Pro/releases"));
                startActivity(browserIntent);
            } catch (Throwable ignored) {
            }
        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        GboardM3Helper.applyActivityExitTransition(this);
    }
}
