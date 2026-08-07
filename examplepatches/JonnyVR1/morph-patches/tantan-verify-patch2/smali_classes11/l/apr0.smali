.class public final Ll/apr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sgr0;


# instance fields
.field public final a:Ll/sgr0;

.field public final b:Ll/vor0;

.field public final c:Ll/por0;

.field public final d:Ll/bgw0;

.field public e:I

.field public f:I

.field public g:[B

.field public h:Ll/xor0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Ll/sqr0;


# direct methods
.method public constructor <init>(Ll/sgr0;Ll/vor0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/apr0;->a:Ll/sgr0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/apr0;->b:Ll/vor0;

    .line 7
    .line 8
    new-instance p1, Ll/por0;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/por0;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/apr0;->c:Ll/por0;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput p1, p0, Ll/apr0;->e:I

    .line 17
    .line 18
    iput p1, p0, Ll/apr0;->f:I

    .line 19
    .line 20
    sget-object p1, Ll/mpw0;->f:[B

    .line 21
    .line 22
    iput-object p1, p0, Ll/apr0;->g:[B

    .line 23
    .line 24
    new-instance p1, Ll/bgw0;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/apr0;->d:Ll/bgw0;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/apr0;->h:Ll/xor0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/apr0;->a:Ll/sgr0;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2, p3}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p2}, Ll/apr0;->h(I)V

    .line 12
    .line 13
    .line 14
    iget-object p3, p0, Ll/apr0;->g:[B

    .line 15
    .line 16
    iget v0, p0, Ll/apr0;->f:I

    .line 17
    .line 18
    invoke-virtual {p1, p3, v0, p2}, Ll/bgw0;->g([BII)V

    .line 19
    .line 20
    .line 21
    iget p1, p0, Ll/apr0;->f:I

    .line 22
    .line 23
    add-int/2addr p1, p2

    .line 24
    iput p1, p0, Ll/apr0;->f:I

    .line 25
    .line 26
    return-void
.end method

.method public final b(Ll/nyy0;IZI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p4, p0, Ll/apr0;->h:Ll/xor0;

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/apr0;->a:Ll/sgr0;

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    invoke-interface {p0, p1, p2, p3, p4}, Ll/sgr0;->b(Ll/nyy0;IZI)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0, p2}, Ll/apr0;->h(I)V

    .line 14
    .line 15
    .line 16
    iget-object p4, p0, Ll/apr0;->g:[B

    .line 17
    .line 18
    iget v0, p0, Ll/apr0;->f:I

    .line 19
    .line 20
    invoke-interface {p1, p4, v0, p2}, Ll/nyy0;->a([BII)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 p2, -0x1

    .line 25
    if-ne p1, p2, :cond_2

    .line 26
    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    return p2

    .line 30
    :cond_1
    invoke-static {}, Ll/vg3;->a()V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_2
    iget p2, p0, Ll/apr0;->f:I

    .line 36
    .line 37
    add-int/2addr p2, p1

    .line 38
    iput p2, p0, Ll/apr0;->f:I

    .line 39
    .line 40
    return p1
.end method

.method public final c(JIIILl/ggr0;)V
    .locals 4
    .param p6    # Ll/ggr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/apr0;->h:Ll/xor0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/apr0;->a:Ll/sgr0;

    .line 6
    .line 7
    invoke-interface/range {p0 .. p6}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    if-nez p6, :cond_1

    .line 13
    .line 14
    const/4 p6, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    move p6, v0

    .line 17
    :goto_0
    const-string v1, "DRM on subtitles is not supported"

    .line 18
    .line 19
    invoke-static {p6, v1}, Ll/lev0;->e(ZLjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget p6, p0, Ll/apr0;->f:I

    .line 23
    .line 24
    sub-int/2addr p6, p5

    .line 25
    sub-int/2addr p6, p4

    .line 26
    move-wide v1, p1

    .line 27
    iget-object p1, p0, Ll/apr0;->h:Ll/xor0;

    .line 28
    .line 29
    iget-object p2, p0, Ll/apr0;->g:[B

    .line 30
    .line 31
    invoke-static {}, Ll/wor0;->a()Ll/wor0;

    .line 32
    .line 33
    .line 34
    move-result-object p5

    .line 35
    move v3, p3

    .line 36
    move p3, p6

    .line 37
    new-instance p6, Ll/zor0;

    .line 38
    .line 39
    invoke-direct {p6, p0, v1, v2, v3}, Ll/zor0;-><init>(Ll/apr0;JI)V

    .line 40
    .line 41
    .line 42
    invoke-interface/range {p1 .. p6}, Ll/xor0;->a([BIILl/wor0;Ll/hkv0;)V

    .line 43
    .line 44
    .line 45
    add-int p6, p3, p4

    .line 46
    .line 47
    iput p6, p0, Ll/apr0;->e:I

    .line 48
    .line 49
    iget p1, p0, Ll/apr0;->f:I

    .line 50
    .line 51
    if-ne p6, p1, :cond_2

    .line 52
    .line 53
    iput v0, p0, Ll/apr0;->e:I

    .line 54
    .line 55
    iput v0, p0, Ll/apr0;->f:I

    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public final d(Ll/sqr0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/a8t0;->b(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x3

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/apr0;->i:Ll/sqr0;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/sqr0;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object p1, p0, Ll/apr0;->i:Ll/sqr0;

    .line 28
    .line 29
    iget-object v0, p0, Ll/apr0;->b:Ll/vor0;

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ll/vor0;->b(Ll/sqr0;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/apr0;->b:Ll/vor0;

    .line 38
    .line 39
    invoke-interface {v0, p1}, Ll/vor0;->c(Ll/sqr0;)Ll/xor0;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const/4 v0, 0x0

    .line 45
    :goto_1
    iput-object v0, p0, Ll/apr0;->h:Ll/xor0;

    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Ll/apr0;->h:Ll/xor0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/apr0;->a:Ll/sgr0;

    .line 50
    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    invoke-interface {v1, p1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    invoke-virtual {p1}, Ll/sqr0;->b()Ll/znr0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v2, "application/x-media3-cues"

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 64
    .line 65
    .line 66
    iget-object v2, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 69
    .line 70
    .line 71
    const-wide v2, 0x7fffffffffffffffL

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v2, v3}, Ll/znr0;->B(J)Ll/znr0;

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/apr0;->b:Ll/vor0;

    .line 80
    .line 81
    invoke-interface {p0, p1}, Ll/vor0;->a(Ll/sqr0;)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {v0, p0}, Ll/znr0;->d(I)Ll/znr0;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {v1, p0}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic e(Ll/nyy0;IZ)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/fgr0;->a(Ll/sgr0;Ll/nyy0;IZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic f(Ll/bgw0;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g(JILl/qor0;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/apr0;->i:Ll/sqr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p4, Ll/qor0;->a:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/u4v0;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/u4v0;->a()Landroid/os/Bundle;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-wide v1, p4, Ll/qor0;->c:J

    .line 42
    .line 43
    new-instance v3, Landroid/os/Bundle;

    .line 44
    .line 45
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string v4, "c"

    .line 49
    .line 50
    invoke-virtual {v3, v4, v0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 51
    .line 52
    .line 53
    const-string v0, "d"

    .line 54
    .line 55
    invoke-virtual {v3, v0, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/apr0;->d:Ll/bgw0;

    .line 73
    .line 74
    array-length v6, v1

    .line 75
    invoke-virtual {v0, v1, v6}, Ll/bgw0;->i([BI)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/apr0;->a:Ll/sgr0;

    .line 79
    .line 80
    iget-object v1, p0, Ll/apr0;->d:Ll/bgw0;

    .line 81
    .line 82
    invoke-interface {v0, v1, v6}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 83
    .line 84
    .line 85
    const v0, 0x7fffffff

    .line 86
    .line 87
    .line 88
    and-int v5, p3, v0

    .line 89
    .line 90
    iget-wide p3, p4, Ll/qor0;->b:J

    .line 91
    .line 92
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    cmp-long v0, p3, v0

    .line 98
    .line 99
    iget-object v1, p0, Ll/apr0;->i:Ll/sqr0;

    .line 100
    .line 101
    const-wide v2, 0x7fffffffffffffffL

    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    if-nez v0, :cond_2

    .line 107
    .line 108
    iget-wide p3, v1, Ll/sqr0;->p:J

    .line 109
    .line 110
    cmp-long p3, p3, v2

    .line 111
    .line 112
    if-nez p3, :cond_1

    .line 113
    .line 114
    const/4 p3, 0x1

    .line 115
    goto :goto_1

    .line 116
    :cond_1
    const/4 p3, 0x0

    .line 117
    :goto_1
    invoke-static {p3}, Ll/lev0;->f(Z)V

    .line 118
    .line 119
    .line 120
    :goto_2
    move-wide v3, p1

    .line 121
    goto :goto_3

    .line 122
    :cond_2
    iget-wide v0, v1, Ll/sqr0;->p:J

    .line 123
    .line 124
    cmp-long v2, v0, v2

    .line 125
    .line 126
    if-nez v2, :cond_3

    .line 127
    .line 128
    add-long/2addr p1, p3

    .line 129
    goto :goto_2

    .line 130
    :cond_3
    add-long p1, p3, v0

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :goto_3
    iget-object v2, p0, Ll/apr0;->a:Ll/sgr0;

    .line 134
    .line 135
    const/4 v7, 0x0

    .line 136
    const/4 v8, 0x0

    .line 137
    invoke-interface/range {v2 .. v8}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final h(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/apr0;->g:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget v1, p0, Ll/apr0;->f:I

    .line 5
    .line 6
    sub-int/2addr v0, v1

    .line 7
    if-lt v0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p0, Ll/apr0;->e:I

    .line 11
    .line 12
    sub-int/2addr v1, v0

    .line 13
    add-int v0, v1, v1

    .line 14
    .line 15
    add-int/2addr p1, v1

    .line 16
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Ll/apr0;->g:[B

    .line 21
    .line 22
    array-length v2, v0

    .line 23
    if-gt p1, v2, :cond_1

    .line 24
    .line 25
    move-object p1, v0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-array p1, p1, [B

    .line 28
    .line 29
    :goto_0
    iget v2, p0, Ll/apr0;->e:I

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-static {v0, v2, p1, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    iput v3, p0, Ll/apr0;->e:I

    .line 36
    .line 37
    iput v1, p0, Ll/apr0;->f:I

    .line 38
    .line 39
    iput-object p1, p0, Ll/apr0;->g:[B

    .line 40
    .line 41
    return-void
.end method
