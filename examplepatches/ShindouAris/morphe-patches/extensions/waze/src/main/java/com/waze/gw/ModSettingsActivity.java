package com.waze.gw;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.graphics.BitmapFactory;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

/**
 * Mod settings — opened from a "Cài đặt Mod" row injected into Waze's own Settings.
 * Everything persists to SharedPreferences "waze_hud_gw", read by Gateway/HudActivity.
 */
public class ModSettingsActivity extends Activity {

    static final String PREFS = "waze_hud_gw";
    private static final String MAP_BUILD_URL =
            "https://storage.googleapis.com/waze-tile-build-public/current-build/intl-status.json";
    private static final String MAP_BUILD_CACHE = "map_build_status_json";
    private static final String MAP_BUILD_FETCHED = "map_build_status_fetched";
    private static final int COLOR_BG = 0xFF0B0D12;
    private static final int COLOR_PANEL = 0xFF13161E;
    private static final int COLOR_CONTROL = 0xFF1B1F29;
    private static final int COLOR_TEXT = 0xFFF3F4F6;
    private static final int COLOR_MUTED = 0xFF9AA3B2;
    private static int COLOR_ACCENT = AmbientTheme.WAZE_BLUE;
    private static final int COLOR_BORDER = 0xFF2A2F3B;
    private static final String CAT_HUD = "hud";
    private static final String CAT_BUBBLE = "bubble";
    private static final String CAT_FLOAT_SPEEDO = "float_speedo";
    private static final String CAT_ALERTS = "alerts";
    private static final String CAT_GPS = "gps";
    private static final String CAT_MAP = "map";
    private static final String CAT_AUTO = "auto";
    private static final String CAT_DEVICE = "device";
    private static final String CAT_APPS = "apps";
    private static final String CAT_XADAS = "xadas";
    private static final String CAT_WAZE_CONFIG = "waze_config";
    private static final String ICON_XADAS = "res:xadas";   // not an asset path: the xADAS logo drawable
    private static final String CAT_UPDATES = "updates";
    private static final String CAT_BLACK_BOX = "black_box";
    private static final String CAT_DIAGNOSTICS = "diagnostics";
    private static final String CAT_ABOUT = "about";
    private static final String PREF_HUD_LINK_UI_TAB = "hud_link_ui_tab";
    private static final int HUD_LINK_TAB_HLP = 0;
    private static final int HUD_LINK_TAB_VIETMAP = 1;
    private static final int HUD_LINK_TAB_WIFI = 2;
    private static final int HUD_LINK_TAB_USB = 3;
    private static final int[] VOICE_SPEEDS = {
            10, 20, 30, 35, 40, 50, 60, 70, 80, 90, 100, 110, 120
    };
    private static final int[] OVER_MARGIN_VALUES = {
            -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 10
    };
    private static final int REQUEST_PICK_OVERSPEED_AUDIO = 4102;
    private static final int REQUEST_RECORD_OVERSPEED_AUDIO = 4103;
    private static final int REQUEST_EXPORT_ALERT_RECORDING = 4104;
    private static final int REQUEST_EXPORT_RECORDING_PACKAGE = 4105;
    private static final int REQUEST_IMPORT_RECORDING_PACKAGE = 4106;
    private static final int REQUEST_EXPORT_DIAGNOSTICS = 4107;
    private static final int REQUEST_EXPORT_TRIP_GPX = 4108;
    private static final int REQUEST_EXPORT_MOD_SETTINGS = 4109;
    private static final int REQUEST_IMPORT_MOD_SETTINGS = 4110;
    private static final int REQUEST_IMPORT_LANGUAGE_PACK = 4111;
    private static final int REQUEST_EXPORT_LANGUAGE_TEMPLATE = 4112;
    private static final long MAX_RECORDING_MS = 15_000L;
    private static final String[] OVER_MARGIN_LABELS = {
            "-5 km/h", "-4 km/h", "-3 km/h", "-2 km/h", "-1 km/h", "+0 km/h",
            "+1 km/h", "+2 km/h", "+3 km/h", "+4 km/h", "+5 km/h", "+10 km/h"
    };
    private SharedPreferences sp;
    private TextView mapBuildBadge, mapBuildEta, mapBuildDetails, mapBuildFetched;
    private ProgressBar mapBuildProgress;
    private boolean mapBuildLoading;
    private boolean wideSettings;
    private String selectedCategory;
    private String selectedSubpage;
    private FrameLayout detailHost;
    private FrameLayout narrowHost;
    private LinearLayout sideMenu;
    private boolean pendingHudEnable;
    private boolean pendingHudPicker;
    private String pendingHudPickerProfile = HudDevicePickerActivity.PROFILE_HLP1;
    private TextView hudLinkStatus;                 // status card headline (null when no card)
    private TextView hudLinkStatusHint, hudLinkStatusDetail, hudLinkStatusDetailToggle;
    private View hudLinkStatusDot;
    private boolean hudLinkDetailExpanded;
    private TextView hudLinkActionButton;
    private Switch hudLinkEnabledSwitch;
    private boolean updatingHudLinkSwitch;
    private boolean hudStatusReceiverRegistered;
    private Runnable hudFirmwareRefresh;
    private LinearLayout hudDeviceConfigHost;
    private long hudDeviceConfigGeneration = -1L;
    private long hudDeviceConfigRevision = -1L;
    private boolean hudDeviceConfigDirty;
    private final java.util.LinkedHashMap<String, Object> hudDeviceConfigDraft =
            new java.util.LinkedHashMap<String, Object>();
    private final HudDeviceConfig.Listener hudDeviceConfigListener =
            new HudDeviceConfig.Listener() {
                @Override public void onHudDeviceConfigChanged() {
                    runOnUiThread(new Runnable() {
                        @Override public void run() { renderHudDeviceConfig(); }
                    });
                }
            };
    private static final long AUDIO_PREVIEW_COOLDOWN_MS = 5000L;
    private final android.os.Handler audioPreviewHandler =
            new android.os.Handler(android.os.Looper.getMainLooper());
    private long audioPreviewLockedUntil;
    private AudioPreviewCard audioCurrentPreview, audioNavigationPreview, audioActivePreview;
    private GpsSignalView gpsDetailSignal;
    private TextView gpsDetailStatus, gpsDetailAccuracy, gpsDetailAge;
    private TextView gpsDetailSource, gpsDetailLevel;
    private TextView overspeedAudioSummary;
    private String selectedAudioSlot = "";
    private TextView selectedAudioSummary;
    private int pendingDiagnosticsExport = DiagnosticsLogger.EXPORT_ALL;
    private long pendingTripExportId = -1L;
    private android.media.MediaRecorder alertRecorder;
    private java.io.File alertRecordingFile;
    private boolean alertRecording;
    private boolean pendingAlertRecordingPermission;
    private android.app.Dialog alertRecordDialog;
    private TextView alertRecordStatus;
    private ProgressBar alertRecordProgress;
    private TextView alertRecordButton;
    private LinearLayout alertRecordReviewActions;
    private TextView alertRecordSaveButton;
    private android.media.MediaPlayer alertRecordPreviewPlayer;
    private long alertRecordingStartedAt;
    private final android.os.Handler alertRecordingHandler =
            new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable alertRecordingTimeout = new Runnable() {
        @Override public void run() { stopAlertRecordingForReview(); }
    };
    private final Runnable alertRecordingProgressTick = new Runnable() {
        @Override public void run() {
            if (!alertRecording) return;
            long elapsed = Math.max(0L, android.os.SystemClock.elapsedRealtime()
                    - alertRecordingStartedAt);
            int progress = (int) Math.min(MAX_RECORDING_MS, elapsed);
            if (alertRecordProgress != null) alertRecordProgress.setProgress(progress);
            if (alertRecordStatus != null) {
                long remainingTenths = Math.max(0L,
                        (MAX_RECORDING_MS - elapsed + 99L) / 100L);
                alertRecordStatus.setText(String.format(java.util.Locale.US,
                        I18n.tr("settings.recording_d_d_s_left"),
                        remainingTenths / 10L, remainingTenths % 10L));
            }
            if (elapsed < MAX_RECORDING_MS)
                alertRecordingHandler.postDelayed(this, 50L);
        }
    };
    private final android.os.Handler gpsUiHandler =
            new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable audioPreviewCountdown = new Runnable() {
        @Override public void run() { updateAudioPreviewCooldown(); }
    };
    private final android.os.Handler xadasUiHandler =
            new android.os.Handler(android.os.Looper.getMainLooper());
    private TextView xadasStatusTitle, xadasStatusDetail, xadasOpenButton;
    private final Runnable xadasUiTick = new Runnable() {
        @Override public void run() {
            updateXadasStatus();
            if (xadasStatusTitle != null) xadasUiHandler.postDelayed(this, 1000L);
        }
    };
    private final Runnable gpsUiTick = new Runnable() {
        @Override public void run() {
            updateGpsQualityCard();
            if (CAT_GPS.equals(selectedCategory)) gpsUiHandler.postDelayed(this, 250L);
        }
    };
    private final java.util.HashMap<String, FrameLayout> menuRows =
            new java.util.HashMap<String, FrameLayout>();
    private static final String SCROLL_PAGE_MENU = "menu";
    private final java.util.HashMap<String, Integer> pageScrollPositions =
            new java.util.HashMap<String, Integer>();
    private ScrollView activePageScroll;
    private String activePageScrollKey;

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        DiagnosticsLogger.install(this);
        if (!Gateway.modEnabled(this)) {
            finish();
            return;
        }
        sp = getSharedPreferences(PREFS, MODE_PRIVATE);
        int legacyVoice = sp.getInt("voice_preset", 2);
        if (legacyVoice == 1 || legacyVoice == 4) {
            sp.edit().putInt("voice_preset", 2).apply();
        }
        COLOR_ACCENT = AmbientTheme.color(sp);
        wideSettings = (int) (getResources().getDisplayMetrics().widthPixels
                / getResources().getDisplayMetrics().density) >= 600;

        if (wideSettings) {
            FrameLayout shell = new FrameLayout(this);
            shell.setBackgroundColor(COLOR_BG);
            applySystemBarInsets(shell);
            LinearLayout split = new LinearLayout(this);
            split.setOrientation(LinearLayout.HORIZONTAL);
            sideMenu = buildCategoryMenu();
            int sidebarWidth = Math.min(dp(360),
                    (int) (getResources().getDisplayMetrics().widthPixels * 0.30f));
            split.addView(sideMenu, new LinearLayout.LayoutParams(
                    Math.max(dp(290), sidebarWidth), ViewGroup.LayoutParams.MATCH_PARENT));
            detailHost = new FrameLayout(this);
            split.addView(detailHost, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
            shell.addView(split, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            setContentView(shell);
            showEmptyDetail();
        } else {
            narrowHost = new FrameLayout(this);
            narrowHost.setBackgroundColor(COLOR_BG);
            applySystemBarInsets(narrowHost);
            setContentView(narrowHost);
            showCategoryMenu();
        }
    }

    /** Warn before subscribing to the experimental Reimei update channel. */
    private void showReimeiWarning(final Runnable onConfirm) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.reimei_channel_warning"),
                I18n.tr("settings.reimei_is_an_experimental_beta_channel"));

        TextView details = new TextView(this);
        details.setText(I18n.tr("settings.choose_reimei_only_if_you_want"));
        details.setTextColor(COLOR_TEXT);
        details.setTextSize(15);
        details.setLineSpacing(dp(3), 1f);
        details.setPadding(dp(4), dp(2), dp(4), dp(14));
        sheet.addView(details, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);

        TextView cancel = new TextView(this);
        cancel.setText(I18n.tr("report.cancel"));
        cancel.setTextColor(COLOR_TEXT);
        cancel.setTextSize(16);
        cancel.setTypeface(Typeface.DEFAULT_BOLD);
        cancel.setGravity(Gravity.CENTER);
        GradientDrawable cancelBg = new GradientDrawable();
        cancelBg.setColor(COLOR_CONTROL);
        cancelBg.setCornerRadius(dp(14));
        cancelBg.setStroke(dp(1), COLOR_BORDER);
        cancel.setBackground(cancelBg);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { dialog.dismiss(); }
        });
        actions.addView(cancel, new LinearLayout.LayoutParams(0, dp(52), 1f));

        TextView confirm = new TextView(this);
        confirm.setText(I18n.tr("settings.use_reimei"));
        confirm.setTextColor(0xFFFFFFFF);
        confirm.setTextSize(16);
        confirm.setTypeface(Typeface.DEFAULT_BOLD);
        confirm.setGravity(Gravity.CENTER);
        GradientDrawable confirmBg = new GradientDrawable();
        confirmBg.setColor(0xFF1687C9);
        confirmBg.setCornerRadius(dp(14));
        confirmBg.setStroke(dp(1), 0xFF55C7FF);
        confirm.setBackground(confirmBg);
        confirm.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (onConfirm != null) onConfirm.run();
                dialog.dismiss();
            }
        });
        LinearLayout.LayoutParams confirmLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        confirmLp.leftMargin = dp(8);
        actions.addView(confirm, confirmLp);
        sheet.addView(actions);
        dialog.setContentView(sheet);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();
        showBottomSheet(dialog, sheet, dp(560));
    }

    /**
     * The settings activity deliberately draws its own chrome.  Android 15 enforces edge-to-edge
     * for targetSdk 35, so relying on the old decor behavior can put the title and Back button
     * underneath the status bar.  Keep the long-lived host inside all system bars; category pages
     * are replaced inside this host and therefore cannot lose or accumulate the inset padding.
     */
    private void applySystemBarInsets(final View host) {
        if (host == null || android.os.Build.VERSION.SDK_INT < 21) return;
        host.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override public android.view.WindowInsets onApplyWindowInsets(
                    View view, android.view.WindowInsets insets) {
                if (insets == null) return null;
                if (android.os.Build.VERSION.SDK_INT >= 30) {
                    android.graphics.Insets safe = insets.getInsets(
                            android.view.WindowInsets.Type.systemBars()
                                    | android.view.WindowInsets.Type.displayCutout());
                    view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                } else {
                    view.setPadding(
                            insets.getSystemWindowInsetLeft(),
                            insets.getSystemWindowInsetTop(),
                            insets.getSystemWindowInsetRight(),
                            insets.getSystemWindowInsetBottom());
                }
                return insets;
            }
        });
        host.requestApplyInsets();
        host.post(new Runnable() {
            @Override public void run() { host.requestApplyInsets(); }
        });
    }

    @Override protected void onStart() {
        super.onStart();
        HudDeviceConfig.addListener(hudDeviceConfigListener);
        if (hudStatusReceiverRegistered) return;
        IntentFilter filter = new IntentFilter(HudLinkService.ACTION_STATUS_CHANGED);
        if (android.os.Build.VERSION.SDK_INT >= 33)
            registerReceiver(hudStatusReceiver, filter, RECEIVER_NOT_EXPORTED);
        else registerReceiver(hudStatusReceiver, filter);
        hudStatusReceiverRegistered = true;
        refreshHudLinkStatus();
    }

    @Override protected void onResume() {
        super.onResume();
        if (xadasStatusTitle != null) {
            xadasUiHandler.removeCallbacks(xadasUiTick);
            xadasUiHandler.post(xadasUiTick);
        }
    }

    @Override protected void onStop() {
        xadasUiHandler.removeCallbacks(xadasUiTick);
        HudDeviceConfig.removeListener(hudDeviceConfigListener);
        if (hudStatusReceiverRegistered) {
            try { unregisterReceiver(hudStatusReceiver); } catch (Throwable ignored) { }
            hudStatusReceiverRegistered = false;
        }
        super.onStop();
    }

    @Override protected void onDestroy() {
        audioPreviewHandler.removeCallbacks(audioPreviewCountdown);
        gpsUiHandler.removeCallbacks(gpsUiTick);
        xadasUiHandler.removeCallbacks(xadasUiTick);
        xadasStatusTitle = xadasStatusDetail = xadasOpenButton = null;
        discardAlertRecording();
        super.onDestroy();
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_EXPORT_MOD_SETTINGS) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            final android.net.Uri target = data.getData();
            new Thread(new Runnable() {
                @Override public void run() {
                    final int count = ModSettingsTransfer.exportToUri(
                            ModSettingsActivity.this, sp, target);
                    runOnUiThread(new Runnable() {
                        @Override public void run() {
                            if (isFinishing()) return;
                            android.widget.Toast.makeText(ModSettingsActivity.this,
                                    count >= 0 ? I18n.f("settings.exported_0_settings", count)
                                            : I18n.tr("settings.couldnt_export_mod_settings"),
                                    count >= 0 ? android.widget.Toast.LENGTH_SHORT
                                            : android.widget.Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }, "WazeMod-SettingsExport").start();
            return;
        }
        if (requestCode == REQUEST_IMPORT_MOD_SETTINGS) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            showSettingsImportConfirmation(data.getData());
            return;
        }
        if (requestCode == REQUEST_IMPORT_LANGUAGE_PACK) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            importLanguagePack(data.getData());
            return;
        }
        if (requestCode == REQUEST_EXPORT_LANGUAGE_TEMPLATE) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            exportLanguageTemplate(data.getData());
            return;
        }
        if (requestCode == REQUEST_EXPORT_TRIP_GPX) {
            final long tripId = pendingTripExportId > 0L
                    ? pendingTripExportId : sp.getLong("pending_trip_export_id", -1L);
            pendingTripExportId = -1L;
            sp.edit().remove("pending_trip_export_id").apply();
            if (resultCode != RESULT_OK || data == null || data.getData() == null
                    || tripId <= 0L) return;
            final android.net.Uri target = data.getData();
            android.widget.Toast.makeText(this, I18n.tr("settings.exporting_black_box_gpx"),
                    android.widget.Toast.LENGTH_SHORT).show();
            Thread worker = new Thread(new Runnable() {
                @Override public void run() {
                    final boolean ok = TripBlackBox.exportGpx(
                            ModSettingsActivity.this, tripId, target);
                    runOnUiThread(new Runnable() {
                        @Override public void run() {
                            if (isFinishing()) return;
                            android.widget.Toast.makeText(ModSettingsActivity.this,
                                    ok ? I18n.tr("settings.trip_exported_as_gpx")
                                            : I18n.tr("settings.couldnt_export_the_trip_as_gpx"),
                                    ok ? android.widget.Toast.LENGTH_SHORT
                                            : android.widget.Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }, "WazeMod-TripExport");
            worker.setDaemon(true);
            worker.start();
            return;
        }
        if (requestCode == REQUEST_EXPORT_DIAGNOSTICS) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            final android.net.Uri target = data.getData();
            final int exportType = pendingDiagnosticsExport;
            android.widget.Toast.makeText(this, I18n.tr("settings.packaging_the_report"),
                    android.widget.Toast.LENGTH_SHORT).show();
            Thread worker = new Thread(new Runnable() {
                @Override public void run() {
                    final boolean ok = DiagnosticsLogger.export(
                            ModSettingsActivity.this, target, exportType);
                    runOnUiThread(new Runnable() {
                        @Override public void run() {
                            if (isFinishing()) return;
                            android.widget.Toast.makeText(ModSettingsActivity.this,
                                    ok ? I18n.tr("settings.diagnostic_report_exported")
                                            : I18n.tr("settings.couldnt_export_the_diagnostic_report"),
                                    ok ? android.widget.Toast.LENGTH_SHORT
                                            : android.widget.Toast.LENGTH_LONG).show();
                        }
                    });
                }
            }, "WazeMod-DiagnosticsExport");
            worker.setDaemon(true);
            worker.start();
            return;
        }
        if (requestCode == REQUEST_EXPORT_RECORDING_PACKAGE) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            int count = CustomAlertAudio.exportRecordingPackage(this, sp, data.getData());
            android.widget.Toast.makeText(this,
                    count > 0 ? I18n.f("settings.exported_0_recording_s", count)
                            : (count == 0 ? I18n.tr("settings.no_self_recorded_audio_to_export") : I18n.tr("settings.couldnt_export_the_audio_pack")),
                    count >= 0 ? android.widget.Toast.LENGTH_SHORT : android.widget.Toast.LENGTH_LONG)
                    .show();
            return;
        }
        if (requestCode == REQUEST_IMPORT_RECORDING_PACKAGE) {
            if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
            android.net.Uri packageUri = data.getData();
            try {
                getContentResolver().takePersistableUriPermission(packageUri,
                        data.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION);
            } catch (Throwable ignored) { }
            showRecordingPackageImportDrawer(packageUri);
            return;
        }
        if (requestCode == REQUEST_EXPORT_ALERT_RECORDING) {
            String slot = sp.getString("pending_custom_audio_export_slot", "");
            sp.edit().remove("pending_custom_audio_export_slot").apply();
            if (resultCode != RESULT_OK || data == null || data.getData() == null
                    || slot == null || slot.isEmpty()) return;
            boolean exported = CustomAlertAudio.exportToUri(this, slot, data.getData());
            android.widget.Toast.makeText(this,
                    exported ? I18n.tr("settings.recording_exported") : I18n.tr("settings.couldnt_export_the_recording"),
                    exported ? android.widget.Toast.LENGTH_SHORT : android.widget.Toast.LENGTH_LONG)
                    .show();
            return;
        }
        if (requestCode != REQUEST_PICK_OVERSPEED_AUDIO) return;
        String slot = selectedAudioSlot;
        if (slot == null || slot.isEmpty())
            slot = sp.getString("pending_custom_audio_slot", "");
        sp.edit().remove("pending_custom_audio_slot").apply();
        if (resultCode != RESULT_OK || data == null || data.getData() == null
                || slot == null || slot.isEmpty()) return;
        android.net.Uri uri = data.getData();
        String displayName = audioDisplayName(uri);
        boolean imported = CustomAlertAudio.importUri(this, slot, uri);
        if (imported) {
            sp.edit().putInt(CustomAlertAudio.modeKey(slot), CustomAlertAudio.MODE_FILE)
                    .putString(CustomAlertAudio.nameKey(slot), displayName).apply();
            if (selectedAudioSummary != null)
                selectedAudioSummary.setText(customAudioLabel(slot));
            android.widget.Toast.makeText(this, I18n.tr("settings.custom_audio_saved"),
                    android.widget.Toast.LENGTH_SHORT).show();
        } else {
            android.widget.Toast.makeText(this,
                    I18n.tr("settings.invalid_file_longer_than_30_seconds"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
        selectedAudioSlot = "";
        selectedAudioSummary = null;
    }

    private final BroadcastReceiver hudStatusReceiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            refreshHudLinkStatus();
        }
    };

    private void refreshHudLinkStatus() {
        if (hudFirmwareRefresh != null) hudFirmwareRefresh.run();
        TextView value = hudLinkStatus;
        if (value == null || sp == null) return;
        String state = sp.getString("hud_link_status", "DISABLED");
        if ("CONNECTED".equals(state) && (!sp.getBoolean("hud_link", false)
                || !HudLinkService.isRunning()))
            state = "DISABLED";
        String detail = sp.getString("hud_link_error", "");
        String[] friendly = hudLinkFriendlyStatus(state, detail);
        value.setText(friendly[0]);
        if (hudLinkStatusHint != null) {
            hudLinkStatusHint.setText(friendly[1]);
            hudLinkStatusHint.setVisibility(friendly[1].length() > 0 ? View.VISIBLE : View.GONE);
        }
        if (hudLinkStatusDot != null) {
            GradientDrawable dot = new GradientDrawable();
            dot.setShape(GradientDrawable.OVAL);
            dot.setColor(hudLinkStatusColor(state));
            hudLinkStatusDot.setBackground(dot);
        }
        // Raw (translated) connection detail for troubleshooting, collapsed by default.
        String technical = HudLinkService.localizedState(state);
        String detailLabel = HudLinkService.localizedDetail(detail);
        if (detailLabel.length() > 0) technical += " • " + detailLabel;
        if (hudLinkStatusDetail != null) {
            hudLinkStatusDetail.setText(technical);
            hudLinkStatusDetail.setVisibility(hudLinkDetailExpanded ? View.VISIBLE : View.GONE);
        }
        if (hudLinkStatusDetailToggle != null) {
            hudLinkStatusDetailToggle.setText(hudLinkDetailExpanded
                    ? I18n.tr("settings.hide_technical_details") : I18n.tr("settings.technical_details"));
        }
        if (hudLinkEnabledSwitch != null) {
            boolean checked = hudLinkEnabledForTab(hudLinkUiTab());
            if (hudLinkEnabledSwitch.isChecked() != checked) {
                setHudLinkSwitchChecked(checked);
            }
        }
        if (hudLinkActionButton != null) {
            hudLinkActionButton.setText(hudLinkActionLabel(
                    hudLinkEnabledForTab(hudLinkUiTab()) ? state : "IDLE"));
        }
        renderHudDeviceConfig();
    }

    /**
     * {headline, hint} in everyday words. The connection manager publishes developer-oriented
     * details ("CONNECTION_FAILED: ... (retry in 8000 ms)"); those stay in the collapsed
     * technical line, while the card says what is happening and what the user can do.
     */
    private String[] hudLinkFriendlyStatus(String state, String detail) {
        String d = detail == null ? "" : detail;
        String lower = d.toLowerCase(java.util.Locale.US);
        if ("CONNECTED".equals(state)) {
            String via = HudLinkService.localizedDetail(
                    sp.getString("hud_link_active_transport", ""));
            String hint = via.length() > 0 ? I18n.f("settings.sending_data_over_0", via) : I18n.tr("settings.sending_data_to_the_hud");
            if (lower.contains("one-way")) hint += I18n.tr("settings.the_hud_hasnt_replied_data_only");
            return new String[]{I18n.tr("hud_link.connected"), hint};
        }
        if ("CONNECTING".equals(state) || "HANDSHAKING".equals(state))
            return new String[]{I18n.tr("settings.connecting"), I18n.tr("settings.finding_and_contacting_the_hud_please")};
        if ("RETRY_WAIT".equals(state)) {
            String when = I18n.tr("settings.will_retry_automatically_shortly");
            int at = d.indexOf("(retry in ");
            int end = at < 0 ? -1 : d.indexOf(" ms)", at);
            if (end > at) {
                try {
                    long delay = Long.parseLong(d.substring(at + 10, end));
                    long passed = android.os.SystemClock.elapsedRealtime() - sp.getLong("hud_link_status_at", 0L);
                    long left = (delay - Math.max(0L, passed) + 999L) / 1000L;
                    if (left > 0) when = I18n.f("settings.will_retry_automatically_in_0_seconds", left);
                } catch (Throwable ignored) { }
            }
            return new String[]{I18n.tr("settings.connection_lost"), when + " " + I18n.tr("settings.check_that_the_hud_is_on")};
        }
        if ("PERMISSION_REQUIRED".equals(state)) {
            return new String[]{I18n.tr("settings.permission_needed"), lower.contains("usb")
                    ? I18n.tr("settings.reconnect_the_usb_device_and_choose")
                    : I18n.tr("settings.grant_waze_the_nearby_devices_permission")};
        }
        if ("BLUETOOTH_OFF".equals(state))
            return new String[]{I18n.tr("hud_link.bluetooth_is_off_2"), I18n.tr("settings.turn_on_bluetooth_to_connect_the")};
        if ("DISABLED".equals(state))
            return new String[]{I18n.tr("hud_link.off"), I18n.tr("settings.turn_on_the_switch_above_to")};
        if ("START_BLOCKED".equals(state))
            return new String[]{I18n.tr("settings.couldnt_start"),
                    I18n.tr("settings.android_is_blocking_the_background")};
        if ("IDLE".equals(state)) {
            String hint = I18n.tr("settings.tap_connect_to_start");
            if (lower.contains("no device selected")) hint = I18n.tr("settings.choose_a_hud_device_above_then");
            else if (lower.contains("websocket endpoint")) hint = I18n.tr("settings.enter_the_huds_ip_address_above");
            else if (lower.contains("peer requested")) hint = I18n.tr("settings.the_hud_disconnected_on_its_own");
            else if (lower.contains("not_found") || lower.contains("not found"))
                hint = I18n.tr("settings.hud_not_found_check_that_it");
            else if (lower.contains("not_bonded"))
                hint = I18n.tr("settings.the_hud_isnt_paired_pair_it");
            return new String[]{I18n.tr("settings.not_connected"), hint};
        }
        return new String[]{I18n.tr("settings.connection_error"),
                I18n.tr("settings.tap_reconnect_if_it_still_fails")};
    }

    private static int hudLinkStatusColor(String state) {
        if ("CONNECTED".equals(state)) return 0xFF34C759;
        if ("CONNECTING".equals(state) || "HANDSHAKING".equals(state)
                || "RETRY_WAIT".equals(state)) return 0xFFFFB020;
        if ("DISABLED".equals(state) || "IDLE".equals(state)) return 0xFF7C8494;
        return 0xFFFF4D4F;
    }

    /** Status card: coloured dot + headline, a wrapping hint, and a collapsible technical line. */
    private void addHudLinkStatusCard(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(12));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);

        TextView caption = new TextView(this);
        caption.setText(I18n.tr("settings.connection_status"));
        caption.setTextSize(13);
        caption.setTextColor(COLOR_MUTED);
        card.addView(caption);

        LinearLayout head = new LinearLayout(this);
        head.setOrientation(LinearLayout.HORIZONTAL);
        head.setGravity(Gravity.CENTER_VERTICAL);
        hudLinkStatusDot = new View(this);
        LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(11), dp(11));
        dotLp.rightMargin = dp(9);
        head.addView(hudLinkStatusDot, dotLp);
        hudLinkStatus = new TextView(this);
        hudLinkStatus.setTextSize(18);
        hudLinkStatus.setTextColor(COLOR_TEXT);
        hudLinkStatus.setTypeface(Typeface.DEFAULT_BOLD);
        head.addView(hudLinkStatus, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        LinearLayout.LayoutParams headLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        headLp.topMargin = dp(4);
        card.addView(head, headLp);

        hudLinkStatusHint = new TextView(this);
        hudLinkStatusHint.setTextSize(14);
        hudLinkStatusHint.setTextColor(COLOR_TEXT);
        hudLinkStatusHint.setMaxLines(3);
        hudLinkStatusHint.setEllipsize(android.text.TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.topMargin = dp(4);
        card.addView(hudLinkStatusHint, hintLp);

        hudLinkStatusDetailToggle = new TextView(this);
        hudLinkStatusDetailToggle.setTextSize(13);
        hudLinkStatusDetailToggle.setTextColor(COLOR_ACCENT);
        hudLinkStatusDetailToggle.setPadding(0, dp(8), dp(8), dp(2));
        hudLinkStatusDetailToggle.setClickable(true);
        hudLinkStatusDetailToggle.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                hudLinkDetailExpanded = !hudLinkDetailExpanded;
                refreshHudLinkStatus();
            }
        });
        card.addView(hudLinkStatusDetailToggle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        hudLinkStatusDetail = new TextView(this);
        hudLinkStatusDetail.setTextSize(12);
        hudLinkStatusDetail.setTextColor(COLOR_MUTED);
        hudLinkStatusDetail.setMaxLines(6);
        hudLinkStatusDetail.setEllipsize(android.text.TextUtils.TruncateAt.END);
        hudLinkStatusDetail.setTextIsSelectable(true);
        hudLinkStatusDetail.setVisibility(View.GONE);
        LinearLayout.LayoutParams detailLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        detailLp.topMargin = dp(2);
        card.addView(hudLinkStatusDetail, detailLp);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(card, lp);
    }

    /** Value shown on the right of a settings row; long device names end in "…" instead of pushing the row. */
    private TextView rowValue(String text) {
        TextView value = new TextView(this);
        value.setText(text);
        value.setTextColor(COLOR_ACCENT);
        value.setTextSize(14);
        value.setSingleLine(true);
        value.setEllipsize(android.text.TextUtils.TruncateAt.END);
        value.setGravity(Gravity.END);
        value.setMaxWidth(dp(170));
        return value;
    }

    private void setHudLinkSwitchChecked(boolean checked) {
        if (hudLinkEnabledSwitch == null) return;
        updatingHudLinkSwitch = true;
        try { hudLinkEnabledSwitch.setChecked(checked); }
        finally { updatingHudLinkSwitch = false; }
    }

    private boolean hudLinkEnabledForTab(int tab) {
        int transport = sp.getInt("hud_link_transport", HudDeviceRepository.TRANSPORT_AUTO);
        // Only "Auto" needs the live connection to say which tab it belongs to. An explicit Wi-Fi or
        // USB choice must win, or a Bluetooth link that is still up while the user switches to
        // Wi-Fi makes the Wi-Fi switch spring back to Off.
        if (transport == HudDeviceRepository.TRANSPORT_AUTO && HudLinkService.isRunning()
                && "CONNECTED".equals(sp.getString("hud_link_status", ""))) {
            String active = sp.getString("hud_link_active_transport", "");
            if ("ws".equals(active)) transport = HudDeviceRepository.TRANSPORT_WS;
            else if ("usb".equals(active)) transport = HudDeviceRepository.TRANSPORT_USB;
            else if ("ble".equals(active) || "spp".equals(active))
                transport = HudDeviceRepository.TRANSPORT_BLE;
        }
        return sp.getBoolean("hud_link", false)
                && (tab == HUD_LINK_TAB_WIFI ? transport == HudDeviceRepository.TRANSPORT_WS
                : tab == HUD_LINK_TAB_USB ? transport == HudDeviceRepository.TRANSPORT_USB
                : transport != HudDeviceRepository.TRANSPORT_WS
                        && transport != HudDeviceRepository.TRANSPORT_USB);
    }

    private String hudLinkActionLabel(String state) {
        if ("CONNECTED".equals(state)) return I18n.tr("settings.disconnect");
        if ("CONNECTING".equals(state) || "HANDSHAKING".equals(state)
                || "RETRY_WAIT".equals(state) || "ERROR".equals(state))
            return I18n.tr("settings.reconnect");
        return I18n.tr("settings.connect");
    }

    protected void onCreateLegacy(Bundle b) {
        super.onCreate(b);
        if (!Gateway.modEnabled(this)) {
            finish();
            return;
        }
        sp = getSharedPreferences(PREFS, MODE_PRIVATE);

        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(COLOR_BG);
        scroll.setFillViewport(true);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(16), dp(18), dp(16), dp(28));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView title = new TextView(this);
        title.setText("WAZE MOD");
        title.setTextSize(25);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText(I18n.tr("settings.customize_your_driving_experience"));
        subtitle.setTextSize(14);
        subtitle.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams subtitleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitleLp.topMargin = dp(2);
        subtitleLp.bottomMargin = dp(4);
        root.addView(subtitle, subtitleLp);

        LinearLayout audio = addCategory(root, I18n.tr("settings.sound_voice"),
                I18n.tr("settings.speed_alerts_road_segment_data_and"));
        addRecordedVoiceWarning(audio);
        addSection(audio, I18n.tr("settings.alert_sounds"));
        addAudioMixChoice(audio);
        addSwitch(audio, I18n.tr("settings.follows_wazes_sound_mode_silent_when"),
                WazeSoundMode.PREF_RESPECT, true);
        addChoice(audio, I18n.tr("settings.voice_set"), "voice_preset",
                new int[]{2, 3},
                new String[]{I18n.tr("settings.waze_m_n_nhi"), "WazeMod"}, 2);
        addSection(audio, I18n.tr("settings.speed_announcements"));
        addSwitch(audio, I18n.tr("settings.announce_the_current_speed_limit"), "say_limit", true);
        addSwitch(audio, I18n.tr("settings.alert_when_speeding"), "say_over", true);
        addSwitch(audio, I18n.tr("settings.announce_before_a_speed_drop"), "say_next", true);
        addSection(audio, I18n.tr("settings.road_alerts"));
        addSwitch(audio, I18n.tr("settings.announce_road_segment_data_notices"), "road_notice_tts", true);
        addSwitch(audio, I18n.tr("settings.read_the_note_of_a_missing_sign_alert"), "missing_sign_note_tts", true);
        addSwitch(audio, I18n.tr("settings.wme_speed_limit_points_when_driving_without_a_route"), "wme_speed_points", false);
        addSection(audio, I18n.tr("settings.driver_reminders"));
        addSwitch(audio, I18n.tr("settings.headlight_reminder_5_30_pm_6"), "headlight_reminder", false,
                new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.onHeadlightReminderSettingChanged(ModSettingsActivity.this);
                    }
                });
        addBreakReminderSettings(audio);

        LinearLayout speedGps = addCategory(root, I18n.tr("settings.speed_gps"),
                I18n.tr("settings.alert_threshold_and_calibration_to_match"));
        addChoice(speedGps, I18n.tr("settings.over_speed_threshold"), "over_margin",
                OVER_MARGIN_VALUES, OVER_MARGIN_LABELS, 0);
        addSwitch(speedGps, I18n.tr("settings.mute_button_for_the_over_speed"),
                "overspeed_mute_button", true);
        if (Region.inVietnam()) addSwitch(speedGps, I18n.tr("settings.motorcycle_limit"), "moto_cap", true);
        addLimitSignStyleChoice(speedGps);

        final SeekBar[] pctRef = new SeekBar[1];
        final SeekBar offBar = addSlider(speedGps, I18n.tr("settings.gps_speed_calibration_km_h"), "gps_offset",
                -10, 10, 1, 0, " km/h", true, I18n.tr("settings.adjusting_gps_can_cause_speed_errors"),
                new Runnable() { @Override public void run() { resetSlider(pctRef[0], 0); } });
        pctRef[0] = addSlider(speedGps, I18n.tr("settings.gps_speed_calibration_add"), "gps_pct",
                0, 10, 1, 0, "%", true, I18n.tr("settings.adds_a_proportion_matches_the_cars"),
                new Runnable() { @Override public void run() { resetSlider(offBar, 0); } });
        addSwitch(speedGps, I18n.tr("settings.apply_calibration_on_android_auto"),
                "gps_correct_android_auto", true);

        LinearLayout hud = addCategory(root, "HUD",
                I18n.tr("settings.choose_the_layout_and_size_of"));
        addChoice(hud, I18n.tr("settings.hud_screen_orientation"), "hud_orientation",
                new int[]{0, 1, 2}, new String[]{I18n.tr("settings.auto"), I18n.tr("settings.landscape"), I18n.tr("settings.portrait")}, 1);
        if (sp.getInt("hud_orientation", 1) == 2) addPortraitGaugePicker(hud);
        else addHudLayoutPicker(hud);
        addSlider(hud, I18n.tr("settings.gauge_size_speed_limit_arrow"), "hud_size", 40, 160, 5, 100, "%", false, null, null);
        addSwitch(hud, I18n.tr("settings.mirror_windshield_reflection_by_default"), "mirror", false);

        LinearLayout mapDisplay = addCategory(root, I18n.tr("settings.map_display"),
                I18n.tr("settings.information_layers_shown_directly_on_the"));
        addSwitch(mapDisplay, I18n.tr("settings.show_the_wazemod_quick_report"), "mod_reports_enabled", true);
        addSwitch(mapDisplay, I18n.tr("settings.floating_speedometer_on_the_map_drag"), "float_speedo", true);
        addSlider(mapDisplay, I18n.tr("settings.floating_gauge_size"), "fs_size", 80, 220, 10, 130, "%", false, null, null);
        addSwitch(mapDisplay, I18n.tr("settings.speed_and_upcoming_alert_list_drag"),
                "upcoming_alerts", true);
        addChoice(mapDisplay, I18n.tr("settings.number_of_alerts_shown_max_2"), "upcoming_count",
                new int[]{1, 2, 3}, new String[]{I18n.tr("settings.1_item"), I18n.tr("settings.2_items"), I18n.tr("settings.3_items")}, 3);
        addSlider(mapDisplay, I18n.tr("settings.alert_list_size"), "upcoming_size", 70, 160, 10, 100,
                "%", false, null, null);
        addSlider(mapDisplay, I18n.tr("settings.icon_size_in_the_list_v2"), "upcoming_icon_size",
                70, 160, 10, 100, "%", false, null, null);
        if (Region.inVietnam()) addSwitch(mapDisplay, I18n.tr("settings.show_the_minimum_speed_sign_on"), "minimum_speed", false,
                new BoolCb() {
                    @Override public void on(boolean v) {
                        Gateway.onMinimumSpeedSettingChanged(v);
                    }
                });
        addSwitch(mapDisplay, I18n.tr("settings.center_the_map_in_landscape"), "center_landscape_map", true);
        addSwitch(mapDisplay, I18n.tr("settings.recommended_following_distance_sign_on"),
                "expressway_following_distance", false, new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.onFollowingDistanceSettingChanged(enabled);
                    }
                });
        TextView followingHint = new TextView(this);
        followingHint.setText(I18n.tr("settings.recommended_distance_based_on_gps_speed"));
        mapDisplay.addView(followingHint);
        addSwitch(mapDisplay, I18n.tr("settings.show_wazes_original_speedometer"),
                "native_speedo_visible", true, new BoolCb() {
                    @Override public void on(boolean visible) {
                        Gateway.refreshNativeSpeedoVisibility();
                    }
                });
        addSwitch(mapDisplay, I18n.tr("settings.use_the_accent_color_for_the"),
                "float_speed_current_ambient", false, new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.refreshNativeSpeedoTextColor();
                    }
                });
        addSwitch(mapDisplay, I18n.tr("settings.wazes_original_gauge_large_limit_sign"),
                "native_speedo_swap", false, new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.refreshNativeSpeedoRoles();
                    }
                });
        final NativeSpeedoPreview legacyNativeSpeedoPreview = addNativeSpeedoPreview(mapDisplay);
        addSlider(mapDisplay, I18n.tr("settings.size_of_wazes_original_speedometer"), "native_speedo_size",
                100, 200, 5, 100, "%", false,
                I18n.tr("settings.only_changes_wazes_default_round_gauge"),
                new Runnable() {
                    @Override public void run() {
                        legacyNativeSpeedoPreview.setSizePercent(
                                sp.getInt("native_speedo_size", 100));
                        Gateway.refreshNativeSpeedoSize();
                    }
                });
        addSlider(mapDisplay, I18n.tr("settings.size_of_wazes_original_alert_panel"),
                "phone_alert_banner_size", 60, 100, 1, 100, "%", false,
                I18n.tr("settings.experimental_applies_when_the_alert_is"), null);
        final NavBannerPreview legacyNavPreview = addNavBannerPreview(mapDisplay);
        addSlider(mapDisplay, I18n.tr("settings.guidance_panel_background_opacity"), "nav_banner_opacity",
                40, 100, 1, 78, "%", false,
                I18n.tr("settings.100_is_the_original_black_background"),
                new Runnable() {
                    @Override public void run() {
                        legacyNavPreview.syncFromPreferences();
                        Gateway.refreshNavBarOpacity();
                    }
                });
        addSlider(mapDisplay, I18n.tr("settings.guidance_panel_size"), "nav_banner_size",
                50, 100, 5, 100, "%", false,
                I18n.tr("settings.scales_down_the_arrow_distance_shield"),
                new Runnable() {
                    @Override public void run() {
                        legacyNavPreview.syncFromPreferences();
                        Gateway.refreshNavBarAppearance();
                    }
                });
        addSlider(mapDisplay, I18n.tr("settings.street_name_text_size_on_the"), "nav_street_text_size",
                100, 150, 5, 100, "%", false,
                I18n.tr("settings.only_enlarges_the_street_name_text"),
                new Runnable() {
                    @Override public void run() {
                        legacyNavPreview.syncFromPreferences();
                        Gateway.refreshNavBarAppearance();
                    }
                });
        addServerDisabledFeatureSwitches(mapDisplay);

        LinearLayout bubble = addCategory(root, I18n.tr("settings.traffic_bubble"),
                I18n.tr("settings.floating_information_when_you_switch_to"));
        addSwitch(bubble, I18n.tr("settings.traffic_bubble_floating_over_other_apps"), "bubble", false, new BoolCb() {
            @Override public void on(boolean v) {
                if (v) {
                    if (!Bubble.canShow(ModSettingsActivity.this)) {
                        Bubble.requestPermission(ModSettingsActivity.this);
                    }
                    Bubble.installAutoHide(getApplicationContext());
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.the_bubble_appears_when_you_leave"),
                            android.widget.Toast.LENGTH_LONG).show();
                } else {
                    Bubble.hide();
                    BubbleKeepAliveService.sync(ModSettingsActivity.this);
                }
            }
        });
        addBubbleLayoutPicker(bubble);
        addSwitch(bubble, I18n.tr("settings.alert_rail_v2_on_horizontal_vertical"), "bubble_alert_rail_v2", false,
                new BoolCb() { @Override public void on(boolean enabled) { Bubble.refresh(); } });
        addSlider(bubble, I18n.tr("settings.bubble_size"), "bub_size", 80, 200, 10, 100, "%", false, null,
                new Runnable() { @Override public void run() { Bubble.refresh(); } });
        addSwitch(bubble, I18n.tr("settings.tap_the_speed_limit_sign_to"), "bubble_speed_report", true);

        LinearLayout androidAuto = addCategory(root, "Android Auto",
                I18n.tr("settings.show_the_safe_speed_on_the"));
        addSection(androidAuto, I18n.tr("settings.android_auto_connection"));
        addAaConnectionSettings(androidAuto);
        addSection(androidAuto, I18n.tr("settings.android_auto_speedometer"));
        addSwitch(androidAuto, I18n.tr("settings.speed_limit_gauge_on_android_auto"), "aa_float_speedo", false);
        addAaSpeedoLayoutPicker(androidAuto);
        addAaSpeedoPositionChoice(androidAuto);
        addSlider(androidAuto, I18n.tr("settings.android_auto_gauge_size"), "aa_fs_size", 60, 180, 10, 100, "%", false,
                I18n.tr("settings.place_within_the_android_auto_safe"), null);
        addSection(androidAuto, I18n.tr("settings.upcoming_alert_list"));
        addAaAlertRailSettings(androidAuto);
        addSection(androidAuto, I18n.tr("settings.android_auto_over_speed"));
        addAaOverspeedEdgeSetting(androidAuto);

        LinearLayout updates = addCategory(root, I18n.tr("settings.updates_map_data"),
                I18n.tr("settings.mod_version_and_waze_map_release"));
        addMapBuildStatus(updates);

        // addSection(root, "Thử nghiệm");
        // addSwitch(root, "Cảnh báo cấm dừng/đỗ", "parking_test", false);

        addReimeiBuildWarning(root);

        TextView note = new TextView(this);
        note.setText(I18n.f("settings.waze_mod_0_by_chisadin_download", ModBuildInfo.versionLabel(this)));
        note.setTextSize(13);
        note.setTextColor(0xFF6E7479);
        note.setPadding(0, dp(18), 0, 0);
        root.addView(note);

        setContentView(scroll);
        fetchMapBuildStatus();
    }

    /**
     * A category is a real visual container, not only a separator label.  This keeps related
     * controls together while the pink route marker makes each group easy to find at a glance.
     */
    private LinearLayout buildCategoryMenu() {
        LinearLayout panel = new LinearLayout(this);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(16), dp(16), dp(10), dp(12));
        GradientDrawable panelBg = new GradientDrawable();
        panelBg.setColor(0xFF1B191E);
        panelBg.setCornerRadius(dp(6));
        panel.setBackground(panelBg);

        LinearLayout heading = new LinearLayout(this);
        heading.setOrientation(LinearLayout.HORIZONTAL);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextSize(38);
        back.setTextColor(COLOR_TEXT);
        back.setGravity(Gravity.CENTER);
        back.setContentDescription(I18n.tr("settings.back_to_waze"));
        back.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { finish(); }
        });
        heading.addView(back, new LinearLayout.LayoutParams(dp(40), dp(48)));
        TextView title = new TextView(this);
        title.setText(I18n.tr("settings.waze_mod_settings"));
        title.setTextSize(25);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        heading.addView(title);
        panel.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        ScrollView menuScroll = new ScrollView(this);
        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        String[][] categories = {
                {CAT_FLOAT_SPEEDO, "wz_ui_icon/icons-home.png", I18n.tr("settings.home_screen")},
                {CAT_HUD, "wz_ui_icon/icons-floatSpeedo.png", "HUD"},
                {CAT_BUBBLE, "wz_ui_icon/icons-settings.png", I18n.tr("settings.traffic_bubble")},
                {CAT_ALERTS, "wz_ui_icon/icons-warning.png", I18n.tr("settings.alerts_voice")},
                {CAT_XADAS, ICON_XADAS, "xADAS"},
                {CAT_WAZE_CONFIG, "wz_ui_icon/icons-settings.png", I18n.tr("settings.waze_configuration")},
                {CAT_GPS, "wz_ui_icon/icons-gps.png", I18n.tr("settings.gps_calibration")},
                {CAT_AUTO, "wz_ui_icon/icons-android_auto.png", "Android Auto"},
                {CAT_DEVICE, "wz_ui_icon/icons-hud-link.png", I18n.tr("settings.connect_to_a_device")}, // Keep at "Kết nối với thiết bị"
                {CAT_APPS, "wz_ui_icon/icons-settings.png", I18n.tr("settings.connected_apps")},
                {CAT_MAP, "wz_ui_icon/icons-map.png", I18n.tr("settings.map_display")},
                {CAT_UPDATES, "wz_ui_icon/icons-database.png", I18n.tr("settings.updates_data")},
                {CAT_BLACK_BOX, "wz_ui_icon/icons-gps.png", I18n.tr("settings.trip_black_box")},
                {CAT_DIAGNOSTICS, "wz_ui_icon/icons-warning.png", I18n.tr("settings.diagnostics_log_export")},
                {CAT_ABOUT, "wz_ui_icon/icons-home.png", I18n.tr("settings.about_support")}
        };
        menuRows.clear();
        for (String[] item : categories) addMenuItem(list, item[0], item[1], item[2]);
        menuScroll.addView(list, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        panel.addView(menuScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        trackPageScroll(menuScroll, SCROLL_PAGE_MENU);

        addReimeiBuildWarning(panel);

        TextView version = new TextView(this);
        version.setText("Waze Mod • " + ModBuildInfo.versionLabel(this));
        version.setTextSize(13);
        version.setTextColor(COLOR_MUTED);
        version.setGravity(Gravity.CENTER);
        version.setPadding(0, dp(14), 0, dp(2));
        panel.addView(version, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return panel;
    }

    /** Amber banner at the bottom of Settings, shown only on Reimei (beta channel) builds. */
    private void addReimeiBuildWarning(LinearLayout root) {
        if (!"reimei".equals(ModBuildInfo.channel(this))) return;
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setPadding(dp(12), dp(10), dp(12), dp(10));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0x26FFB020);
        bg.setCornerRadius(dp(12));
        bg.setStroke(dp(1), 0xFFFFB020);
        card.setBackground(bg);

        TextView icon = new TextView(this);
        icon.setText("⚠");
        icon.setTextSize(18);
        icon.setTextColor(0xFFFFB020);
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        iconLp.rightMargin = dp(10);
        card.addView(icon, iconLp);

        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(this);
        title.setText(I18n.tr("settings.reimei_experimental_build"));
        title.setTextSize(14);
        title.setTextColor(0xFFFFB020);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        texts.addView(title);
        TextView body = new TextView(this);
        body.setText(I18n.tr("settings.this_build_may_be_unstable_have"));
        body.setTextSize(12.5f);
        body.setTextColor(COLOR_TEXT);
        body.setLineSpacing(0f, 1.1f);
        LinearLayout.LayoutParams bodyLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bodyLp.topMargin = dp(2);
        texts.addView(body, bodyLp);
        card.addView(texts, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(12);
        root.addView(card, lp);
    }

    private void addMenuItem(LinearLayout list, final String id, String iconAsset, String label) {
        final FrameLayout item = new FrameLayout(this);
        item.setPadding(dp(10), dp(8), dp(8), dp(8));
        item.setContentDescription(label);
        ImageView icon = new ImageView(this);
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        icon.setAdjustViewBounds(true);
        icon.setPadding(dp(4), dp(4), dp(4), dp(4));
        boolean monochrome = iconAsset.endsWith("icons-home.png")
                || iconAsset.endsWith("icons-hud-link.png");
        loadMenuIcon(icon, iconAsset);
        FrameLayout.LayoutParams iconLp = new FrameLayout.LayoutParams(dp(38), dp(42));
        iconLp.gravity = Gravity.CENTER_VERTICAL | Gravity.LEFT;
        item.addView(icon, iconLp);

        TextView text = new TextView(this);
        text.setText(label);
        text.setTextSize(17);
        text.setTypeface(Typeface.DEFAULT_BOLD);
        text.setGravity(Gravity.CENTER_VERTICAL);
        FrameLayout.LayoutParams textLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(42));
        textLp.leftMargin = dp(42);
        textLp.rightMargin = dp(28);
        item.addView(text, textLp);

        TextView chevron = new TextView(this);
        chevron.setText("›");
        chevron.setTextSize(30);
        chevron.setGravity(Gravity.CENTER);
        FrameLayout.LayoutParams arrowLp = new FrameLayout.LayoutParams(dp(28), dp(42));
        arrowLp.gravity = Gravity.CENTER_VERTICAL | Gravity.RIGHT;
        item.addView(chevron, arrowLp);

        item.setTag(new Object[]{icon, text, chevron, Boolean.valueOf(monochrome)});
        item.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { openCategory(id); }
        });
        item.setOnHoverListener(new View.OnHoverListener() {
            @Override public boolean onHover(View view, android.view.MotionEvent event) {
                int action = event.getActionMasked();
                boolean hovered = action != android.view.MotionEvent.ACTION_HOVER_EXIT;
                styleMenuItem(item, id.equals(selectedCategory), hovered);
                return false;
            }
        });
        LinearLayout.LayoutParams itemLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(58));
        itemLp.topMargin = dp(2);
        list.addView(item, itemLp);
        menuRows.put(id, item);
        styleMenuItem(item, false);
    }

    private void styleMenuItem(FrameLayout item, boolean selected) {
        styleMenuItem(item, selected, item.isHovered());
    }

    private void styleMenuItem(FrameLayout item, boolean selected, boolean hovered) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(selected ? (hovered ? 0xFF31263B : 0xFF272032)
                : (hovered ? 0xFF20242E : 0x001B191E));
        bg.setCornerRadius(dp(16));
        if (selected) bg.setStroke(dp(1), hovered ? 0xFFA883FF : 0xFF8060FF);
        else if (hovered) bg.setStroke(dp(1), 0xFF3C4351);
        item.setBackground(bg);
        Object tag = item.getTag();
        if (!(tag instanceof Object[])) return;
        Object[] views = (Object[]) tag;
        int color = selected ? 0xFF9C70FF : (hovered ? COLOR_ACCENT : COLOR_TEXT);
        ImageView icon = (ImageView) views[0];
        boolean monochrome = views.length > 3 && Boolean.TRUE.equals(views[3]);
        if (monochrome) icon.setColorFilter(color, android.graphics.PorterDuff.Mode.SRC_IN);
        else icon.clearColorFilter();
        icon.setAlpha(selected || hovered ? 1f : 0.88f);
        ((TextView) views[1]).setTextColor(selected ? COLOR_TEXT : 0xFFE6E3E8);
        ((TextView) views[2]).setTextColor(selected ? COLOR_TEXT : 0xFFD8D4DC);
    }

    private void loadMenuIcon(ImageView target, String assetPath) {
        if (ICON_XADAS.equals(assetPath)) {
            int logoRes = Gateway.xadasLogoRes();
            if (logoRes != 0) {
                target.setImageResource(logoRes);
                target.setClipToOutline(true);
                target.setOutlineProvider(new android.view.ViewOutlineProvider() {
                    @Override public void getOutline(View view, android.graphics.Outline outline) {
                        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), dp(8));
                    }
                });
                return;
            }
            assetPath = "wz_ui_icon/icons-fallback.png";
        }
        android.graphics.Bitmap bitmap = decodeSampledAsset(assetPath, 96);
        if (bitmap == null && !"wz_ui_icon/icons-fallback.png".equals(assetPath))
            bitmap = decodeSampledAsset("wz_ui_icon/icons-fallback.png", 96);
        if (bitmap != null) target.setImageBitmap(bitmap);
    }

    private android.graphics.Bitmap decodeSampledAsset(String assetPath, int targetPx) {
        java.io.InputStream boundsStream = null;
        java.io.InputStream imageStream = null;
        try {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            boundsStream = getAssets().open(assetPath);
            BitmapFactory.decodeStream(boundsStream, null, bounds);
            try { boundsStream.close(); } catch (Throwable ignored) { }
            boundsStream = null;

            int sample = 1;
            int largest = Math.max(bounds.outWidth, bounds.outHeight);
            while (largest / (sample * 2) >= targetPx) sample *= 2;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = sample;
            imageStream = getAssets().open(assetPath);
            return BitmapFactory.decodeStream(imageStream, null, options);
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (boundsStream != null) try { boundsStream.close(); } catch (Throwable ignored) { }
            if (imageStream != null) try { imageStream.close(); } catch (Throwable ignored) { }
        }
    }

    private void updateMenuSelection() {
        for (java.util.Map.Entry<String, FrameLayout> entry : menuRows.entrySet()) {
            styleMenuItem(entry.getValue(), entry.getKey().equals(selectedCategory));
        }
    }

    private static String categoryScrollKey(String id) {
        return "category:" + id;
    }

    private String categoryPageScrollKey(String id) {
        if (CAT_DEVICE.equals(id)) {
            String tab = hudLinkUiTab() == HUD_LINK_TAB_VIETMAP ? "vietmap"
                    : (hudLinkUiTab() == HUD_LINK_TAB_WIFI ? "wifi"
                    : (hudLinkUiTab() == HUD_LINK_TAB_USB ? "usb" : "hlp"));
            return categoryScrollKey(id) + ":" + tab;
        }
        return categoryScrollKey(id);
    }

    private static String subpageScrollKey(String id) {
        return "subpage:" + id;
    }

    /** Save the page before its host removes it, then restore after the replacement is laid out. */
    private void rememberActivePageScroll() {
        if (activePageScroll == null || activePageScrollKey == null) return;
        pageScrollPositions.put(activePageScrollKey,
                Integer.valueOf(Math.max(0, activePageScroll.getScrollY())));
    }

    private void trackPageScroll(final ScrollView scroll, String key) {
        activePageScroll = scroll;
        activePageScrollKey = key;
        final Integer saved = pageScrollPositions.get(key);
        if (saved == null || saved.intValue() <= 0) return;
        scroll.post(new Runnable() {
            @Override public void run() {
                if (scroll.getChildCount() == 0) return;
                int maxY = Math.max(0, scroll.getChildAt(0).getHeight() - scroll.getHeight());
                scroll.scrollTo(0, Math.min(saved.intValue(), maxY));
            }
        });
    }

    private void showCategoryMenu() {
        rememberActivePageScroll();
        selectedCategory = null;
        if (narrowHost == null) return;
        narrowHost.removeAllViews();
        sideMenu = buildCategoryMenu();
        narrowHost.addView(sideMenu, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    private void showEmptyDetail() {
        if (detailHost == null) return;
        selectedCategory = null;
        updateMenuSelection();
        detailHost.removeAllViews();
        LinearLayout empty = new LinearLayout(this);
        empty.setOrientation(LinearLayout.VERTICAL);
        empty.setGravity(Gravity.CENTER);
        TextView gear = new TextView(this);
        gear.setText("⚙");
        gear.setTextSize(64);
        gear.setTextColor(0xFF8B4DFF);
        gear.setGravity(Gravity.CENTER);
        empty.addView(gear, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(86)));
        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.choose_a_group_of_waze_mod"));
        hint.setTextSize(18);
        hint.setTextColor(COLOR_TEXT);
        hint.setGravity(Gravity.CENTER);
        empty.addView(hint);
        detailHost.addView(empty, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    private void openCategory(String id) {
        rememberActivePageScroll();
        gpsUiHandler.removeCallbacks(gpsUiTick);
        hudLinkEnabledSwitch = null;
        hudLinkStatus = null;
        hudLinkStatusHint = null;
        hudLinkStatusDetail = null;
        hudLinkStatusDetailToggle = null;
        hudLinkStatusDot = null;
        hudLinkActionButton = null;
        selectedCategory = id;
        selectedSubpage = null;
        ScrollView page = buildCategoryPage(id);
        trackPageScroll(page, categoryPageScrollKey(id));
        if (wideSettings) {
            updateMenuSelection();
            detailHost.removeAllViews();
            detailHost.addView(page, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } else {
            narrowHost.removeAllViews();
            narrowHost.addView(page, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        if (CAT_UPDATES.equals(id)) fetchMapBuildStatus();
    }

    private String categoryTitle(String id) {
        if (CAT_HUD.equals(id)) return "HUD";
        if (CAT_BUBBLE.equals(id)) return I18n.tr("settings.traffic_bubble");
        if (CAT_FLOAT_SPEEDO.equals(id)) return I18n.tr("settings.home_screen");
        if (CAT_ALERTS.equals(id)) return I18n.tr("settings.alerts_voice");
        if (CAT_GPS.equals(id)) return I18n.tr("settings.gps_calibration");
        if (CAT_AUTO.equals(id)) return "Android Auto";
        if (CAT_DEVICE.equals(id)) return I18n.tr("settings.connect_to_a_device");
        if (CAT_APPS.equals(id)) return I18n.tr("settings.connected_apps");
        if (CAT_XADAS.equals(id)) return I18n.tr("settings.xadas_settings");
        if (CAT_WAZE_CONFIG.equals(id)) return I18n.tr("settings.waze_configuration");
        if (CAT_MAP.equals(id)) return I18n.tr("settings.map_display");
        if (CAT_BLACK_BOX.equals(id)) return I18n.tr("settings.trip_black_box");
        if (CAT_DIAGNOSTICS.equals(id)) return I18n.tr("settings.diagnostics_log_export");
        if (CAT_ABOUT.equals(id)) return I18n.tr("settings.about_support");
        return I18n.tr("settings.updates_data");
    }

    private String categorySubtitle(String id) {
        if (CAT_HUD.equals(id)) return I18n.tr("settings.layout_size_and_windshield_reflection_mode");
        if (CAT_BUBBLE.equals(id)) return I18n.tr("settings.layout_size_and_bubble_state");
        if (CAT_FLOAT_SPEEDO.equals(id)) return I18n.tr("settings.floating_gauge_and_upcoming_alerts");
        if (CAT_ALERTS.equals(id)) return I18n.tr("settings.speed_rules_signs_and_alert_sounds");
        if (CAT_GPS.equals(id)) return I18n.tr("settings.speed_error_compensation_for_the_device");
        if (CAT_AUTO.equals(id)) return I18n.tr("settings.extra_displays_on_the_android_auto");
        if (CAT_DEVICE.equals(id)) return I18n.tr("settings.connect_a_wazemod_hud_over_bluetooth");
        if (CAT_APPS.equals(id)) return I18n.tr("settings.other_apps_allowed_to_read_data");
        if (CAT_XADAS.equals(id)) return I18n.tr("settings.distance_to_the_vehicle_ahead_measured");
        if (CAT_WAZE_CONFIG.equals(id)) return I18n.tr("settings.alert_distances_ads_and_background_running");
        if (CAT_MAP.equals(id)) return I18n.tr("settings.map_position_and_how_it_displays");
        if (CAT_BLACK_BOX.equals(id))
            return I18n.tr("settings.local_history_statistics_and_gpx_to");
        if (CAT_DIAGNOSTICS.equals(id))
            return I18n.tr("settings.package_errors_system_logs_and_network");
        if (CAT_ABOUT.equals(id)) return I18n.tr("settings.version_build_id_and_supporting_the");
        return I18n.tr("settings.mod_version_map_data_and_update");
    }

    private void onCategoryPageBack() {
        if (!wideSettings) showCategoryMenu();
    }

    private ScrollView buildCategoryPage(String id) {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(COLOR_BG);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(18), dp(14), dp(18), dp(28));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        if (!wideSettings) {
            TextView back = new TextView(this);
            back.setText("‹");
            back.setTextSize(38);
            back.setTextColor(COLOR_TEXT);
            back.setGravity(Gravity.CENTER);
            back.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) { onCategoryPageBack(); }
            });
            titleRow.addView(back, new LinearLayout.LayoutParams(dp(42), dp(48)));
        }
        TextView title = new TextView(this);
        title.setText(categoryTitle(id));
        title.setTextSize(22);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        titleRow.addView(title);
        root.addView(titleRow);

        TextView subtitle = new TextView(this);
        subtitle.setText(categorySubtitle(id));
        subtitle.setTextSize(13);
        subtitle.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams subtitleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitleLp.leftMargin = wideSettings ? 0 : dp(42);
        subtitleLp.topMargin = dp(1);
        subtitleLp.bottomMargin = dp(12);
        root.addView(subtitle, subtitleLp);

        if (CAT_HUD.equals(id)) {
            addSection(root, I18n.tr("settings.hud_layout"));
            addChoice(root, I18n.tr("settings.hud_screen_orientation"), "hud_orientation",
                    new int[]{0, 1, 2}, new String[]{I18n.tr("settings.auto"), I18n.tr("settings.landscape"), I18n.tr("settings.portrait")}, 1,
                    new Runnable() {
                        @Override public void run() { openCategory(CAT_HUD); }
                    });
            if (sp.getInt("hud_orientation", 1) == 2) addPortraitGaugePicker(root);
            else addHudLayoutPicker(root);
            addSlider(root, I18n.tr("settings.gauge_size_speed_limit_arrow"),
                    "hud_size", 40, 160, 5, 100, "%", false, null, null);
            addSwitch(root, I18n.tr("settings.mirror_windshield_reflection_by_default"), "mirror", false);
            addOverspeedEffectPicker(root, "hud_overspeed_effect_mode", false);
        } else if (CAT_BUBBLE.equals(id)) {
            addBubbleSettings(root);
        } else if (CAT_FLOAT_SPEEDO.equals(id)) {
            addFloatSpeedoSettings(root);
            addSection(root, I18n.tr("settings.map_shortcuts"));
            addSwitch(root, I18n.tr("settings.show_the_button_to_open_the"),
                    "google_maps_nav_button", false, new BoolCb() {
                        @Override public void on(boolean enabled) {
                            Gateway.refreshGoogleMapsButton();
                        }
                    });
            addOverspeedEffectPicker(root, "map_overspeed_effect_mode", true);
            addSection(root, I18n.tr("settings.upcoming_alert_list"));
            final UpcomingAlertRail[] upcomingPreview = new UpcomingAlertRail[1];
            addSwitch(root, I18n.tr("settings.show_the_speed_and_upcoming_alert"),
                    "upcoming_alerts", true, new BoolCb() {
                        @Override public void on(boolean v) {
                            updateUpcomingAlertPreview(upcomingPreview[0]);
                        }
                    });
            addChoice(root, I18n.tr("settings.upcoming_alert_display_style"), "upcoming_style",
                    new int[]{1, 0}, new String[]{"V2", "V1"}, 1,
                    new Runnable() {
                        @Override public void run() {
                            updateUpcomingAlertPreview(upcomingPreview[0]);
                        }
                    });
            upcomingPreview[0] = addUpcomingAlertPreview(root);
            addChoice(root, I18n.tr("settings.number_of_alerts_shown"), "upcoming_count",
                    new int[]{1, 2, 3}, new String[]{I18n.tr("settings.1_item"), I18n.tr("settings.2_items"), I18n.tr("settings.3_items")}, 3,
                    new Runnable() {
                        @Override public void run() {
                            updateUpcomingAlertPreview(upcomingPreview[0]);
                        }
                    });
            addSlider(root, I18n.tr("settings.alert_list_size"), "upcoming_size", 70, 160, 10, 100,
                    "%", false, null, new Runnable() {
                        @Override public void run() {
                            updateUpcomingAlertPreview(upcomingPreview[0]);
                        }
                    });
            addSlider(root, I18n.tr("settings.icon_size_in_the_list_v2"), "upcoming_icon_size",
                    70, 160, 10, 100, "%", false, null, new Runnable() {
                        @Override public void run() {
                            updateUpcomingAlertPreview(upcomingPreview[0]);
                        }
                    });
        } else if (CAT_ALERTS.equals(id)) {
            addSection(root, I18n.tr("settings.speed_alerts"));
            addChoice(root, I18n.tr("settings.over_speed_threshold"), "over_margin",
                    OVER_MARGIN_VALUES, OVER_MARGIN_LABELS, 0);
            addChoice(root, I18n.tr("settings.repeat_the_over_speed_alert"), "over_repeat_mode",
                    new int[]{0, 2, 1},
                    new String[]{I18n.tr("settings.remind_once"), I18n.tr("settings.remind_twice"), I18n.tr("settings.repeat_continuously")}, 1);
            addSwitch(root, I18n.tr("settings.mute_button_for_the_over_speed"),
                    "overspeed_mute_button", true);

            addSection(root, I18n.tr("settings.speed_signs"));
            if (Region.inVietnam()) addSwitch(root, I18n.tr("settings.motorcycle_limit"), "moto_cap", true);
            addLimitSignStyleChoice(root);
            if (Region.inVietnam()) addSwitch(root, I18n.tr("settings.show_the_minimum_speed_sign_on"),
                    "minimum_speed", false, new BoolCb() {
                        @Override public void on(boolean v) {
                            Gateway.onMinimumSpeedSettingChanged(v);
                        }
                    });
            addSwitch(root, I18n.tr("settings.recommended_following_distance_sign_on_2"),
                    "expressway_following_distance", false, new BoolCb() {
                        @Override public void on(boolean enabled) {
                            Gateway.onFollowingDistanceSettingChanged(enabled);
                        }
                    });

            addSection(root, I18n.tr("settings.speed_changes_ahead"));
            addChoice(root, I18n.tr("settings.speed_change_ahead_alert"), "speed_drop_read_mode",
                    new int[]{0, 1}, new String[]{I18n.tr("settings.default_only_when_speed_the_new"), I18n.tr("settings.always_show")}, 1,
                    new Runnable() {
                        @Override public void run() {
                            android.widget.Toast.makeText(ModSettingsActivity.this,
                                    I18n.tr("settings.applies_after_restarting_waze"),
                                    android.widget.Toast.LENGTH_SHORT).show();
                        }
                    });
            addChoice(root, I18n.tr("settings.minimum_speed_drop_for_the_alert"), "sld_threshold_kph",
                    new int[]{10, 15, 20, 25, 30, 35},
                    new String[]{"10 km/h", "15 km/h", "20 km/h", "25 km/h", "30 km/h", "35 km/h"}, WazeFeatureOverrides.SLD_DEFAULT_THRESHOLD_KPH,
                    new Runnable() {
                        @Override public void run() { WazeFeatureOverrides.refresh(); }
                    });
            addAudioSettings(root);
        } else if (CAT_GPS.equals(id)) {
            addGpsSettings(root);
        } else if (CAT_AUTO.equals(id)) {
            addSection(root, I18n.tr("settings.android_auto_connection"));
            addAaConnectionSettings(root);
            addSection(root, I18n.tr("settings.android_auto_speedometer"));
            addSwitch(root, I18n.tr("settings.speedometer_on_android_auto"),
                    "aa_float_speedo", false);
            addAaSpeedoLayoutPicker(root);
            addAaSpeedoPositionChoice(root);
            addSlider(root, I18n.tr("settings.android_auto_gauge_size"), "aa_fs_size", 60, 180, 10, 100,
                    "%", false, null, null);
            addSwitch(root, I18n.tr("settings.bold_the_maximum_minimum_speed_number"),
                    "aa_speed_sign_bold", true);
            addSection(root, I18n.tr("settings.upcoming_alert_list"));
            addAaAlertRailSettings(root);
            addSection(root, I18n.tr("settings.android_auto_over_speed"));
            addAaOverspeedEdgeSetting(root);
        } else if (CAT_DEVICE.equals(id)) {
            addHudLinkTabs(root);
            if (hudLinkUiTab() == HUD_LINK_TAB_VIETMAP) addVietMapHudSettings(root);
            else if (hudLinkUiTab() == HUD_LINK_TAB_USB) addHudUsbSettings(root);
            else addHlpLinkSettings(root, hudLinkUiTab() == HUD_LINK_TAB_WIFI);
        } else if (CAT_APPS.equals(id)) {
            addConnectedAppsSettings(root);
        } else if (CAT_XADAS.equals(id)) {
            addXadasSettings(root);
        } else if (CAT_WAZE_CONFIG.equals(id)) {
            addWazeConfigSettings(root);
        } else if (CAT_MAP.equals(id)) {
            addSection(root, I18n.tr("settings.theme_color"));
            addAmbientColorChoice(root);
            addSection(root, I18n.tr("settings.map"));
            addSwitch(root, I18n.tr("settings.show_the_wazemod_quick_report"), "mod_reports_enabled", true);
            addSwitch(root, I18n.tr("settings.center_the_map_in_landscape"), "center_landscape_map", true);
            addSwitch(root, I18n.tr("settings.show_wme_data_signs_on_the"),
                    "map_point_notices", false);
            addSlider(root, I18n.tr("settings.sign_icon_size_on_the_map"),
                    PointNoticeMapBridge.PREF_ICON_SIZE, 24, 200, 2,
                    PointNoticeMapBridge.DEFAULT_ICON_PX, " px", false, null,
                    new Runnable() {
                        @Override public void run() {
                            PointNoticeMapBridge.refreshIconSize(ModSettingsActivity.this);
                        }
                    });
            addSwitch(root, I18n.tr("settings.show_wazes_original_speedometer"),
                    "native_speedo_visible", true, new BoolCb() {
                        @Override public void on(boolean visible) {
                            Gateway.refreshNativeSpeedoVisibility();
                        }
                    });
            addSwitch(root, I18n.tr("settings.use_the_accent_color_for_the"),
                    "float_speed_current_ambient", false, new BoolCb() {
                        @Override public void on(boolean enabled) {
                            Gateway.refreshNativeSpeedoTextColor();
                        }
                    });
            addSwitch(root, I18n.tr("settings.wazes_original_gauge_large_limit_sign"),
                    "native_speedo_swap", false, new BoolCb() {
                        @Override public void on(boolean enabled) {
                            Gateway.refreshNativeSpeedoRoles();
                        }
                    });
            final NativeSpeedoPreview nativeSpeedoPreview = addNativeSpeedoPreview(root);
            addSlider(root, I18n.tr("settings.size_of_wazes_original_speedometer"), "native_speedo_size",
                    100, 200, 5, 100, "%", false,
                    I18n.tr("settings.only_changes_wazes_default_round_gauge"),
                    new Runnable() {
                        @Override public void run() {
                            nativeSpeedoPreview.setSizePercent(
                                    sp.getInt("native_speedo_size", 100));
                            Gateway.refreshNativeSpeedoSize();
                        }
                    });
            addSlider(root, I18n.tr("settings.size_of_wazes_original_alert_panel"),
                    "phone_alert_banner_size", 60, 100, 1, 100, "%", false,
                    I18n.tr("settings.experimental_scales_down_the_panel_text"), null);
            final NavBannerPreview navPreview = addNavBannerPreview(root);
            addSlider(root, I18n.tr("settings.guidance_panel_background_opacity"), "nav_banner_opacity",
                    40, 100, 1, 78, "%", false,
                    I18n.tr("settings.100_is_the_original_black_background"),
                    new Runnable() {
                        @Override public void run() {
                            navPreview.syncFromPreferences();
                            Gateway.refreshNavBarOpacity();
                        }
                    });
            addSlider(root, I18n.tr("settings.guidance_panel_size"), "nav_banner_size",
                    50, 100, 5, 100, "%", false,
                    I18n.tr("settings.scales_down_the_arrow_distance_shield"),
                    new Runnable() {
                        @Override public void run() {
                            navPreview.syncFromPreferences();
                            Gateway.refreshNavBarAppearance();
                        }
                    });
            addSlider(root, I18n.tr("settings.street_name_text_size_on_the"), "nav_street_text_size",
                    100, 150, 5, 100, "%", false,
                    I18n.tr("settings.only_enlarges_the_street_name_text"),
                    new Runnable() {
                        @Override public void run() {
                            navPreview.syncFromPreferences();
                            Gateway.refreshNavBarAppearance();
                        }
                    });
            addServerDisabledFeatureSwitches(root);
        } else if (CAT_UPDATES.equals(id)) {
            addMapBuildStatus(root);
            addSection(root, I18n.tr("settings.settings_backup"));
            addSettingsTransferAction(root, I18n.tr("settings.export_mod_settings"),
                    I18n.tr("settings.save_the_user_configuration_as_a"), true);
            addSettingsTransferAction(root, I18n.tr("settings.import_mod_settings"),
                    I18n.tr("settings.restore_the_configuration_from_a_wazemod"), false);
            addSection(root, I18n.tr("settings.mod_language"));
            addInfoCard(root, I18n.tr("settings.interface_language"), uiLanguageLabel());
            addInfoCard(root, I18n.tr("settings.voice_language"), voiceLanguageLabel());
            addFileAction(root, I18n.tr("settings.load_a_language_file"),
                    I18n.tr("settings.add_or_update_a_translation_from"), false, new Runnable() {
                        @Override public void run() { beginLanguageImport(); }
                    });
            addFileAction(root, I18n.tr("settings.export_a_template_file"),
                    I18n.tr("settings.save_the_english_pack_as_a"), true, new Runnable() {
                        @Override public void run() { beginLanguageTemplateExport(); }
                    });
        } else if (CAT_BLACK_BOX.equals(id)) {
            addTripBlackBoxSettings(root);
        } else if (CAT_DIAGNOSTICS.equals(id)) {
            addDiagnosticsSettings(root);
        } else if (CAT_ABOUT.equals(id)) {
            addAboutSettings(root);
        }
        return scroll;
    }

    // ---- About: build metadata, and the donation QR for users in Vietnam ----
    private static final String DONATE_BANK = "BIDV";
    private static final String DONATE_HOLDER = "TRAN THANH NAM";
    private static final String DONATE_ACCOUNT = "8869307433";

    private void addAboutSettings(LinearLayout root) {
        addSection(root, I18n.tr("settings.about_this_mod"));
        String channel = "reimei".equals(ModBuildInfo.channel(this)) ? I18n.tr("settings.reimei_experimental") : "Stable";
        addInfoCard(root, I18n.tr("settings.waze_mod_version"), I18n.f("settings.0_1_channel", ModBuildInfo.versionLabel(this), channel));
        addInfoCard(root, I18n.tr("settings.build"), I18n.f("settings.commit_0_built_at_1_ota", ModBuildInfo.commit(this), ModBuildInfo.builtAt(this), ModBuildInfo.otaBuildId(this)));
        String wazeVersion = I18n.tr("settings.unknown");
        try {
            wazeVersion = getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
        } catch (Throwable ignored) { }
        addInfoCard(root, I18n.tr("settings.original_waze"), I18n.f("settings.version_0_app_package_1", wazeVersion, getPackageName()));

        if (Region.inVietnam()) {
            addSection(root, I18n.tr("settings.support_the_author"));
            addInfoCard(root, I18n.tr("settings.buy_the_author_a_coffee"),
                    I18n.tr("settings.the_project_is_made_in_spare"));
            addAboutAction(root, I18n.tr("settings.support_via_qr_code"), I18n.tr("settings.scan_with_any_banking_app"), new Runnable() {
                @Override public void run() { showDonateDialog(); }
            });
        }
    }

    private void addAboutAction(LinearLayout root, String title, String detail, final Runnable onClick) {
        LinearLayout action = new LinearLayout(this);
        action.setOrientation(LinearLayout.HORIZONTAL);
        action.setGravity(Gravity.CENTER_VERTICAL);
        action.setPadding(dp(15), dp(13), dp(13), dp(13));
        styleControlHover(action, false);
        enableControlHover(action);
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextSize(17);
        heading.setTextColor(COLOR_TEXT);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        labels.addView(heading);
        TextView description = new TextView(this);
        description.setText(detail);
        description.setTextSize(13);
        description.setTextColor(COLOR_MUTED);
        description.setPadding(0, dp(3), 0, 0);
        labels.addView(description);
        action.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView arrow = new TextView(this);
        arrow.setText("›");
        arrow.setTextSize(25);
        arrow.setTextColor(COLOR_ACCENT);
        arrow.setGravity(Gravity.CENTER);
        action.addView(arrow, new LinearLayout.LayoutParams(dp(42), dp(46)));
        action.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { onClick.run(); }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(action, lp);
    }

    /** QR (bundled asset) plus the bank details, with a button to copy the account number. */
    private void showDonateDialog() {
        LinearLayout body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setGravity(Gravity.CENTER_HORIZONTAL);
        body.setPadding(dp(18), dp(14), dp(18), dp(6));

        android.widget.ImageView qr = new android.widget.ImageView(this);
        qr.setAdjustViewBounds(true);
        qr.setBackgroundColor(0xFFFFFFFF);   // the QR artwork has a white background; keep it scannable in dark mode
        java.io.InputStream in = null;
        try {
            in = getAssets().open("donate/donate_qr.png");
            qr.setImageBitmap(BitmapFactory.decodeStream(in));
        } catch (Throwable ignore) {
        } finally {
            if (in != null) try { in.close(); } catch (Throwable ignore) { }
        }
        body.addView(qr, new LinearLayout.LayoutParams(dp(250), ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView info = new TextView(this);
        info.setText(I18n.f("settings.bank_0_account_holder_1_account", DONATE_BANK, DONATE_HOLDER, DONATE_ACCOUNT));
        info.setTextSize(15);
        info.setTextColor(COLOR_TEXT);
        info.setPadding(0, dp(12), 0, 0);
        body.addView(info);
        TextView note = new TextView(this);
        note.setText(I18n.tr("settings.support_is_entirely_voluntary_and_is"));
        note.setTextSize(12);
        note.setTextColor(COLOR_MUTED);
        note.setPadding(0, dp(8), 0, 0);
        body.addView(note);

        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setTitle(I18n.tr("settings.support_the_author"));
        builder.setView(body);
        builder.setPositiveButton(I18n.tr("settings.copy_account_number"), new android.content.DialogInterface.OnClickListener() {
            @Override public void onClick(android.content.DialogInterface dialog, int which) {
                try {
                    android.content.ClipboardManager clipboard =
                            (android.content.ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
                    clipboard.setPrimaryClip(android.content.ClipData.newPlainText(I18n.tr("settings.account_number"), DONATE_ACCOUNT));
                    android.widget.Toast.makeText(ModSettingsActivity.this, I18n.tr("settings.account_number_copied"),
                            android.widget.Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) { }
            }
        });
        builder.setNegativeButton(I18n.tr("report.close"), null);
        builder.show();
    }

    private void addTripBlackBoxSettings(LinearLayout root) {
        addSection(root, I18n.tr("settings.trip_recording"));
        addSwitch(root, I18n.tr("settings.save_the_trip_black_box"), TripBlackBox.PREF_ENABLED, true,
                new BoolCb() {
                    @Override public void on(boolean enabled) {
                        TripBlackBox.onEnabledChanged(ModSettingsActivity.this, enabled);
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                enabled ? I18n.tr("settings.new_trip_recording_turned_on")
                                        : I18n.tr("settings.recording_stopped_old_history_is_kept"),
                                android.widget.Toast.LENGTH_SHORT).show();
                    }
                });
        addInfoCard(root, I18n.tr("settings.stored_locally_up_to_10_trips"),
                I18n.tr("settings.the_data_stays_only_in_waze"));
        addInfoCard(root, I18n.tr("settings.black_box_data"),
                I18n.tr("settings.each_trip_includes_the_distance_duration"));

        addSection(root, I18n.tr("settings.last_10_trips"));
        java.util.List<TripBlackBox.TripSummary> trips = TripBlackBox.listTrips(this);
        if (trips.isEmpty()) {
            addInfoCard(root, I18n.tr("settings.no_trips_yet"),
                    I18n.tr("settings.the_black_box_starts_a_trip"));
            return;
        }
        for (int i = 0; i < trips.size(); i++) {
            addTripSummaryCard(root, trips.get(i), i + 1);
        }
    }

    private void addTripSummaryCard(LinearLayout root,
                                    final TripBlackBox.TripSummary trip, int index) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_CONTROL);
        background.setCornerRadius(dp(16));
        background.setStroke(dp(1), trip.active ? COLOR_ACCENT : COLOR_BORDER);
        card.setBackground(background);
        enableLiftHover(card);

        LinearLayout heading = new LinearLayout(this);
        heading.setOrientation(LinearLayout.HORIZONTAL);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = new TextView(this);
        title.setText("#" + index + " · " + tripDateLabel(trip.startMs));
        title.setTextSize(17);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        heading.addView(title, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (trip.active) {
            TextView badge = new TextView(this);
            badge.setText(I18n.tr("settings.recording"));
            badge.setTextSize(11);
            badge.setTextColor(0xFFFFFFFF);
            badge.setTypeface(Typeface.DEFAULT_BOLD);
            badge.setGravity(Gravity.CENTER);
            badge.setPadding(dp(10), dp(5), dp(10), dp(5));
            GradientDrawable badgeBg = new GradientDrawable();
            badgeBg.setColor(COLOR_ACCENT);
            badgeBg.setCornerRadius(dp(20));
            badge.setBackground(badgeBg);
            heading.addView(badge);
        }
        card.addView(heading);

        TextView primary = new TextView(this);
        primary.setText(String.format(java.util.Locale.getDefault(),
                "%.1f km  ·  %s", trip.distanceM / 1000.0,
                tripDurationLabel(trip.startMs, trip.endMs)));
        primary.setTextSize(18);
        primary.setTextColor(COLOR_TEXT);
        primary.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams primaryLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        primaryLp.topMargin = dp(10);
        card.addView(primary, primaryLp);

        TextView stats = new TextView(this);
        stats.setText(String.format(java.util.Locale.getDefault(),
                I18n.tr("settings.average_0f_km_h_top_d"),
                trip.averageSpeedKmh, trip.maxSpeedKmh,
                trip.overspeedCount, trip.pointCount));
        stats.setTextSize(14);
        stats.setTextColor(COLOR_MUTED);
        stats.setLineSpacing(dp(3), 1f);
        LinearLayout.LayoutParams statsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        statsLp.topMargin = dp(5);
        card.addView(stats, statsLp);

        TextView export = new TextView(this);
        export.setText(I18n.tr("settings.export_gpx_with_speed"));
        export.setTextSize(15);
        export.setTextColor(COLOR_ACCENT);
        export.setTypeface(Typeface.DEFAULT_BOLD);
        export.setGravity(Gravity.CENTER);
        GradientDrawable exportBg = new GradientDrawable();
        exportBg.setColor(COLOR_PANEL);
        exportBg.setCornerRadius(dp(13));
        exportBg.setStroke(dp(1), COLOR_ACCENT);
        export.setBackground(exportBg);
        export.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { showTripExportWarning(trip); }
        });
        LinearLayout.LayoutParams exportLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(48));
        exportLp.topMargin = dp(12);
        card.addView(export, exportLp);

        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(9);
        root.addView(card, cardLp);
    }

    private void showTripExportWarning(final TripBlackBox.TripSummary trip) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.share_the_trip_black_box"),
                I18n.tr("settings.the_gpx_contains_coordinates_over_time"));

        TextView warning = new TextView(this);
        warning.setText(I18n.f("settings.you_are_about_to_share_movement", tripDateLabel(trip.startMs), String.format(java.util.Locale.getDefault(), "%.1f km", trip.distanceM / 1000.0)));
        warning.setTextColor(0xFFFF8A8A);
        warning.setTextSize(15);
        warning.setLineSpacing(dp(4), 1f);
        warning.setPadding(dp(5), dp(2), dp(5), dp(16));
        sheet.addView(warning, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        TextView cancel = tripExportButton(I18n.tr("report.cancel"), COLOR_TEXT, COLOR_CONTROL, COLOR_BORDER);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { dialog.dismiss(); }
        });
        TextView confirm = tripExportButton(I18n.tr("settings.i_understand_export_gpx"),
                0xFFFFFFFF, 0xFFD32F2F, 0xFFFF6B6B);
        confirm.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                dialog.dismiss();
                beginTripGpxExport(trip);
            }
        });
        actions.addView(cancel, new LinearLayout.LayoutParams(0, dp(54), 1f));
        LinearLayout.LayoutParams confirmLp = new LinearLayout.LayoutParams(0, dp(54), 1f);
        confirmLp.leftMargin = dp(10);
        actions.addView(confirm, confirmLp);
        sheet.addView(actions);
        showBottomSheet(dialog, sheet, dp(620));
    }

    private TextView tripExportButton(String text, int textColor, int fillColor, int strokeColor) {
        TextView button = new TextView(this);
        button.setText(text);
        button.setTextSize(15);
        button.setTextColor(textColor);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setGravity(Gravity.CENTER);
        GradientDrawable background = new GradientDrawable();
        background.setColor(fillColor);
        background.setCornerRadius(dp(14));
        background.setStroke(dp(1), strokeColor);
        button.setBackground(background);
        return button;
    }

    private void beginTripGpxExport(TripBlackBox.TripSummary trip) {
        pendingTripExportId = trip.id;
        sp.edit().putLong("pending_trip_export_id", trip.id).apply();
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/gpx+xml");
        String stamp = new java.text.SimpleDateFormat(
                "yyyyMMdd_HHmmss", java.util.Locale.US).format(new java.util.Date(trip.startMs));
        intent.putExtra(Intent.EXTRA_TITLE, "WazeMod_trip_" + stamp + ".gpx");
        try {
            startActivityForResult(intent, REQUEST_EXPORT_TRIP_GPX);
        } catch (Throwable error) {
            pendingTripExportId = -1L;
            sp.edit().remove("pending_trip_export_id").apply();
            android.widget.Toast.makeText(this, I18n.tr("settings.this_device_has_no_file_save"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
    }

    private String tripDateLabel(long timeMs) {
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(
                "HH:mm, dd/MM/yyyy", java.util.Locale.getDefault());
        format.setTimeZone(java.util.TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        return format.format(new java.util.Date(timeMs));
    }

    private String tripDurationLabel(long startMs, long endMs) {
        long totalMinutes = Math.max(0L, endMs - startMs) / 60000L;
        long hours = totalMinutes / 60L;
        long minutes = totalMinutes % 60L;
        if (hours > 0L) return I18n.f("core.0_hours_1_minutes", hours, minutes);
        return I18n.f("core.0_minutes", Math.max(1L, minutes));
    }

    private void addDiagnosticsSettings(LinearLayout root) {
        addSection(root, I18n.tr("settings.logging_status"));
        addInfoCard(root, "Logger Waze Mod", DiagnosticsLogger.summary(this));
        addInfoCard(root, I18n.tr("settings.privacy"),
                I18n.tr("settings.request_response_content_queries_cookies"));

        addSection(root, I18n.tr("settings.choose_the_report_to_export"));
        addDiagnosticsAction(root, I18n.tr("settings.export_errors"),
                I18n.tr("settings.java_crashes_and_native_crash_anr"),
                DiagnosticsLogger.EXPORT_ERRORS);
        addDiagnosticsAction(root, I18n.tr("settings.export_logcat"),
                I18n.tr("settings.log_of_the_waze_mod_process"),
                DiagnosticsLogger.EXPORT_LOGCAT);
        addDiagnosticsAction(root, I18n.tr("settings.export_network_log"),
                I18n.tr("settings.connections_endpoints_with_queries_removed"),
                DiagnosticsLogger.EXPORT_NETWORK);
        addDiagnosticsAction(root, I18n.tr("settings.export_all_recommended"),
                I18n.tr("settings.errors_logcat_network_file_activity_and"),
                DiagnosticsLogger.EXPORT_ALL);
    }

    private void addDiagnosticsAction(LinearLayout root, String title, String detail,
                                      final int exportType) {
        LinearLayout action = new LinearLayout(this);
        action.setOrientation(LinearLayout.HORIZONTAL);
        action.setGravity(Gravity.CENTER_VERTICAL);
        action.setPadding(dp(15), dp(13), dp(13), dp(13));
        styleControlHover(action, false);
        enableControlHover(action);

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextSize(17);
        heading.setTextColor(COLOR_TEXT);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        labels.addView(heading);
        TextView description = new TextView(this);
        description.setText(detail);
        description.setTextSize(13);
        description.setTextColor(COLOR_MUTED);
        description.setPadding(0, dp(3), 0, 0);
        labels.addView(description);
        action.addView(labels, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView arrow = new TextView(this);
        arrow.setText("⇩");
        arrow.setTextSize(25);
        arrow.setTextColor(COLOR_ACCENT);
        arrow.setGravity(Gravity.CENTER);
        action.addView(arrow, new LinearLayout.LayoutParams(dp(42), dp(46)));
        action.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { beginDiagnosticsExport(exportType); }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(action, lp);
    }

    private void beginDiagnosticsExport(int exportType) {
        pendingDiagnosticsExport = exportType;
        String label = exportType == DiagnosticsLogger.EXPORT_ERRORS ? "errors"
                : exportType == DiagnosticsLogger.EXPORT_LOGCAT ? "logcat"
                : exportType == DiagnosticsLogger.EXPORT_NETWORK ? "network" : "all";
        String timestamp = new java.text.SimpleDateFormat(
                "yyyyMMdd_HHmmss", java.util.Locale.US).format(new java.util.Date());
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/zip");
        intent.putExtra(Intent.EXTRA_TITLE,
                "WazeMod_" + label + "_" + timestamp + ".zip");
        try {
            startActivityForResult(intent, REQUEST_EXPORT_DIAGNOSTICS);
        } catch (Throwable error) {
            android.widget.Toast.makeText(this,
                    I18n.tr("settings.this_device_has_no_file_save"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
    }

    private void addSettingsTransferAction(LinearLayout root, String title, String detail,
                                           final boolean export) {
        addFileAction(root, title, detail, export, new Runnable() {
            @Override public void run() {
                if (export) beginModSettingsExport();
                else beginModSettingsImport();
            }
        });
    }

    /** A card with an import (down arrow) or export (up arrow) file action. */
    private void addFileAction(LinearLayout root, String title, String detail, boolean export,
                               final Runnable onClick) {
        LinearLayout action = new LinearLayout(this);
        action.setOrientation(LinearLayout.HORIZONTAL);
        action.setGravity(Gravity.CENTER_VERTICAL);
        action.setPadding(dp(15), dp(13), dp(13), dp(13));
        styleControlHover(action, false);
        enableControlHover(action);

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextSize(16);
        titleView.setTextColor(COLOR_TEXT);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        labels.addView(titleView);
        TextView detailView = new TextView(this);
        detailView.setText(detail);
        detailView.setTextSize(12);
        detailView.setTextColor(COLOR_MUTED);
        labels.addView(detailView);
        action.addView(labels, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView arrow = new TextView(this);
        arrow.setText(export ? "⇧" : "⇩");
        arrow.setTextSize(24);
        arrow.setTextColor(COLOR_ACCENT);
        arrow.setGravity(Gravity.CENTER);
        action.addView(arrow, new LinearLayout.LayoutParams(dp(42), dp(46)));
        action.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { onClick.run(); }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(action, lp);
    }

    // ---- Mod language: what is in use, a user-supplied language file, and a template to translate ----

    /** The language's own name for a tag: vi, en, ja, pt-BR, or whatever the platform knows. */
    private static String languageName(String tag) {
        // i18n:skip - a language is always shown under its own name
        if ("vi".equals(tag)) return "Tiếng Việt";
        if ("en".equals(tag)) return "English";
        if ("ja".equals(tag)) return "日本語";
        if ("pt-BR".equals(tag)) return "Português (Brasil)"; // i18n:skip
        java.util.Locale locale = java.util.Locale.forLanguageTag(tag);
        String name = locale.getDisplayName(locale);
        return name == null || name.length() == 0 ? tag : name;
    }

    private String uiLanguageLabel() {
        String used = I18n.uiTag();
        String waze = I18n.wazeLanguageTag();
        if (waze == null || I18n.hasTranslation(waze)) return languageName(used);
        return I18n.f("settings.0_no_translation_yet_using_1", languageName(waze), languageName(used));
    }

    /** Round or square (US) speed-limit sign on the Mod's speedometers; by default it follows Waze. */
    private void addLimitSignStyleChoice(LinearLayout root) {
        addChoice(root, I18n.tr("settings.speed_limit_sign_style"), LimitSign.PREF,
                new int[]{LimitSign.FOLLOW_WAZE, LimitSign.ROUND, LimitSign.SQUARE},
                new String[]{I18n.tr("settings.follow_waze"), I18n.tr("settings.round_sign"),
                        I18n.tr("settings.square_sign_us")}, LimitSign.FOLLOW_WAZE);
    }

    /** Warns (card at the top of the sound settings) that a recorded Waze voice makes every Mod prompt silent. */
    private void addRecordedVoiceWarning(LinearLayout root) {
        if (I18n.voiceCanSpeak()) return;
        addInfoCard(root, I18n.tr("settings.recorded_voice_selected"),
                I18n.tr("settings.recorded_voices_cant_read_street_names"));
    }

    private String voiceLanguageLabel() {
        if (!I18n.voiceCanSpeak()) return I18n.tr("settings.recorded_voice_mod_is_silent");
        String voice = I18n.voiceTag();
        if (voice == null) return I18n.tr("settings.unknown");
        if (I18n.hasTranslation(voice)) return languageName(voice);
        return I18n.f("settings.0_no_translation_yet_the_mod", languageName(voice));
    }

    private void beginLanguageImport() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_MIME_TYPES,
                new String[]{"application/json", "text/json", "text/plain", "application/octet-stream"});
        try {
            startActivityForResult(intent, REQUEST_IMPORT_LANGUAGE_PACK);
        } catch (Throwable error) {
            android.widget.Toast.makeText(this, I18n.tr("settings.this_device_has_no_file_picker"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
    }

    private void beginLanguageTemplateExport() {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_TITLE, "WazeMod_language_template.json");
        try {
            startActivityForResult(intent, REQUEST_EXPORT_LANGUAGE_TEMPLATE);
        } catch (Throwable error) {
            android.widget.Toast.makeText(this, I18n.tr("settings.this_device_has_no_file_save"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
    }

    private void importLanguagePack(final android.net.Uri source) {
        new Thread(new Runnable() {
            @Override public void run() {
                String problem;
                try {
                    problem = I18n.importPack(ModSettingsActivity.this,
                            getContentResolver().openInputStream(source));
                } catch (Throwable error) {
                    problem = "core.invalid_file";
                }
                final String reason = problem;
                runOnUiThread(new Runnable() {
                    @Override public void run() {
                        if (isFinishing()) return;
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                reason == null ? I18n.tr("settings.language_file_loaded_reopen_the_screen")
                                        : I18n.f("settings.couldnt_load_the_language_file_0", I18n.tr(reason)),
                                android.widget.Toast.LENGTH_LONG).show();
                    }
                });
            }
        }, "WazeMod-LanguageImport").start();
    }

    private void exportLanguageTemplate(final android.net.Uri target) {
        new Thread(new Runnable() {
            @Override public void run() {
                boolean ok;
                try {
                    java.io.OutputStream out = getContentResolver().openOutputStream(target);
                    try { ok = out != null && I18n.exportTemplate(ModSettingsActivity.this, out); }
                    finally { if (out != null) out.close(); }
                } catch (Throwable error) {
                    ok = false;
                }
                final boolean done = ok;
                runOnUiThread(new Runnable() {
                    @Override public void run() {
                        if (isFinishing()) return;
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                done ? I18n.tr("settings.template_file_exported") : I18n.tr("settings.couldnt_export_the_template_file"),
                                android.widget.Toast.LENGTH_LONG).show();
                    }
                });
            }
        }, "WazeMod-LanguageTemplate").start();
    }

    private void beginModSettingsExport() {
        String timestamp = new java.text.SimpleDateFormat(
                "yyyyMMdd_HHmmss", java.util.Locale.US).format(new java.util.Date());
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_TITLE, "WazeMod_settings_" + timestamp + ".json");
        try {
            startActivityForResult(intent, REQUEST_EXPORT_MOD_SETTINGS);
        } catch (Throwable error) {
            android.widget.Toast.makeText(this, I18n.tr("settings.this_device_has_no_file_save"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
    }

    private void beginModSettingsImport() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_MIME_TYPES,
                new String[]{"application/json", "text/json", "text/plain", "application/octet-stream"});
        try {
            startActivityForResult(intent, REQUEST_IMPORT_MOD_SETTINGS);
        } catch (Throwable error) {
            android.widget.Toast.makeText(this, I18n.tr("settings.this_device_has_no_file_picker"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
    }

    private void showSettingsImportConfirmation(final android.net.Uri source) {
        new android.app.AlertDialog.Builder(this)
                .setTitle(I18n.tr("settings.import_mod_settings_2"))
                .setMessage(I18n.tr("settings.the_current_configuration_will_be_replaced"))
                .setNegativeButton(I18n.tr("hud_link.cancel"), null)
                .setPositiveButton(I18n.tr("settings.import"), new android.content.DialogInterface.OnClickListener() {
                    @Override public void onClick(android.content.DialogInterface dialog, int which) {
                        importModSettings(source);
                    }
                }).show();
    }

    private void importModSettings(final android.net.Uri source) {
        android.widget.Toast.makeText(this, I18n.tr("settings.checking_the_settings_file"),
                android.widget.Toast.LENGTH_SHORT).show();
        new Thread(new Runnable() {
            @Override public void run() {
                final int count = ModSettingsTransfer.importFromUri(
                        ModSettingsActivity.this, sp, source);
                runOnUiThread(new Runnable() {
                    @Override public void run() {
                        if (isFinishing()) return;
                        if (count < 0) {
                            android.widget.Toast.makeText(ModSettingsActivity.this,
                                    I18n.tr("settings.the_settings_file_is_invalid_or"),
                                    android.widget.Toast.LENGTH_LONG).show();
                            return;
                        }
                        COLOR_ACCENT = AmbientTheme.color(sp);
                        Gateway.refreshAmbientTheme();
                        Gateway.refreshNativeSpeedoVisibility();
                        Gateway.refreshNativeSpeedoSize();
                        Gateway.refreshNavBarAppearance();
                        Gateway.onMapOverspeedSettingChanged();
                        Bubble.refresh();
                        BubbleKeepAliveService.sync(ModSettingsActivity.this);
                        HudLinkService.reconfigure(ModSettingsActivity.this);
                        PointNoticeMapBridge.refreshIconSize(ModSettingsActivity.this);
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                I18n.f("settings.imported_0_settings_restart_waze_to", count),
                                android.widget.Toast.LENGTH_LONG).show();
                        openCategory(CAT_UPDATES);
                    }
                });
            }
        }, "WazeMod-SettingsImport").start();
    }

    private int hudLinkUiTab() {
        int tab = sp.getInt(PREF_HUD_LINK_UI_TAB, HUD_LINK_TAB_HLP);
        if (tab == HUD_LINK_TAB_WIFI) return HUD_LINK_TAB_WIFI;
        if (tab == HUD_LINK_TAB_USB) return HUD_LINK_TAB_USB;
        if (tab == HUD_LINK_TAB_VIETMAP && HudFeatureFlags.vietMapTabVisible())
            return HUD_LINK_TAB_VIETMAP;
        return HUD_LINK_TAB_HLP;
    }

    /** Third-party apps allowed to read the Data API, each with a revoke action. */
    private void addConnectedAppsSettings(LinearLayout root) {
        java.util.List<String> apps = DataApiGrants.packages(this);
        if (apps.isEmpty()) {
            addInfoCard(root, I18n.tr("settings.no_apps_yet"),
                    I18n.tr("settings.other_apps_can_ask_permission_to"));
            return;
        }
        android.content.pm.PackageManager pm = getPackageManager();
        for (final String pkg : apps) {
            CharSequence label = pkg;
            try { label = pm.getApplicationLabel(pm.getApplicationInfo(pkg, 0)); }
            catch (Throwable ignored) { }
            LinearLayout r = row(root, label.toString());
            TextView revoke = rowValue(I18n.tr("settings.revoke"));
            revoke.setClickable(true);
            revoke.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    WazeModDataService.revoke(ModSettingsActivity.this, pkg);
                    openCategory(CAT_APPS);
                }
            });
            r.addView(revoke, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
    }

    private void addHudLinkTabs(LinearLayout root) {
        final int selected = hudLinkUiTab();
        LinearLayout tabs = new LinearLayout(this);
        tabs.setOrientation(LinearLayout.VERTICAL);
        tabs.setPadding(dp(4), dp(4), dp(4), dp(4));
        GradientDrawable tabsBg = new GradientDrawable();
        tabsBg.setShape(GradientDrawable.RECTANGLE);
        tabsBg.setColor(COLOR_PANEL);
        tabsBg.setCornerRadius(dp(17));
        tabsBg.setStroke(dp(1), COLOR_BORDER);
        tabs.setBackground(tabsBg);

        tabs.addView(hudLinkTab("HUD WazeMod", HUD_LINK_TAB_HLP,
                selected == HUD_LINK_TAB_HLP), hudLinkTabLayout(false));
        if (HudFeatureFlags.vietMapTabVisible()) {
            tabs.addView(hudLinkTab("HUD VietMap", HUD_LINK_TAB_VIETMAP,
                    selected == HUD_LINK_TAB_VIETMAP), hudLinkTabLayout(true));
        }
        tabs.addView(hudLinkTab("HUD WazeMod (Wi-Fi)", HUD_LINK_TAB_WIFI,
                selected == HUD_LINK_TAB_WIFI), hudLinkTabLayout(true));
        tabs.addView(hudLinkTab("HUD WazeMod (USB Serial)", HUD_LINK_TAB_USB,
                selected == HUD_LINK_TAB_USB), hudLinkTabLayout(true));

        LinearLayout.LayoutParams tabsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tabsLp.topMargin = dp(2);
        tabsLp.bottomMargin = dp(8);
        root.addView(tabs, tabsLp);
    }

    private LinearLayout.LayoutParams hudLinkTabLayout(boolean hasTopMargin) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(50));
        if (hasTopMargin) lp.topMargin = dp(5);
        return lp;
    }

    private TextView hudLinkTab(String label, final int tab, boolean selected) {
        TextView view = new TextView(this);
        view.setText(label);
        view.setTextSize(15);
        view.setSingleLine(true);
        view.setEllipsize(android.text.TextUtils.TruncateAt.END);
        view.setPadding(dp(12), 0, dp(12), 0);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setTextColor(selected ? 0xFFFFFFFF : COLOR_MUTED);
        view.setGravity(Gravity.CENTER);
        view.setSelected(selected);
        view.setContentDescription(label + (selected ? I18n.tr("settings.selected") : ""));
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.RECTANGLE);
        background.setColor(selected
                ? (0x30000000 | (COLOR_ACCENT & 0x00FFFFFF)) : 0x00000000);
        background.setCornerRadius(dp(14));
        if (selected) background.setStroke(dp(1), COLOR_ACCENT);
        view.setBackground(background);
        view.setClickable(true);
        view.setFocusable(true);
        view.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View clicked) {
                if (hudLinkUiTab() == tab) return;
                sp.edit().putInt(PREF_HUD_LINK_UI_TAB, tab).apply();
                openCategory(CAT_DEVICE);
            }
        });
        return view;
    }

    private void addHlpLinkSettings(final LinearLayout root, final boolean webSocketMode) {
        int storedTransport = sp.getInt("hud_link_transport",
                HudDeviceRepository.TRANSPORT_AUTO);
        final int configuredTransport = !webSocketMode
                && storedTransport == HudDeviceRepository.TRANSPORT_WS
                ? HudDeviceRepository.TRANSPORT_AUTO : storedTransport;
        addSection(root, I18n.tr("settings.hlp_1_device"));
        addInfoCard(root, webSocketMode ? "HUD WazeMod Wi-Fi"
                        : "HUD WazeMod qua Bluetooth",
                webSocketMode
                        ? I18n.tr("settings.the_phone_and_esp32_must_be")
                        : I18n.tr("settings.connect_an_esp32_or_hc_05"));

        final LinearLayout enabledRow = row(root, I18n.tr("settings.turn_on_wazemod_hud"));
        final Switch enabled = new Switch(this);
        hudLinkEnabledSwitch = enabled;
        enabled.setChecked(hudLinkEnabledForTab(hudLinkUiTab()));
        enabled.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {
            @Override public void onCheckedChanged(android.widget.CompoundButton button, boolean on) {
                if (updatingHudLinkSwitch) return;
                if (!on) {
                    sp.edit().putBoolean("hud_link", false).apply();
                    HudDeviceRepository devices = new HudDeviceRepository(ModSettingsActivity.this);
                    if (devices.isVietMapEnabled()) {
                        devices.setActiveFamily(devices.vietMapFamily());
                        HudLinkService.reconfigure(ModSettingsActivity.this);
                    } else HudLink.stop(ModSettingsActivity.this);
                    return;
                }
                if (!webSocketMode && !hasHudPermissions()) {
                    pendingHudEnable = true;
                    setHudLinkSwitchChecked(false);
                    requestHudPermissions();
                    return;
                }
                if (webSocketMode
                        && sp.getString(HudDeviceRepository.WS_HOST_KEY, "").trim().length() == 0) {
                    setHudLinkSwitchChecked(false);
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.enter_the_huds_ip_address_first"),
                            android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                if (!webSocketMode
                        && sp.getString("hud_link_device_address", "").length() == 0) {
                    pendingHudEnable = true;
                    setHudLinkSwitchChecked(false);
                    openHudPicker(true);
                    return;
                }
                new HudDeviceRepository(ModSettingsActivity.this).setActiveFamily(
                        HudProtocolFamily.HLP1);
                sp.edit().putInt("hud_link_transport", webSocketMode
                                ? HudDeviceRepository.TRANSPORT_WS : configuredTransport)
                        .putBoolean("hud_link", true).apply();
                HudLinkService.reconfigure(ModSettingsActivity.this);
                refreshHudLinkStatus();
            }
        });
        enabledRow.addView(enabled, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        if (!webSocketMode) {
            addChoice(root, "Transport", "hud_link_transport",
                    new int[]{HudDeviceRepository.TRANSPORT_AUTO, HudDeviceRepository.TRANSPORT_SPP,
                            HudDeviceRepository.TRANSPORT_BLE},
                    new String[]{I18n.tr("settings.auto"), "Bluetooth Classic SPP", "Bluetooth LE GATT"},
                    HudDeviceRepository.TRANSPORT_AUTO, new Runnable() {
                        @Override public void run() {
                            if (sp.getBoolean("hud_link", false)) HudLinkService.reconfigure(
                                    ModSettingsActivity.this);
                            refreshHudLinkStatus();
                        }
                    });
        }

        if (webSocketMode) {
            addHudWebSocketSettings(root);
        } else {
            final LinearLayout deviceRow = row(root, I18n.tr("settings.choose_a_device"));
            deviceRow.setClickable(true);
            deviceRow.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) { openHudPicker(false); }
            });
            String selectedName = sp.getString("hud_link_device_name", "");
            String selectedAddress = sp.getString("hud_link_device_address", "");
            TextView selected = rowValue(selectedName.length() > 0 ? selectedName
                    : (selectedAddress.length() > 0 ? selectedAddress : I18n.tr("settings.not_selected")));
            deviceRow.addView(selected, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        addHudLinkStatusCard(root);
        refreshHudLinkStatus();

        TextView retry = new TextView(this);
        hudLinkActionButton = retry;
        refreshHudLinkStatus();
        retry.setTextSize(16);
        retry.setTypeface(Typeface.DEFAULT_BOLD);
        retry.setTextColor(0xFFFFFFFF);
        retry.setGravity(Gravity.CENTER);
        retry.setClickable(true);
        retry.setFocusable(true);
        GradientDrawable retryBg = new GradientDrawable();
        retryBg.setColor(COLOR_ACCENT);
        retryBg.setCornerRadius(dp(15));
        retry.setBackground(retryBg);
        enableLiftHover(retry);
        LinearLayout.LayoutParams retryLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(52));
        retryLp.topMargin = dp(12);
        retryLp.bottomMargin = dp(8);
        root.addView(retry, retryLp);
        retry.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                String currentState = sp.getString("hud_link_status", "DISABLED");
                if ("CONNECTED".equals(currentState)
                        && hudLinkEnabledForTab(hudLinkUiTab())) {
                    sp.edit().putBoolean("hud_link", false).apply();
                    HudLink.stop(ModSettingsActivity.this);
                    setHudLinkSwitchChecked(false);
                    refreshHudLinkStatus();
                    return;
                }
                if (!webSocketMode && !hasHudPermissions()) { requestHudPermissions(); return; }
                if (webSocketMode
                        && sp.getString(HudDeviceRepository.WS_HOST_KEY, "").trim().length() == 0) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.enter_the_huds_ip_address_first"),
                            android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                sp.edit().putInt("hud_link_transport", webSocketMode
                                ? HudDeviceRepository.TRANSPORT_WS : configuredTransport)
                        .putBoolean("hud_link", true).apply();
                new HudDeviceRepository(ModSettingsActivity.this).setActiveFamily(
                        HudProtocolFamily.HLP1);
                HudLinkService.reconfigure(ModSettingsActivity.this);
                refreshHudLinkStatus();
            }
        });

        LinearLayout forget = row(root, webSocketMode
                ? I18n.tr("settings.clear_hud_wi_fi_settings") : I18n.tr("settings.forget_the_selected_device"));
        forget.setClickable(true);
        forget.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (webSocketMode) {
                    sp.edit().remove(HudDeviceRepository.WS_HOST_KEY)
                            .remove(HudDeviceRepository.WS_PORT_KEY)
                            .remove(HudDeviceRepository.WS_PATH_KEY).apply();
                } else new HudDeviceRepository(ModSettingsActivity.this).forget();
                sp.edit().putBoolean("hud_link", false).apply();
                HudLink.stop(ModSettingsActivity.this);
                // The address fields still show the old values; rebuild the page so they match.
                if (webSocketMode) openCategory(CAT_DEVICE);
            }
        });
        addSwitch(root, I18n.tr("settings.enable_payload_logging_debug_only"), "hud_link_log", false);
        hudFirmwareRefresh = addHudFirmwareUi(root); // OTA is independent of cfg schema.
        addHudDeviceConfig(root);
    }

    private void addHudDeviceConfig(LinearLayout root) {
        hudDeviceConfigHost = new LinearLayout(this);
        hudDeviceConfigHost.setOrientation(LinearLayout.VERTICAL);
        root.addView(hudDeviceConfigHost, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        renderHudDeviceConfig();
    }

    private void addHudWebSocketSettings(LinearLayout root) {
        addHudWebSocketField(root, I18n.tr("settings.hud_ip_address_hostname"),
                HudDeviceRepository.WS_HOST_KEY, "192.168.43.27", false);
        addHudWebSocketField(root, I18n.tr("settings.websocket_port"),
                HudDeviceRepository.WS_PORT_KEY, String.valueOf(HudDeviceRepository.WS_DEFAULT_PORT),
                true);
        addHudWebSocketField(root, I18n.tr("settings.websocket_path"),
                HudDeviceRepository.WS_PATH_KEY, "/hlp", false);
        addInfoCard(root, I18n.tr("settings.two_supported_network_setups"),
                I18n.tr("settings.1_the_phone_and_esp32_connect"));
    }

    private void addHudWebSocketField(LinearLayout root, String label, final String key,
                                      String defaultValue, final boolean numeric) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(14), dp(10), dp(14), dp(10));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);
        TextView title = new TextView(this);
        title.setText(label);
        title.setTextColor(COLOR_TEXT);
        title.setTextSize(15);
        card.addView(title);
        final android.widget.EditText input = new android.widget.EditText(this);
        input.setSingleLine(true);
        input.setTextColor(COLOR_TEXT);
        input.setHintTextColor(COLOR_MUTED);
        input.setTextSize(15);
        input.setPadding(dp(11), dp(7), dp(11), dp(7));
        input.setHint(defaultValue);
        // The default is only a hint: the repository falls back to "" for the host, so showing it as
        // text made the field look filled while Connect still said "enter the HUD address".
        String current = numeric
                ? String.valueOf(sp.getInt(key, Integer.parseInt(defaultValue)))
                : sp.getString(key, "");
        input.setText(current);
        input.setInputType(numeric ? android.text.InputType.TYPE_CLASS_NUMBER
                : android.text.InputType.TYPE_CLASS_TEXT
                        | android.text.InputType.TYPE_TEXT_VARIATION_URI);
        input.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                String value = s == null ? "" : s.toString().trim();
                SharedPreferences.Editor edit = sp.edit();
                if (numeric) {
                    int port = HudDeviceRepository.WS_DEFAULT_PORT;
                    try { port = Integer.parseInt(value); } catch (Throwable ignored) { }
                    edit.putInt(key, port);
                } else edit.putString(key, value);
                edit.apply();
            }
            @Override public void afterTextChanged(android.text.Editable editable) { }
        });
        GradientDrawable inputBg = new GradientDrawable();
        inputBg.setColor(0xFF11141B);
        inputBg.setCornerRadius(dp(10));
        inputBg.setStroke(dp(1), COLOR_BORDER);
        input.setBackground(inputBg);
        LinearLayout.LayoutParams inputLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        inputLp.topMargin = dp(7);
        card.addView(input, inputLp);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.bottomMargin = dp(8);
        root.addView(card, cardLp);
    }

    /** USB Host serial transport settings. */
    private void addHudUsbSettings(final LinearLayout root) {
        addSection(root, I18n.tr("settings.usb_serial_device"));
        addInfoCard(root, "HUD WazeMod qua USB Serial",
                I18n.tr("settings.use_an_otg_cable_to_connect"));

        final HudDeviceRepository devices = new HudDeviceRepository(this);
        final Switch enabled = new Switch(this);
        hudLinkEnabledSwitch = enabled;
        enabled.setChecked(hudLinkEnabledForTab(HUD_LINK_TAB_USB));
        LinearLayout enabledRow = row(root, I18n.tr("settings.turn_on_usb_serial_hud"));
        enabledRow.addView(enabled, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        enabled.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {
            @Override public void onCheckedChanged(android.widget.CompoundButton button, boolean on) {
                if (updatingHudLinkSwitch) return;
                if (!on) {
                    sp.edit().putBoolean("hud_link", false).apply();
                    HudLink.stop(ModSettingsActivity.this);
                    return;
                }
                if (!devices.hasUsbSelection()) {
                    setHudLinkSwitchChecked(false);
                    showUsbDevicePicker();
                    return;
                }
                devices.setActiveFamily(HudProtocolFamily.HLP1);
                sp.edit().putInt("hud_link_transport", HudDeviceRepository.TRANSPORT_USB)
                        .putBoolean("hud_link", true).apply();
                HudLinkService.reconfigure(ModSettingsActivity.this);
                refreshHudLinkStatus();
            }
        });

        LinearLayout deviceRow = row(root, I18n.tr("settings.choose_a_usb_device"));
        deviceRow.setClickable(true);
        deviceRow.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { showUsbDevicePicker(); }
        });
        TextView selected = rowValue(devices.hasUsbSelection()
                ? devices.usbDeviceName() + " (" + String.format(java.util.Locale.US,
                        "%04X:%04X", devices.usbVid(), devices.usbPid()) + ")" : I18n.tr("settings.not_selected"));
        deviceRow.addView(selected, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        addChoice(root, I18n.tr("settings.baud_rate"), HudDeviceRepository.USB_BAUD_KEY,
                new int[]{9600, 19200, 38400, 57600, 115200, 230400, 460800, 921600},
                new String[]{"9600", "19200", "38400", "57600", I18n.tr("settings.115200_default"),
                        "230400", "460800", "921600"},
                HudDeviceRepository.USB_DEFAULT_BAUD, new Runnable() {
                    @Override public void run() {
                        if (sp.getBoolean("hud_link", false))
                            HudLinkService.reconfigure(ModSettingsActivity.this);
                    }
                });

        addHudLinkStatusCard(root);
        refreshHudLinkStatus();

        TextView retry = new TextView(this);
        hudLinkActionButton = retry;
        refreshHudLinkStatus();
        retry.setTextSize(16);
        retry.setTypeface(Typeface.DEFAULT_BOLD);
        retry.setTextColor(0xFFFFFFFF);
        retry.setGravity(Gravity.CENTER);
        GradientDrawable retryBg = new GradientDrawable();
        retryBg.setColor(COLOR_ACCENT);
        retryBg.setCornerRadius(dp(15));
        retry.setBackground(retryBg);
        LinearLayout.LayoutParams retryLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(52));
        retryLp.topMargin = dp(12);
        retryLp.bottomMargin = dp(8);
        root.addView(retry, retryLp);
        retry.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if ("CONNECTED".equals(sp.getString("hud_link_status", "DISABLED"))
                        && hudLinkEnabledForTab(HUD_LINK_TAB_USB)) {
                    sp.edit().putBoolean("hud_link", false).apply();
                    HudLink.stop(ModSettingsActivity.this);
                    setHudLinkSwitchChecked(false);
                    refreshHudLinkStatus();
                    return;
                }
                if (!devices.hasUsbSelection()) { showUsbDevicePicker(); return; }
                devices.setActiveFamily(HudProtocolFamily.HLP1);
                sp.edit().putInt("hud_link_transport", HudDeviceRepository.TRANSPORT_USB)
                        .putBoolean("hud_link", true).apply();
                HudLinkService.reconfigure(ModSettingsActivity.this);
                refreshHudLinkStatus();
            }
        });

        LinearLayout forget = row(root, I18n.tr("settings.forget_the_selected_usb_device"));
        forget.setClickable(true);
        forget.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                devices.forgetUsb();
                sp.edit().putBoolean("hud_link", false).apply();
                HudLink.stop(ModSettingsActivity.this);
                openCategory(CAT_DEVICE);
            }
        });
        addInfoCard(root, I18n.tr("settings.otg_power_note"),
                I18n.tr("settings.an_esp32_with_a_display_or"));
        hudFirmwareRefresh = addHudFirmwareUi(root); // OTA is independent of cfg schema.
        addHudDeviceConfig(root);
    }

    private void showUsbDevicePicker() {
        final java.util.List<UsbSerialHudTransport.UsbDeviceInfo> list =
                UsbSerialHudTransport.listDevices(this);
        if (list.isEmpty()) {
            android.widget.Toast.makeText(this,
                    I18n.tr("settings.no_compatible_usb_serial_device_found"), android.widget.Toast.LENGTH_SHORT).show();
            return;
        }
        String[] labels = new String[list.size()];
        for (int i = 0; i < list.size(); i++) {
            UsbSerialHudTransport.UsbDeviceInfo d = list.get(i);
            labels[i] = d.name + " • " + d.driverName + " • " + d.vidPidLabel();
        }
        new android.app.AlertDialog.Builder(this)
                .setTitle(I18n.tr("settings.choose_a_usb_serial_device"))
                .setItems(labels, new android.content.DialogInterface.OnClickListener() {
                    @Override public void onClick(android.content.DialogInterface dialog, int which) {
                        UsbSerialHudTransport.UsbDeviceInfo d = list.get(which);
                        HudDeviceRepository devices = new HudDeviceRepository(ModSettingsActivity.this);
                        devices.setUsbDevice(d.vid, d.pid, d.name, d.deviceId);
                        devices.setActiveFamily(HudProtocolFamily.HLP1);
                        sp.edit().putInt("hud_link_transport", HudDeviceRepository.TRANSPORT_USB)
                                .putBoolean("hud_link", true).apply();
                        HudLinkService.reconfigure(ModSettingsActivity.this);
                        openCategory(CAT_DEVICE);
                    }
                }).show();
    }

    private void addVietMapHudSettings(LinearLayout root) {
        // Dynamic config belongs to HLP/1 only. Do not leave a detached HLP host active while the
        // VietMap tab is visible and never route VietMap UI into HudDeviceConfig transactions.
        hudFirmwareRefresh = null;
        hudDeviceConfigHost = null;
        hudLinkEnabledSwitch = null;
        hudLinkStatus = null;
        hudLinkStatusHint = null;
        hudLinkStatusDetail = null;
        hudLinkStatusDetailToggle = null;
        hudLinkStatusDot = null;
        hudLinkActionButton = null;

        addSection(root, I18n.tr("settings.vietmap_hud_integration"));
        addInfoCard(root, I18n.tr("settings.separate_connection_channel"),
                I18n.tr("settings.vietmap_hud_uses_its_own_binary"));
        addHudIntegrationStatus(root, "HUD H50", "EXPERIMENTAL", true);
        addHudIntegrationStatus(root, "HUD H1 / H1N / H1AS / H2AS / H1X",
                I18n.tr("settings.awaiting_device_testing"), false);
        final HudDeviceRepository devices = new HudDeviceRepository(this);
        final LinearLayout deviceRow = row(root, I18n.tr("settings.choose_a_vietmap_hud"));
        deviceRow.setClickable(true);
        deviceRow.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { openVietMapHudPicker(); }
        });
        TextView selected = new TextView(this);
        selected.setTextColor(COLOR_ACCENT);
        selected.setTextSize(14);
        String selectedName = devices.vietMapName();
        String selectedAddress = devices.vietMapAddress();
        selected.setText(selectedName.length() > 0 ? selectedName
                : (selectedAddress.length() > 0 ? selectedAddress : I18n.tr("settings.not_selected")));
        deviceRow.addView(selected, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        String profile = devices.vietMapFamily().preferenceValue();
        LinearLayout profileRow = row(root, I18n.tr("settings.detected_protocol"));
        TextView profileValue = new TextView(this);
        profileValue.setTextColor(COLOR_ACCENT);
        profileValue.setTextSize(14);
        profileValue.setText("vietmap_h50".equals(profile) ? "VietMap H50"
                : ("vietmap_h1".equals(profile) ? "VietMap H1 / DJBT" : I18n.tr("settings.auto")));
        profileRow.addView(profileValue, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        if (HudFeatureFlags.h50RuntimeEnabled()) {
            final LinearLayout enabledRow = row(root, I18n.tr("settings.turn_on_vietmap_h50_hud"));
            final Switch enabled = new Switch(this);
            boolean h50Selected = devices.vietMapFamily() == HudProtocolFamily.VIETMAP_H50;
            enabled.setChecked(h50Selected && devices.isVietMapEnabled());
            enabled.setOnCheckedChangeListener(
                    new android.widget.CompoundButton.OnCheckedChangeListener() {
                @Override public void onCheckedChanged(android.widget.CompoundButton button,
                                                       boolean on) {
                    HudDeviceRepository repository =
                            new HudDeviceRepository(ModSettingsActivity.this);
                    if (!on) {
                        repository.setVietMapEnabled(false);
                        if (repository.activeFamily() == HudProtocolFamily.VIETMAP_H50)
                            repository.setActiveFamily(HudProtocolFamily.HLP1);
                        if (sp.getBoolean("hud_link", false))
                            HudLinkService.reconfigure(ModSettingsActivity.this);
                        else HudLink.stop(ModSettingsActivity.this);
                        return;
                    }
                    if (!hasHudPermissions()) {
                        button.setChecked(false);
                        pendingHudEnable = false;
                        pendingHudPicker = true;
                        pendingHudPickerProfile = HudDevicePickerActivity.PROFILE_VIETMAP;
                        requestHudPermissions();
                        return;
                    }
                    if (repository.vietMapAddress().length() == 0) {
                        button.setChecked(false);
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                I18n.tr("settings.choose_a_vietmap_h50_hud_first"), android.widget.Toast.LENGTH_SHORT).show();
                        openVietMapHudPicker();
                        return;
                    }
                    if (repository.vietMapFamily() != HudProtocolFamily.VIETMAP_H50) {
                        button.setChecked(false);
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                I18n.tr("settings.only_the_h50_is_supported_on"),
                                android.widget.Toast.LENGTH_LONG).show();
                        return;
                    }
                    repository.setActiveFamily(HudProtocolFamily.VIETMAP_H50);
                    repository.setVietMapEnabled(true);
                    HudLinkService.startFromUser(ModSettingsActivity.this);
                }
            });
            enabledRow.addView(enabled, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        if (selectedAddress.length() > 0) {
            LinearLayout forget = row(root, I18n.tr("settings.forget_the_selected_vietmap_hud"));
            forget.setClickable(true);
            forget.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) {
                    devices.forgetVietMap();
                    openCategory(CAT_DEVICE);
                }
            });
        }
        addInfoCard(root, I18n.tr("settings.experimental_h50_only"),
                I18n.tr("settings.the_h50_has_a_handshake_codec"));
        addInfoCard(root, I18n.tr("settings.known_h50_limitations"),
                I18n.tr("settings.vietmap_live_does_not_transmit_the"));
    }

    private void addHudIntegrationStatus(LinearLayout root, String label, String status,
                                         boolean ready) {
        LinearLayout statusRow = row(root, label);
        TextView value = new TextView(this);
        value.setText(status);
        value.setTextSize(11);
        value.setTypeface(Typeface.DEFAULT_BOLD);
        value.setTextColor("EXPERIMENTAL".equals(status) ? 0xFF55C7FF
                : (ready ? 0xFF65D7A2 : 0xFFFFB15C));
        value.setGravity(Gravity.CENTER_VERTICAL | Gravity.RIGHT);
        value.setContentDescription(label + ": " + status.toLowerCase(
                java.util.Locale.getDefault()));
        statusRow.addView(value, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void renderHudDeviceConfig() {
        final LinearLayout host = hudDeviceConfigHost;
        if (host == null) return;
        HudDeviceConfig.Snapshot state = HudDeviceConfig.snapshot();
        HudDeviceConfig.Schema schema = state.schema;
        host.removeAllViews();
        if (schema == null || schema.items.isEmpty()) {
            host.setVisibility(View.GONE);
            hudDeviceConfigDraft.clear();
            hudDeviceConfigRevision = -1L;
            hudDeviceConfigGeneration = state.generation;
            hudDeviceConfigDirty = false;
            return;
        }
        host.setVisibility(View.VISIBLE);
        boolean newSnapshot = hudDeviceConfigGeneration != state.generation;
        if (hudDeviceConfigRevision != schema.revision
                || (newSnapshot && HudDeviceConfig.Snapshot.APPLIED.equals(state.applyState))
                || (newSnapshot && !hudDeviceConfigDirty)) {
            hudDeviceConfigDraft.clear();
            for (HudDeviceConfig.Item item : schema.items)
                hudDeviceConfigDraft.put(item.id, item.value);
            hudDeviceConfigRevision = schema.revision;
            hudDeviceConfigDirty = false;
        }
        hudDeviceConfigGeneration = state.generation;

        addSection(host, schema.title);
        for (HudDeviceConfig.Item item : schema.items) addHudDeviceConfigItem(host, item);

        if (state.message.length() > 0) {
            TextView status = new TextView(this);
            status.setText(state.message);
            status.setTextSize(13);
            status.setTextColor(HudDeviceConfig.Snapshot.ERROR.equals(state.applyState)
                    ? 0xFFFF6B75 : COLOR_MUTED);
            status.setPadding(dp(5), dp(9), dp(5), dp(3));
            host.addView(status, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        final TextView apply = new TextView(this);
        apply.setText(HudDeviceConfig.Snapshot.APPLYING.equals(state.applyState)
                ? I18n.tr("settings.sending") : I18n.tr("settings.apply_on_hud"));
        apply.setTextColor(0xFFFFFFFF);
        apply.setTextSize(15);
        apply.setTypeface(Typeface.DEFAULT_BOLD);
        apply.setGravity(Gravity.CENTER);
        apply.setPadding(dp(16), dp(13), dp(16), dp(13));
        GradientDrawable applyBg = new GradientDrawable();
        applyBg.setColor(HudDeviceConfig.Snapshot.APPLYING.equals(state.applyState)
                ? 0xFF4A4F5C : COLOR_ACCENT);
        applyBg.setCornerRadius(dp(14));
        apply.setBackground(applyBg);
        boolean applying = HudDeviceConfig.Snapshot.APPLYING.equals(state.applyState);
        apply.setEnabled(!applying);
        if (!applying) enableLiftHover(apply);
        final long revision = schema.revision;
        apply.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (!HudLinkService.applyDeviceConfig(revision,
                        new java.util.LinkedHashMap<String, Object>(hudDeviceConfigDraft))) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.hud_link_not_connected"), android.widget.Toast.LENGTH_SHORT).show();
                }
            }
        });
        LinearLayout.LayoutParams applyLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(50));
        applyLp.topMargin = dp(12);
        applyLp.bottomMargin = dp(4);
        host.addView(apply, applyLp);
    }

    private void addHudDeviceConfigItem(LinearLayout root, final HudDeviceConfig.Item item) {
        if (HudDeviceConfig.TOGGLE.equals(item.kind)) {
            LinearLayout r = deviceConfigRow(root, item);
            final Switch toggle = new Switch(this);
            toggle.setChecked(Boolean.TRUE.equals(hudDeviceConfigDraft.get(item.id)));
            toggle.setOnCheckedChangeListener(
                    new android.widget.CompoundButton.OnCheckedChangeListener() {
                        @Override public void onCheckedChanged(
                                android.widget.CompoundButton button, boolean checked) {
                            updateHudDeviceDraft(item.id, Boolean.valueOf(checked));
                        }
                    });
            r.addView(toggle, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        if (HudDeviceConfig.SLIDER.equals(item.kind)) {
            LinearLayout card = deviceConfigVerticalCard(root, item);
            final TextView value = new TextView(this);
            value.setTextColor(COLOR_ACCENT);
            value.setTextSize(16);
            value.setTypeface(Typeface.DEFAULT_BOLD);
            value.setText(String.valueOf(hudDeviceConfigDraft.get(item.id)));
            LinearLayout.LayoutParams valueLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            valueLp.gravity = Gravity.END;
            card.addView(value, valueLp);
            final SeekBar bar = new SeekBar(this);
            int count = Math.max(0, (item.max - item.min) / item.step);
            bar.setMax(count);
            int current = ((Number) hudDeviceConfigDraft.get(item.id)).intValue();
            bar.setProgress(Math.max(0, Math.min(count, (current - item.min) / item.step)));
            bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override public void onProgressChanged(SeekBar seekBar, int progress,
                                                         boolean fromUser) {
                    int next = item.min + progress * item.step;
                    value.setText(String.valueOf(next));
                    if (fromUser) updateHudDeviceDraft(item.id, Integer.valueOf(next));
                }
                @Override public void onStartTrackingTouch(SeekBar seekBar) { }
                @Override public void onStopTrackingTouch(SeekBar seekBar) { }
            });
            card.addView(bar, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        if (HudDeviceConfig.SELECTION.equals(item.kind)) {
            LinearLayout r = deviceConfigRow(root, item);
            final TextView value = new TextView(this);
            value.setTextColor(COLOR_ACCENT);
            value.setTextSize(15);
            value.setTypeface(Typeface.DEFAULT_BOLD);
            value.setText(deviceConfigOptionLabel(item,
                    String.valueOf(hudDeviceConfigDraft.get(item.id))));
            r.addView(value, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            r.setClickable(true);
            r.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) {
                    showHudDeviceChoiceDrawer(item, value);
                }
            });
            return;
        }

        LinearLayout card = deviceConfigVerticalCard(root, item);
        final android.widget.EditText input = new android.widget.EditText(this);
        input.setSingleLine(true);
        input.setTextColor(COLOR_TEXT);
        input.setHintTextColor(COLOR_MUTED);
        input.setTextSize(16);
        input.setPadding(dp(12), dp(9), dp(12), dp(9));
        GradientDrawable inputBg = new GradientDrawable();
        inputBg.setColor(0xFF11141B);
        inputBg.setCornerRadius(dp(10));
        inputBg.setStroke(dp(1), COLOR_BORDER);
        input.setBackground(inputBg);
        input.setText(String.valueOf(hudDeviceConfigDraft.get(item.id)));
        if (HudDeviceConfig.INTEGER.equals(item.kind))
            input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER
                    | android.text.InputType.TYPE_NUMBER_FLAG_SIGNED);
        else input.setInputType(android.text.InputType.TYPE_CLASS_TEXT);
        input.setFilters(new android.text.InputFilter[]{
                new android.text.InputFilter.LengthFilter(item.maxLength)});
        input.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                updateHudDeviceDraft(item.id, s.toString());
            }
            @Override public void afterTextChanged(android.text.Editable editable) { }
        });
        LinearLayout.LayoutParams inputLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        inputLp.topMargin = dp(8);
        card.addView(input, inputLp);
    }

    private LinearLayout deviceConfigRow(LinearLayout root, HudDeviceConfig.Item item) {
        LinearLayout r = row(root, item.label);
        if (item.description.length() > 0) r.setContentDescription(
                item.label + ". " + item.description);
        return r;
    }

    private LinearLayout deviceConfigVerticalCard(LinearLayout root, HudDeviceConfig.Item item) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(14), dp(12), dp(14), dp(12));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);
        TextView title = new TextView(this);
        title.setText(item.label);
        title.setTextColor(COLOR_TEXT);
        title.setTextSize(16);
        card.addView(title);
        if (item.description.length() > 0) {
            TextView description = new TextView(this);
            description.setText(item.description);
            description.setTextColor(COLOR_MUTED);
            description.setTextSize(12);
            description.setPadding(0, dp(3), 0, 0);
            card.addView(description);
        }
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(card, lp);
        return card;
    }

    private void updateHudDeviceDraft(String id, Object value) {
        hudDeviceConfigDraft.put(id, value);
        hudDeviceConfigDirty = true;
    }

    private String deviceConfigOptionLabel(HudDeviceConfig.Item item, String value) {
        for (HudDeviceConfig.Option option : item.options)
            if (option.value.equals(value)) return option.label;
        return value;
    }

    private void showHudDeviceChoiceDrawer(final HudDeviceConfig.Item item,
                                           final TextView valueView) {
        final String[] labels = new String[item.options.size()];
        int selected = -1;
        String current = String.valueOf(hudDeviceConfigDraft.get(item.id));
        for (int i = 0; i < item.options.size(); i++) {
            labels[i] = item.options.get(i).label;
            if (item.options.get(i).value.equals(current)) selected = i;
        }
        final android.app.AlertDialog dialog = new android.app.AlertDialog.Builder(this)
                .setTitle(item.label)
                .setSingleChoiceItems(labels, selected, null)
                .setNegativeButton(I18n.tr("hud_link.cancel"), null)
                .create();
        dialog.setOnShowListener(new android.content.DialogInterface.OnShowListener() {
            @Override public void onShow(android.content.DialogInterface ignored) {
                android.widget.ListView list = dialog.getListView();
                list.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
                    @Override public void onItemClick(android.widget.AdapterView<?> parent,
                                                      View view, int position, long id) {
                        HudDeviceConfig.Option option = item.options.get(position);
                        updateHudDeviceDraft(item.id, option.value);
                        valueView.setText(option.label);
                        dialog.dismiss();
                    }
                });
            }
        });
        dialog.show();
    }

    private boolean hasHudPermissions() {
        if (android.os.Build.VERSION.SDK_INT < 31) return true;
        return checkSelfPermission(android.Manifest.permission.BLUETOOTH_CONNECT)
                == android.content.pm.PackageManager.PERMISSION_GRANTED
                && checkSelfPermission(android.Manifest.permission.BLUETOOTH_SCAN)
                == android.content.pm.PackageManager.PERMISSION_GRANTED;
    }

    private void requestHudPermissions() {
        java.util.ArrayList<String> permissions = new java.util.ArrayList<String>();
        if (android.os.Build.VERSION.SDK_INT >= 31) {
            if (checkSelfPermission(android.Manifest.permission.BLUETOOTH_CONNECT)
                    != android.content.pm.PackageManager.PERMISSION_GRANTED)
                permissions.add(android.Manifest.permission.BLUETOOTH_CONNECT);
            if (checkSelfPermission(android.Manifest.permission.BLUETOOTH_SCAN)
                    != android.content.pm.PackageManager.PERMISSION_GRANTED)
                permissions.add(android.Manifest.permission.BLUETOOTH_SCAN);
        } else if (sp.getInt("hud_link_transport", HudDeviceRepository.TRANSPORT_AUTO)
                != HudDeviceRepository.TRANSPORT_SPP
                && checkSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION)
                != android.content.pm.PackageManager.PERMISSION_GRANTED) {
            permissions.add(android.Manifest.permission.ACCESS_FINE_LOCATION);
        }
        if (!permissions.isEmpty()) requestPermissions(
                permissions.toArray(new String[permissions.size()]), 4101);
    }

    private void openHudPicker(boolean enableAfterSelect) {
        openHudPicker(enableAfterSelect, HudDevicePickerActivity.PROFILE_HLP1);
    }

    private void openVietMapHudPicker() {
        openHudPicker(false, HudDevicePickerActivity.PROFILE_VIETMAP);
    }

    private void openHudPicker(boolean enableAfterSelect, String profile) {
        if (!hasHudPermissions()) {
            pendingHudEnable = enableAfterSelect;
            pendingHudPicker = true;
            pendingHudPickerProfile = profile == null ? HudDevicePickerActivity.PROFILE_HLP1 : profile;
            requestHudPermissions();
            return;
        }
        Intent intent = new Intent(this, HudDevicePickerActivity.class);
        intent.putExtra("enable_after_select", enableAfterSelect);
        intent.putExtra(HudDevicePickerActivity.EXTRA_HUD_PROFILE, profile);
        startActivity(intent);
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        if (requestCode == REQUEST_RECORD_OVERSPEED_AUDIO) {
            boolean granted = results.length > 0
                    && results[0] == android.content.pm.PackageManager.PERMISSION_GRANTED;
            pendingAlertRecordingPermission = false;
            if (granted) showAlertRecordingDrawer();
            else android.widget.Toast.makeText(this,
                    I18n.tr("settings.microphone_permission_is_needed_to_record"),
                    android.widget.Toast.LENGTH_LONG).show();
            return;
        }
        if (requestCode != 4101) return;
        boolean granted = results.length > 0;
        for (int result : results) if (result != android.content.pm.PackageManager.PERMISSION_GRANTED)
            granted = false;
        if (!granted) {
            pendingHudEnable = false;
            pendingHudPicker = false;
            sp.edit().putBoolean("hud_link", false)
                    .putString("hud_link_status", "PERMISSION_REQUIRED").apply();
            android.widget.Toast.makeText(this,
                    I18n.tr("settings.the_nearby_devices_permission_is_needed"),
                    android.widget.Toast.LENGTH_LONG).show();
            boolean permanent = true;
            for (String permission : permissions) {
                if (android.os.Build.VERSION.SDK_INT < 23
                        || shouldShowRequestPermissionRationale(permission)) {
                    permanent = false;
                    break;
                }
            }
            if (permanent) {
                new android.app.AlertDialog.Builder(this)
                        .setTitle(I18n.tr("settings.bluetooth_permission_needed"))
                        .setMessage(I18n.tr("settings.turn_on_the_nearby_devices_permission"))
                        .setPositiveButton(I18n.tr("settings.open_settings"), new android.content.DialogInterface.OnClickListener() {
                            @Override public void onClick(android.content.DialogInterface dialog, int which) {
                                try {
                                    Intent settings = new Intent(
                                            android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                                    settings.setData(android.net.Uri.parse("package:" + getPackageName()));
                                    startActivity(settings);
                                } catch (Throwable ignored) { }
                            }
                        }).setNegativeButton(I18n.tr("hud_link.cancel"), null).show();
            }
            return;
        }
        if (pendingHudPicker) {
            boolean enableAfterSelect = pendingHudEnable;
            String profile = pendingHudPickerProfile;
            pendingHudEnable = false;
            pendingHudPicker = false;
            pendingHudPickerProfile = HudDevicePickerActivity.PROFILE_HLP1;
            openHudPicker(enableAfterSelect, profile);
        }
    }

    private void addAudioSettings(LinearLayout root) {
        addRecordedVoiceWarning(root);
        addSection(root, I18n.tr("settings.alert_sounds"));
        addAudioMixChoice(root);
        addChoice(root, I18n.tr("settings.boost_the_navigation_voice_volume"), "voice_boost_db",
                new int[]{0, 3, 6, 9, 12},
                new String[]{I18n.tr("settings.off"), "+3 dB", "+6 dB", "+9 dB", "+12 dB"}, 0,
                new Runnable() {
                    @Override public void run() { VoiceBoost.refresh(); }
                });
        addChoice(root, I18n.tr("settings.navigation_voice_plays_as"), "voice_stream",
                new int[]{0, 1},
                new String[]{I18n.tr("settings.navigation_wazes_default"), I18n.tr("settings.music_media_volume")}, 0,
                new Runnable() {
                    @Override public void run() { VoiceBoost.refresh(); }
                });
        addSwitch(root, I18n.tr("settings.follows_wazes_sound_mode_silent_when"),
                WazeSoundMode.PREF_RESPECT, true);
        addChoice(root, I18n.tr("settings.voice_set"), "voice_preset",
                new int[]{2, 3},
                new String[]{I18n.tr("settings.waze_m_n_nhi"), "WazeMod"}, 2);
        addOverspeedAudioChoice(root);

        addSection(root, I18n.tr("settings.self_recorded_audio_pack"));
        addRecordingPackageActions(root);

        addSection(root, I18n.tr("settings.sound_test"));
        addAudioPreviewCards(root);

        addSection(root, I18n.tr("settings.speed_announcements"));
        addSpeedVoiceNavigationRow(root, I18n.tr("settings.announce_the_current_speed_limit"), false);
        addSwitch(root, I18n.tr("settings.alert_when_speeding"), "say_over", true);
        addSpeedVoiceNavigationRow(root,
                I18n.tr("settings.navigation_announce_the_next_speed_limit"), true);

        addSection(root, I18n.tr("settings.road_alerts"));
        addSwitch(root, I18n.tr("settings.announce_road_alerts_mod_data"), "road_notice_tts", true);
        addSwitch(root, I18n.tr("settings.read_the_note_of_a_missing_sign_alert"), "missing_sign_note_tts", true);
        addSwitch(root, I18n.tr("settings.wme_speed_limit_points_when_driving_without_a_route"), "wme_speed_points", false);
        addSwitch(root, I18n.tr("settings.announce_traffic_light_alerts"),
                "traffic_light_voice", true);

        addSection(root, I18n.tr("settings.driver_reminders"));
        addSwitch(root, I18n.tr("settings.headlight_reminder_5_30_pm_6"), "headlight_reminder", false,
                new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.onHeadlightReminderSettingChanged(ModSettingsActivity.this);
                    }
                });
        addBreakReminderSettings(root);
    }

    /** Reminder to rest after long continuous driving: a switch and how long to wait. */
    private void addBreakReminderSettings(LinearLayout root) {
        addSwitch(root, I18n.tr("settings.break_reminder_after_long_driving_resets"), "break_reminder", false,
                new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.onBreakReminderSettingChanged(ModSettingsActivity.this);
                    }
                });
        addChoice(root, I18n.tr("settings.remind_me_to_rest_after_driving"), "break_reminder_minutes",
                new int[]{60, 90, 120, 180, 240},
                new String[]{I18n.tr("settings.1_hour"), I18n.tr("settings.1_hour_30_minutes"), I18n.tr("settings.2_hours"), I18n.tr("settings.3_hours"), I18n.tr("settings.4_hours")}, 120,
                new Runnable() {
                    @Override public void run() {
                        Gateway.onBreakReminderSettingChanged(ModSettingsActivity.this);
                    }
                });
    }

    /** Backup/restore only clips recorded by the user; selected files and APK assets stay out. */
    private void addRecordingPackageActions(LinearLayout root) {
        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams actionsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        actionsLp.topMargin = dp(8);
        root.addView(actions, actionsLp);

        int recordings = CustomAlertAudio.recordingCount(this, sp);
        TextView export = customAudioAction(recordings > 0
                ? I18n.f("settings.export_all_0", recordings) : I18n.tr("settings.export_all"), false);
        export.setGravity(Gravity.CENTER);
        export.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                int count = CustomAlertAudio.recordingCount(ModSettingsActivity.this, sp);
                if (count <= 0) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.no_self_recorded_audio_to_export"), android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("application/zip");
                intent.putExtra(Intent.EXTRA_TITLE, "WazeMod_ban_thu_"
                        + new java.text.SimpleDateFormat("yyyyMMdd_HHmmss", java.util.Locale.US)
                        .format(new java.util.Date()) + ".wzvoice");
                startActivityForResult(intent, REQUEST_EXPORT_RECORDING_PACKAGE);
            }
        });
        LinearLayout.LayoutParams exportLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        exportLp.rightMargin = dp(5);
        actions.addView(export, exportLp);

        TextView importPackage = customAudioAction(I18n.tr("settings.import_audio_pack"), false);
        importPackage.setGravity(Gravity.CENTER);
        importPackage.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("application/zip");
                intent.putExtra(Intent.EXTRA_MIME_TYPES,
                        new String[]{"application/zip", "application/octet-stream"});
                startActivityForResult(intent, REQUEST_IMPORT_RECORDING_PACKAGE);
            }
        });
        LinearLayout.LayoutParams importLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        importLp.leftMargin = dp(5);
        actions.addView(importPackage, importLp);

        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.packages_only_your_self_recorded_audio"));
        hint.setTextSize(12);
        hint.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.topMargin = dp(7);
        root.addView(hint, hintLp);

        TextView resetAll = customAudioAction(I18n.tr("settings.reset_audio_in_bulk"), true);
        resetAll.setGravity(Gravity.CENTER);
        resetAll.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { showResetCustomAudioDrawer(); }
        });
        LinearLayout.LayoutParams resetLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(52));
        resetLp.topMargin = dp(10);
        root.addView(resetAll, resetLp);
    }

    private void showResetCustomAudioDrawer() {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.reset_audio_in_bulk_2"),
                I18n.tr("settings.choose_the_groups_to_return_to"));
        final Switch overspeed = recordingImportGroupRow(sheet,
                "settings_demo/ui_alert.png", I18n.tr("settings.over_speed_voice"), I18n.tr("settings.restore_the_over_speed_sound_to"));
        final Switch current = recordingImportGroupRow(sheet,
                "settings_demo/current_speed_ui.png", I18n.tr("settings.current_speed_voice"),
                I18n.tr("settings.restore_all_current_speed_markers_to"));
        final Switch next = recordingImportGroupRow(sheet,
                "settings_demo/next_speed_ui.png", I18n.tr("settings.next_speed_voice"),
                I18n.tr("settings.restore_all_next_speed_markers_to"));

        TextView reset = customAudioAction(I18n.tr("settings.reset_the_selected_groups"), true);
        reset.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams resetLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(52));
        resetLp.topMargin = dp(14);
        sheet.addView(reset, resetLp);
        reset.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                int groups = 0;
                if (overspeed.isChecked()) groups |= CustomAlertAudio.GROUP_OVERSPEED;
                if (current.isChecked()) groups |= CustomAlertAudio.GROUP_CURRENT_SPEED;
                if (next.isChecked()) groups |= CustomAlertAudio.GROUP_NEXT_SPEED;
                if (groups == 0) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.choose_at_least_one_audio_group"),
                            android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                confirmResetCustomAudio(dialog, groups);
            }
        });
        showBottomSheet(dialog, sheet, dp(700));
    }

    private void confirmResetCustomAudio(final android.app.Dialog selector, final int groups) {
        StringBuilder names = new StringBuilder();
        if ((groups & CustomAlertAudio.GROUP_OVERSPEED) != 0) names.append(I18n.tr("settings.over_speed_voice_2"));
        if ((groups & CustomAlertAudio.GROUP_CURRENT_SPEED) != 0)
            names.append(I18n.tr("settings.current_speed_voice_2"));
        if ((groups & CustomAlertAudio.GROUP_NEXT_SPEED) != 0)
            names.append(I18n.tr("settings.next_speed_voice_2"));
        new android.app.AlertDialog.Builder(this)
                .setTitle(I18n.tr("settings.confirm_reset"))
                .setMessage(I18n.f("settings.the_following_groups_will_lose_all", names))
                .setNegativeButton(I18n.tr("report.cancel"), null)
                .setPositiveButton(I18n.tr("settings.reset"), new android.content.DialogInterface.OnClickListener() {
                    @Override public void onClick(android.content.DialogInterface ignored, int which) {
                        int changed = CustomAlertAudio.resetGroups(
                                ModSettingsActivity.this, sp, groups);
                        selector.dismiss();
                        android.widget.Toast.makeText(ModSettingsActivity.this,
                                changed > 0 ? I18n.f("settings.restored_0_sound_s_to_default", changed)
                                        : I18n.tr("settings.the_groups_are_already_at_default"),
                                android.widget.Toast.LENGTH_SHORT).show();
                        if (CAT_ALERTS.equals(selectedCategory)) openCategory(CAT_ALERTS);
                    }
                }).show();
    }

    /** Choose which recording families from a shared package should replace local recordings. */
    private void showRecordingPackageImportDrawer(final android.net.Uri packageUri) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.import_audio_pack"),
                I18n.tr("settings.choose_the_recording_groups_to_import"));

        final Switch overspeed = recordingImportGroupRow(sheet,
                "settings_demo/ui_alert.png", I18n.tr("settings.over_speed_voice"),
                I18n.tr("settings.sound_when_the_car_exceeds_the"));
        final Switch current = recordingImportGroupRow(sheet,
                "settings_demo/current_speed_ui.png", I18n.tr("settings.current_speed_voice"),
                I18n.tr("settings.recorded_current_speed_markers"));
        final Switch next = recordingImportGroupRow(sheet,
                "settings_demo/next_speed_ui.png", I18n.tr("settings.next_speed_voice"),
                I18n.tr("settings.recorded_upcoming_speed_markers"));

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams actionsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        actionsLp.topMargin = dp(14);
        sheet.addView(actions, actionsLp);

        TextView cancel = customAudioAction(I18n.tr("hud_link.cancel"), false);
        cancel.setGravity(Gravity.CENTER);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { dialog.dismiss(); }
        });
        LinearLayout.LayoutParams cancelLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        cancelLp.rightMargin = dp(5);
        actions.addView(cancel, cancelLp);

        final TextView apply = customAudioAction(I18n.tr("settings.import_recordings"), false);
        apply.setGravity(Gravity.CENTER);
        apply.setTextColor(COLOR_ACCENT);
        apply.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                int groups = 0;
                if (overspeed.isChecked()) groups |= CustomAlertAudio.GROUP_OVERSPEED;
                if (current.isChecked()) groups |= CustomAlertAudio.GROUP_CURRENT_SPEED;
                if (next.isChecked()) groups |= CustomAlertAudio.GROUP_NEXT_SPEED;
                if (groups == 0) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.choose_at_least_one_audio_group"),
                            android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                final int selectedGroups = groups;
                apply.setEnabled(false);
                apply.setText(I18n.tr("settings.checking_the_pack"));
                new Thread(new Runnable() {
                    @Override public void run() {
                        final int count = CustomAlertAudio.importRecordingPackage(
                                ModSettingsActivity.this, sp, packageUri, selectedGroups);
                        runOnUiThread(new Runnable() {
                            @Override public void run() {
                                if (isFinishing()) return;
                                apply.setEnabled(true);
                                apply.setText(I18n.tr("settings.import_recordings"));
                                android.widget.Toast.makeText(ModSettingsActivity.this,
                                        count > 0 ? I18n.f("settings.imported_0_recording_s", count)
                                                : (count == 0
                                                ? I18n.tr("settings.the_pack_has_no_recordings_in")
                                                : I18n.tr("settings.invalid_audio_pack")),
                                        count > 0 ? android.widget.Toast.LENGTH_SHORT
                                                : android.widget.Toast.LENGTH_LONG).show();
                                if (count > 0) {
                                    dialog.dismiss();
                                    if (CAT_ALERTS.equals(selectedCategory)) openCategory(CAT_ALERTS);
                                }
                            }
                        });
                    }
                }, "WazeMod-audio-import").start();
            }
        });
        LinearLayout.LayoutParams applyLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        applyLp.leftMargin = dp(5);
        actions.addView(apply, applyLp);
        showBottomSheet(dialog, sheet, dp(720));
    }

    private Switch recordingImportGroupRow(LinearLayout root, String iconAsset,
                                           String title, String subtitle) {
        final LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(12), dp(10), dp(12), dp(10));
        styleControlHover(row, false);
        enableControlHover(row);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(82));
        rowLp.topMargin = dp(8);
        root.addView(row, rowLp);

        ImageView icon = new ImageView(this);
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        android.graphics.Bitmap bitmap = decodeSampledAsset(iconAsset, 128);
        if (bitmap != null) icon.setImageBitmap(bitmap);
        row.addView(icon, new LinearLayout.LayoutParams(dp(58), dp(58)));

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.setGravity(Gravity.CENTER_VERTICAL);
        TextView titleView = new TextView(this);
        titleView.setText(title);
        titleView.setTextSize(16);
        titleView.setTextColor(COLOR_TEXT);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        labels.addView(titleView);
        TextView subtitleView = new TextView(this);
        subtitleView.setText(subtitle);
        subtitleView.setTextSize(12);
        subtitleView.setTextColor(COLOR_MUTED);
        labels.addView(subtitleView);
        LinearLayout.LayoutParams labelsLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelsLp.leftMargin = dp(12);
        row.addView(labels, labelsLp);

        final Switch toggle = new Switch(this);
        toggle.setChecked(true);
        try {
            toggle.setShowText(false);
            int[][] states = {{android.R.attr.state_checked}, {}};
            toggle.setThumbTintList(new android.content.res.ColorStateList(
                    states, new int[]{COLOR_ACCENT, 0xFFCFCFCF}));
            toggle.setTrackTintList(new android.content.res.ColorStateList(
                    states, new int[]{AmbientTheme.withAlpha(COLOR_ACCENT, 128), 0x40FFFFFF}));
        } catch (Throwable ignored) { }
        row.addView(toggle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.setClickable(true);
        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { toggle.setChecked(!toggle.isChecked()); }
        });
        return toggle;
    }

    /** Two compact VML-inspired preview cards kept on one row on phones and wide displays. */
    private void addAudioPreviewCards(LinearLayout root) {
        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setGravity(Gravity.CENTER_VERTICAL);
        cards.setBaselineAligned(false);
        LinearLayout.LayoutParams cardsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardsLp.topMargin = dp(8);
        root.addView(cards, cardsLp);

        final AudioPreviewCard current = makeAudioPreviewCard(I18n.tr("settings.current_speed"), true);
        audioCurrentPreview = current;
        current.root.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                startAudioPreview(current, false);
            }
        });
        LinearLayout.LayoutParams currentLp = new LinearLayout.LayoutParams(
                0, dp(76), 1f);
        currentLp.rightMargin = dp(5);
        cards.addView(current.root, currentLp);

        final AudioPreviewCard navigation = makeAudioPreviewCard(I18n.tr("settings.navigation_sound"), false);
        audioNavigationPreview = navigation;
        navigation.root.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                startAudioPreview(navigation, true);
            }
        });
        LinearLayout.LayoutParams navigationLp = new LinearLayout.LayoutParams(
                0, dp(76), 1f);
        navigationLp.leftMargin = dp(5);
        cards.addView(navigation.root, navigationLp);
        updateAudioPreviewCooldown();
    }

    private static final class AudioPreviewCard {
        final LinearLayout root;
        final TextView speaker;

        AudioPreviewCard(LinearLayout root, TextView speaker) {
            this.root = root;
            this.speaker = speaker;
        }
    }

    private AudioPreviewCard makeAudioPreviewCard(String title, boolean speed) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(9), dp(8), dp(8), dp(8));
        card.setClickable(true);
        card.setFocusable(true);
        card.setContentDescription(I18n.f("settings.preview_0", title));
        styleControlHover(card, false);
        enableControlHover(card);

        TextView icon = new TextView(this);
        icon.setText(speed ? previewSpeedValue() : "↱");
        icon.setTextSize(speed ? 13 : 22);
        icon.setTextColor(speed ? 0xFF111111 : 0xFFFFFFFF);
        icon.setGravity(Gravity.CENTER);
        icon.setTypeface(Typeface.DEFAULT_BOLD);
        GradientDrawable iconBg = new GradientDrawable();
        iconBg.setShape(GradientDrawable.OVAL);
        iconBg.setColor(speed ? 0xFFF8F8F8 : 0xFFFF9F0A);
        iconBg.setStroke(dp(speed ? 4 : 1), speed ? 0xFFFF5A64 : 0xFFFFB84D);
        icon.setBackground(iconBg);
        card.addView(icon, new LinearLayout.LayoutParams(dp(40), dp(40)));

        TextView label = new TextView(this);
        label.setText(title);
        label.setTextSize(14);
        label.setTextColor(COLOR_TEXT);
        label.setTypeface(Typeface.DEFAULT_BOLD);
        label.setGravity(Gravity.CENTER_VERTICAL);
        label.setMaxLines(2);
        LinearLayout.LayoutParams labelLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelLp.leftMargin = dp(9);
        labelLp.rightMargin = dp(5);
        card.addView(label, labelLp);

        TextView speaker = new TextView(this);
        speaker.setText("🔊");
        speaker.setTextSize(17);
        speaker.setGravity(Gravity.CENTER);
        speaker.setTextColor(COLOR_TEXT);
        GradientDrawable speakerBg = new GradientDrawable();
        speakerBg.setShape(GradientDrawable.OVAL);
        speakerBg.setColor(0xFF343842);
        speaker.setBackground(speakerBg);
        card.addView(speaker, new LinearLayout.LayoutParams(dp(40), dp(40)));
        return new AudioPreviewCard(card, speaker);
    }

    private String previewSpeedValue() {
        return "60";
    }

    private void startAudioPreview(AudioPreviewCard card, boolean navigation) {
        long now = android.os.SystemClock.elapsedRealtime();
        if (now < audioPreviewLockedUntil) return;
        boolean started = navigation
                ? Gateway.previewNavigationAudio()
                : Gateway.previewCurrentSpeedAudio();
        if (!started) {
            android.widget.Toast.makeText(this,
                    I18n.tr("settings.waze_audio_isnt_ready_try_again"),
                    android.widget.Toast.LENGTH_SHORT).show();
            return;
        }
        audioActivePreview = card;
        audioPreviewLockedUntil = now + AUDIO_PREVIEW_COOLDOWN_MS;
        updateAudioPreviewCooldown();
    }

    private void updateAudioPreviewCooldown() {
        audioPreviewHandler.removeCallbacks(audioPreviewCountdown);
        long remaining = audioPreviewLockedUntil
                - android.os.SystemClock.elapsedRealtime();
        boolean locked = remaining > 0L;
        updateAudioPreviewCard(audioCurrentPreview, locked);
        updateAudioPreviewCard(audioNavigationPreview, locked);
        if (locked) {
            int seconds = (int) ((remaining + 999L) / 1000L);
            if (audioActivePreview != null)
                audioActivePreview.speaker.setText(seconds + "s");
            audioPreviewHandler.postDelayed(audioPreviewCountdown,
                    Math.min(1000L, remaining));
        } else {
            audioPreviewLockedUntil = 0L;
            audioActivePreview = null;
        }
    }

    private void updateAudioPreviewCard(AudioPreviewCard card, boolean locked) {
        if (card == null) return;
        card.root.setEnabled(!locked);
        card.root.setClickable(!locked);
        card.root.setAlpha(locked ? 0.68f : 1f);
        if (card != audioActivePreview || !locked) card.speaker.setText("🔊");
    }

    private void addSpeedVoiceNavigationRow(LinearLayout root, String label, final boolean next) {
        LinearLayout r = row(root, label);
        TextView arrow = new TextView(this);
        arrow.setText("›");
        arrow.setTextSize(28);
        arrow.setTextColor(COLOR_TEXT);
        arrow.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams arrowLp = new LinearLayout.LayoutParams(dp(26), dp(36));
        arrowLp.leftMargin = dp(6);
        r.addView(arrow, arrowLp);
        r.setClickable(true);
        r.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { openSpeedVoicePage(next); }
        });
    }

    private void openSpeedVoicePage(boolean next) {
        rememberActivePageScroll();
        selectedSubpage = next ? "next_speed_voice" : "current_speed_voice";
        ScrollView page = buildSpeedVoicePage(next);
        trackPageScroll(page, subpageScrollKey(selectedSubpage));
        if (wideSettings) {
            detailHost.removeAllViews();
            detailHost.addView(page, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } else {
            narrowHost.removeAllViews();
            narrowHost.addView(page, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
    }

    /**
     * Waze's own configuration, held by the Mod while a switch is on (WazeFeatureOverrides pins the values and
     * locks them against the server): alert distances, camera sound, background time, ads and telemetry.
     */
    private void addWazeConfigSettings(LinearLayout root) {
        final Runnable apply = new Runnable() {
            @Override public void run() { WazeFeatureOverrides.refresh(); }
        };
        BoolCb applyCb = new BoolCb() {
            @Override public void on(boolean enabled) { WazeFeatureOverrides.refresh(); }
        };
        addSection(root, I18n.tr("settings.alert_distances"));
        String[] labels = {
                I18n.tr("settings.alert_distance_police"),
                I18n.tr("settings.alert_distance_speed_cameras"),
                I18n.tr("settings.alert_distance_hazards"),
                I18n.tr("settings.alert_distance_crashes"),
                I18n.tr("settings.alert_distance_traffic_jams"),
                I18n.tr("settings.alert_distance_blocked_lanes"),
                I18n.tr("settings.alert_distance_zones_on_streets"),
                I18n.tr("settings.alert_distance_zones_on_highways"),
                I18n.tr("settings.alert_distance_zones_on_freeways"),
                I18n.tr("settings.least_distance_between_two_alerts"),
        };
        // Waze's own alert badge in front of each label; the three zone sliders share the camera badge.
        String[] pins = {"bigpin_police", "bigpin_speed_camera", "bigpin_hazard", "bigpin_accident",
                "bigpin_traffic_3", "bigpin_blocked_lane", "bigpin_speed_camera", "bigpin_speed_camera",
                "bigpin_speed_camera", null};
        for (int i = 0; i < WazeFeatureOverrides.ALERT_DISTANCES.length; i++) {
            if (i == 0 && Region.inVietnam()) continue;   // no police alerts in Vietnam: the slider would do nothing
            String[] entry = WazeFeatureOverrides.ALERT_DISTANCES[i];
            SeekBar bar = addSlider(root, labels[i], entry[0], Integer.parseInt(entry[3]), Integer.parseInt(entry[4]),
                    100, Integer.parseInt(entry[2]), " m", false, null, apply);
            if (pins[i] != null) addSliderIcon(bar, pins[i]);
        }

        addSection(root, I18n.tr("settings.camera_alerts"));
        addSwitch(root, I18n.tr("settings.camera_sound_even_when_not_speeding"), "camera_sound_any_speed", false, applyCb);

        addSection(root, I18n.tr("settings.running_in_the_background"));
        addSwitch(root, I18n.tr("settings.keep_waze_running_longer_in_the_background"), "keep_background_long", false,
                applyCb);
        addChoice(root, I18n.tr("settings.keep_running_for"), "background_minutes",
                new int[]{5, 15, 30, 60, 120},
                new String[]{I18n.f("core.0_minutes", 5), I18n.f("core.0_minutes", 15), I18n.f("core.0_minutes", 30),
                        I18n.tr("settings.1_hour"), I18n.tr("settings.2_hours")}, 30, apply);
        addSwitch(root, I18n.tr("settings.close_waze_after_arriving"), "close_after_arrival", false);
        addChoice(root, I18n.tr("settings.close_after"), "close_after_arrival_seconds",
                new int[]{10, 30, 60, 120},
                new String[]{I18n.f("settings.0_seconds", 10), I18n.f("settings.0_seconds", 30),
                        I18n.f("settings.0_seconds", 60), I18n.f("settings.0_seconds", 120)}, 30);

        addSection(root, I18n.tr("settings.privacy"));
        addSwitch(root, I18n.tr("settings.block_ads"), "block_ads", false, applyCb);
        addSwitch(root, I18n.tr("settings.block_analytics_and_crash_reports"), "block_telemetry", false, applyCb);
    }

    /**
     * The xADAS settings (the "xADAS" category of the Mod settings): the link switch, its live status, then the
     * distance-alert options.
     */
    private void addXadasSettings(LinearLayout root) {
        addSwitch(root, I18n.tr("settings.real_distance_to_the_vehicle_ahead"),
                "xadas_link", false, new BoolCb() {
                    @Override public void on(boolean enabled) {
                        Gateway.onXadasSettingChanged(enabled);
                        updateXadasStatus();
                    }
                });
        addXadasStatus(root);

        addSection(root, I18n.tr("settings.preview"));
        LinearLayout previews = new LinearLayout(this);
        previews.setOrientation(LinearLayout.HORIZONTAL);
        previews.setGravity(Gravity.CENTER);
        // 72 km/h: safe mark at 55 m. 62 m is beyond it, 53 m is short of it and xADAS says too close.
        previews.addView(new GapGaugePreview(this,
                new XadasGapPolicy.State(true, 62, 55, 3.1f, false), false, dp(150)));
        View gap = new View(this);
        previews.addView(gap, new LinearLayout.LayoutParams(dp(14), 1));
        previews.addView(new GapGaugePreview(this,
                new XadasGapPolicy.State(true, 53, 55, 2.7f, true), false, dp(150)));
        LinearLayout.LayoutParams previewLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        previewLp.topMargin = dp(6);
        previewLp.bottomMargin = dp(6);
        root.addView(previews, previewLp);

        addSection(root, I18n.tr("settings.distance_alert"));
        addChoice(root, I18n.tr("settings.when_to_show_the_distance_alert"), "xadas_gap_mode",
                new int[]{XadasGapPolicy.MODE_ALWAYS, XadasGapPolicy.MODE_FREEWAY},
                new String[]{I18n.tr("settings.always_show_2"), I18n.tr("settings.only_on_expressways")}, XadasGapPolicy.MODE_FREEWAY);
        addChoice(root, I18n.tr("settings.alert_sounds"), "xadas_sound",
                new int[]{XadasGapPolicy.SOUND_SIGNAL, XadasGapPolicy.SOUND_VOICE, XadasGapPolicy.SOUND_OFF},
                new String[]{I18n.tr("settings.signal_only"), I18n.tr("settings.voice_alert"), I18n.tr("settings.off")}, XadasGapPolicy.SOUND_OFF);
        addChoice(root, I18n.tr("settings.alert_effect"), "xadas_effect",
                new int[]{XadasGapPolicy.EFFECT_STRONG, XadasGapPolicy.EFFECT_LIGHT, XadasGapPolicy.EFFECT_OFF},
                new String[]{I18n.tr("settings.strong_alert"), I18n.tr("settings.light_alert"), I18n.tr("settings.off")}, XadasGapPolicy.EFFECT_LIGHT);

        addSection(root, I18n.tr("settings.show_distance"));
        addSwitch(root, I18n.tr("settings.show_on_hud"), "xadas_hud", true);
        addSwitch(root, I18n.tr("settings.show_on_the_traffic_bubble"), "xadas_bubble", true);
        addSwitch(root, I18n.tr("settings.show_on_android_auto"), "xadas_aa", true);
    }

    private void returnToAlertsPage() {
        rememberActivePageScroll();
        selectedSubpage = null;
        ScrollView page = buildCategoryPage(CAT_ALERTS);
        trackPageScroll(page, categoryScrollKey(CAT_ALERTS));
        if (wideSettings) {
            detailHost.removeAllViews();
            detailHost.addView(page, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } else {
            narrowHost.removeAllViews();
            narrowHost.addView(page, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
    }

    private ScrollView buildSpeedVoicePage(final boolean next) {
        final String titleText = next
                ? I18n.tr("settings.next_speed_limit")
                : I18n.tr("settings.current_speed_limit");
        final String masterKey = next ? "say_next" : "say_limit";
        final String speedKeyPrefix = next ? "say_next_speed_" : "say_limit_speed_";

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(COLOR_BG);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(18), dp(14), dp(18), dp(28));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextSize(38);
        back.setTextColor(COLOR_TEXT);
        back.setGravity(Gravity.CENTER);
        back.setContentDescription(I18n.tr("settings.back_to_alerts_voice"));
        back.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { returnToAlertsPage(); }
        });
        titleRow.addView(back, new LinearLayout.LayoutParams(dp(42), dp(48)));

        TextView title = new TextView(this);
        title.setText(titleText);
        title.setTextSize(22);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        titleRow.addView(title, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(titleRow);

        TextView subtitle = new TextView(this);
        subtitle.setText(next
                ? I18n.tr("settings.choose_which_speed_limits_are_announced")
                : I18n.tr("settings.choose_which_speed_limits_are_announced_2"));
        subtitle.setTextSize(13);
        subtitle.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams subtitleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitleLp.leftMargin = dp(42);
        subtitleLp.bottomMargin = dp(10);
        root.addView(subtitle, subtitleLp);

        addSection(root, I18n.tr("settings.voice"));
        addSwitch(root, next
                ? I18n.tr("settings.announce_the_next_speed_limit")
                : I18n.tr("settings.announce_the_current_speed_limit_2"), masterKey, true);
        addSection(root, I18n.tr("settings.speeds_announced"));
        for (int speed : VOICE_SPEEDS) {
            addSpeedVoiceToggle(root, speed, speedKeyPrefix + speed);
        }
        return scroll;
    }

    private void addSpeedVoiceToggle(LinearLayout root, final int speed, final String key) {
        final LinearLayout r = new LinearLayout(this);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(dp(12), dp(10), dp(14), dp(10));
        styleControlHover(r, false);
        enableControlHover(r);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.topMargin = dp(8);
        root.addView(r, rowLp);

        TextView sign = new TextView(this);
        sign.setText(String.valueOf(speed));
        sign.setTextColor(0xFF111111);
        sign.setTextSize(speed >= 100 ? 13 : 15);
        sign.setTypeface(Typeface.DEFAULT_BOLD);
        sign.setGravity(Gravity.CENTER);
        GradientDrawable signBg = new GradientDrawable();
        signBg.setShape(GradientDrawable.OVAL);
        signBg.setColor(0xFFF8F8F8);
        signBg.setStroke(dp(4), 0xFFFF5A64);
        sign.setBackground(signBg);
        r.addView(sign, new LinearLayout.LayoutParams(dp(48), dp(48)));

        LinearLayout labelColumn = new LinearLayout(this);
        labelColumn.setOrientation(LinearLayout.VERTICAL);
        TextView label = new TextView(this);
        label.setText(I18n.f("settings.speed_limit_0", speed));
        label.setTextSize(17);
        label.setTextColor(COLOR_TEXT);
        labelColumn.addView(label);
        final String audioSlot = (key.startsWith("say_next_speed_") ? "next_" : "current_")
                + speed;
        final TextView audioValue = new TextView(this);
        audioValue.setText(customAudioLabel(audioSlot));
        audioValue.setTextSize(12);
        audioValue.setTextColor(COLOR_ACCENT);
        labelColumn.addView(audioValue);
        LinearLayout.LayoutParams labelLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelLp.leftMargin = dp(14);
        r.addView(labelColumn, labelLp);

        TextView audio = new TextView(this);
        audio.setText(I18n.tr("settings.sound"));
        audio.setTextSize(13);
        audio.setTextColor(COLOR_ACCENT);
        audio.setTypeface(Typeface.DEFAULT_BOLD);
        audio.setGravity(Gravity.CENTER);
        audio.setPadding(dp(10), dp(7), dp(10), dp(7));
        GradientDrawable audioBg = new GradientDrawable();
        audioBg.setColor(AmbientTheme.withAlpha(COLOR_ACCENT, 24));
        audioBg.setCornerRadius(dp(12));
        audioBg.setStroke(dp(1), AmbientTheme.withAlpha(COLOR_ACCENT, 110));
        audio.setBackground(audioBg);
        audio.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                showCustomAudioDrawer(audioSlot,
                        (audioSlot.startsWith("next_") ? I18n.tr("settings.next_speed") : I18n.tr("settings.current_speed_2"))
                                + speed,
                        audioValue);
            }
        });
        LinearLayout.LayoutParams audioLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(38));
        audioLp.rightMargin = dp(10);
        r.addView(audio, audioLp);

        final Switch sw = new Switch(this);
        try {
            sw.setShowText(false);
            int[][] states = {{android.R.attr.state_checked}, {}};
            sw.setThumbTintList(new android.content.res.ColorStateList(
                    states, new int[]{COLOR_ACCENT, 0xFFCFCFCF}));
            sw.setTrackTintList(new android.content.res.ColorStateList(
                    states, new int[]{AmbientTheme.withAlpha(COLOR_ACCENT, 128), 0x40FFFFFF}));
        } catch (Throwable ignored) { }
        sw.setChecked(sp.getBoolean(key, true));
        sw.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {
            @Override public void onCheckedChanged(android.widget.CompoundButton button, boolean on) {
                sp.edit().putBoolean(key, on).apply();
            }
        });
        r.addView(sw, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        r.setClickable(true);
        r.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { sw.setChecked(!sw.isChecked()); }
        });
    }

    /**
     * Chọn chính sách âm thanh thay vì một công tắc nhị phân khó hiểu.
     * audio_mix_mode: 0 = trộn âm thanh, 1 = giảm nhỏ nhạc.
     * Giữ khóa mix_mod_audio để các bản cũ và thiết lập hiện tại vẫn tương thích.
     */
    private void addAudioMixChoice(LinearLayout root) {
        final String modeKey = "audio_mix_mode";
        if (!sp.contains(modeKey)) {
            int migrated = sp.getBoolean("mix_mod_audio", false) ? 0 : 1;
            sp.edit().putInt(modeKey, migrated).apply();
        }
        addChoice(root, I18n.tr("settings.sound_mode"), modeKey,
                new int[]{0, 1},
                new String[]{I18n.tr("settings.mix_with_audio"), I18n.tr("settings.duck_the_music")},
                1,
                new Runnable() {
                    @Override public void run() {
                        boolean mix = sp.getInt(modeKey, 1) == 0;
                        sp.edit().putBoolean("mix_mod_audio", mix).apply();
                    }
                });
    }

    private void addOverspeedAudioChoice(LinearLayout root) {
        LinearLayout control = row(root, I18n.tr("settings.over_speed_sound"));
        overspeedAudioSummary = new TextView(this);
        overspeedAudioSummary.setText(customAudioLabel("overspeed"));
        overspeedAudioSummary.setTextSize(15);
        overspeedAudioSummary.setTextColor(COLOR_ACCENT);
        overspeedAudioSummary.setTypeface(Typeface.DEFAULT_BOLD);
        control.addView(overspeedAudioSummary, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        control.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                showCustomAudioDrawer("overspeed", I18n.tr("settings.over_speed_sound"), overspeedAudioSummary);
            }
        });
    }

    private String customAudioLabel(String slot) {
        int mode = sp.getInt(CustomAlertAudio.modeKey(slot), CustomAlertAudio.MODE_DEFAULT);
        if (mode == CustomAlertAudio.MODE_RECORDING) return I18n.tr("settings.self_recorded");
        if (mode == CustomAlertAudio.MODE_FILE) {
            String name = sp.getString(CustomAlertAudio.nameKey(slot), I18n.tr("settings.custom_file"));
            return name == null || name.trim().isEmpty() ? I18n.tr("settings.custom_file") : name;
        }
        return I18n.tr("settings.default");
    }

    private void showCustomAudioDrawer(final String slot, String title,
                                       final TextView summary) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(title,
                I18n.tr("settings.use_the_default_sound_choose_a"));

        LinearLayout previewBlock = new LinearLayout(this);
        previewBlock.setOrientation(LinearLayout.VERTICAL);
        final TextView preview = customAudioAction(I18n.tr("settings.preview_2"), false);
        preview.setGravity(Gravity.CENTER_VERTICAL);
        previewBlock.addView(preview, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(48)));
        final ProgressBar previewProgress = new ProgressBar(this, null,
                android.R.attr.progressBarStyleHorizontal);
        previewProgress.setMax(1000);
        previewProgress.setProgress(0);
        previewProgress.setIndeterminate(false);
        previewProgress.setProgressDrawable(synthwaveRecordingProgressDrawable());
        previewProgress.setVisibility(View.INVISIBLE);
        LinearLayout.LayoutParams previewProgressLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(6));
        previewProgressLp.leftMargin = dp(12);
        previewProgressLp.rightMargin = dp(12);
        previewProgressLp.bottomMargin = dp(4);
        previewBlock.addView(previewProgress, previewProgressLp);
        final android.animation.ObjectAnimator[] previewAnimator =
                new android.animation.ObjectAnimator[1];
        preview.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                boolean started;
                long duration;
                if ("overspeed".equals(slot)) {
                    started = Gateway.previewOverspeedAlert();
                    duration = Gateway.previewOverspeedDurationMs();
                } else {
                    boolean next = slot.startsWith("next_");
                    int split = slot.lastIndexOf('_');
                    int speed = split >= 0 ? Integer.parseInt(slot.substring(split + 1)) : -1;
                    started = Gateway.previewSpeedAlert(next, speed);
                    duration = Gateway.previewSpeedDurationMs(next, speed);
                }
                if (!started) {
                    preview.setText(I18n.tr("settings.cant_play_tap_to_retry"));
                    preview.setTextColor(0xFFFF6571);
                    previewProgress.setVisibility(View.INVISIBLE);
                    return;
                }
                if (previewAnimator[0] != null) previewAnimator[0].cancel();
                final long visualDuration = Math.max(800L, Math.min(30_000L, duration));
                preview.setEnabled(false);
                preview.setText(I18n.tr("settings.playing"));
                preview.setTextColor(0xFF19E6FF);
                previewProgress.setProgress(0);
                previewProgress.setVisibility(View.VISIBLE);
                android.animation.ObjectAnimator animator = android.animation.ObjectAnimator.ofInt(
                        previewProgress, "progress", 0, 1000);
                previewAnimator[0] = animator;
                animator.setDuration(visualDuration);
                animator.setInterpolator(new android.view.animation.LinearInterpolator());
                animator.addListener(new android.animation.AnimatorListenerAdapter() {
                    @Override public void onAnimationEnd(android.animation.Animator animation) {
                        preview.setEnabled(true);
                        preview.setText(I18n.tr("settings.listen_again"));
                        preview.setTextColor(COLOR_TEXT);
                        previewProgress.setVisibility(View.INVISIBLE);
                    }
                });
                animator.start();
            }
        });
        sheet.addView(previewBlock, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(58)));
        dialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {
            @Override public void onDismiss(android.content.DialogInterface ignored) {
                if (previewAnimator[0] != null) previewAnimator[0].cancel();
            }
        });

        TextView choose = customAudioAction(I18n.tr("settings.choose_an_audio_file"), false);
        choose.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                dialog.dismiss();
                selectedAudioSlot = slot;
                selectedAudioSummary = summary;
                sp.edit().putString("pending_custom_audio_slot", slot).apply();
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("audio/*");
                startActivityForResult(intent, REQUEST_PICK_OVERSPEED_AUDIO);
            }
        });
        sheet.addView(choose, actionLayoutParams(true));

        TextView record = customAudioAction(I18n.tr("settings.record_yourself"), false);
        record.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                dialog.dismiss();
                selectedAudioSlot = slot;
                selectedAudioSummary = summary;
                requestOrShowAlertRecorder();
            }
        });
        sheet.addView(record, actionLayoutParams(true));

        int audioMode = sp.getInt(CustomAlertAudio.modeKey(slot),
                CustomAlertAudio.MODE_DEFAULT);
        if (audioMode == CustomAlertAudio.MODE_RECORDING
                && CustomAlertAudio.hasAudio(this, slot)) {
            TextView export = customAudioAction(I18n.tr("settings.export_recording"), false);
            export.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) {
                    dialog.dismiss();
                    sp.edit().putString("pending_custom_audio_export_slot", slot).apply();
                    Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
                    intent.addCategory(Intent.CATEGORY_OPENABLE);
                    intent.setType("audio/mp4");
                    intent.putExtra(Intent.EXTRA_TITLE, exportRecordingFileName(slot));
                    startActivityForResult(intent, REQUEST_EXPORT_ALERT_RECORDING);
                }
            });
            sheet.addView(export, actionLayoutParams(true));
        }

        TextView reset = customAudioAction(I18n.tr("settings.restore_the_default_sound"), true);
        reset.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                CustomAlertAudio.reset(ModSettingsActivity.this, slot);
                sp.edit().putInt(CustomAlertAudio.modeKey(slot), CustomAlertAudio.MODE_DEFAULT)
                        .remove(CustomAlertAudio.nameKey(slot)).apply();
                if (summary != null) summary.setText(customAudioLabel(slot));
                dialog.dismiss();
            }
        });
        sheet.addView(reset, actionLayoutParams(true));
        showBottomSheet(dialog, sheet, dp(640));
    }

    private String exportRecordingFileName(String slot) {
        String readable;
        if ("overspeed".equals(slot)) readable = "qua_toc_do";
        else if (slot != null && slot.startsWith("current_"))
            readable = "toc_do_hien_tai_" + slot.substring("current_".length());
        else if (slot != null && slot.startsWith("next_"))
            readable = "toc_do_tiep_theo_" + slot.substring("next_".length());
        else readable = "canh_bao";
        return "WazeMod_" + readable + ".m4a";
    }

    private Runnable addHudFirmwareUi(LinearLayout root) {
        TextView check = customAudioAction(I18n.tr("settings.check_for_updates"), false);
        check.setTextColor(COLOR_ACCENT);
        check.setGravity(Gravity.CENTER);
        check.setLayoutParams(actionLayoutParams(true));
        TextView cancel = customAudioAction(I18n.tr("settings.cancel_hud_update"), true);
        cancel.setGravity(Gravity.CENTER);
        cancel.setLayoutParams(actionLayoutParams(true));
        return HudOta.addUi(this, root, check, cancel);
    }

    private TextView customAudioAction(String label, boolean destructive) {
        TextView action = new TextView(this);
        action.setText(label);
        action.setTextSize(16);
        action.setTextColor(destructive ? 0xFFFF6571 : COLOR_TEXT);
        action.setGravity(Gravity.CENTER_VERTICAL);
        action.setPadding(dp(16), 0, dp(16), 0);
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_CONTROL);
        background.setCornerRadius(dp(14));
        background.setStroke(dp(1), destructive ? 0x66FF6571 : COLOR_BORDER);
        action.setBackground(background);
        enableControlHover(action);
        return action;
    }

    private LinearLayout.LayoutParams actionLayoutParams(boolean margin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(54));
        if (margin) params.topMargin = dp(8);
        return params;
    }

    private String audioDisplayName(android.net.Uri uri) {
        android.database.Cursor cursor = null;
        try {
            cursor = getContentResolver().query(uri,
                    new String[]{android.provider.OpenableColumns.DISPLAY_NAME},
                    null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                String value = cursor.getString(0);
                if (value != null && !value.trim().isEmpty()) return value.trim();
            }
        } catch (Throwable ignored) {
        } finally {
            try { if (cursor != null) cursor.close(); } catch (Throwable ignored) { }
        }
        return I18n.tr("settings.custom_file");
    }

    private void requestOrShowAlertRecorder() {
        if (android.os.Build.VERSION.SDK_INT >= 23
                && checkSelfPermission(android.Manifest.permission.RECORD_AUDIO)
                != android.content.pm.PackageManager.PERMISSION_GRANTED) {
            pendingAlertRecordingPermission = true;
            requestPermissions(new String[]{android.Manifest.permission.RECORD_AUDIO},
                    REQUEST_RECORD_OVERSPEED_AUDIO);
            return;
        }
        showAlertRecordingDrawer();
    }

    private void showAlertRecordingDrawer() {
        if (selectedAudioSlot == null || selectedAudioSlot.isEmpty()) return;
        final android.app.Dialog dialog = new android.app.Dialog(this);
        alertRecordDialog = dialog;
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.record_your_own_alert"),
                I18n.tr("settings.tap_start_say_the_alert_phrase"));

        alertRecordStatus = new TextView(this);
        alertRecordStatus.setText(I18n.tr("settings.ready_to_record"));
        alertRecordStatus.setTextSize(22);
        alertRecordStatus.setTextColor(COLOR_TEXT);
        alertRecordStatus.setTypeface(Typeface.DEFAULT_BOLD);
        alertRecordStatus.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams statusLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(58));
        sheet.addView(alertRecordStatus, statusLp);

        FrameLayout progressShell = new FrameLayout(this);
        GradientDrawable shellBackground = new GradientDrawable();
        shellBackground.setColor(0xFF11131D);
        shellBackground.setCornerRadius(dp(10));
        shellBackground.setStroke(dp(1), 0xAA8B5CFF);
        progressShell.setBackground(shellBackground);
        progressShell.setPadding(dp(3), dp(3), dp(3), dp(3));

        alertRecordProgress = new ProgressBar(this, null,
                android.R.attr.progressBarStyleHorizontal);
        alertRecordProgress.setMax((int) MAX_RECORDING_MS);
        alertRecordProgress.setProgress(0);
        alertRecordProgress.setIndeterminate(false);
        alertRecordProgress.setProgressDrawable(synthwaveRecordingProgressDrawable());
        progressShell.addView(alertRecordProgress, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        LinearLayout.LayoutParams progressLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(14));
        progressLp.leftMargin = dp(12);
        progressLp.rightMargin = dp(12);
        progressLp.bottomMargin = dp(18);
        sheet.addView(progressShell, progressLp);

        alertRecordButton = customAudioAction(I18n.tr("settings.start_recording"), false);
        alertRecordButton.setGravity(Gravity.CENTER);
        alertRecordButton.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (!alertRecording) {
                    if (startAlertRecording()) {
                        alertRecordButton.setText(I18n.tr("settings.stop_recording"));
                        alertRecordStatus.setTextColor(0xFFFF5B86);
                    }
                } else {
                    stopAlertRecordingForReview();
                }
            }
        });
        sheet.addView(alertRecordButton, actionLayoutParams(false));

        alertRecordReviewActions = new LinearLayout(this);
        alertRecordReviewActions.setOrientation(LinearLayout.HORIZONTAL);
        alertRecordReviewActions.setGravity(Gravity.CENTER_VERTICAL);
        alertRecordReviewActions.setVisibility(View.GONE);
        TextView retry = customAudioAction(I18n.tr("settings.re_record"), false);
        retry.setGravity(Gravity.CENTER);
        retry.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                stopAlertRecordPreview();
                CustomAlertAudio.deleteQuietly(alertRecordingFile);
                alertRecordingFile = null;
                showRecorderReadyState();
                if (startAlertRecording()) {
                    alertRecordButton.setText(I18n.tr("settings.stop_recording"));
                    alertRecordStatus.setTextColor(0xFFFF5B86);
                }
            }
        });
        LinearLayout.LayoutParams retryLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        retryLp.rightMargin = dp(5);
        alertRecordReviewActions.addView(retry, retryLp);
        TextView preview = customAudioAction(I18n.tr("settings.preview_3"), false);
        preview.setGravity(Gravity.CENTER);
        preview.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { previewPendingAlertRecording(); }
        });
        LinearLayout.LayoutParams previewLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        previewLp.leftMargin = dp(5);
        alertRecordReviewActions.addView(preview, previewLp);
        sheet.addView(alertRecordReviewActions, actionLayoutParams(true));

        LinearLayout finalActions = new LinearLayout(this);
        finalActions.setOrientation(LinearLayout.HORIZONTAL);
        finalActions.setGravity(Gravity.CENTER_VERTICAL);

        TextView cancel = customAudioAction(I18n.tr("hud_link.cancel"), true);
        cancel.setGravity(Gravity.CENTER);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                discardAlertRecording();
                dialog.dismiss();
            }
        });
        LinearLayout.LayoutParams cancelLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        cancelLp.rightMargin = dp(5);
        finalActions.addView(cancel, cancelLp);
        alertRecordSaveButton = customAudioAction(I18n.tr("settings.save"), false);
        alertRecordSaveButton.setGravity(Gravity.CENTER);
        alertRecordSaveButton.setTextColor(COLOR_ACCENT);
        alertRecordSaveButton.setEnabled(false);
        alertRecordSaveButton.setAlpha(0.45f);
        alertRecordSaveButton.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { savePendingAlertRecording(); }
        });
        LinearLayout.LayoutParams saveLp = new LinearLayout.LayoutParams(0, dp(52), 1f);
        saveLp.leftMargin = dp(5);
        finalActions.addView(alertRecordSaveButton, saveLp);
        sheet.addView(finalActions, actionLayoutParams(true));
        dialog.setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {
            @Override public void onCancel(android.content.DialogInterface d) {
                discardAlertRecording();
            }
        });
        showBottomSheet(dialog, sheet, dp(540));
    }

    /** Neon cyan-to-magenta fill over a dark violet track, clipped by ProgressBar. */
    private android.graphics.drawable.Drawable synthwaveRecordingProgressDrawable() {
        GradientDrawable track = new GradientDrawable();
        track.setColor(0xFF27223D);
        track.setCornerRadius(dp(7));

        GradientDrawable neon = new GradientDrawable(
                GradientDrawable.Orientation.LEFT_RIGHT,
                new int[]{0xFF19E6FF, 0xFF7A5CFF, 0xFFFF2D95});
        neon.setCornerRadius(dp(7));
        android.graphics.drawable.ClipDrawable clipped =
                new android.graphics.drawable.ClipDrawable(neon, Gravity.LEFT,
                        android.graphics.drawable.ClipDrawable.HORIZONTAL);
        android.graphics.drawable.LayerDrawable layers =
                new android.graphics.drawable.LayerDrawable(
                        new android.graphics.drawable.Drawable[]{track, clipped});
        layers.setId(0, android.R.id.background);
        layers.setId(1, android.R.id.progress);
        return layers;
    }

    private boolean startAlertRecording() {
        discardAlertRecording();
        String slot = selectedAudioSlot;
        if (slot == null || slot.isEmpty()) return false;
        try {
            alertRecordingFile = CustomAlertAudio.recordingTempFile(this, slot);
            CustomAlertAudio.deleteQuietly(alertRecordingFile);
            android.media.MediaRecorder recorder = android.os.Build.VERSION.SDK_INT >= 31
                    ? new android.media.MediaRecorder(this) : new android.media.MediaRecorder();
            recorder.setAudioSource(android.media.MediaRecorder.AudioSource.MIC);
            recorder.setOutputFormat(android.media.MediaRecorder.OutputFormat.MPEG_4);
            recorder.setAudioEncoder(android.media.MediaRecorder.AudioEncoder.AAC);
            recorder.setAudioEncodingBitRate(96_000);
            recorder.setAudioSamplingRate(44_100);
            recorder.setMaxDuration((int) MAX_RECORDING_MS);
            recorder.setOutputFile(alertRecordingFile.getAbsolutePath());
            recorder.prepare();
            recorder.start();
            alertRecorder = recorder;
            alertRecording = true;
            alertRecordingStartedAt = android.os.SystemClock.elapsedRealtime();
            if (alertRecordProgress != null) alertRecordProgress.setProgress(0);
            alertRecordingHandler.removeCallbacks(alertRecordingTimeout);
            alertRecordingHandler.removeCallbacks(alertRecordingProgressTick);
            alertRecordingHandler.postDelayed(alertRecordingTimeout, MAX_RECORDING_MS);
            alertRecordingHandler.post(alertRecordingProgressTick);
            return true;
        } catch (Throwable error) {
            discardAlertRecording();
            android.widget.Toast.makeText(this, I18n.tr("settings.couldnt_open_the_microphone"),
                    android.widget.Toast.LENGTH_LONG).show();
            return false;
        }
    }

    private void stopAlertRecordingForReview() {
        alertRecordingHandler.removeCallbacks(alertRecordingTimeout);
        alertRecordingHandler.removeCallbacks(alertRecordingProgressTick);
        android.media.MediaRecorder recorder = alertRecorder;
        alertRecorder = null;
        boolean stopped = false;
        if (recorder != null) {
            try { recorder.stop(); stopped = true; } catch (Throwable ignored) { }
            try { recorder.release(); } catch (Throwable ignored) { }
        }
        alertRecording = false;
        if (stopped && alertRecordingFile != null
                && CustomAlertAudio.durationMs(alertRecordingFile) > 0L) {
            if (alertRecordStatus != null) {
                long duration = CustomAlertAudio.durationMs(alertRecordingFile);
                alertRecordStatus.setText(String.format(java.util.Locale.US,
                        I18n.tr("settings.recorded_1f_s"), duration / 1000f));
                alertRecordStatus.setTextColor(0xFF19E6FF);
            }
            if (alertRecordProgress != null) alertRecordProgress.setProgress(
                    (int) Math.min(MAX_RECORDING_MS,
                            Math.max(0L, CustomAlertAudio.durationMs(alertRecordingFile))));
            if (alertRecordButton != null) alertRecordButton.setVisibility(View.GONE);
            if (alertRecordReviewActions != null) alertRecordReviewActions.setVisibility(View.VISIBLE);
            if (alertRecordSaveButton != null) {
                alertRecordSaveButton.setEnabled(true);
                alertRecordSaveButton.setAlpha(1f);
            }
            return;
        }
        CustomAlertAudio.deleteQuietly(alertRecordingFile);
        alertRecordingFile = null;
        showRecorderReadyState();
        android.widget.Toast.makeText(this,
                I18n.tr("settings.the_recording_is_too_short_or"), android.widget.Toast.LENGTH_LONG).show();
    }

    private void savePendingAlertRecording() {
        stopAlertRecordPreview();
        String slot = selectedAudioSlot;
        java.io.File recording = alertRecordingFile;
        alertRecordingFile = null;
        if (slot != null && !slot.isEmpty()
                && CustomAlertAudio.commitRecording(this, slot, recording)) {
            sp.edit().putInt(CustomAlertAudio.modeKey(slot), CustomAlertAudio.MODE_RECORDING)
                    .putString(CustomAlertAudio.nameKey(slot), I18n.tr("settings.self_recorded")).apply();
            if (selectedAudioSummary != null)
                selectedAudioSummary.setText(customAudioLabel(slot));
            android.widget.Toast.makeText(this, I18n.tr("settings.self_recording_saved"),
                    android.widget.Toast.LENGTH_SHORT).show();
            if (alertRecordDialog != null) alertRecordDialog.dismiss();
        } else {
            CustomAlertAudio.deleteQuietly(recording);
            android.widget.Toast.makeText(this,
                    I18n.tr("settings.the_recording_is_too_short_or"),
                    android.widget.Toast.LENGTH_LONG).show();
        }
        selectedAudioSlot = "";
        selectedAudioSummary = null;
        alertRecordDialog = null;
        alertRecordStatus = null;
        alertRecordProgress = null;
        alertRecordButton = null;
        alertRecordReviewActions = null;
        alertRecordSaveButton = null;
        alertRecordingStartedAt = 0L;
    }

    private void showRecorderReadyState() {
        if (alertRecordStatus != null) {
            alertRecordStatus.setText(I18n.tr("settings.ready_to_record"));
            alertRecordStatus.setTextColor(COLOR_TEXT);
        }
        if (alertRecordProgress != null) alertRecordProgress.setProgress(0);
        if (alertRecordButton != null) {
            alertRecordButton.setText(I18n.tr("settings.start_recording"));
            alertRecordButton.setVisibility(View.VISIBLE);
        }
        if (alertRecordReviewActions != null) alertRecordReviewActions.setVisibility(View.GONE);
        if (alertRecordSaveButton != null) {
            alertRecordSaveButton.setEnabled(false);
            alertRecordSaveButton.setAlpha(0.45f);
        }
    }

    private void previewPendingAlertRecording() {
        stopAlertRecordPreview();
        java.io.File recording = alertRecordingFile;
        if (recording == null || !recording.isFile()) return;
        try {
            android.media.MediaPlayer player = new android.media.MediaPlayer();
            alertRecordPreviewPlayer = player;
            player.setAudioAttributes(new android.media.AudioAttributes.Builder()
                    .setUsage(android.media.AudioAttributes.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE)
                    .setContentType(android.media.AudioAttributes.CONTENT_TYPE_SPEECH).build());
            player.setDataSource(recording.getAbsolutePath());
            player.setOnCompletionListener(new android.media.MediaPlayer.OnCompletionListener() {
                @Override public void onCompletion(android.media.MediaPlayer completed) {
                    stopAlertRecordPreview();
                    if (alertRecordStatus != null) alertRecordStatus.setText(I18n.tr("settings.finished_listening_ready_to_save"));
                }
            });
            player.prepare();
            player.start();
            if (alertRecordStatus != null) alertRecordStatus.setText(I18n.tr("settings.playing_the_recording"));
        } catch (Throwable error) {
            stopAlertRecordPreview();
            android.widget.Toast.makeText(this, I18n.tr("settings.couldnt_play_the_recording"),
                    android.widget.Toast.LENGTH_SHORT).show();
        }
    }

    private void stopAlertRecordPreview() {
        android.media.MediaPlayer player = alertRecordPreviewPlayer;
        alertRecordPreviewPlayer = null;
        if (player != null) {
            try { player.stop(); } catch (Throwable ignored) { }
            try { player.release(); } catch (Throwable ignored) { }
        }
    }

    private void discardAlertRecording() {
        stopAlertRecordPreview();
        alertRecordingHandler.removeCallbacks(alertRecordingTimeout);
        alertRecordingHandler.removeCallbacks(alertRecordingProgressTick);
        android.media.MediaRecorder recorder = alertRecorder;
        alertRecorder = null;
        if (recorder != null) {
            try { recorder.stop(); } catch (Throwable ignored) { }
            try { recorder.release(); } catch (Throwable ignored) { }
        }
        alertRecording = false;
        CustomAlertAudio.deleteQuietly(alertRecordingFile);
        alertRecordingFile = null;
        alertRecordingStartedAt = 0L;
        if (alertRecordProgress != null) alertRecordProgress.setProgress(0);
    }

    private void addGpsSettings(LinearLayout root) {
        addGpsQualityCard(root);
        addSection(root, I18n.tr("settings.gps_use_only_one_of_the"));
        final SeekBar[] pctRef = new SeekBar[1];
        final SeekBar offBar = addSlider(root, I18n.tr("settings.gps_speed_calibration_km_h"), "gps_offset",
                0, 20, 1, 0, " km/h", true,
                I18n.tr("settings.adjusting_gps_can_cause_speed_errors"),
                new Runnable() { @Override public void run() { resetSlider(pctRef[0], 0); } });
        pctRef[0] = addSlider(root, I18n.tr("settings.gps_speed_calibration_add"), "gps_pct",
                0, 20, 1, 0, "%", true,
                I18n.tr("settings.adds_a_proportion_matches_the_cars"),
                new Runnable() { @Override public void run() { resetSlider(offBar, 0); } });
        addInfoCard(root, I18n.tr("settings.android_auto_uses_the_calibrated_gps"),
                I18n.tr("settings.only_works_with_the_android_auto"));
    }

    /** Live diagnostic page fed by Waze's existing location callback; no second GPS listener. */
    private void addGpsQualityCard(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(15), dp(16), dp(14));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(16));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.bottomMargin = dp(14);
        root.addView(card, cardLp);

        LinearLayout hero = new LinearLayout(this);
        hero.setOrientation(LinearLayout.HORIZONTAL);
        hero.setGravity(Gravity.CENTER_VERTICAL);
        gpsDetailSignal = new GpsSignalView(this);
        hero.addView(gpsDetailSignal, new LinearLayout.LayoutParams(dp(52), dp(52)));

        LinearLayout titleCol = new LinearLayout(this);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(this);
        title.setText(I18n.tr("settings.current_positioning_quality"));
        title.setTextSize(18);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        titleCol.addView(title);
        gpsDetailStatus = new TextView(this);
        gpsDetailStatus.setTextSize(15);
        gpsDetailStatus.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams statusLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        statusLp.topMargin = dp(3);
        titleCol.addView(gpsDetailStatus, statusLp);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleLp.leftMargin = dp(14);
        hero.addView(titleCol, titleLp);
        card.addView(hero);

        View divider = new View(this);
        divider.setBackgroundColor(COLOR_BORDER);
        LinearLayout.LayoutParams dividerLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
        dividerLp.topMargin = dp(13);
        dividerLp.bottomMargin = dp(7);
        card.addView(divider, dividerLp);

        gpsDetailAccuracy = addGpsMetric(card, I18n.tr("settings.accuracy"));
        gpsDetailAge = addGpsMetric(card, I18n.tr("settings.last_update"));
        gpsDetailSource = addGpsMetric(card, I18n.tr("settings.data_source"));
        gpsDetailLevel = addGpsMetric(card, I18n.tr("settings.signal_level"));

        TextView note = new TextView(this);
        note.setText(I18n.tr("settings.quality_is_calculated_from_the_position"));
        note.setTextSize(12);
        note.setTextColor(COLOR_MUTED);
        note.setPadding(0, dp(9), 0, 0);
        card.addView(note);

        gpsUiHandler.removeCallbacks(gpsUiTick);
        gpsUiHandler.post(gpsUiTick);
    }

    private TextView addGpsMetric(LinearLayout card, String label) {
        LinearLayout metric = new LinearLayout(this);
        metric.setOrientation(LinearLayout.HORIZONTAL);
        metric.setGravity(Gravity.CENTER_VERTICAL);
        metric.setPadding(0, dp(6), 0, dp(6));
        TextView name = new TextView(this);
        name.setText(label);
        name.setTextSize(14);
        name.setTextColor(COLOR_MUTED);
        metric.addView(name, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView value = new TextView(this);
        value.setText("--");
        value.setTextSize(15);
        value.setTextColor(COLOR_TEXT);
        value.setTypeface(Typeface.DEFAULT_BOLD);
        metric.addView(value);
        card.addView(metric);
        return value;
    }

    private void updateGpsQualityCard() {
        if (gpsDetailSignal == null || gpsDetailStatus == null) return;
        int level = Gateway.gpsInstantSignalLevel();
        gpsDetailSignal.setLevel(level);
        String[] labels = {I18n.tr("settings.no_signal_yet"), I18n.tr("settings.very_weak"), I18n.tr("settings.weak"), I18n.tr("settings.good"), I18n.tr("settings.excellent")};
        gpsDetailStatus.setText(labels[level]);
        gpsDetailStatus.setTextColor(GpsSignalView.colorForLevel(level));

        double accuracy = Gateway.gpsAccuracyMeters();
        if (accuracy > 0.0) {
            gpsDetailAccuracy.setText(accuracy < 10.0
                    ? String.format(java.util.Locale.US, "±%.1f m", accuracy)
                    : "±" + Math.round(accuracy) + " m");
        } else {
            gpsDetailAccuracy.setText(I18n.tr("settings.no_data_yet"));
        }

        long age = Gateway.gpsFixAgeMs();
        if (age == Long.MAX_VALUE) gpsDetailAge.setText(I18n.tr("settings.no_fix_yet"));
        else if (age < 1500L) gpsDetailAge.setText(I18n.tr("settings.just_updated"));
        else gpsDetailAge.setText(I18n.f("settings.0_s_ago", age / 1000L));

        String source = Gateway.gpsFixSource();
        gpsDetailSource.setText(source == null || source.length() == 0 ? "--" : source);
        gpsDetailLevel.setText(level + " / 4");
        gpsDetailLevel.setTextColor(GpsSignalView.colorForLevel(level));
    }

    private void addFloatSpeedoSettings(LinearLayout root) {
        addSection(root, I18n.tr("settings.floating_gauge_on_the_map"));
        addSwitch(root, I18n.tr("settings.floating_speedometer_on_the_map_drag"),
                "float_speedo", true);
        addSwitch(root, I18n.tr("settings.press_and_hold_floatspeedo_to_open"),
                "float_speedo_long_press_hud", true);
        final FloatSpeedoPreview[] preview = new FloatSpeedoPreview[1];
        addFloatSpeedoLayoutPicker(root, preview);
        addSwitch(root, I18n.tr("settings.bold_the_maximum_minimum_speed_number"),
                "float_speed_sign_bold", true, new BoolCb() {
                    @Override public void on(boolean enabled) {
                        if (preview[0] != null) preview[0].setBold(enabled);
                    }
                });
        preview[0] = addFloatSpeedoPreview(root);
        addSlider(root, I18n.tr("settings.floating_gauge_size_2"), "fs_size", 80, 220, 10, 130,
                "%", false, null, new Runnable() {
                    @Override public void run() {
                        if (preview[0] != null)
                            preview[0].setSizePercent(sp.getInt("fs_size", 130));
                    }
                });

    }

    private void addFloatSpeedoLayoutPicker(LinearLayout root,
                                            final FloatSpeedoPreview[] livePreview) {
        root.addView(pickerTitle(I18n.tr("settings.floating_gauge_style")), pickerTitleParams());

        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setPadding(dp(2), dp(2), dp(2), dp(2));
        int available = getResources().getDisplayMetrics().widthPixels - dp(56);
        int cardWidth = Math.max(dp(150), Math.min(dp(220), available / 2));
        int cardHeight = dp(205);

        final FrameLayout style1 = floatSpeedoLayoutCard(1, I18n.tr("settings.pill"));
        final FrameLayout style2 = floatSpeedoLayoutCard(2, I18n.tr("settings.badge"));
        final FrameLayout style3 = floatSpeedoLayoutCard(3, I18n.tr("settings.two_clusters"));
        final FrameLayout style4 = floatSpeedoLayoutCard(4, I18n.tr("settings.default"));
        final FrameLayout[] all = {style4, style1, style2, style3};
        final int[] values = {4, 1, 2, 3};

        for (int i = 0; i < all.length; i++) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(cardWidth, cardHeight);
            if (i > 0) params.leftMargin = dp(12);
            cards.addView(all[i], params);
        }

        android.widget.HorizontalScrollView carousel =
                new android.widget.HorizontalScrollView(this);
        carousel.setHorizontalScrollBarEnabled(false);
        carousel.setClipToPadding(false);
        carousel.addView(cards, new android.widget.HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(carousel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int selected = sp.getInt("fs_layout", 4);
        if (selected < 1 || selected > 4) selected = 4;
        updateFloatSpeedoLayoutCards(all, values, selected);
        for (int i = 0; i < all.length; i++) {
            final int value = values[i];
            all[i].setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    sp.edit().putInt("fs_layout", value).apply();
                    updateFloatSpeedoLayoutCards(all, values, value);
                    if (livePreview[0] != null) livePreview[0].setLayoutStyle(value);
                }
            });
        }
    }

    private FrameLayout floatSpeedoLayoutCard(final int style, String label) {
        String asset = style == 1 ? "settings_demo/preset_1.png"
                : style == 2 ? "settings_demo/preset_2.png"
                : style == 3 ? "settings_demo/preset_3.png"
                : "settings_demo/preset_default.png";
        return bubbleLayoutCard(asset, label, true);
    }

    /** Android Auto deliberately exposes only presets 2, 3 and 4; preset 3 is current/default. */
    private void addAaSpeedoLayoutPicker(LinearLayout root) {
        root.addView(pickerTitle(I18n.tr("settings.android_auto_gauge_style")), pickerTitleParams());

        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setPadding(dp(2), dp(2), dp(2), dp(2));
        int available = getResources().getDisplayMetrics().widthPixels - dp(56);
        int cardWidth = Math.max(dp(150), Math.min(dp(220), available / 2));
        int cardHeight = dp(205);

        final FrameLayout current = bubbleLayoutCard(
                "settings_demo/preset_3.png", I18n.tr("settings.two_clusters_current"), true);
        final FrameLayout badge = bubbleLayoutCard(
                "settings_demo/preset_2.png", I18n.tr("settings.badge"), true);
        final FrameLayout signs = bubbleLayoutCard(
                "settings_demo/preset_default.png", I18n.tr("settings.speed_sign_only"), true);
        final FrameLayout[] all = {current, badge, signs};
        final int[] values = {3, 2, 4};

        for (int i = 0; i < all.length; i++) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(cardWidth, cardHeight);
            if (i > 0) params.leftMargin = dp(12);
            cards.addView(all[i], params);
        }

        android.widget.HorizontalScrollView carousel =
                new android.widget.HorizontalScrollView(this);
        carousel.setHorizontalScrollBarEnabled(false);
        carousel.setClipToPadding(false);
        carousel.addView(cards, new android.widget.HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(carousel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int selected = sp.getInt("aa_fs_layout", 3);
        if (selected != 2 && selected != 4) selected = 3;
        updateFloatSpeedoLayoutCards(all, values, selected);
        for (int i = 0; i < all.length; i++) {
            final int value = values[i];
            all[i].setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    sp.edit().putInt("aa_fs_layout", value).apply();
                    updateFloatSpeedoLayoutCards(all, values, value);
                }
            });
        }
    }

    private void addAaConnectionSettings(LinearLayout root) {
        addSwitch(root, I18n.tr("settings.always_show_the_current_street_when_free"),
                "aa_force_current_street", false);
        addChoice(root, I18n.tr("settings.destination_suggestion_widget"), "aa_suggest_widget_mode",
                new int[]{0, 1, 2, 3},
                new String[]{I18n.tr("settings.always_hidden"), I18n.tr("settings.hide_after_10_seconds"), I18n.tr("settings.hide_after_1_minute"), I18n.tr("settings.waze_default")}, 1);
        addSwitch(root, I18n.tr("settings.keep_the_map_on_the_phone"), "phone_map_while_projected", true);
        addSwitch(root, I18n.tr("settings.close_the_app_when_android_auto"),
                "aa_close_on_disconnect", true);
    }

    /** The phone's upcoming-alert rail (V1 list or V2 distance rail), drawn on the Android Auto map. */
    private void addAaAlertRailSettings(LinearLayout root) {
        addSwitch(root, I18n.tr("settings.upcoming_alert_list_on_android_auto"),
                "aa_alert_rail", false);
        addChoice(root, I18n.tr("settings.alert_list_style_on_android_auto"), "aa_rail_style",
                new int[]{1, 0}, new String[]{"V2", "V1"}, 0);
        addChoice(root, I18n.tr("settings.number_of_alerts_shown_on_android"), "aa_rail_count",
                new int[]{1, 2, 3}, new String[]{I18n.tr("settings.1_item"), I18n.tr("settings.2_items"), I18n.tr("settings.3_items")}, 3);
        addChoice(root, I18n.tr("settings.alert_list_position_on_android_auto"), "aa_rail_position",
                new int[]{0, 1}, new String[]{I18n.tr("settings.right_edge"), I18n.tr("settings.left_edge")}, 0);
        addSlider(root, I18n.tr("settings.android_auto_alert_list_size"), "aa_rail_size", 60, 180, 10, 100,
                "%", false, null, null);
    }

    /** Pulsing red glow around the Android Auto map while over the speed limit. */
    private void addAaOverspeedEdgeSetting(LinearLayout root) {
        TextView title = pickerTitle(I18n.tr("settings.over_speed_effect_on_android_auto"));
        root.addView(title, pickerTitleParams());

        final FrameLayout none = bubbleLayoutCard(
                "settings_demo/AA_OverSpeed_Effect_None.png", I18n.tr("settings.no_effect"), true);
        final FrameLayout edge = bubbleLayoutCard(
                "settings_demo/AA_OverSpeed_Effect_High.png", I18n.tr("settings.strong_effect"), true);

        // Same card sizing as the phone over-speed picker: side by side on a wide screen,
        // a carousel with the next card peeking on a phone.
        float density = getResources().getDisplayMetrics().density;
        boolean wide = getResources().getDisplayMetrics().widthPixels / density >= 700;
        int available = getResources().getDisplayMetrics().widthPixels - dp(wide ? 72 : 36);
        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setGravity(Gravity.CENTER_VERTICAL);
        FrameLayout[] choices = {none, edge};
        for (int i = 0; i < choices.length; i++) {
            LinearLayout.LayoutParams lp;
            if (wide) {
                lp = new LinearLayout.LayoutParams(0, dp(230), 1f);
            } else {
                int cardWidth = Math.min(dp(252), Math.max(dp(210), (int) (available * 0.74f)));
                lp = new LinearLayout.LayoutParams(cardWidth, (int) (cardWidth / 1.8f) + dp(42));
            }
            if (i > 0) lp.leftMargin = dp(10);
            cards.addView(choices[i], lp);
        }
        if (wide) {
            root.addView(cards, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else {
            android.widget.HorizontalScrollView carousel =
                    new android.widget.HorizontalScrollView(this);
            carousel.setHorizontalScrollBarEnabled(false);
            carousel.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
            carousel.addView(cards, new android.widget.HorizontalScrollView.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(carousel, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        boolean on = sp.getBoolean("aa_overspeed_edge", false);
        styleBubbleLayoutCard(none, !on);
        styleBubbleLayoutCard(edge, on);
        none.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sp.edit().putBoolean("aa_overspeed_edge", false).apply();
                styleBubbleLayoutCard(none, true);
                styleBubbleLayoutCard(edge, false);
            }
        });
        edge.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sp.edit().putBoolean("aa_overspeed_edge", true).apply();
                styleBubbleLayoutCard(none, false);
                styleBubbleLayoutCard(edge, true);
            }
        });

        addChoice(root, I18n.tr("settings.effect_level_on_android_auto"), "aa_overspeed_edge_level",
                new int[]{0, 1, 2}, new String[]{I18n.tr("settings.light_red"), I18n.tr("settings.medium_red"), I18n.tr("settings.strong_red")}, 1);
    }

    private void addAaSpeedoPositionChoice(LinearLayout root) {
        addChoice(root, I18n.tr("settings.android_auto_gauge_position"), "aa_fs_position",
                new int[]{1, 3, 0, 2, 4},
                new String[]{I18n.tr("settings.top_left"), I18n.tr("settings.top_right"),
                        I18n.tr("settings.bottom_left"), I18n.tr("settings.bottom_right"), I18n.tr("settings.free_drag_and_drop_unstable")},
                1);
    }

    private void updateFloatSpeedoLayoutCards(FrameLayout[] cards, int[] values, int selected) {
        for (int i = 0; i < cards.length; i++) {
            styleBubbleLayoutCard(cards[i], selected == values[i]);
        }
    }

    private final class NativeSpeedoPreview {
        final View gauge;

        NativeSpeedoPreview(View gauge) {
            this.gauge = gauge;
        }

        void setSizePercent(int percent) {
            final float scale = Math.max(1f, Math.min(2f, percent / 100f));
            gauge.post(new Runnable() {
                @Override public void run() {
                    gauge.setPivotX(gauge.getWidth() / 2f);
                    gauge.setPivotY(gauge.getHeight() / 2f);
                    gauge.setScaleX(scale);
                    gauge.setScaleY(scale);
                    gauge.invalidate();
                }
            });
        }
    }

    /** Preview built from Waze's own speedometer XML and custom view classes. */
    private NativeSpeedoPreview addNativeSpeedoPreview(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(14), dp(10), dp(14), dp(12));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(COLOR_CONTROL);
        cardBg.setCornerRadius(dp(14));
        cardBg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(cardBg);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(8);
        root.addView(card, cardLp);

        TextView caption = new TextView(this);
        caption.setText(I18n.tr("settings.preview_wazes_original_speedometer"));
        caption.setTextSize(14);
        caption.setTextColor(COLOR_MUTED);
        card.addView(caption);

        FrameLayout stage = new FrameLayout(this);
        stage.setClipChildren(false);
        stage.setClipToPadding(false);
        GradientDrawable stageBg = new GradientDrawable();
        stageBg.setColor(0xFFE5EAED);
        stageBg.setCornerRadius(dp(12));
        stage.setBackground(stageBg);
        LinearLayout.LayoutParams stageLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(240));
        stageLp.topMargin = dp(8);
        card.addView(stage, stageLp);

        View gauge = null;
        try {
            int layoutId = wazeResourceId("speedometer", "layout");
            if (layoutId != 0) {
                gauge = android.view.LayoutInflater.from(this)
                        .inflate(layoutId, stage, false);
                setPreviewText(gauge, "speedText", "50");
                setPreviewText(gauge, "speedUnits", "km/h");
                int warningId = wazeResourceId("speedLimitWarnLayout", "id");
                View warning = warningId == 0 ? null : gauge.findViewById(warningId);
                if (warning != null) warning.setVisibility(View.GONE);
            }
        } catch (Throwable ignored) { }

        if (gauge == null) gauge = fallbackNativeSpeedoPreview();
        gauge.setClickable(false);
        gauge.setFocusable(false);
        FrameLayout.LayoutParams gaugeLp = new FrameLayout.LayoutParams(dp(110), dp(110));
        gaugeLp.gravity = Gravity.CENTER;
        stage.addView(gauge, gaugeLp);

        NativeSpeedoPreview preview = new NativeSpeedoPreview(gauge);
        preview.setSizePercent(sp.getInt("native_speedo_size", 100));
        return preview;
    }

    private int wazeResourceId(String name, String type) {
        int id = getResources().getIdentifier(name, type, "com.waze");
        if (id == 0) id = getResources().getIdentifier(name, type, getPackageName());
        return id;
    }

    private void setPreviewText(View root, String idName, String value) {
        int id = wazeResourceId(idName, "id");
        if (id == 0) return;
        View target = root.findViewById(id);
        if (target instanceof TextView) ((TextView) target).setText(value);
    }

    private View fallbackNativeSpeedoPreview() {
        TextView text = new TextView(this);
        text.setText("50\nkm/h");
        text.setTextColor(0xFFFFFFFF);
        text.setTextSize(24);
        text.setGravity(Gravity.CENTER);
        text.setTypeface(Typeface.DEFAULT_BOLD);
        text.setBackground(previewOval(0xFF34383D, dp(6), 0xFF69717A));
        return text;
    }

    private final class FloatSpeedoPreview {
        final FloatSpeedo gauge;
        int style;
        int sizePercent;
        boolean bold;

        FloatSpeedoPreview(FloatSpeedo gauge) {
            this.gauge = gauge;
        }

        void setSizePercent(int percent) {
            sizePercent = percent;
            apply();
        }

        void setBold(boolean bold) {
            this.bold = bold;
            apply();
        }

        void setLayoutStyle(int style) {
            this.style = style < 1 || style > 4 ? 4 : style;
            apply();
        }

        private void apply() {
            gauge.configurePreview(style, sizePercent <= 0 ? 130 : sizePercent, bold);
            gauge.post(new Runnable() {
                @Override public void run() {
                    gauge.setPivotX(gauge.getWidth() / 2f);
                    gauge.setPivotY(gauge.getHeight() / 2f);
                }
            });
        }
    }

    private FloatSpeedoPreview addFloatSpeedoPreview(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(14), dp(10), dp(14), dp(10));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(COLOR_CONTROL);
        cardBg.setCornerRadius(dp(14));
        cardBg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(cardBg);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(8);
        root.addView(card, cardLp);

        TextView caption = new TextView(this);
        caption.setText(I18n.tr("settings.preview"));
        caption.setTextSize(14);
        caption.setTextColor(COLOR_MUTED);
        card.addView(caption);

        FrameLayout stage = new FrameLayout(this);
        stage.setClipChildren(false);
        stage.setClipToPadding(false);
        LinearLayout.LayoutParams stageLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(270));
        card.addView(stage, stageLp);

        FloatSpeedo gauge = new FloatSpeedo(this, true);
        gauge.setClickable(false);
        gauge.setFocusable(false);

        FrameLayout.LayoutParams gaugeLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gaugeLp.gravity = Gravity.CENTER;
        stage.addView(gauge, gaugeLp);

        FloatSpeedoPreview preview = new FloatSpeedoPreview(gauge);
        preview.setLayoutStyle(sp.getInt("fs_layout", 4));
        preview.setBold(sp.getBoolean("float_speed_sign_bold", true));
        preview.setSizePercent(sp.getInt("fs_size", 130));
        return preview;
    }

    private TextView previewSpeedText(String value, int sizeSp, int color) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextSize(sizeSp);
        text.setTextColor(color);
        text.setGravity(Gravity.CENTER);
        text.setIncludeFontPadding(false);
        ModTypeface.applySpeed(text);
        return text;
    }

    private void applyPreviewSpeedWeight(TextView text, boolean bold, float strokeRatio) {
        text.getPaint().setStyle(bold
                ? android.graphics.Paint.Style.FILL_AND_STROKE
                : android.graphics.Paint.Style.FILL);
        text.getPaint().setStrokeWidth(bold ? text.getTextSize() * strokeRatio : 0f);
        text.invalidate();
    }

    private GradientDrawable previewOval(int fill, int strokeWidth, int strokeColor) {
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(fill);
        if (strokeWidth > 0) background.setStroke(strokeWidth, strokeColor);
        return background;
    }


    private void addBubbleSettings(LinearLayout root) {
        addSection(root, I18n.tr("settings.traffic_bubble"));
        addSwitch(root, I18n.tr("settings.traffic_bubble_floating_over_other_apps"),
                "bubble", false, new BoolCb() {
                    @Override public void on(boolean v) {
                        if (v) {
                            if (!Bubble.canShow(ModSettingsActivity.this)) {
                                Bubble.requestPermission(ModSettingsActivity.this);
                            }
                            Bubble.installAutoHide(getApplicationContext());
                            android.widget.Toast.makeText(ModSettingsActivity.this,
                                    I18n.tr("settings.the_bubble_appears_when_you_leave"),
                                    android.widget.Toast.LENGTH_LONG).show();
                        } else {
                            Bubble.hide();
                            BubbleKeepAliveService.sync(ModSettingsActivity.this);
                        }
                    }
                });
        addBubbleLayoutPicker(root);
        addSwitch(root, I18n.tr("settings.alert_rail_v2_on_horizontal_vertical"), "bubble_alert_rail_v2", false,
                new BoolCb() { @Override public void on(boolean enabled) { Bubble.refresh(); } });
        addSlider(root, I18n.tr("settings.bubble_size"), "bub_size", 80, 200, 10, 100,
                "%", false, null, new Runnable() {
                    @Override public void run() { Bubble.refresh(); }
                });
        addSwitch(root, I18n.tr("settings.tap_the_speed_limit_sign_to"), "bubble_speed_report", true);
    }

    /** Live status of the xADAS link, with what to do next, so a silent switch is never a mystery. */
    private void addXadasStatus(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);
        xadasStatusTitle = new TextView(this);
        xadasStatusTitle.setTextSize(16);
        xadasStatusTitle.setTextColor(COLOR_TEXT);
        xadasStatusTitle.setTypeface(Typeface.DEFAULT_BOLD);
        card.addView(xadasStatusTitle);
        xadasStatusDetail = new TextView(this);
        xadasStatusDetail.setTextSize(14);
        xadasStatusDetail.setTextColor(COLOR_MUTED);
        xadasStatusDetail.setPadding(0, dp(5), 0, 0);
        card.addView(xadasStatusDetail);
        xadasOpenButton = tripExportButton(I18n.tr("settings.open_xadas"), COLOR_ACCENT, COLOR_CONTROL, COLOR_ACCENT);
        xadasOpenButton.setTextSize(17);
        xadasOpenButton.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                if (!XadasLink.openApp(ModSettingsActivity.this)) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.couldnt_open_xadas"), android.widget.Toast.LENGTH_SHORT).show();
                }
            }
        });
        LinearLayout.LayoutParams buttonLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(52));
        buttonLp.topMargin = dp(10);
        card.addView(xadasOpenButton, buttonLp);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(card, lp);
        xadasUiHandler.removeCallbacks(xadasUiTick);
        xadasUiHandler.post(xadasUiTick);
    }

    private void updateXadasStatus() {
        if (xadasStatusTitle == null) return;
        try {
            Gateway.measuredGapMetres();            // also drives the connection while Settings is open
            int state = XadasLink.uiState();
            String title;
            String detail;
            boolean canOpen = true;
            switch (state) {
                case XadasLeadPolicy.UI_OFF:
                    title = I18n.tr("settings.turned_off");
                    detail = I18n.tr("settings.turn_on_the_switch_above_to_2");
                    canOpen = false;
                    break;
                case XadasLeadPolicy.UI_NOT_INSTALLED:
                    title = I18n.tr("settings.xadas_not_installed");
                    detail = I18n.tr("settings.install_the_xadas_app_the_pro");
                    canOpen = false;
                    break;
                case XadasLeadPolicy.UI_UNTRUSTED:
                    title = I18n.tr("settings.the_xadas_on_this_device_is");
                    detail = I18n.tr("settings.the_xadas_apps_signature_doesnt_match");
                    break;
                case XadasLeadPolicy.UI_API_OLD:
                    title = I18n.tr("settings.xadas_is_too_old");
                    detail = I18n.tr("settings.this_xadas_version_doesnt_support_data");
                    break;
                case XadasLeadPolicy.UI_CONNECTING:
                    title = I18n.tr("settings.connecting_to_xadas");
                    detail = I18n.tr("settings.if_it_takes_too_long_open");
                    break;
                case XadasLeadPolicy.UI_SHARING_OFF:
                    title = I18n.tr("settings.xadas_data_sharing_is_off");
                    detail = I18n.tr("settings.open_xadas_settings_and_turn_on");
                    break;
                case XadasLeadPolicy.UI_PENDING:
                    title = I18n.tr("settings.waiting_for_your_permission");
                    detail = I18n.tr("settings.open_xadas_and_allow_wazemod_to");
                    break;
                case XadasLeadPolicy.UI_DENIED:
                    title = I18n.tr("settings.you_denied_access_in_xadas");
                    detail = I18n.tr("settings.open_xadas_settings_and_turn_the");
                    break;
                case XadasLeadPolicy.UI_NO_CAMERA:
                    title = I18n.tr("settings.permission_granted_no_camera_image_yet");
                    detail = I18n.tr("settings.connect_a_dash_cam_or_usb");
                    break;
                case XadasLeadPolicy.UI_PAUSED:
                    title = I18n.tr("settings.xadas_has_paused_measuring");
                    detail = I18n.tr("settings.xadas_pauses_when_the_car_is");
                    break;
                case XadasLeadPolicy.UI_STOPPED:
                    title = I18n.tr("settings.xadas_isnt_measuring");
                    detail = I18n.tr("settings.start_measuring_in_xadas_it_may");
                    break;
                case XadasLeadPolicy.UI_UNSUPPORTED:
                    title = I18n.tr("settings.xadas_is_using_the_phone_camera");
                    detail = I18n.tr("settings.linking_only_works_with_a_dash");
                    break;
                case XadasLeadPolicy.UI_NO_LEAD:
                    title = I18n.tr("settings.measuring_no_vehicle_ahead_yet");
                    detail = I18n.tr("settings.the_distance_will_show_on_the");
                    break;
                case XadasLeadPolicy.UI_LIVE:
                    title = I18n.f("settings.active_0_m", XadasLink.uiMetres());
                    detail = I18n.tr("settings.the_distance_shows_on_the_floating");
                    break;
                default:
                    title = I18n.tr("settings.connected_waiting_for_data");
                    detail = I18n.tr("settings.xadas_hasnt_sent_a_new_reading");
                    break;
            }
            xadasStatusTitle.setText(I18n.f("settings.status_0", title));
            xadasStatusDetail.setText(detail);
            xadasOpenButton.setVisibility(canOpen ? View.VISIBLE : View.GONE);
        } catch (Throwable ignored) { /* never crash Settings over a status line */ }
    }

    private void addInfoCard(LinearLayout root, String title, String message) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(15), dp(16), dp(15));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);
        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextSize(17);
        heading.setTextColor(COLOR_TEXT);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        card.addView(heading);
        TextView detail = new TextView(this);
        detail.setText(message);
        detail.setTextSize(14);
        detail.setTextColor(COLOR_MUTED);
        detail.setPadding(0, dp(5), 0, 0);
        card.addView(detail);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(card, lp);
    }

    @Override
    public void onBackPressed() {
        if (selectedSubpage != null) {
            returnToAlertsPage();
            return;
        }
        if (!wideSettings && selectedCategory != null) {
            showCategoryMenu();
            return;
        }
        super.onBackPressed();
    }

    private LinearLayout addCategory(LinearLayout root, String title, String subtitle) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(12), dp(12), dp(12), dp(12));
        GradientDrawable panel = new GradientDrawable();
        panel.setShape(GradientDrawable.RECTANGLE);
        panel.setColor(COLOR_PANEL);
        panel.setCornerRadius(dp(20));
        panel.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(panel);

        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);

        View marker = new View(this);
        GradientDrawable markerBg = new GradientDrawable();
        markerBg.setColor(COLOR_ACCENT);
        markerBg.setCornerRadius(dp(3));
        marker.setBackground(markerBg);
        LinearLayout.LayoutParams markerLp = new LinearLayout.LayoutParams(dp(5), dp(42));
        markerLp.rightMargin = dp(11);
        header.addView(marker, markerLp);

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextSize(19);
        heading.setTextColor(COLOR_TEXT);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        labels.addView(heading);

        if (subtitle != null && subtitle.length() != 0) {
            TextView description = new TextView(this);
            description.setText(subtitle);
            description.setTextSize(13);
            description.setTextColor(COLOR_MUTED);
            description.setPadding(0, dp(2), 0, 0);
            labels.addView(description);
        }
        header.addView(labels, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        card.addView(header, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(14);
        root.addView(card, cardLp);
        return card;
    }

    private void addSection(LinearLayout root, String label) {
        TextView t = new TextView(this);
        t.setText(label.toUpperCase());
        t.setTextSize(12);
        t.setTextColor(COLOR_MUTED);
        t.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(16);
        lp.bottomMargin = dp(4);
        root.addView(t, lp);
    }

    /** Live Waze INTL tile-build status, translated into user-facing local times. */
    private void addMapBuildStatus(LinearLayout root) {
        addSection(root, I18n.tr("settings.map_data"));

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(15), dp(16), dp(14));
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(0xFF16161C);
        bg.setCornerRadius(dp(16));
        card.setBackground(bg);
        card.setClickable(true);
        card.setFocusable(true);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(8);
        root.addView(card, cardLp);

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        TextView heading = new TextView(this);
        heading.setText(I18n.tr("settings.waze_map_update"));
        heading.setTextSize(14);
        heading.setTextColor(0xFFEDEDED);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        top.addView(heading, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView refresh = new TextView(this);
        refresh.setText("↻");
        refresh.setTextSize(25);
        refresh.setTextColor(COLOR_ACCENT);
        refresh.setGravity(Gravity.CENTER);
        top.addView(refresh, new LinearLayout.LayoutParams(dp(36), dp(36)));
        card.addView(top);

        mapBuildBadge = new TextView(this);
        mapBuildBadge.setText(I18n.tr("settings.connecting_2"));
        mapBuildBadge.setTextSize(11);
        mapBuildBadge.setTextColor(0xFFFFFFFF);
        mapBuildBadge.setTypeface(Typeface.DEFAULT_BOLD);
        mapBuildBadge.setGravity(Gravity.CENTER);
        mapBuildBadge.setPadding(dp(10), dp(5), dp(10), dp(5));
        LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        badgeLp.topMargin = dp(4);
        card.addView(mapBuildBadge, badgeLp);
        styleMapBuildBadge(0xFF6E7479);

        mapBuildEta = new TextView(this);
        mapBuildEta.setText(I18n.tr("settings.getting_the_update_schedule"));
        mapBuildEta.setTextSize(20);
        mapBuildEta.setTextColor(COLOR_ACCENT);
        mapBuildEta.setTypeface(Typeface.DEFAULT_BOLD);
        mapBuildEta.setLineSpacing(0, 1.08f);
        LinearLayout.LayoutParams etaLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        etaLp.topMargin = dp(12);
        card.addView(mapBuildEta, etaLp);

        mapBuildProgress = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        mapBuildProgress.setMax(100);
        mapBuildProgress.setIndeterminate(true);
        try {
            mapBuildProgress.setProgressTintList(android.content.res.ColorStateList.valueOf(COLOR_ACCENT));
            mapBuildProgress.setProgressBackgroundTintList(android.content.res.ColorStateList.valueOf(0xFF34343E));
            mapBuildProgress.setIndeterminateTintList(android.content.res.ColorStateList.valueOf(COLOR_ACCENT));
        } catch (Throwable ignore) { }
        LinearLayout.LayoutParams progressLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(7));
        progressLp.topMargin = dp(12);
        card.addView(mapBuildProgress, progressLp);

        mapBuildDetails = new TextView(this);
        mapBuildDetails.setText(I18n.tr("settings.progress_information_will_appear_here"));
        mapBuildDetails.setTextSize(14);
        mapBuildDetails.setTextColor(0xFFD2D2D7);
        mapBuildDetails.setLineSpacing(dp(3), 1f);
        LinearLayout.LayoutParams detailsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        detailsLp.topMargin = dp(12);
        card.addView(mapBuildDetails, detailsLp);

        mapBuildFetched = new TextView(this);
        mapBuildFetched.setText(I18n.tr("settings.tap_the_card_to_refresh"));
        mapBuildFetched.setTextSize(12);
        mapBuildFetched.setTextColor(0xFF777780);
        LinearLayout.LayoutParams fetchedLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        fetchedLp.topMargin = dp(10);
        card.addView(mapBuildFetched, fetchedLp);

        card.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { fetchMapBuildStatus(); }
        });

        String cached = sp.getString(MAP_BUILD_CACHE, "");
        if (cached.length() > 0) {
            renderMapBuildStatus(cached, sp.getLong(MAP_BUILD_FETCHED, 0), true);
        }
    }

    /**
     * Phiên bản của hai database do Waze Mod phát hành. Metadata được đọc từ chính protobuf
     * đã qua xác minh, vì vậy số hiển thị luôn là dataset đang thật sự được client sử dụng.
     */
    private void addModDatasetStatus(LinearLayout root) {
        addSection(root, I18n.tr("settings.waze_mod_data"));
        sp.edit().putInt("point_alert_feed", 2).apply();
        addChoice(root, I18n.tr("settings.wme_alert_source"), "point_alert_feed",
                new int[]{2}, new String[]{I18n.tr("settings.v2_stable")}, 2, null);
        final TextView road = addDatasetStatusCard(root, I18n.tr("settings.road_segment_data"));
        final TextView points = addDatasetStatusCard(root, I18n.tr("settings.wme_point_data"));
        final TextView context = addDatasetStatusCard(root, I18n.tr("settings.wme_v3_data_experimental"));

        final LinearLayout refreshRoad = row(root, I18n.tr("settings.force_a_road_segment_data_update"));
        refreshRoad.setClickable(true);
        refreshRoad.setFocusable(true);
        refreshRoad.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                refreshRoad.setEnabled(false);
                road.setText(I18n.tr("settings.reloading_the_road_segment_manifest_and"));
                RoadNoticeClient.checkNow(getApplicationContext(), new Runnable() {
                    @Override public void run() {
                        runOnUiThread(new Runnable() {
                            @Override public void run() {
                                if (!isFinishing()) refreshRoad.setEnabled(true);
                            }
                        });
                         refreshModDatasetStatus(road, points, context);
                    }
                });
            }
        });

        LinearLayout refresh = row(root, I18n.tr("settings.check_wme_point_data_now"));
        refresh.setClickable(true);
        refresh.setFocusable(true);
        refresh.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                points.setText(I18n.tr("settings.checking_the_manifest_and_database"));
                PointNoticeClient.checkNow(getApplicationContext(), new Runnable() {
                    @Override public void run() {
                        refreshModDatasetStatus(road, points, context);
                    }
                });
            }
        });
        refreshModDatasetStatus(road, points, context);
    }

    private void refreshModDatasetStatus(final TextView road, final TextView points,
                                         final TextView context) {
        Thread loader = new Thread(new Runnable() {
            @Override public void run() {
                final Context app = getApplicationContext();
                final RoadNoticeDatabase roadDb = RoadNoticeClient.get(app);
                final PointNoticeDatabase pointDb = PointNoticeClient.get(app);
                final ContextAlertDatabase contextDb = ContextAlertClient.get(app);
                final SharedPreferences roadPrefs = app.getSharedPreferences(
                        "waze_road_notice_client", MODE_PRIVATE);
                final SharedPreferences pointPrefs = app.getSharedPreferences(
                        "waze_point_notice_client", MODE_PRIVATE);
                final long roadChecked = roadPrefs.getLong("last_check_ms", 0L);
                final long pointChecked = pointPrefs.getLong("last_check_ms", 0L);
                final String roadServer = roadPrefs.getString("server_version", "");
                final String roadResult = roadPrefs.getString("last_result", "");
                final String pointServer = pointPrefs.getString("server_version", "");
                final String pointResult = pointPrefs.getString("last_result", "");
                runOnUiThread(new Runnable() {
                    @Override public void run() {
                        if (isFinishing()) return;
                        if (roadDb == null) {
                            road.setText(I18n.f("settings.no_valid_database_yet_0_1", serverVersionSuffix(roadServer), datasetResultSuffix(roadResult), checkedSuffix(roadChecked)));
                        } else {
                            road.setText(I18n.f("settings.version_0_1_segments_2_points", roadDb.datasetVersion, roadDb.segmentIds.length, roadDb.pointOffsets.length, roadDb.targetMapBuildId, formatLocalMillis(roadDb.generatedAtMs), serverVersionSuffix(roadServer), datasetResultSuffix(roadResult), checkedSuffix(roadChecked)));
                        }
                        if (pointDb == null) {
                            points.setText(I18n.f("settings.no_valid_database_yet_0_1", serverVersionSuffix(pointServer), datasetResultSuffix(pointResult), checkedSuffix(pointChecked)));
                        } else {
                            points.setText(I18n.f("settings.version_0_spatial_z_1_2", pointDb.datasetVersion, pointDb.spatialZoom, serverVersionSuffix(pointServer), formatLocalMillis(pointDb.generatedAtMs), datasetResultSuffix(pointResult), checkedSuffix(pointChecked)));
                        }
                        if (contextDb == null) {
                            context.setText(I18n.tr("settings.no_valid_v3_yet_download_cache"));
                        } else {
                            context.setText(I18n.f("settings.version_0_v3_verified_created_1", contextDb.datasetVersion, formatLocalMillis(contextDb.generatedAtMs)));
                        }
                    }
                });
            }
        }, "WazeGW-settings-data-version");
        loader.setDaemon(true);
        loader.start();
    }

    private TextView addDatasetStatusCard(LinearLayout root, String title) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(14), dp(16), dp(14));
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(bg);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(8);
        root.addView(card, cardLp);

        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextSize(17);
        heading.setTextColor(COLOR_TEXT);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        card.addView(heading);

        TextView value = new TextView(this);
        value.setText(I18n.tr("settings.reading_the_version"));
        value.setTextSize(14);
        value.setTextColor(COLOR_MUTED);
        value.setPadding(0, dp(5), 0, 0);
        value.setLineSpacing(0f, 1.15f);
        card.addView(value);
        return value;
    }

    private String checkedSuffix(long checkedAt) {
        return checkedAt > 0L
                ? I18n.f("settings.server_check_0", formatLocalMillis(checkedAt)): I18n.tr("settings.server_not_checked_yet");
    }

    private String serverVersionSuffix(String version) {
        return version == null || version.length() == 0
                ? "" : I18n.f("settings.server_version_0", version);
    }

    private String datasetResultSuffix(String result) {
        if (result == null || result.length() == 0) return "";
        if ("UP_TO_DATE".equals(result)) return I18n.tr("settings.status_up_to_date");
        if ("UPDATED".equals(result)) return I18n.tr("settings.status_updated");
        if ("DOWNLOADING".equals(result)) return I18n.tr("settings.status_downloading");
        if ("NO_DATA".equals(result)) return I18n.tr("settings.status_not_yet_released_on_the");
        if (result.startsWith("ERROR: ")) return I18n.f("settings.update_error_0", result.substring(7));
        return I18n.f("settings.status_0_2", result);
    }

    private void fetchMapBuildStatus() {
        if (mapBuildLoading || mapBuildFetched == null) return;
        mapBuildLoading = true;
        mapBuildFetched.setText(I18n.tr("settings.refreshing_status"));
        new Thread(new Runnable() {
            @Override public void run() {
                java.net.HttpURLConnection conn = null;
                java.io.BufferedReader reader = null;
                try {
                    conn = (java.net.HttpURLConnection) new java.net.URL(MAP_BUILD_URL).openConnection();
                    conn.setRequestMethod("GET");
                    conn.setConnectTimeout(8000);
                    conn.setReadTimeout(10000);
                    conn.setUseCaches(false);
                    conn.setRequestProperty("Accept", "application/json");
                    DiagnosticsLogger.networkStart("waze-map-build", conn);
                    int code = conn.getResponseCode();
                    if (code != 200) {
                        DiagnosticsLogger.networkEnd("waze-map-build", conn, code, 0L, null);
                        throw new java.io.IOException("HTTP " + code);
                    }
                    reader = new java.io.BufferedReader(new java.io.InputStreamReader(
                            conn.getInputStream(), java.nio.charset.StandardCharsets.UTF_8));
                    StringBuilder body = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) body.append(line);
                    final String json = body.toString();
                    DiagnosticsLogger.networkEnd("waze-map-build", conn, code,
                            json.getBytes(java.nio.charset.StandardCharsets.UTF_8).length, null);
                    org.json.JSONObject payload = new org.json.JSONObject(json);
                    // Between tile-build jobs the endpoint legitimately omits current_build and
                    // publishes only the last release plus the next scheduled job.
                    if (payload.optJSONObject("current_build") == null
                            && payload.optJSONObject("previous_build") == null
                            && payload.optJSONObject("next_build") == null) {
                        throw new org.json.JSONException("No build status objects");
                    }
                    final long fetchedAt = System.currentTimeMillis();
                    sp.edit().putString(MAP_BUILD_CACHE, json)
                            .putLong(MAP_BUILD_FETCHED, fetchedAt).apply();
                    runOnUiThread(new Runnable() {
                        @Override public void run() {
                            mapBuildLoading = false;
                            if (!isFinishing()) renderMapBuildStatus(json, fetchedAt, false);
                        }
                    });
                } catch (Throwable error) {
                    runOnUiThread(new Runnable() {
                        @Override public void run() {
                            mapBuildLoading = false;
                            if (isFinishing()) return;
                            String cached = sp.getString(MAP_BUILD_CACHE, "");
                            if (cached.length() > 0) {
                                mapBuildFetched.setText(I18n.tr("settings.couldnt_refresh_showing_saved_data"));
                            } else {
                                mapBuildProgress.setIndeterminate(false);
                                mapBuildProgress.setProgress(0);
                                mapBuildBadge.setText(I18n.tr("settings.not_connected_2"));
                                styleMapBuildBadge(0xFFE08A22);
                                mapBuildEta.setText(I18n.tr("settings.couldnt_get_the_map_update_schedule"));
                                mapBuildDetails.setText(I18n.tr("settings.check_your_network_connection_then_tap"));
                                mapBuildFetched.setText(I18n.tr("settings.source_waze_intl_tile_build"));
                            }
                        }
                    });
                } finally {
                    if (reader != null) try { reader.close(); } catch (Throwable ignore) { }
                    if (conn != null) conn.disconnect();
                }
            }
        }, "WazeMapBuildStatus").start();
    }

    private void renderMapBuildStatus(String json, long fetchedAt, boolean cached) {
        try {
            org.json.JSONObject all = new org.json.JSONObject(json);
            org.json.JSONObject current = all.optJSONObject("current_build");
            org.json.JSONObject previous = all.optJSONObject("previous_build");
            org.json.JSONObject next = all.optJSONObject("next_build");
            if (current == null && previous == null && next == null)
                throw new org.json.JSONException("No build status objects");

            boolean active = current != null;
            org.json.JSONObject statusBuild = active ? current : next;
            String status = statusBuild != null
                    ? statusBuild.optString("build_status", active ? "UNKNOWN" : "PENDING")
                            .toUpperCase(java.util.Locale.US)
                    : "IDLE";
            int progress = active
                    ? Math.max(0, Math.min(100, current.optInt("progress_percent", 0))) : 0;
            String completion = formatIsoTime(statusBuild != null
                    ? statusBuild.optString("estimated_completion_time", "") : "");

            int badgeColor;
            if (!active && next == null) {
                mapBuildBadge.setText(I18n.tr("settings.updated"));
                badgeColor = 0xFF2EAD70;
                String released = previous != null
                        ? formatIsoTime(previous.optString("release_time", "")) : I18n.tr("settings.not_determined");
                mapBuildEta.setText(I18n.f("settings.current_map_released_0", released));
                progress = 100;
            } else if ("RUNNING".equals(status)) {
                mapBuildBadge.setText(I18n.f("settings.processing_0", progress));
                badgeColor = COLOR_ACCENT;
                mapBuildEta.setText(I18n.f("settings.map_update_expected_0", completion));
            } else if ("STARTING".equals(status)) {
                mapBuildBadge.setText(I18n.tr("settings.initializing"));
                badgeColor = COLOR_ACCENT;
                mapBuildEta.setText(I18n.f("settings.an_update_batch_is_starting_expected", completion));
            } else if ("SOON".equals(status)) {
                mapBuildBadge.setText(I18n.tr("settings.starting_soon"));
                badgeColor = 0xFF8565D6;
                mapBuildEta.setText(I18n.f("settings.next_update_batch_expected_to_finish", completion));
            } else if ("PENDING".equals(status)) {
                mapBuildBadge.setText(I18n.tr("settings.waiting"));
                badgeColor = 0xFFE08A22;
                mapBuildEta.setText(I18n.f("settings.update_batch_expected_to_finish_0", completion));
            } else if ("COMPLETED".equals(status) || "SUCCEEDED".equals(status) || "SUCCESS".equals(status)) {
                mapBuildBadge.setText(I18n.tr("settings.completed"));
                badgeColor = 0xFF2EAD70;
                mapBuildEta.setText(I18n.tr("settings.the_new_map_has_finished_processing"));
                progress = 100;
            } else if ("FAILED".equals(status) || "ERROR".equals(status)) {
                mapBuildBadge.setText(I18n.tr("settings.paused"));
                badgeColor = 0xFFE34B4B;
                mapBuildEta.setText(I18n.tr("settings.no_new_update_time_yet"));
            } else {
                mapBuildBadge.setText(status);
                badgeColor = 0xFF6E7479;
                mapBuildEta.setText(I18n.f("settings.expected_to_finish_0", completion));
            }
            styleMapBuildBadge(badgeColor);
            mapBuildProgress.setIndeterminate(false);
            mapBuildProgress.setProgress(progress);

            StringBuilder details = new StringBuilder();
            if (previous != null) {
                details.append(I18n.tr("settings.current_release"))
                        .append(formatIsoTime(previous.optString("release_time", "")));
            }
            String lastEdit = current != null
                    ? current.optString("last_edit_time", "")
                    : previous != null ? previous.optString("last_edit_time", "") : "";
            if (lastEdit.length() > 0) {
                if (details.length() > 0) details.append('\n');
                details.append(I18n.tr("settings.accepting_edits_until")).append(formatIsoTime(lastEdit));
            }
            if (next != null) {
                String nextStart = next.optString("estimated_start_time", "");
                if (nextStart.length() > 0) {
                    if (details.length() > 0) details.append('\n');
                    details.append(I18n.tr("settings.next_batch_starts")).append(formatIsoTime(nextStart));
                }
                String nextDone = next.optString("estimated_completion_time", "");
                if (nextDone.length() > 0) {
                    if (details.length() > 0) details.append('\n');
                    details.append(I18n.tr("settings.next_batch_expected")).append(formatIsoTime(nextDone));
                }
            }
            int delay = current != null ? current.optInt("delay_minutes", 0) : 0;
            if (delay > 0) details.append(I18n.tr("settings.behind_schedule_by")).append(delay).append(I18n.tr("settings.min"));
            mapBuildDetails.setText(details.length() > 0 ? details.toString() : I18n.tr("settings.no_update_schedule_details_yet"));

            String when = fetchedAt > 0 ? formatLocalMillis(fetchedAt) : "";
            mapBuildFetched.setText((cached ? I18n.tr("settings.saved_data") : I18n.tr("settings.status_updated_2"))
                    + (when.length() > 0 ? I18n.f("settings.at_0", when): "") + " • " + I18n.tr("settings.tap_to_refresh"));
        } catch (Throwable t) {
            mapBuildProgress.setIndeterminate(false);
            mapBuildProgress.setProgress(0);
            mapBuildBadge.setText(I18n.tr("settings.invalid_data"));
            styleMapBuildBadge(0xFFE34B4B);
            mapBuildEta.setText(I18n.tr("settings.couldnt_read_the_map_update_schedule"));
            mapBuildDetails.setText(I18n.tr("settings.tap_the_card_to_reload_the"));
        }
    }

    private void styleMapBuildBadge(int color) {
        GradientDrawable badge = new GradientDrawable();
        badge.setShape(GradientDrawable.RECTANGLE);
        badge.setColor(color);
        badge.setCornerRadius(dp(20));
        mapBuildBadge.setBackground(badge);
    }

    private String formatIsoTime(String raw) {
        if (raw == null || raw.length() == 0) return I18n.tr("settings.not_determined");
        try {
            String normalized = raw;
            int z = normalized.endsWith("Z") ? normalized.length() - 1 : normalized.length();
            int dot = normalized.indexOf('.');
            if (dot >= 0) {
                String frac = normalized.substring(dot + 1, z);
                while (frac.length() < 3) frac += "0";
                if (frac.length() > 3) frac = frac.substring(0, 3);
                normalized = normalized.substring(0, dot) + "." + frac + "Z";
            } else if (normalized.endsWith("Z")) {
                normalized = normalized.substring(0, normalized.length() - 1) + ".000Z";
            }
            java.text.SimpleDateFormat parser = new java.text.SimpleDateFormat(
                    "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", java.util.Locale.US);
            parser.setTimeZone(java.util.TimeZone.getTimeZone("UTC"));
            parser.setLenient(false);
            return formatVietnamTime(parser.parse(normalized));
        } catch (Throwable t) {
            return I18n.tr("settings.not_determined");
        }
    }

    private String formatLocalMillis(long millis) {
        return formatVietnamTime(new java.util.Date(millis));
    }

    private String formatVietnamTime(java.util.Date date) {
        if (date == null) return I18n.tr("settings.not_determined");
        java.text.SimpleDateFormat out = new java.text.SimpleDateFormat("HH:mm, dd/MM", java.util.Locale.US);
        out.setTimeZone(java.util.TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
        return out.format(date);
    }

    private LinearLayout row(LinearLayout root, String label) {
        LinearLayout r = new LinearLayout(this);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(dp(14), dp(14), dp(14), dp(14));
        styleControlHover(r, false);
        enableControlHover(r);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        root.addView(r, lp);

        TextView t = new TextView(this);
        t.setText(label);
        t.setTextSize(17);
        t.setTextColor(COLOR_TEXT);
        r.addView(t, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return r;
    }

    /** Pointer feedback for WSA, tablets with a mouse and Android Auto development displays. */
    private void enableControlHover(final View view) {
        view.setOnHoverListener(new View.OnHoverListener() {
            @Override public boolean onHover(View hoveredView, android.view.MotionEvent event) {
                boolean hovered = event.getActionMasked()
                        != android.view.MotionEvent.ACTION_HOVER_EXIT;
                styleControlHover(hoveredView, hovered);
                hoveredView.animate()
                        .translationZ(hovered ? dp(2) : 0)
                        .setDuration(100L).start();
                return false;
            }
        });
    }

    private void styleControlHover(View view, boolean hovered) {
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(hovered ? 0xFF222733 : COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), hovered ? 0xFF465064 : COLOR_BORDER);
        view.setBackground(bg);
    }

    private void enableLiftHover(final View view) {
        view.setOnHoverListener(new View.OnHoverListener() {
            @Override public boolean onHover(View hoveredView, android.view.MotionEvent event) {
                boolean hovered = event.getActionMasked()
                        != android.view.MotionEvent.ACTION_HOVER_EXIT;
                hoveredView.animate()
                        .scaleX(hovered ? 1.006f : 1f)
                        .scaleY(hovered ? 1.006f : 1f)
                        .translationZ(hovered ? dp(3) : 0)
                        .setDuration(100L).start();
                return false;
            }
        });
    }

    interface BoolCb { void on(boolean v); }

    private void addSwitch(LinearLayout root, String label, final String key, boolean def) {
        addSwitch(root, label, key, def, null);
    }

    private void addSwitch(LinearLayout root, String label, final String key, boolean def, final BoolCb cb) {
        LinearLayout r = row(root, label);
        Switch sw = new Switch(this);
        try {
            sw.setShowText(false);                       // no "ON/OFF" text — a clean slide switch
            int[][] st = {{android.R.attr.state_checked}, {}};
            sw.setThumbTintList(new android.content.res.ColorStateList(
                    st, new int[]{COLOR_ACCENT, 0xFFCFCFCF}));
            sw.setTrackTintList(new android.content.res.ColorStateList(
                    st, new int[]{AmbientTheme.withAlpha(COLOR_ACCENT, 128), 0x40FFFFFF}));
        } catch (Throwable ignore) { }
        sw.setChecked(sp.getBoolean(key, def));
        sw.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(android.widget.CompoundButton v, boolean on) {
                sp.edit().putBoolean(key, on).apply();
                if (cb != null) cb.on(on);
            }
        });
        r.addView(sw, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    /** Three visual choices for the red over-speed edge effect. */
    private void addOverspeedEffectPicker(LinearLayout root, final String key,
                                           final boolean mapEffect) {
        TextView title = pickerTitle(I18n.tr("settings.effect_when_over_the_speed_limit"));
        root.addView(title, pickerTitleParams());

        final String noneAsset = mapEffect
                ? "settings_demo/overspeed_no_effect.png"
                : "settings_demo/ovs_HUD_no_effect.png";
        final String weakAsset = mapEffect
                ? "settings_demo/overspeed_effect_low.png"
                : "settings_demo/ovs_HUD_Low.png";
        final String strongAsset = mapEffect
                ? "settings_demo/overspeed_effect_high.png"
                : "settings_demo/ovs_HUD_High.png";
        final float previewRatio = mapEffect ? 1.60f : 1.83f;

        final FrameLayout none = bubbleLayoutCard(noneAsset, I18n.tr("settings.no_effect"));
        final FrameLayout weak = bubbleLayoutCard(weakAsset, I18n.tr("settings.weak_effect"));
        final FrameLayout strong = bubbleLayoutCard(strongAsset, I18n.tr("settings.strong_effect"));

        float density = getResources().getDisplayMetrics().density;
        int screenDp = (int) (getResources().getDisplayMetrics().widthPixels / density);
        boolean wide = screenDp >= 700;
        int available = getResources().getDisplayMetrics().widthPixels - dp(wide ? 72 : 36);

        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setGravity(Gravity.CENTER_VERTICAL);
        FrameLayout[] choices = new FrameLayout[]{none, weak, strong};
        for (int i = 0; i < choices.length; i++) {
            LinearLayout.LayoutParams lp;
            if (wide) {
                lp = new LinearLayout.LayoutParams(0, dp(230), 1f);
                if (i > 0) lp.leftMargin = dp(10);
            } else {
                // Phone portrait: compact carousel with part of the next card visible.
                int cardWidth = Math.min(dp(252), Math.max(dp(210), (int) (available * 0.74f)));
                int cardHeight = (int) (cardWidth / previewRatio) + dp(42);
                lp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
                if (i > 0) lp.leftMargin = dp(10);
            }
            cards.addView(choices[i], lp);
        }
        if (wide) {
            root.addView(cards, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        } else {
            android.widget.HorizontalScrollView carousel =
                    new android.widget.HorizontalScrollView(this);
            carousel.setHorizontalScrollBarEnabled(false);
            carousel.setFillViewport(false);
            carousel.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
            carousel.addView(cards, new android.widget.HorizontalScrollView.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            root.addView(carousel, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        int selected = sp.getInt(key, Vignette.MODE_NONE);
        if (selected < Vignette.MODE_NONE || selected > Vignette.MODE_STRONG) {
            selected = Vignette.MODE_NONE;
            sp.edit().putInt(key, selected).apply();
        }
        updateOverspeedEffectCards(none, weak, strong, selected);

        none.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                selectOverspeedEffect(key, mapEffect, none, weak, strong, Vignette.MODE_NONE);
            }
        });
        weak.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                selectOverspeedEffect(key, mapEffect, none, weak, strong, Vignette.MODE_WEAK);
            }
        });
        strong.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                selectOverspeedEffect(key, mapEffect, none, weak, strong, Vignette.MODE_STRONG);
            }
        });
    }

    private void selectOverspeedEffect(String key, boolean mapEffect,
                                       FrameLayout none, FrameLayout weak, FrameLayout strong,
                                       int selected) {
        sp.edit().putInt(key, selected).apply();
        updateOverspeedEffectCards(none, weak, strong, selected);
        if (mapEffect) Gateway.onMapOverspeedSettingChanged();
    }

    private void updateOverspeedEffectCards(FrameLayout none, FrameLayout weak,
                                             FrameLayout strong, int selected) {
        styleBubbleLayoutCard(none, selected == Vignette.MODE_NONE);
        styleBubbleLayoutCard(weak, selected == Vignette.MODE_WEAK);
        styleBubbleLayoutCard(strong, selected == Vignette.MODE_STRONG);
    }

    /**
     * HUD layout gallery.  Keep the options in one vertical list so the same
     * screen works on a phone and on the wide WSA/Android Auto settings pane.
     * Adding HUD V3 later only requires another card and one entry in the
     * selection callback.
     */
    private void addHudLayoutPicker(LinearLayout root) {
        TextView title = pickerTitle(I18n.tr("settings.hud_interface_style"));
        root.addView(title, pickerTitleParams());

        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.choose_a_display_layout_new_layouts"));
        hint.setTextSize(13);
        hint.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.bottomMargin = dp(10);
        root.addView(hint, hintLp);

        final FrameLayout v1 = bubbleLayoutCard("settings_demo/hud_v1.png", "HUD V1");
        final FrameLayout v2 = bubbleLayoutCard("settings_demo/hud_v2.png", "HUD V2");

        float density = getResources().getDisplayMetrics().density;
        int screenDp = (int) (getResources().getDisplayMetrics().widthPixels / density);
        int available = getResources().getDisplayMetrics().widthPixels - dp(screenDp >= 600 ? 72 : 32);
        int cardWidth = Math.min(available, dp(820));
        int cardHeight = Math.max(dp(150), (int) (cardWidth / 2.22f) + dp(48));

        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams v1Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, cardHeight);
        v1Lp.bottomMargin = dp(12);
        cards.addView(v1, v1Lp);
        LinearLayout.LayoutParams v2Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, cardHeight);
        cards.addView(v2, v2Lp);
        root.addView(cards, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int selectedLayout = sp.getInt("hud_layout", 1);
        if (selectedLayout != 1 && selectedLayout != 2) {
            selectedLayout = 1;
            sp.edit().putInt("hud_layout", selectedLayout).apply();
        }
        updateHudLayoutCards(v1, v2, selectedLayout);
        v1.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                sp.edit().putInt("hud_layout", 1).apply();
                updateHudLayoutCards(v1, v2, 1);
            }
        });
        v2.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                sp.edit().putInt("hud_layout", 2).apply();
                updateHudLayoutCards(v1, v2, 2);
            }
        });
    }

    private void updateHudLayoutCards(FrameLayout v1, FrameLayout v2, int selected) {
        styleBubbleLayoutCard(v1, selected == 1);
        styleBubbleLayoutCard(v2, selected == 2);
    }

    /** Portrait HUD chooses an instrument cluster, independently from landscape HUD V1/V2. */
    private void addPortraitGaugePicker(LinearLayout root) {
        root.addView(pickerTitle(I18n.tr("settings.vertical_hud_gauge_style")), pickerTitleParams());

        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.only_applies_when_the_hud_is"));
        hint.setTextSize(13);
        hint.setTextColor(COLOR_MUTED);
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.bottomMargin = dp(10);
        root.addView(hint, hintLp);

        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setPadding(dp(2), dp(2), dp(2), dp(2));

        int available = getResources().getDisplayMetrics().widthPixels - dp(56);
        int cardWidth = Math.max(dp(160), Math.min(dp(230), available / 2));
        int cardHeight = dp(205);
        final FrameLayout style1 = portraitGaugeCard(1, I18n.tr("settings.main_gauge"));
        final FrameLayout style2 = portraitGaugeCard(2, I18n.tr("settings.main_speed_sign"));
        final FrameLayout style3 = portraitGaugeCard(3, I18n.tr("settings.two_gauges"));

        cards.addView(style1, new LinearLayout.LayoutParams(cardWidth, cardHeight));
        LinearLayout.LayoutParams style2Lp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
        style2Lp.leftMargin = dp(12);
        cards.addView(style2, style2Lp);
        LinearLayout.LayoutParams style3Lp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
        style3Lp.leftMargin = dp(12);
        cards.addView(style3, style3Lp);

        android.widget.HorizontalScrollView carousel =
                new android.widget.HorizontalScrollView(this);
        carousel.setHorizontalScrollBarEnabled(false);
        carousel.setClipToPadding(false);
        carousel.addView(cards, new android.widget.HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(carousel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        int selected = sp.getInt("hud_portrait_gauge_style", 1);
        if (selected < 1 || selected > 3) selected = 1;
        updatePortraitGaugeCards(style1, style2, style3, selected);
        style1.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sp.edit().putInt("hud_portrait_gauge_style", 1).apply();
                updatePortraitGaugeCards(style1, style2, style3, 1);
            }
        });
        style2.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sp.edit().putInt("hud_portrait_gauge_style", 2).apply();
                updatePortraitGaugeCards(style1, style2, style3, 2);
            }
        });
        style3.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                sp.edit().putInt("hud_portrait_gauge_style", 3).apply();
                updatePortraitGaugeCards(style1, style2, style3, 3);
            }
        });
    }

    private FrameLayout portraitGaugeCard(final int style, String label) {
        String asset = "settings_demo/hud_h_speedometer_preset_" + style + ".png";
        return bubbleLayoutCard(asset, label, true);
    }

    private void updatePortraitGaugeCards(FrameLayout style1, FrameLayout style2,
                                          FrameLayout style3, int selected) {
        styleBubbleLayoutCard(style1, selected == 1);
        styleBubbleLayoutCard(style2, selected == 2);
        styleBubbleLayoutCard(style3, selected == 3);
    }

    /** Scrollable cards keep all layouts readable on portrait phones. */
    private void addBubbleLayoutPicker(LinearLayout root) {
        FloatMap.migrate(this);                       // old layout 4 (floating map) became the switch below
        TextView title = pickerTitle(I18n.tr("settings.bubble_display_style"));
        root.addView(title, pickerTitleParams());

        LinearLayout cards = new LinearLayout(this);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        cards.setPadding(dp(2), dp(2), dp(2), dp(2));
        int available = getResources().getDisplayMetrics().widthPixels - dp(56);
        int cardWidth = Math.max(dp(150), Math.min(dp(240), available / 2));
        int cardHeight = dp(172);

        final FrameLayout basic = bubbleLayoutCard(
                "settings_demo/bubble_bs.png", I18n.tr("settings.basic"));
        final FrameLayout horizontal = bubbleLayoutCard(
                "settings_demo/bubble_h.png", I18n.tr("settings.landscape"));
        final FrameLayout vertical = bubbleLayoutCard(
                "settings_demo/bubble_v.png", I18n.tr("settings.portrait"));
        final FrameLayout info = bubbleLayoutCard(
                "settings_demo/bubble_info.png", I18n.tr("settings.info_panel"));

        LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
        cards.addView(basic, bLp);
        LinearLayout.LayoutParams hLp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
        hLp.leftMargin = dp(12);
        cards.addView(horizontal, hLp);
        LinearLayout.LayoutParams vLp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
        vLp.leftMargin = dp(12);
        cards.addView(vertical, vLp);
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(cardWidth, cardHeight);
        iLp.leftMargin = dp(12);
        cards.addView(info, iLp);

        android.widget.HorizontalScrollView carousel =
                new android.widget.HorizontalScrollView(this);
        carousel.setHorizontalScrollBarEnabled(false);
        carousel.setClipToPadding(false);
        carousel.addView(cards, new android.widget.HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(carousel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        updateBubbleLayoutCards(basic, horizontal, vertical, info, sp.getInt("bubble_layout", 0));
        basic.setOnClickListener(bubbleLayoutClick(2, basic, horizontal, vertical, info));
        horizontal.setOnClickListener(bubbleLayoutClick(0, basic, horizontal, vertical, info));
        vertical.setOnClickListener(bubbleLayoutClick(1, basic, horizontal, vertical, info));
        info.setOnClickListener(bubbleLayoutClick(3, basic, horizontal, vertical, info));

        // Floating map: its own switch. While navigating it replaces the bubble; the style picked above is what
        // shows the rest of the time.
        addSwitch(root, I18n.tr("settings.floating_map_while_navigating_when_not"),
                "float_map", false, new BoolCb() {
                    @Override public void on(boolean enabled) {
                        if (enabled && !Bubble.canShow(ModSettingsActivity.this)) {
                            Bubble.requestPermission(ModSettingsActivity.this);
                        }
                    }
                });
        ImageView floatPreview = new ImageView(this);
        floatPreview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        floatPreview.setAdjustViewBounds(true);
        try {
            java.io.InputStream in = getAssets().open("settings_demo/bubble_float.png");
            floatPreview.setImageBitmap(BitmapFactory.decodeStream(in));
            in.close();
        } catch (Throwable ignore) { }
        LinearLayout.LayoutParams floatLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(190));
        floatLp.topMargin = dp(6);
        root.addView(floatPreview, floatLp);
    }

    /** bubble_layout 0..3 are the floating bubble styles (the floating map is a separate switch, float_map). */
    private View.OnClickListener bubbleLayoutClick(final int layout, final FrameLayout basic,
            final FrameLayout horizontal, final FrameLayout vertical, final FrameLayout info) {
        return new View.OnClickListener() {
            @Override public void onClick(View v) {
                sp.edit().putInt("bubble_layout", layout).apply();
                updateBubbleLayoutCards(basic, horizontal, vertical, info, layout);
                Bubble.refresh();
            }
        };
    }

    private TextView pickerTitle(String label) {
        TextView title = new TextView(this);
        title.setText(label);
        title.setTextSize(17);
        title.setTextColor(COLOR_TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        return title;
    }

    private LinearLayout.LayoutParams pickerTitleParams() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(16);
        lp.bottomMargin = dp(8);
        return lp;
    }

    private FrameLayout bubbleLayoutCard(String assetPath, String label) {
        return bubbleLayoutCard(assetPath, label, false);
    }

    private FrameLayout bubbleLayoutCard(String assetPath, String label, boolean roundedImage) {
        ImageView preview = new ImageView(this);
        preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
        preview.setAdjustViewBounds(true);
        if (roundedImage) {
            preview.setClipToOutline(true);
            preview.setOutlineProvider(new android.view.ViewOutlineProvider() {
                @Override public void getOutline(View view, android.graphics.Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), dp(14));
                }
            });
        }
        java.io.InputStream in = null;
        try {
            in = getAssets().open(assetPath);
            preview.setImageBitmap(BitmapFactory.decodeStream(in));
        } catch (Throwable ignore) { }
        finally {
            if (in != null) try { in.close(); } catch (Throwable ignore) { }
        }
        return bubbleLayoutCard(preview, label);
    }

    private FrameLayout bubbleLayoutCard(View preview, String label) {
        FrameLayout card = new FrameLayout(this);
        card.setPadding(dp(10), dp(10), dp(10), dp(8));
        card.setClickable(true);
        card.setFocusable(true);
        card.setContentDescription(label);
        enableLiftHover(card);

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setGravity(Gravity.CENTER);

        content.addView(preview, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        TextView caption = new TextView(this);
        caption.setText(label);
        caption.setTextSize(15);
        caption.setTextColor(COLOR_TEXT);
        caption.setTypeface(Typeface.DEFAULT_BOLD);
        caption.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams captionLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        captionLp.topMargin = dp(4);
        content.addView(caption, captionLp);
        card.addView(content, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        TextView check = new TextView(this);
        check.setText("✓");
        check.setTextSize(18);
        check.setTextColor(0xFFFFFFFF);
        check.setTypeface(Typeface.DEFAULT_BOLD);
        check.setGravity(Gravity.CENTER);
        GradientDrawable checkBg = new GradientDrawable();
        checkBg.setShape(GradientDrawable.OVAL);
        checkBg.setColor(COLOR_ACCENT);
        check.setBackground(checkBg);
        FrameLayout.LayoutParams checkLp = new FrameLayout.LayoutParams(dp(30), dp(30));
        checkLp.gravity = Gravity.BOTTOM | Gravity.RIGHT;
        checkLp.rightMargin = dp(5);
        checkLp.bottomMargin = dp(5);
        card.addView(check, checkLp);
        card.setTag(check);
        return card;
    }

    private void updateBubbleLayoutCards(FrameLayout basic, FrameLayout horizontal,
                                         FrameLayout vertical, FrameLayout info, int selected) {
        styleBubbleLayoutCard(basic, selected == 2);
        styleBubbleLayoutCard(horizontal, selected == 0);
        styleBubbleLayoutCard(vertical, selected == 1);
        styleBubbleLayoutCard(info, selected == 3);
    }

    private void styleBubbleLayoutCard(FrameLayout card, boolean selected) {
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(16));
        bg.setStroke(dp(selected ? 3 : 1), selected ? COLOR_ACCENT : COLOR_BORDER);
        card.setBackground(bg);
        Object tag = card.getTag();
        if (tag instanceof TextView)
            ((TextView) tag).setVisibility(selected ? View.VISIBLE : View.GONE);
    }

    /** Ambient colour used by navigation labels and MOD controls; warning colours stay fixed. */
    private void addAmbientColorChoice(LinearLayout root) {
        final LinearLayout control = row(root, I18n.tr("settings.accent_color"));
        final View swatch = new View(this);
        final int swatchSize = dp(26);
        control.addView(swatch, new LinearLayout.LayoutParams(swatchSize, swatchSize));

        final TextView value = new TextView(this);
        value.setTextSize(16);
        value.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams valueLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        valueLp.leftMargin = dp(10);
        control.addView(value, valueLp);
        updateAmbientChoiceSummary(swatch, value);

        control.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                showAmbientColorDrawer(swatch, value);
            }
        });

        TextView note = new TextView(this);
        note.setText(I18n.tr("settings.applies_to_the_street_name_on"));
        note.setTextSize(12);
        note.setTextColor(COLOR_MUTED);
        note.setPadding(dp(14), dp(7), dp(14), dp(3));
        root.addView(note, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void updateAmbientChoiceSummary(View swatch, TextView value) {
        int mode = sp.getInt(AmbientTheme.PREF_MODE, AmbientTheme.MODE_WAZE);
        int color = AmbientTheme.color(sp);
        if (swatch != null) swatch.setBackground(colorCircle(color, dp(1), 0xCCFFFFFF));
        if (value != null) {
            value.setText(ambientModeLabel(mode));
            value.setTextColor(color);
        }
    }

    private String ambientModeLabel(int mode) {
        switch (mode) {
            case AmbientTheme.MODE_CHISADIN: return I18n.tr("settings.chisadin_pink");
            case AmbientTheme.MODE_AMBER: return I18n.tr("settings.amber");
            case AmbientTheme.MODE_MINT: return I18n.tr("settings.mint");
            case AmbientTheme.MODE_CUSTOM: return I18n.tr("settings.custom");
            case AmbientTheme.MODE_WAZE:
            default: return "Xanh Waze";
        }
    }

    private GradientDrawable colorCircle(int color, int strokeWidth, int strokeColor) {
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.OVAL);
        shape.setColor(AmbientTheme.opaque(color));
        if (strokeWidth > 0) shape.setStroke(strokeWidth, strokeColor);
        return shape;
    }

    private void showAmbientColorDrawer(final View summarySwatch, final TextView summaryValue) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);

        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.accent_color"),
                I18n.tr("settings.prefer_bright_colors_so_it_stays"));
        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        sheet.addView(list, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final int selected = sp.getInt(AmbientTheme.PREF_MODE, AmbientTheme.MODE_WAZE);
        final int custom = sp.getInt(AmbientTheme.PREF_CUSTOM, AmbientTheme.WAZE_BLUE);
        final int[] modes = new int[]{
                AmbientTheme.MODE_WAZE, AmbientTheme.MODE_CHISADIN,
                AmbientTheme.MODE_AMBER, AmbientTheme.MODE_MINT, AmbientTheme.MODE_CUSTOM
        };
        final String[] labels = new String[]{
                "Xanh Waze", I18n.tr("settings.chisadin_pink"), I18n.tr("settings.amber"), I18n.tr("settings.mint"), I18n.tr("settings.custom_2")
        };
        for (int i = 0; i < modes.length; i++) {
            final int mode = modes[i];
            int color = AmbientTheme.presetColor(mode, custom);
            boolean active = mode == selected;

            LinearLayout option = new LinearLayout(this);
            option.setGravity(Gravity.CENTER_VERTICAL);
            option.setPadding(dp(14), dp(10), dp(12), dp(10));
            option.setClickable(true);
            option.setFocusable(true);
            enableLiftHover(option);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(active ? AmbientTheme.withAlpha(color, 34) : COLOR_CONTROL);
            bg.setCornerRadius(dp(15));
            bg.setStroke(dp(active ? 2 : 1), active ? color : COLOR_BORDER);
            option.setBackground(bg);

            View dot = new View(this);
            dot.setBackground(colorCircle(color, dp(1), 0xB3FFFFFF));
            option.addView(dot, new LinearLayout.LayoutParams(dp(30), dp(30)));
            TextView name = new TextView(this);
            name.setText(labels[i]);
            name.setTextColor(active ? color : COLOR_TEXT);
            name.setTextSize(16);
            name.setTypeface(active ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
            LinearLayout.LayoutParams nameLp = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            nameLp.leftMargin = dp(13);
            option.addView(name, nameLp);
            TextView mark = new TextView(this);
            mark.setText(active ? "✓" : (mode == AmbientTheme.MODE_CUSTOM ? "+" : ""));
            mark.setTextColor(active ? color : COLOR_MUTED);
            mark.setTextSize(18);
            mark.setGravity(Gravity.CENTER);
            option.addView(mark, new LinearLayout.LayoutParams(dp(30), dp(30)));

            option.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) {
                    dialog.dismiss();
                    if (mode == AmbientTheme.MODE_CUSTOM) {
                        audioPreviewHandler.postDelayed(new Runnable() {
                            @Override public void run() {
                                if (!isFinishing()
                                        && (android.os.Build.VERSION.SDK_INT < 17 || !isDestroyed())) {
                                    showCustomAmbientColorPicker(summarySwatch, summaryValue);
                                }
                            }
                        }, 100L);
                    } else {
                        applyAmbientSelection(mode,
                                AmbientTheme.presetColor(mode, custom), summarySwatch, summaryValue);
                    }
                }
            });
            LinearLayout.LayoutParams optionLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(56));
            if (i > 0) optionLp.topMargin = dp(8);
            list.addView(option, optionLp);
        }
        showBottomSheet(dialog, sheet, dp(640));
    }

    private LinearLayout createAmbientSheet(String title, String subtitle) {
        LinearLayout sheet = new LinearLayout(this);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding(dp(16), dp(10), dp(16), dp(18));
        GradientDrawable sheetBg = new GradientDrawable();
        sheetBg.setColor(0xFF151821);
        sheetBg.setCornerRadius(dp(24));
        sheetBg.setStroke(dp(1), COLOR_BORDER);
        sheet.setBackground(sheetBg);

        View handle = new View(this);
        GradientDrawable handleBg = new GradientDrawable();
        handleBg.setColor(0xFF626A79);
        handleBg.setCornerRadius(dp(4));
        handle.setBackground(handleBg);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(44), dp(4));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.bottomMargin = dp(15);
        sheet.addView(handle, handleLp);

        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextColor(COLOR_TEXT);
        heading.setTextSize(21);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        sheet.addView(heading);
        TextView hint = new TextView(this);
        hint.setText(subtitle);
        hint.setTextColor(COLOR_MUTED);
        hint.setTextSize(13);
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.topMargin = dp(3);
        hintLp.bottomMargin = dp(14);
        sheet.addView(hint, hintLp);
        return sheet;
    }

    private void showCustomAmbientColorPicker(final View summarySwatch,
                                               final TextView summaryValue) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.custom_color"),
                I18n.tr("settings.enter_a_hex_code_or_drag"));

        final int initial = sp.getInt(AmbientTheme.PREF_CUSTOM, AmbientTheme.WAZE_BLUE);
        final float[] hsv = new float[3];
        android.graphics.Color.colorToHSV(AmbientTheme.opaque(initial), hsv);

        final TextView sample = new TextView(this);
        sample.setText(I18n.tr("settings.420_m_tr_ng_nh"));
        sample.setTextSize(20);
        sample.setTypeface(Typeface.DEFAULT_BOLD);
        sample.setGravity(Gravity.CENTER_VERTICAL);
        sample.setPadding(dp(18), dp(10), dp(18), dp(10));
        GradientDrawable sampleBg = new GradientDrawable();
        sampleBg.setColor(0xEE000000);
        sampleBg.setCornerRadius(dp(14));
        sample.setBackground(sampleBg);
        sheet.addView(sample, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(82)));

        final android.widget.EditText hex = new android.widget.EditText(this);
        hex.setTextSize(14);
        hex.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        hex.setGravity(Gravity.CENTER_VERTICAL | Gravity.RIGHT);
        hex.setSingleLine(true);
        hex.setSelectAllOnFocus(true);
        hex.setHint("#RRGGBB");
        hex.setHintTextColor(COLOR_MUTED);
        hex.setInputType(android.text.InputType.TYPE_CLASS_TEXT
                | android.text.InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        hex.setFilters(new android.text.InputFilter[]{
                new android.text.InputFilter.LengthFilter(7)
        });
        hex.setPadding(dp(12), 0, dp(12), 0);
        GradientDrawable hexBg = new GradientDrawable();
        hexBg.setColor(COLOR_CONTROL);
        hexBg.setCornerRadius(dp(11));
        hexBg.setStroke(dp(1), COLOR_BORDER);
        hex.setBackground(hexBg);
        LinearLayout.LayoutParams hexLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(48));
        hexLp.topMargin = dp(8);
        sheet.addView(hex, hexLp);

        final SeekBar hue = ambientColorSlider(sheet, I18n.tr("settings.hue"), 360, Math.round(hsv[0]));
        final SeekBar saturation = ambientColorSlider(
                sheet, I18n.tr("settings.saturation"), 100, Math.round(hsv[1] * 100f));
        final SeekBar brightness = ambientColorSlider(
                sheet, I18n.tr("settings.brightness"), 100, Math.round(hsv[2] * 100f));

        final boolean[] syncing = new boolean[]{false};
        final Runnable update = new Runnable() {
            @Override public void run() {
                if (syncing[0]) return;
                syncing[0] = true;
                hsv[0] = hue.getProgress();
                hsv[1] = saturation.getProgress() / 100f;
                hsv[2] = brightness.getProgress() / 100f;
                int color = android.graphics.Color.HSVToColor(hsv);
                sample.setTextColor(color);
                String value = String.format(java.util.Locale.US, "#%06X", color & 0xFFFFFF);
                if (!value.equalsIgnoreCase(hex.getText().toString())) {
                    hex.setText(value);
                    hex.setSelection(hex.length());
                }
                hex.setTextColor(COLOR_TEXT);
                syncing[0] = false;
            }
        };
        SeekBar.OnSeekBarChangeListener listener = new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                update.run();
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) { }
            @Override public void onStopTrackingTouch(SeekBar seekBar) { }
        };
        hue.setOnSeekBarChangeListener(listener);
        saturation.setOnSeekBarChangeListener(listener);
        brightness.setOnSeekBarChangeListener(listener);
        hex.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence value, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence value, int start, int before, int count) { }
            @Override public void afterTextChanged(android.text.Editable value) {
                if (syncing[0]) return;
                Integer parsed = parseAmbientHex(value == null ? "" : value.toString());
                if (parsed == null) {
                    hex.setTextColor(0xFFFF6571);
                    return;
                }
                syncing[0] = true;
                android.graphics.Color.colorToHSV(parsed, hsv);
                hue.setProgress(Math.round(hsv[0]));
                saturation.setProgress(Math.round(hsv[1] * 100f));
                brightness.setProgress(Math.round(hsv[2] * 100f));
                sample.setTextColor(parsed);
                hex.setTextColor(COLOR_TEXT);
                syncing[0] = false;
            }
        });
        update.run();

        LinearLayout actions = new LinearLayout(this);
        actions.setGravity(Gravity.RIGHT | Gravity.CENTER_VERTICAL);
        actions.setPadding(0, dp(14), 0, 0);
        TextView cancel = ambientAction(I18n.tr("hud_link.cancel"), COLOR_MUTED);
        TextView apply = ambientAction(I18n.tr("settings.apply"), AmbientTheme.color(sp));
        actions.addView(cancel, new LinearLayout.LayoutParams(0, dp(48), 1f));
        LinearLayout.LayoutParams applyLp = new LinearLayout.LayoutParams(0, dp(48), 1f);
        applyLp.leftMargin = dp(10);
        actions.addView(apply, applyLp);
        sheet.addView(actions);

        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { dialog.dismiss(); }
        });
        apply.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                Integer color = parseAmbientHex(hex.getText().toString());
                if (color == null) {
                    android.widget.Toast.makeText(ModSettingsActivity.this,
                            I18n.tr("settings.the_color_code_must_be_in"),
                            android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                dialog.dismiss();
                applyAmbientSelection(AmbientTheme.MODE_CUSTOM, color,
                        summarySwatch, summaryValue);
            }
        });
        showBottomSheet(dialog, sheet, dp(640));
    }

    private Integer parseAmbientHex(String value) {
        if (value == null) return null;
        String normalized = value.trim();
        if (normalized.startsWith("#")) normalized = normalized.substring(1);
        if (normalized.length() != 6 || !normalized.matches("[0-9a-fA-F]{6}")) return null;
        try {
            return 0xFF000000 | (int) Long.parseLong(normalized, 16);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private SeekBar ambientColorSlider(LinearLayout root, String label, int max, int progress) {
        TextView title = new TextView(this);
        title.setText(label);
        title.setTextColor(COLOR_TEXT);
        title.setTextSize(14);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleLp.topMargin = dp(10);
        root.addView(title, titleLp);
        SeekBar bar = new SeekBar(this);
        bar.setMax(max);
        bar.setProgress(progress);
        root.addView(bar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return bar;
    }

    private TextView ambientAction(String text, int color) {
        TextView button = new TextView(this);
        button.setText(text);
        button.setTextColor(color);
        button.setTextSize(15);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setGravity(Gravity.CENTER);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(13));
        bg.setStroke(dp(1), color);
        button.setBackground(bg);
        return button;
    }

    private void applyAmbientSelection(int mode, int color,
                                       View summarySwatch, TextView summaryValue) {
        SharedPreferences.Editor editor = sp.edit().putInt(AmbientTheme.PREF_MODE, mode);
        if (mode == AmbientTheme.MODE_CUSTOM) {
            editor.putInt(AmbientTheme.PREF_CUSTOM, AmbientTheme.opaque(color));
        }
        editor.apply();
        COLOR_ACCENT = AmbientTheme.color(sp);
        updateAmbientChoiceSummary(summarySwatch, summaryValue);
        Gateway.refreshAmbientTheme();
        // Rebuild the current page so sliders, switches and selection strokes use the new accent.
        if (CAT_MAP.equals(selectedCategory)) {
            final View anchor = summaryValue;
            if (anchor != null) anchor.postDelayed(new Runnable() {
                @Override public void run() { openCategory(CAT_MAP); }
            }, 80L);
        }
    }

    private void showBottomSheet(android.app.Dialog dialog, View sheet, int maxWidth) {
        dialog.setContentView(sheet);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();
        android.view.Window window = dialog.getWindow();
        if (window == null) return;
        window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(
                android.graphics.Color.TRANSPARENT));
        window.setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        android.view.WindowManager.LayoutParams attrs = window.getAttributes();
        attrs.dimAmount = 0.58f;
        attrs.width = Math.min(getResources().getDisplayMetrics().widthPixels - dp(20), maxWidth);
        attrs.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        attrs.y = dp(10);
        window.setAttributes(attrs);
    }

    /** A choice row. Tapping it opens an explicit bottom drawer instead of silently cycling. */
    private void addChoice(LinearLayout root, String label, final String key,
                           final int[] values, final String[] labels, int def) {
        addChoice(root, label, key, values, labels, def, null);
    }

    private void addChoice(LinearLayout root, String label, final String key,
                           final int[] values, final String[] labels, int def,
                           final Runnable onUserChange) {
        LinearLayout r = row(root, label);
        final TextView val = new TextView(this);
        val.setTextSize(17);
        val.setTextColor(COLOR_ACCENT);
        val.setTypeface(Typeface.DEFAULT_BOLD);
        val.setText(choiceLabel(key, labelFor(values, labels, sp.getInt(key, def))));
        r.addView(val, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        r.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showChoiceDrawer(label, key, values, labels, def, val, onUserChange);
            }
        });
    }

    private CharSequence choiceLabel(String key, String label) {
        if (!"point_alert_feed".equals(key) || label == null
                || label.indexOf("EXPERIMENTAL") < 0) return label;
        android.text.SpannableString styled = new android.text.SpannableString(label);
        int start = label.indexOf("EXPERIMENTAL");
        styled.setSpan(new android.text.style.ForegroundColorSpan(0xFF55C7FF), start,
                start + "EXPERIMENTAL".length(), android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return styled;
    }

    /** Native bottom drawer styled to match the Mod Settings surface; no Material dependency. */
    private void showChoiceDrawer(String title, final String key,
                                  final int[] values, final String[] labels, int def,
                                  final TextView valueView, final Runnable onUserChange) {
        if (values == null || labels == null || values.length == 0
                || values.length != labels.length) return;

        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);

        LinearLayout sheet = new LinearLayout(this);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding(dp(16), dp(10), dp(16), dp(18));
        GradientDrawable sheetBg = new GradientDrawable();
        sheetBg.setColor(0xFF151821);
        sheetBg.setCornerRadius(dp(24));
        sheetBg.setStroke(dp(1), COLOR_BORDER);
        sheet.setBackground(sheetBg);

        View handle = new View(this);
        GradientDrawable handleBg = new GradientDrawable();
        handleBg.setColor(0xFF626A79);
        handleBg.setCornerRadius(dp(4));
        handle.setBackground(handleBg);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(44), dp(4));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.bottomMargin = dp(15);
        sheet.addView(handle, handleLp);

        TextView heading = new TextView(this);
        heading.setText(title);
        heading.setTextColor(COLOR_TEXT);
        heading.setTextSize(21);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        sheet.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.choose_an_option"));
        hint.setTextColor(COLOR_MUTED);
        hint.setTextSize(13);
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintLp.topMargin = dp(3);
        hintLp.bottomMargin = dp(14);
        sheet.addView(hint, hintLp);

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(false);
        scroll.setVerticalScrollBarEnabled(false);
        LinearLayout list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final int current = sp.getInt(key, def);
        for (int i = 0; i < values.length; i++) {
            final int optionValue = values[i];
            final String optionLabel = labels[i];
            boolean selected = optionValue == current;

            LinearLayout option = new LinearLayout(this);
            option.setOrientation(LinearLayout.HORIZONTAL);
            option.setGravity(Gravity.CENTER_VERTICAL);
            option.setPadding(dp(16), dp(12), dp(12), dp(12));
            option.setClickable(true);
            option.setFocusable(true);
            enableLiftHover(option);
            option.setContentDescription(optionLabel + (selected ? I18n.tr("settings.selected") : ""));

            GradientDrawable optionBg = new GradientDrawable();
            optionBg.setColor(selected ? 0xFF2A2030 : COLOR_CONTROL);
            optionBg.setCornerRadius(dp(15));
            optionBg.setStroke(dp(selected ? 2 : 1),
                    selected ? COLOR_ACCENT : COLOR_BORDER);
            option.setBackground(optionBg);

            TextView name = new TextView(this);
            name.setText(choiceLabel(key, optionLabel));
            name.setTextColor(COLOR_TEXT);
            name.setTextSize(16);
            name.setTypeface(selected ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
            option.addView(name, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView mark = new TextView(this);
            mark.setText(selected ? "✓" : "");
            mark.setTextColor(0xFFFFFFFF);
            mark.setTextSize(16);
            mark.setTypeface(Typeface.DEFAULT_BOLD);
            mark.setGravity(Gravity.CENTER);
            GradientDrawable markBg = new GradientDrawable();
            markBg.setShape(GradientDrawable.OVAL);
            markBg.setColor(selected ? COLOR_ACCENT : 0xFF303542);
            mark.setBackground(markBg);
            option.addView(mark, new LinearLayout.LayoutParams(dp(30), dp(30)));

            option.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View view) {
                    final Runnable applyChoice = new Runnable() {
                        @Override public void run() {
                            sp.edit().putInt(key, optionValue).apply();
                            valueView.setText(choiceLabel(key, labelFor(values, labels, optionValue)));
                            if (onUserChange != null) onUserChange.run();
                        }
                    };
                    dialog.dismiss();
                    if ("ota_channel".equals(key) && optionValue == 1 && current != 1) {
                        showReimeiWarning(applyChoice);
                    } else if ("audio_mix_mode".equals(key) && optionValue == 0 && current != 0) {
                        showAudioMixWarning(applyChoice);
                    } else {
                        applyChoice.run();
                    }
                }
            });

            LinearLayout.LayoutParams optionLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, dp(58));
            if (i > 0) optionLp.topMargin = dp(8);
            list.addView(option, optionLp);
        }

        int listHeight = Math.min(values.length * dp(66),
                Math.min(dp(480), (int) (getResources().getDisplayMetrics().heightPixels * 0.62f)));
        sheet.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, listHeight));
        dialog.setContentView(sheet);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();

        android.view.Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(
                    android.graphics.Color.TRANSPARENT));
            window.setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            android.view.WindowManager.LayoutParams attrs = window.getAttributes();
            attrs.dimAmount = 0.58f;
            attrs.width = Math.min(getResources().getDisplayMetrics().widthPixels - dp(20), dp(640));
            attrs.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            attrs.y = dp(10);
            window.setAttributes(attrs);
        }
    }

    /**
     * Mixing deliberately avoids taking audio focus. That is useful on the phone, but several
     * Android Auto head units then discard the Mod channel completely. Require an explicit
     * confirmation so this compatibility trade-off cannot be enabled by an accidental tap.
     */
    private void showAudioMixWarning(final Runnable onConfirm) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        LinearLayout sheet = createAmbientSheet(I18n.tr("settings.android_auto_warning"),
                I18n.tr("settings.when_you_use_mix_with_audio"));

        TextView details = new TextView(this);
        details.setText(I18n.tr("settings.if_you_often_use_android_auto"));
        details.setTextColor(COLOR_TEXT);
        details.setTextSize(15);
        details.setLineSpacing(dp(3), 1f);
        details.setPadding(dp(4), dp(2), dp(4), dp(14));
        sheet.addView(details, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);

        TextView cancel = new TextView(this);
        cancel.setText(I18n.tr("report.cancel"));
        cancel.setTextColor(COLOR_TEXT);
        cancel.setTextSize(16);
        cancel.setTypeface(Typeface.DEFAULT_BOLD);
        cancel.setGravity(Gravity.CENTER);
        GradientDrawable cancelBg = new GradientDrawable();
        cancelBg.setColor(COLOR_CONTROL);
        cancelBg.setCornerRadius(dp(14));
        cancelBg.setStroke(dp(1), COLOR_BORDER);
        cancel.setBackground(cancelBg);
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) { dialog.dismiss(); }
        });

        TextView confirm = new TextView(this);
        confirm.setText(I18n.tr("settings.agree"));
        confirm.setTextColor(0xFFFFFFFF);
        confirm.setTextSize(16);
        confirm.setTypeface(Typeface.DEFAULT_BOLD);
        confirm.setGravity(Gravity.CENTER);
        GradientDrawable confirmBg = new GradientDrawable();
        confirmBg.setColor(0xFFD32F2F);
        confirmBg.setCornerRadius(dp(14));
        confirmBg.setStroke(dp(1), 0xFFFF6B6B);
        confirm.setBackground(confirmBg);
        confirm.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View view) {
                if (onConfirm != null) onConfirm.run();
                dialog.dismiss();
            }
        });

        LinearLayout.LayoutParams buttonLp = new LinearLayout.LayoutParams(0, dp(54), 1f);
        actions.addView(cancel, buttonLp);
        LinearLayout.LayoutParams confirmLp = new LinearLayout.LayoutParams(0, dp(54), 1f);
        confirmLp.leftMargin = dp(10);
        actions.addView(confirm, confirmLp);
        sheet.addView(actions, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        showBottomSheet(dialog, sheet, dp(560));
    }

    private String labelFor(int[] values, String[] labels, int v) {
        for (int i = 0; i < values.length; i++) if (values[i] == v) return labels[i];
        return String.valueOf(v);
    }

    /** Actual UpcomingAlertRail renderer with isolated sample rows; never mutates live alerts. */
    private UpcomingAlertRail addUpcomingAlertPreview(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(12), dp(10), dp(12), dp(10));
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_CONTROL);
        background.setCornerRadius(dp(14));
        background.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(background);

        LinearLayout heading = new LinearLayout(this);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = new TextView(this);
        title.setText(I18n.tr("settings.preview_the_upcoming_alerts"));
        title.setTextColor(COLOR_TEXT);
        title.setTextSize(14);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        heading.addView(title, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.v2_simulates_the_distance_to_the"));
        hint.setTextColor(COLOR_MUTED);
        hint.setTextSize(12);
        heading.addView(hint);
        card.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        android.widget.HorizontalScrollView scroll =
                new android.widget.HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        scroll.setFillViewport(true);
        scroll.setClipChildren(false);

        FrameLayout stage = new FrameLayout(this);
        stage.setClipChildren(false);
        stage.setClipToPadding(false);
        stage.setPadding(dp(10), dp(8), dp(10), dp(8));
        stage.setMinimumWidth(Math.max(dp(330),
                getResources().getDisplayMetrics().widthPixels - dp(wideSettings ? 390 : 44)));

        UpcomingAlertRail preview = new UpcomingAlertRail(this);
        FrameLayout.LayoutParams railLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        railLp.gravity = Gravity.CENTER;
        stage.addView(preview, railLp);
        scroll.addView(stage, new android.widget.HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(340));
        scrollLp.topMargin = dp(5);
        card.addView(scroll, scrollLp);

        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(8);
        root.addView(card, cardLp);
        updateUpcomingAlertPreview(preview);
        return preview;
    }

    /**
     * Waze stops showing the vehicle tabs after a fixed number of route previews; this keeps them
     * visible. Default on.
     */
    private void addServerDisabledFeatureSwitches(LinearLayout root) {
        addSection(root, I18n.tr("settings.preview_navigation"));
        addSwitch(root, I18n.tr("settings.always_show_the_vehicle_choice_car"),
                WazeFeatureOverrides.PREF_VEHICLE_SELECTOR,
                WazeFeatureOverrides.VEHICLE_SELECTOR_DEFAULT, new BoolCb() {
                    @Override public void on(boolean enabled) { WazeFeatureOverrides.refresh(); }
                });
    }

    private void updateUpcomingAlertPreview(UpcomingAlertRail preview) {
        if (preview == null) return;
        java.util.ArrayList<String> rows = new java.util.ArrayList<String>();
        // The first two sit 50 m apart so the preview also shows the V2 zoom between close alerts.
        rows.add("preview\tSpeed\t420 m\t420\tspeeddrop_80");
        rows.add("preview\tCamera\t470 m\t470\ticon_alerter_cam_speed");
        rows.add("preview\tNo passing\t820 m\t820\twme_14");
        preview.setPreviewState(rows,
                sp.getBoolean("upcoming_alerts", true),
                sp.getInt("upcoming_count", 3),
                sp.getInt("upcoming_size", 100),
                sp.getInt("upcoming_icon_size", 100),
                sp.getInt("upcoming_style", 1));
    }

    /** Live mock of Waze's two independent navigation surfaces: lane strip + turn banner. */
    private NavBannerPreview addNavBannerPreview(LinearLayout root) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(12), dp(10), dp(12), dp(12));
        GradientDrawable background = new GradientDrawable();
        background.setColor(COLOR_CONTROL);
        background.setCornerRadius(dp(14));
        background.setStroke(dp(1), COLOR_BORDER);
        card.setBackground(background);

        LinearLayout heading = new LinearLayout(this);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = new TextView(this);
        title.setText(I18n.tr("settings.preview_the_guidance_panel"));
        title.setTextColor(COLOR_TEXT);
        title.setTextSize(14);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        heading.addView(title, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView hint = new TextView(this);
        hint.setText(I18n.tr("settings.lanes_turn"));
        hint.setTextColor(COLOR_MUTED);
        hint.setTextSize(12);
        heading.addView(hint);
        card.addView(heading, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        NavBannerPreview preview = new NavBannerPreview(this);
        preview.syncFromPreferences();
        LinearLayout.LayoutParams previewLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(wideSettings ? 190 : 150));
        previewLp.topMargin = dp(8);
        card.addView(preview, previewLp);

        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.topMargin = dp(8);
        root.addView(card, cardLp);
        return preview;
    }

    private final class NavBannerPreview extends FrameLayout {
        private final LinearLayout nativeNav;
        private final View nativeLane;
        private final View nativeTop;
        private final TextView status;
        private int opacityPercent = 78;
        private int sizePercent = 100;
        private float streetBasePx;

        NavBannerPreview(Context context) {
            super(context);
            setClipChildren(true);
            setClipToPadding(true);
            GradientDrawable map = new GradientDrawable(
                    GradientDrawable.Orientation.TL_BR,
                    new int[]{0xFF34404D, 0xFF252C35, 0xFF3A4652});
            map.setCornerRadius(dp(10));
            setBackground(map);

            nativeNav = new LinearLayout(context);
            nativeNav.setOrientation(LinearLayout.VERTICAL);
            nativeNav.setClipChildren(false);
            nativeNav.setClipToPadding(false);
            nativeNav.setBackgroundColor(android.graphics.Color.TRANSPARENT);
            addView(nativeNav, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            // The banner grows with the street text; fit it again whenever its measured size changes.
            nativeNav.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override public void onLayoutChange(View v, int left, int top, int right, int bottom,
                                                     int oldLeft, int oldTop, int oldRight, int oldBottom) {
                    if (bottom - top != oldBottom - oldTop || right - left != oldRight - oldLeft) {
                        post(new Runnable() {
                            @Override public void run() { applyPreviewAppearance(); }
                        });
                    }
                }
            });

            View lane = null;
            View top = null;
            try {
                int navbarLayout = resourceId("layout", "navbar");
                if (navbarLayout != 0) {
                    getLayoutInflater().inflate(navbarLayout, nativeNav, true);
                    lane = nativeNav.findViewById(resourceId("id", "laneGuidanceView"));
                    top = nativeNav.findViewById(resourceId("id", "navBarTop"));
                    bindNativeInstruction(nativeNav);
                    bindNativeLanes(lane);
                }
            } catch (Throwable error) {
                android.util.Log.w("WazeGW-Settings", "Native navbar preview unavailable", error);
            }
            nativeLane = lane;
            nativeTop = top;
            if (nativeLane != null) nativeLane.setVisibility(View.VISIBLE);
            if (nativeTop != null) nativeTop.setBackgroundColor(0xFF000000);

            status = new TextView(context);
            status.setTextColor(COLOR_ACCENT);
            status.setTextSize(11);
            status.setTypeface(Typeface.DEFAULT_BOLD);
            status.setGravity(Gravity.RIGHT | Gravity.CENTER_VERTICAL);
            FrameLayout.LayoutParams statusLp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, dp(24), Gravity.RIGHT | Gravity.BOTTOM);
            statusLp.rightMargin = dp(8);
            statusLp.bottomMargin = dp(2);
            addView(status, statusLp);
        }

        void syncFromPreferences() {
            opacityPercent = Math.max(40, Math.min(100,
                    sp.getInt("nav_banner_opacity", 78)));
            sizePercent = Math.max(50, Math.min(100,
                    sp.getInt("nav_banner_size", 100)));
            applyPreviewStreetText();
            applyPreviewAppearance();
            // The banner grows with the street text; fit it again once it has been measured.
            post(new Runnable() {
                @Override public void run() { applyPreviewAppearance(); }
            });
        }

        private void applyPreviewStreetText() {
            if (nativeNav == null) return;
            View street = nativeNav.findViewById(resourceId("id", "navBarStreetLine"));
            if (!(street instanceof TextView)) return;
            TextView text = (TextView) street;
            if (streetBasePx <= 0f) streetBasePx = text.getTextSize();
            int percent = Math.max(100, Math.min(150, sp.getInt("nav_street_text_size", 100)));
            text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, streetBasePx * percent / 100f);
        }

        @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            post(new Runnable() {
                @Override public void run() { applyPreviewAppearance(); }
            });
        }

        private void applyPreviewAppearance() {
            if (nativeNav == null) return;
            float fit = 1f;
            // The card has a fixed height, so the banner's own measured height is capped by it and
            // would hide how much the street text grew. Measure what the banner wants instead.
            if (getWidth() > 0) {
                nativeNav.measure(View.MeasureSpec.makeMeasureSpec(getWidth(), View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            }
            int measuredHeight = nativeNav.getMeasuredHeight();
            int measuredWidth = nativeNav.getMeasuredWidth();
            if (getWidth() > 0 && measuredWidth > 0) {
                fit = Math.min(fit, (getWidth() - dp(8)) / (float) measuredWidth);
            }
            if (getHeight() > dp(26) && measuredHeight > 0) {
                fit = Math.min(fit, (getHeight() - dp(26)) / (float) measuredHeight);
            }
            float scale = Math.max(0.1f, fit * sizePercent / 100f);
            nativeNav.setPivotX(0f);
            nativeNav.setPivotY(0f);
            nativeNav.setScaleX(scale);
            nativeNav.setScaleY(scale);
            setBackgroundAlpha(nativeTop, opacityPercent);
            setBackgroundAlpha(nativeLane, opacityPercent);
            status.setText(I18n.f("settings.0_background_1_size", opacityPercent, sizePercent));
            nativeNav.invalidate();
        }

        private void setBackgroundAlpha(View view, int percent) {
            if (view == null) return;
            android.graphics.drawable.Drawable background = view.getBackground();
            if (background != null) background.mutate().setAlpha(
                    Math.round(255f * percent / 100f));
        }

        private void bindNativeInstruction(View root) throws Exception {
            View instruction = root.findViewById(resourceId("id", "instructionView"));
            if (instruction != null) {
                instruction.setVisibility(View.VISIBLE);
                // The generic phone asset is dark for the light navigation banner. This preview
                // deliberately uses Waze's transparent car/HUD variant so it stays white on the
                // same black background used by the runtime navbar.
                int arrow = resourceId("drawable", "car_big_trans_direction_right");
                java.lang.reflect.Method setIcon = instruction.getClass()
                        .getMethod("a", java.lang.Integer.class);
                setIcon.invoke(instruction, java.lang.Integer.valueOf(arrow));
                instruction.getClass().getMethod("b", String.class).invoke(instruction, "");
            }
            View distance = root.findViewById(resourceId("id", "navBarDistance"));
            if (distance instanceof TextView) ((TextView) distance).setText("420 m");
            View street = root.findViewById(resourceId("id", "navBarStreetLine"));
            if (street instanceof TextView) {
                ((TextView) street).setText(I18n.tr("settings.ct_phan_thi_t_d_u"));
                ((TextView) street).setTextColor(AmbientTheme.color(sp));
            }
        }

        private void bindNativeLanes(View lane) throws Exception {
            if (lane == null) return;
            ClassLoader loader = getClassLoader();
            Class<?> angleClass = Class.forName("com.waze.ui.navbar.b", true, loader);
            Class<?> laneClass = Class.forName("com.waze.ui.navbar.c", true, loader);
            java.lang.reflect.Constructor<?> angleCtor =
                    angleClass.getConstructor(int.class, boolean.class);
            java.lang.reflect.Constructor<?> laneCtor =
                    laneClass.getConstructor(java.util.List.class);
            java.util.ArrayList<Object> lanes = new java.util.ArrayList<Object>();
            int[] angles = new int[]{0, 0, 0, 90, 90};
            for (int i = 0; i < angles.length; i++) {
                java.util.ArrayList<Object> laneAngles = new java.util.ArrayList<Object>();
                laneAngles.add(angleCtor.newInstance(
                        Integer.valueOf(angles[i]), Boolean.valueOf(i >= 2)));
                lanes.add(laneCtor.newInstance(laneAngles));
            }
            lane.getClass().getMethod("e", java.util.List.class,
                    boolean.class, boolean.class).invoke(lane, lanes,
                    Boolean.FALSE, Boolean.TRUE);
            lane.setVisibility(View.VISIBLE);
        }

        private int resourceId(String type, String name) {
            int id = getResources().getIdentifier(name, type, getPackageName());
            if (id == 0) id = getResources().getIdentifier(name, type, "com.waze");
            return id;
        }
    }

    /** A slider from min..max (step), live value with unit (+sign if signed) + optional red warning. */
    private SeekBar addSlider(LinearLayout root, String label, final String key,
                           final int min, final int max, final int step, int def,
                           final String unit, final boolean signed, String warning,
                           final Runnable onUserChange) {
        LinearLayout block = new LinearLayout(this);
        block.setOrientation(LinearLayout.VERTICAL);
        block.setPadding(dp(14), dp(12), dp(14), dp(12));
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setColor(COLOR_CONTROL);
        bg.setCornerRadius(dp(14));
        bg.setStroke(dp(1), COLOR_BORDER);
        block.setBackground(bg);
        LinearLayout.LayoutParams blp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        blp.topMargin = dp(8);
        root.addView(block, blp);

        LinearLayout hr = new LinearLayout(this);
        hr.setOrientation(LinearLayout.HORIZONTAL);
        hr.setGravity(Gravity.CENTER_VERTICAL);
        TextView t = new TextView(this);
        t.setText(label);
        t.setTextSize(17);
        t.setTextColor(COLOR_TEXT);
        hr.addView(t, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        final TextView val = new TextView(this);
        val.setTextSize(17);
        val.setTextColor(COLOR_ACCENT);
        val.setTypeface(Typeface.DEFAULT_BOLD);
        val.setText(fmtVal(sp.getInt(key, def), unit, signed));
        hr.addView(val);
        block.addView(hr, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final SeekBar sb = new SeekBar(this);
        sb.setMax((max - min) / step);
        sb.setProgress((sp.getInt(key, def) - min) / step);
        sb.setTag(new Object[]{key, min, step, unit, signed, val});   // for resetSlider()
        try {
            sb.setProgressTintList(android.content.res.ColorStateList.valueOf(COLOR_ACCENT));
            sb.setThumbTintList(android.content.res.ColorStateList.valueOf(COLOR_ACCENT));
        } catch (Throwable ignore) { }
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar s, int progress, boolean fromUser) {
                int v = min + progress * step;
                sp.edit().putInt(key, v).apply();
                val.setText(fmtVal(v, unit, signed));
                if (fromUser && onUserChange != null) onUserChange.run();
            }
            @Override public void onStartTrackingTouch(SeekBar s) { }
            @Override public void onStopTrackingTouch(SeekBar s) { }
        });
        LinearLayout.LayoutParams sbp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sbp.topMargin = dp(6);
        block.addView(sb, sbp);

        if (warning != null) {
            TextView w = new TextView(this);
            w.setText("⚠  " + warning);
            w.setTextSize(13);
            w.setTextColor(0xFFE2231A);
            LinearLayout.LayoutParams wp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            wp.topMargin = dp(6);
            block.addView(w, wp);
        }
        return sb;
    }

    /** Puts a Waze alert badge (assets/wz_pins/<pinName>.png) in front of a slider's label. */
    private void addSliderIcon(SeekBar bar, String pinName) {
        android.graphics.Bitmap icon = Signs.pin(this, pinName);
        if (icon == null || bar == null || !(bar.getParent() instanceof ViewGroup)) return;
        View header = ((ViewGroup) bar.getParent()).getChildAt(0);
        if (!(header instanceof LinearLayout)) return;
        ImageView view = new ImageView(this);
        view.setImageBitmap(icon);
        view.setScaleType(ImageView.ScaleType.FIT_CENTER);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(34), dp(34));
        lp.rightMargin = dp(10);
        ((LinearLayout) header).addView(view, 0, lp);
    }

    /** Reset a slider to a neutral value (pref + thumb + label), without re-firing its onUserChange. */
    private void resetSlider(SeekBar bar, int neutral) {
        if (bar == null) return;
        Object[] h = (Object[]) bar.getTag();
        String key = (String) h[0];
        int min = (Integer) h[1], step = (Integer) h[2];
        String unit = (String) h[3];
        boolean signed = (Boolean) h[4];
        TextView val = (TextView) h[5];
        sp.edit().putInt(key, neutral).apply();
        bar.setProgress((neutral - min) / step);   // programmatic -> fromUser=false, no re-trigger
        val.setText(fmtVal(neutral, unit, signed));
    }

    private String fmtVal(int v, String unit, boolean signed) {
        return (signed && v > 0 ? "+" + v : String.valueOf(v)) + unit;
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }
}
