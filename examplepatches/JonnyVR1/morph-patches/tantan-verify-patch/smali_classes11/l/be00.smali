.class public Ll/be00;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Lcom/mm/mediasdk/bean/RecorderInitConfig;


# direct methods
.method public static a()Ll/l0m;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ll/yqc0;->g(I)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/du10;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/du10;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static b()Ll/fam;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/yqc0;->g(I)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/lfl0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/lfl0;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static c(Landroid/app/Application;Lcom/mm/mediasdk/bean/RecorderInitConfig;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/be00;->d(Landroid/app/Application;Lcom/mm/mediasdk/bean/RecorderInitConfig;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static d(Landroid/app/Application;Lcom/mm/mediasdk/bean/RecorderInitConfig;Z)V
    .locals 1

    .line 1
    sput-object p1, Ll/be00;->a:Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    invoke-static {}, Ll/be00;->e()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/u1j0;->d(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/kv0;->d(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p2}, Ll/xsd0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/byx;->a()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ll/lrw;->c()Ll/tpl;

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {}, Lcom/momo/xengine/mestatistics/MEStatistics;->getInstance()Lcom/momo/xengine/mestatistics/MEStatistics;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const-string v0, "3.0.3_030502"

    .line 37
    .line 38
    invoke-static {v0}, Ll/n4g0;->a(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-interface {p2, v0}, Lcom/momo/xengine/mestatistics/MEStatistics;->setRecorderSDKVersion(I)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Ll/be00;->a:Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->b()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {p2, v0}, Lcom/momo/xengine/mestatistics/MEStatistics;->setUID(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p2, p0}, Lcom/momo/xengine/mestatistics/MEStatistics;->init(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p2}, Ll/lrw;->a()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Ll/lrw;->m(Landroid/app/Application;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;->e()Z

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-static {p0}, Lcom/mm/mediasdk/utils/NetUtil;->d(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private static e()V
    .locals 0

    .line 1
    return-void
.end method
