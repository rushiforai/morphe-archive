.class public Lcom/tencent/liteav/j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/j$a;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/j;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/liteav/j;->b:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Lcom/tencent/liteav/j;->c:I

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/j;->d:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/j;->e:Ljava/lang/String;

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    iput-wide v0, p0, Lcom/tencent/liteav/j;->f:J

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/j;I)I
    .locals 0

    .line 83
    iput p1, p0, Lcom/tencent/liteav/j;->c:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/j;J)J
    .locals 0

    .line 79
    iput-wide p1, p0, Lcom/tencent/liteav/j;->f:J

    return-wide p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/j;)Ljava/lang/String;
    .locals 0

    .line 80
    iget-object p0, p0, Lcom/tencent/liteav/j;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/tencent/liteav/j;->b:Ljava/lang/String;

    return-object p1
.end method

.method private a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 88
    const-string p0, "#EXT-TX-TS-START-TIME"

    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 89
    const-string p0, "#EXT-TX-TS-START-TIME:"

    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    add-int/lit8 p0, p0, 0x16

    if-lez p0, :cond_0

    .line 90
    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 91
    const-string p1, "#"

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 92
    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string p1, "\r\n"

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/j;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/j;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/j;->a:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic c(Lcom/tencent/liteav/j;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/j;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/j;->e:Ljava/lang/String;

    return-object p1
.end method

.method public static synthetic d(Lcom/tencent/liteav/j;)Ljava/lang/String;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/tencent/liteav/j;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic d(Lcom/tencent/liteav/j;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/j;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/liteav/j;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/j;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/tencent/liteav/j;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/j;->f:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/j$a;)I
    .locals 6

    if-eqz p1, :cond_2

    .line 84
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 85
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getAppID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/liteav/j;->d:Ljava/lang/String;

    .line 86
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, -0x2

    return p0

    .line 87
    :cond_1
    new-instance v0, Lcom/tencent/liteav/j$1;

    move-object v1, p0

    move-object v4, p1

    move-object v3, p2

    move v2, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/tencent/liteav/j$1;-><init>(Lcom/tencent/liteav/j;ILjava/lang/String;Ljava/lang/String;Lcom/tencent/liteav/j$a;)V

    invoke-static {v0}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V

    const/4 p0, 0x0

    return p0

    :cond_2
    :goto_0
    const/4 p0, -0x1

    return p0
.end method

.method public a()J
    .locals 4

    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/tencent/liteav/j;->f:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public a(J)Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    const-string v1, "yyyyMMddHHmmss"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/util/Date;

    .line 9
    .line 10
    iget-wide v2, p0, Lcom/tencent/liteav/j;->f:J

    .line 11
    .line 12
    const-wide/16 v4, 0x3e8

    .line 13
    .line 14
    mul-long v6, p1, v4

    .line 15
    .line 16
    add-long/2addr v2, v6

    .line 17
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v1, p0, Lcom/tencent/liteav/j;->c:I

    .line 25
    .line 26
    if-gez v1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iget-wide v2, p0, Lcom/tencent/liteav/j;->f:J

    .line 33
    .line 34
    sub-long/2addr v0, v2

    .line 35
    sub-long/2addr v0, p1

    .line 36
    div-long/2addr v0, v4

    .line 37
    iget-object p1, p0, Lcom/tencent/liteav/j;->a:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p2, p0, Lcom/tencent/liteav/j;->e:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/tencent/liteav/j;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {p1, p2, p0, v0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "http://%s/timeshift/%s/%s/timeshift.m3u8?delay=%d"

    .line 52
    .line 53
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/j;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object v1, p0, Lcom/tencent/liteav/j;->b:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/tencent/liteav/j;->d:Ljava/lang/String;

    .line 67
    .line 68
    filled-new-array {p1, p2, v1, v0, p0}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "http://%s/%s/%s/timeshift.m3u8?starttime=%s&appid=%s&txKbps=0"

    .line 73
    .line 74
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method
