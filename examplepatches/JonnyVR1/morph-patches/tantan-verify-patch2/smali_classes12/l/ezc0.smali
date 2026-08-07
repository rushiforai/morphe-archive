.class public Ll/ezc0;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "RenameFileHandler"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/ezc0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/wr4;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/cje;->m(Ll/ire0;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/zie;->m(Ll/aje;)Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p1}, Ll/zie;->d(Ll/aje;)Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-static {p1}, Ll/zie;->j(Ll/aje;)Ljava/io/File;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Ll/af00;->d:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v2

    .line 27
    :try_start_0
    invoke-static {v1}, Ll/zie;->a(Ljava/io/File;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x6

    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    const-string p1, "\u5220\u9664\u7a33\u5b9a\u6587\u4ef6\u5931\u8d25"

    .line 36
    .line 37
    invoke-virtual {p0, v5, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    monitor-exit v2

    .line 41
    return v4

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    const-string p0, "SDKResource"

    .line 51
    .line 52
    const-string v0, "%s: \u5b8c\u6210\u8d44\u6e90\u4e0b\u8f7d"

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/aje;->b()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p0, v0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    monitor-exit v2

    .line 67
    return p0

    .line 68
    :cond_2
    const-string p1, "\u4fdd\u5b58\u7a33\u5b9a\u6587\u4ef6\u5931\u8d25"

    .line 69
    .line 70
    invoke-virtual {p0, v5, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    monitor-exit v2

    .line 74
    return v4

    .line 75
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    throw p0
.end method
