.class public final Lcom/tencent/open/utils/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private a:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/tencent/open/utils/o;->a:J

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()[B
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/tencent/open/utils/o;->a:J

    .line 2
    .line 3
    const-wide/16 v2, 0xff

    .line 4
    .line 5
    and-long/2addr v2, v0

    .line 6
    long-to-int p0, v2

    .line 7
    int-to-byte p0, p0

    .line 8
    const-wide/32 v2, 0xff00

    .line 9
    .line 10
    .line 11
    and-long/2addr v2, v0

    .line 12
    const/16 v4, 0x8

    .line 13
    .line 14
    shr-long/2addr v2, v4

    .line 15
    long-to-int v2, v2

    .line 16
    int-to-byte v2, v2

    .line 17
    const-wide/32 v3, 0xff0000

    .line 18
    .line 19
    .line 20
    and-long/2addr v3, v0

    .line 21
    const/16 v5, 0x10

    .line 22
    .line 23
    shr-long/2addr v3, v5

    .line 24
    long-to-int v3, v3

    .line 25
    int-to-byte v3, v3

    .line 26
    const-wide v4, 0xff000000L

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    and-long/2addr v0, v4

    .line 32
    const/16 v4, 0x18

    .line 33
    .line 34
    shr-long/2addr v0, v4

    .line 35
    long-to-int v0, v0

    .line 36
    int-to-byte v0, v0

    .line 37
    const/4 v1, 0x4

    .line 38
    new-array v1, v1, [B

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    aput-byte p0, v1, v4

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    aput-byte v2, v1, p0

    .line 45
    .line 46
    const/4 p0, 0x2

    .line 47
    aput-byte v3, v1, p0

    .line 48
    .line 49
    const/4 p0, 0x3

    .line 50
    aput-byte v0, v1, p0

    .line 51
    .line 52
    return-object v1
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/open/utils/o;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    instance-of v1, p1, Lcom/tencent/open/utils/o;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-wide v1, p0, Lcom/tencent/open/utils/o;->a:J

    .line 10
    .line 11
    check-cast p1, Lcom/tencent/open/utils/o;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/tencent/open/utils/o;->b()J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    cmp-long p0, v1, p0

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/open/utils/o;->a:J

    .line 2
    .line 3
    long-to-int p0, v0

    .line 4
    return p0
.end method
