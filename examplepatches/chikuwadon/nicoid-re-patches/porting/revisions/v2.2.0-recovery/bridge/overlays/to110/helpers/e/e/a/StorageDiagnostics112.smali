.class public final Le/e/a/StorageDiagnostics112;
.super Ljava/lang/Object;
.source "StorageDiagnostics112.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/StorageDiagnostics112$Inventory;,
        Le/e/a/StorageDiagnostics112$Top;,
        Le/e/a/StorageDiagnostics112$Stat;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final MAX_ENTRIES:I = 0x30d40

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 35
    new-instance v0, Le/e/a/StorageDiagnostics112$6;

    invoke-direct {v0}, Le/e/a/StorageDiagnostics112$6;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/StorageDiagnostics112;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/StorageDiagnostics112;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 34
    invoke-static {p0}, Le/e/a/StorageDiagnostics112;->fileType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static diagnose(Landroid/app/Activity;)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;

    .line 133
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 134
    const-string v1, "\u30b9\u30c8\u30ec\u30fc\u30b8\u8a3a\u65ad"

    const-string v2, "Storage diagnostics"

    const-string v3, "\u5132\u5b58\u7a7a\u9593\u8a3a\u65b7"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 135
    const-string v1, "\u5bb9\u91cf\u3092\u96c6\u8a08\u3057\u3066\u3044\u307e\u3059\u2026"

    const-string v2, "Counting files\u2026"

    const-string/jumbo v3, "\u6b63\u5728\u8a08\u7b97\u6a94\u6848\u2026"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 136
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 137
    .local v0, "progress":Landroid/app/AlertDialog;
    invoke-static {v0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 138
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 139
    .local v1, "context":Landroid/content/Context;
    sget-object v2, Le/e/a/StorageDiagnostics112;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Le/e/a/StorageDiagnostics112$2;

    invoke-direct {v3, v1, v0, p0}, Le/e/a/StorageDiagnostics112$2;-><init>(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/app/Activity;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 168
    return-void
.end method

.method private static fileType(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .line 74
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 75
    .local v0, "dot":I
    if-ltz v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    const/16 v2, 0x9

    if-le v1, v2, :cond_0

    goto :goto_1

    .line 76
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "suffix":Ljava/lang/String;
    const-string v2, "\\.[a-z0-9]{1,8}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v2, v1

    goto :goto_0

    :cond_1
    const-string v2, "[other]"

    :goto_0
    return-object v2

    .line 75
    .end local v1    # "suffix":Ljava/lang/String;
    :cond_2
    :goto_1
    const-string v1, "[no extension]"

    return-object v1
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 6
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;

    .line 46
    :try_start_0
    const-string v0, "e.e.a.PatchVersion237"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 47
    .local v0, "v":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "value"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "version":Ljava/lang/String;
    const-string v2, "-dev."

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v2, :cond_0

    return-void

    .line 49
    .end local v0    # "v":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "version":Ljava/lang/String;
    :cond_0
    nop

    .line 50
    const-string v0, "nicoid_storage_diagnostic"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_1

    return-void

    .line 51
    :cond_1
    const-string v1, "nicoid_debug_category"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 52
    .local v1, "group":Landroid/preference/Preference;
    instance-of v2, v1, Landroid/preference/PreferenceGroup;

    if-nez v2, :cond_2

    return-void

    .line 53
    :cond_2
    new-instance v2, Landroid/preference/Preference;

    invoke-direct {v2, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 54
    .local v2, "p":Landroid/preference/Preference;
    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 55
    const-string v0, "Storage diagnostics"

    const-string v3, "\u5132\u5b58\u7a7a\u9593\u8a3a\u65b7"

    const-string v4, "\u30b9\u30c8\u30ec\u30fc\u30b8\u8a3a\u65ad"

    invoke-static {p0, v4, v0, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 56
    const-string v0, "Measure folder sizes and file counts, then save a TXT report without file contents."

    const-string/jumbo v3, "\u6e2c\u91cf\u8cc7\u6599\u593e\u5927\u5c0f\u8207\u6a94\u6848\u6578\uff0c\u5132\u5b58\u70baTXT\uff0c\u4e0d\u8f38\u51fa\u6a94\u6848\u5167\u5bb9\u3002"

    const-string v4, "\u30a2\u30d7\u30ea\u5185\u306e\u30d5\u30a9\u30eb\u30c0\u5225\u5bb9\u91cf\u3068\u30d5\u30a1\u30a4\u30eb\u6570\u3092\u8abf\u67fb\u3057\u3001\u7d50\u679c\u3092TXT\u3067\u4fdd\u5b58\u3057\u307e\u3059\u3002\u30c7\u30fc\u30bf\u306e\u5185\u5bb9\u306f\u51fa\u529b\u3057\u307e\u305b\u3093\u3002"

    invoke-static {p0, v4, v0, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 60
    move-object v0, v1

    check-cast v0, Landroid/preference/PreferenceGroup;

    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 61
    new-instance v0, Le/e/a/StorageDiagnostics112$5;

    invoke-direct {v0, p0}, Le/e/a/StorageDiagnostics112$5;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v2, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 62
    return-void

    .line 49
    .end local v1    # "group":Landroid/preference/Preference;
    .end local v2    # "p":Landroid/preference/Preference;
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    return-void
.end method

.method static synthetic lambda$diagnose$2(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "report"    # Ljava/lang/String;

    .line 164
    invoke-static {p0, p1, p2}, Le/e/a/StorageDiagnostics112;->save(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$diagnose$3(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "report"    # Ljava/lang/String;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .line 164
    sget-object v0, Le/e/a/StorageDiagnostics112;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/StorageDiagnostics112$4;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/StorageDiagnostics112$4;-><init>(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$diagnose$4(Landroid/app/AlertDialog;Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;)V
    .registers 9
    .param p0, "progress"    # Landroid/app/AlertDialog;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "report"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;

    .line 156
    invoke-virtual {p0}, Landroid/app/AlertDialog;->dismiss()V

    .line 157
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 158
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1388

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p2, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, p2

    .line 159
    .local v0, "preview":Ljava/lang/String;
    :goto_0
    invoke-static {p1}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 160
    const-string v2, "\u30b9\u30c8\u30ec\u30fc\u30b8\u8a3a\u65ad\u7d50\u679c"

    const-string v3, "Storage scan results"

    const-string v4, "\u5132\u5b58\u7a7a\u9593\u8a3a\u65b7\u7d50\u679c"

    invoke-static {p1, v2, v3, v4}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 161
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 162
    const-string/jumbo v2, "\u9589\u3058\u308b"

    const-string v3, "Close"

    const-string/jumbo v4, "\u95dc\u9589"

    invoke-static {p1, v2, v3, v4}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 163
    const-string v2, "TXT\u3067\u4fdd\u5b58"

    const-string v3, "Save TXT"

    const-string v4, "\u5132\u5b58TXT"

    invoke-static {p1, v2, v3, v4}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/StorageDiagnostics112$1;

    invoke-direct {v3, p3, p1, p2}, Le/e/a/StorageDiagnostics112$1;-><init>(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 165
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 159
    invoke-static {v1}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 166
    return-void

    .line 157
    .end local v0    # "preview":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void
.end method

.method static synthetic lambda$diagnose$5(Landroid/content/Context;Landroid/app/AlertDialog;Landroid/app/Activity;)V
    .registers 19
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "progress"    # Landroid/app/AlertDialog;
    .param p2, "activity"    # Landroid/app/Activity;

    .line 140
    move-object/from16 v0, p0

    new-instance v1, Le/e/a/StorageDiagnostics112$Inventory;

    invoke-direct {v1}, Le/e/a/StorageDiagnostics112$Inventory;-><init>()V

    .line 141
    .local v1, "inventory":Le/e/a/StorageDiagnostics112$Inventory;
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    .line 142
    .local v2, "directory":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 144
    .local v3, "data":Ljava/io/File;
    const-string v9, "code_cache"

    const-string v10, "no_backup"

    const-string v4, "files"

    const-string v5, "databases"

    const-string v6, "shared_prefs"

    const-string v7, "app_webview"

    const-string v8, "cache"

    filled-new-array/range {v4 .. v10}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    const/4 v7, 0x7

    if-ge v6, v7, :cond_0

    aget-object v7, v4, v6

    .line 145
    .local v7, "part":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "internal/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v3, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1, v8, v9}, Le/e/a/StorageDiagnostics112$Inventory;->scan(Ljava/lang/String;Ljava/io/File;)V

    .line 144
    .end local v7    # "part":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 146
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 147
    .local v4, "others":[Ljava/io/File;
    if-eqz v4, :cond_2

    array-length v6, v4

    :goto_1
    if-ge v5, v6, :cond_2

    aget-object v7, v4, v5

    .line 148
    .local v7, "item":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    .line 149
    .local v8, "n":Ljava/lang/String;
    const-string v14, "code_cache"

    const-string v15, "no_backup"

    const-string v9, "files"

    const-string v10, "databases"

    const-string v11, "shared_prefs"

    const-string v12, "app_webview"

    const-string v13, "cache"

    filled-new-array/range {v9 .. v15}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 150
    const-string v9, "internal/other"

    invoke-virtual {v1, v9, v7}, Le/e/a/StorageDiagnostics112$Inventory;->scan(Ljava/lang/String;Ljava/io/File;)V

    .line 147
    .end local v7    # "item":Ljava/io/File;
    .end local v8    # "n":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 152
    :cond_2
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 153
    .local v5, "external":Ljava/io/File;
    if-eqz v5, :cond_3

    const-string v6, "external/app_files"

    invoke-virtual {v1, v6, v5}, Le/e/a/StorageDiagnostics112$Inventory;->scan(Ljava/lang/String;Ljava/io/File;)V

    .line 154
    :cond_3
    invoke-virtual {v1}, Le/e/a/StorageDiagnostics112$Inventory;->report()Ljava/lang/String;

    move-result-object v6

    .line 155
    .local v6, "report":Ljava/lang/String;
    sget-object v7, Le/e/a/StorageDiagnostics112;->MAIN:Landroid/os/Handler;

    new-instance v8, Le/e/a/StorageDiagnostics112$3;

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    invoke-direct {v8, v9, v10, v6, v0}, Le/e/a/StorageDiagnostics112$3;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 167
    return-void
.end method

.method static synthetic lambda$install$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3
    .param p0, "activity"    # Landroid/preference/PreferenceActivity;
    .param p1, "option"    # Landroid/preference/Preference;

    .line 61
    invoke-static {p0}, Le/e/a/StorageDiagnostics112;->diagnose(Landroid/app/Activity;)V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$save$6(Landroid/app/Activity;Z)V
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "success"    # Z

    .line 200
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 201
    :cond_0
    nop

    .line 202
    if-eqz p1, :cond_1

    const-string/jumbo v0, "\u8a3a\u65ad\u7d50\u679c\u3092\u4fdd\u5b58\u3057\u307e\u3057\u305f"

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "\u8a3a\u65ad\u7d50\u679c\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    .line 203
    :goto_0
    if-eqz p1, :cond_2

    const-string v1, "Saved storage report"

    goto :goto_1

    :cond_2
    const-string v1, "Could not save storage report"

    .line 204
    :goto_1
    if-eqz p1, :cond_3

    const-string v2, "\u5df2\u5132\u5b58\u8a3a\u65b7\u7d50\u679c"

    goto :goto_2

    :cond_3
    const-string/jumbo v2, "\u7121\u6cd5\u5132\u5b58\u8a3a\u65b7\u7d50\u679c"

    .line 201
    :goto_2
    invoke-static {p0, v0, v1, v2}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 204
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 205
    return-void

    .line 200
    :cond_4
    :goto_3
    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 36
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-storage-diagnostic"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 37
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 38
    return-object v0
.end method

.method private static save(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;)V
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "report"    # Ljava/lang/String;

    .line 170
    const-string v0, "is_pending"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nicoid-re-storage-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMdd-HHmmss"

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".txt"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 171
    .local v1, "filename":Ljava/lang/String;
    const/4 v2, 0x0

    .line 173
    .local v2, "ok":Z
    :try_start_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v3, v4, :cond_6

    .line 174
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 175
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "_display_name"

    invoke-virtual {v3, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const-string v4, "mime_type"

    const-string v5, "text/plain"

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    const-string v4, "relative_path"

    sget-object v5, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 179
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Downloads;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .local v4, "uri":Landroid/net/Uri;
    if-eqz v4, :cond_5

    .line 182
    const/4 v5, 0x0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 183
    .local v6, "out":Ljava/io/OutputStream;
    if-eqz v6, :cond_2

    .line 184
    :try_start_2
    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 185
    if-eqz v6, :cond_0

    :try_start_3
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 186
    .end local v6    # "out":Ljava/io/OutputStream;
    :cond_0
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .local v6, "ready":Landroid/content/ContentValues;
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v0, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 187
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v4, v6, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/4 v2, 0x1

    .line 188
    .end local v6    # "ready":Landroid/content/ContentValues;
    if-nez v2, :cond_1

    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, v4, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 189
    .end local v3    # "values":Landroid/content/ContentValues;
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_1
    goto :goto_2

    .line 182
    .restart local v3    # "values":Landroid/content/ContentValues;
    .restart local v4    # "uri":Landroid/net/Uri;
    .local v6, "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v0

    goto :goto_0

    .line 183
    :cond_2
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    const-string v7, "Cannot open Downloads document"

    invoke-direct {v0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "ok":Z
    .end local v3    # "values":Landroid/content/ContentValues;
    .end local v4    # "uri":Landroid/net/Uri;
    .end local v6    # "out":Ljava/io/OutputStream;
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "activity":Landroid/app/Activity;
    .end local p2    # "report":Ljava/lang/String;
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 182
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "ok":Z
    .restart local v3    # "values":Landroid/content/ContentValues;
    .restart local v4    # "uri":Landroid/net/Uri;
    .restart local v6    # "out":Ljava/io/OutputStream;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "activity":Landroid/app/Activity;
    .restart local p2    # "report":Ljava/lang/String;
    :goto_0
    if-eqz v6, :cond_3

    :try_start_6
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v7

    :try_start_7
    invoke-virtual {v0, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "ok":Z
    .end local v3    # "values":Landroid/content/ContentValues;
    .end local v4    # "uri":Landroid/net/Uri;
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "activity":Landroid/app/Activity;
    .end local p2    # "report":Ljava/lang/String;
    :cond_3
    :goto_1
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 188
    .end local v6    # "out":Ljava/io/OutputStream;
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "ok":Z
    .restart local v3    # "values":Landroid/content/ContentValues;
    .restart local v4    # "uri":Landroid/net/Uri;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "activity":Landroid/app/Activity;
    .restart local p2    # "report":Ljava/lang/String;
    :catchall_2
    move-exception v0

    if-nez v2, :cond_4

    :try_start_8
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v4, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "ok":Z
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "activity":Landroid/app/Activity;
    .end local p2    # "report":Ljava/lang/String;
    :cond_4
    throw v0

    .line 180
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "ok":Z
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "activity":Landroid/app/Activity;
    .restart local p2    # "report":Ljava/lang/String;
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v5, "Cannot create Downloads document"

    invoke-direct {v0, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "ok":Z
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "activity":Landroid/app/Activity;
    .end local p2    # "report":Ljava/lang/String;
    throw v0

    .line 190
    .end local v3    # "values":Landroid/content/ContentValues;
    .end local v4    # "uri":Landroid/net/Uri;
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "ok":Z
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "activity":Landroid/app/Activity;
    .restart local p2    # "report":Ljava/lang/String;
    :cond_6
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 191
    .local v0, "folder":Ljava/io/File;
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 192
    :cond_7
    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 193
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_9
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 194
    :try_start_a
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 195
    .end local v3    # "out":Ljava/io/OutputStream;
    const/4 v2, 0x1

    .line 197
    .end local v0    # "folder":Ljava/io/File;
    :goto_2
    goto :goto_4

    .line 192
    .restart local v0    # "folder":Ljava/io/File;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_3
    move-exception v4

    :try_start_b
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    goto :goto_3

    :catchall_4
    move-exception v5

    :try_start_c
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "ok":Z
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "activity":Landroid/app/Activity;
    .end local p2    # "report":Ljava/lang/String;
    :goto_3
    throw v4

    .line 191
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "ok":Z
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "activity":Landroid/app/Activity;
    .restart local p2    # "report":Ljava/lang/String;
    :cond_8
    new-instance v3, Ljava/io/IOException;

    const-string v4, "No app documents directory"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "ok":Z
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "activity":Landroid/app/Activity;
    .end local p2    # "report":Ljava/lang/String;
    throw v3
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    .line 197
    .end local v0    # "folder":Ljava/io/File;
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "ok":Z
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "activity":Landroid/app/Activity;
    .restart local p2    # "report":Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "nicoid-storage"

    const-string v4, "Cannot export storage report"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 198
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_4
    move v0, v2

    .line 199
    .local v0, "success":Z
    sget-object v3, Le/e/a/StorageDiagnostics112;->MAIN:Landroid/os/Handler;

    new-instance v4, Le/e/a/StorageDiagnostics112$0;

    invoke-direct {v4, p1, v0}, Le/e/a/StorageDiagnostics112$0;-><init>(Landroid/app/Activity;Z)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 206
    return-void
.end method
