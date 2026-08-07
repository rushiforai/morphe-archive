.class public final Ll/p5z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Ljava/lang/String;

.field public final b:[I

.field public final c:[Ll/q2z0;

.field public final d:[I

.field public final e:[[[I

.field public final f:Ll/q2z0;


# direct methods
.method public constructor <init>([Ljava/lang/String;[I[Ll/q2z0;[I[[[ILl/q2z0;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p5z0;->a:[Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p5z0;->b:[I

    .line 7
    .line 8
    iput-object p3, p0, Ll/p5z0;->c:[Ll/q2z0;

    .line 9
    .line 10
    iput-object p5, p0, Ll/p5z0;->e:[[[I

    .line 11
    .line 12
    iput-object p4, p0, Ll/p5z0;->d:[I

    .line 13
    .line 14
    iput-object p6, p0, Ll/p5z0;->f:Ll/q2z0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(IIZ)I
    .locals 8

    .line 1
    iget-object p3, p0, Ll/p5z0;->c:[Ll/q2z0;

    .line 2
    .line 3
    aget-object p3, p3, p1

    .line 4
    .line 5
    invoke-virtual {p3, p2}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget p3, p3, Ll/t2u0;->a:I

    .line 10
    .line 11
    const/4 p3, 0x1

    .line 12
    new-array v0, p3, [I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :goto_0
    if-gtz v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Ll/p5z0;->e:[[[I

    .line 20
    .line 21
    aget-object v2, v2, p1

    .line 22
    .line 23
    aget-object v2, v2, p2

    .line 24
    .line 25
    aget v2, v2, v1

    .line 26
    .line 27
    and-int/lit8 v2, v2, 0x7

    .line 28
    .line 29
    const/4 v4, 0x4

    .line 30
    if-ne v2, v4, :cond_0

    .line 31
    .line 32
    add-int/lit8 v2, v3, 0x1

    .line 33
    .line 34
    aput v1, v0, v3

    .line 35
    .line 36
    move v3, v2

    .line 37
    :cond_0
    move v2, p3

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([II)[I

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v2, 0x0

    .line 44
    const/16 v3, 0x10

    .line 45
    .line 46
    move-object v4, v2

    .line 47
    move v5, v3

    .line 48
    move v2, v1

    .line 49
    move v3, v2

    .line 50
    :goto_1
    array-length v6, v0

    .line 51
    if-ge v1, v6, :cond_3

    .line 52
    .line 53
    aget v6, v0, v1

    .line 54
    .line 55
    iget-object v7, p0, Ll/p5z0;->c:[Ll/q2z0;

    .line 56
    .line 57
    aget-object v7, v7, p1

    .line 58
    .line 59
    invoke-virtual {v7, p2}, Ll/q2z0;->b(I)Ll/t2u0;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    invoke-virtual {v7, v6}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    iget-object v6, v6, Ll/sqr0;->l:Ljava/lang/String;

    .line 68
    .line 69
    add-int/lit8 v7, v3, 0x1

    .line 70
    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    move-object v4, v6

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    invoke-static {v4, v6}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    xor-int/2addr v3, p3

    .line 80
    or-int/2addr v2, v3

    .line 81
    :goto_2
    iget-object v3, p0, Ll/p5z0;->e:[[[I

    .line 82
    .line 83
    aget-object v3, v3, p1

    .line 84
    .line 85
    aget-object v3, v3, p2

    .line 86
    .line 87
    aget v3, v3, v1

    .line 88
    .line 89
    and-int/lit8 v3, v3, 0x18

    .line 90
    .line 91
    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    add-int/lit8 v1, v1, 0x1

    .line 96
    .line 97
    move v3, v7

    .line 98
    goto :goto_1

    .line 99
    :cond_3
    if-eqz v2, :cond_4

    .line 100
    .line 101
    iget-object p0, p0, Ll/p5z0;->d:[I

    .line 102
    .line 103
    aget p0, p0, p1

    .line 104
    .line 105
    invoke-static {v5, p0}, Ljava/lang/Math;->min(II)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0

    .line 110
    :cond_4
    return v5
.end method

.method public final b(III)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5z0;->e:[[[I

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

.method public final c(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5z0;->b:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public final d(I)Ll/q2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5z0;->c:[Ll/q2z0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public final e()Ll/q2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5z0;->f:Ll/q2z0;

    .line 2
    .line 3
    return-object p0
.end method
