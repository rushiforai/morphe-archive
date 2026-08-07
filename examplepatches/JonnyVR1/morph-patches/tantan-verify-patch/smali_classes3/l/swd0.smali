.class public Ll/swd0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/io/File;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Z[Ljava/lang/String;Ljava/io/File;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    new-instance p0, Ll/rwd0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/rwd0;-><init>(Ljava/io/File;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, p0}, Ll/jyb;->s([Ljava/lang/Object;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method public static c(Landroid/content/Context;)V
    .locals 6

    .line 1
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x18

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    new-instance v1, Ljava/io/File;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string v2, "file_persistent"

    .line 31
    .line 32
    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    new-array v2, p0, [Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/swd0;->d(Ljava/io/File;[Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/io/File;

    .line 42
    .line 43
    const-string v2, "shared_prefs"

    .line 44
    .line 45
    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-array v2, p0, [Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/swd0;->d(Ljava/io/File;[Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ljava/io/File;

    .line 54
    .line 55
    const-string v2, "tantan_save_value_dir"

    .line 56
    .line 57
    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const/4 v2, 0x2

    .line 61
    new-array v3, v2, [Ljava/lang/String;

    .line 62
    .line 63
    const-string v4, "putongPref"

    .line 64
    .line 65
    aput-object v4, v3, p0

    .line 66
    .line 67
    const-string v4, "preferences"

    .line 68
    .line 69
    const/4 v5, 0x1

    .line 70
    aput-object v4, v3, v5

    .line 71
    .line 72
    invoke-static {v1, v3}, Ll/swd0;->d(Ljava/io/File;[Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Ljava/io/File;

    .line 76
    .line 77
    const-string v3, "databases"

    .line 78
    .line 79
    invoke-direct {v1, v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 v0, 0x3

    .line 83
    new-array v0, v0, [Ljava/lang/String;

    .line 84
    .line 85
    const-string v3, "global_exceptions"

    .line 86
    .line 87
    aput-object v3, v0, p0

    .line 88
    .line 89
    const-string p0, "core_v2_"

    .line 90
    .line 91
    aput-object p0, v0, v5

    .line 92
    .line 93
    const-string p0, "event_tracking"

    .line 94
    .line 95
    aput-object p0, v0, v2

    .line 96
    .line 97
    invoke-static {v1, v0}, Ll/swd0;->d(Ljava/io/File;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .line 99
    .line 100
    :catch_0
    return-void
.end method

.method public static varargs d(Ljava/io/File;[Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    array-length v0, p1

    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    :goto_0
    new-instance v1, Ll/pwd0;

    .line 28
    .line 29
    invoke-direct {v1, v0, p1}, Ll/pwd0;-><init>(Z[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    new-instance p1, Ll/qwd0;

    .line 43
    .line 44
    invoke-direct {p1}, Ll/qwd0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {p0, p1}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public static e()Lcom/p1/mobile/putong/data/SafetyModeConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "SafetyModeConfig"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/data/SafetyModeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/SafetyModeConfig;->new_()Lcom/p1/mobile/putong/data/SafetyModeConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->enable:Z

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->protectActivity:Z

    .line 28
    .line 29
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->protectEvent:Z

    .line 30
    .line 31
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->resetAppData:Z

    .line 32
    .line 33
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SafetyModeConfig;->resetUserData:Z

    .line 34
    .line 35
    :cond_0
    return-object v0
.end method
