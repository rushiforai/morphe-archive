.class public Lcom/tencent/liteav/network/g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/network/g$a;
    }
.end annotation


# instance fields
.field private final a:I

.field private final b:I

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:I

.field private f:Ljava/lang/String;

.field private g:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    iput v0, p0, Lcom/tencent/liteav/network/g;->a:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/tencent/liteav/network/g;->b:I

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->d:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput v1, p0, Lcom/tencent/liteav/network/g;->e:I

    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->f:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    new-instance v0, Landroid/os/Handler;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->g:Landroid/os/Handler;

    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/g;I)I
    .locals 0

    .line 91
    iput p1, p0, Lcom/tencent/liteav/network/g;->e:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/g;)J
    .locals 2

    .line 87
    invoke-direct {p0}, Lcom/tencent/liteav/network/g;->e()J

    move-result-wide v0

    return-wide v0
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/g;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/tencent/liteav/network/g;->c:Ljava/lang/String;

    return-object p1
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    if-eqz p1, :cond_3

    .line 97
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_3

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_1

    .line 98
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 99
    const-string p1, "[?&]"

    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 100
    array-length p2, p1

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p2, :cond_2

    aget-object v2, p1, v1

    .line 101
    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    .line 102
    const-string v3, "[=]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 103
    array-length v3, v2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 104
    aget-object v3, v2, v0

    const/4 v4, 0x1

    .line 105
    aget-object v2, v2, v4

    if-eqz v3, :cond_1

    .line 106
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 107
    invoke-virtual {v3, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    return-object v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 108
    :cond_2
    const-string p0, ""

    return-object p0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/network/g$a;)V
    .locals 9

    .line 95
    new-instance v0, Lcom/tencent/liteav/network/g$2;

    const-string v2, "getRTMPAccUrl"

    move-object v1, p0

    move-object v6, p1

    move-object v3, p2

    move-object v5, p3

    move-object v4, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/tencent/liteav/network/g$2;-><init>(Lcom/tencent/liteav/network/g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/network/g$a;)V

    .line 96
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/network/g;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 89
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/network/g;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 p0, 0x0

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 92
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    if-eqz p3, :cond_0

    .line 93
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    if-eqz p4, :cond_0

    .line 94
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    return v0

    :cond_0
    return p0

    :cond_1
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    if-eqz p4, :cond_2

    return v0

    :cond_2
    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/network/g;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/network/g;->g:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/network/g;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/network/g;->d:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/network/g;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/g;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method private e()J
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/liteav/basic/d/c;->a()Lcom/tencent/liteav/basic/d/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "Network"

    .line 6
    .line 7
    const-string v1, "AccRetryCountWithoutSecret"

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/d/c;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method


# virtual methods
.method public a(Ljava/lang/String;ILcom/tencent/liteav/network/g$a;)I
    .locals 9

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->d:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Lcom/tencent/liteav/network/g;->e:I

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/network/g;->f:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p1, :cond_4

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getStreamIDByStreamUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    if-eqz v3, :cond_3

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string v0, "bizid"

    .line 35
    .line 36
    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/network/g;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    const-string v0, "txSecret"

    .line 41
    .line 42
    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/network/g;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    const-string v0, "txTime"

    .line 47
    .line 48
    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/network/g;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    const/4 p1, 0x1

    .line 53
    invoke-direct {p0, p1, v4, v6, v5}, Lcom/tencent/liteav/network/g;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    const/4 p0, -0x3

    .line 60
    return p0

    .line 61
    :cond_2
    new-instance v2, Lcom/tencent/liteav/network/g$1;

    .line 62
    .line 63
    move-object v8, p3

    .line 64
    move-object v7, v6

    .line 65
    move-object v6, v5

    .line 66
    move-object v5, v4

    .line 67
    move-object v4, v3

    .line 68
    move-object v3, p0

    .line 69
    invoke-direct/range {v2 .. v8}, Lcom/tencent/liteav/network/g$1;-><init>(Lcom/tencent/liteav/network/g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/liteav/network/g$a;)V

    .line 70
    .line 71
    .line 72
    move-object v8, v2

    .line 73
    move-object v2, v3

    .line 74
    move-object v3, v4

    .line 75
    move-object v4, v5

    .line 76
    move-object v5, v6

    .line 77
    move-object v6, v7

    .line 78
    move v7, p2

    .line 79
    invoke-direct/range {v2 .. v8}, Lcom/tencent/liteav/network/g;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/network/g$a;)V

    .line 80
    .line 81
    .line 82
    return v1

    .line 83
    :cond_3
    :goto_0
    const/4 p0, -0x2

    .line 84
    return p0

    .line 85
    :cond_4
    :goto_1
    const/4 p0, -0x1

    .line 86
    return p0
.end method

.method public a()Ljava/lang/String;
    .locals 0

    .line 90
    iget-object p0, p0, Lcom/tencent/liteav/network/g;->c:Ljava/lang/String;

    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/network/g;->d:Ljava/lang/String;

    return-object p0
.end method

.method public c()I
    .locals 0

    .line 4
    iget p0, p0, Lcom/tencent/liteav/network/g;->e:I

    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/network/g;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
