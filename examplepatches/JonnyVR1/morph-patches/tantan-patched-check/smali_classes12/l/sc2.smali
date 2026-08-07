.class public Ll/sc2;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "BackupToSDCardHandler"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/wr4;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 5

    .line 1
    invoke-static {p1}, Ll/zie;->i(Ll/aje;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/zie;->a(Ljava/io/File;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "\u5220\u9664sd\u5361\u6587\u4ef6\uff1a"

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    new-array v3, v2, [Ljava/lang/Object;

    .line 25
    .line 26
    const-string v4, "SDKResource"

    .line 27
    .line 28
    invoke-static {v4, v1, v3}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Ll/cje;->m(Ll/ire0;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-static {p1}, Ll/zie;->c(Ll/aje;)Ljava/io/File;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-static {p1}, Ll/zie;->j(Ll/aje;)Ljava/io/File;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    :goto_0
    :try_start_0
    invoke-static {p1, v0}, Ll/mki;->a(Ljava/io/File;Ljava/io/File;)V

    .line 51
    .line 52
    .line 53
    const-string p1, "\u5907\u4efd\u5230sd\u5361\u6210\u529f"

    .line 54
    .line 55
    new-array v0, v2, [Ljava/lang/Object;

    .line 56
    .line 57
    invoke-static {v4, p1, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catch_0
    move-exception p1

    .line 62
    const/16 v0, 0xb

    .line 63
    .line 64
    invoke-virtual {p0, v0, p1}, Ll/wr4;->i(ILjava/lang/Exception;)V

    .line 65
    .line 66
    .line 67
    const-string p0, "\u5907\u4efd\u8d44\u6e90\u5230SD\u5361\u5931\u8d25"

    .line 68
    .line 69
    new-array p1, v2, [Ljava/lang/Object;

    .line 70
    .line 71
    invoke-static {v4, p0, p1}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    const/4 p0, 0x1

    .line 75
    return p0
.end method
