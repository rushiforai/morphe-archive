.class public final Lcom/tencent/liteav/network/a/e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:I

.field public final d:J


# direct methods
.method public constructor <init>(Ljava/lang/String;IIJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/network/a/e;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/tencent/liteav/network/a/e;->b:I

    .line 7
    .line 8
    const/16 p1, 0x258

    .line 9
    .line 10
    if-ge p3, p1, :cond_0

    .line 11
    .line 12
    move p3, p1

    .line 13
    :cond_0
    iput p3, p0, Lcom/tencent/liteav/network/a/e;->c:I

    .line 14
    .line 15
    iput-wide p4, p0, Lcom/tencent/liteav/network/a/e;->d:J

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/tencent/liteav/network/a/e;->b:I

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    instance-of v2, p1, Lcom/tencent/liteav/network/a/e;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    check-cast p1, Lcom/tencent/liteav/network/a/e;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/tencent/liteav/network/a/e;->a:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v3, p1, Lcom/tencent/liteav/network/a/e;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    iget v2, p0, Lcom/tencent/liteav/network/a/e;->b:I

    .line 26
    .line 27
    iget v3, p1, Lcom/tencent/liteav/network/a/e;->b:I

    .line 28
    .line 29
    if-ne v2, v3, :cond_2

    .line 30
    .line 31
    iget v2, p0, Lcom/tencent/liteav/network/a/e;->c:I

    .line 32
    .line 33
    iget v3, p1, Lcom/tencent/liteav/network/a/e;->c:I

    .line 34
    .line 35
    if-ne v2, v3, :cond_2

    .line 36
    .line 37
    iget-wide v2, p0, Lcom/tencent/liteav/network/a/e;->d:J

    .line 38
    .line 39
    iget-wide p0, p1, Lcom/tencent/liteav/network/a/e;->d:J

    .line 40
    .line 41
    cmp-long p0, v2, p0

    .line 42
    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    :goto_0
    return v1
.end method
