.class public final Ll/nxw$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nxw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:[Ljava/lang/String;

.field public final c:[I

.field public final d:[Ll/ffj0;

.field public final e:[I

.field public final f:[[[I

.field public final g:Ll/ffj0;


# direct methods
.method public constructor <init>([Ljava/lang/String;[I[Ll/ffj0;[I[[[ILl/ffj0;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nxw$a;->b:[Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nxw$a;->c:[I

    .line 7
    .line 8
    iput-object p3, p0, Ll/nxw$a;->d:[Ll/ffj0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/nxw$a;->f:[[[I

    .line 11
    .line 12
    iput-object p4, p0, Ll/nxw$a;->e:[I

    .line 13
    .line 14
    iput-object p6, p0, Ll/nxw$a;->g:Ll/ffj0;

    .line 15
    .line 16
    array-length p1, p2

    .line 17
    iput p1, p0, Ll/nxw$a;->a:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(IIZ)I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nxw$a;->d:[Ll/ffj0;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Ll/dfj0;->a:I

    .line 10
    .line 11
    new-array v1, v0, [I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    :goto_0
    if-ge v2, v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, v2}, Ll/nxw$a;->g(III)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/4 v5, 0x4

    .line 22
    if-eq v4, v5, :cond_0

    .line 23
    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    if-ne v4, v5, :cond_1

    .line 28
    .line 29
    :cond_0
    add-int/lit8 v4, v3, 0x1

    .line 30
    .line 31
    aput v2, v1, v3

    .line 32
    .line 33
    move v3, v4

    .line 34
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([II)[I

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p0, p1, p2, p3}, Ll/nxw$a;->b(II[I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public b(II[I)I
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x10

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v1

    .line 6
    move-object v4, v2

    .line 7
    move v1, v0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    array-length v5, p3

    .line 10
    if-ge v0, v5, :cond_1

    .line 11
    .line 12
    aget v5, p3, v0

    .line 13
    .line 14
    iget-object v6, p0, Ll/nxw$a;->d:[Ll/ffj0;

    .line 15
    .line 16
    aget-object v6, v6, p1

    .line 17
    .line 18
    invoke-virtual {v6, p2}, Ll/ffj0;->b(I)Ll/dfj0;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    invoke-virtual {v6, v5}, Ll/dfj0;->c(I)Lcom/google/android/exoplayer2/k;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    iget-object v5, v5, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 27
    .line 28
    add-int/lit8 v6, v2, 0x1

    .line 29
    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    move-object v4, v5

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-static {v4, v5}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    xor-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    or-int/2addr v1, v2

    .line 41
    :goto_1
    iget-object v2, p0, Ll/nxw$a;->f:[[[I

    .line 42
    .line 43
    aget-object v2, v2, p1

    .line 44
    .line 45
    aget-object v2, v2, p2

    .line 46
    .line 47
    aget v2, v2, v0

    .line 48
    .line 49
    invoke-static {v2}, Lcom/google/android/exoplayer2/y;->e(I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    move v2, v6

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Ll/nxw$a;->e:[I

    .line 64
    .line 65
    aget p0, p0, p1

    .line 66
    .line 67
    invoke-static {v3, p0}, Ljava/lang/Math;->min(II)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    return p0

    .line 72
    :cond_2
    return v3
.end method

.method public c(III)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxw$a;->f:[[[I

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    aget-object p0, p0, p2

    .line 6
    .line 7
    aget p0, p0, p3

    .line 8
    .line 9
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/nxw$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public e(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxw$a;->c:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public f(I)Ll/ffj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxw$a;->d:[Ll/ffj0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public g(III)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nxw$a;->c(III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lcom/google/android/exoplayer2/y;->p(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public h()Ll/ffj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxw$a;->g:Ll/ffj0;

    .line 2
    .line 3
    return-object p0
.end method
