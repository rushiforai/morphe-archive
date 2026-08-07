.class public final Ll/p1l0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final d:[J


# instance fields
.field public final a:[B

.field public b:I

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [J

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/p1l0;->d:[J

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 8
        0x80
        0x40
        0x20
        0x10
        0x8
        0x4
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Ll/p1l0;->a:[B

    .line 9
    .line 10
    return-void
.end method

.method public static a([BIZ)J
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-byte v0, p0, v0

    .line 3
    .line 4
    int-to-long v0, v0

    .line 5
    const-wide/16 v2, 0xff

    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    sget-object p2, Ll/p1l0;->d:[J

    .line 11
    .line 12
    add-int/lit8 v4, p1, -0x1

    .line 13
    .line 14
    aget-wide v4, p2, v4

    .line 15
    .line 16
    not-long v4, v4

    .line 17
    and-long/2addr v0, v4

    .line 18
    :cond_0
    const/4 p2, 0x1

    .line 19
    :goto_0
    if-ge p2, p1, :cond_1

    .line 20
    .line 21
    const/16 v4, 0x8

    .line 22
    .line 23
    shl-long/2addr v0, v4

    .line 24
    aget-byte v4, p0, p2

    .line 25
    .line 26
    int-to-long v4, v4

    .line 27
    and-long/2addr v4, v2

    .line 28
    or-long/2addr v0, v4

    .line 29
    add-int/lit8 p2, p2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-wide v0
.end method

.method public static c(I)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    sget-object v1, Ll/p1l0;->d:[J

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-wide v2, v1, v0

    .line 8
    .line 9
    int-to-long v4, p0

    .line 10
    and-long v1, v2, v4

    .line 11
    .line 12
    const-wide/16 v3, 0x0

    .line 13
    .line 14
    cmp-long v1, v1, v3

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 p0, -0x1

    .line 25
    return p0
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/p1l0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public d(Ll/asf;ZZI)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/p1l0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/p1l0;->a:[B

    .line 8
    .line 9
    invoke-interface {p1, v0, v1, v2, p2}, Ll/asf;->b([BIIZ)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    const-wide/16 p0, -0x1

    .line 16
    .line 17
    return-wide p0

    .line 18
    :cond_0
    iget-object p2, p0, Ll/p1l0;->a:[B

    .line 19
    .line 20
    aget-byte p2, p2, v1

    .line 21
    .line 22
    and-int/lit16 p2, p2, 0xff

    .line 23
    .line 24
    invoke-static {p2}, Ll/p1l0;->c(I)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, p0, Ll/p1l0;->c:I

    .line 29
    .line 30
    const/4 v0, -0x1

    .line 31
    if-eq p2, v0, :cond_1

    .line 32
    .line 33
    iput v2, p0, Ll/p1l0;->b:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string p0, "No valid varint length mask found"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-wide/16 p0, 0x0

    .line 42
    .line 43
    return-wide p0

    .line 44
    :cond_2
    :goto_0
    iget p2, p0, Ll/p1l0;->c:I

    .line 45
    .line 46
    if-le p2, p4, :cond_3

    .line 47
    .line 48
    iput v1, p0, Ll/p1l0;->b:I

    .line 49
    .line 50
    const-wide/16 p0, -0x2

    .line 51
    .line 52
    return-wide p0

    .line 53
    :cond_3
    if-eq p2, v2, :cond_4

    .line 54
    .line 55
    iget-object p4, p0, Ll/p1l0;->a:[B

    .line 56
    .line 57
    sub-int/2addr p2, v2

    .line 58
    invoke-interface {p1, p4, v2, p2}, Ll/asf;->readFully([BII)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iput v1, p0, Ll/p1l0;->b:I

    .line 62
    .line 63
    iget-object p1, p0, Ll/p1l0;->a:[B

    .line 64
    .line 65
    iget p0, p0, Ll/p1l0;->c:I

    .line 66
    .line 67
    invoke-static {p1, p0, p3}, Ll/p1l0;->a([BIZ)J

    .line 68
    .line 69
    .line 70
    move-result-wide p0

    .line 71
    return-wide p0
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/p1l0;->b:I

    .line 3
    .line 4
    iput v0, p0, Ll/p1l0;->c:I

    .line 5
    .line 6
    return-void
.end method
