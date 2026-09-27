package app.morphe.extension.shared.diagnostics;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * Material 3 Diagnostics & Log Viewer Dialog.
 *
 * Allows users to inspect session logs, filter errors, crashes, and 1-tap share or copy diagnostics.
 */
public final class DiagnosticsDialog {

    // Material 3 Color Palette
    private static final int M3_BG = 0xFFF5F7F6;
    private static final int M3_SURFACE = 0xFFFFFFFF;
    private static final int M3_PRIMARY = 0xFF006A60;
    private static final int M3_PRIMARY_CONTAINER = 0xFFCCE8E3;
    private static final int M3_ON_PRIMARY = 0xFFFFFFFF;
    private static final int M3_TEXT_PRIMARY = 0xFF191C1D;
    private static final int M3_TEXT_SECONDARY = 0xFF53605D;
    private static final int M3_OUTLINE = 0xFFD8E3E0;
    private static final int M3_ERROR = 0xFFBA1A1A;
    private static final int M3_ERROR_CONTAINER = 0xFFFFDAD6;
    private static final int M3_ON_ERROR = 0xFF410002;
    private static final int M3_LOG_BG = 0xFF1E2022;
    private static final int M3_LOG_TEXT = 0xFFE1E3E5;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    private DiagnosticsDialog() {}

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        float density = activity.getResources().getDisplayMetrics().density;
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(M3_SURFACE, 24 * density));

        // ─────────────────────────────────────────────────────────────────────
        // 1. Top Bar
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout topBar = new LinearLayout(activity);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        int padH = (int) (18 * density);
        int padV = (int) (14 * density);
        topBar.setPadding(padH, padV, padH, padV);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("📊 Diagnostics & Logs");
        tvTitle.setTextSize(18);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setTextColor(M3_TEXT_PRIMARY);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tvTitle.setLayoutParams(titleLp);
        topBar.addView(tvTitle);

        TextView btnRefresh = new TextView(activity);
        btnRefresh.setText("🔄");
        btnRefresh.setTextSize(18);
        btnRefresh.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
        btnRefresh.setClickable(true);
        topBar.addView(btnRefresh);

        TextView btnClose = new TextView(activity);
        btnClose.setText("✕");
        btnClose.setTextSize(18);
        btnClose.setPadding((int) (10 * density), (int) (4 * density), (int) (4 * density), (int) (4 * density));
        btnClose.setClickable(true);
        btnClose.setTextColor(M3_TEXT_SECONDARY);
        btnClose.setOnClickListener(v -> dialog.dismiss());
        topBar.addView(btnClose);
        root.addView(topBar);

        // ─────────────────────────────────────────────────────────────────────
        // 2. Session Selector & Status Card
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout sessionCard = new LinearLayout(activity);
        sessionCard.setOrientation(LinearLayout.VERTICAL);
        sessionCard.setBackground(createRoundedDrawable(M3_PRIMARY_CONTAINER, 14 * density));
        int sPad = (int) (12 * density);
        sessionCard.setPadding(sPad, (int) (8 * density), sPad, (int) (8 * density));
        LinearLayout.LayoutParams scLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        scLp.setMargins(padH, 0, padH, (int) (8 * density));
        sessionCard.setLayoutParams(scLp);

        TextView tvSessionLabel = new TextView(activity);
        tvSessionLabel.setText("Active Log Session:");
        tvSessionLabel.setTextSize(11);
        tvSessionLabel.setTypeface(null, Typeface.BOLD);
        tvSessionLabel.setTextColor(M3_PRIMARY);
        sessionCard.addView(tvSessionLabel);

        Spinner spinnerSessions = new Spinner(activity);
        spinnerSessions.setPadding(0, (int) (4 * density), 0, (int) (4 * density));
        sessionCard.addView(spinnerSessions);
        root.addView(sessionCard);

        // ─────────────────────────────────────────────────────────────────────
        // 3. Search Box & Filter Chips Bar
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout filterBar = new LinearLayout(activity);
        filterBar.setOrientation(LinearLayout.VERTICAL);
        filterBar.setPadding(padH, 0, padH, (int) (6 * density));

        EditText etSearch = new EditText(activity);
        etSearch.setHint("🔍 Search in log (e.g. exception, map, crash)...");
        etSearch.setTextSize(13);
        etSearch.setTextColor(M3_TEXT_PRIMARY);
        etSearch.setHintTextColor(M3_TEXT_SECONDARY);
        etSearch.setBackground(createRoundedDrawable(0xFFEEF2F0, 10 * density));
        int etPad = (int) (10 * density);
        etSearch.setPadding(etPad, (int) (6 * density), etPad, (int) (6 * density));
        filterBar.addView(etSearch);

        // Filter chips (All, Crashes/Errors, Maps, Flags)
        HorizontalScrollView hsv = new HorizontalScrollView(activity);
        hsv.setHorizontalScrollBarEnabled(false);
        hsv.setPadding(0, (int) (6 * density), 0, 0);

        LinearLayout chipsContainer = new LinearLayout(activity);
        chipsContainer.setOrientation(LinearLayout.HORIZONTAL);

        String[] chipLabels = {"All", "🚨 Crashes / Errors", "🗺️ Maps & GMS", "⚙️ Flags"};
        String[] chipValues = {"ALL", "ERROR", "MAPS", "FLAGS"};
        TextView[] chipViews = new TextView[chipLabels.length];
        final String[] selectedFilter = {"ALL"};

        // ─────────────────────────────────────────────────────────────────────
        // 4. Log Content View (Monospace Terminal style)
        // ─────────────────────────────────────────────────────────────────────
        ScrollView scrollView = new ScrollView(activity);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        svLp.setMargins(padH, 0, padH, (int) (8 * density));
        scrollView.setLayoutParams(svLp);
        scrollView.setBackground(createRoundedDrawable(M3_LOG_BG, 12 * density));

        TextView tvLogs = new TextView(activity);
        tvLogs.setTextSize(11);
        tvLogs.setTypeface(Typeface.MONOSPACE);
        tvLogs.setTextColor(M3_LOG_TEXT);
        tvLogs.setTextIsSelectable(true);
        int logPad = (int) (12 * density);
        tvLogs.setPadding(logPad, logPad, logPad, logPad);
        scrollView.addView(tvLogs);
        root.addView(filterBar);
        root.addView(scrollView);

        // ─────────────────────────────────────────────────────────────────────
        // 5. Bottom Action Dock (Share, Copy, Clear)
        // ─────────────────────────────────────────────────────────────────────
        LinearLayout bottomDock = new LinearLayout(activity);
        bottomDock.setOrientation(LinearLayout.HORIZONTAL);
        bottomDock.setGravity(Gravity.CENTER_VERTICAL);
        bottomDock.setPadding(padH, (int) (8 * density), padH, (int) (14 * density));

        // Share Button (Primary)
        TextView btnShare = new TextView(activity);
        btnShare.setText("📤 Share Log");
        btnShare.setTextSize(14);
        btnShare.setTypeface(null, Typeface.BOLD);
        btnShare.setTextColor(M3_ON_PRIMARY);
        btnShare.setGravity(Gravity.CENTER);
        btnShare.setBackground(createRoundedDrawable(M3_PRIMARY, 20 * density));
        LinearLayout.LayoutParams shareLp = new LinearLayout.LayoutParams(0, (int) (44 * density), 1.2f);
        shareLp.setMargins(0, 0, (int) (8 * density), 0);
        btnShare.setLayoutParams(shareLp);
        btnShare.setClickable(true);
        bottomDock.addView(btnShare);

        // Copy Button (Secondary)
        TextView btnCopy = new TextView(activity);
        btnCopy.setText("📋 Copy");
        btnCopy.setTextSize(13);
        btnCopy.setTypeface(null, Typeface.BOLD);
        btnCopy.setTextColor(M3_PRIMARY);
        btnCopy.setGravity(Gravity.CENTER);
        btnCopy.setBackground(createRoundedOutlineDrawable(M3_OUTLINE, 20 * density));
        LinearLayout.LayoutParams copyLp = new LinearLayout.LayoutParams(0, (int) (44 * density), 1.0f);
        copyLp.setMargins(0, 0, (int) (8 * density), 0);
        btnCopy.setLayoutParams(copyLp);
        btnCopy.setClickable(true);
        bottomDock.addView(btnCopy);

        // Clear Button (Destructive outline)
        TextView btnClear = new TextView(activity);
        btnClear.setText("🗑️");
        btnClear.setTextSize(16);
        btnClear.setGravity(Gravity.CENTER);
        btnClear.setBackground(createRoundedOutlineDrawable(0xFFFFCDD2, 20 * density));
        LinearLayout.LayoutParams clearLp = new LinearLayout.LayoutParams((int) (44 * density), (int) (44 * density));
        btnClear.setLayoutParams(clearLp);
        btnClear.setClickable(true);
        bottomDock.addView(btnClear);

        root.addView(bottomDock);

        // ─────────────────────────────────────────────────────────────────────
        // Logic & Data Binding
        // ─────────────────────────────────────────────────────────────────────
        List<SessionLogManager.SessionInfo> sessions = new ArrayList<>();
        final SessionLogManager.SessionInfo[] activeSession = new SessionLogManager.SessionInfo[1];

        Runnable loadLogs = () -> {
            if (activeSession[0] == null) {
                tvLogs.setText("No log session selected.");
                return;
            }
            new Thread(() -> {
                String q = etSearch.getText().toString();
                String content = SessionLogManager.readSessionContent(activeSession[0], q, selectedFilter[0]);
                MAIN_HANDLER.post(() -> {
                    tvLogs.setText(content);
                    scrollView.post(() -> scrollView.fullScroll(View.FOCUS_DOWN));
                });
            }).start();
        };

        // Chips click handlers
        for (int i = 0; i < chipLabels.length; i++) {
            final int idx = i;
            TextView chip = new TextView(activity);
            chip.setText(chipLabels[i]);
            chip.setTextSize(12);
            chip.setTypeface(null, Typeface.BOLD);
            int cPadH = (int) (12 * density);
            int cPadV = (int) (6 * density);
            chip.setPadding(cPadH, cPadV, cPadH, cPadV);
            LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cLp.setMargins(0, 0, (int) (8 * density), 0);
            chip.setLayoutParams(cLp);
            chip.setClickable(true);

            chipViews[i] = chip;
            chip.setOnClickListener(v -> {
                selectedFilter[0] = chipValues[idx];
                for (int j = 0; j < chipViews.length; j++) {
                    boolean isSelected = (j == idx);
                    chipViews[j].setBackground(createRoundedDrawable(isSelected ? M3_PRIMARY : 0xFFE2E7E4, 14 * density));
                    chipViews[j].setTextColor(isSelected ? M3_ON_PRIMARY : M3_TEXT_PRIMARY);
                }
                loadLogs.run();
            });

            // Initial style
            boolean isSelected = (i == 0);
            chip.setBackground(createRoundedDrawable(isSelected ? M3_PRIMARY : 0xFFE2E7E4, 14 * density));
            chip.setTextColor(isSelected ? M3_ON_PRIMARY : M3_TEXT_PRIMARY);
            chipsContainer.addView(chip);
        }
        hsv.addView(chipsContainer);
        filterBar.addView(hsv);

        // Sessions loader
        Runnable reloadSessions = () -> {
            sessions.clear();
            sessions.addAll(SessionLogManager.getAllSessions());
            if (sessions.isEmpty()) {
                tvLogs.setText("No sessions found yet.");
                return;
            }

            List<String> names = new ArrayList<>();
            int defaultIndex = 0;
            for (int i = 0; i < sessions.size(); i++) {
                SessionLogManager.SessionInfo s = sessions.get(i);
                names.add(s.getDisplayName());
                if (s.isCurrent) defaultIndex = i;
            }

            ArrayAdapter<String> spinnerAdapter = new ArrayAdapter<>(activity, android.R.layout.simple_spinner_dropdown_item, names);
            spinnerSessions.setAdapter(spinnerAdapter);
            spinnerSessions.setSelection(defaultIndex);
            activeSession[0] = sessions.get(defaultIndex);
            loadLogs.run();
        };

        spinnerSessions.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (position >= 0 && position < sessions.size()) {
                    activeSession[0] = sessions.get(position);
                    loadLogs.run();
                }
            }
            @Override public void onNothingSelected(AdapterView<?> parent) {}
        });

        btnRefresh.setOnClickListener(v -> {
            reloadSessions.run();
            Toast.makeText(activity, "Refreshed logs", Toast.LENGTH_SHORT).show();
        });

        // Search text watcher
        Runnable[] searchDelay = new Runnable[1];
        etSearch.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (searchDelay[0] != null) MAIN_HANDLER.removeCallbacks(searchDelay[0]);
                searchDelay[0] = loadLogs;
                MAIN_HANDLER.postDelayed(searchDelay[0], 250);
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        // Action Buttons
        btnShare.setOnClickListener(v -> {
            if (activeSession[0] != null) {
                SessionLogManager.shareSession(activity, activeSession[0]);
            }
        });

        btnCopy.setOnClickListener(v -> {
            if (activeSession[0] != null) {
                SessionLogManager.copyToClipboard(activity, activeSession[0]);
            }
        });

        btnClear.setOnClickListener(v -> {
            new AlertDialog.Builder(activity)
                .setTitle("Clear Old Sessions?")
                .setMessage("This will delete all previous session logs. Current session log will be kept.")
                .setPositiveButton("Clear", (d, which) -> {
                    SessionLogManager.clearAllSessions(reloadSessions);
                    Toast.makeText(activity, "Cleared previous sessions", Toast.LENGTH_SHORT).show();
                })
                .setNegativeButton("Cancel", null)
                .show();
        });

        reloadSessions.run();
        dialog.setContentView(root);
        dialog.show();

        // Responsive popup window sizing
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
            int dialogWidth = Math.min((int) (screenWidth * 0.94f), (int) (520 * density));
            int dialogHeight = (int) (screenHeight * 0.88f);
            window.setLayout(dialogWidth, dialogHeight);
            window.setGravity(Gravity.CENTER);
        }
    }

    private static GradientDrawable createRoundedDrawable(int color, float radius) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.RECTANGLE);
        d.setCornerRadius(radius);
        d.setColor(color);
        return d;
    }

    private static GradientDrawable createRoundedOutlineDrawable(int strokeColor, float radius) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.RECTANGLE);
        d.setCornerRadius(radius);
        d.setColor(Color.TRANSPARENT);
        d.setStroke(2, strokeColor);
        return d;
    }
}
