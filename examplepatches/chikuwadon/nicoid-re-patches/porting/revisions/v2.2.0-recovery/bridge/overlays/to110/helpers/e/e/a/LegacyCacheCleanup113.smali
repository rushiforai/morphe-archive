.class public final Le/e/a/LegacyCacheCleanup113;
.super Ljava/lang/Object;
.source "LegacyCacheCleanup113.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/LegacyCacheCleanup113$Snapshot;
    }
.end annotation


# static fields
.field static final KEY:Ljava/lang/String; = "nicoid_old_cache_delete"

.field private static final MAIN:Landroid/os/Handler;

.field private static final VIDEO:Ljava/util/regex/Pattern;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 14
    const-string v0, "^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/LegacyCacheCleanup113;->VIDEO:Ljava/util/regex/Pattern;

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/LegacyCacheCleanup113;->MAIN:Landroid/os/Handler;

    .line 16
    new-instance v0, Le/e/a/LegacyCacheCleanup113$6;

    invoke-direct {v0}, Le/e/a/LegacyCacheCleanup113$6;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/LegacyCacheCleanup113;->WORK:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static busy()Z
    .registers 2

    .line 88
    :try_start_0
    const-string v0, "com.sauzask.nicoid.NicoidDownloadCache"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "v"

    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    return v0

    .line 89
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/Exception;
    const/4 v1, 0x0

    return v1
.end method

.method private static confirm(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V
    .registers 7
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "found"    # Le/e/a/LegacyCacheCleanup113$Snapshot;

    .line 108
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 109
    :cond_0
    iget-object v0, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->files:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 110
    const-string v0, "No old video cache files found."

    const-string/jumbo v1, "\u672a\u627e\u5230\u820a\u5f71\u7247\u5feb\u53d6\u3002"

    const-string v2, "\u524a\u9664\u5bfe\u8c61\u306e\u52d5\u753b\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u3042\u308a\u307e\u305b\u3093\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/LegacyCacheCleanup113;->message(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    .line 112
    return-void

    .line 114
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->videos:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " videos"

    const-string v2, " \u90e8\u5f71\u7247"

    const-string v3, "\u52d5\u753b"

    invoke-static {p0, v3, v1, v2}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->files:Ljava/util/List;

    .line 115
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " files"

    const-string v3, " \u500b\u6a94\u6848"

    const-string v4, "\u30d5\u30a1\u30a4\u30eb"

    invoke-static {p0, v4, v2, v3}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->bytes:J

    invoke-static {v1, v2}, Le/e/a/LegacyCacheCleanup113;->mb(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 116
    const-string v1, "\u4ee5\u524d\u306e\u30a2\u30d7\u30ea\u5c02\u7528\u9818\u57df\u306b\u3042\u308b\u52d5\u753b\u30ad\u30e3\u30c3\u30b7\u30e5\u3060\u3051\u3092\u524a\u9664\u3057\u307e\u3059\u3002\u73fe\u5728\u306eDownload\u30d5\u30a9\u30eb\u30c0\u3001\u8a2d\u5b9a\u3001\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306f\u524a\u9664\u3057\u307e\u305b\u3093\u3002\u524a\u9664\u5f8c\u306f\u5fa9\u5143\u3067\u304d\u307e\u305b\u3093\u3002"

    const-string v2, "Only video caches in the former app-private folder are deleted. The current Downloads folder, settings and playlists are untouched. This cannot be undone."

    const-string v3, "\u53ea\u522a\u9664\u820a\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\u7684\u5f71\u7247\u5feb\u53d6\uff0c\u4e0d\u6703\u522a\u9664\u76ee\u524d\u4e0b\u8f09\u8cc7\u6599\u593e\u3001\u8a2d\u5b9a\u6216\u64ad\u653e\u6e05\u55ae\u3002\u7121\u6cd5\u5fa9\u539f\u3002"

    invoke-static {p0, v1, v2, v3}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, "body":Ljava/lang/String;
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 121
    const-string/jumbo v2, "\u65e7\u4fdd\u5b58\u5148\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    const-string v3, "Delete previous cache files?"

    const-string/jumbo v4, "\u8981\u522a\u9664\u820a\u5feb\u53d6\u55ce\uff1f"

    invoke-static {p0, v2, v3, v4}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 123
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 124
    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v3, "Cancel"

    const-string v4, "\u53d6\u6d88"

    invoke-static {p0, v2, v3, v4}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 125
    const-string v2, "\u524a\u9664"

    const-string v3, "Delete"

    const-string v4, "\u522a\u9664"

    invoke-static {p0, v2, v3, v4}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/LegacyCacheCleanup113$8;

    invoke-direct {v3, p0, p1}, Le/e/a/LegacyCacheCleanup113$8;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 120
    invoke-static {v1}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 126
    return-void

    .line 108
    .end local v0    # "body":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void
.end method

.method private static delete(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "confirmed"    # Le/e/a/LegacyCacheCleanup113$Snapshot;

    .line 128
    sget-object v0, Le/e/a/LegacyCacheCleanup113;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/LegacyCacheCleanup113$5;

    invoke-direct {v1, p0, p1}, Le/e/a/LegacyCacheCleanup113$5;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 154
    return-void
.end method

.method static findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;
    .registers 6
    .param p0, "group"    # Landroid/preference/PreferenceGroup;
    .param p1, "child"    # Landroid/preference/Preference;

    .line 21
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_1

    .line 22
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 23
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 24
    .local v2, "p":Landroid/preference/Preference;
    if-ne v2, p1, :cond_1

    return-object p0

    .line 25
    :cond_1
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_2

    .line 26
    move-object v3, v2

    check-cast v3, Landroid/preference/PreferenceGroup;

    invoke-static {v3, p1}, Le/e/a/LegacyCacheCleanup113;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v3

    .line 27
    .local v3, "found":Landroid/preference/PreferenceGroup;
    if-eqz v3, :cond_2

    return-object v3

    .line 22
    .end local v2    # "p":Landroid/preference/Preference;
    .end local v3    # "found":Landroid/preference/PreferenceGroup;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 30
    .end local v1    # "i":I
    :cond_3
    return-object v0

    .line 21
    :cond_4
    :goto_1
    return-object v0
.end method

.method private static inspect(Landroid/preference/PreferenceActivity;)V
    .registers 3
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 97
    sget-object v0, Le/e/a/LegacyCacheCleanup113;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/LegacyCacheCleanup113$7;

    invoke-direct {v1, p0}, Le/e/a/LegacyCacheCleanup113$7;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 106
    return-void
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 7
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 33
    const-string v0, "nicoid_old_cache_delete"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_0

    return-void

    .line 34
    :cond_0
    const-string v1, "cache_all_delete"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 35
    .local v1, "existing":Landroid/preference/Preference;
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    invoke-static {v2, v1}, Le/e/a/LegacyCacheCleanup113;->findParent(Landroid/preference/PreferenceGroup;Landroid/preference/Preference;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    .line 36
    .local v2, "group":Landroid/preference/PreferenceGroup;
    if-nez v2, :cond_1

    .line 37
    const-string v3, "nicoid_debug_category"

    invoke-virtual {p0, v3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 38
    .local v3, "debug":Landroid/preference/Preference;
    instance-of v4, v3, Landroid/preference/PreferenceGroup;

    if-eqz v4, :cond_1

    move-object v2, v3

    check-cast v2, Landroid/preference/PreferenceGroup;

    .line 40
    .end local v3    # "debug":Landroid/preference/Preference;
    :cond_1
    if-nez v2, :cond_2

    return-void

    .line 41
    :cond_2
    new-instance v3, Landroid/preference/Preference;

    invoke-direct {v3, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 42
    .local v3, "p":Landroid/preference/Preference;
    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    .line 43
    const-string v0, "Delete previous cache location"

    const-string v4, "\u522a\u9664\u820a\u5feb\u53d6\u4f4d\u7f6e"

    const-string/jumbo v5, "\u65e7\u4fdd\u5b58\u5148\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    invoke-static {p0, v5, v0, v4}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 44
    const-string v0, "Inspect and remove video caches left in the former app-private folder."

    const-string/jumbo v4, "\u6aa2\u67e5\u4e26\u522a\u9664\u820a\u61c9\u7528\u7a0b\u5f0f\u5c08\u7528\u8cc7\u6599\u593e\u7684\u5f71\u7247\u5feb\u53d6\u3002"

    const-string v5, "\u4ee5\u524d\u306e\u30a2\u30d7\u30ea\u5c02\u7528\u30d5\u30a9\u30eb\u30c0\u306b\u6b8b\u308b\u52d5\u753b\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u78ba\u8a8d\u3057\u3066\u524a\u9664\u3057\u307e\u3059\u3002"

    invoke-static {p0, v5, v0, v4}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 47
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    const v4, 0x7ffffffe

    if-ge v0, v4, :cond_3

    invoke-virtual {v1}, Landroid/preference/Preference;->getOrder()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setOrder(I)V

    .line 48
    :cond_3
    invoke-virtual {v2, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 49
    new-instance v0, Le/e/a/LegacyCacheCleanup113$0;

    invoke-direct {v0, p0}, Le/e/a/LegacyCacheCleanup113$0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 50
    return-void
.end method

.method static synthetic lambda$confirm$5(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;Landroid/content/DialogInterface;I)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "found"    # Le/e/a/LegacyCacheCleanup113$Snapshot;
    .param p2, "d"    # Landroid/content/DialogInterface;
    .param p3, "w"    # I

    .line 125
    invoke-static {p0, p1}, Le/e/a/LegacyCacheCleanup113;->delete(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V

    return-void
.end method

.method static synthetic lambda$delete$6(Landroid/preference/PreferenceActivity;IJI)V
    .registers 10
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "ok"    # I
    .param p2, "bytes"    # J
    .param p4, "errors"    # I

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " files deleted."

    const-string v2, " \u500b\u6a94\u6848\u5df2\u522a\u9664\u3002"

    const-string v3, "\u30d5\u30a1\u30a4\u30eb\u524a\u9664\u3057\u307e\u3057\u305f\u3002"

    invoke-static {p0, v3, v1, v2}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 146
    invoke-static {p2, p3}, Le/e/a/LegacyCacheCleanup113;->mb(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-lez p4, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Failed"

    const-string v3, "\u5931\u6557"

    const-string v4, "\u524a\u9664\u5931\u6557"

    invoke-static {p0, v4, v2, v3}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 145
    invoke-static {p0, v0}, Le/e/a/LegacyCacheCleanup113;->message(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$delete$7(Landroid/preference/PreferenceActivity;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 148
    const-string v0, "Deletion stopped. Make sure no cache acquisition is running, then retry."

    const-string v1, "\u522a\u9664\u5df2\u505c\u6b62\u3002\u8acb\u78ba\u8a8d\u672a\u5728\u4e0b\u8f09\u5feb\u53d6\u5f8c\u91cd\u8a66\u3002"

    const-string v2, "\u524a\u9664\u3092\u4e2d\u6b62\u3057\u307e\u3057\u305f\u3002\u53d6\u5f97\u4e2d\u306e\u52d5\u753b\u304c\u306a\u3044\u3053\u3068\u3092\u78ba\u8a8d\u3057\u3001\u518d\u5ea6\u5b9f\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/LegacyCacheCleanup113;->message(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$delete$8(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V
    .registers 15
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "confirmed"    # Le/e/a/LegacyCacheCleanup113$Snapshot;

    .line 130
    :try_start_0
    invoke-static {}, Le/e/a/LegacyCacheCleanup113;->busy()Z

    move-result v0

    if-nez v0, :cond_6

    .line 131
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/LegacyCacheCleanup113;->scan(Landroid/content/Context;)Le/e/a/LegacyCacheCleanup113$Snapshot;

    move-result-object v0

    .line 132
    .local v0, "now":Le/e/a/LegacyCacheCleanup113$Snapshot;
    iget-wide v1, v0, Le/e/a/LegacyCacheCleanup113$Snapshot;->bytes:J

    iget-wide v3, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->bytes:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_5

    iget-object v1, v0, Le/e/a/LegacyCacheCleanup113$Snapshot;->files:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->files:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v1, v2, :cond_5

    iget-object v1, v0, Le/e/a/LegacyCacheCleanup113$Snapshot;->videos:Ljava/util/Set;

    iget-object v2, p1, Le/e/a/LegacyCacheCleanup113$Snapshot;->videos:Ljava/util/Set;

    .line 133
    invoke-interface {v1, v2}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 135
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/LegacyCacheCleanup113;->root(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 136
    .local v1, "dir":Ljava/io/File;
    const-wide/16 v2, 0x0

    .local v2, "freed":J
    const/4 v4, 0x0

    .local v4, "deleted":I
    const/4 v5, 0x0

    .line 137
    .local v5, "failed":I
    iget-object v6, v0, Le/e/a/LegacyCacheCleanup113$Snapshot;->files:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v7, :cond_3

    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    .line 138
    .local v7, "f":Ljava/io/File;
    sget-object v8, Le/e/a/LegacyCacheCleanup113;->VIDEO:Ljava/util/regex/Pattern;

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 139
    invoke-virtual {v7}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    goto :goto_2

    .line 140
    :cond_0
    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v8

    .line 141
    .local v8, "size":J
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    move-result v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v10, :cond_1

    add-long/2addr v2, v8

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 142
    .end local v7    # "f":Ljava/io/File;
    .end local v8    # "size":J
    :goto_1
    goto :goto_0

    .line 139
    .restart local v7    # "f":Ljava/io/File;
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 147
    .end local v0    # "now":Le/e/a/LegacyCacheCleanup113$Snapshot;
    .end local v1    # "dir":Ljava/io/File;
    .end local v2    # "freed":J
    .end local v4    # "deleted":I
    .end local v5    # "failed":I
    .end local v7    # "f":Ljava/io/File;
    :catch_0
    move-exception v0

    move-object v7, p0

    goto :goto_4

    .line 143
    .restart local v0    # "now":Le/e/a/LegacyCacheCleanup113$Snapshot;
    .restart local v1    # "dir":Ljava/io/File;
    .restart local v2    # "freed":J
    .restart local v4    # "deleted":I
    .restart local v5    # "failed":I
    :cond_3
    move v8, v4

    .local v8, "ok":I
    move v11, v5

    .line 144
    .local v11, "errors":I
    move-wide v9, v2

    .line 145
    .local v9, "bytes":J
    :try_start_2
    sget-object v12, Le/e/a/LegacyCacheCleanup113;->MAIN:Landroid/os/Handler;

    new-instance v6, Le/e/a/LegacyCacheCleanup113$1;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-object v7, p0

    .end local p0    # "a":Landroid/preference/PreferenceActivity;
    .local v7, "a":Landroid/preference/PreferenceActivity;
    :try_start_3
    invoke-direct/range {v6 .. v11}, Le/e/a/LegacyCacheCleanup113$1;-><init>(Landroid/preference/PreferenceActivity;IJI)V

    invoke-virtual {v12, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 152
    nop

    .end local v0    # "now":Le/e/a/LegacyCacheCleanup113$Snapshot;
    .end local v1    # "dir":Ljava/io/File;
    .end local v2    # "freed":J
    .end local v4    # "deleted":I
    .end local v5    # "failed":I
    .end local v8    # "ok":I
    .end local v9    # "bytes":J
    .end local v11    # "errors":I
    goto :goto_5

    .line 133
    .end local v7    # "a":Landroid/preference/PreferenceActivity;
    .restart local v0    # "now":Le/e/a/LegacyCacheCleanup113$Snapshot;
    .restart local p0    # "a":Landroid/preference/PreferenceActivity;
    :cond_4
    move-object v7, p0

    .end local p0    # "a":Landroid/preference/PreferenceActivity;
    .restart local v7    # "a":Landroid/preference/PreferenceActivity;
    goto :goto_3

    .line 132
    .end local v7    # "a":Landroid/preference/PreferenceActivity;
    .restart local p0    # "a":Landroid/preference/PreferenceActivity;
    :cond_5
    move-object v7, p0

    .line 134
    .end local p0    # "a":Landroid/preference/PreferenceActivity;
    .restart local v7    # "a":Landroid/preference/PreferenceActivity;
    :goto_3
    new-instance p0, Ljava/io/IOException;

    const-string v1, "Legacy cache changed after confirmation"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v7    # "a":Landroid/preference/PreferenceActivity;
    .end local p1    # "confirmed":Le/e/a/LegacyCacheCleanup113$Snapshot;
    throw p0

    .line 130
    .end local v0    # "now":Le/e/a/LegacyCacheCleanup113$Snapshot;
    .restart local p0    # "a":Landroid/preference/PreferenceActivity;
    .restart local p1    # "confirmed":Le/e/a/LegacyCacheCleanup113$Snapshot;
    :cond_6
    move-object v7, p0

    .end local p0    # "a":Landroid/preference/PreferenceActivity;
    .restart local v7    # "a":Landroid/preference/PreferenceActivity;
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Cache acquisition active"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v7    # "a":Landroid/preference/PreferenceActivity;
    .end local p1    # "confirmed":Le/e/a/LegacyCacheCleanup113$Snapshot;
    throw p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 147
    .restart local v7    # "a":Landroid/preference/PreferenceActivity;
    .restart local p1    # "confirmed":Le/e/a/LegacyCacheCleanup113$Snapshot;
    :catch_1
    move-exception v0

    goto :goto_4

    .end local v7    # "a":Landroid/preference/PreferenceActivity;
    .restart local p0    # "a":Landroid/preference/PreferenceActivity;
    :catch_2
    move-exception v0

    move-object v7, p0

    .line 148
    .end local p0    # "a":Landroid/preference/PreferenceActivity;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v7    # "a":Landroid/preference/PreferenceActivity;
    :goto_4
    sget-object p0, Le/e/a/LegacyCacheCleanup113;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/LegacyCacheCleanup113$2;

    invoke-direct {v1, v7}, Le/e/a/LegacyCacheCleanup113$2;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 153
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_5
    return-void
.end method

.method static synthetic lambda$inspect$2(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V
    .registers 2
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "found"    # Le/e/a/LegacyCacheCleanup113$Snapshot;

    .line 100
    invoke-static {p0, p1}, Le/e/a/LegacyCacheCleanup113;->confirm(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V

    return-void
.end method

.method static synthetic lambda$inspect$3(Landroid/preference/PreferenceActivity;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 102
    const-string v0, "Cannot inspect the previous cache location."

    const-string/jumbo v1, "\u7121\u6cd5\u6aa2\u67e5\u820a\u5feb\u53d6\u4f4d\u7f6e\u3002"

    const-string/jumbo v2, "\u65e7\u4fdd\u5b58\u5148\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/LegacyCacheCleanup113;->message(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$inspect$4(Landroid/preference/PreferenceActivity;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 99
    :try_start_0
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/LegacyCacheCleanup113;->scan(Landroid/content/Context;)Le/e/a/LegacyCacheCleanup113$Snapshot;

    move-result-object v0

    .line 100
    .local v0, "found":Le/e/a/LegacyCacheCleanup113$Snapshot;
    sget-object v1, Le/e/a/LegacyCacheCleanup113;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/LegacyCacheCleanup113$3;

    invoke-direct {v2, p0, v0}, Le/e/a/LegacyCacheCleanup113$3;-><init>(Landroid/preference/PreferenceActivity;Le/e/a/LegacyCacheCleanup113$Snapshot;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    nop

    .end local v0    # "found":Le/e/a/LegacyCacheCleanup113$Snapshot;
    goto :goto_0

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Le/e/a/LegacyCacheCleanup113;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/LegacyCacheCleanup113$4;

    invoke-direct {v2, p0}, Le/e/a/LegacyCacheCleanup113$4;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 105
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$install$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 3
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "item"    # Landroid/preference/Preference;

    .line 49
    invoke-static {p0}, Le/e/a/LegacyCacheCleanup113;->inspect(Landroid/preference/PreferenceActivity;)V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 16
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-legacy-cache-clean"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object v0
.end method

.method private static mb(J)Ljava/lang/String;
    .registers 7
    .param p0, "b"    # J

    .line 86
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    long-to-double v1, p0

    const-wide v3, 0x412e848000000000L    # 1000000.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "%.2f MB"

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static message(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V
    .registers 6
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "body"    # Ljava/lang/String;

    .line 92
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 93
    :cond_0
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Previous cache location"

    const-string/jumbo v2, "\u820a\u5feb\u53d6\u4f4d\u7f6e"

    const-string/jumbo v3, "\u65e7\u4fdd\u5b58\u5148\u306e\u30ad\u30e3\u30c3\u30b7\u30e5"

    invoke-static {p0, v3, v1, v2}, Le/e/a/LegacyCacheCleanup113;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 94
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 93
    invoke-static {v0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 95
    return-void

    .line 92
    :cond_1
    :goto_0
    return-void
.end method

.method private static root(Landroid/content/Context;)Ljava/io/File;
    .registers 7
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 55
    .local v0, "base":Ljava/io/File;
    if-eqz v0, :cond_1

    .line 56
    invoke-virtual {v0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    .line 57
    .local v1, "canonicalBase":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "nicoid/nicoid_cache"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 58
    .local v2, "expected":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v3

    .line 59
    .local v3, "canonicalRoot":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 61
    return-object v3

    .line 60
    :cond_0
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Legacy directory symlink refused"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 55
    .end local v1    # "canonicalBase":Ljava/io/File;
    .end local v2    # "expected":Ljava/io/File;
    .end local v3    # "canonicalRoot":Ljava/io/File;
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "App files location unavailable"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static scan(Landroid/content/Context;)Le/e/a/LegacyCacheCleanup113$Snapshot;
    .registers 9
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    invoke-static {p0}, Le/e/a/LegacyCacheCleanup113;->root(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 73
    .local v0, "dir":Ljava/io/File;
    new-instance v1, Le/e/a/LegacyCacheCleanup113$Snapshot;

    invoke-direct {v1}, Le/e/a/LegacyCacheCleanup113$Snapshot;-><init>()V

    .line 74
    .local v1, "out":Le/e/a/LegacyCacheCleanup113$Snapshot;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    .line 75
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 76
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 77
    .local v2, "children":[Ljava/io/File;
    if-eqz v2, :cond_5

    .line 78
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_4

    aget-object v5, v2, v4

    .line 79
    .local v5, "f":Ljava/io/File;
    sget-object v6, Le/e/a/LegacyCacheCleanup113;->VIDEO:Ljava/util/regex/Pattern;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 80
    .local v6, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_1

    goto :goto_1

    .line 81
    :cond_1
    invoke-virtual {v5}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {v1, v5, v6}, Le/e/a/LegacyCacheCleanup113$Snapshot;->add(Ljava/io/File;Ljava/util/regex/Matcher;)V

    .line 78
    .end local v5    # "f":Ljava/io/File;
    .end local v6    # "m":Ljava/util/regex/Matcher;
    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 84
    :cond_4
    return-object v1

    .line 77
    :cond_5
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Cannot enumerate old cache"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 75
    .end local v2    # "children":[Ljava/io/File;
    :cond_6
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Legacy location is not a directory"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;
    .param p3, "zh"    # Ljava/lang/String;

    .line 19
    invoke-static {p0, p1, p2, p3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
