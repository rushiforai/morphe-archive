package de.mobile.archive;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public final class ArchiveUi {
    private static final String TAG = "MobileArchiveUi";
    private static final int MENU_ID_ARCHIVE = 0x7A5C1234;
    private static final String TAG_ARCHIVE_BAR = "mobile_de_archive_card_bar";
    private static volatile WeakReference<Activity> currentActivityRef = new WeakReference<>(null);
    private static volatile Field cachedItemViewField = null;
    private static volatile int cachedParkInfoContainerId = -1;
    private static volatile int cachedSrpItemContainerId = -1;

    private static boolean isGerman() {
        String lang = Locale.getDefault().getLanguage();
        return lang != null && lang.toLowerCase(Locale.ROOT).startsWith("de");
    }

    private static String t(String de, String en) {
        return isGerman() ? de : en;
    }

    private static boolean isAlive(Activity activity) {
        return activity != null && !activity.isFinishing() && !activity.isDestroyed();
    }

    private static void runIfAlive(final Activity preferred, final Runnable action) {
        final Activity target = isAlive(preferred) ? preferred : getCurrentActivity();
        if (!isAlive(target)) return;
        target.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (!isAlive(target)) return;
                try {
                    action.run();
                } catch (Throwable t) {
                    Log.w(TAG, "UI callback failed", t);
                }
            }
        });
    }

    private static boolean isDarkMode(Context ctx) {
        try {
            int mode = ctx.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            return mode == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String formatBytes(long bytes) {
        if (bytes < 1024L) return bytes + " B";
        if (bytes < 1024L * 1024L) return String.format(Locale.US, "%.1f KB", bytes / 1024.0);
        return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
    }

    public static void setCurrentActivity(Activity activity) {
        currentActivityRef = new WeakReference<>(activity);
    }

    public static Activity getCurrentActivity() {
        Activity a = currentActivityRef.get();
        return isAlive(a) ? a : null;
    }

    public static void injectMenu(Menu menu) {
        if (menu == null) return;
        try {
            if (menu.findItem(MENU_ID_ARCHIVE) != null) return;
            MenuItem item = menu.add(Menu.NONE, MENU_ID_ARCHIVE, 999, t("Archiv (Google Drive)", "Archive (Google Drive)"));
            item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            item.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
                @Override
                public boolean onMenuItemClick(MenuItem menuItem) {
                    Activity act = getCurrentActivity();
                    if (isAlive(act)) {
                        showMainArchiveDialog(act);
                    }
                    return true;
                }
            });
        } catch (Throwable ignored) {
        }
    }

    public static void showMainArchiveDialog(final Activity activity) {
        final ArchiveManager mgr = ArchiveManager.get();
        if (mgr == null || !isAlive(activity)) return;
        final ArchiveConfig cfg = mgr.getConfig();

        String[] actions = new String[]{
                t("Archivierte Inserate anzeigen (Lokal + Drive)", "Browse archived listings (Local + Drive)"),
                t("Einstellungen & Google Drive einrichten", "Settings & Google Drive setup"),
                t("Jetzt alle Inserate nach Google Drive synchronisieren", "Sync all listings to Google Drive now"),
                t("Google Drive Verbindung testen", "Test Google Drive connection"),
                t("Lokalen Bild-Cache leeren", "Clear local image cache")
        };

        new AlertDialog.Builder(activity)
                .setTitle(t("mobile.de Inserats-Archiv", "mobile.de Listing Archive"))
                .setItems(actions, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        if (which == 0) {
                            showArchivedListingsDialog(activity);
                        } else if (which == 1) {
                            showSettingsDialog(activity);
                        } else if (which == 2) {
                            Toast.makeText(activity, t("Synchronisiere mit Google Drive...", "Syncing to Google Drive..."), Toast.LENGTH_SHORT).show();
                            mgr.syncAllToDriveAsync(new ArchiveManager.SyncProgressCallback() {
                                @Override
                                public void onDone(final String result) {
                                    runIfAlive(activity, new Runnable() {
                                        @Override
                                        public void run() {
                                            Toast.makeText(activity, result, Toast.LENGTH_LONG).show();
                                        }
                                    });
                                }
                            });
                        } else if (which == 3) {
                            Toast.makeText(activity, t("Teste Google Drive Verbindung...", "Testing Google Drive connection..."), Toast.LENGTH_SHORT).show();
                            mgr.runAsync(new Runnable() {
                                @Override
                                public void run() {
                                    final String res = mgr.getDrive().testConnection();
                                    runIfAlive(activity, new Runnable() {
                                        @Override
                                        public void run() {
                                            new AlertDialog.Builder(activity)
                                                    .setTitle(t("Verbindungstest", "Connection Test"))
                                                    .setMessage(res)
                                                    .setPositiveButton("OK", null)
                                                    .show();
                                        }
                                    });
                                }
                            });
                        } else if (which == 4) {
                            new AlertDialog.Builder(activity)
                                    .setTitle(t("Lokalen Bild-Cache leeren?", "Clear local image cache?"))
                                    .setMessage(t(
                                            "Entfernt nur lokal gespeicherte Fotos. Gespeicherte Inserats-Daten und dein Google-Drive-Backup bleiben erhalten.",
                                            "Removes only locally cached photos. Saved listing data and your Google Drive backup remain untouched."
                                    ))
                                    .setPositiveButton(t("Leeren", "Clear"), new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface d, int w) {
                                            mgr.clearImageCacheAsync(new ArchiveManager.ArchiveActionCallback() {
                                                @Override
                                                public void onDone(boolean success, final String message) {
                                                    runIfAlive(activity, new Runnable() {
                                                        @Override
                                                        public void run() {
                                                            Toast.makeText(activity, message, Toast.LENGTH_SHORT).show();
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    })
                                    .setNegativeButton(t("Abbrechen", "Cancel"), null)
                                    .show();
                        }
                    }
                })
                .setNeutralButton(t("Status & Speicher", "Status & Storage"), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int w) {
                        mgr.runAsync(new Runnable() {
                            @Override
                            public void run() {
                                final LocalArchiveStore.StorageStats stats = mgr.getStore().getStorageStats();
                                final String driveState;
                                if (!cfg.isDriveConfigured()) {
                                    driveState = t("Nicht verbunden (nur lokal)", "Not connected (local only)");
                                } else if (ArchiveConfig.MODE_APPS_SCRIPT.equals(cfg.getDriveMode())) {
                                    driveState = "Google Drive (Apps Script)";
                                } else {
                                    driveState = "Google Drive (OAuth API)";
                                }
                                final String summary = t("Lokal archiviert: ", "Locally archived: ") + stats.listingCount + t(" Inserate\n", " listings\n")
                                        + t("Lokale Fotos: ", "Local photos: ") + stats.imageCount + " (" + formatBytes(stats.imagesBytes) + " / max. " + cfg.getMaxImageCacheMb() + " MB)\n"
                                        + t("Speicher gesamt: ", "Total storage: ") + formatBytes(stats.totalBytes()) + "\n"
                                        + t("Nur im WLAN: ", "Wi-Fi only: ") + (cfg.isWifiOnlyMedia() ? t("Ja", "Yes") : t("Nein", "No")) + "\n"
                                        + "Google Drive: " + driveState + "\n"
                                        + "Status: " + cfg.getLastStatus();
                                runIfAlive(activity, new Runnable() {
                                    @Override
                                    public void run() {
                                        new AlertDialog.Builder(activity)
                                                .setTitle(t("Archiv-Status", "Archive Status"))
                                                .setMessage(summary)
                                                .setPositiveButton("OK", null)
                                                .show();
                                    }
                                });
                            }
                        });
                    }
                })
                .setNegativeButton(t("Schließen", "Close"), null)
                .show();
    }

    private static void showArchivedListingsDialog(final Activity activity) {
        final ArchiveManager mgr = ArchiveManager.get();
        if (mgr == null || !isAlive(activity)) return;
        Toast.makeText(activity, t("Lade Archivliste...", "Loading archive list..."), Toast.LENGTH_SHORT).show();

        mgr.runAsync(new Runnable() {
            @Override
            public void run() {
                final List<LocalArchiveStore.ListingMeta> allItems = mgr.loadCombinedListingsBlocking(true);
                runIfAlive(activity, new Runnable() {
                    @Override
                    public void run() {
                        if (allItems.isEmpty()) {
                            new AlertDialog.Builder(activity)
                                    .setTitle(t("Archivierte Inserate", "Archived Listings"))
                                    .setMessage(t(
                                            "Noch keine Inserate archiviert. Öffne oder parke Inserate in mobile.de — sie werden automatisch lokal und (falls eingerichtet) in Google Drive gespeichert.",
                                            "No listings archived yet. Open or park listings in mobile.de — they are automatically saved locally and (if configured) to Google Drive."
                                    ))
                                    .setPositiveButton("OK", null)
                                    .show();
                            return;
                        }

                        final SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yy HH:mm", Locale.getDefault());
                        final List<LocalArchiveStore.ListingMeta> filtered = new ArrayList<>(allItems);
                        final List<String> labels = new ArrayList<>();

                        final Runnable rebuildLabels = new Runnable() {
                            @Override
                            public void run() {
                                labels.clear();
                                for (LocalArchiveStore.ListingMeta m : filtered) {
                                    String icon = m.syncedToDrive
                                            ? (m.fromDriveOnly ? "[Drive] " : t("[Lokal+Drive] ", "[Local+Drive] "))
                                            : t("[Lokal] ", "[Local] ");
                                    String price = (m.price != null && !m.price.isEmpty()) ? (" • " + m.price) : "";
                                    String date = m.archivedAt > 0
                                            ? ("\n" + sdf.format(new Date(m.archivedAt)) + " • ID " + m.adId)
                                            : ("\nID " + m.adId);
                                    labels.add(icon + (m.title != null ? m.title : m.adId) + price + date);
                                }
                            }
                        };
                        rebuildLabels.run();

                        LinearLayout container = new LinearLayout(activity);
                        container.setOrientation(LinearLayout.VERTICAL);
                        int pad = dp(activity, 12);
                        container.setPadding(pad, dp(activity, 8), pad, 0);

                        final EditText searchBox = new EditText(activity);
                        searchBox.setHint(t("Suchen (Titel, Preis, ID)...", "Search (title, price, ID)..."));
                        searchBox.setSingleLine(true);
                        container.addView(searchBox, new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        ));

                        TextView hint = new TextView(activity);
                        hint.setText(t("Tippen: Öffnen  •  Gedrückt halten: Lokal löschen", "Tap: Open  •  Long-press: Delete locally"));
                        hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
                        hint.setPadding(dp(activity, 4), dp(activity, 2), dp(activity, 4), dp(activity, 6));
                        container.addView(hint);

                        final ArrayAdapter<String> adapter = new ArrayAdapter<>(activity, android.R.layout.simple_list_item_1, labels);
                        ListView lv = new ListView(activity);
                        lv.setAdapter(adapter);
                        container.addView(lv, new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT
                        ));

                        searchBox.addTextChangedListener(new TextWatcher() {
                            @Override
                            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

                            @Override
                            public void onTextChanged(CharSequence s, int start, int before, int count) {
                                String q = s == null ? "" : s.toString().trim().toLowerCase(Locale.ROOT);
                                filtered.clear();
                                for (LocalArchiveStore.ListingMeta m : allItems) {
                                    if (q.isEmpty()
                                            || (m.title != null && m.title.toLowerCase(Locale.ROOT).contains(q))
                                            || (m.price != null && m.price.toLowerCase(Locale.ROOT).contains(q))
                                            || (m.adId != null && m.adId.contains(q))) {
                                        filtered.add(m);
                                    }
                                }
                                rebuildLabels.run();
                                adapter.notifyDataSetChanged();
                            }

                            @Override
                            public void afterTextChanged(Editable s) {}
                        });

                        final AlertDialog dlg = new AlertDialog.Builder(activity)
                                .setTitle(t("Archiv (" + allItems.size() + " Inserate)", "Archive (" + allItems.size() + " listings)"))
                                .setView(container)
                                .setNegativeButton(t("Schließen", "Close"), null)
                                .create();

                        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                            @Override
                            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                if (position < 0 || position >= filtered.size()) return;
                                LocalArchiveStore.ListingMeta selected = filtered.get(position);
                                dlg.dismiss();
                                openListingInMobileDe(activity, selected.adId);
                            }
                        });

                        lv.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
                            @Override
                            public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {
                                if (position < 0 || position >= filtered.size()) return true;
                                final LocalArchiveStore.ListingMeta selected = filtered.get(position);
                                if (selected.fromDriveOnly) {
                                    Toast.makeText(activity, t("Dieses Inserat liegt nur in Google Drive.", "This listing is only stored in Google Drive."), Toast.LENGTH_SHORT).show();
                                    return true;
                                }
                                new AlertDialog.Builder(activity)
                                        .setTitle(t("Lokal löschen?", "Delete locally?"))
                                        .setMessage((selected.title != null ? selected.title : selected.adId) + "\n(ID " + selected.adId + ")")
                                        .setPositiveButton(t("Löschen", "Delete"), new DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(DialogInterface d, int w) {
                                                mgr.deleteListingAsync(selected.adId, new ArchiveManager.ArchiveActionCallback() {
                                                    @Override
                                                    public void onDone(boolean success, final String msg) {
                                                        runIfAlive(activity, new Runnable() {
                                                            @Override
                                                            public void run() {
                                                                Toast.makeText(activity, msg, Toast.LENGTH_SHORT).show();
                                                                allItems.remove(selected);
                                                                filtered.remove(selected);
                                                                rebuildLabels.run();
                                                                adapter.notifyDataSetChanged();
                                                            }
                                                        });
                                                    }
                                                });
                                            }
                                        })
                                        .setNegativeButton(t("Abbrechen", "Cancel"), null)
                                        .show();
                                return true;
                            }
                        });

                        dlg.show();
                    }
                });
            }
        });
    }

    private static void openListingInMobileDe(Context context, String adId) {
        try {
            ArchiveManager mgr = ArchiveManager.get();
            if (mgr != null) {
                mgr.requestForceArchive(adId);
            }
            Activity act = (context instanceof Activity && isAlive((Activity) context)) ? (Activity) context : getCurrentActivity();
            Context launchCtx = act != null ? act : context;
            Intent intent = new Intent(
                    Intent.ACTION_VIEW,
                    Uri.parse("https://suchen.mobile.de/fahrzeuge/details.html?id=" + adId)
            );
            intent.setPackage(launchCtx.getPackageName());
            if (!(launchCtx instanceof Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            launchCtx.startActivity(intent);
        } catch (Throwable t) {
            Toast.makeText(context, t("Konnte Inserat #" + adId + " nicht öffnen: ", "Could not open listing #" + adId + ": ") + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    // ==================== Per-Listing Inline Button (Parkplatz & SRP) ====================

    public static void bindParkedListingButton(Object viewHolder, Object parkedListingItem) {
        try {
            View itemView = extractItemView(viewHolder);
            if (itemView == null || parkedListingItem == null) return;

            String adId = extractParkedAdId(parkedListingItem);
            if (adId == null || adId.isEmpty()) return;

            boolean isExpired = false;
            try {
                Object res = invokeNoArg(parkedListingItem, "listingNotFound");
                if (res instanceof Boolean) isExpired = (Boolean) res;
            } catch (Throwable ignored) {
            }

            Context ctx = itemView.getContext();
            if (cachedParkInfoContainerId == -1) {
                cachedParkInfoContainerId = ctx.getResources().getIdentifier(
                        "vehicle_park_info_container", "id", ctx.getPackageName());
            }
            LinearLayout target = null;
            if (cachedParkInfoContainerId != 0) {
                View found = itemView.findViewById(cachedParkInfoContainerId);
                if (found instanceof LinearLayout) {
                    target = (LinearLayout) found;
                }
            }
            if (target == null) {
                target = findVerticalLinearLayout(itemView, 0);
            }
            if (target != null) {
                target.setVisibility(View.VISIBLE);
                attachOrUpdateArchiveButton(target, adId, isExpired, 0, 6, 0, 4);
            }
        } catch (Throwable t) {
            Log.w(TAG, "bindParkedListingButton error", t);
        }
    }

    public static void bindSrpListingButton(Object viewHolder, Object srpItem) {
        try {
            View itemView = extractItemView(viewHolder);
            if (itemView == null || srpItem == null) return;

            String adId = extractSrpAdId(srpItem);
            if (adId == null || adId.isEmpty()) return;

            Context ctx = itemView.getContext();
            if (cachedSrpItemContainerId == -1) {
                cachedSrpItemContainerId = ctx.getResources().getIdentifier(
                        "item_container", "id", ctx.getPackageName());
            }
            LinearLayout target = null;
            if (cachedSrpItemContainerId != 0) {
                View found = itemView.findViewById(cachedSrpItemContainerId);
                if (found instanceof LinearLayout && ((LinearLayout) found).getOrientation() == LinearLayout.VERTICAL) {
                    target = (LinearLayout) found;
                }
            }
            if (target == null) {
                target = findVerticalLinearLayout(itemView, 0);
            }
            if (target != null) {
                attachOrUpdateArchiveButton(target, adId, false, 12, 2, 12, 8);
            }
        } catch (Throwable t) {
            Log.w(TAG, "bindSrpListingButton error", t);
        }
    }

    public static void bindListingCardButton(Object viewHolder, Object uiState) {
        try {
            View itemView = extractItemView(viewHolder);
            if (itemView == null || uiState == null) return;

            Object idObj = invokeNoArg(uiState, "getListingId");
            String adId = idObj instanceof String ? ((String) idObj).trim() : null;
            if (adId == null || adId.isEmpty()) return;

            LinearLayout target = findVerticalLinearLayout(itemView, 0);
            if (target != null) {
                attachOrUpdateArchiveButton(target, adId, false, 12, 2, 12, 8);
            }
        } catch (Throwable t) {
            Log.w(TAG, "bindListingCardButton error", t);
        }
    }

    private static void attachOrUpdateArchiveButton(
            LinearLayout parent,
            final String adId,
            final boolean isExpired,
            int padLeftDp,
            int padTopDp,
            int padRightDp,
            int padBottomDp
    ) {
        final ArchiveManager mgr = ArchiveManager.get();
        if (mgr == null || !mgr.getConfig().isEnabled()) return;

        final Context ctx = parent.getContext();
        View existingBar = parent.findViewWithTag(TAG_ARCHIVE_BAR);
        LinearLayout bar;
        final TextView btn;

        if (existingBar instanceof LinearLayout && ((LinearLayout) existingBar).getChildCount() > 0
                && ((LinearLayout) existingBar).getChildAt(0) instanceof TextView) {
            bar = (LinearLayout) existingBar;
            btn = (TextView) bar.getChildAt(0);
        } else {
            bar = new LinearLayout(ctx);
            bar.setTag(TAG_ARCHIVE_BAR);
            bar.setOrientation(LinearLayout.HORIZONTAL);
            bar.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            bar.setPadding(dp(ctx, padLeftDp), dp(ctx, padTopDp), dp(ctx, padRightDp), dp(ctx, padBottomDp));
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            bar.setLayoutParams(barLp);

            btn = new TextView(ctx);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            btn.setTypeface(Typeface.DEFAULT_BOLD);
            btn.setSingleLine(true);
            btn.setGravity(Gravity.CENTER);
            btn.setPadding(dp(ctx, 12), dp(ctx, 6), dp(ctx, 12), dp(ctx, 6));
            btn.setClickable(true);
            btn.setFocusable(true);
            bar.addView(btn, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
            parent.addView(bar);
        }

        bar.setAlpha(1.0f);
        btn.setTag(adId);
        boolean isArchived = mgr.isArchivedFast(adId);
        boolean driveConfigured = mgr.getConfig().isDriveConfigured();

        if (!isArchived && isExpired && !driveConfigured) {
            bar.setVisibility(View.GONE);
            return;
        }
        bar.setVisibility(View.VISIBLE);
        styleArchiveButton(ctx, btn, isArchived, isExpired);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean archivedNow = mgr.isArchivedFast(adId);
                if (archivedNow || isExpired) {
                    openListingInMobileDe(ctx, adId);
                } else {
                    btn.setEnabled(false);
                    btn.setText(t("Speichere...", "Saving..."));
                    mgr.archiveNowAsync(adId, new ArchiveManager.ArchiveActionCallback() {
                        @Override
                        public void onDone(boolean success, String message) {
                            Toast.makeText(ctx.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
                            if (adId.equals(btn.getTag())) {
                                btn.setEnabled(true);
                                styleArchiveButton(ctx, btn, success || mgr.isArchivedFast(adId), isExpired);
                            }
                        }
                    });
                }
            }
        });

        btn.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                Activity act = (ctx instanceof Activity && isAlive((Activity) ctx)) ? (Activity) ctx : getCurrentActivity();
                if (isAlive(act)) {
                    showMainArchiveDialog(act);
                }
                return true;
            }
        });
    }

    private static void styleArchiveButton(Context ctx, TextView btn, boolean isArchived, boolean isExpired) {
        boolean dark = isDarkMode(ctx);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(ctx, 16));
        btn.setEnabled(true);
        if (isArchived) {
            bg.setColor(Color.parseColor(dark ? "#0D9488" : "#0F766E"));
            btn.setTextColor(Color.WHITE);
            btn.setText(t("\u2713 Archiv", "\u2713 Archive"));
        } else if (isExpired) {
            bg.setColor(Color.parseColor(dark ? "#2563EB" : "#1D4ED8"));
            btn.setTextColor(Color.WHITE);
            btn.setText("Drive");
        } else {
            bg.setColor(Color.parseColor(dark ? "#4B5563" : "#374151"));
            btn.setTextColor(Color.WHITE);
            btn.setText(t("+ Archiv", "+ Archive"));
        }
        btn.setBackground(bg);
    }

    private static View extractItemView(Object viewHolder) {
        if (viewHolder == null) return null;
        try {
            Field f = cachedItemViewField;
            if (f != null && f.getDeclaringClass().isInstance(viewHolder)) {
                Object val = f.get(viewHolder);
                if (val instanceof View) return (View) val;
            }
            Class<?> cls = viewHolder.getClass();
            while (cls != null && cls != Object.class) {
                try {
                    Field candidate = cls.getDeclaredField("itemView");
                    if (View.class.isAssignableFrom(candidate.getType())) {
                        candidate.setAccessible(true);
                        cachedItemViewField = candidate;
                        Object val = candidate.get(viewHolder);
                        if (val instanceof View) return (View) val;
                    }
                } catch (NoSuchFieldException ignored) {
                }
                cls = cls.getSuperclass();
            }
            cls = viewHolder.getClass().getSuperclass();
            while (cls != null && cls != Object.class) {
                for (Field candidate : cls.getDeclaredFields()) {
                    if (candidate.getType() == View.class) {
                        candidate.setAccessible(true);
                        Object val = candidate.get(viewHolder);
                        if (val instanceof View) {
                            cachedItemViewField = candidate;
                            return (View) val;
                        }
                    }
                }
                cls = cls.getSuperclass();
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String extractParkedAdId(Object parkedListingItem) {
        try {
            Object parking = invokeNoArg(parkedListingItem, "getParking");
            if (parking != null) {
                Object id = invokeNoArg(parking, "getListingId");
                if (id instanceof String && !((String) id).isEmpty()) {
                    return ((String) id).trim();
                }
            }
            Object listing = invokeNoArg(parkedListingItem, "getListing");
            if (listing != null) {
                Object id = invokeNoArg(listing, "getId");
                if (id instanceof String && !((String) id).isEmpty()) {
                    return ((String) id).trim();
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String extractSrpAdId(Object srpItem) {
        try {
            Object listing = invokeNoArg(srpItem, "getListing");
            if (listing != null) {
                Object id = invokeNoArg(listing, "getId");
                if (id instanceof String && !((String) id).isEmpty()) {
                    return ((String) id).trim();
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object invokeNoArg(Object target, String methodName) {
        if (target == null) return null;
        try {
            Method m = target.getClass().getMethod(methodName);
            return m.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static LinearLayout findVerticalLinearLayout(View root, int depth) {
        if (root == null || depth > 4) return null;
        if (root instanceof LinearLayout && ((LinearLayout) root).getOrientation() == LinearLayout.VERTICAL) {
            if (!TAG_ARCHIVE_BAR.equals(root.getTag())) {
                return (LinearLayout) root;
            }
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                LinearLayout found = findVerticalLinearLayout(vg.getChildAt(i), depth + 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void showSettingsDialog(final Activity activity) {
        final ArchiveManager mgr = ArchiveManager.get();
        if (mgr == null || !isAlive(activity)) return;
        final ArchiveConfig cfg = mgr.getConfig();

        int pad = dp(activity, 16);
        ScrollView scroll = new ScrollView(activity);
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);
        scroll.addView(root);

        final CheckBox cbEnabled = new CheckBox(activity);
        cbEnabled.setText(t("Automatisches Archivieren aktiv", "Automatic archiving enabled"));
        cbEnabled.setChecked(cfg.isEnabled());
        root.addView(cbEnabled);

        final CheckBox cbImages = new CheckBox(activity);
        cbImages.setText(t("Fahrzeugfotos mit archivieren", "Archive listing photos"));
        cbImages.setChecked(cfg.isArchiveImages());
        root.addView(cbImages);

        final CheckBox cbPrefetch = new CheckBox(activity);
        cbPrefetch.setText(t("Geparkte Inserate automatisch vollständig laden", "Auto-prefetch full details for parked listings"));
        cbPrefetch.setChecked(cfg.isPrefetchParked());
        root.addView(cbPrefetch);

        final CheckBox cbWifiOnly = new CheckBox(activity);
        cbWifiOnly.setText(t("Fotos, Prefetch & Auto-Sync nur im WLAN", "Photos, prefetch & auto-sync on Wi-Fi only"));
        cbWifiOnly.setChecked(cfg.isWifiOnlyMedia());
        root.addView(cbWifiOnly);

        TextView cacheLabel = new TextView(activity);
        cacheLabel.setText(t("\nMax. lokaler Bild-Cache (MB, 20–2000):", "\nMax local image cache (MB, 20–2000):"));
        cacheLabel.setTextSize(13);
        root.addView(cacheLabel);

        final EditText etMaxCacheMb = new EditText(activity);
        etMaxCacheMb.setInputType(InputType.TYPE_CLASS_NUMBER);
        etMaxCacheMb.setText(String.valueOf(cfg.getMaxImageCacheMb()));
        root.addView(etMaxCacheMb);

        TextView modeHeader = new TextView(activity);
        modeHeader.setText(t("\nGoogle Drive Methode:", "\nGoogle Drive Method:"));
        modeHeader.setTextSize(15);
        root.addView(modeHeader);

        final RadioGroup rgMode = new RadioGroup(activity);
        final RadioButton rbScript = new RadioButton(activity);
        rbScript.setText(t("Google Apps Script (Empfohlen, kein Token-Ablauf)", "Google Apps Script (Recommended, no token expiry)"));
        final RadioButton rbOAuth = new RadioButton(activity);
        rbOAuth.setText("Google Drive REST API (OAuth 2.0)");
        final RadioButton rbNone = new RadioButton(activity);
        rbNone.setText(t("Nur lokal (ohne Google Drive)", "Local only (no Google Drive)"));
        rgMode.addView(rbScript);
        rgMode.addView(rbOAuth);
        rgMode.addView(rbNone);
        root.addView(rgMode);

        // Apps Script Section
        final LinearLayout scriptBox = new LinearLayout(activity);
        scriptBox.setOrientation(LinearLayout.VERTICAL);
        scriptBox.setPadding(0, dp(activity, 8), 0, dp(activity, 8));

        TextView scriptHelp = new TextView(activity);
        scriptHelp.setText(t(
                "1) Tippe auf 'Apps-Script kopieren'\n2) Öffne script.google.com → Neues Projekt → Einfügen → Bereitstellen → Web-App (Ausführen als: Ich, Zugriff: Jeder)\n3) Web-App URL unten einfügen:",
                "1) Tap 'Copy Apps Script'\n2) Open script.google.com → New Project → Paste → Deploy → Web App (Execute as: Me, Access: Anyone)\n3) Paste Web App URL below:"
        ));
        scriptHelp.setTextSize(12);
        scriptBox.addView(scriptHelp);

        final EditText etScriptUrl = new EditText(activity);
        etScriptUrl.setHint("https://script.google.com/macros/s/.../exec");
        etScriptUrl.setText(cfg.getScriptUrl());
        etScriptUrl.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        scriptBox.addView(etScriptUrl);

        final EditText etScriptSecret = new EditText(activity);
        etScriptSecret.setHint("Secret-Token");
        etScriptSecret.setText(cfg.getScriptSecret());
        scriptBox.addView(etScriptSecret);

        Button btnCopyScript = new Button(activity);
        btnCopyScript.setText(t("Apps-Script Code (mit deinem Secret) kopieren", "Copy Apps Script code (with your secret)"));
        btnCopyScript.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String secret = etScriptSecret.getText().toString().trim();
                if (secret.isEmpty()) secret = cfg.getScriptSecret();
                String code = buildAppsScriptTemplate(secret);
                ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null) {
                    cm.setPrimaryClip(ClipData.newPlainText("mobile_de_drive_script.gs", code));
                    Toast.makeText(activity, t("Apps-Script in Zwischenablage kopiert!", "Apps Script copied to clipboard!"), Toast.LENGTH_LONG).show();
                }
            }
        });
        scriptBox.addView(btnCopyScript);

        Button btnOpenScript = new Button(activity);
        btnOpenScript.setText(t("script.google.com im Browser öffnen", "Open script.google.com in browser"));
        btnOpenScript.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://script.google.com/home/start")));
                } catch (Throwable t) {
                    Toast.makeText(activity, t("Browser konnte nicht geöffnet werden", "Could not open browser"), Toast.LENGTH_SHORT).show();
                }
            }
        });
        scriptBox.addView(btnOpenScript);
        root.addView(scriptBox);

        // OAuth Section
        final LinearLayout oauthBox = new LinearLayout(activity);
        oauthBox.setOrientation(LinearLayout.VERTICAL);
        oauthBox.setPadding(0, dp(activity, 8), 0, dp(activity, 8));

        TextView oauthHelp = new TextView(activity);
        oauthHelp.setText(t("Google Cloud Desktop OAuth Client-ID (Drive API aktiviert):", "Google Cloud Desktop OAuth Client ID (Drive API enabled):"));
        oauthHelp.setTextSize(12);
        oauthBox.addView(oauthHelp);

        final EditText etClientId = new EditText(activity);
        etClientId.setHint("OAuth Client-ID (....apps.googleusercontent.com)");
        etClientId.setText(cfg.getOAuthClientId());
        oauthBox.addView(etClientId);

        final EditText etClientSecret = new EditText(activity);
        etClientSecret.setHint("OAuth Client-Secret");
        etClientSecret.setText(cfg.getOAuthClientSecret());
        oauthBox.addView(etClientSecret);

        final EditText etFolderName = new EditText(activity);
        etFolderName.setHint(t("Drive-Ordnername (Standard: mobile.de Archiv)", "Drive folder name (default: mobile.de Archiv)"));
        etFolderName.setText(cfg.getDriveFolderName());
        oauthBox.addView(etFolderName);

        Button btnOAuthLogin = new Button(activity);
        btnOAuthLogin.setText(cfg.getOAuthRefreshToken().isEmpty()
                ? t("Mit Google anmelden", "Sign in with Google")
                : t("Google erneut verbinden (verbunden)", "Reconnect Google (connected)"));
        btnOAuthLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                cfg.setOAuthClientId(etClientId.getText().toString());
                cfg.setOAuthClientSecret(etClientSecret.getText().toString());
                cfg.setDriveFolderName(etFolderName.getText().toString());
                Toast.makeText(activity, t("Öffne Google-Anmeldung im Browser...", "Opening Google sign-in in browser..."), Toast.LENGTH_SHORT).show();
                mgr.getDrive().startOAuthLoopbackLogin(activity, new GoogleDriveSync.OAuthCallback() {
                    @Override
                    public void onResult(final boolean success, final String message) {
                        runIfAlive(activity, new Runnable() {
                            @Override
                            public void run() {
                                Toast.makeText(activity, message, Toast.LENGTH_LONG).show();
                            }
                        });
                    }
                });
            }
        });
        oauthBox.addView(btnOAuthLogin);
        root.addView(oauthBox);

        String currentMode = cfg.getDriveMode();
        if (ArchiveConfig.MODE_APPS_SCRIPT.equals(currentMode)) {
            rbScript.setChecked(true);
            scriptBox.setVisibility(View.VISIBLE);
            oauthBox.setVisibility(View.GONE);
        } else if (ArchiveConfig.MODE_OAUTH.equals(currentMode)) {
            rbOAuth.setChecked(true);
            scriptBox.setVisibility(View.GONE);
            oauthBox.setVisibility(View.VISIBLE);
        } else {
            rbNone.setChecked(true);
            scriptBox.setVisibility(View.GONE);
            oauthBox.setVisibility(View.GONE);
        }

        rgMode.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                scriptBox.setVisibility(checkedId == rbScript.getId() ? View.VISIBLE : View.GONE);
                oauthBox.setVisibility(checkedId == rbOAuth.getId() ? View.VISIBLE : View.GONE);
            }
        });

        new AlertDialog.Builder(activity)
                .setTitle(t("Archiv-Einstellungen", "Archive Settings"))
                .setView(scroll)
                .setPositiveButton(t("Speichern", "Save"), new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        cfg.setEnabled(cbEnabled.isChecked());
                        cfg.setArchiveImages(cbImages.isChecked());
                        cfg.setPrefetchParked(cbPrefetch.isChecked());
                        cfg.setWifiOnlyMedia(cbWifiOnly.isChecked());
                        try {
                            int mb = Integer.parseInt(etMaxCacheMb.getText().toString().trim());
                            cfg.setMaxImageCacheMb(mb);
                        } catch (Throwable ignored) {
                        }
                        cfg.setScriptUrl(etScriptUrl.getText().toString());
                        cfg.setScriptSecret(etScriptSecret.getText().toString());
                        cfg.setOAuthClientId(etClientId.getText().toString());
                        cfg.setOAuthClientSecret(etClientSecret.getText().toString());
                        cfg.setDriveFolderName(etFolderName.getText().toString());

                        if (rbScript.isChecked()) {
                            cfg.setDriveMode(ArchiveConfig.MODE_APPS_SCRIPT);
                        } else if (rbOAuth.isChecked()) {
                            cfg.setDriveMode(ArchiveConfig.MODE_OAUTH);
                        } else {
                            cfg.setDriveMode(ArchiveConfig.MODE_NONE);
                        }

                        if (cfg.isDriveConfigured()) {
                            Toast.makeText(activity, t("Gespeichert — teste Google Drive...", "Saved — testing Google Drive..."), Toast.LENGTH_SHORT).show();
                            mgr.runAsync(new Runnable() {
                                @Override
                                public void run() {
                                    final String res = mgr.getDrive().testConnection();
                                    runIfAlive(activity, new Runnable() {
                                        @Override
                                        public void run() {
                                            new AlertDialog.Builder(activity)
                                                    .setTitle(t("Google Drive Verbindung", "Google Drive Connection"))
                                                    .setMessage(res)
                                                    .setPositiveButton("OK", null)
                                                    .show();
                                        }
                                    });
                                }
                            });
                        } else {
                            Toast.makeText(activity, t("Einstellungen gespeichert", "Settings saved"), Toast.LENGTH_SHORT).show();
                        }
                    }
                })
                .setNegativeButton(t("Abbrechen", "Cancel"), null)
                .show();
    }

    private static int dp(Context ctx, int value) {
        return Math.round(value * ctx.getResources().getDisplayMetrics().density);
    }

    private static String buildAppsScriptTemplate(String secret) {
        String safeSecret = secret.replace("\\", "\\\\").replace("\"", "\\\"");
        return "var SECRET = \"" + safeSecret + "\";\n"
                + "var ROOT_FOLDER_NAME = \"mobile.de Archiv\";\n\n"
                + "function jsonOut(o){return ContentService.createTextOutput(JSON.stringify(o)).setMimeType(ContentService.MimeType.JSON);}\n"
                + "function checkAuth(s){return s && SECRET && s === SECRET;}\n"
                + "function getOrCreateFolder(p,n){var it=p?p.getFoldersByName(n):DriveApp.getFoldersByName(n);return it.hasNext()?it.next():(p?p.createFolder(n):DriveApp.createFolder(n));}\n"
                + "function findListingFolder(r,id){var it=r.getFolders(),p=id+' - ';while(it.hasNext()){var f=it.next(),n=f.getName();if(n===id||n.indexOf(p)===0)return f;}return null;}\n"
                + "function sanitize(s){return s?String(s).replace(/[\\\\/:*?\"<>|\\r\\n]+/g,' ').trim().substring(0,60):'';}\n"
                + "function upsertTxt(f,n,c,m){var it=f.getFilesByName(n);if(it.hasNext()){var x=it.next();x.setContent(c);return x;}return f.createFile(n,c,m||MimeType.PLAIN_TEXT);}\n"
                + "function upsertBin(f,n,b,m){var it=f.getFilesByName(n);if(it.hasNext())return it.next();return f.createFile(Utilities.newBlob(b,m||'image/jpeg',n));}\n"
                + "function readTxt(f,n){var it=f.getFilesByName(n);return it.hasNext()?it.next().getBlob().getDataAsString('UTF-8'):null;}\n\n"
                + "function doGet(e){\n"
                + "  try{\n"
                + "    var p=(e&&e.parameter)?e.parameter:{};if(!checkAuth(p.secret))return jsonOut({ok:false,error:'unauthorized'});\n"
                + "    var a=p.action||'ping',r=getOrCreateFolder(null,ROOT_FOLDER_NAME);\n"
                + "    if(a==='ping')return jsonOut({ok:true,folder:r.getName(),folderId:r.getId()});\n"
                + "    if(a==='listListings'){var list=[],it=r.getFolders();while(it.hasNext()){var f=it.next();if(f.getName()==='_images')continue;var ms=readTxt(f,'meta.json');if(ms){try{list.push(JSON.parse(ms));}catch(x){}}else{list.push({adId:f.getName().split(' ')[0],title:f.getName(),price:'',archivedAt:f.getLastUpdated().getTime()});}}return jsonOut({ok:true,items:list});}\n"
                + "    if(a==='getListing'){var f=findListingFolder(r,p.adId);if(!f)return jsonOut({ok:true,found:false});return jsonOut({ok:true,found:true,vipJson:readTxt(f,'listing.json'),contactJson:readTxt(f,'contact.json'),metaJson:readTxt(f,'meta.json')});}\n"
                + "    if(a==='getImage'){var n='img_'+p.imageKey+'.jpg',ifld=getOrCreateFolder(r,'_images'),it=ifld.getFilesByName(n);if(!it.hasNext())it=DriveApp.getFilesByName(n);if(!it.hasNext())return jsonOut({ok:true,found:false});return jsonOut({ok:true,found:true,base64:Utilities.base64Encode(it.next().getBlob().getBytes())});}\n"
                + "    return jsonOut({ok:false,error:'unknown action'});\n"
                + "  }catch(err){return jsonOut({ok:false,error:String(err)});}\n"
                + "}\n\n"
                + "function doPost(e){\n"
                + "  try{\n"
                + "    var b=JSON.parse(e.postData.contents);if(!checkAuth(b.secret))return jsonOut({ok:false,error:'unauthorized'});\n"
                + "    var a=b.action,r=getOrCreateFolder(null,ROOT_FOLDER_NAME);\n"
                + "    if(a==='putListing'){var id=String(b.adId||'').trim();if(!id)return jsonOut({ok:false,error:'missing adId'});var f=findListingFolder(r,id);if(!f){var st=sanitize(b.title);f=r.createFolder(st?(id+' - '+st):id);}if(b.vipJson)upsertTxt(f,'listing.json',b.vipJson,'application/json');if(b.contactJson)upsertTxt(f,'contact.json',b.contactJson,'application/json');if(b.metaJson)upsertTxt(f,'meta.json',b.metaJson,'application/json');if(b.infoTxt)upsertTxt(f,'info.txt',b.infoTxt,MimeType.PLAIN_TEXT);return jsonOut({ok:true,folderId:f.getId()});}\n"
                + "    if(a==='putImage'){var id=String(b.adId||'').trim(),k=String(b.imageKey||'').trim();if(!k||!b.base64)return jsonOut({ok:false,error:'missing params'});var bytes=Utilities.base64Decode(b.base64),n='img_'+k+'.jpg';upsertBin(getOrCreateFolder(r,'_images'),n,bytes,'image/jpeg');if(id){var lf=findListingFolder(r,id);if(lf){var fn=b.index?('foto_'+b.index+'_'+k.substring(0,8)+'.jpg'):n;upsertBin(lf,fn,bytes,'image/jpeg');}}return jsonOut({ok:true});}\n"
                + "    return jsonOut({ok:false,error:'unknown action'});\n"
                + "  }catch(err){return jsonOut({ok:false,error:String(err)});}\n"
                + "}\n";
    }
}
