/*
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hxreborn.extension.realmelink;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.provider.Settings;
import android.service.notification.StatusBarNotification;
import java.util.ArrayList;
import java.util.List;
import android.app.job.JobInfo;
import android.app.job.JobParameters;
import android.app.job.JobScheduler;
import android.app.job.JobService;
import android.content.ComponentName;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.companion.AssociationInfo;
import android.companion.AssociationRequest;
import android.companion.BluetoothDeviceFilter;
import android.companion.CompanionDeviceManager;
import android.companion.CompanionDeviceService;
import android.companion.DevicePresenceEvent;
import android.companion.ObservingDevicePresenceRequest;
import java.lang.ref.WeakReference;
import android.os.Handler;
import android.os.Looper;
import android.os.PersistableBundle;
import android.os.SystemClock;
import java.util.HashMap;
import java.util.Map;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothAdapter;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.util.Locale;

/** Process-scoped lifecycle integration. No activity or vendor device is held globally. */
public final class ModeSettingsUi {
    private static final String TAG = "RLM-Modes";
    private static final String BUTTON_TAG = "rlm_mode_settings_button";
    private static final String SCREEN = "com.realme.iot.headset.activity.device.HeadsetDeviceActivity";
    private static boolean installed;
    private static final String PRESENCE_STORE = "rlm_companion_presence_v1";
    private static final int CONSENT_REQUEST = 0x524c;
    private ModeSettingsUi() {}

    public static synchronized void install(Context context) {
        if (installed || !(context instanceof Application)) return;
        Application app = (Application) context;
        if (Build.VERSION.SDK_INT >= 28 && !app.getPackageName().equals(Application.getProcessName())) return;
        installed = true;
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(Activity a) {
                if (SCREEN.equals(a.getClass().getName())) attach(a, null);
            }
            @Override public void onActivityCreated(Activity a, Bundle b) {}
            @Override public void onActivityStarted(Activity a) {}
            @Override public void onActivityPaused(Activity a) {}
            @Override public void onActivityStopped(Activity a) {}
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
            @Override public void onActivityDestroyed(Activity a) {}
        });
    }

    /** Manifest receiver can wake a normally killed app; force-stop remains an OS restriction. */
    public static final class ReconnectReceiver extends BroadcastReceiver {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null) return;
            String action = intent.getAction();
            if (!BluetoothDevice.ACTION_ACL_CONNECTED.equals(action)
                    && !BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) return;
            try {
                BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE, BluetoothDevice.class);
                if (device == null) return;
                dispatchReconnect(context, device.getAddress(), BluetoothDevice.ACTION_ACL_CONNECTED.equals(action));
            } catch (RuntimeException e) {
                android.util.Log.w(TAG, "Bluetooth reconnect unavailable", e);
            }
        }
    }

    private static void dispatchReconnect(Context context, String raw, boolean connected) {
        if (raw == null) return;
        String address = raw.toUpperCase(Locale.ROOT);
        if (!ModeKeeper.activeProfile(address)) return;
        try {
            JobScheduler scheduler = context.getSystemService(JobScheduler.class);
            if (scheduler == null) {
                ModeKeeper.onBluetoothEvent(address, connected);
                return;
            }
            ComponentName service = new ComponentName(context, ReconnectJob.class);
            int id = 0x52000000 | (address.hashCode() & 0x00ffffff);
            JobInfo old = scheduler.getPendingJob(id);
            if (old != null && (!service.equals(old.getService())
                    || !address.equals(old.getExtras().getString("address")))) {
                android.util.Log.w(TAG, "Reconnect job ID collision");
                return;
            }
            if (!connected) {
                if (old != null) scheduler.cancel(id);
                ModeKeeper.onBluetoothEvent(address, false);
                return;
            }
            if (old != null) return;
            PersistableBundle extras = new PersistableBundle();
            extras.putString("address", address);
            extras.putLong("eventAt", SystemClock.elapsedRealtime());
            JobInfo job = new JobInfo.Builder(id, service).setExtras(extras)
                .setMinimumLatency(0).setOverrideDeadline(10000L).build();
            if (scheduler.schedule(job) != JobScheduler.RESULT_SUCCESS)
                android.util.Log.w(TAG, "Could not schedule headset reconnect");
            ModeKeeper.onBluetoothEvent(address, true);
        } catch (RuntimeException e) {
            android.util.Log.w(TAG, "Bluetooth reconnect unavailable", e);
        }
    }

    private static boolean presenceEnabled(Context c, String address) {
        try {
            return c.getSharedPreferences(PRESENCE_STORE, Context.MODE_PRIVATE)
                .getBoolean(address.toUpperCase(Locale.ROOT), false);
        } catch (ClassCastException e) { return false; }
    }

    private static AssociationInfo findAssociation(CompanionDeviceManager manager, String address) {
        for (AssociationInfo info : manager.getMyAssociations()) {
            if (info.getDeviceMacAddress() != null &&
                    address.equalsIgnoreCase(info.getDeviceMacAddress().toString())) return info;
        }
        return null;
    }

    private static boolean observe(Context c, CompanionDeviceManager manager, AssociationInfo info, boolean enabled) {
        if (info.getDeviceMacAddress() == null) return false;
        String address = info.getDeviceMacAddress().toString().toUpperCase(Locale.ROOT);
        try {
            if (Build.VERSION.SDK_INT >= 36) {
                ObservingDevicePresenceRequest request = new ObservingDevicePresenceRequest.Builder()
                    .setAssociationId(info.getId()).build();
                if (enabled) manager.startObservingDevicePresence(request);
                else manager.stopObservingDevicePresence(request);
            } else {
                if (enabled) manager.startObservingDevicePresence(address);
                else manager.stopObservingDevicePresence(address);
            }
            c.getSharedPreferences(PRESENCE_STORE, Context.MODE_PRIVATE).edit()
                .putBoolean(address, enabled).apply();
            return true;
        } catch (Exception | LinkageError e) {
            android.util.Log.w(TAG, "Companion presence unavailable", e);
            return false;
        }
    }

    private static void message(Context c, String ua, String ru, String en) {
        Toast.makeText(c, tr(ua, ru, en), Toast.LENGTH_LONG).show();
    }

    private static void configurePresence(Activity a, String raw) {
        String address = formatMac(raw).toUpperCase(Locale.ROOT);
        Context app = a.getApplicationContext();
        CompanionDeviceManager manager = app.getSystemService(CompanionDeviceManager.class);
        if (manager == null || !app.getPackageManager().hasSystemFeature(PackageManager.FEATURE_COMPANION_DEVICE_SETUP)) {
            message(app, "Companion API недоступний", "Companion API недоступен", "Companion API unavailable");
            return;
        }
        try {
            AssociationInfo existing = findAssociation(manager, address);
            if (existing != null) {
                boolean enabled = !presenceEnabled(app, address);
                if (observe(app, manager, existing, enabled)) {
                    if (enabled) {
                        message(app, "Фонове відновлення увімкнено", "Фоновое восстановление включено", "Background restoration enabled");
                    } else {
                        message(app, "Companion-пробудження вимкнено", "Companion-пробуждение отключено", "Companion wake disabled");
                    }
                } else message(app, "Не вдалося змінити спостереження", "Не удалось изменить наблюдение", "Could not change presence observation");
                return;
            }
            if (!ModeKeeper.activeProfile(address)) {
                message(app, "Спочатку увімкніть підтримку режиму", "Сначала включите сохранение режима", "Enable mode maintenance first");
                return;
            }
            WeakReference<Activity> owner = new WeakReference<>(a);
            AssociationRequest request = new AssociationRequest.Builder().setSingleDevice(true)
                .addDeviceFilter(new BluetoothDeviceFilter.Builder().setAddress(address).build()).build();
            manager.associate(request, app.getMainExecutor(), new CompanionDeviceManager.Callback() {
                @Override public void onAssociationPending(IntentSender sender) {
                    Activity current = owner.get();
                    if (current == null || current.isFinishing() || current.isDestroyed()) return;
                    try {
                        current.startIntentSenderForResult(sender, CONSENT_REQUEST, null, 0, 0, 0);
                    } catch (IntentSender.SendIntentException | RuntimeException e) {
                        android.util.Log.w(TAG, "Cannot open companion consent", e);
                    }
                }
                @Override public void onAssociationCreated(AssociationInfo info) {
                    if (info.getDeviceMacAddress() != null &&
                            address.equalsIgnoreCase(info.getDeviceMacAddress().toString()) &&
                            ModeKeeper.activeProfile(address) && observe(app, manager, info, true)) {
                        message(app, "Фонове відновлення увімкнено", "Фоновое восстановление включено", "Background restoration enabled");
                    } else message(app, "Не вдалося активувати комплект", "Не удалось активировать комплект", "Could not activate headset");
                }
                @Override public void onFailure(CharSequence error) {
                    message(app, "Прив’язку не завершено", "Привязка не завершена", "Association not completed");
                }
            });
        } catch (RuntimeException e) {
            android.util.Log.w(TAG, "Companion setup failed", e);
            message(app, "Прив’язка недоступна", "Привязка недоступна", "Association unavailable");
        }
    }

    /** OS-managed presence is an independent wake source; all sources share the same job. */
    public static final class PresenceService extends CompanionDeviceService {
        private void event(AssociationInfo info, boolean connected) {
            if (info == null || info.getDeviceMacAddress() == null) return;
            String address = info.getDeviceMacAddress().toString().toUpperCase(Locale.ROOT);
            if (presenceEnabled(this, address)) dispatchReconnect(this, address, connected);
        }
        @Override public void onDeviceAppeared(AssociationInfo info) { event(info, true); }
        @Override public void onDeviceDisappeared(AssociationInfo info) { event(info, false); }
        @Override public void onDevicePresenceEvent(DevicePresenceEvent event) {
            if (Build.VERSION.SDK_INT < 36 || event == null) return;
            int kind = event.getEvent();
            // BLE advertisements can occur while the earbuds are inside the case.
            // Only a classic Bluetooth connection/disconnection is authoritative here.
            if (kind != DevicePresenceEvent.EVENT_BT_CONNECTED && kind != DevicePresenceEvent.EVENT_BT_DISCONNECTED) return;
            CompanionDeviceManager manager = getSystemService(CompanionDeviceManager.class);
            if (manager == null) return;
            try {
                for (AssociationInfo info : manager.getMyAssociations()) {
                    if (info.getId() == event.getAssociationId()) {
                        event(info, kind == DevicePresenceEvent.EVENT_BT_CONNECTED);
                        break;
                    }
                }
            } catch (RuntimeException e) { android.util.Log.w(TAG, "Presence event unavailable", e); }
        }
    }

    /** Short bounded JobService keeps cold-start work alive beyond receiver lifetime. */
    public static final class ReconnectJob extends JobService {
        private final Handler main = new Handler(Looper.getMainLooper());
        private final Map<Integer, Work> jobs = new HashMap<>();
        private static final long[] LOOKUP_DELAYS = {0, 1000, 2000, 4000};
        private static final class Work {
            final JobParameters params;
            final String address;
            final long started = SystemClock.elapsedRealtime();
            Thread worker;
            Runnable timeout, poll;
            Work(JobParameters params, String address) { this.params = params; this.address = address; }
        }
        @Override public boolean onStartJob(JobParameters params) {
            String address = params.getExtras().getString("address");
            long age = SystemClock.elapsedRealtime() - params.getExtras().getLong("eventAt", -1);
            if (age < 0 || age > 30000L || !ModeKeeper.activeProfile(address)) return false;
            if (jobs.containsKey(params.getJobId()) || jobs.size() >= 8) return false;
            Work work = new Work(params, address);
            jobs.put(params.getJobId(), work);
            work.timeout = () -> finish(work, true);
            work.poll = () -> poll(work);
            work.worker = new Thread(() -> {
                Object device = null;
                for (long delay : LOOKUP_DELAYS) {
                    try {
                        if (delay > 0) Thread.sleep(delay);
                        if (Thread.currentThread().isInterrupted() || !ModeKeeper.activeProfile(address)) return;
                        device = ModeKeeper.resolveSavedDevice(address);
                        if (device != null) break;
                    } catch (InterruptedException e) { Thread.currentThread().interrupt(); return; }
                    catch (RuntimeException e) { android.util.Log.w(TAG, "Headset lookup failed", e); }
                }
                final Object resolved = device;
                main.post(() -> {
                    if (!current(work)) return;
                    if (resolved == null || !ModeKeeper.activeProfile(address)) {
                        finish(work, false);
                        return;
                    }
                    ModeKeeper.resumeSavedDevice(resolved);
                    main.postDelayed(work.poll, 1000L);
                });
            }, "RLM-device-lookup");
            main.postDelayed(work.timeout, 45000L);
            work.worker.start();
            return true;
        }
        private boolean current(Work work) { return jobs.get(work.params.getJobId()) == work; }
        private void poll(Work work) {
            if (!current(work)) return;
            if (!ModeKeeper.activeProfile(work.address) || !ModeKeeper.hasPendingChecks(work.address)) {
                finish(work, false);
            } else {
                main.postDelayed(work.poll, 1000L);
            }
        }
        private void clear(Work work) {
            main.removeCallbacks(work.timeout);
            main.removeCallbacks(work.poll);
            work.worker.interrupt();
        }
        private void finish(Work work, boolean timedOut) {
            if (!current(work)) return;
            jobs.remove(work.params.getJobId());
            clear(work);
            if (timedOut) android.util.Log.w(TAG, "Reconnect job reached its deadline");
            jobFinished(work.params, false);
        }
        @Override public boolean onStopJob(JobParameters params) {
            Work work = jobs.remove(params.getJobId());
            if (work != null) clear(work);
            return false;
        }
        @Override public void onDestroy() {
            for (Work work : jobs.values()) clear(work);
            jobs.clear();
            super.onDestroy();
        }
    }

    private static String tr(String ua, String ru, String en) {
        String l = Locale.getDefault().getLanguage();
        return "uk".equals(l) ? ua : "ru".equals(l) ? ru : en;
    }
    private static String title() {
        return tr("Підтримка режимів", "Сохранение режимов", "Keep modes");
    }
    public static void attach(Context context, Object device) {
        if (!(context instanceof Activity)) return;
        Activity a = (Activity) context;
        if (a.isFinishing() || a.isDestroyed()) return;
        try {
            FrameLayout root = a.findViewById(android.R.id.content);
            if (root == null) return;
            Button button = root.findViewWithTag(BUTTON_TAG);
            if (button == null) {
                button = new Button(a);
                button.setTag(BUTTON_TAG);
                root.addView(button);
            }
            button.setText(title());
            button.setAllCaps(false);
            button.setTextSize(12f);
            float density = a.getResources().getDisplayMetrics().density;
            // Place just below the headset toolbar, not over Android navigation.
            // Reapply on every resume, including an existing overlay from this Activity.
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.END);
            int side = (int)(12 * density);
            lp.setMargins(side, (int)(64 * density), side, 0);
            button.setLayoutParams(lp);
            button.setElevation(8 * density);
            // Never bind a newly opened screen to whichever headset connected last.
            button.setOnClickListener(v -> showProfiles(a));
        } catch (RuntimeException e) {
            android.util.Log.w(TAG, "Cannot attach mode settings", e);
        }
    }

    private static void showProfiles(Activity a) {
        if (a.isFinishing() || a.isDestroyed()) return;
        String[] profiles = ModeKeeper.savedProfiles();
        if (profiles.length == 0) {
            new AlertDialog.Builder(a).setTitle(title()).setMessage(tr(
                "Спочатку виберіть потрібні режими штатними кнопками навушників. Після цього комплект буде доступний тут.",
                "Сначала выберите нужные режимы штатными кнопками наушников. После этого комплект будет доступен здесь.",
                "Select the desired modes using the normal headset controls first. The headset will then appear here."))
                .setPositiveButton(android.R.string.ok, null).show();
            return;
        }
        String[] names = new String[profiles.length];
        for (int i = 0; i < profiles.length; i++) {
            names[i] = bluetoothName(a, profiles[i]);
            if (names[i] == null) names[i] = ModeKeeper.savedProfileName(profiles[i]);
        }
        String[] labels = HeadsetProfileNames.labels(names, Locale.getDefault());
        new AlertDialog.Builder(a).setTitle(tr("Виберіть комплект", "Выберите комплект", "Choose headset"))
            .setItems(labels, (dialog, index) -> show(a, profiles[index], labels[index]))
            .setNegativeButton(android.R.string.cancel, null).show();
    }
    /** Read the user's Bluetooth alias first, then the reported device name. */
    private static String bluetoothName(Context context, String address) {
        try {
            BluetoothManager manager = context.getSystemService(BluetoothManager.class);
            BluetoothAdapter adapter = manager == null ? null : manager.getAdapter();
            if (adapter == null) return null;
            BluetoothDevice device = adapter.getRemoteDevice(formatMac(address));
            if (Build.VERSION.SDK_INT >= 30) {
                try {
                    String alias = HeadsetProfileNames.safeName(device.getAlias());
                    if (alias != null) return alias;
                } catch (SecurityException | LinkageError ignored) {}
            }
            try {
                return HeadsetProfileNames.safeName(device.getName());
            } catch (SecurityException | LinkageError ignored) {
                return null;
            }
        } catch (IllegalArgumentException | SecurityException | LinkageError ignored) {
            return null;
        }
    }

    private static String formatMac(String address) {
        return address.replaceAll("(?<=\\G..)(?!$)", ":");
    }
    private static void show(Activity a, String address, String displayLabel) {
        if (a.isFinishing() || a.isDestroyed()) return;
        LinearLayout content = new LinearLayout(a);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = (int)(20 * a.getResources().getDisplayMetrics().density);
        content.setPadding(pad, pad, pad, pad);
        TextView detail = new TextView(a);
        detail.setText(displayLabel + "\n" + tr(
            "Виберіть потрібний режим штатними кнопками навушників у realme Link. Тут задається його автоматичне відновлення після підключення.",
            "Выберите нужный режим штатными кнопками наушников в realme Link. Здесь задаётся его автоматическое восстановление после подключения.",
            "Select the desired mode using the normal realme Link controls. Enable automatic restoration after reconnect here."));
        content.addView(detail);
        addSwitch(a, content, address, "anc", tr("Підтримувати режим шумозаглушення", "Сохранять режим шумоподавления", "Keep noise control mode"));
        addSwitch(a, content, address, "game", tr("Підтримувати ігровий режим", "Сохранять игровой режим", "Keep game mode"));
        Button companion = new Button(a);
        boolean enabled = presenceEnabled(a, formatMac(address));
        companion.setText(enabled
            ? tr("Вимкнути Companion-пробудження", "Отключить Companion-пробуждение", "Disable companion wake")
            : tr("Дозволити фонове відновлення", "Разрешить фоновое восстановление", "Allow background restoration"));
        companion.setOnClickListener(v -> {
            configurePresence(a, address);
            companion.setText(presenceEnabled(a, formatMac(address))
                ? tr("Вимкнути Companion-пробудження", "Отключить Companion-пробуждение", "Disable companion wake")
                : tr("Дозволити фонове відновлення", "Разрешить фоновое восстановление", "Allow background restoration"));
        });
        content.addView(companion);
        TextView hint = new TextView(a);
        hint.setText(tr("Одноразове системне підтвердження для цього комплекту. Резервне відновлення через Bluetooth працює незалежно.",
            "Однократное системное подтверждение для этого комплекта. Резервное восстановление через Bluetooth работает независимо.",
            "One-time system consent for this headset. Bluetooth fallback remains independent."));
        content.addView(hint);
        Button notifications = new Button(a);
        notifications.setText(tr("Канали сповіщень realme Link", "Каналы уведомлений realme Link", "realme Link notification channels"));
        notifications.setOnClickListener(v -> showNotificationChannels(a));
        content.addView(notifications);
        ScrollView scroll = new ScrollView(a);
        scroll.addView(content);
        new AlertDialog.Builder(a).setTitle(title()).setView(scroll)
            .setPositiveButton(android.R.string.ok, null).show();
    }
    private static void showNotificationChannels(Activity a) {
        if (a.isFinishing() || a.isDestroyed()) return;
        NotificationManager manager = a.getSystemService(NotificationManager.class);
        if (manager == null) return;
        try {
            List<NotificationChannel> channels = manager.getNotificationChannels();
            List<String> ids = new ArrayList<>();
            List<String> labels = new ArrayList<>();
            Map<String, Integer> active = new HashMap<>();
            for (StatusBarNotification notification : manager.getActiveNotifications()) {
                String id = notification.getNotification().getChannelId();
                if (id != null) active.put(id, active.getOrDefault(id, 0) + 1);
            }
            for (NotificationChannel channel : channels) {
                ids.add(channel.getId());
                labels.add(channel.getName() + " [" + channel.getId() + "]"
                    + (active.containsKey(channel.getId()) ? " · " + active.get(channel.getId()) : ""));
            }
            if (ids.isEmpty()) {
                message(a, "Канали сповіщень не знайдено", "Каналы уведомлений не найдены", "No notification channels found");
                return;
            }
            new AlertDialog.Builder(a).setTitle(tr("Канали сповіщень", "Каналы уведомлений", "Notification channels"))
                .setItems(labels.toArray(new String[0]), (dialog, index) ->
                    new AlertDialog.Builder(a).setMessage(tr(
                        "Вимкнення каналу впливає на всі його сповіщення. Голосові попередження самих навушників тут не вимикаються.",
                        "Отключение канала влияет на все его уведомления. Голосовые предупреждения самих наушников здесь не отключаются.",
                        "Disabling a channel affects all its notifications. Earbud voice prompts are not controlled here."))
                        .setPositiveButton(android.R.string.ok, (d, which) -> {
                            try {
                                Intent settings = new Intent(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS)
                                    .putExtra(Settings.EXTRA_APP_PACKAGE, a.getPackageName())
                                    .putExtra(Settings.EXTRA_CHANNEL_ID, ids.get(index));
                                a.startActivity(settings);
                            } catch (RuntimeException e) { android.util.Log.w(TAG, "Channel settings unavailable", e); }
                        }).setNegativeButton(android.R.string.cancel, null).show())
                .setNegativeButton(android.R.string.cancel, null).show();
        } catch (RuntimeException e) {
            android.util.Log.w(TAG, "Notification channel list unavailable", e);
        }
    }

    private static void addSwitch(Activity a, LinearLayout content, String address, String mode, String title) {
        if (!ModeKeeper.modeAvailable(mode)) return;
        Switch control = new Switch(a);
        boolean learned = ModeKeeper.hasSelectionFor(address, mode);
        control.setText(learned ? title : title + "\n" + tr("Спочатку виберіть режим", "Сначала выберите режим", "Select a mode first"));
        control.setEnabled(learned);
        control.setChecked(learned && ModeKeeper.isMaintainedFor(address, mode));
        control.setOnCheckedChangeListener((button, checked) -> {
            if (!ModeKeeper.setMaintainedFor(address, mode, checked)) {
                button.setOnCheckedChangeListener(null);
                button.setChecked(ModeKeeper.isMaintainedFor(address, mode));
                button.setEnabled(false);
                Toast.makeText(a, tr("Не вдалося зберегти", "Не удалось сохранить", "Could not save"), Toast.LENGTH_SHORT).show();
            }
        });
        content.addView(control);
    }
}
