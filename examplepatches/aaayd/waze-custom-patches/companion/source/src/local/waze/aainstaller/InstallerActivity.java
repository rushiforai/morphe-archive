package local.waze.aainstaller;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import java.util.zip.ZipFile;
import rikka.shizuku.Shizuku;

public final class InstallerActivity extends Activity {
    private static final String WAZE = "com.waze", INSTALLER = "com.google.android.packageinstaller";
    private static final int PICK = 21, PERMISSION = 22;
    private final Handler ui = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private SharedPreferences prefs;
    private TextView status, details, shizukuState;
    private Button install, repair, choose, check, shizuku, done, cancel;
    private boolean busy, binding, resumed;
    private IHandoffService service;
    private Shizuku.UserServiceArgs serviceArgs;
    private String message = "Patch Waze in Morphe, then choose Waze AA Installer when installing.";
    private final Shizuku.OnBinderReceivedListener received = () -> runOnUiThread(this::render);
    private final Shizuku.OnBinderDeadListener dead = () -> runOnUiThread(() -> {
        service = null; binding = false; busy = false;
        message = "Shizuku stopped. Open Shizuku and start it through wireless debugging, then retry."; render();
    });
    private final Shizuku.OnRequestPermissionResultListener permission = (code, result) -> {
        if (code == PERMISSION) runOnUiThread(() -> {
            if (result == PackageManager.PERMISSION_GRANTED) connectAndInstall();
            else { message = "Shizuku permission was not granted. Allow Waze AA Installer in Shizuku to continue."; render(); }
        });
    };
    private final ServiceConnection connection = new ServiceConnection() {
        public void onServiceConnected(ComponentName name, IBinder binder) {
            service = IHandoffService.Stub.asInterface(binder); binding = false;
            runOnUiThread(InstallerActivity.this::launchInstaller);
        }
        public void onServiceDisconnected(ComponentName name) { service = null; binding = false; }
    };
    private final Runnable poll = new Runnable() {
        public void run() {
            if (!resumed || !"waiting".equals(prefs.getString("state", ""))) return;
            verify();
            if ("waiting".equals(prefs.getString("state", ""))) ui.postDelayed(this, 2000);
        }
    };

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        prefs = getSharedPreferences("install", 0);
        serviceArgs = new Shizuku.UserServiceArgs(new ComponentName(this, HandoffService.class))
            .daemon(false).tag("waze-aa-handoff").version(1).processNameSuffix("handoff");
        buildUi();
        Shizuku.addBinderReceivedListenerSticky(received);
        Shizuku.addBinderDeadListener(dead);
        Shizuku.addRequestPermissionResultListener(permission);
        if (state == null) accept(getIntent());
        render();
    }
    @Override protected void onNewIntent(Intent intent) { super.onNewIntent(intent); setIntent(intent); accept(intent); }
    @Override protected void onResume() { super.onResume(); resumed = true; render(); ui.post(poll); }
    @Override protected void onPause() { resumed = false; ui.removeCallbacks(poll); super.onPause(); }
    @Override protected void onDestroy() {
        Shizuku.removeBinderReceivedListener(received); Shizuku.removeBinderDeadListener(dead);
        Shizuku.removeRequestPermissionResultListener(permission); ui.removeCallbacksAndMessages(null);
        if (service != null || binding) try { Shizuku.unbindUserService(serviceArgs, connection, true); } catch (Exception ignored) {}
        worker.shutdown(); super.onDestroy();
    }

    private int dp(int value) { return Math.round(getResources().getDisplayMetrics().density * value); }
    private TextView label(LinearLayout parent, String text, int size, boolean bold) {
        TextView view = new TextView(this); view.setText(text); view.setTextSize(size);
        view.setTextColor(Color.rgb(22, 48, 55)); if (bold) view.setTypeface(null, Typeface.BOLD);
        view.setPadding(0, dp(8), 0, dp(12)); parent.addView(view); return view;
    }
    private Button button(LinearLayout parent, String text, Runnable action) {
        Button button = new Button(this); button.setText(text); button.setAllCaps(false);
        parent.addView(button, new LinearLayout.LayoutParams(-1, dp(54)));
        button.setOnClickListener(v -> action.run()); return button;
    }
    private void buildUi() {
        ScrollView scroll = new ScrollView(this); scroll.setBackgroundColor(Color.rgb(246, 249, 247));
        LinearLayout content = new LinearLayout(this); content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(24), dp(28), dp(24), dp(28)); scroll.addView(content); setContentView(scroll);
        scroll.post(() -> {
            WindowInsetsController controller = getWindow().getInsetsController();
            if (controller != null) controller.setSystemBarsAppearance(
                WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS,
                WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        });
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom); return insets;
        });
        label(content, "Waze AA Installer", 27, true);
        label(content, "Install from Morphe. Keep Waze available in Android Auto.", 16, false);
        shizukuState = label(content, "", 14, true);
        status = label(content, "", 18, true);
        details = label(content, "", 14, false);
        install = button(content, "Install Waze", this::connectAndInstall);
        check = button(content, "Check installation", this::verify);
        cancel = button(content, "Discard pending install", () -> {
            new AlertDialog.Builder(this).setMessage("If the Android installer is still open, cancel it first. Discard this pending APK?")
                .setNegativeButton("Keep", null).setPositiveButton("Discard", (dialog, which) -> {
                    prefs.edit().clear().commit(); new File(getFilesDir(), "pending.apk").delete();
                    message = "Pending install discarded. Waze has not been removed."; render();
                }).show();
        });
        repair = button(content, "Repair Android Auto visibility", () -> {
            try { stage(Uri.fromFile(new File(getPackageManager().getApplicationInfo(WAZE, 0).sourceDir))); }
            catch (Exception error) { fail("Waze is not installed. Choose the patched APK first."); }
        });
        choose = button(content, "Choose Waze APK", () -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("application/vnd.android.package-archive")
                .addCategory(Intent.CATEGORY_OPENABLE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            startActivityForResult(intent, PICK);
        });
        shizuku = button(content, "Open Shizuku", () -> {
            Intent intent = getPackageManager().getLaunchIntentForPackage("moe.shizuku.privileged.api");
            if (intent == null) fail("Install Shizuku, then start it through wireless debugging.");
            else startActivity(intent);
        });
        done = button(content, "Return to Morphe", () -> {
            Intent intent = getPackageManager().getLaunchIntentForPackage("app.morphe.manager");
            if (intent != null) startActivity(intent); finish();
        });
        label(content, "After restarting your phone, start Shizuku again using wireless debugging. No computer is needed.\n\nUse the same signing key for Waze updates. This installer never uninstalls Waze or clears its data.", 13, false);
    }
    private void render() {
        if (status == null) return;
        boolean running = Shizuku.pingBinder();
        boolean allowed = running && Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED;
        shizukuState.setText(running ? (allowed ? "Shizuku is ready" : "Shizuku permission needed") : "Shizuku is not running");
        String state = prefs.getString("state", "");
        if ("success".equals(state) && !hasExpectedSource()) {
            prefs.edit().putString("state", "").apply(); state = "";
            message = "Waze's installation source has changed. Use Repair Android Auto visibility to restore it.";
        }
        boolean pending = new File(getFilesDir(), "pending.apk").isFile() && !prefs.getString("token", "").isEmpty();
        if ("waiting".equals(state) && !busy) message = "Tap Update in Android's installer. Return here to check the result.";
        if ("success".equals(state)) message = "Installation source verified. Open Android Auto → Customise launcher to check Waze.";
        status.setText(message);
        details.setText(pending ? "Waze " + prefs.getString("versionName", "") + " is ready. Your data will be kept." : sourceSummary());
        install.setVisibility(pending && !"success".equals(state) ? View.VISIBLE : View.GONE);
        install.setText("waiting".equals(state) ? "Retry update prompt" : "Install Waze");
        install.setEnabled(!busy); check.setVisibility("waiting".equals(state) ? View.VISIBLE : View.GONE);
        check.setEnabled(!busy); repair.setEnabled(!busy && !"waiting".equals(state));
        cancel.setVisibility(pending && !busy ? View.VISIBLE : View.GONE);
        choose.setEnabled(!busy && !"waiting".equals(state)); shizuku.setEnabled(!busy);
    }
    private String sourceSummary() {
        try {
            InstallSourceInfo source = getPackageManager().getInstallSourceInfo(WAZE);
            return "Installed source: " + ("com.android.vending".equals(source.getInstallingPackageName()) ? "Google Play Store" : "Not the required Play Store handoff");
        } catch (Exception ignored) { return "Select a patched Waze APK or send one from Morphe."; }
    }
    private boolean hasExpectedSource() {
        try {
            InstallSourceInfo source = getPackageManager().getInstallSourceInfo(WAZE);
            return "com.android.vending".equals(source.getInstallingPackageName()) && INSTALLER.equals(source.getInitiatingPackageName());
        } catch (Exception ignored) { return false; }
    }
    private void fail(String text) { busy = false; message = text; render(); }
    private void accept(Intent intent) {
        Uri uri = Intent.ACTION_SEND.equals(intent.getAction()) ? intent.getParcelableExtra(Intent.EXTRA_STREAM) : intent.getData();
        if (uri != null) stage(uri);
    }
    @Override protected void onActivityResult(int code, int result, Intent data) {
        super.onActivityResult(code, result, data);
        if (code == PICK && result == RESULT_OK && data != null && data.getData() != null) stage(data.getData());
    }
    private void stage(Uri uri) {
        if (busy) return;
        if ("waiting".equals(prefs.getString("state", ""))) { fail("Finish or discard the pending installation first."); return; }
        if (!Arrays.asList("content", "file").contains(uri.getScheme())) { fail("Choose a local Waze APK."); return; }
        busy = true; message = "Preparing and checking Waze…"; render();
        prefs.edit().clear().commit(); new File(getFilesDir(), "pending.apk").delete();
        worker.execute(() -> {
            File temporary = new File(getFilesDir(), "pending.part");
            try {
                if (android.os.Process.myUid() / 100000 != 0) throw new IOException("Use this installer in the phone's main profile.");
                try (InputStream input = getContentResolver().openInputStream(uri); FileOutputStream output = new FileOutputStream(temporary)) {
                    if (input == null) throw new IOException("The APK could not be opened. Send it from Morphe again.");
                    byte[] buffer = new byte[65536]; long size = 0; int n;
                    while ((n = input.read(buffer)) != -1) {
                        size += n; if (size > 512L * 1024 * 1024) throw new IOException("The APK exceeds the supported 512 MB size.");
                        output.write(buffer, 0, n);
                    }
                    output.getFD().sync();
                }
                PackageManager pm = getPackageManager();
                PackageInfo candidate = pm.getPackageArchiveInfo(temporary.getPath(), PackageManager.GET_SIGNING_CERTIFICATES);
                if (candidate == null || !WAZE.equals(candidate.packageName)) throw new IOException("Choose the patched Waze APK. This installer supports com.waze only.");
                try (ZipFile archive = new ZipFile(temporary)) {
                    if (candidate.applicationInfo == null || archive.getEntry("classes.dex") == null || archive.getEntry("lib/arm64-v8a/libwaze.so") == null)
                        throw new IOException("Choose Morphe's complete ARM64 patched APK, not an individual split.");
                }
                String signature = signatures(candidate); long before = 0;
                try {
                    PackageInfo current = pm.getPackageInfo(WAZE, PackageManager.GET_SIGNING_CERTIFICATES);
                    before = current.lastUpdateTime;
                    if (!signature.equals(signatures(current))) throw new IOException("This APK uses a different signing key. Rebuild with the key used for installed Waze. Waze has not been uninstalled.");
                    if (candidate.getLongVersionCode() < current.getLongVersionCode()) throw new IOException("This APK is older than installed Waze. Choose the current or a newer build.");
                } catch (PackageManager.NameNotFoundException ignored) {}
                ApplicationInfo installer = pm.getApplicationInfo(INSTALLER, 0);
                if ((installer.flags & (ApplicationInfo.FLAG_SYSTEM | ApplicationInfo.FLAG_UPDATED_SYSTEM_APP)) == 0)
                    throw new IOException("Google Package Installer is not a system app on this phone.");
                String token = UUID.randomUUID().toString().replace("-", "");
                Files.move(temporary.toPath(), new File(getFilesDir(), "pending.apk").toPath(), StandardCopyOption.REPLACE_EXISTING);
                if (!prefs.edit().putString("token", token).putString("state", "ready")
                    .putString("versionName", candidate.versionName).putLong("versionCode", candidate.getLongVersionCode())
                    .putString("signature", signature).putLong("beforeUpdate", before).commit()) throw new IOException("Could not save the installation state.");
                runOnUiThread(() -> { busy = false; message = "Waze is ready to install."; render(); connectAndInstall(); });
            } catch (Exception error) {
                temporary.delete(); runOnUiThread(() -> fail(error.getMessage() == null ? error.toString() : error.getMessage()));
            }
        });
    }
    private String signatures(PackageInfo info) throws Exception {
        if (info.signingInfo == null) throw new IOException("The APK has no signing certificate.");
        List<String> values = new ArrayList<>();
        for (Signature signature : info.signingInfo.getApkContentsSigners()) {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(signature.toByteArray()); StringBuilder hex = new StringBuilder();
            for (byte b : hash) hex.append(String.format(Locale.ROOT, "%02x", b & 255)); values.add(hex.toString());
        }
        if (values.isEmpty()) throw new IOException("The APK has no signing certificate.");
        Collections.sort(values); return String.join(",", values);
    }
    private void connectAndInstall() {
        if (busy || !new File(getFilesDir(), "pending.apk").isFile()) return;
        if (!Shizuku.pingBinder()) { fail("Open Shizuku and start it through wireless debugging. Then return and tap Install Waze."); return; }
        try {
            if (Shizuku.getVersion() < 13) { fail("Update Shizuku to version 13 or newer."); return; }
            if (Shizuku.checkSelfPermission() != PackageManager.PERMISSION_GRANTED) { Shizuku.requestPermission(PERMISSION); return; }
            if (Shizuku.getUid() != 2000) { fail("Start Shizuku using wireless debugging (ADB mode) for this installer."); return; }
            if (service != null && service.asBinder().pingBinder()) { launchInstaller(); return; }
            if (binding) return;
            binding = true; busy = true; message = "Connecting to Shizuku…"; render();
            Shizuku.bindUserService(serviceArgs, connection);
            ui.postDelayed(() -> {
                if (binding) { binding = false; fail("Shizuku did not connect. Open Shizuku, check access, then retry."); }
            }, 15000);
        } catch (Exception error) { binding = false; fail("Could not connect to Shizuku: " + error.getMessage()); }
    }
    private void launchInstaller() {
        busy = true; message = "Opening Android's installer…"; render();
        worker.execute(() -> {
            try {
                prefs.edit().putString("state", "waiting").commit();
                String result = service.launchInstaller(prefs.getString("token", ""));
                if (result.startsWith("ERROR:")) throw new IOException(result.substring(6).trim());
                runOnUiThread(() -> { busy = false; render(); if (resumed) ui.post(poll); });
            } catch (Exception error) {
                prefs.edit().putString("state", "ready").commit();
                runOnUiThread(() -> fail("Could not open the installer: " + error.getMessage()));
            }
        });
    }
    private void verify() {
        if (!"waiting".equals(prefs.getString("state", ""))) return;
        try {
            PackageInfo current = getPackageManager().getPackageInfo(WAZE, PackageManager.GET_SIGNING_CERTIFICATES);
            if (current.lastUpdateTime <= prefs.getLong("beforeUpdate", Long.MAX_VALUE)) { render(); return; }
            if (current.getLongVersionCode() != prefs.getLong("versionCode", -1) || !signatures(current).equals(prefs.getString("signature", ""))) {
                prefs.edit().putString("state", "ready").commit(); fail("A different Waze build was installed. Choose the intended APK again."); return;
            }
            InstallSourceInfo source = getPackageManager().getInstallSourceInfo(WAZE);
            if (!"com.android.vending".equals(source.getInstallingPackageName()) || !INSTALLER.equals(source.getInitiatingPackageName())) {
                prefs.edit().putString("state", "ready").putLong("beforeUpdate", current.lastUpdateTime).commit();
                fail("Waze installed, but Android did not retain the required Play Store source. Tap Install Waze to retry."); return;
            }
            prefs.edit().putString("state", "success").remove("token").commit();
            new File(getFilesDir(), "pending.apk").delete();
            android.util.Log.i("WazeAAInstaller", "Verified source: installer=" + source.getInstallingPackageName() + ", initiator=" + source.getInitiatingPackageName());
            setResult(RESULT_OK); render();
        } catch (PackageManager.NameNotFoundException ignored) { render(); }
        catch (Exception error) { fail("Could not verify installation: " + error.getMessage()); }
    }
}
