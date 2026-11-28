.class public final Le/e/a/Dev115;
.super Ljava/lang/Object;
.source "Dev115.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Dev115$Count;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final VIDEO:Ljava/util/regex/Pattern;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    .line 16
    new-instance v0, Le/e/a/Dev115$7;

    invoke-direct {v0}, Le/e/a/Dev115$7;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/Dev115;->WORK:Ljava/util/concurrent/ExecutorService;

    .line 17
    const-string v0, "^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/Dev115;->VIDEO:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static afterFullscreenRestore(Landroid/view/View;)V
    .registers 4
    .param p0, "root"    # Landroid/view/View;

    .line 150
    if-nez p0, :cond_0

    return-void

    .line 151
    :cond_0
    new-instance v0, Le/e/a/Dev115$4;

    invoke-direct {v0, p0}, Le/e/a/Dev115$4;-><init>(Landroid/view/View;)V

    .line 159
    .local v0, "fix":Ljava/lang/Runnable;
    const-wide/16 v1, 0x28

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 160
    const-wide/16 v1, 0xf0

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 161
    return-void
.end method

.method public static cacheSettings(Landroid/preference/PreferenceActivity;)V
    .registers 5
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 44
    const-string v0, "cache_all_delete"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .local v0, "option":Landroid/preference/Preference;
    if-nez v0, :cond_0

    return-void

    .line 45
    :cond_0
    const-string v1, "Delete cached videos in the current folder"

    const-string v2, "\u522a\u9664\u76ee\u524d\u5132\u5b58\u4f4d\u7f6e\u7684\u5f71\u7247\u5feb\u53d6"

    const-string/jumbo v3, "\u73fe\u5728\u306e\u4fdd\u5b58\u5148\u306b\u3042\u308b\u52d5\u753b\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3059"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 48
    new-instance v1, Le/e/a/Dev115$9;

    invoke-direct {v1, p0}, Le/e/a/Dev115$9;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 58
    return-void
.end method

.method private static confirm(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V
    .registers 8
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "root"    # Ljava/lang/String;
    .param p2, "found"    # Le/e/a/Dev115$Count;

    .line 60
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 61
    :cond_0
    iget v0, p2, Le/e/a/Dev115$Count;->files:I

    if-nez v0, :cond_1

    const-string v0, "No cached videos found."

    const-string/jumbo v1, "\u6c92\u6709\u5f71\u7247\u5feb\u53d6\u3002"

    const-string v2, "\u524a\u9664\u3059\u308b\u52d5\u753b\u30ad\u30e3\u30c3\u30b7\u30e5\u306f\u3042\u308a\u307e\u305b\u3093\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    .line 62
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p2, Le/e/a/Dev115$Count;->videos:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " videos"

    const-string v2, " \u90e8\u5f71\u7247"

    const-string v3, "\u52d5\u753b"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p2, Le/e/a/Dev115$Count;->files:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 63
    const-string v2, "\u30d5\u30a1\u30a4\u30eb"

    const-string v3, " files"

    const-string v4, " \u500b\u6a94\u6848"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p2, Le/e/a/Dev115$Count;->bytes:J

    invoke-static {v1, v2}, Le/e/a/Dev115;->fmt(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 64
    const-string/jumbo v1, "\u73fe\u5728\u306e\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3060\u3051\u3092\u524a\u9664\u3057\u307e\u3059\u3002\u65e7\u4fdd\u5b58\u5148\u3001MP4\u3001\u8a2d\u5b9a\u3084\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306f\u524a\u9664\u3057\u307e\u305b\u3093\u3002"

    const-string v2, "Only the current cache folder will be cleared; previous folders, MP4s, settings and playlists are retained."

    const-string v3, "\u53ea\u522a\u9664\u76ee\u524d\u5feb\u53d6\u8cc7\u6599\u593e\uff0c\u4e0d\u5f71\u97ff\u820a\u4f4d\u7f6e\u3001MP4\u3001\u8a2d\u5b9a\u6216\u64ad\u653e\u6e05\u55ae\u3002"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "content":Ljava/lang/String;
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {p0}, Le/e/a/TemporaryCache221;->videoTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 68
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Cancel"

    const-string v3, "\u53d6\u6d88"

    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 69
    const-string v2, "\u524a\u9664"

    const-string v3, "Delete"

    const-string v4, "\u522a\u9664"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Le/e/a/Dev115$11;

    invoke-direct {v3, p1, p0, p2}, Le/e/a/Dev115$11;-><init>(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 78
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 67
    invoke-static {v1}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 79
    return-void

    .line 60
    .end local v0    # "content":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void
.end method

.method private static count(Ljava/lang/String;)Le/e/a/Dev115$Count;
    .registers 15
    .param p0, "root"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 29
    const-string v0, "e.e.a.CacheFile"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    move-object v2, p0

    new-array v3, v1, [Ljava/lang/Object;

    aput-object v2, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 30
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_3

    .line 31
    new-instance v3, Le/e/a/Dev115$Count;

    const/4 v5, 0x0

    invoke-direct {v3, v5}, Le/e/a/Dev115$Count;-><init>(Le/e/a/Dev115$1;)V

    .line 32
    .local v3, "result":Le/e/a/Dev115$Count;
    array-length v5, v2

    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v6, v2, v4

    .line 33
    .local v6, "f":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_0

    goto :goto_1

    .line 34
    :cond_0
    sget-object v7, Le/e/a/Dev115;->VIDEO:Ljava/util/regex/Pattern;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .local v7, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-nez v8, :cond_1

    goto :goto_1

    .line 35
    :cond_1
    iget v8, v3, Le/e/a/Dev115$Count;->files:I

    add-int/2addr v8, v1

    iput v8, v3, Le/e/a/Dev115$Count;->files:I

    iget-wide v8, v3, Le/e/a/Dev115$Count;->bytes:J

    const-wide/16 v10, 0x0

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    add-long/2addr v8, v10

    iput-wide v8, v3, Le/e/a/Dev115$Count;->bytes:J

    iget-object v8, v3, Le/e/a/Dev115$Count;->videos:Ljava/util/Set;

    invoke-virtual {v7, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 32
    .end local v6    # "f":Ljava/io/File;
    .end local v7    # "m":Ljava/util/regex/Matcher;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 37
    :cond_2
    return-object v3

    .line 30
    .end local v3    # "result":Le/e/a/Dev115$Count;
    :cond_3
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Cannot enumerate cache"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static fmt(J)Ljava/lang/String;
    .registers 7
    .param p0, "n"    # J

    .line 20
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

.method private static folder(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p0, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    const-string v0, "e.e.a.CacheFolders"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 24
    .local v0, "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "root"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 25
    .local v1, "root":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "unselected"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 26
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 25
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "No cache folder"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static info(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 6
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 41
    :cond_0
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cache deletion result"

    const-string/jumbo v2, "\u5feb\u53d6\u522a\u9664\u7d50\u679c"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u524a\u9664\u7d50\u679c"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 42
    return-void

    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$afterFullscreenRestore$13(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    :try_start_0
    invoke-static {p0}, Le/e/a/NormalVideoInsets;->schedule(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/FullscreenViewport209;->side(Landroid/view/View;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "nicoid-layout"

    const-string v1, "Normal status inset update failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method static synthetic lambda$cacheSettings$1(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V
    .registers 3
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "root"    # Ljava/lang/String;
    .param p2, "found"    # Le/e/a/Dev115$Count;

    .line 53
    invoke-static {p0, p1, p2}, Le/e/a/Dev115;->confirm(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V

    return-void
.end method

.method static synthetic lambda$cacheSettings$2(Landroid/preference/PreferenceActivity;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 54
    const-string v0, "Cannot measure cached videos."

    const-string/jumbo v1, "\u7121\u6cd5\u8a08\u7b97\u5feb\u53d6\u5bb9\u91cf\u3002"

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u5bb9\u91cf\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$cacheSettings$3(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V
    .registers 5
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "root"    # Ljava/lang/String;

    .line 53
    :try_start_0
    invoke-static {p1}, Le/e/a/Dev115;->count(Ljava/lang/String;)Le/e/a/Dev115$Count;

    move-result-object v0

    .local v0, "found":Le/e/a/Dev115$Count;
    sget-object v1, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/Dev115$13;

    invoke-direct {v2, p0, p1, v0}, Le/e/a/Dev115$13;-><init>(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    nop

    .end local v0    # "found":Le/e/a/Dev115$Count;
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/Dev115$14;

    invoke-direct {v2, p0}, Le/e/a/Dev115$14;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 55
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$cacheSettings$4(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 7
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "p"    # Landroid/preference/Preference;

    .line 50
    const/4 v0, 0x1

    :try_start_0
    invoke-static {p0}, Le/e/a/Dev115;->folder(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .local v1, "location":Ljava/lang/String;
    move-object v2, v1

    .line 52
    .local v2, "root":Ljava/lang/String;
    sget-object v3, Le/e/a/Dev115;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Le/e/a/Dev115$0;

    invoke-direct {v4, p0, v2}, Le/e/a/Dev115$0;-><init>(Landroid/preference/PreferenceActivity;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 56
    return v0

    .line 50
    .end local v1    # "location":Ljava/lang/String;
    .end local v2    # "root":Ljava/lang/String;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "Cache folder unavailable."

    const-string/jumbo v3, "\u7121\u6cd5\u5b58\u53d6\u5feb\u53d6\u8cc7\u6599\u593e\u3002"

    const-string v4, "\u30ad\u30e3\u30c3\u30b7\u30e5\u4fdd\u5b58\u5148\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002"

    invoke-static {p0, v4, v2, v3}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return v0
.end method

.method static synthetic lambda$confirm$5(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V
    .registers 3
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "root"    # Ljava/lang/String;
    .param p2, "fresh"    # Le/e/a/Dev115$Count;

    .line 75
    invoke-static {p0, p1, p2}, Le/e/a/Dev115;->remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V

    return-void
.end method

.method static synthetic lambda$confirm$6(Landroid/preference/PreferenceActivity;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 76
    const-string v0, "The cache folder or contents changed. Deletion cancelled."

    const-string/jumbo v1, "\u5feb\u53d6\u4f4d\u7f6e\u6216\u5167\u5bb9\u5df2\u8b8a\u66f4\uff0c\u53d6\u6d88\u522a\u9664\u3002"

    const-string/jumbo v2, "\u78ba\u8a8d\u5f8c\u306b\u30ad\u30e3\u30c3\u30b7\u30e5\u306e\u4fdd\u5b58\u5148\u3084\u5185\u5bb9\u304c\u5909\u308f\u3063\u305f\u305f\u3081\u3001\u524a\u9664\u3092\u4e2d\u6b62\u3057\u307e\u3057\u305f\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$confirm$7(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V
    .registers 9
    .param p0, "root"    # Ljava/lang/String;
    .param p1, "a"    # Landroid/preference/PreferenceActivity;
    .param p2, "found"    # Le/e/a/Dev115$Count;

    .line 71
    :try_start_0
    invoke-static {p1}, Le/e/a/Dev115;->folder(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 72
    invoke-static {p0}, Le/e/a/Dev115;->count(Ljava/lang/String;)Le/e/a/Dev115$Count;

    move-result-object v0

    .line 73
    .local v0, "fresh":Le/e/a/Dev115$Count;
    iget-wide v1, v0, Le/e/a/Dev115$Count;->bytes:J

    iget-wide v3, p2, Le/e/a/Dev115$Count;->bytes:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    iget v1, v0, Le/e/a/Dev115$Count;->files:I

    iget v2, p2, Le/e/a/Dev115$Count;->files:I

    if-ne v1, v2, :cond_0

    iget-object v1, v0, Le/e/a/Dev115$Count;->videos:Ljava/util/Set;

    iget-object v2, p2, Le/e/a/Dev115$Count;->videos:Ljava/util/Set;

    invoke-interface {v1, v2}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    sget-object v1, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/Dev115$2;

    invoke-direct {v2, p1, p0, v0}, Le/e/a/Dev115$2;-><init>(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 77
    nop

    .end local v0    # "fresh":Le/e/a/Dev115$Count;
    goto :goto_0

    .line 74
    .restart local v0    # "fresh":Le/e/a/Dev115$Count;
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Cache inventory changed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "root":Ljava/lang/String;
    .end local p1    # "a":Landroid/preference/PreferenceActivity;
    .end local p2    # "found":Le/e/a/Dev115$Count;
    throw v1

    .line 71
    .end local v0    # "fresh":Le/e/a/Dev115$Count;
    .restart local p0    # "root":Ljava/lang/String;
    .restart local p1    # "a":Landroid/preference/PreferenceActivity;
    .restart local p2    # "found":Le/e/a/Dev115$Count;
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cache location changed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "root":Ljava/lang/String;
    .end local p1    # "a":Landroid/preference/PreferenceActivity;
    .end local p2    # "found":Le/e/a/Dev115$Count;
    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .restart local p0    # "root":Ljava/lang/String;
    .restart local p1    # "a":Landroid/preference/PreferenceActivity;
    .restart local p2    # "found":Le/e/a/Dev115$Count;
    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/Dev115$3;

    invoke-direct {v2, p1}, Le/e/a/Dev115$3;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 78
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method static synthetic lambda$confirm$8(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;Landroid/content/DialogInterface;I)V
    .registers 7
    .param p0, "root"    # Ljava/lang/String;
    .param p1, "a"    # Landroid/preference/PreferenceActivity;
    .param p2, "found"    # Le/e/a/Dev115$Count;
    .param p3, "d"    # Landroid/content/DialogInterface;
    .param p4, "w"    # I

    .line 69
    sget-object v0, Le/e/a/Dev115;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/Dev115$10;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/Dev115$10;-><init>(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$remove$10(Landroid/preference/PreferenceActivity;)V
    .registers 4
    .param p0, "a"    # Landroid/preference/PreferenceActivity;

    .line 94
    const-string v0, "Could not remeasure cache after deletion."

    const-string/jumbo v1, "\u7121\u6cd5\u91cd\u65b0\u8a08\u7b97\u5feb\u53d6\u5bb9\u91cf\u3002"

    const-string v2, "\u524a\u9664\u5f8c\u306e\u5bb9\u91cf\u3092\u518d\u6e2c\u5b9a\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$remove$11(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V
    .registers 12
    .param p0, "root"    # Ljava/lang/String;
    .param p1, "a"    # Landroid/preference/PreferenceActivity;
    .param p2, "before"    # Le/e/a/Dev115$Count;

    .line 87
    :try_start_0
    invoke-static {p1}, Le/e/a/Dev115;->folder(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-static {p0}, Le/e/a/Dev115;->count(Ljava/lang/String;)Le/e/a/Dev115$Count;

    move-result-object v0

    .line 89
    .local v0, "after":Le/e/a/Dev115$Count;
    iget v1, p2, Le/e/a/Dev115$Count;->files:I

    iget v2, v0, Le/e/a/Dev115$Count;->files:I

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    move v6, v1

    .local v6, "files":I
    iget-object v1, p2, Le/e/a/Dev115$Count;->videos:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v3, v0, Le/e/a/Dev115$Count;->videos:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 90
    .local v5, "videos":I
    iget-wide v1, p2, Le/e/a/Dev115$Count;->bytes:J

    iget-wide v3, v0, Le/e/a/Dev115$Count;->bytes:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    .line 91
    .local v7, "bytes":J
    sget-object v1, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/Dev115$5;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object v4, p1

    .end local p1    # "a":Landroid/preference/PreferenceActivity;
    .local v4, "a":Landroid/preference/PreferenceActivity;
    :try_start_1
    invoke-direct/range {v3 .. v8}, Le/e/a/Dev115$5;-><init>(Landroid/preference/PreferenceActivity;IIJ)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 94
    nop

    .end local v0    # "after":Le/e/a/Dev115$Count;
    .end local v5    # "videos":I
    .end local v6    # "files":I
    .end local v7    # "bytes":J
    goto :goto_1

    .line 87
    .end local v4    # "a":Landroid/preference/PreferenceActivity;
    .restart local p1    # "a":Landroid/preference/PreferenceActivity;
    :cond_0
    move-object v4, p1

    .end local p1    # "a":Landroid/preference/PreferenceActivity;
    .restart local v4    # "a":Landroid/preference/PreferenceActivity;
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Cache folder changed during deletion"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "a":Landroid/preference/PreferenceActivity;
    .end local p0    # "root":Ljava/lang/String;
    .end local p2    # "before":Le/e/a/Dev115$Count;
    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 94
    .restart local v4    # "a":Landroid/preference/PreferenceActivity;
    .restart local p0    # "root":Ljava/lang/String;
    .restart local p2    # "before":Le/e/a/Dev115$Count;
    :catch_0
    move-exception v0

    move-object p1, v0

    goto :goto_0

    .end local v4    # "a":Landroid/preference/PreferenceActivity;
    .restart local p1    # "a":Landroid/preference/PreferenceActivity;
    :catch_1
    move-exception v0

    move-object v4, p1

    move-object p1, v0

    .restart local v4    # "a":Landroid/preference/PreferenceActivity;
    .local p1, "e":Ljava/lang/Exception;
    :goto_0
    sget-object v0, Le/e/a/Dev115;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/Dev115$6;

    invoke-direct {v1, v4}, Le/e/a/Dev115$6;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 95
    .end local p1    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method static synthetic lambda$remove$12(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V
    .registers 5
    .param p0, "root"    # Ljava/lang/String;
    .param p1, "a"    # Landroid/preference/PreferenceActivity;
    .param p2, "before"    # Le/e/a/Dev115$Count;

    .line 85
    sget-object v0, Le/e/a/Dev115;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/Dev115$8;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/Dev115$8;-><init>(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$remove$9(Landroid/preference/PreferenceActivity;IIJ)V
    .registers 10
    .param p0, "a"    # Landroid/preference/PreferenceActivity;
    .param p1, "videos"    # I
    .param p2, "files"    # I
    .param p3, "bytes"    # J

    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Deletion completed"

    const-string v2, "\u522a\u9664\u5b8c\u6210"

    const-string v3, "\u524a\u9664\u5b8c\u4e86"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 92
    const-string v1, "\u52d5\u753b"

    const-string v2, " videos"

    const-string v3, " \u90e8\u5f71\u7247"

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " / "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 93
    const-string v2, "\u30d5\u30a1\u30a4\u30eb"

    const-string v3, " files"

    const-string v4, " \u500b\u6a94\u6848"

    invoke-static {p0, v2, v3, v4}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p3, p4}, Le/e/a/Dev115;->fmt(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    invoke-static {p0, v0}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 16
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-cache-size"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    return-object v0
.end method

.method private static remove(Landroid/preference/PreferenceActivity;Ljava/lang/String;Le/e/a/Dev115$Count;)V
    .registers 7

    :try_start_0
    invoke-static {p0}, Le/e/a/Dev115;->folder(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Le/e/a/Dev115$12;

    invoke-direct {v0, p1, p0, p2}, Le/e/a/Dev115$12;-><init>(Ljava/lang/String;Landroid/preference/PreferenceActivity;Le/e/a/Dev115$Count;)V

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Le/e/a/CacheControl110;->removeScoped(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_0
    invoke-static {p0}, Le/e/a/Dev115;->lambda$confirm$6(Landroid/preference/PreferenceActivity;)V

    return-void

    :catch_0
    move-exception v0

    const-string v1, "Cannot start cache deletion."

    const-string/jumbo v2, "\u7121\u6cd5\u958b\u59cb\u522a\u9664\u5feb\u53d6\u3002"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u524a\u9664\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002"

    invoke-static {p0, v3, v1, v2}, Le/e/a/Dev115;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/Dev115;->info(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public static seamlessReturn(Ljava/lang/Object;)Z
    .registers 14
    .param p0, "service"    # Ljava/lang/Object;

    .line 110
    const-string v0, "nicoid-return"

    instance-of v1, p0, Landroid/app/Service;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    .line 111
    :cond_0
    const/4 v1, 0x0

    .local v1, "state":Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "restoring":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    .line 113
    .local v4, "accepted":Z
    :try_start_0
    const-string v5, "e.e.a.DirectBackground235"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 114
    .local v5, "direct":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v6, "active"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 115
    .local v6, "active":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 116
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    move-object v1, v9

    .line 117
    if-eqz v1, :cond_1

    .line 118
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "service"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 119
    .local v9, "owner":Ljava/lang/reflect/Field;
    invoke-virtual {v9, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 120
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-ne v10, p0, :cond_1

    .line 121
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "restoring"

    invoke-virtual {v10, v11}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    move-object v3, v10

    .line 122
    invoke-virtual {v3, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 123
    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    .end local v9    # "owner":Ljava/lang/reflect/Field;
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .local v9, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v9, :cond_2

    .line 130
    :try_start_2
    const-string v10, "e"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .local v10, "video":Ljava/lang/reflect/Field;
    invoke-virtual {v10, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 131
    invoke-virtual {v10, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Le/e/a/Dev139;->remember(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 132
    .end local v10    # "video":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v10

    .line 129
    :try_start_3
    invoke-virtual {v9}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v10
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v9, v10

    goto :goto_0

    .line 135
    .end local v9    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :goto_1
    goto :goto_2

    .line 133
    :catch_1
    move-exception v9

    .line 134
    .local v9, "error":Ljava/lang/Exception;
    :try_start_4
    const-string v10, "nicoid-surface"

    const-string v11, "Service output snapshot unavailable"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .end local v9    # "error":Ljava/lang/Exception;
    :goto_2
    invoke-static {}, Le/e/a/Dev140;->isNotificationDispatch()Z

    move-result v9

    if-nez v9, :cond_3

    move-object v9, p0

    check-cast v9, Landroid/app/Service;

    invoke-static {v9}, Le/e/a/Dev136;->releaseStaleReturn(Landroid/app/Service;)V

    .line 137
    :cond_3
    const-string v9, "e.e.a.PopupReturn244"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const-string v10, "start"

    new-array v11, v7, [Ljava/lang/Class;

    const-class v12, Landroid/app/Service;

    aput-object v12, v11, v2

    invoke-virtual {v9, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p0, v7, v2

    invoke-virtual {v9, v8, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 138
    .local v7, "started":Ljava/lang/Object;
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v7}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v8

    move v4, v8

    .line 139
    if-eqz v4, :cond_4

    const-string v8, "Retained decoder return accepted without Service replacement"

    invoke-static {v0, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 140
    :cond_4
    nop

    .line 145
    if-nez v4, :cond_5

    if-eqz v3, :cond_5

    if-eqz v1, :cond_5

    .line 146
    :try_start_5
    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_3

    :catch_2
    move-exception v0

    .line 140
    :cond_5
    :goto_3
    return v4

    .line 145
    .end local v5    # "direct":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "active":Ljava/lang/reflect/Field;
    .end local v7    # "started":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    goto :goto_5

    .line 141
    :catch_3
    move-exception v5

    .line 142
    .local v5, "e":Ljava/lang/Exception;
    :try_start_6
    const-string v6, "Retained decoder return not ready; current session preserved"

    invoke-static {v0, v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 143
    nop

    .line 145
    if-nez v4, :cond_6

    if-eqz v3, :cond_6

    if-eqz v1, :cond_6

    .line 146
    :try_start_7
    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    .line 143
    :cond_6
    :goto_4
    return v2

    .line 145
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_5
    if-nez v4, :cond_7

    if-eqz v3, :cond_7

    if-eqz v1, :cond_7

    .line 146
    :try_start_8
    invoke-virtual {v3, v1, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_6

    :catch_5
    move-exception v2

    .line 147
    :cond_7
    :goto_6
    throw v0
.end method

.method public static thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 6
    .param p0, "video"    # Lorg/json/JSONObject;

    .line 100
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 101
    :cond_0
    const-string v1, "thumbnail"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, "image":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "null"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    const-string v2, "thumbnail_url"

    invoke-virtual {p0, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "thumbnailUrl"

    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 103
    :cond_2
    const-string v2, "//"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 104
    :cond_3
    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "https://"

    if-eqz v2, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v4, 0x7

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 105
    :cond_4
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    move-object v0, v1

    goto :goto_0

    :cond_5
    const-string v2, "videoId"

    invoke-virtual {p0, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "j"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/String;
    .param p3, "z"    # Ljava/lang/String;

    .line 19
    invoke-static {p0, p1, p2, p3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
