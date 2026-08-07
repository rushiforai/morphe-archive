.class public Ll/szq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/szq0$a;
    }
.end annotation


# static fields
.field private static a:Ll/szq0$a;

.field private static b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/push/gp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a(I)I
    .locals 0

    .line 1
    if-lez p0, :cond_0

    .line 2
    .line 3
    add-int/lit16 p0, p0, 0x3e8

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, -0x1

    .line 7
    return p0
.end method

.method public static b(Ljava/lang/Enum;)I
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    instance-of v0, p0, Lcom/xiaomi/push/gf;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/lit16 p0, p0, 0x3e9

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    instance-of v0, p0, Lcom/xiaomi/push/gp;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    add-int/lit16 p0, p0, 0x7d1

    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    instance-of v0, p0, Lcom/xiaomi/push/ed;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    add-int/lit16 p0, p0, 0xbb9

    .line 34
    .line 35
    return p0

    .line 36
    :cond_2
    const/4 p0, -0x1

    .line 37
    return p0
.end method

.method public static c(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/push/gj;
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Lcom/xiaomi/push/gj;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/xiaomi/push/gj;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v1, "category_client_report_data"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gj;->d(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 17
    .line 18
    .line 19
    const-string v1, "push_sdk_channel"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/gj;->a(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 22
    .line 23
    .line 24
    const-wide/16 v1, 0x1

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/gj;->a(J)Lcom/xiaomi/push/gj;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->b(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/gj;->a(Z)Lcom/xiaomi/push/gj;

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/gj;->b(J)Lcom/xiaomi/push/gj;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/gj;->g(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 48
    .line 49
    .line 50
    const-string p0, "com.xiaomi.xmsf"

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/gj;->e(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/xiaomi/push/service/az;->a()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/gj;->f(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 60
    .line 61
    .line 62
    const-string p0, "quality_support"

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/gj;->c(Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public static d(Ljava/lang/String;)Lcom/xiaomi/push/gp;
    .locals 7

    .line 1
    sget-object v0, Ll/szq0;->b:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/xiaomi/push/gp;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/szq0;->b:Ljava/util/Map;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/szq0;->b:Ljava/util/Map;

    .line 18
    .line 19
    invoke-static {}, Lcom/xiaomi/push/gp;->values()[Lcom/xiaomi/push/gp;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    array-length v2, v1

    .line 24
    const/4 v3, 0x0

    .line 25
    :goto_0
    if-ge v3, v2, :cond_0

    .line 26
    .line 27
    aget-object v4, v1, v3

    .line 28
    .line 29
    sget-object v5, Ll/szq0;->b:Ljava/util/Map;

    .line 30
    .line 31
    iget-object v6, v4, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    monitor-exit v0

    .line 46
    goto :goto_2

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0

    .line 49
    :cond_1
    :goto_2
    sget-object v0, Ll/szq0;->b:Ljava/util/Map;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/xiaomi/push/gp;

    .line 60
    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_2
    sget-object p0, Lcom/xiaomi/push/gp;->a:Lcom/xiaomi/push/gp;

    .line 65
    .line 66
    return-object p0
.end method

.method public static e(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 v0, 0x3e8

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const-string p0, "E100000"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/16 v0, 0xbb8

    .line 9
    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "E100002"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const/16 v0, 0x7d0

    .line 16
    .line 17
    if-ne p0, v0, :cond_2

    .line 18
    .line 19
    const-string p0, "E100001"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const/16 v0, 0x1770

    .line 23
    .line 24
    if-ne p0, v0, :cond_3

    .line 25
    .line 26
    const-string p0, "E100003"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    const-string p0, ""

    .line 30
    .line 31
    return-object p0
.end method

.method public static f(Landroid/content/Context;)Ll/uv5;
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/xiaomi/push/gk;->aA:Lcom/xiaomi/push/gk;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/xiaomi/push/gk;->a()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v3, Lcom/xiaomi/push/gk;->aU:Lcom/xiaomi/push/gk;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/xiaomi/push/gk;->a()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v1, v3, v2}, Lcom/xiaomi/push/service/ah;->a(IZ)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object v3, Lcom/xiaomi/push/gk;->aC:Lcom/xiaomi/push/gk;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/xiaomi/push/gk;->a()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const v4, 0x15180

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-static {p0}, Lcom/xiaomi/push/service/ah;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ah;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object v5, Lcom/xiaomi/push/gk;->aB:Lcom/xiaomi/push/gk;

    .line 52
    .line 53
    invoke-virtual {v5}, Lcom/xiaomi/push/gk;->a()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    invoke-virtual {v3, v5, v4}, Lcom/xiaomi/push/service/ah;->a(II)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-static {}, Ll/uv5;->b()Ll/uv5$b;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4, v1}, Ll/uv5$b;->l(Z)Ll/uv5$b;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    int-to-long v3, v3

    .line 70
    invoke-virtual {v1, v3, v4}, Ll/uv5$b;->k(J)Ll/uv5$b;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, v0}, Ll/uv5$b;->o(Z)Ll/uv5$b;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    int-to-long v1, v2

    .line 79
    invoke-virtual {v0, v1, v2}, Ll/uv5$b;->n(J)Ll/uv5$b;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0, p0}, Ll/uv5$b;->h(Landroid/content/Context;)Ll/uv5;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public static g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Ll/y3f;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/szq0;->h(Ljava/lang/String;)Ll/y3f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p2, p0, Ll/y3f;->h:Ljava/lang/String;

    .line 6
    .line 7
    iput p3, p0, Ll/y3f;->i:I

    .line 8
    .line 9
    iput-wide p4, p0, Ll/y3f;->j:J

    .line 10
    .line 11
    iput-object p6, p0, Ll/y3f;->k:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public static h(Ljava/lang/String;)Ll/y3f;
    .locals 2

    .line 1
    new-instance v0, Ll/y3f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/y3f;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x3e8

    .line 7
    .line 8
    iput v1, v0, Ll/xrq0;->a:I

    .line 9
    .line 10
    const/16 v1, 0x3e9

    .line 11
    .line 12
    iput v1, v0, Ll/xrq0;->c:I

    .line 13
    .line 14
    iput-object p0, v0, Ll/xrq0;->b:Ljava/lang/String;

    .line 15
    .line 16
    return-object v0
.end method

.method public static i()Ll/gr60;
    .locals 2

    .line 1
    new-instance v0, Ll/gr60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gr60;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x3e8

    .line 7
    .line 8
    iput v1, v0, Ll/xrq0;->a:I

    .line 9
    .line 10
    iput v1, v0, Ll/xrq0;->c:I

    .line 11
    .line 12
    const-string v1, "P100000"

    .line 13
    .line 14
    iput-object v1, v0, Ll/xrq0;->b:Ljava/lang/String;

    .line 15
    .line 16
    return-object v0
.end method

.method public static j(Landroid/content/Context;IJJ)Ll/gr60;
    .locals 0

    .line 1
    invoke-static {}, Ll/szq0;->i()Ll/gr60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p1, p0, Ll/gr60;->h:I

    .line 6
    .line 7
    iput-wide p2, p0, Ll/gr60;->i:J

    .line 8
    .line 9
    iput-wide p4, p0, Ll/gr60;->j:J

    .line 10
    .line 11
    return-object p0
.end method

.method public static k(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/szq0;->f(Landroid/content/Context;)Ll/uv5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Ll/ga5;->d(Landroid/content/Context;Ll/uv5;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static l(Landroid/content/Context;Lcom/xiaomi/push/gj;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/szq0;->p(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/ba;->a(Landroid/content/Context;Lcom/xiaomi/push/gj;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Ll/szq0;->a:Ll/szq0$a;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {v0, p0, p1}, Ll/szq0$a;->a(Landroid/content/Context;Lcom/xiaomi/push/gj;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static m(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/szq0;->c(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/push/gj;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {v0, v1}, Lcom/xiaomi/push/service/az;->a(Lcom/xiaomi/push/gj;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-static {p0, v0}, Ll/szq0;->l(Landroid/content/Context;Lcom/xiaomi/push/gj;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    :goto_1
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static n(Landroid/content/Context;Ll/uv5;)V
    .locals 2

    .line 1
    new-instance v0, Ll/qzq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qzq0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/rzq0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/rzq0;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1, v0, v1}, Ll/ga5;->a(Landroid/content/Context;Ll/uv5;Ll/ysl;Ll/l2m;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static o(Ll/szq0$a;)V
    .locals 0

    .line 1
    sput-object p0, Ll/szq0;->a:Ll/szq0$a;

    .line 2
    .line 3
    return-void
.end method

.method public static p(Landroid/content/Context;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "com.xiaomi.xmsf"

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method
