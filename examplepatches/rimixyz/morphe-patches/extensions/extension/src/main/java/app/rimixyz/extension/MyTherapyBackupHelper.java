package app.rimixyz.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * Backup local (.zip), restauração a frio com rollback e importação do arquivo CSV oficial
 * ("MyTherapy Archive.csv") para MyTherapy 4.16.2 (eu.smartpatient.mytherapy).
 *
 * Arquitetura confirmada no DEX:
 *  - Os 22 bancos Room3 do app usam BundledSQLiteDriver (libsqliteJni.so, SQLite sem SQLCipher).
 *  - Apenas o SDK opcional SmartPilot/Ypsomed usa SQLCipher (smssdk.db + encryptedPreferences),
 *    que fica explicitamente fora do backup portátil.
 *  - Exportação gera snapshots consistentes via VACUUM INTO (fallback wal_checkpoint + cópia)
 *    para a lista fechada de bancos de dados do usuário e 5 chaves portáteis de lembretes em
 *    settings_database (sem tokens de rede/sessão nem preferências de SDKs).
 *  - Restauração de ZIP, importação de CSV e rollback são preparados em no_backup/rimi_backup/
 *    e aplicados a frio em MyApplication.onCreate() antes do grafo Metro/Room3 abrir os bancos.
 *  - Após a sessão ficar ativa em UserSessionInitializer.initialize(), os lembretes são
 *    recalculados via RefreshRemindersUseCase.invokeAsync().
 */
@SuppressWarnings("unused")
public final class MyTherapyBackupHelper {

    private static final String TAG = "RimiMTBackup";
    private static final String EXPECTED_PACKAGE = "eu.smartpatient.mytherapy";
    private static final int BACKUP_FORMAT_VERSION = 1;

    private static final String DIR_ROOT = "rimi_backup";
    private static final String DIR_STAGING_ZIP = "staging_zip";
    private static final String DIR_STAGING_CSV = "staging_csv";
    private static final String DIR_ROLLBACK = "rollback";
    private static final String DIR_EXPORT_TMP = "export_tmp";

    private static final String FILE_PENDING_RESTORE = "pending_restore.json";
    private static final String FILE_PENDING_CSV = "pending_csv_import.json";
    private static final String FILE_PENDING_ROLLBACK = "pending_rollback.json";
    private static final String FILE_PENDING_REFRESH = "pending_refresh_reminders.flag";
    private static final String FILE_LAST_RESULT = "last_result.json";
    private static final String FILE_ROLLBACK_JOURNAL = "journal.json";
    private static final String FILE_STAGED_CSV = "import.csv";

    private static final String SETTINGS_DB_NAME = "settings_database";
    private static final String ACCOUNT_DB_NAME = "account_database";
    private static final String TREATMENT_DB_NAME = "mytherapy_database_new";

    private static final String CVR_PATH_EN =
        "composeResources/eu.smartpatient.mytherapy.multiplatform.lib.resource/values/strings.commonMain.cvr";
    private static final String CVR_PATH_PT =
        "composeResources/eu.smartpatient.mytherapy.multiplatform.lib.resource/values-pt/strings.commonMain.cvr";
    private static final String CVR_PATH_PT_BR =
        "composeResources/eu.smartpatient.mytherapy.multiplatform.lib.resource/values-pt-rBR/strings.commonMain.cvr";

    private static final String LAUNCHER_KEY_EXPORT_ZIP = "rimi_mt_export_zip";
    private static final String LAUNCHER_KEY_RESTORE_ZIP = "rimi_mt_restore_zip";
    private static final String LAUNCHER_KEY_IMPORT_CSV = "rimi_mt_import_csv";

    private static final long MAX_ZIP_BYTES = 200L * 1024L * 1024L;
    private static final long MAX_CSV_BYTES = 50L * 1024L * 1024L;
    private static final int MAX_ZIP_ENTRIES = 64;

    private static final class DbSpec {
        final String name;
        final boolean core;
        final int expectedVersion;
        final String expectedHash;

        DbSpec(String name, boolean core, int expectedVersion, String expectedHash) {
            this.name = name;
            this.core = core;
            this.expectedVersion = expectedVersion;
            this.expectedHash = expectedHash;
        }
    }

    private static final DbSpec[] USER_DATABASES = new DbSpec[] {
        new DbSpec(ACCOUNT_DB_NAME, true, 2, "2010f22bb3a41ef78ccd4a023f0096ff"),
        new DbSpec(TREATMENT_DB_NAME, true, 171, "7518b67a3c9d409f2ffc154fcc1ce258"),
        new DbSpec("daily_to_do_list_database", true, 1, "d996bc762d1698b48fa29fc98b187b29"),
        new DbSpec("progress_database", false, 2, "5cff3dc0233195d16f68d6e0a7bb3ff9"),
        new DbSpec("team_database_dec", false, 7, "6022a67a7b0c16d9b75d866b5ec6a277"),
        new DbSpec("content_database", false, 2, "80c6d6a6bceed5c22b87d690e06d713e"),
        new DbSpec("core_program_configuration_database", false, 2, "f042dd69e2b6e6e43dcf7c2d4b6e4a06"),
        new DbSpec("integration_management_database", false, 1, "c4fc264cbc1d3063ee97a419df49b733"),
        new DbSpec("partner_scheduler_database_dec", false, 38, "74786d3fffc5dfdda212e5ba00265968"),
        new DbSpec("medication_import_database_dec", false, 4, "9708f82e461da866f63ad28c33ae78c9"),
        new DbSpec("gamification_database", false, 8, "f7b062cfd7b5aba44a877fd0eda35a50"),
        new DbSpec("assistant_database_dec", false, 1, "b38782c02a90cb6fb18b9ea7ef49b733"),
    };

    private static final Map<String, DbSpec> USER_DB_MAP = new LinkedHashMap<>();
    static {
        for (DbSpec spec : USER_DATABASES) {
            USER_DB_MAP.put(spec.name, spec);
        }
    }

    private static final String[][] PORTABLE_REMINDER_SETTINGS = new String[][] {
        { "DAILY_TODO_LIST", "RECURRING_REMINDER_ENABLED" },
        { "DAILY_TODO_LIST", "RECURRING_REMINDER_FREQUENCY_MILLIS" },
        { "DAILY_TODO_LIST", "THERAPY_REMINDERS_AS_ALARMS" },
        { "DAILY_TODO_LIST", "ALERT_STYLE" },
        { "NOTIFICATIONS", "USE_ALARM_AUDIO_FOR_TREATMENT" },
    };

    private static final String[] SQLITE_SIDECARS = new String[] { "", "-wal", "-shm", "-journal" };

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final ExecutorService IO_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final AtomicBoolean BUSY = new AtomicBoolean(false);

    private static volatile Application appContext;
    private static volatile WeakReference<Activity> rootActivityRef = new WeakReference<>(null);
    private static volatile Object exportZipLauncher;
    private static volatile Object restoreZipLauncher;
    private static volatile Object importCsvLauncher;
    private static volatile Object refreshRemindersFactory;
    private static volatile boolean refreshTriggeredThisProcess = false;

    private static volatile long labelEnOffset = -1L;
    private static volatile long labelEnSize = -1L;
    private static volatile long labelPtOffset = -1L;
    private static volatile long labelPtSize = -1L;
    private static volatile long labelPtBrOffset = -1L;
    private static volatile long labelPtBrSize = -1L;

    // Reflexão em cache para BundledSQLiteDriver / SQLiteConnection / SQLiteStatement
    private static volatile Object sqliteDriverInstance;
    private static volatile Method driverOpenMethod;
    private static volatile Method connPrepareMethod;
    private static volatile Method connCloseMethod;
    private static volatile Method stmtBindLongMethod;
    private static volatile Method stmtBindDoubleMethod;
    private static volatile Method stmtBindTextMethod;
    private static volatile Method stmtBindNullMethod;
    private static volatile Method stmtStepMethod;
    private static volatile Method stmtGetLongMethod;
    private static volatile Method stmtGetDoubleMethod;
    private static volatile Method stmtGetTextMethod;
    private static volatile Method stmtIsNullMethod;
    private static volatile Method stmtCloseMethod;

    private MyTherapyBackupHelper() {}

    // =========================================================================
    // 1. Pontos de entrada chamados pelo bytecode injetado
    // =========================================================================

    /**
     * Chamado no início de {@code MyApplication.onCreate()} antes da criação do grafo Metro e
     * da abertura de qualquer RoomDatabase.
     *
     * @param app       instância da Application
     * @param labelSpec offsets/tamanhos embutidos no patch: "enOff:enLen,ptOff:ptLen,ptBrOff:ptBrLen"
     */
    public static void onApplicationCreate(Application app, String labelSpec) {
        appContext = app;
        parseLabelSpec(labelSpec);
        try {
            applyPendingColdOperations(app);
        } catch (Throwable t) {
            Log.e(TAG, "Cold startup backup hook failed", t);
        }
    }

    /**
     * Chamado em {@code GetSettingsItemsUseCase.<init>(Set)} para acrescentar o item nativo
     * "Backup e Restauração Local" / "Local Backup & Restore" na seção Geral das Configurações.
     */
    @SuppressWarnings("unchecked")
    public static Set<?> augmentSettingsProviders(Set<?> originalProviders) {
        if (originalProviders == null || labelEnSize <= 0L) {
            return originalProviders;
        }
        try {
            Object providerProxy = createSettingsProviderProxy(originalProviders);
            if (providerProxy == null) {
                return originalProviders;
            }
            LinkedHashSet<Object> augmented = new LinkedHashSet<>(originalProviders);
            augmented.add(providerProxy);
            return augmented;
        } catch (Throwable t) {
            Log.e(TAG, "Failed to inject settings provider", t);
            return originalProviders;
        }
    }

    /**
     * Chamado em {@code RootActivity.onCreate(Bundle)} logo após {@code super.onCreate(Bundle)}.
     * Registra os launchers do Storage Access Framework no {@code ActivityResultRegistry}.
     */
    public static void onRootActivityCreate(Activity activity) {
        if (activity == null) {
            return;
        }
        rootActivityRef = new WeakReference<>(activity);
        if (appContext == null) {
            Context ctx = activity.getApplicationContext();
            if (ctx instanceof Application) {
                appContext = (Application) ctx;
            }
        }
        try {
            registerSafLaunchers(activity);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to register SAF launchers", t);
        }

        MAIN_HANDLER.postDelayed(new Runnable() {
            @Override
            public void run() {
                showLastResultIfAny();
            }
        }, 700L);
    }

    /**
     * Chamado ao final de {@code RefreshRemindersUseCaseImpl$MetroFactory.<init>(...)} durante a
     * construção do grafo Metro para guardar a fábrica de {@code RefreshRemindersUseCase}.
     */
    public static void registerRefreshRemindersFactory(Object factory) {
        if (factory != null) {
            refreshRemindersFactory = factory;
        }
    }

    /**
     * Chamado em {@code UserSessionInitializer.initialize(Continuation)} após
     * {@code UserSession.onUserSessionStart} concluir com sucesso.
     */
    public static void onUserSessionStarted() {
        if (refreshTriggeredThisProcess) {
            return;
        }
        Context ctx = appContext;
        if (ctx == null) {
            return;
        }
        File flag = new File(getBackupRoot(ctx), FILE_PENDING_REFRESH);
        if (!flag.isFile()) {
            return;
        }
        Object factory = refreshRemindersFactory;
        if (factory == null) {
            Log.w(TAG, "RefreshReminders factory unavailable; keeping refresh flag");
            return;
        }
        refreshTriggeredThisProcess = true;
        try {
            Method invokeMethod = factory.getClass().getMethod("invoke");
            Object useCase = invokeMethod.invoke(factory);
            if (useCase != null) {
                Method invokeAsync = useCase.getClass().getMethod("invokeAsync");
                invokeAsync.invoke(useCase);
                //noinspection ResultOfMethodCallIgnored
                flag.delete();
                Log.i(TAG, "Triggered RefreshRemindersUseCase.invokeAsync() after session start");
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to invoke RefreshRemindersUseCase", t);
        }
    }

    // =========================================================================
    // 2. Integração com a tela de Configurações (SettingsItemProvider proxy)
    // =========================================================================

    private static void parseLabelSpec(String spec) {
        if (spec == null || spec.isEmpty()) {
            return;
        }
        try {
            String[] parts = spec.split(",");
            if (parts.length >= 3) {
                String[] en = parts[0].split(":");
                String[] pt = parts[1].split(":");
                String[] ptBr = parts[2].split(":");
                labelEnOffset = Long.parseLong(en[0]);
                labelEnSize = Long.parseLong(en[1]);
                labelPtOffset = Long.parseLong(pt[0]);
                labelPtSize = Long.parseLong(pt[1]);
                labelPtBrOffset = Long.parseLong(ptBr[0]);
                labelPtBrSize = Long.parseLong(ptBr[1]);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Invalid label spec", t);
        }
    }

    private static Object createSettingsProviderProxy(Set<?> existingProviders) throws Exception {
        ClassLoader cl = MyTherapyBackupHelper.class.getClassLoader();
        Class<?> providerIface = Class.forName(
            "eu.smartpatient.mytherapy.multiplatform.feature.settingssectionmanagement.api.SettingsItemProvider",
            false, cl
        );
        Class<?> sectionCls = Class.forName(
            "eu.smartpatient.mytherapy.multiplatform.feature.settingssectionmanagement.api.SettingsSection",
            false, cl
        );
        Class<?> orderIface = Class.forName(
            "eu.smartpatient.mytherapy.multiplatform.feature.settingssectionmanagement.api.SettingsItemOrder",
            false, cl
        );
        Class<?> itemCls = Class.forName(
            "eu.smartpatient.mytherapy.multiplatform.feature.settingssectionmanagement.api.SettingsItem",
            false, cl
        );
        Class<?> stringResCls = Class.forName("org.jetbrains.compose.resources.StringResource", false, cl);
        Class<?> drawableResCls = Class.forName("org.jetbrains.compose.resources.DrawableResource", false, cl);
        Class<?> fn2Iface = Class.forName("kotlin.jvm.functions.Function2", false, cl);
        Class<?> unitCls = Class.forName("kotlin.Unit", false, cl);

        Field generalField = sectionCls.getField("GENERAL");
        final Object generalSection = generalField.get(null);
        final Object kotlinUnit = unitCls.getField("INSTANCE").get(null);

        int maxOrder = 50;
        try {
            Method getSection = providerIface.getMethod("getSection");
            Method getItemOrder = providerIface.getMethod("getItemOrder");
            Method getOrder = orderIface.getMethod("getOrder");
            for (Object p : existingProviders) {
                if (p == null) continue;
                Object sec = getSection.invoke(p);
                if (generalSection.equals(sec)) {
                    Object ordObj = getItemOrder.invoke(p);
                    if (ordObj != null) {
                        Object val = getOrder.invoke(ordObj);
                        if (val instanceof Integer && ((Integer) val) > maxOrder) {
                            maxOrder = (Integer) val;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
            maxOrder = 98;
        }
        final int targetOrder = maxOrder + 1;

        final Object orderProxy = Proxy.newProxyInstance(
            cl,
            new Class<?>[] { orderIface },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    String name = method.getName();
                    if ("getOrder".equals(name)) {
                        return Integer.valueOf(targetOrder);
                    }
                    return handleObjectMethod(proxy, method, args, "RimiBackupItemOrder(" + targetOrder + ")");
                }
            }
        );

        final Object titleResource = buildStringResource(cl);
        final Object clickActionProxy = Proxy.newProxyInstance(
            cl,
            new Class<?>[] { fn2Iface },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    if ("invoke".equals(method.getName())) {
                        MAIN_HANDLER.post(new Runnable() {
                            @Override
                            public void run() {
                                openBackupMenu();
                            }
                        });
                        return kotlinUnit;
                    }
                    return handleObjectMethod(proxy, method, args, "RimiBackupClickAction");
                }
            }
        );

        Constructor<?> itemCtor = itemCls.getConstructor(
            stringResCls, fn2Iface, drawableResCls, String.class
        );
        final Object settingsItem = itemCtor.newInstance(
            titleResource, clickActionProxy, null, "rimiLocalBackup"
        );

        return Proxy.newProxyInstance(
            cl,
            new Class<?>[] { providerIface },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    String name = method.getName();
                    if ("isAvailable".equals(name)) {
                        return Boolean.TRUE;
                    }
                    if ("getSection".equals(name)) {
                        return generalSection;
                    }
                    if ("getItemOrder".equals(name)) {
                        return orderProxy;
                    }
                    if ("getItem".equals(name)) {
                        return settingsItem;
                    }
                    return handleObjectMethod(proxy, method, args, "RimiBackupSettingsItemProvider");
                }
            }
        );
    }

    private static Object buildStringResource(ClassLoader cl) throws Exception {
        Class<?> stringResCls = Class.forName("org.jetbrains.compose.resources.StringResource", false, cl);
        Class<?> itemCls = Class.forName("org.jetbrains.compose.resources.ResourceItem", false, cl);
        Class<?> langQualCls = Class.forName("org.jetbrains.compose.resources.LanguageQualifier", false, cl);
        Class<?> regQualCls = Class.forName("org.jetbrains.compose.resources.RegionQualifier", false, cl);

        Constructor<?> itemCtor = itemCls.getConstructor(Set.class, String.class, long.class, long.class);
        Constructor<?> langCtor = langQualCls.getConstructor(String.class);
        Constructor<?> regCtor = regQualCls.getConstructor(String.class);

        Set<Object> items = new LinkedHashSet<>();

        if (labelPtBrOffset >= 0L && labelPtBrSize > 0L) {
            Set<Object> qualsPtBr = new LinkedHashSet<>();
            qualsPtBr.add(langCtor.newInstance("pt"));
            qualsPtBr.add(regCtor.newInstance("BR"));
            items.add(itemCtor.newInstance(qualsPtBr, CVR_PATH_PT_BR, labelPtBrOffset, labelPtBrSize));
        }

        if (labelPtOffset >= 0L && labelPtSize > 0L) {
            Set<Object> qualsPt = Collections.singleton(langCtor.newInstance("pt"));
            items.add(itemCtor.newInstance(qualsPt, CVR_PATH_PT, labelPtOffset, labelPtSize));
        }

        items.add(itemCtor.newInstance(Collections.emptySet(), CVR_PATH_EN, labelEnOffset, labelEnSize));

        Constructor<?> resCtor = stringResCls.getConstructor(String.class, String.class, Set.class);
        return resCtor.newInstance("string:rimi_local_backup", "rimi_local_backup", items);
    }

    private static Object handleObjectMethod(Object proxy, Method method, Object[] args, String label) {
        String name = method.getName();
        if ("hashCode".equals(name)) {
            return System.identityHashCode(proxy);
        }
        if ("equals".equals(name)) {
            return args != null && args.length == 1 && proxy == args[0];
        }
        if ("toString".equals(name)) {
            return label;
        }
        return null;
    }

    // =========================================================================
    // 3. Registro de ActivityResultLauncher (Storage Access Framework)
    // =========================================================================

    private static void registerSafLaunchers(Activity activity) throws Exception {
        ClassLoader cl = activity.getClass().getClassLoader();
        Method getRegistry = activity.getClass().getMethod("getActivityResultRegistry");
        Object registry = getRegistry.invoke(activity);
        if (registry == null) {
            return;
        }

        Class<?> lifecycleOwnerCls = Class.forName("androidx.lifecycle.LifecycleOwner", false, cl);
        Class<?> contractCls = Class.forName("androidx.activity.result.contract.ActivityResultContract", false, cl);
        Class<?> startForResultCls = Class.forName(
            "androidx.activity.result.contract.ActivityResultContracts$StartActivityForResult", false, cl
        );
        Class<?> callbackCls = Class.forName("androidx.activity.result.ActivityResultCallback", false, cl);
        Method registerMethod = registry.getClass().getMethod(
            "register", String.class, lifecycleOwnerCls, contractCls, callbackCls
        );

        exportZipLauncher = registerMethod.invoke(
            registry,
            LAUNCHER_KEY_EXPORT_ZIP,
            activity,
            startForResultCls.getConstructor().newInstance(),
            createActivityResultCallback(cl, 1)
        );
        restoreZipLauncher = registerMethod.invoke(
            registry,
            LAUNCHER_KEY_RESTORE_ZIP,
            activity,
            startForResultCls.getConstructor().newInstance(),
            createActivityResultCallback(cl, 2)
        );
        importCsvLauncher = registerMethod.invoke(
            registry,
            LAUNCHER_KEY_IMPORT_CSV,
            activity,
            startForResultCls.getConstructor().newInstance(),
            createActivityResultCallback(cl, 3)
        );
    }

    private static Object createActivityResultCallback(ClassLoader cl, final int mode) throws Exception {
        Class<?> callbackCls = Class.forName("androidx.activity.result.ActivityResultCallback", false, cl);
        return Proxy.newProxyInstance(
            cl,
            new Class<?>[] { callbackCls },
            new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) {
                    if ("onActivityResult".equals(method.getName()) && args != null && args.length == 1 && args[0] != null) {
                        handleSafActivityResult(mode, args[0]);
                        return null;
                    }
                    return handleObjectMethod(proxy, method, args, "RimiSafCallback(" + mode + ")");
                }
            }
        );
    }

    private static void handleSafActivityResult(int mode, Object activityResult) {
        try {
            int resultCode = (Integer) activityResult.getClass().getMethod("getResultCode").invoke(activityResult);
            Intent data = (Intent) activityResult.getClass().getMethod("getData").invoke(activityResult);
            if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
                return;
            }
            final Uri uri = data.getData();
            final Activity activity = rootActivityRef.get();
            if (activity == null || activity.isFinishing()) {
                return;
            }
            if (mode == 1) {
                startExportZip(activity, uri);
            } else if (mode == 2) {
                startInspectRestoreZip(activity, uri);
            } else if (mode == 3) {
                startInspectImportCsv(activity, uri);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error handling SAF result", t);
            toastOnMain(t(
                "Erro ao abrir o arquivo selecionado.",
                "Failed to open the selected file."
            ));
        }
    }

    private static void launchSaf(Object launcher, Intent intent) {
        if (launcher == null) {
            toastOnMain(t(
                "Seletor de arquivos indisponível. Reabra o app e tente novamente.",
                "File picker unavailable. Reopen the app and try again."
            ));
            return;
        }
        try {
            Method launchMethod = launcher.getClass().getMethod("launch", Object.class);
            launchMethod.invoke(launcher, intent);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to launch SAF picker", t);
            toastOnMain(t(
                "Não foi possível abrir o seletor de arquivos.",
                "Could not open the system file picker."
            ));
        }
    }

    // =========================================================================
    // 4. Interface do usuário (Menu de Backup, Restauração, CSV e Rollback)
    // =========================================================================

    private static void openBackupMenu() {
        final Activity activity = rootActivityRef.get();
        if (activity == null || activity.isFinishing()) {
            return;
        }
        if (BUSY.get()) {
            toastOnMain(t(
                "Aguarde a operação atual terminar.",
                "Please wait for the current operation to finish."
            ));
            return;
        }

        final boolean hasRollback = hasAvailableRollback(activity);
        List<MenuOption> options = new ArrayList<>();
        options.add(new MenuOption(
            t("Exportar backup local (.zip)", "Export local backup (.zip)"),
            t("Salva tratamentos, histórico, metas e lembretes", "Saves treatments, history, goals, and reminders"),
            false,
            new Runnable() {
                @Override
                public void run() {
                    promptExportZip();
                }
            }
        ));
        options.add(new MenuOption(
            t("Restaurar backup local (.zip)", "Restore local backup (.zip)"),
            t("Restaura um arquivo .zip gerado por este patch", "Restores a .zip archive created by this patch"),
            false,
            new Runnable() {
                @Override
                public void run() {
                    promptRestoreZip();
                }
            }
        ));
        options.add(new MenuOption(
            t("Importar histórico CSV (MyTherapy Archive)", "Import CSV history (MyTherapy Archive)"),
            t("Importa o arquivo oficial .csv ou .zip exportado do app", "Imports the official .csv or .zip exported from the app"),
            false,
            new Runnable() {
                @Override
                public void run() {
                    promptImportCsv();
                }
            }
        ));
        if (hasRollback) {
            options.add(new MenuOption(
                t("Reverter última restauração / importação", "Revert last restore / import"),
                t("Desfaz a última operação e volta os bancos anteriores", "Undoes the last operation and restores previous databases"),
                true,
                new Runnable() {
                    @Override
                    public void run() {
                        confirmRollback(activity);
                    }
                }
            ));
        }

        showStyledMenuDialog(
            activity,
            t("Backup e Restauração Local", "Local Backup & Restore"),
            options,
            t("Fechar", "Close")
        );
    }

    private static void promptExportZip() {
        String stamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date());
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/zip");
        intent.putExtra(Intent.EXTRA_TITLE, "mytherapy-backup-" + stamp + ".zip");
        launchSaf(exportZipLauncher, intent);
    }

    private static void promptRestoreZip() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[] {
            "application/zip",
            "application/x-zip-compressed",
            "application/octet-stream"
        });
        launchSaf(restoreZipLauncher, intent);
    }

    private static void promptImportCsv() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[] {
            "text/csv",
            "text/comma-separated-values",
            "text/plain",
            "application/csv",
            "application/zip",
            "application/octet-stream"
        });
        launchSaf(importCsvLauncher, intent);
    }

    private static void showLastResultIfAny() {
        Activity activity = rootActivityRef.get();
        if (activity == null || activity.isFinishing()) {
            return;
        }
        File resultFile = new File(getBackupRoot(activity), FILE_LAST_RESULT);
        if (!resultFile.isFile()) {
            return;
        }
        try {
            String raw = readTextFile(resultFile);
            //noinspection ResultOfMethodCallIgnored
            resultFile.delete();
            JSONObject obj = new JSONObject(raw);
            String title = obj.optString("title", t("Backup Local", "Local Backup"));
            String message = obj.optString("message", "");
            if (!message.isEmpty()) {
                showStyledAlertDialog(activity, title, message, "OK", null, null, null);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to display last result", t);
            //noinspection ResultOfMethodCallIgnored
            resultFile.delete();
        }
    }

    // =========================================================================
    // 5. Exportação de Backup Local (.zip)
    // =========================================================================

    private static void startExportZip(final Activity activity, final Uri targetUri) {
        if (!BUSY.compareAndSet(false, true)) {
            toastOnMain(t("Operação já em andamento.", "An operation is already running."));
            return;
        }
        toastOnMain(t("Gerando backup local...", "Creating local backup..."));
        final Context ctx = activity.getApplicationContext();

        IO_EXECUTOR.execute(new Runnable() {
            @Override
            public void run() {
                File tmpDir = new File(getBackupRoot(ctx), DIR_EXPORT_TMP);
                try {
                    deleteRecursively(tmpDir);
                    ensureDir(tmpDir);

                    File treatmentDb = ctx.getDatabasePath(TREATMENT_DB_NAME);
                    if (!treatmentDb.isFile()) {
                        throw new IOException(t(
                            "Banco de tratamentos ainda não existe. Conclua a inicialização do app primeiro.",
                            "Treatment database does not exist yet. Complete app initialization first."
                        ));
                    }

                    File dbStageDir = new File(tmpDir, "dbs");
                    ensureDir(dbStageDir);

                    JSONArray dbManifestEntries = new JSONArray();
                    List<File> stagedDbFiles = new ArrayList<>();
                    Long profileId = null;

                    for (DbSpec spec : USER_DATABASES) {
                        File srcDb = ctx.getDatabasePath(spec.name);
                        if (!srcDb.isFile()) {
                            continue;
                        }
                        File snapshotFile = new File(dbStageDir, spec.name);
                        snapshotSqliteDatabase(srcDb, snapshotFile);

                        SqliteMeta meta = inspectSqliteDatabase(snapshotFile);
                        if (!meta.integrityOk) {
                            throw new IOException("PRAGMA quick_check failed for " + spec.name);
                        }
                        if (ACCOUNT_DB_NAME.equals(spec.name)) {
                            profileId = queryUserProfileId(snapshotFile);
                        }

                        String sha256 = sha256Hex(snapshotFile);
                        JSONObject entryObj = new JSONObject();
                        entryObj.put("name", spec.name);
                        entryObj.put("path", "dbs/" + spec.name);
                        entryObj.put("core", spec.core);
                        entryObj.put("size", snapshotFile.length());
                        entryObj.put("sha256", sha256);
                        entryObj.put("userVersion", meta.userVersion);
                        entryObj.put("identityHash", meta.identityHash != null ? meta.identityHash : JSONObject.NULL);
                        dbManifestEntries.put(entryObj);
                        stagedDbFiles.add(snapshotFile);
                    }

                    if (stagedDbFiles.isEmpty()) {
                        throw new IOException(t(
                            "Nenhum banco de dados do usuário foi encontrado.",
                            "No user databases were found."
                        ));
                    }

                    JSONArray reminderSettings = extractPortableReminderSettings(ctx);
                    byte[] settingsBytes = new JSONObject()
                        .put("version", 1)
                        .put("entries", reminderSettings)
                        .toString(2)
                        .getBytes(StandardCharsets.UTF_8);

                    JSONObject manifest = new JSONObject();
                    manifest.put("formatVersion", BACKUP_FORMAT_VERSION);
                    manifest.put("createdAtUtc", nowUtcString());
                    manifest.put("packageName", ctx.getPackageName());
                    manifest.put("versionName", getVersionName(ctx));
                    manifest.put("versionCode", getVersionCode(ctx));
                    manifest.put("userProfileId", profileId != null ? profileId.longValue() : JSONObject.NULL);
                    manifest.put("settingsSha256", sha256Hex(settingsBytes));
                    manifest.put("settingsCount", reminderSettings.length());
                    manifest.put("databases", dbManifestEntries);
                    byte[] manifestBytes = manifest.toString(2).getBytes(StandardCharsets.UTF_8);

                    File tempZip = new File(tmpDir, "backup.zip");
                    try (ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(tempZip)))) {
                        writeZipBytes(zos, "manifest.json", manifestBytes);
                        writeZipBytes(zos, "settings/local-reminders.json", settingsBytes);
                        for (File dbFile : stagedDbFiles) {
                            writeZipFile(zos, "dbs/" + dbFile.getName(), dbFile);
                        }
                    }

                    try (InputStream in = new BufferedInputStream(new FileInputStream(tempZip));
                         OutputStream out = ctx.getContentResolver().openOutputStream(targetUri, "w")) {
                        if (out == null) {
                            throw new IOException("ContentResolver returned null OutputStream");
                        }
                        copyStream(in, out);
                        out.flush();
                    }

                    final int dbCount = stagedDbFiles.size();
                    final int settingsCount = reminderSettings.length();
                    final long zipKb = Math.max(1L, tempZip.length() / 1024L);
                    showInfoDialogOnMain(
                        t("Backup exportado", "Backup exported"),
                        t(
                            "Backup salvo com sucesso!\n\n"
                                + "• Bancos incluídos: " + dbCount + "\n"
                                + "• Preferências de lembrete: " + settingsCount + "\n"
                                + "• Tamanho: " + zipKb + " KB\n\n"
                                + "Tokens de login, SDKs e dados do SmartPilot (SQLCipher) não foram incluídos.",
                            "Backup saved successfully!\n\n"
                                + "• Databases included: " + dbCount + "\n"
                                + "• Reminder preferences: " + settingsCount + "\n"
                                + "• Size: " + zipKb + " KB\n\n"
                                + "Login tokens, SDK data, and SmartPilot (SQLCipher) were excluded."
                        )
                    );
                } catch (Throwable t) {
                    Log.e(TAG, "Backup export failed", t);
                    showInfoDialogOnMain(
                        t("Falha ao exportar backup", "Backup export failed"),
                        t(
                            "Não foi possível gerar o backup local:\n" + safeErrorMessage(t),
                            "Could not create the local backup:\n" + safeErrorMessage(t)
                        )
                    );
                } finally {
                    deleteRecursively(tmpDir);
                    BUSY.set(false);
                }
            }
        });
    }

    // =========================================================================
    // 6. Inspeção e Staging de Restauração (.zip)
    // =========================================================================

    private static final class StagedRestorePreview {
        int dbCount;
        int settingsCount;
        String createdAtUtc;
        String backupVersion;
        Long backupProfileId;
        Long currentProfileId;
        boolean profileMismatch;
        List<String> dbNames = new ArrayList<>();
    }

    private static void startInspectRestoreZip(final Activity activity, final Uri sourceUri) {
        if (!BUSY.compareAndSet(false, true)) {
            toastOnMain(t("Operação já em andamento.", "An operation is already running."));
            return;
        }
        toastOnMain(t("Validando arquivo de backup...", "Validating backup file..."));
        final Context ctx = activity.getApplicationContext();

        IO_EXECUTOR.execute(new Runnable() {
            @Override
            public void run() {
                File stageDir = new File(getBackupRoot(ctx), DIR_STAGING_ZIP);
                try {
                    deleteRecursively(stageDir);
                    ensureDir(stageDir);

                    File rawZip = new File(stageDir, "incoming.zip");
                    copyUriToFile(ctx, sourceUri, rawZip, MAX_ZIP_BYTES);

                    extractAndValidateBackupZip(rawZip, stageDir);
                    //noinspection ResultOfMethodCallIgnored
                    rawZip.delete();

                    File manifestFile = new File(stageDir, "manifest.json");
                    JSONObject manifest = new JSONObject(readTextFile(manifestFile));

                    if (manifest.optInt("formatVersion", -1) != BACKUP_FORMAT_VERSION) {
                        throw new IOException(t(
                            "Versão do formato de backup incompatível.",
                            "Unsupported backup format version."
                        ));
                    }
                    String pkg = manifest.optString("packageName", "");
                    if (!EXPECTED_PACKAGE.equals(pkg)) {
                        throw new IOException(t(
                            "Este arquivo não pertence ao MyTherapy (" + pkg + ").",
                            "This backup does not belong to MyTherapy (" + pkg + ")."
                        ));
                    }

                    File settingsFile = new File(stageDir, "settings/local-reminders.json");
                    String expectedSettingsHash = manifest.optString("settingsSha256", "");
                    int settingsCount = 0;
                    if (settingsFile.isFile()) {
                        if (!expectedSettingsHash.isEmpty()) {
                            String actualHash = sha256Hex(settingsFile);
                            if (!expectedSettingsHash.equalsIgnoreCase(actualHash)) {
                                throw new IOException("SHA-256 mismatch for local-reminders.json");
                            }
                        }
                        JSONObject settingsJson = new JSONObject(readTextFile(settingsFile));
                        JSONArray arr = settingsJson.optJSONArray("entries");
                        settingsCount = arr != null ? arr.length() : 0;
                    }

                    JSONArray dbs = manifest.optJSONArray("databases");
                    if (dbs == null || dbs.length() == 0) {
                        throw new IOException(t(
                            "O backup não contém bancos de dados válidos.",
                            "Backup archive contains no valid databases."
                        ));
                    }

                    StagedRestorePreview preview = new StagedRestorePreview();
                    preview.createdAtUtc = manifest.optString("createdAtUtc", "?");
                    preview.backupVersion = manifest.optString("versionName", "?");
                    preview.settingsCount = settingsCount;

                    boolean hasTreatmentDb = false;
                    for (int i = 0; i < dbs.length(); i++) {
                        JSONObject entry = dbs.getJSONObject(i);
                        String dbName = entry.getString("name");
                        DbSpec spec = USER_DB_MAP.get(dbName);
                        if (spec == null) {
                            throw new IOException("Disallowed database in manifest: " + dbName);
                        }
                        File stagedDb = new File(stageDir, "dbs/" + dbName);
                        if (!stagedDb.isFile()) {
                            throw new IOException("Missing database file in archive: " + dbName);
                        }

                        String expectedSha = entry.optString("sha256", "");
                        if (expectedSha.isEmpty() || !expectedSha.equalsIgnoreCase(sha256Hex(stagedDb))) {
                            throw new IOException("SHA-256 checksum mismatch for " + dbName);
                        }

                        SqliteMeta meta = inspectSqliteDatabase(stagedDb);
                        if (!meta.integrityOk) {
                            throw new IOException("SQLite integrity check failed for " + dbName);
                        }
                        if (meta.userVersion != spec.expectedVersion) {
                            throw new IOException(
                                "Schema version mismatch for " + dbName
                                    + " (backup=" + meta.userVersion + ", app=" + spec.expectedVersion + ")"
                            );
                        }
                        if (spec.expectedHash != null && meta.identityHash != null
                            && !spec.expectedHash.equals(meta.identityHash)) {
                            throw new IOException("Room identity_hash mismatch for " + dbName);
                        }

                        if (TREATMENT_DB_NAME.equals(dbName)) {
                            hasTreatmentDb = true;
                        }
                        if (ACCOUNT_DB_NAME.equals(dbName)) {
                            preview.backupProfileId = queryUserProfileId(stagedDb);
                        }
                        preview.dbNames.add(dbName);
                    }

                    if (!hasTreatmentDb) {
                        throw new IOException(t(
                            "Backup incompleto: banco principal de tratamentos ausente.",
                            "Incomplete backup: treatment database is missing."
                        ));
                    }

                    preview.dbCount = preview.dbNames.size();
                    File currentAccountDb = ctx.getDatabasePath(ACCOUNT_DB_NAME);
                    if (currentAccountDb.isFile()) {
                        preview.currentProfileId = queryUserProfileId(currentAccountDb);
                    }
                    preview.profileMismatch =
                        preview.backupProfileId != null
                            && preview.currentProfileId != null
                            && !preview.backupProfileId.equals(preview.currentProfileId);

                    BUSY.set(false);
                    showRestoreConfirmationOnMain(preview);
                } catch (Throwable t) {
                    Log.e(TAG, "Backup validation failed", t);
                    deleteRecursively(stageDir);
                    BUSY.set(false);
                    showInfoDialogOnMain(
                        t("Backup inválido", "Invalid backup"),
                        t(
                            "A validação falhou e nenhum dado foi alterado:\n" + safeErrorMessage(t),
                            "Validation failed and no data was modified:\n" + safeErrorMessage(t)
                        )
                    );
                }
            }
        });
    }

    private static void showRestoreConfirmationOnMain(final StagedRestorePreview preview) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                final Activity activity = rootActivityRef.get();
                if (activity == null || activity.isFinishing()) {
                    return;
                }
                StringBuilder msg = new StringBuilder();
                msg.append(t("Backup validado com sucesso!", "Backup verified successfully!")).append("\n\n");
                msg.append(t("• Data (UTC): ", "• Date (UTC): ")).append(preview.createdAtUtc).append("\n");
                msg.append(t("• Versão do app: ", "• App version: ")).append(preview.backupVersion).append("\n");
                msg.append(t("• Bancos prontos: ", "• Databases ready: ")).append(preview.dbCount).append("\n");
                msg.append(t("• Preferências de lembrete: ", "• Reminder preferences: ")).append(preview.settingsCount).append("\n\n");

                if (preview.profileMismatch) {
                    msg.append(t(
                        "ATENÇÃO: O perfil deste backup é diferente da sessão atual. "
                            + "Para manter seu login ativo neste aparelho, o perfil de conta atual "
                            + "(account_database) será preservado enquanto os tratamentos, histórico "
                            + "e demais bancos são restaurados.\n\n",
                        "NOTE: This backup comes from a different profile than your current session. "
                            + "To keep your current session valid on this device, account_database will "
                            + "be preserved while treatments, history, and other databases are restored.\n\n"
                    ));
                }

                msg.append(t(
                    "Um ponto de reversão automático será salvo antes da troca e o app será reiniciado.",
                    "An automatic rollback snapshot will be saved before applying and the app will restart."
                ));

                showStyledAlertDialog(
                    activity,
                    t("Confirmar restauração", "Confirm restore"),
                    msg.toString(),
                    t("Restaurar e reiniciar", "Restore & restart"),
                    new Runnable() {
                        @Override
                        public void run() {
                            scheduleColdZipRestoreAndRestart(activity, preview);
                        }
                    },
                    t("Cancelar", "Cancel"),
                    new Runnable() {
                        @Override
                        public void run() {
                            deleteRecursively(new File(getBackupRoot(activity), DIR_STAGING_ZIP));
                        }
                    }
                );
            }
        });
    }

    private static void scheduleColdZipRestoreAndRestart(Activity activity, StagedRestorePreview preview) {
        try {
            Context ctx = activity.getApplicationContext();
            JSONObject pending = new JSONObject();
            pending.put("createdAtUtc", nowUtcString());
            pending.put("preserveDestinationAccount", preview.profileMismatch);
            JSONArray names = new JSONArray();
            for (String n : preview.dbNames) {
                names.put(n);
            }
            pending.put("databases", names);

            File root = getBackupRoot(ctx);
            ensureDir(root);
            // Remove outras pendências conflitantes
            //noinspection ResultOfMethodCallIgnored
            new File(root, FILE_PENDING_CSV).delete();
            //noinspection ResultOfMethodCallIgnored
            new File(root, FILE_PENDING_ROLLBACK).delete();

            writeTextFileAtomic(new File(root, FILE_PENDING_RESTORE), pending.toString(2));
            restartApp(activity);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to schedule cold restore", t);
            showInfoDialogOnMain(
                t("Erro ao agendar restauração", "Failed to schedule restore"),
                safeErrorMessage(t)
            );
        }
    }

    // =========================================================================
    // 7. Inspeção e Staging de Importação CSV Oficial (MyTherapy Archive.csv)
    // =========================================================================

    private static final class CsvRecord {
        String actualDate;
        String scheduledDate;
        String typeRaw;
        int eventType;
        String name;
        Double value;
        String unit;
        int status;
        String note;
    }

    private static final class CsvPreview {
        int totalRows;
        int uniqueItems;
        String firstDate;
        String lastDate;
    }

    private static void startInspectImportCsv(final Activity activity, final Uri sourceUri) {
        if (!BUSY.compareAndSet(false, true)) {
            toastOnMain(t("Operação já em andamento.", "An operation is already running."));
            return;
        }
        toastOnMain(t("Analisando arquivo CSV...", "Analyzing CSV archive..."));
        final Context ctx = activity.getApplicationContext();

        IO_EXECUTOR.execute(new Runnable() {
            @Override
            public void run() {
                File stageDir = new File(getBackupRoot(ctx), DIR_STAGING_CSV);
                try {
                    deleteRecursively(stageDir);
                    ensureDir(stageDir);

                    File treatmentDb = ctx.getDatabasePath(TREATMENT_DB_NAME);
                    if (!treatmentDb.isFile()) {
                        throw new IOException(t(
                            "Banco de tratamentos ainda não foi inicializado. Abra a tela inicial primeiro.",
                            "Treatment database is not initialized yet. Open the home screen first."
                        ));
                    }

                    File rawInput = new File(stageDir, "incoming.bin");
                    copyUriToFile(ctx, sourceUri, rawInput, MAX_CSV_BYTES);

                    File stagedCsv = new File(stageDir, FILE_STAGED_CSV);
                    if (isZipFile(rawInput)) {
                        extractCsvFromArchiveZip(rawInput, stagedCsv);
                        //noinspection ResultOfMethodCallIgnored
                        rawInput.delete();
                    } else {
                        if (!rawInput.renameTo(stagedCsv)) {
                            copyFile(rawInput, stagedCsv);
                            //noinspection ResultOfMethodCallIgnored
                            rawInput.delete();
                        }
                    }

                    List<CsvRecord> records = parseMyTherapyArchiveCsv(stagedCsv);
                    if (records.isEmpty()) {
                        throw new IOException(t(
                            "O CSV não contém registros válidos para importar.",
                            "The CSV contains no valid records to import."
                        ));
                    }

                    CsvPreview preview = new CsvPreview();
                    preview.totalRows = records.size();
                    Set<String> items = new HashSet<>();
                    String minDate = null;
                    String maxDate = null;
                    for (CsvRecord r : records) {
                        items.add(r.eventType + "|" + r.name.toLowerCase(Locale.ROOT));
                        if (minDate == null || r.actualDate.compareTo(minDate) < 0) {
                            minDate = r.actualDate;
                        }
                        if (maxDate == null || r.actualDate.compareTo(maxDate) > 0) {
                            maxDate = r.actualDate;
                        }
                    }
                    preview.uniqueItems = items.size();
                    preview.firstDate = minDate != null && minDate.length() >= 10 ? minDate.substring(0, 10) : "?";
                    preview.lastDate = maxDate != null && maxDate.length() >= 10 ? maxDate.substring(0, 10) : "?";

                    BUSY.set(false);
                    showCsvConfirmationOnMain(preview);
                } catch (Throwable t) {
                    Log.e(TAG, "CSV validation failed", t);
                    deleteRecursively(stageDir);
                    BUSY.set(false);
                    showInfoDialogOnMain(
                        t("CSV inválido", "Invalid CSV"),
                        t(
                            "Não foi possível ler o arquivo MyTherapy Archive:\n" + safeErrorMessage(t),
                            "Could not read the MyTherapy Archive file:\n" + safeErrorMessage(t)
                        )
                    );
                }
            }
        });
    }

    private static void showCsvConfirmationOnMain(final CsvPreview preview) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                final Activity activity = rootActivityRef.get();
                if (activity == null || activity.isFinishing()) {
                    return;
                }
                String msg = t(
                    "Arquivo MyTherapy Archive validado!\n\n"
                        + "• Registros encontrados: " + preview.totalRows + "\n"
                        + "• Itens/medicamentos distintos: " + preview.uniqueItems + "\n"
                        + "• Período: " + preview.firstDate + " até " + preview.lastDate + "\n\n"
                        + "Registros já existentes na mesma data/hora serão ignorados (sem duplicar). "
                        + "Se o item já existir no app, o histórico será vinculado a ele automaticamente.\n\n"
                        + "Um ponto de reversão será salvo antes da importação e o app será reiniciado.",
                    "MyTherapy Archive verified!\n\n"
                        + "• Records found: " + preview.totalRows + "\n"
                        + "• Distinct items/medications: " + preview.uniqueItems + "\n"
                        + "• Date range: " + preview.firstDate + " to " + preview.lastDate + "\n\n"
                        + "Entries already logged at the same timestamp will be skipped (no duplicates). "
                        + "If an item already exists in the app, history will be linked to it automatically.\n\n"
                        + "A rollback snapshot will be saved before importing and the app will restart."
                );
                showStyledAlertDialog(
                    activity,
                    t("Importar histórico CSV", "Import CSV history"),
                    msg,
                    t("Importar e reiniciar", "Import & restart"),
                    new Runnable() {
                        @Override
                        public void run() {
                            scheduleColdCsvImportAndRestart(activity);
                        }
                    },
                    t("Cancelar", "Cancel"),
                    new Runnable() {
                        @Override
                        public void run() {
                            deleteRecursively(new File(getBackupRoot(activity), DIR_STAGING_CSV));
                        }
                    }
                );
            }
        });
    }

    private static void scheduleColdCsvImportAndRestart(Activity activity) {
        try {
            Context ctx = activity.getApplicationContext();
            JSONObject pending = new JSONObject();
            pending.put("createdAtUtc", nowUtcString());
            pending.put("csvFile", FILE_STAGED_CSV);

            File root = getBackupRoot(ctx);
            ensureDir(root);
            //noinspection ResultOfMethodCallIgnored
            new File(root, FILE_PENDING_RESTORE).delete();
            //noinspection ResultOfMethodCallIgnored
            new File(root, FILE_PENDING_ROLLBACK).delete();

            writeTextFileAtomic(new File(root, FILE_PENDING_CSV), pending.toString(2));
            restartApp(activity);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to schedule CSV import", t);
            showInfoDialogOnMain(
                t("Erro ao agendar importação", "Failed to schedule import"),
                safeErrorMessage(t)
            );
        }
    }

    // =========================================================================
    // 8. Rollback Manual (Menu)
    // =========================================================================

    private static boolean hasAvailableRollback(Context ctx) {
        File rollbackDir = new File(getBackupRoot(ctx), DIR_ROLLBACK);
        File journal = new File(rollbackDir, FILE_ROLLBACK_JOURNAL);
        return journal.isFile();
    }

    private static void confirmRollback(final Activity activity) {
        showStyledAlertDialog(
            activity,
            t("Reverter última alteração", "Revert last change"),
            t(
                "Isso restaurará os bancos exatamente como estavam antes da última restauração "
                    + "ou importação de CSV e reiniciará o app.",
                "This will restore your databases to their exact state before the last restore "
                    + "or CSV import and restart the app."
            ),
            t("Reverter e reiniciar", "Revert & restart"),
            new Runnable() {
                @Override
                public void run() {
                    try {
                        File root = getBackupRoot(activity);
                        ensureDir(root);
                        JSONObject pending = new JSONObject();
                        pending.put("createdAtUtc", nowUtcString());
                        writeTextFileAtomic(new File(root, FILE_PENDING_ROLLBACK), pending.toString(2));
                        restartApp(activity);
                    } catch (Throwable t) {
                        Log.e(TAG, "Failed to schedule rollback", t);
                        showInfoDialogOnMain(t("Erro", "Error"), safeErrorMessage(t));
                    }
                }
            },
            t("Cancelar", "Cancel"),
            null
        );
    }

    // =========================================================================
    // 9. Execução a frio em MyApplication.onCreate() (Antes do Room3 abrir)
    // =========================================================================

    private static void applyPendingColdOperations(Application app) {
        File root = getBackupRoot(app);
        File pendingRollback = new File(root, FILE_PENDING_ROLLBACK);
        if (pendingRollback.isFile()) {
            applyColdRollback(app, root, pendingRollback);
            return;
        }
        File pendingRestore = new File(root, FILE_PENDING_RESTORE);
        if (pendingRestore.isFile()) {
            applyColdZipRestore(app, root, pendingRestore);
            return;
        }
        File pendingCsv = new File(root, FILE_PENDING_CSV);
        if (pendingCsv.isFile()) {
            applyColdCsvImport(app, root, pendingCsv);
        }
    }

    private static void applyColdZipRestore(Application app, File root, File pendingFile) {
        File stageDir = new File(root, DIR_STAGING_ZIP);
        File rollbackDir = new File(root, DIR_ROLLBACK);
        List<String> targetDbs = new ArrayList<>();
        try {
            JSONObject pending = new JSONObject(readTextFile(pendingFile));
            boolean preserveAccount = pending.optBoolean("preserveDestinationAccount", false);
            JSONArray arr = pending.getJSONArray("databases");
            for (int i = 0; i < arr.length(); i++) {
                String name = arr.getString(i);
                if (!USER_DB_MAP.containsKey(name)) {
                    throw new IOException("Disallowed database in pending restore: " + name);
                }
                if (preserveAccount && ACCOUNT_DB_NAME.equals(name)) {
                    continue;
                }
                File staged = new File(stageDir, "dbs/" + name);
                if (!staged.isFile()) {
                    throw new IOException("Missing staged database: " + name);
                }
                targetDbs.add(name);
            }

            if (targetDbs.isEmpty()) {
                throw new IOException("No databases scheduled for swap");
            }

            // 1. Cria snapshot de rollback dos bancos alvo (+ settings_database)
            List<String> rollbackList = new ArrayList<>(targetDbs);
            if (!rollbackList.contains(SETTINGS_DB_NAME) && app.getDatabasePath(SETTINGS_DB_NAME).isFile()) {
                rollbackList.add(SETTINGS_DB_NAME);
            }
            createRollbackSnapshot(app, rollbackDir, rollbackList, "zip_restore");

            // 2. Troca limpa de cada banco (remove -wal, -shm, -journal antigos)
            int swapped = 0;
            for (String dbName : targetDbs) {
                File staged = new File(stageDir, "dbs/" + dbName);
                File dest = app.getDatabasePath(dbName);
                File parent = dest.getParentFile();
                if (parent != null) {
                    ensureDir(parent);
                }
                deleteSqliteWithSidecars(dest);
                moveOrCopyFile(staged, dest);
                swapped++;
            }

            // 3. Reaplica as 5 chaves portáteis de lembrete em settings_database (se existir)
            int appliedSettings = 0;
            File settingsJsonFile = new File(stageDir, "settings/local-reminders.json");
            if (settingsJsonFile.isFile() && app.getDatabasePath(SETTINGS_DB_NAME).isFile()) {
                appliedSettings = applyPortableReminderSettings(app, settingsJsonFile);
            }

            // 4. Marca recalculo de lembretes para quando a sessão iniciar
            writeTextFileAtomic(new File(root, FILE_PENDING_REFRESH), nowUtcString());
            saveLastResult(
                root,
                t("Restauração concluída", "Restore completed"),
                t(
                    "Backup restaurado com sucesso!\n\n"
                        + "• Bancos restaurados: " + swapped + "\n"
                        + "• Preferências de lembrete aplicadas: " + appliedSettings + "\n"
                        + (preserveAccount
                            ? "• Sessão/conta atual mantida intacta.\n"
                            : "")
                        + "\nSe algo não parecer certo, você pode usar \"Reverter última restauração\" no menu.",
                    "Backup restored successfully!\n\n"
                        + "• Databases restored: " + swapped + "\n"
                        + "• Reminder preferences applied: " + appliedSettings + "\n"
                        + (preserveAccount
                            ? "• Current account session kept intact.\n"
                            : "")
                        + "\nIf anything looks wrong, use \"Revert last restore\" in the backup menu."
                )
            );
            Log.i(TAG, "Cold ZIP restore committed: dbs=" + swapped + ", settings=" + appliedSettings);
        } catch (Throwable t) {
            Log.e(TAG, "Cold ZIP restore failed; executing automatic rollback", t);
            boolean rolledBack = restoreFromRollbackSnapshot(app, rollbackDir);
            saveLastResult(
                root,
                t("Falha na restauração", "Restore failed"),
                t(
                    "Erro durante a restauração:\n" + safeErrorMessage(t)
                        + (rolledBack
                            ? "\n\nOs dados anteriores foram restaurados automaticamente."
                            : "\n\nNão foi possível concluir o rollback automático."),
                    "Error during restore:\n" + safeErrorMessage(t)
                        + (rolledBack
                            ? "\n\nPrevious data was automatically restored."
                            : "\n\nAutomatic rollback could not be completed.")
                )
            );
        } finally {
            //noinspection ResultOfMethodCallIgnored
            pendingFile.delete();
            deleteRecursively(stageDir);
        }
    }

    private static void applyColdCsvImport(Application app, File root, File pendingFile) {
        File stageDir = new File(root, DIR_STAGING_CSV);
        File rollbackDir = new File(root, DIR_ROLLBACK);
        try {
            File stagedCsv = new File(stageDir, FILE_STAGED_CSV);
            if (!stagedCsv.isFile()) {
                throw new IOException("Staged CSV file missing");
            }
            File treatmentDb = app.getDatabasePath(TREATMENT_DB_NAME);
            if (!treatmentDb.isFile()) {
                throw new IOException("Treatment database missing");
            }

            List<CsvRecord> records = parseMyTherapyArchiveCsv(stagedCsv);
            if (records.isEmpty()) {
                throw new IOException("No valid CSV records to import");
            }

            // 1. Cria snapshot de rollback de mytherapy_database_new antes de escrever
            createRollbackSnapshot(app, rollbackDir, Collections.singletonList(TREATMENT_DB_NAME), "csv_import");

            // 2. Importa dentro de uma única transação SQLite usando BundledSQLiteDriver
            CsvImportStats stats = importCsvIntoTreatmentDb(treatmentDb, records);

            // 3. Marca atualização de lembretes
            writeTextFileAtomic(new File(root, FILE_PENDING_REFRESH), nowUtcString());
            saveLastResult(
                root,
                t("Histórico CSV importado", "CSV history imported"),
                t(
                    "Importação do MyTherapy Archive concluída!\n\n"
                        + "• Registros importados: " + stats.insertedLogs + "\n"
                        + "• Duplicados ignorados: " + stats.skippedDuplicates + "\n"
                        + "• Itens/medicamentos criados: " + stats.createdItems + "\n"
                        + "• Tratamentos/lembretes criados: " + stats.createdSchedulers + "\n"
                        + "• Itens já existentes vinculados: " + stats.reusedItems + "\n"
                        + "• Notas importadas: " + stats.insertedNotes + "\n\n"
                        + "Os medicamentos agora aparecem na aba de Tratamento e podem ser editados normalmente. "
                        + "Você também pode desfazer em \"Reverter última restauração / importação\".",
                    "MyTherapy Archive import finished!\n\n"
                        + "• Records imported: " + stats.insertedLogs + "\n"
                        + "• Duplicates skipped: " + stats.skippedDuplicates + "\n"
                        + "• New items/medications created: " + stats.createdItems + "\n"
                        + "• Treatments/schedules created: " + stats.createdSchedulers + "\n"
                        + "• Existing items matched: " + stats.reusedItems + "\n"
                        + "• Notes imported: " + stats.insertedNotes + "\n\n"
                        + "Imported medications now appear in Treatments and can be edited normally. "
                        + "You can also undo this anytime via \"Revert last restore / import\"."
                )
            );
            Log.i(TAG, "Cold CSV import committed: inserted=" + stats.insertedLogs
                + ", skipped=" + stats.skippedDuplicates
                + ", createdItems=" + stats.createdItems);
        } catch (Throwable t) {
            Log.e(TAG, "Cold CSV import failed; executing automatic rollback", t);
            boolean rolledBack = restoreFromRollbackSnapshot(app, rollbackDir);
            saveLastResult(
                root,
                t("Falha ao importar CSV", "CSV import failed"),
                t(
                    "Erro durante a importação:\n" + safeErrorMessage(t)
                        + (rolledBack
                            ? "\n\nO banco anterior foi restaurado automaticamente."
                            : ""),
                    "Error during import:\n" + safeErrorMessage(t)
                        + (rolledBack
                            ? "\n\nPrevious database was automatically restored."
                            : "")
                )
            );
        } finally {
            //noinspection ResultOfMethodCallIgnored
            pendingFile.delete();
            deleteRecursively(stageDir);
        }
    }

    private static void applyColdRollback(Application app, File root, File pendingFile) {
        File rollbackDir = new File(root, DIR_ROLLBACK);
        try {
            boolean ok = restoreFromRollbackSnapshot(app, rollbackDir);
            if (!ok) {
                throw new IOException(t(
                    "Nenhum ponto de reversão válido encontrado.",
                    "No valid rollback snapshot found."
                ));
            }
            writeTextFileAtomic(new File(root, FILE_PENDING_REFRESH), nowUtcString());
            saveLastResult(
                root,
                t("Reversão concluída", "Rollback completed"),
                t(
                    "Seus bancos foram restaurados para o estado anterior à última alteração.",
                    "Your databases were restored to their state before the last operation."
                )
            );
            Log.i(TAG, "Cold manual rollback committed");
        } catch (Throwable t) {
            Log.e(TAG, "Cold rollback failed", t);
            saveLastResult(
                root,
                t("Falha ao reverter", "Rollback failed"),
                safeErrorMessage(t)
            );
        } finally {
            //noinspection ResultOfMethodCallIgnored
            pendingFile.delete();
        }
    }

    // =========================================================================
    // 10. Motor de Importação CSV -> mytherapy_database_new (Room3 v171)
    // =========================================================================

    private static final class CsvImportStats {
        int insertedLogs;
        int skippedDuplicates;
        int createdItems;
        int createdSchedulers;
        int reusedItems;
        int insertedNotes;
    }

    private static final class InferredSchedule {
        String earliestDate;
        final TreeMap<Long, Double> plannedTimesMsToDose = new TreeMap<>();
    }

    private static CsvImportStats importCsvIntoTreatmentDb(File treatmentDb, List<CsvRecord> records) throws Exception {
        CsvImportStats stats = new CsvImportStats();
        Object conn = openSqliteConnection(treatmentDb.getAbsolutePath());
        boolean inTx = false;
        try {
            execSql(conn, "PRAGMA busy_timeout = 5000");
            execSql(conn, "BEGIN IMMEDIATE TRANSACTION");
            inTx = true;

            Map<String, Long> unitLookup = loadUnitLookup(conn);
            Map<Long, Long> unitScaleLookup = loadUnitScaleLookup(conn);
            Map<Integer, Long> defaultUnitByType = loadDefaultUnitByType(conn);

            // Pré-agrega horários agendados e data inicial por item para reconstruir schedulers editáveis
            Map<String, InferredSchedule> inferredByKey = new HashMap<>();
            for (CsvRecord rec : records) {
                String cacheKey = rec.eventType + "|" + rec.name.toLowerCase(Locale.ROOT);
                InferredSchedule inf = inferredByKey.get(cacheKey);
                if (inf == null) {
                    inf = new InferredSchedule();
                    inferredByKey.put(cacheKey, inf);
                }
                if (rec.actualDate != null && rec.actualDate.length() >= 10) {
                    String dayPrefix = rec.actualDate.substring(0, 10);
                    if (inf.earliestDate == null || dayPrefix.compareTo(inf.earliestDate) < 0) {
                        inf.earliestDate = dayPrefix;
                    }
                }
                long timeMs = parseTimeOfDayMillis(rec.scheduledDate);
                if (timeMs >= 0L) {
                    Double dose = rec.value != null ? rec.value : Double.valueOf(1.0d);
                    inf.plannedTimesMsToDose.put(timeMs, dose);
                }
            }

            Map<String, Long> trackableCache = new HashMap<>();
            Map<String, Long> schedulerCache = new HashMap<>();
            Set<String> countedReused = new HashSet<>();

            TimeZone localTz = TimeZone.getDefault();
            SimpleDateFormat localFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
            localFmt.setTimeZone(localTz);
            localFmt.setLenient(false);

            SimpleDateFormat utcFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
            utcFmt.setTimeZone(TimeZone.getTimeZone("UTC"));

            Date now = new Date();
            String nowLocalStr = localFmt.format(now);
            String nowUtcStr = utcFmt.format(now);

            for (CsvRecord rec : records) {
                String cacheKey = rec.eventType + "|" + rec.name.toLowerCase(Locale.ROOT);
                Long trackableId = trackableCache.get(cacheKey);
                if (trackableId == null) {
                    trackableId = findExistingTrackableObject(conn, rec.name, rec.eventType);
                    if (trackableId != null) {
                        if (countedReused.add(cacheKey)) {
                            stats.reusedItems++;
                        }
                    } else {
                        Long eventId = findExistingEvent(conn, rec.name, rec.eventType);
                        if (eventId == null) {
                            eventId = insertEvent(conn, rec.name, rec.eventType);
                        }
                        Long unitId = resolveUnitId(rec.unit, rec.eventType, unitLookup, defaultUnitByType);
                        Long scaleId = unitId != null ? unitScaleLookup.get(unitId) : null;
                        trackableId = insertTrackableObject(conn, eventId, unitId, scaleId);
                        stats.createdItems++;
                    }
                    trackableCache.put(cacheKey, trackableId);
                }

                Long schedulerId = schedulerCache.get(cacheKey);
                if (schedulerId == null) {
                    schedulerId = findExistingActiveScheduler(conn, trackableId);
                    if (schedulerId == null) {
                        InferredSchedule inf = inferredByKey.get(cacheKey);
                        schedulerId = insertEditableScheduler(
                            conn,
                            trackableId,
                            inf,
                            nowLocalStr,
                            nowUtcStr
                        );
                        stats.createdSchedulers++;
                        backfillOrphanEventLogScheduler(conn, trackableId, schedulerId);
                    }
                    schedulerCache.put(cacheKey, schedulerId);
                }

                if (eventLogExists(conn, trackableId, rec.actualDate)) {
                    stats.skippedDuplicates++;
                    continue;
                }

                long actualMillis = parseLocalTimestampMillis(localFmt, rec.actualDate);
                String utcInstant = utcFmt.format(new Date(actualMillis));
                double tzHours = localTz.getOffset(actualMillis) / 3600000.0d;

                long eventLogId = insertEventLog(
                    conn,
                    schedulerId,
                    trackableId,
                    rec.actualDate,
                    utcInstant,
                    rec.scheduledDate,
                    rec.status,
                    tzHours
                );

                // Sempre insere event_log_value ativo para aparecer na view active_event_log_with_type
                insertEventLogValue(conn, eventLogId, trackableId, rec.value);

                if (rec.note != null && !rec.note.isEmpty()) {
                    insertEventLogNote(conn, eventLogId, rec.note);
                    stats.insertedNotes++;
                }
                stats.insertedLogs++;
            }

            execSql(conn, "COMMIT");
            inTx = false;
            return stats;
        } catch (Throwable t) {
            if (inTx) {
                try {
                    execSql(conn, "ROLLBACK");
                } catch (Throwable ignored) {}
            }
            if (t instanceof Exception) {
                throw (Exception) t;
            }
            throw new IOException(t);
        } finally {
            closeSqliteConnection(conn);
        }
    }

    private static Map<String, Long> loadUnitLookup(Object conn) throws Exception {
        Map<String, Long> map = new HashMap<>();
        Object stmt = prepareSql(conn, "SELECT id, name FROM unit WHERE is_active = 1 AND name IS NOT NULL");
        try {
            while (stmtStep(stmt)) {
                long id = stmtGetLong(stmt, 0);
                String name = stmtGetText(stmt, 1);
                if (name != null) {
                    String norm = normalizeUnitKey(name);
                    if (!norm.isEmpty() && !map.containsKey(norm)) {
                        map.put(norm, id);
                    }
                }
            }
        } finally {
            closeStatement(stmt);
        }
        return map;
    }

    private static Map<Long, Long> loadUnitScaleLookup(Object conn) throws Exception {
        Map<Long, Long> map = new HashMap<>();
        Object stmt = prepareSql(conn, "SELECT id, scale_id FROM unit");
        try {
            while (stmtStep(stmt)) {
                map.put(stmtGetLong(stmt, 0), stmtGetLong(stmt, 1));
            }
        } finally {
            closeStatement(stmt);
        }
        return map;
    }

    private static Map<Integer, Long> loadDefaultUnitByType(Object conn) throws Exception {
        Map<Integer, Long> map = new HashMap<>();
        Object stmt = prepareSql(conn, "SELECT allowed_type, MIN(id) FROM unit WHERE is_active = 1 GROUP BY allowed_type");
        try {
            while (stmtStep(stmt)) {
                int allowedType = (int) stmtGetLong(stmt, 0);
                long id = stmtGetLong(stmt, 1);
                map.put(allowedType, id);
            }
        } finally {
            closeStatement(stmt);
        }
        return map;
    }

    private static Long resolveUnitId(
        String rawUnit,
        int eventType,
        Map<String, Long> unitLookup,
        Map<Integer, Long> defaultUnitByType
    ) {
        if (rawUnit != null && !rawUnit.trim().isEmpty()) {
            String norm = normalizeUnitKey(rawUnit);
            Long exact = unitLookup.get(norm);
            if (exact != null) {
                return exact;
            }
            String[] synonyms = unitSynonyms(norm);
            for (String syn : synonyms) {
                Long match = unitLookup.get(syn);
                if (match != null) {
                    return match;
                }
            }
        }
        return defaultUnitByType.get(eventType);
    }

    private static String normalizeUnitKey(String raw) {
        return raw.trim().toLowerCase(Locale.ROOT);
    }

    private static String[] unitSynonyms(String norm) {
        if (norm.contains("comprimido") || norm.contains("tablet") || norm.contains("pill")) {
            return new String[] { "tablet(s)", "pill(s)", "comprimido(s)", "tablet", "pill", "comprimido" };
        }
        if (norm.contains("cápsula") || norm.contains("capsula") || norm.contains("capsule")) {
            return new String[] { "capsule(s)", "cápsula(s)", "capsule", "cápsula" };
        }
        if (norm.contains("gota") || norm.contains("drop")) {
            return new String[] { "drop(s)", "gota(s)", "drop", "gota" };
        }
        if (norm.contains("inje") || norm.contains("inject")) {
            return new String[] { "injection(s)", "injeção(ões)", "injection" };
        }
        if (norm.contains("jato") || norm.contains("puff") || norm.contains("spray")) {
            return new String[] { "puff(s)", "spray(s)", "jato(s)", "puff", "spray" };
        }
        if (norm.contains("adesivo") || norm.contains("patch")) {
            return new String[] { "patch(es)", "adesivo(s)", "patch" };
        }
        if (norm.contains("sachê") || norm.contains("sache") || norm.contains("sachet")) {
            return new String[] { "sachet(s)", "sachê(s)", "sachet" };
        }
        if (norm.contains("ampola") || norm.contains("ampoule")) {
            return new String[] { "ampoule(s)", "ampola(s)", "ampoule" };
        }
        if (norm.contains("colher") || norm.contains("spoon")) {
            return new String[] { "tablespoon(s)", "teaspoon(s)", "spoon(s)", "colher(es)" };
        }
        if (norm.contains("aplic") || norm.contains("appli")) {
            return new String[] { "application(s)", "aplicação(ões)", "application" };
        }
        if (norm.equals("ui") || norm.equals("iu")) {
            return new String[] { "iu", "ui", "unit(s)", "unidade(s)" };
        }
        if (norm.contains("unidade") || norm.contains("unit")) {
            return new String[] { "unit(s)", "unidade(s)", "unit", "iu" };
        }
        return new String[0];
    }

    private static Long findExistingTrackableObject(Object conn, String name, int type) throws Exception {
        Object stmt = prepareSql(
            conn,
            "SELECT t.id FROM trackable_object t "
                + "JOIN event e ON t.event_id = e.id "
                + "WHERE lower(trim(e.name)) = lower(trim(?)) AND e.type = ? AND t.is_active = 1 "
                + "ORDER BY t.id ASC LIMIT 1"
        );
        try {
            stmtBindText(stmt, 1, name);
            stmtBindLong(stmt, 2, type);
            if (stmtStep(stmt)) {
                return stmtGetLong(stmt, 0);
            }
            return null;
        } finally {
            closeStatement(stmt);
        }
    }

    private static Long findExistingEvent(Object conn, String name, int type) throws Exception {
        Object stmt = prepareSql(
            conn,
            "SELECT id FROM event WHERE lower(trim(name)) = lower(trim(?)) AND type = ? ORDER BY id ASC LIMIT 1"
        );
        try {
            stmtBindText(stmt, 1, name);
            stmtBindLong(stmt, 2, type);
            if (stmtStep(stmt)) {
                return stmtGetLong(stmt, 0);
            }
            return null;
        } finally {
            closeStatement(stmt);
        }
    }

    private static long insertEvent(Object conn, String name, int type) throws Exception {
        Object stmt = prepareSql(
            conn,
            "INSERT INTO event (server_id, sync_status, parent_server_id, country, company_name, number, "
                + "package_size, name, rank, type, user_defined, product, is_rx, classification) "
                + "VALUES (?, 0, NULL, NULL, NULL, NULL, NULL, ?, NULL, ?, 1, 0, 0, NULL)"
        );
        try {
            stmtBindText(stmt, 1, UUID.randomUUID().toString());
            stmtBindText(stmt, 2, name);
            stmtBindLong(stmt, 3, type);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
        return queryLastInsertRowId(conn);
    }

    private static long insertTrackableObject(Object conn, long eventId, Long unitId, Long scaleId) throws Exception {
        Object stmt = prepareSql(
            conn,
            "INSERT INTO trackable_object (server_id, sync_status, event_id, unit_id, scale_id, "
                + "is_active, trackable, user_defined, product) "
                + "VALUES (?, 0, ?, ?, ?, 1, 1, 1, 0)"
        );
        try {
            stmtBindText(stmt, 1, UUID.randomUUID().toString());
            stmtBindLong(stmt, 2, eventId);
            if (unitId != null) {
                stmtBindLong(stmt, 3, unitId);
            } else {
                stmtBindNull(stmt, 3);
            }
            if (scaleId != null) {
                stmtBindLong(stmt, 4, scaleId);
            } else {
                stmtBindNull(stmt, 4);
            }
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
        return queryLastInsertRowId(conn);
    }

    private static boolean eventLogExists(Object conn, long trackableObjectId, String actualDate) throws Exception {
        Object stmt = prepareSql(
            conn,
            "SELECT id FROM event_log WHERE trackable_object_id = ? AND actual_date = ? AND is_active = 1 LIMIT 1"
        );
        try {
            stmtBindLong(stmt, 1, trackableObjectId);
            stmtBindText(stmt, 2, actualDate);
            return stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
    }

    private static Long findExistingActiveScheduler(Object conn, long trackableObjectId) throws Exception {
        Object stmt = prepareSql(
            conn,
            "SELECT id FROM scheduler WHERE trackable_object_id = ? AND is_active = 1 ORDER BY id ASC LIMIT 1"
        );
        try {
            stmtBindLong(stmt, 1, trackableObjectId);
            if (stmtStep(stmt)) {
                return stmtGetLong(stmt, 0);
            }
            return null;
        } finally {
            closeStatement(stmt);
        }
    }

    private static long insertEditableScheduler(
        Object conn,
        long trackableObjectId,
        InferredSchedule inferred,
        String nowLocalStr,
        String nowUtcStr
    ) throws Exception {
        boolean hasTimes = inferred != null && !inferred.plannedTimesMsToDose.isEmpty();
        int mode = hasTimes ? 1 : 0; // SELECTED_WEEKDAYS=1, AS_NEEDED=0
        int daysActive = hasTimes ? 1 : 0;
        String startDate = (inferred != null && inferred.earliestDate != null)
            ? (inferred.earliestDate + " 00:00:00")
            : (nowLocalStr.substring(0, 10) + " 00:00:00");
        String serverId = UUID.randomUUID().toString();

        Object stmt = prepareSql(
            conn,
            "INSERT INTO scheduler (server_id, sync_status, parent_server_id, root_server_id, "
                + "start_date, original_start_date, end_date, is_relative, mode, days_active, "
                + "days_paused, day_in_cycle, status, is_active, is_editable, intake_advice_type, "
                + "intake_message, interaction_date, from_barcode, is_critical, trackable_object_id, "
                + "product, device_creation_date, sub_profile_id) "
                + "VALUES (?, 0, NULL, ?, ?, ?, NULL, 0, ?, ?, 0, 0, 'DEFAULT', 1, 1, 0, NULL, ?, 0, 0, ?, 0, ?, NULL)"
        );
        try {
            stmtBindText(stmt, 1, serverId);
            stmtBindText(stmt, 2, serverId);
            stmtBindText(stmt, 3, startDate);
            stmtBindText(stmt, 4, startDate);
            stmtBindLong(stmt, 5, mode);
            stmtBindLong(stmt, 6, daysActive);
            stmtBindText(stmt, 7, nowUtcStr);
            stmtBindLong(stmt, 8, trackableObjectId);
            stmtBindText(stmt, 9, nowLocalStr);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }

        long schedulerId = queryLastInsertRowId(conn);
        if (hasTimes) {
            int blockOrder = 0;
            for (Map.Entry<Long, Double> entry : inferred.plannedTimesMsToDose.entrySet()) {
                insertSchedulerTime(conn, schedulerId, blockOrder++, entry.getKey(), entry.getValue(), 127);
            }
        }
        return schedulerId;
    }

    private static void insertSchedulerTime(
        Object conn,
        long schedulerId,
        int blockOrder,
        long plannedTimeMs,
        Double dose,
        int activeOnDays
    ) throws Exception {
        Object stmt = prepareSql(
            conn,
            "INSERT INTO scheduler_time (server_id, scheduler_id, block_order, planned_time, dose, active_on_days) "
                + "VALUES (?, ?, ?, ?, ?, ?)"
        );
        try {
            stmtBindText(stmt, 1, UUID.randomUUID().toString());
            stmtBindLong(stmt, 2, schedulerId);
            stmtBindLong(stmt, 3, blockOrder);
            stmtBindLong(stmt, 4, plannedTimeMs);
            if (dose != null) {
                stmtBindDouble(stmt, 5, dose);
            } else {
                stmtBindNull(stmt, 5);
            }
            stmtBindLong(stmt, 6, activeOnDays);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
    }

    private static void backfillOrphanEventLogScheduler(
        Object conn,
        long trackableObjectId,
        long schedulerId
    ) throws Exception {
        Object stmt = prepareSql(
            conn,
            "UPDATE event_log SET scheduler_id = ? WHERE trackable_object_id = ? AND scheduler_id IS NULL AND is_active = 1"
        );
        try {
            stmtBindLong(stmt, 1, schedulerId);
            stmtBindLong(stmt, 2, trackableObjectId);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
    }

    private static long parseTimeOfDayMillis(String normalizedTimestamp) {
        if (normalizedTimestamp == null || normalizedTimestamp.length() < 19) {
            return -1L;
        }
        try {
            int hour = Integer.parseInt(normalizedTimestamp.substring(11, 13));
            int minute = Integer.parseInt(normalizedTimestamp.substring(14, 16));
            int second = Integer.parseInt(normalizedTimestamp.substring(17, 19));
            if (hour < 0 || hour > 23 || minute < 0 || minute > 59 || second < 0 || second > 59) {
                return -1L;
            }
            return ((hour * 3600L) + (minute * 60L) + second) * 1000L;
        } catch (NumberFormatException ignored) {
            return -1L;
        }
    }

    private static long insertEventLog(
        Object conn,
        Long schedulerId,
        long trackableObjectId,
        String actualDate,
        String utcInstant,
        String scheduledDate,
        int status,
        double tzHours
    ) throws Exception {
        Object stmt = prepareSql(
            conn,
            "INSERT INTO event_log (server_id, sync_status, scheduler_id, trackable_object_id, "
                + "actual_date, interaction_date, device_creation_date, is_active, scheduled_date, "
                + "status, timezone, external_source, is_editable, product, sub_profile_id, external_id) "
                + "VALUES (?, 0, ?, ?, ?, ?, ?, 1, ?, ?, ?, NULL, 1, 0, NULL, NULL)"
        );
        try {
            stmtBindText(stmt, 1, UUID.randomUUID().toString());
            if (schedulerId != null) {
                stmtBindLong(stmt, 2, schedulerId);
            } else {
                stmtBindNull(stmt, 2);
            }
            stmtBindLong(stmt, 3, trackableObjectId);
            stmtBindText(stmt, 4, actualDate);
            stmtBindText(stmt, 5, utcInstant);
            stmtBindText(stmt, 6, utcInstant);
            if (scheduledDate != null && !scheduledDate.isEmpty()) {
                stmtBindText(stmt, 7, scheduledDate);
            } else {
                stmtBindNull(stmt, 7);
            }
            stmtBindLong(stmt, 8, status);
            stmtBindDouble(stmt, 9, tzHours);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
        return queryLastInsertRowId(conn);
    }

    private static void insertEventLogValue(Object conn, long eventLogId, long trackableObjectId, Double value) throws Exception {
        Object stmt = prepareSql(
            conn,
            "INSERT INTO event_log_value (server_id, event_log_id, value, scheduled_value, trackable_object_id, is_active) "
                + "VALUES (?, ?, ?, ?, ?, 1)"
        );
        try {
            stmtBindText(stmt, 1, UUID.randomUUID().toString());
            stmtBindLong(stmt, 2, eventLogId);
            if (value != null) {
                stmtBindDouble(stmt, 3, value);
                stmtBindDouble(stmt, 4, value);
            } else {
                stmtBindNull(stmt, 3);
                stmtBindNull(stmt, 4);
            }
            stmtBindLong(stmt, 5, trackableObjectId);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
    }

    private static void insertEventLogNote(Object conn, long eventLogId, String note) throws Exception {
        Object stmt = prepareSql(
            conn,
            "INSERT OR REPLACE INTO event_log_note (event_log_id, note) VALUES (?, ?)"
        );
        try {
            stmtBindLong(stmt, 1, eventLogId);
            stmtBindText(stmt, 2, note);
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
    }

    private static long queryLastInsertRowId(Object conn) throws Exception {
        Object stmt = prepareSql(conn, "SELECT last_insert_rowid()");
        try {
            if (!stmtStep(stmt)) {
                throw new IOException("last_insert_rowid() returned no rows");
            }
            return stmtGetLong(stmt, 0);
        } finally {
            closeStatement(stmt);
        }
    }

    private static long parseLocalTimestampMillis(SimpleDateFormat fmt, String timestamp) {
        try {
            Date parsed = fmt.parse(timestamp);
            if (parsed != null) {
                return parsed.getTime();
            }
        } catch (ParseException ignored) {}
        return System.currentTimeMillis();
    }

    // =========================================================================
    // 11. Parser RFC 4180 para MyTherapy Archive.csv
    // =========================================================================

    private static List<CsvRecord> parseMyTherapyArchiveCsv(File csvFile) throws IOException {
        String content = readTextFile(csvFile);
        if (content.startsWith("\uFEFF")) {
            content = content.substring(1);
        }
        List<List<String>> rows = parseCsvRows(content);
        if (rows.isEmpty()) {
            throw new IOException("CSV file is empty");
        }

        List<String> header = rows.get(0);
        Map<String, Integer> colIndex = new HashMap<>();
        for (int i = 0; i < header.size(); i++) {
            colIndex.put(header.get(i).trim().toLowerCase(Locale.ROOT), i);
        }

        int idxActual = getRequiredCol(colIndex, "actual_date");
        int idxScheduled = getOptionalCol(colIndex, "scheduled_date");
        int idxType = getRequiredCol(colIndex, "type");
        int idxName = getRequiredCol(colIndex, "name");
        int idxValue = getOptionalCol(colIndex, "value");
        int idxUnit = getOptionalCol(colIndex, "unit");
        int idxStatus = getOptionalCol(colIndex, "status");
        int idxNote = getOptionalCol(colIndex, "note");

        List<CsvRecord> result = new ArrayList<>();
        for (int r = 1; r < rows.size(); r++) {
            List<String> row = rows.get(r);
            if (row.isEmpty() || (row.size() == 1 && row.get(0).trim().isEmpty())) {
                continue;
            }
            String actualDate = normalizeTimestamp(getCell(row, idxActual));
            String name = getCell(row, idxName).trim();
            if (actualDate == null || name.isEmpty()) {
                continue;
            }
            CsvRecord rec = new CsvRecord();
            rec.actualDate = actualDate;
            rec.scheduledDate = normalizeTimestamp(getCell(row, idxScheduled));
            rec.typeRaw = getCell(row, idxType).trim();
            rec.eventType = mapEventType(rec.typeRaw);
            rec.name = name;
            rec.value = parseNullableDouble(getCell(row, idxValue));
            rec.unit = getCell(row, idxUnit).trim();
            rec.status = mapEventLogStatus(getCell(row, idxStatus).trim());
            rec.note = getCell(row, idxNote).trim();
            result.add(rec);
        }
        return result;
    }

    private static int getRequiredCol(Map<String, Integer> map, String col) throws IOException {
        Integer idx = map.get(col);
        if (idx == null) {
            throw new IOException("Missing required CSV column: " + col);
        }
        return idx;
    }

    private static int getOptionalCol(Map<String, Integer> map, String col) {
        Integer idx = map.get(col);
        return idx != null ? idx : -1;
    }

    private static String getCell(List<String> row, int idx) {
        if (idx < 0 || idx >= row.size()) {
            return "";
        }
        String val = row.get(idx);
        return val != null ? val : "";
    }

    private static String normalizeTimestamp(String raw) {
        if (raw == null) {
            return null;
        }
        String s = raw.trim();
        if (s.isEmpty()) {
            return null;
        }
        if (s.length() == 19 && s.charAt(4) == '-' && s.charAt(7) == '-' && s.charAt(13) == ':' && s.charAt(16) == ':') {
            return s.replace('T', ' ');
        }
        if (s.length() == 16 && s.charAt(4) == '-' && s.charAt(7) == '-' && s.charAt(13) == ':') {
            return s.replace('T', ' ') + ":00";
        }
        if (s.length() == 10 && s.charAt(4) == '-' && s.charAt(7) == '-') {
            return s + " 00:00:00";
        }
        return null;
    }

    private static int mapEventType(String raw) {
        String s = raw == null ? "" : raw.trim().toLowerCase(Locale.ROOT);
        if (s.equals("drug") || s.equals("medication") || s.equals("medicamento") || s.equals("remédio")) {
            return 1;
        }
        if (s.equals("measurement") || s.equals("medição") || s.equals("medicao")) {
            return 2;
        }
        if (s.equals("activity") || s.equals("atividade")) {
            return 3;
        }
        if (s.equals("question") || s.equals("pergunta")) {
            return 4;
        }
        if (s.equals("symptom") || s.equals("sintoma")) {
            return 5;
        }
        if (s.equals("well_being") || s.equals("well-being") || s.equals("wellbeing") || s.equals("bem-estar")) {
            return 0;
        }
        if (s.equals("lab_value") || s.equals("lab-value") || s.equals("labvalue") || s.equals("exame")) {
            return 6;
        }
        if (s.equals("injection_site") || s.equals("injection-site") || s.equals("injectionsite")) {
            return 7;
        }
        return 1;
    }

    private static int mapEventLogStatus(String raw) {
        String s = raw == null ? "" : raw.trim().toLowerCase(Locale.ROOT);
        if (s.isEmpty() || s.equals("confirmed") || s.equals("confirmado") || s.equals("taken")) {
            return 2;
        }
        if (s.equals("skipped") || s.equals("pulado") || s.equals("ignorado")) {
            return 1;
        }
        if (s.equals("automatically_skipped") || s.equals("auto_skipped") || s.equals("automatically skipped")) {
            return 0;
        }
        if (s.equals("open") || s.equals("aberto")) {
            return -1;
        }
        if (s.equals("interrupted") || s.equals("interrompido")) {
            return 6;
        }
        return 2;
    }

    private static Double parseNullableDouble(String raw) {
        if (raw == null) {
            return null;
        }
        String s = raw.trim();
        if (s.isEmpty()) {
            return null;
        }
        try {
            return Double.parseDouble(s.replace(',', '.'));
        } catch (NumberFormatException ignored) {
            return null;
        }
    }

    private static List<List<String>> parseCsvRows(String input) {
        List<List<String>> rows = new ArrayList<>();
        List<String> currentRow = new ArrayList<>();
        StringBuilder field = new StringBuilder();
        boolean inQuotes = false;
        int len = input.length();

        for (int i = 0; i < len; i++) {
            char c = input.charAt(i);
            if (inQuotes) {
                if (c == '"') {
                    if (i + 1 < len && input.charAt(i + 1) == '"') {
                        field.append('"');
                        i++;
                    } else {
                        inQuotes = false;
                    }
                } else {
                    field.append(c);
                }
            } else {
                if (c == '"') {
                    inQuotes = true;
                } else if (c == ',') {
                    currentRow.add(field.toString());
                    field.setLength(0);
                } else if (c == '\r') {
                    if (i + 1 < len && input.charAt(i + 1) == '\n') {
                        i++;
                    }
                    currentRow.add(field.toString());
                    field.setLength(0);
                    rows.add(currentRow);
                    currentRow = new ArrayList<>();
                } else if (c == '\n') {
                    currentRow.add(field.toString());
                    field.setLength(0);
                    rows.add(currentRow);
                    currentRow = new ArrayList<>();
                } else {
                    field.append(c);
                }
            }
        }
        if (field.length() > 0 || !currentRow.isEmpty()) {
            currentRow.add(field.toString());
            rows.add(currentRow);
        }
        return rows;
    }

    // =========================================================================
    // 12. Settings portáteis (5 chaves de lembrete em settings_database)
    // =========================================================================

    private static JSONArray extractPortableReminderSettings(Context ctx) {
        JSONArray entries = new JSONArray();
        File settingsDb = ctx.getDatabasePath(SETTINGS_DB_NAME);
        if (!settingsDb.isFile()) {
            return entries;
        }
        Object conn = null;
        try {
            conn = openSqliteConnection(settingsDb.getAbsolutePath());
            execSql(conn, "PRAGMA busy_timeout = 3000");
            for (String[] pair : PORTABLE_REMINDER_SETTINGS) {
                Object stmt = prepareSql(
                    conn,
                    "SELECT scope, module, id, value FROM setting WHERE module = ? AND id = ?"
                );
                try {
                    stmtBindText(stmt, 1, pair[0]);
                    stmtBindText(stmt, 2, pair[1]);
                    while (stmtStep(stmt)) {
                        JSONObject row = new JSONObject();
                        row.put("scope", stmtGetText(stmt, 0));
                        row.put("module", stmtGetText(stmt, 1));
                        row.put("id", stmtGetText(stmt, 2));
                        row.put("value", stmtGetText(stmt, 3));
                        entries.put(row);
                    }
                } finally {
                    closeStatement(stmt);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not extract portable reminder settings", t);
        } finally {
            closeSqliteConnection(conn);
        }
        return entries;
    }

    private static int applyPortableReminderSettings(Context ctx, File settingsJsonFile) {
        File settingsDb = ctx.getDatabasePath(SETTINGS_DB_NAME);
        if (!settingsDb.isFile()) {
            return 0;
        }
        int applied = 0;
        Object conn = null;
        try {
            JSONObject root = new JSONObject(readTextFile(settingsJsonFile));
            JSONArray entries = root.optJSONArray("entries");
            if (entries == null || entries.length() == 0) {
                return 0;
            }
            conn = openSqliteConnection(settingsDb.getAbsolutePath());
            execSql(conn, "PRAGMA busy_timeout = 3000");
            execSql(conn, "BEGIN IMMEDIATE TRANSACTION");
            try {
                for (int i = 0; i < entries.length(); i++) {
                    JSONObject row = entries.getJSONObject(i);
                    String scope = row.optString("scope", "");
                    String module = row.optString("module", "");
                    String id = row.optString("id", "");
                    String value = row.optString("value", "");
                    if (scope.isEmpty() || !isAllowedReminderSetting(module, id)) {
                        continue;
                    }
                    Object stmt = prepareSql(
                        conn,
                        "INSERT OR REPLACE INTO setting (scope, module, id, value) VALUES (?, ?, ?, ?)"
                    );
                    try {
                        stmtBindText(stmt, 1, scope);
                        stmtBindText(stmt, 2, module);
                        stmtBindText(stmt, 3, id);
                        stmtBindText(stmt, 4, value);
                        stmtStep(stmt);
                        applied++;
                    } finally {
                        closeStatement(stmt);
                    }
                }
                execSql(conn, "COMMIT");
            } catch (Throwable inner) {
                try {
                    execSql(conn, "ROLLBACK");
                } catch (Throwable ignored) {}
                throw inner;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to apply portable reminder settings", t);
        } finally {
            closeSqliteConnection(conn);
        }
        return applied;
    }

    private static boolean isAllowedReminderSetting(String module, String id) {
        for (String[] pair : PORTABLE_REMINDER_SETTINGS) {
            if (pair[0].equals(module) && pair[1].equals(id)) {
                return true;
            }
        }
        return false;
    }

    // =========================================================================
    // 13. Rollback durável (journal + cópia com sidecars WAL)
    // =========================================================================

    private static void createRollbackSnapshot(
        Context ctx,
        File rollbackDir,
        List<String> dbNames,
        String operation
    ) throws Exception {
        deleteRecursively(rollbackDir);
        File dbsOut = new File(rollbackDir, "dbs");
        ensureDir(dbsOut);

        JSONArray saved = new JSONArray();
        for (String name : dbNames) {
            File srcBase = ctx.getDatabasePath(name);
            JSONObject item = new JSONObject();
            item.put("name", name);
            item.put("existed", srcBase.isFile());
            JSONArray files = new JSONArray();
            for (String suffix : SQLITE_SIDECARS) {
                File f = new File(srcBase.getAbsolutePath() + suffix);
                if (f.isFile()) {
                    File dst = new File(dbsOut, name + suffix);
                    copyFile(f, dst);
                    files.put(name + suffix);
                }
            }
            item.put("files", files);
            saved.put(item);
        }

        JSONObject journal = new JSONObject();
        journal.put("createdAtUtc", nowUtcString());
        journal.put("operation", operation);
        journal.put("databases", saved);
        writeTextFileAtomic(new File(rollbackDir, FILE_ROLLBACK_JOURNAL), journal.toString(2));
    }

    private static boolean restoreFromRollbackSnapshot(Context ctx, File rollbackDir) {
        File journalFile = new File(rollbackDir, FILE_ROLLBACK_JOURNAL);
        if (!journalFile.isFile()) {
            return false;
        }
        try {
            JSONObject journal = new JSONObject(readTextFile(journalFile));
            JSONArray dbs = journal.getJSONArray("databases");
            File dbsDir = new File(rollbackDir, "dbs");
            for (int i = 0; i < dbs.length(); i++) {
                JSONObject item = dbs.getJSONObject(i);
                String name = item.getString("name");
                File destBase = ctx.getDatabasePath(name);
                deleteSqliteWithSidecars(destBase);
                if (!item.optBoolean("existed", false)) {
                    continue;
                }
                File parent = destBase.getParentFile();
                if (parent != null) {
                    ensureDir(parent);
                }
                JSONArray files = item.getJSONArray("files");
                for (int j = 0; j < files.length(); j++) {
                    String relName = files.getString(j);
                    File src = new File(dbsDir, relName);
                    if (src.isFile()) {
                        copyFile(src, new File(parent, relName));
                    }
                }
            }
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "Rollback restoration failed", t);
            return false;
        }
    }

    // =========================================================================
    // 14. Wrapper reflexivo para BundledSQLiteDriver / SQLiteConnection
    // =========================================================================

    private static final class SqliteMeta {
        boolean integrityOk;
        int userVersion;
        String identityHash;
    }

    private static synchronized void ensureSqliteReflection() throws Exception {
        if (sqliteDriverInstance != null) {
            return;
        }
        ClassLoader cl = MyTherapyBackupHelper.class.getClassLoader();
        Class<?> driverCls = Class.forName("androidx.sqlite.driver.bundled.BundledSQLiteDriver", false, cl);
        Class<?> connCls = Class.forName("androidx.sqlite.SQLiteConnection", false, cl);
        Class<?> stmtCls = Class.forName("androidx.sqlite.SQLiteStatement", false, cl);

        sqliteDriverInstance = driverCls.getConstructor().newInstance();
        driverOpenMethod = driverCls.getMethod("open", String.class);
        connPrepareMethod = connCls.getMethod("prepare", String.class);
        connCloseMethod = connCls.getMethod("close");

        stmtBindLongMethod = stmtCls.getMethod("bindLong", int.class, long.class);
        stmtBindDoubleMethod = stmtCls.getMethod("bindDouble", int.class, double.class);
        stmtBindTextMethod = stmtCls.getMethod("bindText", int.class, String.class);
        stmtBindNullMethod = stmtCls.getMethod("bindNull", int.class);
        stmtStepMethod = stmtCls.getMethod("step");
        stmtGetLongMethod = stmtCls.getMethod("getLong", int.class);
        stmtGetDoubleMethod = stmtCls.getMethod("getDouble", int.class);
        stmtGetTextMethod = stmtCls.getMethod("getText", int.class);
        stmtIsNullMethod = stmtCls.getMethod("isNull", int.class);
        stmtCloseMethod = stmtCls.getMethod("close");
    }

    private static Object openSqliteConnection(String path) throws Exception {
        ensureSqliteReflection();
        return driverOpenMethod.invoke(sqliteDriverInstance, path);
    }

    private static void closeSqliteConnection(Object conn) {
        if (conn == null) {
            return;
        }
        try {
            connCloseMethod.invoke(conn);
        } catch (Throwable ignored) {}
    }

    private static Object prepareSql(Object conn, String sql) throws Exception {
        return connPrepareMethod.invoke(conn, sql);
    }

    private static void closeStatement(Object stmt) {
        if (stmt == null) {
            return;
        }
        try {
            stmtCloseMethod.invoke(stmt);
        } catch (Throwable ignored) {}
    }

    private static void execSql(Object conn, String sql) throws Exception {
        Object stmt = prepareSql(conn, sql);
        try {
            stmtStep(stmt);
        } finally {
            closeStatement(stmt);
        }
    }

    private static boolean stmtStep(Object stmt) throws Exception {
        return Boolean.TRUE.equals(stmtStepMethod.invoke(stmt));
    }

    private static void stmtBindLong(Object stmt, int idx, long val) throws Exception {
        stmtBindLongMethod.invoke(stmt, idx, val);
    }

    private static void stmtBindDouble(Object stmt, int idx, double val) throws Exception {
        stmtBindDoubleMethod.invoke(stmt, idx, val);
    }

    private static void stmtBindText(Object stmt, int idx, String val) throws Exception {
        stmtBindTextMethod.invoke(stmt, idx, val);
    }

    private static void stmtBindNull(Object stmt, int idx) throws Exception {
        stmtBindNullMethod.invoke(stmt, idx);
    }

    private static long stmtGetLong(Object stmt, int idx) throws Exception {
        return (Long) stmtGetLongMethod.invoke(stmt, idx);
    }

    private static String stmtGetText(Object stmt, int idx) throws Exception {
        return (String) stmtGetTextMethod.invoke(stmt, idx);
    }

    private static boolean stmtIsNull(Object stmt, int idx) throws Exception {
        return Boolean.TRUE.equals(stmtIsNullMethod.invoke(stmt, idx));
    }

    private static void snapshotSqliteDatabase(File srcDb, File dstFile) throws Exception {
        if (dstFile.exists()) {
            //noinspection ResultOfMethodCallIgnored
            dstFile.delete();
        }
        Object conn = null;
        try {
            conn = openSqliteConnection(srcDb.getAbsolutePath());
            execSql(conn, "PRAGMA busy_timeout = 3000");
            String escaped = dstFile.getAbsolutePath().replace("'", "''");
            execSql(conn, "VACUUM INTO '" + escaped + "'");
            if (dstFile.isFile() && dstFile.length() > 0L) {
                return;
            }
        } catch (Throwable vacuumErr) {
            Log.w(TAG, "VACUUM INTO failed for " + srcDb.getName() + "; falling back to checkpoint+copy", vacuumErr);
            if (dstFile.exists()) {
                //noinspection ResultOfMethodCallIgnored
                dstFile.delete();
            }
            if (conn != null) {
                try {
                    execSql(conn, "PRAGMA wal_checkpoint(TRUNCATE)");
                } catch (Throwable ignored) {}
            }
            copyFile(srcDb, dstFile);
        } finally {
            closeSqliteConnection(conn);
        }
    }

    private static SqliteMeta inspectSqliteDatabase(File dbFile) throws Exception {
        SqliteMeta meta = new SqliteMeta();
        Object conn = openSqliteConnection(dbFile.getAbsolutePath());
        try {
            Object qc = prepareSql(conn, "PRAGMA quick_check");
            try {
                if (stmtStep(qc)) {
                    String res = stmtGetText(qc, 0);
                    meta.integrityOk = "ok".equalsIgnoreCase(res);
                }
            } finally {
                closeStatement(qc);
            }

            Object uv = prepareSql(conn, "PRAGMA user_version");
            try {
                if (stmtStep(uv)) {
                    meta.userVersion = (int) stmtGetLong(uv, 0);
                }
            } finally {
                closeStatement(uv);
            }

            try {
                Object rm = prepareSql(conn, "SELECT identity_hash FROM room_master_table WHERE id = 42 LIMIT 1");
                try {
                    if (stmtStep(rm) && !stmtIsNull(rm, 0)) {
                        meta.identityHash = stmtGetText(rm, 0);
                    }
                } finally {
                    closeStatement(rm);
                }
            } catch (Throwable ignored) {
                meta.identityHash = null;
            }
        } finally {
            closeSqliteConnection(conn);
        }
        return meta;
    }

    private static Long queryUserProfileId(File accountDb) {
        Object conn = null;
        try {
            conn = openSqliteConnection(accountDb.getAbsolutePath());
            execSql(conn, "PRAGMA busy_timeout = 2000");
            Object stmt = prepareSql(conn, "SELECT id FROM user_profile WHERE is_active = 1 LIMIT 1");
            try {
                if (stmtStep(stmt) && !stmtIsNull(stmt, 0)) {
                    return stmtGetLong(stmt, 0);
                }
            } finally {
                closeStatement(stmt);
            }
            Object fallback = prepareSql(conn, "SELECT id FROM user_profile LIMIT 1");
            try {
                if (stmtStep(fallback) && !stmtIsNull(fallback, 0)) {
                    return stmtGetLong(fallback, 0);
                }
            } finally {
                closeStatement(fallback);
            }
        } catch (Throwable ignored) {
            return null;
        } finally {
            closeSqliteConnection(conn);
        }
        return null;
    }

    // =========================================================================
    // 15. Utilidades de ZIP, arquivos, SHA-256, UI e reinicialização
    // =========================================================================

    private static void extractAndValidateBackupZip(File zipFile, File destDir) throws IOException {
        String destCanonical = destDir.getCanonicalPath() + File.separator;
        long totalExtracted = 0L;
        int entryCount = 0;

        try (ZipInputStream zis = new ZipInputStream(new BufferedInputStream(new FileInputStream(zipFile)))) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                entryCount++;
                if (entryCount > MAX_ZIP_ENTRIES) {
                    throw new IOException("ZIP archive has too many entries");
                }
                if (entry.isDirectory()) {
                    zis.closeEntry();
                    continue;
                }
                String name = entry.getName();
                if (!isAllowedBackupZipEntry(name)) {
                    throw new IOException("Disallowed entry in backup archive: " + name);
                }
                File outFile = new File(destDir, name);
                if (!outFile.getCanonicalPath().startsWith(destCanonical)) {
                    throw new IOException("Unsafe path in ZIP archive");
                }
                File parent = outFile.getParentFile();
                if (parent != null) {
                    ensureDir(parent);
                }
                try (OutputStream out = new BufferedOutputStream(new FileOutputStream(outFile))) {
                    byte[] buf = new byte[16384];
                    int read;
                    while ((read = zis.read(buf)) != -1) {
                        totalExtracted += read;
                        if (totalExtracted > MAX_ZIP_BYTES) {
                            throw new IOException("Backup archive exceeds size limit");
                        }
                        out.write(buf, 0, read);
                    }
                }
                zis.closeEntry();
            }
        }
        if (!new File(destDir, "manifest.json").isFile()) {
            throw new IOException(t(
                "Arquivo ZIP não contém manifest.json de backup local.",
                "ZIP file does not contain a local backup manifest.json."
            ));
        }
    }

    private static boolean isAllowedBackupZipEntry(String name) {
        if ("manifest.json".equals(name) || "settings/local-reminders.json".equals(name)) {
            return true;
        }
        if (name.startsWith("dbs/")) {
            String dbName = name.substring(4);
            return !dbName.contains("/") && !dbName.contains("\\") && USER_DB_MAP.containsKey(dbName);
        }
        return false;
    }

    private static boolean isZipFile(File file) throws IOException {
        if (file.length() < 4L) {
            return false;
        }
        byte[] magic = new byte[4];
        try (InputStream in = new FileInputStream(file)) {
            if (in.read(magic) < 4) {
                return false;
            }
        }
        return magic[0] == 0x50 && magic[1] == 0x4B && magic[2] == 0x03 && magic[3] == 0x04;
    }

    private static void extractCsvFromArchiveZip(File zipFile, File destCsv) throws IOException {
        long extracted = 0L;
        boolean found = false;
        try (ZipInputStream zis = new ZipInputStream(new BufferedInputStream(new FileInputStream(zipFile)))) {
            ZipEntry entry;
            while ((entry = zis.getNextEntry()) != null) {
                if (!entry.isDirectory() && entry.getName().toLowerCase(Locale.ROOT).endsWith(".csv")) {
                    try (OutputStream out = new BufferedOutputStream(new FileOutputStream(destCsv))) {
                        byte[] buf = new byte[16384];
                        int read;
                        while ((read = zis.read(buf)) != -1) {
                            extracted += read;
                            if (extracted > MAX_CSV_BYTES) {
                                throw new IOException("CSV inside ZIP exceeds size limit");
                            }
                            out.write(buf, 0, read);
                        }
                    }
                    found = true;
                    zis.closeEntry();
                    break;
                }
                zis.closeEntry();
            }
        }
        if (!found) {
            throw new IOException(t(
                "Nenhum arquivo .csv encontrado dentro do ZIP.",
                "No .csv file found inside the selected ZIP."
            ));
        }
    }

    private static void writeZipBytes(ZipOutputStream zos, String entryName, byte[] data) throws IOException {
        ZipEntry entry = new ZipEntry(entryName);
        zos.putNextEntry(entry);
        zos.write(data);
        zos.closeEntry();
    }

    private static void writeZipFile(ZipOutputStream zos, String entryName, File file) throws IOException {
        ZipEntry entry = new ZipEntry(entryName);
        zos.putNextEntry(entry);
        try (InputStream in = new BufferedInputStream(new FileInputStream(file))) {
            copyStream(in, zos);
        }
        zos.closeEntry();
    }

    private static void copyUriToFile(Context ctx, Uri uri, File dest, long maxBytes) throws IOException {
        long total = 0L;
        try (InputStream in = ctx.getContentResolver().openInputStream(uri);
             OutputStream out = new BufferedOutputStream(new FileOutputStream(dest))) {
            if (in == null) {
                throw new IOException("ContentResolver returned null InputStream");
            }
            byte[] buf = new byte[16384];
            int read;
            while ((read = in.read(buf)) != -1) {
                total += read;
                if (total > maxBytes) {
                    throw new IOException("Selected file exceeds maximum allowed size");
                }
                out.write(buf, 0, read);
            }
        }
    }

    private static void copyStream(InputStream in, OutputStream out) throws IOException {
        byte[] buf = new byte[16384];
        int read;
        while ((read = in.read(buf)) != -1) {
            out.write(buf, 0, read);
        }
    }

    private static void copyFile(File src, File dst) throws IOException {
        try (InputStream in = new BufferedInputStream(new FileInputStream(src));
             OutputStream out = new BufferedOutputStream(new FileOutputStream(dst))) {
            copyStream(in, out);
        }
    }

    private static void moveOrCopyFile(File src, File dst) throws IOException {
        if (src.renameTo(dst)) {
            return;
        }
        copyFile(src, dst);
        //noinspection ResultOfMethodCallIgnored
        src.delete();
    }

    private static void deleteSqliteWithSidecars(File baseDb) {
        for (String suffix : SQLITE_SIDECARS) {
            File f = new File(baseDb.getAbsolutePath() + suffix);
            if (f.exists()) {
                //noinspection ResultOfMethodCallIgnored
                f.delete();
            }
        }
    }

    private static File getBackupRoot(Context ctx) {
        File base = ctx.getNoBackupFilesDir();
        if (base == null) {
            base = ctx.getFilesDir();
        }
        return new File(base, DIR_ROOT);
    }

    private static void ensureDir(File dir) throws IOException {
        if (dir.isDirectory()) {
            return;
        }
        if (!dir.mkdirs() && !dir.isDirectory()) {
            throw new IOException("Could not create directory: " + dir.getAbsolutePath());
        }
    }

    private static void deleteRecursively(File target) {
        if (target == null || !target.exists()) {
            return;
        }
        if (target.isDirectory()) {
            File[] children = target.listFiles();
            if (children != null) {
                for (File child : children) {
                    deleteRecursively(child);
                }
            }
        }
        //noinspection ResultOfMethodCallIgnored
        target.delete();
    }

    private static String readTextFile(File file) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (InputStream in = new BufferedInputStream(new FileInputStream(file))) {
            copyStream(in, out);
        }
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }

    private static void writeTextFileAtomic(File dest, String text) throws IOException {
        File parent = dest.getParentFile();
        if (parent != null) {
            ensureDir(parent);
        }
        File tmp = new File(dest.getAbsolutePath() + ".tmp");
        try (OutputStream out = new BufferedOutputStream(new FileOutputStream(tmp))) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
            out.flush();
        }
        if (dest.exists()) {
            //noinspection ResultOfMethodCallIgnored
            dest.delete();
        }
        if (!tmp.renameTo(dest)) {
            copyFile(tmp, dest);
            //noinspection ResultOfMethodCallIgnored
            tmp.delete();
        }
    }

    private static void saveLastResult(File root, String title, String message) {
        try {
            JSONObject obj = new JSONObject();
            obj.put("title", title);
            obj.put("message", message);
            writeTextFileAtomic(new File(root, FILE_LAST_RESULT), obj.toString(2));
        } catch (Throwable ignored) {}
    }

    private static String sha256Hex(File file) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        try (InputStream in = new BufferedInputStream(new FileInputStream(file))) {
            byte[] buf = new byte[16384];
            int read;
            while ((read = in.read(buf)) != -1) {
                md.update(buf, 0, read);
            }
        }
        return bytesToHex(md.digest());
    }

    private static String sha256Hex(byte[] data) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return bytesToHex(md.digest(data));
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte b : bytes) {
            int v = b & 0xFF;
            if (v < 0x10) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(v));
        }
        return sb.toString();
    }

    private static String nowUtcString() {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        fmt.setTimeZone(TimeZone.getTimeZone("UTC"));
        return fmt.format(new Date());
    }

    private static String getVersionName(Context ctx) {
        try {
            PackageInfo info = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0);
            return info.versionName != null ? info.versionName : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    @SuppressWarnings("deprecation")
    private static long getVersionCode(Context ctx) {
        try {
            PackageInfo info = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0);
            if (Build.VERSION.SDK_INT >= 28) {
                return info.getLongVersionCode();
            }
            return info.versionCode;
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    private static void restartApp(Activity activity) {
        Context app = activity.getApplicationContext();
        Intent launch = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
        if (launch != null && launch.getComponent() != null) {
            Intent restart = Intent.makeRestartActivityTask(launch.getComponent());
            restart.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            app.startActivity(restart);
        }
        activity.finishAffinity();
        Runtime.getRuntime().exit(0);
    }

    private static void toastOnMain(final String message) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                Context ctx = rootActivityRef.get();
                if (ctx == null) {
                    ctx = appContext;
                }
                if (ctx != null) {
                    Toast.makeText(ctx, message, Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    private static void showInfoDialogOnMain(final String title, final String message) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                Activity activity = rootActivityRef.get();
                if (activity != null && !activity.isFinishing()) {
                    showStyledAlertDialog(activity, title, message, "OK", null, null, null);
                } else {
                    toastOnMain(title + ": " + message);
                }
            }
        });
    }

    private static final class MenuOption {
        final String title;
        final String subtitle;
        final boolean danger;
        final Runnable action;

        MenuOption(String title, String subtitle, boolean danger, Runnable action) {
            this.title = title;
            this.subtitle = subtitle;
            this.danger = danger;
            this.action = action;
        }
    }

    private static boolean isDarkMode(Context ctx) {
        int mode = ctx.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    private static int dp(Context ctx, int value) {
        return Math.round(value * ctx.getResources().getDisplayMetrics().density);
    }

    private static LinearLayout createDialogCard(Activity activity, String title, boolean dark) {
        int bgColor = dark ? 0xFF1F2328 : 0xFFFFFFFF;
        int titleColor = dark ? 0xFFF3F4F6 : 0xFF14171A;

        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(bgColor);
        cardBg.setCornerRadius(dp(activity, 20));

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(cardBg);
        root.setPadding(dp(activity, 20), dp(activity, 20), dp(activity, 20), dp(activity, 14));

        TextView titleView = new TextView(activity);
        titleView.setText(title);
        titleView.setTextColor(titleColor);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
        titleView.setTypeface(Typeface.DEFAULT_BOLD);
        titleView.setPadding(dp(activity, 4), 0, dp(activity, 4), dp(activity, 12));
        root.addView(titleView);

        return root;
    }

    private static TextView createActionButton(
        Activity activity,
        String label,
        int textColor,
        boolean bold,
        View.OnClickListener listener
    ) {
        TextView btn = new TextView(activity);
        btn.setText(label);
        btn.setTextColor(textColor);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        btn.setTypeface(bold ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
        btn.setPadding(dp(activity, 14), dp(activity, 10), dp(activity, 14), dp(activity, 10));
        btn.setClickable(true);
        btn.setFocusable(true);
        TypedValue outValue = new TypedValue();
        if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, outValue, true)) {
            btn.setBackgroundResource(outValue.resourceId);
        }
        btn.setOnClickListener(listener);
        return btn;
    }

    private static void showStyledMenuDialog(
        Activity activity,
        String title,
        List<MenuOption> options,
        String closeLabel
    ) {
        boolean dark = isDarkMode(activity);
        int itemTitleColor = dark ? 0xFFF3F4F6 : 0xFF14171A;
        int itemSubColor = dark ? 0xFF9CA3AF : 0xFF5F6368;
        int dividerColor = dark ? 0x26FFFFFF : 0x1A000000;
        int dangerColor = dark ? 0xFFF87171 : 0xFFD93025;
        int cancelColor = dark ? 0xFFB0B8C4 : 0xFF5F6368;

        LinearLayout card = createDialogCard(activity, title, dark);

        final Dialog dialog = createCardDialog(activity, card);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);

        for (int i = 0; i < options.size(); i++) {
            final MenuOption opt = options.get(i);
            if (i > 0) {
                View div = new View(activity);
                div.setBackgroundColor(dividerColor);
                LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(activity, 1))
                );
                divLp.setMargins(dp(activity, 4), 0, dp(activity, 4), 0);
                list.addView(div, divLp);
            }

            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(dp(activity, 8), dp(activity, 13), dp(activity, 8), dp(activity, 13));
            row.setClickable(true);
            row.setFocusable(true);
            TypedValue ripple = new TypedValue();
            if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true)) {
                row.setBackgroundResource(ripple.resourceId);
            }
            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    if (opt.action != null) {
                        opt.action.run();
                    }
                }
            });

            TextView tView = new TextView(activity);
            tView.setText(opt.title);
            tView.setTextColor(opt.danger ? dangerColor : itemTitleColor);
            tView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            tView.setTypeface(Typeface.DEFAULT_BOLD);
            row.addView(tView);

            if (opt.subtitle != null && !opt.subtitle.isEmpty()) {
                TextView sView = new TextView(activity);
                sView.setText(opt.subtitle);
                sView.setTextColor(itemSubColor);
                sView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                sView.setPadding(0, dp(activity, 2), 0, 0);
                row.addView(sView);
            }

            list.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        scroll.addView(list);
        card.addView(scroll, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        LinearLayout footer = new LinearLayout(activity);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, dp(activity, 10), 0, 0);
        footer.addView(createActionButton(activity, closeLabel, cancelColor, true, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        }));
        card.addView(footer, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        showCardDialogWindow(activity, dialog);
    }

    private static void showStyledAlertDialog(
        Activity activity,
        String title,
        String message,
        String positiveLabel,
        final Runnable onPositive,
        String negativeLabel,
        final Runnable onNegative
    ) {
        boolean dark = isDarkMode(activity);
        int bodyColor = dark ? 0xFFD1D5DB : 0xFF3C4043;
        int accentColor = dark ? 0xFF34D399 : 0xFF0F9D58;
        int cancelColor = dark ? 0xFFB0B8C4 : 0xFF5F6368;

        LinearLayout card = createDialogCard(activity, title, dark);

        final Dialog dialog = createCardDialog(activity, card);

        ScrollView scroll = new ScrollView(activity);
        TextView msgView = new TextView(activity);
        msgView.setText(message);
        msgView.setTextColor(bodyColor);
        msgView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        msgView.setLineSpacing(dp(activity, 2), 1.0f);
        msgView.setPadding(dp(activity, 4), 0, dp(activity, 4), dp(activity, 8));
        scroll.addView(msgView);

        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f
        );
        card.addView(scroll, scrollLp);

        LinearLayout footer = new LinearLayout(activity);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, dp(activity, 12), 0, 0);

        if (negativeLabel != null && !negativeLabel.isEmpty()) {
            footer.addView(createActionButton(activity, negativeLabel, cancelColor, false, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    if (onNegative != null) {
                        onNegative.run();
                    }
                }
            }));
        }

        if (positiveLabel != null && !positiveLabel.isEmpty()) {
            footer.addView(createActionButton(activity, positiveLabel, accentColor, true, new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                    if (onPositive != null) {
                        onPositive.run();
                    }
                }
            }));
        }

        card.addView(footer, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        showCardDialogWindow(activity, dialog);
    }

    private static Dialog createCardDialog(Activity activity, View cardView) {
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(cardView);
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        return dialog;
    }

    private static void showCardDialogWindow(Activity activity, Dialog dialog) {
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            int targetWidth = Math.min((int) (screenWidth * 0.90f), dp(activity, 420));
            window.setLayout(targetWidth, ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private static boolean isPortuguese() {
        return "pt".equalsIgnoreCase(Locale.getDefault().getLanguage());
    }

    private static String t(String pt, String en) {
        return isPortuguese() ? pt : en;
    }

    private static String safeErrorMessage(Throwable t) {
        if (t == null) {
            return "Unknown error";
        }
        String msg = t.getMessage();
        if (msg != null && !msg.trim().isEmpty()) {
            return msg;
        }
        return t.getClass().getSimpleName();
    }
}
