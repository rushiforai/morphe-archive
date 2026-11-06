package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.InputFilter;
import android.text.InputType;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.BuildConfig;
import app.morphe.extension.shared.Utils;

/**
 * The problem report: the report screen ({@link ReportActivity}, "Report" and the app's name in the
 * launcher) and its row in Maps' Settings, after BYD battery. The user builds a report of the app's own state and logs
 * ({@link ReportBuilder}), sees all of it, and only Send queues it for the developer's server
 * ({@link ReportUploader}). The screen lists queued and sent reports with their IDs and deletes them,
 * and holds the feature switches and safe mode ({@link SafeMode}). The server URL and app key are set
 * when the bundle is built; a build without them has no send button.
 * <p>
 * After a crash, a notification leads to the screen and the next start shows a toast once; the row
 * says so until a report with the crash is queued. No dialog opens over the map, because the app may
 * restart while driving. The main process also watches its main thread ({@link MainWatchdog}), keeps
 * its own logcat lines from the start ({@link StartLogcat}) and looks for native crashes in the crash
 * log ({@link NativeCrashes}).
 */
@SuppressWarnings("unused")
public final class ReportPatch {
    static final String TAG = "MorpheReport";
    static final String URL = BuildConfig.MAPS_CAR_REPORT_URL, KEY = BuildConfig.MAPS_CAR_REPORT_KEY;
    /** The public repository (Gradle property projectUrl), shown at the top of the report screen. */
    private static final String PROJECT_URL = BuildConfig.MAPS_CAR_PROJECT_URL;
    /** The launcher alias the patch adds for {@link ReportActivity}. */
    private static final String LAUNCHER_ENTRY = "app.morphe.extension.mapsautomotive.patches.ReportLauncher";
    private static final long CRASH_TOAST_DELAY_MS = 8000;
    private static final String[] REDACTION_KEYS = {"coordinates", "map_links", "url_queries", "send_to_car_extras",
            "emails", "vins", "ip_addresses", "long_ids"};
    /** The report screen's label from the manifest, read once. */
    private static volatile String reportName;
    /** The open report screen's refresh, which a status dialog over it keeps running. */
    private static Runnable screenRefresh;
    /** The open report ID dialog's refresh, which the screen hands to the uploader again when it resumes. Main thread. */
    private static Runnable statusRefresh;
    /** The screen these belong to. */
    private static WeakReference<Activity> screenHost;
    /** Switches changed on the screen and not yet applied, so a refresh keeps them. */
    private static final Map<String, Boolean> pendingSwitches = new HashMap<>();

    private ReportPatch() {
    }

    static boolean configured() {
        return URL.startsWith("https://") && !KEY.isEmpty();
    }

    /**
     * From Application.onCreate (CrashLogPatch), in the main process: the uploader, the native crash
     * check, the main thread watchdog, the start log and the start notices.
     */
    static void onAppStart(Context context) {
        try {
            if (!context.getPackageName().equals(Application.getProcessName())) return;
            if (configured()) ReportUploader.start(context);
            Utils.runOnBackgroundThread(() -> NativeCrashes.check(context, true));
            MainWatchdog.start();
            StartLogcat.start(context);
            Utils.runOnBackgroundThread(() -> setLauncherEntry(context));
            new Handler(Looper.getMainLooper()).postDelayed(() -> showStartNotice(context), CRASH_TOAST_DELAY_MS);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "problem report not started", error);
        }
    }

    /**
     * The report's launcher entry, off in the manifest and turned on here, except on DiLink 5: its
     * launcher shows one entry per app, showed this one instead of the app (issue #3) and keeps
     * what it read at install, so the entry must be off from the install. Maps' Settings row and the
     * crash notification still open the report there. Set at each start, so a later build can change it.
     * On a background thread, so any error is caught: the entry then keeps its state.
     */
    private static void setLauncherEntry(Context context) {
        try {
            boolean on = !BydBatteryPatch.tsAdapterCar();
            PackageManager manager = context.getPackageManager();
            ComponentName entry = new ComponentName(context, LAUNCHER_ENTRY);
            int state = on ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED : PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
            if (manager.getComponentEnabledSetting(entry) == state) return;
            manager.setComponentEnabledSetting(entry, state, PackageManager.DONT_KILL_APP);
            ReportLog.i(TAG, "Report launcher entry " + (on ? "on" : "off (TS car adapter, one entry per app)"));
        } catch (Throwable error) {
            ReportLog.w(TAG, "launcher entry not set", error);
        }
    }

    /**
     * Where the report screen opens from, for texts that send the user there: its launcher entry ("Report"
     * and the app's name the patch was given), or Maps' Settings row where the entry is off or its label
     * cannot be read.
     */
    static String reportPlace(Context context, boolean thai) {
        if (!BydBatteryPatch.tsAdapterCar()) {
            String name = reportName(context);
            if (name != null) return name;
        }
        return thai ? "การตั้งค่า > รายงานปัญหา" : "Settings > Report a problem";
    }

    /** The report screen's label in the manifest, the same as its launcher entry's; null when unreadable. */
    static String reportName(Context context) {
        String name = reportName;
        if (name != null) return name;
        try {
            PackageManager manager = context.getPackageManager();
            CharSequence label = manager.getActivityInfo(new ComponentName(context, ReportActivity.class), 0).loadLabel(manager);
            if (label == null || label.length() == 0) return null;
            name = label.toString();
            reportName = name;
            return name;
        } catch (Throwable error) {
            ReportLog.w(TAG, "report label unreadable", error);
            return null;
        }
    }

    // One toast per start: safe mode ended by an update, safe mode, or the last crash (once).
    private static void showStartNotice(Context context) {
        try {
            boolean thai = UiDensityPatch.isThai(context);
            String text = null;
            if (SafeMode.takeClearedByUpdate(context)) {
                text = thai ? "อัปเดตแล้ว ออกจาก safe mode และเปิดฟีเจอร์เสริมอีกครั้ง"
                        : "Updated: safe mode ended and the extra features are back on.";
            } else if (SafeMode.automatic()) {
                ReportStore.takeCrashToast(context);
                ReportNotice.safeMode(context);
                text = thai ? "อยู่ใน safe mode ฟีเจอร์เสริมปิดอยู่ ดูที่ " + reportPlace(context, true)
                        : "Safe mode: extra features are off. See " + reportPlace(context, false) + ".";
            } else if (ReportStore.takeCrashToast(context)) {
                text = thai ? "แอปปิดตัวผิดปกติครั้งก่อน ส่งรายงานได้ที่ " + reportPlace(context, true)
                        : "The app closed unexpectedly last time. Open " + reportPlace(context, false) + " to send a report.";
            }
            if (text != null) Toast.makeText(context, text, Toast.LENGTH_LONG).show();
        } catch (Throwable error) {
            ReportLog.w(TAG, "start notice not shown", error);
        }
    }

    // Settings row. The patch adds it to Maps' Settings list, before About & help.

    /** Injection point: the row title. */
    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "รายงานปัญหา" : "Report a problem";
    }

    /** Injection point: the row subtitle. */
    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        try {
            if (ReportStore.pendingCrash(context) != null && configured()) {
                return thai ? "มี crash ใหม่ · แตะเพื่อส่งรายงาน" : "New crash · tap to send a report";
            }
            int off = SafeMode.switchedOff();
            if (off > 0) return thai ? "ปิดฟีเจอร์อยู่ " + off + " รายการ · แตะเพื่อดู" : off + (off == 1 ? " feature" : " features") + " off · tap to see";
            if (!configured()) return thai ? "ไม่ได้ตั้งค่าการส่งรายงานใน build นี้ · ฟีเจอร์เสริม" : "Not set up in this build · extra features";
            int queued = ReportStore.queuedCount(context);
            if (queued > 0) return thai ? "รอส่ง " + queued + " รายงาน" : queued + " waiting to send";
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "report state unreadable", error);
        }
        return thai ? "ส่งบันทึกให้ผู้พัฒนาแพตช์ ดูได้ก่อนส่ง · ฟีเจอร์เสริม" : "Send logs to the patch developer, reviewed first · extra features";
    }

    /** Injection point: the row's click action, which opens the report screen. */
    public static Runnable getSettingsAction(Context context, View container) {
        return () -> ReportActivity.open(context);
    }

    /** From ReportActivity: builds the screen on it and returns its refresh. */
    static Runnable attachScreen(Activity host) {
        boolean thai = UiDensityPatch.isThai(host);
        Views views = new Views(host);
        LinearLayout content = views.vertical();
        content.setPadding(0, views.px(8), 0, views.px(24));
        ScrollView root = new ScrollView(host);
        root.addView(content);
        host.setContentView(root);
        pendingSwitches.clear();
        Runnable[] refresh = new Runnable[1];
        refresh[0] = () -> {
            if (!host.isFinishing() && !host.isDestroyed()) fillScreen(host, views, content, thai, refresh[0]);
        };
        screenRefresh = refresh[0];
        screenHost = new WeakReference<>(host);
        // A native crash since the last check shows as a new crash.
        Context app = host.getApplicationContext();
        Utils.runOnBackgroundThread(() -> {
            NativeCrashes.check(app, false);
            host.runOnUiThread(refresh[0]);
        });
        return refresh[0];
    }

    /** The uploader's listener while the screen shows: the report ID dialog over it, if open, then the screen. */
    static Runnable onUploadChange(Runnable screen) {
        return () -> {
            Runnable status = statusRefresh;
            if (status != null) status.run();
            if (screen != null) screen.run();
        };
    }

    /** Only for the screen that attached last: a screen opened again can attach before the old one is destroyed. */
    static void detachScreen(Activity host) {
        if (screenHost == null || screenHost.get() != host) return;
        screenHost = null;
        screenRefresh = null;
        statusRefresh = null;
        pendingSwitches.clear();
    }

    // The screen: safe mode, the GitHub link, a new report, the queued, sent, failed and expired ones, then the switches.
    private static void fillScreen(Activity host, Views views, LinearLayout content, boolean thai, Runnable refresh) {
        content.removeAllViews();
        Context app = host.getApplicationContext();
        SafeMode.refresh(app);
        if (SafeMode.automatic()) {
            TextView safeMode = views.text(17, views.accent, true);
            safeMode.setText(thai ? "Safe mode: ฟีเจอร์เสริมปิดอยู่" : "Safe mode: extra features are off");
            safeMode.setPadding(views.px(24), views.px(8), views.px(24), 0);
            content.addView(safeMode);
            SimpleDateFormat local = new SimpleDateFormat("d MMM HH:mm", Locale.getDefault());
            content.addView(views.paragraph(thai
                    ? "แอปเด้ง 2 ครั้งภายใน 10 นาที (" + local.format(new Date(SafeMode.automaticSince()))
                    + ") ส่งรายงานด้านล่าง แล้วเปิดฟีเจอร์กลับที่ \"ฟีเจอร์เสริม\""
                    : "The app crashed twice within 10 minutes (" + local.format(new Date(SafeMode.automaticSince()))
                    + "). Send a report below, then turn features back on under \"Extra features\"."));
            content.addView(views.divider());
        }
        addGitHubRow(host, views, content, thai);
        content.addView(views.divider());
        TextView intro = views.paragraph(thai
                ? "ส่งบันทึกการทำงานของแอปให้ผู้พัฒนาแพตช์เพื่อแก้ปัญหา คุณจะเห็นข้อมูลทั้งหมดก่อนส่ง และลบได้ทุกเมื่อ"
                : "Send the app's own logs to the patch developer to fix a problem. You see everything before it is sent and can delete it any time.");
        content.addView(intro);
        List<ReportStore.Entry> entries = ReportStore.entries(app);
        if (!configured()) {
            content.addView(views.paragraph(thai
                    ? "Build นี้ไม่ได้ตั้งค่าเซิร์ฟเวอร์รายงาน จึงส่งไม่ได้ แจ้งปัญหาที่ GitHub ตามลิงก์ด้านบนแทน"
                    : "This build has no report server, so reports cannot be sent. Report the problem on GitHub with the link above."));
        } else {
            int queued = 0;
            for (ReportStore.Entry entry : entries) if (ReportStore.QUEUED.equals(entry.state)) queued++;
            boolean full = queued >= ReportStore.MAX_QUEUED;
            boolean crash = ReportStore.pendingCrash(app) != null;
            TextView create = views.action(thai ? "สร้างรายงานใหม่" + (crash ? " (รวม crash ใหม่)" : "")
                    : "New report" + (crash ? " (with the new crash)" : ""));
            create.setEnabled(!full);
            create.setAlpha(full ? 0.5f : 1f);
            create.setOnClickListener(view -> startReport(host));
            content.addView(create);
            if (full) {
                content.addView(views.paragraph(thai ? "รอส่งครบ " + ReportStore.MAX_QUEUED + " รายงานแล้ว ลบรายงานที่รอส่งก่อน"
                        : ReportStore.MAX_QUEUED + " reports are waiting already. Delete a waiting one first."));
            }
        }
        if (!entries.isEmpty()) content.addView(views.divider());
        for (ReportStore.Entry entry : entries) {
            LinearLayout row = views.horizontal();
            row.setMinimumHeight(views.px(56));
            row.setPadding(views.px(24), views.px(4), views.px(8), views.px(4));
            LinearLayout texts = views.vertical();
            TextView title = views.text(16, views.primary, ReportStore.SENT.equals(entry.state));
            title.setText(stateText(entry, thai));
            TextView sub = views.text(13, views.secondary, false);
            sub.setText(entryDetails(entry, thai));
            texts.addView(title);
            texts.addView(sub);
            row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            if (ReportStore.SENT.equals(entry.state) && entry.id != null) {
                // The issue QR code with this report's ID, also after its status dialog was closed.
                Button qr = new Button(views.themed, null, android.R.attr.buttonBarButtonStyle);
                qr.setText(thai ? "แสดง QR" : "QR code");
                qr.setOnClickListener(view -> showGitHub(host, entry.id, entry.patchesVersion, entry.appVersion, thai));
                row.addView(qr, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            Button delete = new Button(views.themed, null, android.R.attr.buttonBarButtonStyle);
            delete.setText(thai ? "ลบ" : "Delete");
            delete.setOnClickListener(view -> confirmDelete(host, entry, thai, refresh));
            row.addView(delete, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            content.addView(row);
        }
        addFeatures(host, views, content, thai);
    }

    // The project's link, with a button for the QR code of a new issue.
    private static void addGitHubRow(Activity host, Views views, LinearLayout content, boolean thai) {
        LinearLayout row = views.horizontal();
        row.setMinimumHeight(views.px(56));
        row.setPadding(views.px(24), views.px(4), views.px(8), views.px(4));
        LinearLayout texts = views.vertical();
        TextView title = views.text(16, views.primary, false);
        title.setText(thai ? "ซอร์สโค้ดและแจ้งปัญหา" : "Source code and issues");
        TextView link = views.text(13, views.secondary, false);
        link.setText(PROJECT_URL.replaceFirst("^https://", ""));
        texts.addView(title);
        texts.addView(link);
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Button qr = new Button(views.themed, null, android.R.attr.buttonBarButtonStyle);
        qr.setText(thai ? "แสดง QR" : "QR code");
        qr.setOnClickListener(view -> showGitHub(host, null, Utils.getPatchesReleaseVersion(), appVersion(host), thai));
        row.addView(qr, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        row.setOnClickListener(view -> showGitHub(host, null, Utils.getPatchesReleaseVersion(), appVersion(host), thai));
        content.addView(row);
    }

    /** "Patches 0.1.5 · Google Maps 26.10.120003.E", this build's: the report screen's subtitle. */
    static String versions(Context context, boolean thai) {
        return versionLine(Utils.getPatchesReleaseVersion(), appVersion(context), thai);
    }

    private static String versionLine(String patches, String maps, boolean thai) {
        return (thai ? "แพตช์ " : "Patches ") + patches + " · Google Maps " + maps;
    }

    private static String appVersion(Context context) {
        try {
            String name = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            if (name != null && !name.isEmpty()) return name;
        } catch (Throwable error) {
            ReportLog.w(TAG, "app version unreadable", error);
        }
        return "unknown";
    }

    /**
     * Fills a field of the problem form for a new issue (its id in .github/ISSUE_TEMPLATE/problem.yml) when the
     * value is known; true if it did.
     */
    private static boolean field(StringBuilder url, String id, String value) {
        if (value == null || value.isEmpty() || "unknown".equals(value)) return false;
        try {
            url.append('&').append(id).append('=').append(URLEncoder.encode(value, "UTF-8"));
            return true;
        } catch (UnsupportedEncodingException impossible) {
            return false; // every Android has UTF-8
        }
    }

    /**
     * The QR code of a new GitHub issue (the report ID and versions filled in where known), for a phone to
     * scan: the head unit may have no browser, and a phone has the user's GitHub sign-in. A browser on this
     * device gets a button too. Beside the text in landscape, so the dialog stays low on a wide screen.
     * For a report, patches and maps are the versions it was made with (null in entries from older builds).
     */
    private static void showGitHub(Activity host, String reportId, String patches, String maps, boolean thai) {
        String form = PROJECT_URL + "/issues/new?template=problem.yml";
        StringBuilder filledForm = new StringBuilder(form);
        boolean idFilled = field(filledForm, "report-id", reportId);
        boolean bundleFilled = field(filledForm, "bundle", patches);
        boolean mapsFilled = field(filledForm, "maps", maps);
        String url = filledForm.toString();
        QrCode code = QrCode.encode(url);
        if (code == null) {
            url = form; // too long for a version 10 code
            code = QrCode.encode(url);
            idFilled = bundleFilled = mapsFilled = false;
        }
        // Both, or the text does not say "versions".
        boolean versionsFilled = bundleFilled && mapsFilled;
        AlertDialog.Builder builder = new AlertDialog.Builder(host).setTitle(thai ? "แจ้งปัญหาที่ GitHub" : "Report on GitHub");
        Views views = new Views(builder.getContext());
        boolean landscape = host.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        LinearLayout content = landscape ? views.horizontal() : views.vertical();
        content.setPadding(views.px(24), views.px(8), views.px(24), views.px(8));
        if (code != null) {
            int screen = Math.min(host.getResources().getDisplayMetrics().widthPixels, host.getResources().getDisplayMetrics().heightPixels);
            ImageView image = new ImageView(views.themed);
            image.setImageBitmap(qrBitmap(code, Math.min(views.px(280), screen / 2)));
            image.setContentDescription(thai ? "QR code ของ issue ใหม่" : "QR code of a new issue");
            LinearLayout.LayoutParams imageLayout = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            imageLayout.gravity = Gravity.CENTER_HORIZONTAL;
            content.addView(image, imageLayout);
        }
        boolean both = idFilled && versionsFilled;
        StringBuilder text = new StringBuilder(thai
                ? "สแกนด้วยมือถือ เพื่อเปิด issue ใหม่ที่ GitHub" + (idFilled || versionsFilled ? " ซึ่งกรอก" + (idFilled ? "รหัสรายงาน" : "")
                        + (both ? "และ" : "") + (versionsFilled ? "เวอร์ชัน" : "") + "ไว้ให้แล้ว" : "")
                : "Scan it with your phone to open a new GitHub issue" + (idFilled || versionsFilled ? " with " + (idFilled ? "the report ID" : "")
                        + (both ? " and " : "") + (versionsFilled ? "the versions" : "") + " filled in" : "") + ".");
        if (reportId == null && configured()) {
            text.append(thai ? " ถ้าส่งรายงานได้ ให้ส่งก่อน QR ของรายงานที่ส่งแล้ว (หลังกดส่ง หรือที่แถวของรายงานในหน้านี้) จะกรอกรหัสรายงานให้ด้วย"
                    : " If you can, send a report first: a sent report's QR code (after sending, or on its row on this screen) fills in its ID too.");
        }
        text.append("\n\n");
        if (reportId != null) text.append(thai ? "รหัสรายงาน " : "Report ID ").append(reportId).append('\n');
        if (reportId != null && patches == null && maps == null) {
            // An entry from a build before 0.1.5 stored no versions.
            text.append(thai ? "รายงานนี้มาจาก build ก่อนหน้า จึงไม่ได้กรอกเวอร์ชันไว้ ใส่เวอร์ชันที่ใช้ตอนเกิดปัญหา"
                    + " หรือเวอร์ชันปัจจุบันใต้ชื่อหน้าจอถ้ายังเกิดอยู่"
                    : "This report is from an earlier build, so the versions are not filled in. Enter the ones you had when the"
                    + " problem happened, or the current ones under the screen's title if it still happens.");
        } else {
            text.append(versionLine(patches != null ? patches : "unknown", maps != null ? maps : "unknown", thai));
        }
        text.append("\n\n").append(PROJECT_URL.replaceFirst("^https://", ""));
        TextView message = views.text(15, views.secondary, false);
        message.setLineSpacing(0, 1.2f);
        message.setText(text);
        if (landscape) {
            message.setPadding(views.px(24), 0, 0, 0);
            content.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        } else {
            message.setPadding(0, views.px(12), 0, 0);
            content.addView(message);
        }
        ScrollView root = new ScrollView(views.themed);
        root.addView(content);
        builder.setView(root).setPositiveButton(thai ? "ปิดหน้าต่าง" : "Close", null);
        Intent view = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).addCategory(Intent.CATEGORY_BROWSABLE)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        boolean browser = hasBrowser(host, view);
        if (browser) builder.setNeutralButton(thai ? "เปิดในเบราว์เซอร์" : "Open in browser", (dialog, which) -> openLink(host, view, thai));
        ReportLog.i(TAG, "GitHub dialog: " + (code == null ? "no QR code" : "QR version " + code.version + ", mask " + code.mask)
                + ", filled:" + (idFilled ? " report-id" : "") + (bundleFilled ? " bundle" : "") + (mapsFilled ? " maps" : "")
                + (idFilled || bundleFilled || mapsFilled ? "" : " none") + (browser ? ", browser" : ", no browser"));
        builder.show();
    }

    private static boolean hasBrowser(Context context, Intent view) {
        try {
            return view.resolveActivity(context.getPackageManager()) != null;
        } catch (RuntimeException error) {
            return false;
        }
    }

    private static void openLink(Activity host, Intent view, boolean thai) {
        try {
            host.startActivity(view);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "link not opened", error);
            Toast.makeText(host, thai ? "เปิดเบราว์เซอร์ไม่ได้ ใช้ QR code แทน" : "No browser opened it. Scan the QR code instead.",
                    Toast.LENGTH_LONG).show();
        }
    }

    // Black on white with the four-module quiet zone, whole pixels per module and no density scaling, so it stays sharp.
    private static Bitmap qrBitmap(QrCode code, int maxSide) {
        int modules = code.size + 8, scale = Math.max(1, maxSide / modules), side = modules * scale;
        int[] pixels = new int[side * side];
        Arrays.fill(pixels, Color.WHITE);
        for (int y = 0; y < code.size; y++) {
            for (int x = 0; x < code.size; x++) {
                if (!code.isDark(x, y)) continue;
                int left = (x + 4) * scale;
                for (int row = (y + 4) * scale; row < (y + 5) * scale; row++) {
                    Arrays.fill(pixels, row * side + left, row * side + left + scale, Color.BLACK);
                }
            }
        }
        Bitmap bitmap = Bitmap.createBitmap(pixels, side, side, Bitmap.Config.ARGB_8888);
        bitmap.setDensity(Bitmap.DENSITY_NONE);
        return bitmap;
    }

    // The feature switches. They apply when the app starts again, so the screen restarts it.
    private static void addFeatures(Activity host, Views views, LinearLayout content, boolean thai) {
        content.addView(views.divider());
        TextView heading = views.text(17, views.primary, true);
        heading.setText(thai ? "ฟีเจอร์เสริม" : "Extra features");
        heading.setPadding(views.px(24), views.px(8), views.px(24), 0);
        content.addView(heading);
        content.addView(views.paragraph(SafeMode.automatic()
                ? (thai ? "Safe mode ปิดทุกฟีเจอร์อยู่ เลือกฟีเจอร์ที่จะเปิด แล้วเริ่มแอปใหม่ ถ้าเด้งอีก 2 ครั้งใน 10 นาที safe mode จะกลับมา"
                : "Safe mode has turned every feature off. Choose the ones to turn on, then restart the app. "
                + "Two more crashes within 10 minutes bring safe mode back.")
                : (thai ? "ปิดฟีเจอร์ที่สงสัยว่าทำให้เกิดปัญหา แล้วเริ่มแอปใหม่ ส่วนหลัก (MicroG-RE, Android 10, รายงานปัญหา) เปิดอยู่เสมอ"
                : "Turn off a feature you suspect, then restart the app. The core (MicroG-RE, Android 10 support, "
                + "this report) is always on.")));
        List<Switch> switches = new ArrayList<>();
        for (String feature : SafeMode.FEATURES) {
            if (!SafeMode.included(feature)) continue;
            LinearLayout row = views.horizontal();
            row.setMinimumHeight(views.px(56));
            row.setPadding(views.px(24), views.px(4), views.px(16), views.px(4));
            LinearLayout texts = views.vertical();
            TextView title = views.text(16, views.primary, false);
            title.setText(featureName(feature, thai));
            TextView sub = views.text(13, views.secondary, false);
            sub.setText((thai ? "ปิด: " : "Off: ") + featureOff(feature, thai));
            texts.addView(title);
            texts.addView(sub);
            row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            Switch toggle = new Switch(views.themed);
            toggle.setTag(feature);
            // In safe mode every feature is off, and the switches show that; the user turns on the ones to try.
            Boolean pending = pendingSwitches.get(feature);
            toggle.setChecked(pending != null ? pending : !SafeMode.automatic() && SafeMode.switchOn(feature));
            toggle.setOnCheckedChangeListener((button, checked) -> pendingSwitches.put(feature, checked));
            row.setOnClickListener(view -> toggle.toggle());
            row.addView(toggle, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            content.addView(row);
            switches.add(toggle);
        }
        TextView allOn = views.action(thai ? "เลือกเปิดทุกฟีเจอร์" : "Select all features");
        allOn.setOnClickListener(view -> {
            for (Switch toggle : switches) toggle.setChecked(true);
        });
        content.addView(allOn);
        TextView restart = views.action(thai ? "เริ่มแอปใหม่ด้วยฟีเจอร์ที่เลือก" : "Restart the app with these features");
        restart.setOnClickListener(view -> {
            Map<String, Boolean> chosen = new HashMap<>();
            for (Switch toggle : switches) chosen.put((String) toggle.getTag(), toggle.isChecked());
            new AlertDialog.Builder(host)
                    .setTitle(thai ? "เริ่มแอปใหม่?" : "Restart the app?")
                    .setMessage(thai ? "แอปจะปิดแล้วเปิดใหม่ด้วยฟีเจอร์ที่เลือก การนำทางที่กำลังทำงานจะหยุด"
                            : "The app closes and opens again with the chosen features. Active navigation stops.")
                    .setPositiveButton(thai ? "เริ่มใหม่" : "Restart", (dialog, which) -> {
                        if (SafeMode.apply(host.getApplicationContext(), chosen)) {
                            pendingSwitches.clear();
                            SafeMode.restartMaps(host);
                        } else {
                            message(host, thai ? "บันทึกการตั้งค่าไม่ได้ ลองอีกครั้ง" : "The switches could not be saved. Try again.");
                        }
                    })
                    .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                    .show();
        });
        content.addView(restart);
    }

    private static String featureName(String feature, boolean thai) {
        switch (feature) {
            case SafeMode.UI_DENSITY: return thai ? "ขนาดการแสดงผล (UI density)" : "UI density";
            case SafeMode.DRIVER_SIDE: return thai ? "ฝั่งพวงมาลัย (Driver side)" : "Driver side";
            case SafeMode.BUILDINGS_3D: return thai ? "อาคาร 3 มิติ (3D buildings)" : "3D buildings";
            case SafeMode.BYD_BATTERY: return thai ? "แบตเตอรี่รถ BYD (EV)" : "BYD battery (EV)";
            case SafeMode.SEND_TO_CAR: return "Send to car";
            case SafeMode.LOCATION_LOCKOUT_DELAY: return thai ? "แก้ตำแหน่งกะพริบของ BYD" : "BYD location flicker fix";
            case SafeMode.BYD_NAVIGATION_VOLUME: return thai ? "ระดับเสียงนำทางของ BYD" : "BYD navigation volume";
            case SafeMode.TTS_WARMUP: return thai ? "เตรียมเสียงนำทางล่วงหน้า (TTS)" : "Voice guidance warm-up (TTS)";
            case SafeMode.WINDOW_REFRESH: return thai ? "ปรับเลย์เอาต์เมื่อแบ่งจอ" : "Split-screen layout refresh";
            default: return thai ? "แถวเสริมใน Settings" : "Extra rows in Settings";
        }
    }

    private static String featureOff(String feature, boolean thai) {
        switch (feature) {
            case SafeMode.UI_DENSITY: return thai ? "ใช้ขนาดของระบบ" : "the system density";
            case SafeMode.DRIVER_SIDE: return thai ? "Maps เลือกฝั่งการ์ดเอง (บน DiLink 3 อยู่ซ้าย)" : "Maps picks the cards' side (left on DiLink 3)";
            case SafeMode.BUILDINGS_3D: return thai ? "ชั้นแผนที่ไม่มีอาคาร 3 มิติ" : "no 3D buildings in the map layers";
            case SafeMode.BYD_BATTERY: return thai ? "ไม่ส่งแบตเตอรี่ให้ Maps ไม่มีหน้าจอ EV" : "no battery for Maps, no EV screens";
            case SafeMode.SEND_TO_CAR: return thai ? "รับทริปจากมือถือไม่ได้ และมือถือเห็นชื่อรถของ Maps" : "trips from the phone do not arrive, and phone Maps shows Maps' car name";
            case SafeMode.LOCATION_LOCKOUT_DELAY: return thai ? "หน้าจอตำแหน่งปิดกะพริบเมื่อ GPS ของ BYD หลุด" : "the location lockout flashes when BYD's GPS drops";
            case SafeMode.BYD_NAVIGATION_VOLUME: return thai ? "เสียงนำทางใช้ระดับเสียงเพลง" : "voice guidance follows the media volume";
            case SafeMode.TTS_WARMUP: return thai ? "เสียงนำทางแรกอาจเป็นเสียงสำรอง" : "the first prompt may use the canned voice";
            case SafeMode.WINDOW_REFRESH: return thai ? "การ์ดอาจใหญ่เกินหลังแบ่งจอ" : "cards may stay too large after a split-screen change";
            default: return thai ? "Settings ของ Maps ไม่มีแถวเสริม" : "Maps' Settings without the extra rows";
        }
    }

    private static String stateText(ReportStore.Entry entry, boolean thai) {
        switch (entry.state) {
            case ReportStore.SENT:
                return (thai ? "ส่งแล้ว · " : "Sent · ") + entry.id;
            case ReportStore.QUEUED:
                if (entry.error == null) return thai ? "รอส่ง" : "Waiting to send";
                if ("network".equals(entry.error)) return thai ? "รอส่ง (ไม่มีอินเทอร์เน็ต)" : "Waiting to send (no internet)";
                return thai ? "รอส่ง (ลองใหม่อัตโนมัติ · " + entry.error + ")" : "Waiting to send (retried automatically · " + entry.error + ")";
            case ReportStore.EXPIRED:
                return thai ? "หมดอายุ ไม่ได้ส่ง" : "Expired, not sent";
            default:
                if ("bad_key".equals(entry.error) || "schema_unsupported".equals(entry.error)) {
                    return thai ? "ส่งไม่ได้ · อัปเดตแอปเพื่อส่งรายงาน" : "Not sent · update the app to send reports";
                }
                if ("too_large".equals(entry.error)) return thai ? "ส่งไม่ได้ · ใหญ่เกิน สร้างรายงานใหม่" : "Not sent · too large, make a new report";
                return (thai ? "ส่งไม่ได้ (" : "Not sent (") + entry.error + ")";
        }
    }

    private static String entryDetails(ReportStore.Entry entry, boolean thai) {
        SimpleDateFormat local = new SimpleDateFormat("d MMM HH:mm", Locale.getDefault());
        String text = (thai ? "สร้าง " : "Made ") + local.format(new Date(entry.created));
        long expires = ReportBuilder.parseUtc(entry.expiresAt);
        if (ReportStore.SENT.equals(entry.state) && expires != Long.MAX_VALUE) {
            text += (thai ? " · ลบอัตโนมัติ " : " · deleted automatically ") + local.format(new Date(expires));
        }
        return text;
    }

    private static void confirmDelete(Activity host, ReportStore.Entry entry, boolean thai, Runnable refresh) {
        boolean sent = ReportStore.SENT.equals(entry.state);
        new AlertDialog.Builder(host)
                .setTitle(thai ? "ลบรายงาน?" : "Delete the report?")
                .setMessage(sent
                        ? (thai ? "ลบรายงาน " + entry.id + " จากเซิร์ฟเวอร์และจากรายการนี้" : "Deletes report " + entry.id + " from the server and this list.")
                        : (thai ? "ลบออกจากเครื่องนี้ รายงานนี้ไม่ได้อยู่บนเซิร์ฟเวอร์" : "Deletes it from this device. It is not on the server."))
                .setPositiveButton(thai ? "ลบ" : "Delete", (dialog, which) ->
                        ReportUploader.delete(host.getApplicationContext(), entry, (deleted, error) -> {
                            if (!deleted && !host.isFinishing()) {
                                Toast.makeText(host, (thai ? "ลบไม่ได้ (" : "Not deleted (") + error
                                        + (thai ? ") ลองใหม่ภายหลัง" : "), try again later"), Toast.LENGTH_LONG).show();
                            }
                            refresh.run();
                        }))
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
    }

    // Building, off the main thread, then the preview.
    private static void startReport(Activity host) {
        boolean thai = UiDensityPatch.isThai(host);
        // The report screen is not Maps' window: the window state comes from the main process (ReportBuilder).
        ReportBuilder.Screen screen = new ReportBuilder.Screen();
        AlertDialog progress = new AlertDialog.Builder(host)
                .setTitle(getSettingsTitle(host))
                .setMessage(thai ? "กำลังรวบรวมข้อมูล…" : "Collecting the report…")
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .show();
        Context app = host.getApplicationContext();
        Utils.runOnBackgroundThread(() -> {
            ReportBuilder.Draft built = null;
            Throwable failure = null;
            try {
                built = ReportBuilder.build(app, screen);
            } catch (Throwable error) {
                failure = error;
            }
            ReportBuilder.Draft draft = built;
            Throwable error = failure;
            host.runOnUiThread(() -> {
                if (!progress.isShowing() || host.isFinishing() || host.isDestroyed()) return;
                progress.dismiss();
                if (draft == null) {
                    ReportLog.w(TAG, "report not built", error);
                    message(host, thai ? "สร้างรายงานไม่ได้ ลองอีกครั้ง" : "The report could not be made. Try again.");
                    return;
                }
                showPreview(host, draft, thai);
            });
        });
    }

    private static void showPreview(Activity host, ReportBuilder.Draft draft, boolean thai) {
        AlertDialog.Builder builder = new AlertDialog.Builder(host).setTitle(thai ? "ตรวจรายงานก่อนส่ง" : "Review the report");
        Views views = new Views(builder.getContext());
        LinearLayout content = views.vertical();
        content.setPadding(0, views.px(4), 0, views.px(8));
        ScrollView root = new ScrollView(views.themed);
        root.addView(content);

        TextView summary = views.paragraph("");
        summary.setText(summary(draft.report, thai));
        summary.setTextColor(views.primary);
        content.addView(summary);

        JSONObject logs = draft.logs();
        JSONArray lines = logs == null ? new JSONArray() : logs.optJSONArray("lines");
        int count = lines == null ? 0 : lines.length(), dropped = logs == null ? 0 : logs.optInt("dropped");
        TextView logRow = views.action((thai ? "บันทึก " + count + " บรรทัด" : count + " log lines")
                + (dropped > 0 ? (thai ? " (ตัดที่เก่ากว่าออก " + dropped + ")" : " (" + dropped + " older left out)") : "")
                + (thai ? " · ดู" : " · view"));
        logRow.setOnClickListener(view -> showLines(host, thai ? "บันทึกที่จะส่ง" : "Logs to send", strings(lines), thai));
        content.addView(logRow);

        JSONObject mainLogcat = logs == null ? null : logs.optJSONObject("main_logcat");
        if (mainLogcat != null) {
            JSONArray systemLines = mainLogcat.optJSONArray("lines");
            int systemCount = systemLines == null ? 0 : systemLines.length();
            boolean now = "running".equals(mainLogcat.optString("source"));
            TextView systemRow = views.action((thai ? "log ระบบของแอป " + systemCount + " บรรทัด" : "App system log: " + systemCount + " lines")
                    + (now ? (thai ? " (ตอนนี้)" : " (now)") : (thai ? " (ตอนเริ่มครั้งล่าสุด)" : " (from its last start)"))
                    + (thai ? " · ดู" : " · view"));
            systemRow.setOnClickListener(view -> showLines(host, thai ? "log ระบบของแอป (คำเตือนและข้อผิดพลาด)"
                    : "App system log (warnings and errors)", strings(systemLines), thai));
            content.addView(systemRow);
        }

        JSONArray exits = draft.report.optJSONArray("exits");
        if (exits != null && exits.length() > 0) {
            TextView exitRow = views.action((thai ? "เหตุที่ปิดครั้งล่าสุด " + exits.length() + " รายการ" : "Why the app closed: " + exits.length() + " entries")
                    + (thai ? " · ดู" : " · view"));
            exitRow.setOnClickListener(view -> showLines(host, thai ? "เหตุที่แอปปิด" : "Why the app closed", exitLines(exits), thai));
            content.addView(exitRow);
        }

        JSONArray crashes = draft.crashes();
        if (crashes == null || crashes.length() == 0) {
            content.addView(views.paragraph(thai ? "ไม่มีไฟล์ crash" : "No crash files"));
        } else {
            for (int i = 0; i < crashes.length(); i++) {
                JSONObject crash = crashes.optJSONObject(i);
                if (crash == null) continue;
                String name = crash.optString("file_name");
                JSONArray logcat = crash.optJSONArray("logcat");
                int logcatLines = logcat == null ? 0 : logcat.length();
                TextView crashRow = views.action((thai ? "ไฟล์ crash: " : "Crash file: ") + name
                        + (logcatLines == 0 ? "" : thai ? " + log ระบบ " + logcatLines + " บรรทัด" : " + " + logcatLines + " system log lines")
                        + (thai ? " · ดู" : " · view"));
                crashRow.setOnClickListener(view -> {
                    List<String> shown = new ArrayList<>(Arrays.asList(crash.optString("text").split("\n")));
                    if (logcatLines > 0) {
                        shown.add("");
                        shown.add(thai ? "--- log ระบบของ process นี้ (คำเตือนและข้อผิดพลาด) ---" : "--- this process's system log (warnings and errors) ---");
                        shown.addAll(strings(logcat));
                    }
                    showLines(host, name, shown, thai);
                });
                content.addView(crashRow);
            }
        }

        content.addView(views.paragraph(redactionText(draft.redactor.counts(), thai)));

        EditText comment = new EditText(views.themed);
        comment.setHint(thai ? "อธิบายปัญหา (ไม่บังคับ) เช่น ทำอะไรอยู่ เกิดอะไรขึ้น" : "What happened? (optional)");
        comment.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        comment.setMinLines(2);
        comment.setMaxLines(6);
        comment.setFilters(new InputFilter[]{new InputFilter.LengthFilter(ReportBuilder.MAX_COMMENT_CHARS)});
        LinearLayout.LayoutParams commentLayout = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        commentLayout.setMargins(views.px(20), views.px(8), views.px(20), views.px(4));
        content.addView(comment, commentLayout);

        content.addView(views.divider());
        content.addView(views.paragraph(consentText(host, thai)));

        builder.setView(root)
                .setPositiveButton(thai ? "ส่ง" : "Send", null)
                .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                .setNeutralButton(thai ? "ดูข้อมูลทั้งหมด" : "View all data", null);
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(shown -> {
            // These buttons keep the preview open.
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> showLines(host, thai
                    ? "ข้อมูลที่จะส่ง (ข้อความและการยินยอมเพิ่มตอนกดส่ง)" : "Data to send (comment and consent added at Send)",
                    jsonLines(draft.report), thai));
            Button send = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            send.setOnClickListener(view -> send(host, dialog, send, draft, comment.getText().toString(), thai));
        });
        dialog.show();
    }

    private static CharSequence summary(JSONObject report, boolean thai) {
        SpannableStringBuilder text = new SpannableStringBuilder();
        JSONObject app = object(report, "app"), device = object(report, "device"), byd = report.optJSONObject("byd"),
                battery = object(report, "battery"), ui = object(report, "ui"), window = object(ui, "window");
        line(text, thai ? "แอป" : "App", app.optString("version_name") + (thai ? " · แพตช์ " : " · patches ") + app.optString("patches_version"));
        line(text, thai ? "อุปกรณ์" : "Device", device.optString("manufacturer") + " " + device.optString("model")
                + " · Android " + device.optString("android_release"));
        line(text, thai ? "รถ BYD" : "BYD car", byd == null ? (thai ? "ไม่ใช่รถ BYD" : "not a BYD")
                : byd.isNull("model_id") ? (thai ? "อ่านรหัสรุ่นไม่ได้" : "model id unreadable")
                : (thai ? "รหัสรุ่น " : "model id ") + byd.optInt("model_id") + (byd.optBoolean("tested_model")
                ? (thai ? " · ทดสอบแล้ว" : " · tested") : (thai ? " · ยังไม่ได้ทดสอบ" : " · untested")));
        String batteryText = report.isNull("battery") ? "–"
                : !battery.optBoolean("enabled") ? (thai ? "ปิด" : "off")
                : !battery.optBoolean("active") ? (thai ? "เปิด · ไม่พบระบบรถ BYD" : "on · no BYD vehicle system")
                : battery.isNull("soc") ? (thai ? "เปิด · รอข้อมูล" : "on · waiting for data")
                : String.format(Locale.ROOT, thai ? "เปิด · แบต %.0f%%" : "on · battery %.0f%%", battery.optDouble("soc"));
        line(text, "BYD battery", batteryText);
        String screen = window.isNull("decor_width_px") ? "–" : window.optInt("decor_width_px") + "×" + window.optInt("decor_height_px");
        if (window.optBoolean("multi_window")) screen += thai ? " · แบ่งจอ" : " · split screen";
        if (!ui.isNull("density_applied_dpi")) screen += " · " + ui.optInt("density_applied_dpi") + " dpi";
        line(text, thai ? "หน้าจอ" : "Window", screen);
        JSONObject safeMode = object(report, "safe_mode"), features = object(safeMode, "features");
        StringBuilder off = new StringBuilder();
        for (Iterator<String> keys = features.keys(); keys.hasNext(); ) {
            String feature = keys.next();
            if (features.optBoolean(feature, true)) continue;
            if (off.length() > 0) off.append(", ");
            off.append(featureName(feature, thai));
        }
        line(text, thai ? "ฟีเจอร์ที่ปิด" : "Features off", (safeMode.optBoolean("automatic") ? "safe mode · " : "")
                + (off.length() == 0 ? (thai ? "ไม่มี" : "none") : off));
        return text;
    }

    private static String redactionText(Map<String, Integer> counts, boolean thai) {
        StringBuilder text = new StringBuilder();
        for (String key : REDACTION_KEYS) {
            Integer count = counts.get(key);
            if (count == null || count == 0) continue;
            if (text.length() > 0) text.append(" · ");
            text.append(redactionName(key, thai)).append(' ').append(count);
        }
        if (text.length() == 0) return thai ? "ไม่พบตำแหน่ง ลิงก์แผนที่ อีเมล VIN IP หรือเลขรหัสยาวที่ต้องลบ"
                : "No locations, map links, e-mail addresses, VINs, IP addresses or long ID numbers to remove.";
        return (thai ? "ลบออกบนเครื่องนี้แล้ว: " : "Removed on this device: ") + text;
    }

    private static String redactionName(String key, boolean thai) {
        switch (key) {
            case "coordinates": return thai ? "พิกัด" : "coordinates";
            case "map_links": return thai ? "ลิงก์แผนที่" : "map links";
            case "url_queries": return thai ? "ค่าใน URL" : "URL queries";
            case "send_to_car_extras": return thai ? "ข้อมูล Send to car" : "Send to car data";
            case "emails": return thai ? "อีเมล" : "e-mail addresses";
            case "vins": return "VIN";
            case "long_ids": return thai ? "เลขรหัสยาว" : "long ID numbers";
            default: return "IP";
        }
    }

    /**
     * The consent text, version 6: version 5 without the app's name, which a patch option now sets: "the
     * app", the patch developer, Google Maps as the other app, and the report screen's actual name.
     */
    private static CharSequence consentText(Context context, boolean thai) {
        SpannableStringBuilder text = new SpannableStringBuilder();
        String heading = thai ? "ส่งรายงานปัญหาให้ผู้พัฒนาแพตช์" : "Send a problem report to the patch developer";
        text.append(heading);
        text.setSpan(new StyleSpan(Typeface.BOLD), 0, heading.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.append('\n').append(thai
                ? "ข้อมูลที่ส่ง: รุ่นแอปและแพตช์ รุ่นอุปกรณ์และ Android ขนาด memory page ระบบรถของเครื่อง (Android Automotive,"
                + " SDK ของรถ, system library) รหัสรุ่นและเวอร์ชันซอฟต์แวร์ของรถ BYD สถานะ BYD battery และหน้าจอ"
                + " การตั้งค่าฟีเจอร์เสริม แอปที่อาจรบกวน (Google Maps, Google Play services) บันทึกการทำงานของแอป"
                + " ย้อนหลังไม่เกิน 3 วัน บรรทัดคำเตือนและข้อผิดพลาดใน log ระบบของ process หลักของแอป (รวมของโค้ด Maps"
                + " ของ Google แม้ไม่ crash) ไฟล์ crash (ถ้ามี) พร้อมบรรทัดแบบเดียวกันของ process ที่ crash เหตุที่ process ของแอป"
                + " ปิดครั้งล่าสุด (Android 11 ขึ้นไป) และข้อความที่คุณพิมพ์\n"
                + "ตำแหน่ง พิกัด ลิงก์แผนที่ อีเมล VIN IP และเลขรหัสยาว ถูกลบออกบนเครื่องนี้แล้วก่อนแสดงด้านบน\n"
                + "ใช้เพื่อแก้ปัญหาของแอปนี้เท่านั้น เก็บบน Cloudflare (อาจประมวลผลนอกประเทศไทย) 14 วันแล้วลบอัตโนมัติ"
                + " ไม่บันทึก IP ไว้กับรายงาน\n"
                + "ลบรายงานได้ทุกเมื่อที่ " + reportPlace(context, true) + " หรือแจ้งรหัสรายงานที่ GitHub Issues ของโปรเจกต์\n"
                + "กด \"ส่ง\" เพื่อยินยอม"
                : "Sent: app and patch versions, device and Android version, memory page size, the car platform (Android"
                + " Automotive, car SDKs, system libraries), BYD model id and head unit software version, BYD battery and"
                + " window state, the extra features' settings, other apps that may interfere (Google Maps, Google Play"
                + " services), the app's own logs from the last 3 days at most, the warning and error lines the app's main"
                + " process wrote to the system log (Google's Maps code included, even without a crash), crash files (if"
                + " any) with the same lines from the crashed process, why the app's processes last closed (Android 11"
                + " and newer), and your"
                + " comment.\n"
                + "Locations, coordinates, map links, e-mail addresses, VINs, IP addresses and long ID numbers were removed"
                + " on this device before the preview above.\n"
                + "Used only to fix this app. Stored on Cloudflare (possibly outside Thailand) for 14 days, then deleted"
                + " automatically. Your IP address is not stored with the report.\n"
                + "Delete it any time in " + reportPlace(context, false) + ", or send the report ID through the project's"
                + " GitHub Issues.\n"
                + "Tap \"Send\" to agree.");
        return text;
    }

    // Send: the final body off the main thread, then the queue and the status.
    private static void send(Activity host, AlertDialog preview, Button button, ReportBuilder.Draft draft, String comment, boolean thai) {
        button.setEnabled(false);
        Context app = host.getApplicationContext();
        Utils.runOnBackgroundThread(() -> {
            ReportStore.Entry queued = null;
            String problem;
            try {
                byte[] body = ReportBuilder.finish(draft, comment, thai);
                if (body == null) {
                    problem = thai ? "รายงานใหญ่เกินแม้ตัดบันทึกออกแล้ว ลดข้อความแล้วลองอีกครั้ง"
                            : "The report is too large even without its logs. Shorten the comment and try again.";
                } else {
                    JSONObject appInfo = object(draft.report, "app");
                    queued = ReportStore.enqueue(app, body, draft.crash, text(appInfo, "patches_version"), text(appInfo, "version_name"));
                    problem = queued != null ? null : thai ? "บันทึกรายงานไม่ได้ หรือรอส่งครบ " + ReportStore.MAX_QUEUED + " รายงานแล้ว"
                            : "The report could not be saved, or " + ReportStore.MAX_QUEUED + " reports are waiting already.";
                }
            } catch (JSONException | RuntimeException error) {
                ReportLog.w(TAG, "report not finished", error);
                problem = thai ? "สร้างรายงานไม่ได้ ลองอีกครั้ง" : "The report could not be made. Try again.";
            }
            ReportStore.Entry entry = queued;
            String failure = problem;
            host.runOnUiThread(() -> {
                if (entry == null) {
                    button.setEnabled(true);
                    if (!host.isFinishing()) message(host, failure);
                    return;
                }
                ReportStore.markCrashSeen(app, draft.crash);
                ReportNotice.cancel(app);
                ReportLog.i(TAG, "report queued (" + entry.bytes + " bytes" + (draft.crash != null ? ", after a crash" : "") + ")");
                preview.dismiss();
                ReportUploader.kick();
                if (!host.isFinishing()) showStatus(host, entry.key, thai);
            });
        });
    }

    // Sending, then the report ID in large text and a button for the QR code of an issue with it.
    private static void showStatus(Activity host, String key, boolean thai) {
        AlertDialog.Builder builder = new AlertDialog.Builder(host).setTitle(getSettingsTitle(host));
        Views views = new Views(builder.getContext());
        LinearLayout content = views.vertical();
        content.setPadding(views.px(24), views.px(8), views.px(24), views.px(8));
        TextView status = views.text(17, views.primary, false);
        TextView id = views.text(34, views.accent, true);
        id.setTextIsSelectable(true);
        id.setPadding(0, views.px(8), 0, views.px(8));
        TextView note = views.text(14, views.secondary, false);
        note.setLineSpacing(0, 1.2f);
        content.addView(status);
        content.addView(id);
        content.addView(note);
        builder.setView(content).setPositiveButton(thai ? "ปิดหน้าต่าง" : "Close", null)
                .setNeutralButton(thai ? "QR สำหรับ GitHub" : "GitHub QR code", null);
        AlertDialog dialog = builder.create();
        // Creates the buttons now, so the QR button is hidden or shown before the first frame.
        dialog.create();
        Context app = host.getApplicationContext();
        // The sent entry with its ID, for the QR button.
        ReportStore.Entry[] sentEntry = new ReportStore.Entry[1];
        Button qr = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
        // Its own listener keeps the status open under the QR code.
        if (qr != null) qr.setOnClickListener(view -> {
            ReportStore.Entry shown = sentEntry[0];
            if (shown != null) showGitHub(host, shown.id, shown.patchesVersion, shown.appVersion, thai);
        });
        Runnable refresh = () -> {
            ReportStore.Entry entry = null;
            for (ReportStore.Entry candidate : ReportStore.entries(app)) if (candidate.key.equals(key)) entry = candidate;
            boolean sent = entry != null && ReportStore.SENT.equals(entry.state);
            sentEntry[0] = sent && entry.id != null ? entry : null;
            id.setVisibility(sent ? View.VISIBLE : View.GONE);
            if (qr != null) qr.setVisibility(sentEntry[0] != null ? View.VISIBLE : View.GONE);
            if (entry == null) {
                status.setText(thai ? "ลบรายงานแล้ว" : "The report was deleted.");
                note.setText("");
            } else if (sent) {
                status.setText(thai ? "ส่งแล้ว · รหัสรายงาน" : "Sent · report ID");
                id.setText(entry.id);
                note.setText(thai ? "แจ้งรหัสนี้เมื่อเปิด issue ที่ GitHub หรือกด QR สำหรับ GitHub แล้วสแกนด้วยมือถือ จะได้ issue ที่กรอกรหัสไว้ให้"
                        + " ดูหรือลบรายงานได้ที่ " + reportPlace(host, true) + " ลบอัตโนมัติใน 14 วัน"
                        : "Give this ID when you open a GitHub issue, or tap GitHub QR code and scan it with your phone for an"
                        + " issue with the ID filled in. View or delete it in " + reportPlace(host, false) + "."
                        + " It is deleted automatically after 14 days.");
            } else if (ReportStore.QUEUED.equals(entry.state)) {
                status.setText(entry.attempts == 0 ? (thai ? "กำลังส่ง…" : "Sending…") : stateText(entry, thai));
                note.setText(thai ? "แอปส่งเองเมื่อมีอินเทอร์เน็ตขณะเปิดแอปอยู่ ปิดหน้าต่างนี้ได้"
                        : "The app sends it when it has internet while it is open. You can close this.");
            } else {
                status.setText(stateText(entry, thai));
                note.setText("");
            }
        };
        // The screen below keeps refreshing too, and alone again once this closes. statusRefresh keeps this one
        // refreshing after the screen pauses and resumes (ReportActivity.onResume).
        Runnable screen = screenRefresh;
        dialog.setOnShowListener(shown -> {
            statusRefresh = refresh;
            // The listener first, so a send that ends in between still refreshes this.
            ReportUploader.setListener(onUploadChange(screen));
            refresh.run();
        });
        dialog.setOnDismissListener(dismissed -> {
            if (statusRefresh == refresh) statusRefresh = null;
            ReportUploader.setListener(screen);
        });
        refresh.run();
        dialog.show();
    }

    // A long text, one list row per line, so thousands of lines scroll smoothly.
    private static void showLines(Activity host, String title, List<String> lines, boolean thai) {
        AlertDialog.Builder builder = new AlertDialog.Builder(host).setTitle(title);
        Views views = new Views(builder.getContext());
        ListView list = new ListView(views.themed);
        list.setAdapter(new BaseAdapter() {
            @Override
            public int getCount() {
                return lines.size();
            }

            @Override
            public Object getItem(int position) {
                return lines.get(position);
            }

            @Override
            public long getItemId(int position) {
                return position;
            }

            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                TextView row = convertView instanceof TextView ? (TextView) convertView : views.text(12, views.primary, false);
                if (convertView == null) {
                    row.setTypeface(Typeface.MONOSPACE);
                    row.setPadding(views.px(16), views.px(2), views.px(16), views.px(2));
                }
                row.setText(lines.get(position));
                return row;
            }
        });
        builder.setView(list).setPositiveButton(thai ? "ปิดหน้าต่าง" : "Close", null).show();
    }

    private static void message(Activity host, String text) {
        new AlertDialog.Builder(host).setTitle(getSettingsTitle(host)).setMessage(text).setPositiveButton("OK", null).show();
    }

    private static List<String> jsonLines(JSONObject report) {
        try {
            return Arrays.asList(report.toString(2).split("\n"));
        } catch (JSONException error) {
            return Arrays.asList(report.toString());
        }
    }

    private static List<String> strings(JSONArray array) {
        List<String> list = new ArrayList<>();
        if (array != null) for (int i = 0; i < array.length(); i++) list.add(array.optString(i));
        return list;
    }

    // One line per exit, then its description and an ANR's main thread, indented.
    private static List<String> exitLines(JSONArray exits) {
        List<String> list = new ArrayList<>();
        for (int i = 0; i < exits.length(); i++) {
            JSONObject exit = exits.optJSONObject(i);
            if (exit == null) continue;
            list.add(exit.optString("at") + " " + exit.optString("process") + " " + exit.optString("reason")
                    + " · status " + exit.optInt("status") + " · importance " + exit.optInt("importance"));
            if (!exit.isNull("description")) list.add("  " + exit.optString("description"));
            for (String line : strings(exit.optJSONArray("trace"))) list.add("  " + line);
        }
        return list;
    }

    private static String text(JSONObject json, String name) {
        return json.isNull(name) ? null : json.optString(name, null);
    }

    private static JSONObject object(JSONObject parent, String name) {
        JSONObject value = parent == null ? null : parent.optJSONObject(name);
        return value != null ? value : new JSONObject();
    }

    private static void line(SpannableStringBuilder text, String label, String value) {
        int start = text.length();
        text.append(label).append(": ");
        text.setSpan(new StyleSpan(Typeface.BOLD), start, text.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.append(value).append('\n');
    }

    /** Views styled from the dialog theme, sized for a head unit at arm's length. */
    private static final class Views {
        final Context themed;
        final int primary, secondary, accent;

        Views(Context themed) {
            this.themed = themed;
            primary = color(android.R.attr.textColorPrimary, new TextView(themed).getCurrentTextColor());
            secondary = color(android.R.attr.textColorSecondary, primary & 0x00FFFFFF | 0xB3 << 24);
            accent = color(android.R.attr.colorAccent, primary);
        }

        TextView text(int sp, int color, boolean bold) {
            TextView view = new TextView(themed);
            view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
            view.setTextColor(color);
            if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
            return view;
        }

        TextView paragraph(CharSequence value) {
            TextView view = text(15, secondary, false);
            view.setText(value);
            view.setLineSpacing(0, 1.2f);
            view.setPadding(px(24), px(8), px(24), px(4));
            return view;
        }

        /** A tappable line in the accent color, 48 dp high. */
        TextView action(String value) {
            TextView view = text(16, accent, true);
            view.setText(value);
            view.setMinHeight(px(48));
            view.setGravity(Gravity.CENTER_VERTICAL);
            view.setPadding(px(24), 0, px(24), 0);
            TypedValue ripple = new TypedValue();
            if (themed.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
                view.setBackgroundResource(ripple.resourceId);
            }
            return view;
        }

        View divider() {
            View divider = new View(themed);
            divider.setBackgroundColor(secondary & 0x00FFFFFF | 0x40 << 24);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, px(1)));
            params.setMargins(px(24), px(8), px(24), px(8));
            divider.setLayoutParams(params);
            return divider;
        }

        LinearLayout vertical() {
            LinearLayout layout = new LinearLayout(themed);
            layout.setOrientation(LinearLayout.VERTICAL);
            return layout;
        }

        LinearLayout horizontal() {
            LinearLayout layout = new LinearLayout(themed);
            layout.setOrientation(LinearLayout.HORIZONTAL);
            layout.setGravity(Gravity.CENTER_VERTICAL);
            return layout;
        }

        int px(int dp) {
            return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, themed.getResources().getDisplayMetrics());
        }

        private int color(int attribute, int fallback) {
            TypedValue value = new TypedValue();
            if (!themed.getTheme().resolveAttribute(attribute, value, true)) return fallback;
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) return value.data;
            try {
                if (value.resourceId != 0) return themed.getColorStateList(value.resourceId).getDefaultColor();
            } catch (RuntimeException ignored) {
                // The fallback.
            }
            return fallback;
        }
    }
}
