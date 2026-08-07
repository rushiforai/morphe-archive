.class public Ll/m9l0;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "VerifySignHandler"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/m9l0;-><init>(Ljava/lang/String;)V

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
    .locals 7

    .line 1
    const-string v0, "Event_Resource_Verify"

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/aje;->d()Ll/ire0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p1}, Ll/zie;->d(Ll/aje;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/btd0;->e(Ljava/io/File;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    const/16 v4, 0xa

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    :try_start_0
    invoke-virtual {v1}, Ll/ire0;->f()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 29
    :try_start_1
    const-string v5, "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVl7RSe3IiaSjhyCQzxZLbsBv4OAogEQMYz/FR28eFkNStxFCWn4H063ava2518kuTqh+KCqTwB+5ZAGhnwjUGiM1kgLsMFHwczyxeqYLUYQ1/nZMYuRax5NHUOcryueKu4Q00oHpDca5LPFZUFrL0KVPsgygrMs2S3K3a9nvZQwIDAQAB"

    .line 30
    .line 31
    const-string v6, "UTF-8"

    .line 32
    .line 33
    invoke-static {p1, v1, v5, v6}, Ll/tic0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    const/4 v6, 0x1

    .line 38
    invoke-static {v0, v6, v2}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    if-nez v5, :cond_0

    .line 42
    .line 43
    const-string v6, "verify sign error"

    .line 44
    .line 45
    invoke-virtual {p0, v4, v6}, Ll/wr4;->h(ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 46
    .line 47
    .line 48
    return v5

    .line 49
    :catch_0
    move-exception v5

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    return v5

    .line 52
    :catch_1
    move-exception v5

    .line 53
    move-object v1, v2

    .line 54
    :goto_0
    const-string v6, "SDKResource"

    .line 55
    .line 56
    invoke-static {v6, v5}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v3, v2}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v4, v5}, Ll/wr4;->i(ILjava/lang/Exception;)V

    .line 63
    .line 64
    .line 65
    const-string v0, "local: %s, server: %s"

    .line 66
    .line 67
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    const-string p1, "\u6587\u4ef6SHA1\u503c\u4e3a\u7a7a\uff0c\u53ef\u80fd\u6587\u4ef6\u4e0b\u8f7d\u5931\u8d25"

    .line 80
    .line 81
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    return v3
.end method
