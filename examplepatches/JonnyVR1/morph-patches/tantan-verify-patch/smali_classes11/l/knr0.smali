.class public final Ll/knr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/hnr0;

.field public final b:I

.field public final c:[J

.field public final d:[I

.field public final e:I

.field public final f:[J

.field public final g:[I

.field public final h:J


# direct methods
.method public constructor <init>(Ll/hnr0;[J[II[J[IJ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p3

    .line 5
    array-length v1, p5

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    move v0, v3

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 14
    .line 15
    .line 16
    array-length v0, p2

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    move v4, v3

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move v4, v2

    .line 22
    :goto_1
    invoke-static {v4}, Ll/lev0;->d(Z)V

    .line 23
    .line 24
    .line 25
    array-length v4, p6

    .line 26
    if-ne v4, v1, :cond_2

    .line 27
    .line 28
    move v2, v3

    .line 29
    :cond_2
    invoke-static {v2}, Ll/lev0;->d(Z)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/knr0;->a:Ll/hnr0;

    .line 33
    .line 34
    iput-object p2, p0, Ll/knr0;->c:[J

    .line 35
    .line 36
    iput-object p3, p0, Ll/knr0;->d:[I

    .line 37
    .line 38
    iput p4, p0, Ll/knr0;->e:I

    .line 39
    .line 40
    iput-object p5, p0, Ll/knr0;->f:[J

    .line 41
    .line 42
    iput-object p6, p0, Ll/knr0;->g:[I

    .line 43
    .line 44
    iput-wide p7, p0, Ll/knr0;->h:J

    .line 45
    .line 46
    iput v0, p0, Ll/knr0;->b:I

    .line 47
    .line 48
    if-lez v4, :cond_3

    .line 49
    .line 50
    add-int/lit8 v4, v4, -0x1

    .line 51
    .line 52
    aget p0, p6, v4

    .line 53
    .line 54
    const/high16 p1, 0x20000000

    .line 55
    .line 56
    or-int/2addr p0, p1

    .line 57
    aput p0, p6, v4

    .line 58
    .line 59
    :cond_3
    return-void
.end method


# virtual methods
.method public final a(J)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/knr0;->f:[J

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v0, p1, p2, v2, v1}, Ll/mpw0;->r([JJZZ)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    :goto_0
    if-ltz p1, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Ll/knr0;->g:[I

    .line 12
    .line 13
    aget p2, p2, p1

    .line 14
    .line 15
    and-int/2addr p2, v2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    return p1

    .line 19
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, -0x1

    .line 23
    return p0
.end method

.method public final b(J)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/knr0;->f:[J

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-static {v0, p1, p2, v2, v1}, Ll/mpw0;->p([JJZZ)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    :goto_0
    iget-object p2, p0, Ll/knr0;->f:[J

    .line 10
    .line 11
    array-length p2, p2

    .line 12
    if-ge p1, p2, :cond_1

    .line 13
    .line 14
    iget-object p2, p0, Ll/knr0;->g:[I

    .line 15
    .line 16
    aget p2, p2, p1

    .line 17
    .line 18
    and-int/2addr p2, v2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    return p1

    .line 22
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, -0x1

    .line 26
    return p0
.end method
