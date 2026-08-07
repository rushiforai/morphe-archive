.class public final Ll/ske0$c;
.super Ll/ske0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ske0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public final j:Ll/y5k0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final k:Ll/y5k0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final l:J


# direct methods
.method public constructor <init>(Ll/mkc0;JJJJJLjava/util/List;JLl/y5k0;Ll/y5k0;JJ)V
    .locals 17
    .param p12    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ll/y5k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p16    # Ll/y5k0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mkc0;",
            "JJJJJ",
            "Ljava/util/List<",
            "Ll/ske0$d;",
            ">;J",
            "Ll/y5k0;",
            "Ll/y5k0;",
            "JJ)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v2, p2

    .line 6
    .line 7
    move-wide/from16 v4, p4

    .line 8
    .line 9
    move-wide/from16 v6, p6

    .line 10
    .line 11
    move-wide/from16 v8, p10

    .line 12
    .line 13
    move-object/from16 v10, p12

    .line 14
    .line 15
    move-wide/from16 v11, p13

    .line 16
    .line 17
    move-wide/from16 v13, p17

    .line 18
    .line 19
    move-wide/from16 v15, p19

    .line 20
    .line 21
    invoke-direct/range {v0 .. v16}, Ll/ske0$a;-><init>(Ll/mkc0;JJJJLjava/util/List;JJJ)V

    .line 22
    .line 23
    .line 24
    move-object/from16 v1, p15

    .line 25
    .line 26
    iput-object v1, v0, Ll/ske0$c;->j:Ll/y5k0;

    .line 27
    .line 28
    move-object/from16 v1, p16

    .line 29
    .line 30
    iput-object v1, v0, Ll/ske0$c;->k:Ll/y5k0;

    .line 31
    .line 32
    move-wide/from16 v1, p8

    .line 33
    .line 34
    iput-wide v1, v0, Ll/ske0$c;->l:J

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a(Ll/t1d0;)Ll/mkc0;
    .locals 13
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ske0$c;->j:Ll/y5k0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Ll/t1d0;->b:Lcom/google/android/exoplayer2/k;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget v4, p0, Lcom/google/android/exoplayer2/k;->h:I

    .line 10
    .line 11
    const-wide/16 v5, 0x0

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    invoke-virtual/range {v0 .. v6}, Ll/y5k0;->a(Ljava/lang/String;JIJ)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v8

    .line 19
    new-instance v7, Ll/mkc0;

    .line 20
    .line 21
    const-wide/16 v9, 0x0

    .line 22
    .line 23
    const-wide/16 v11, -0x1

    .line 24
    .line 25
    invoke-direct/range {v7 .. v12}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 26
    .line 27
    .line 28
    return-object v7

    .line 29
    :cond_0
    invoke-super {p0, p1}, Ll/ske0;->a(Ll/t1d0;)Ll/mkc0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public g(J)J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ske0$a;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long p0, p0

    .line 10
    return-wide p0

    .line 11
    :cond_0
    iget-wide v0, p0, Ll/ske0$c;->l:J

    .line 12
    .line 13
    const-wide/16 v2, -0x1

    .line 14
    .line 15
    cmp-long v4, v0, v2

    .line 16
    .line 17
    if-eqz v4, :cond_1

    .line 18
    .line 19
    iget-wide p0, p0, Ll/ske0$a;->d:J

    .line 20
    .line 21
    sub-long/2addr v0, p0

    .line 22
    const-wide/16 p0, 0x1

    .line 23
    .line 24
    add-long/2addr v0, p0

    .line 25
    return-wide v0

    .line 26
    :cond_1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    cmp-long v0, p1, v0

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-static {p1, p2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-wide v0, p0, Ll/ske0;->b:J

    .line 40
    .line 41
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-wide v0, p0, Ll/ske0$a;->e:J

    .line 50
    .line 51
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-wide/32 v0, 0xf4240

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p0, p2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget-object p2, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    .line 67
    .line 68
    invoke-static {p1, p0, p2}, Ll/rx2;->a(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/RoundingMode;)Ljava/math/BigInteger;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    .line 73
    .line 74
    .line 75
    move-result-wide p0

    .line 76
    return-wide p0

    .line 77
    :cond_2
    return-wide v2
.end method

.method public k(Ll/t1d0;J)Ll/mkc0;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ske0$a;->f:Ljava/util/List;

    .line 4
    .line 5
    iget-wide v2, v0, Ll/ske0$a;->d:J

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sub-long v2, p2, v2

    .line 10
    .line 11
    long-to-int v2, v2

    .line 12
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/ske0$d;

    .line 17
    .line 18
    iget-wide v1, v1, Ll/ske0$d;->a:J

    .line 19
    .line 20
    :goto_0
    move-wide v8, v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    sub-long v1, p2, v2

    .line 23
    .line 24
    iget-wide v3, v0, Ll/ske0$a;->e:J

    .line 25
    .line 26
    mul-long/2addr v1, v3

    .line 27
    goto :goto_0

    .line 28
    :goto_1
    iget-object v3, v0, Ll/ske0$c;->k:Ll/y5k0;

    .line 29
    .line 30
    move-object/from16 v0, p1

    .line 31
    .line 32
    iget-object v0, v0, Ll/t1d0;->b:Lcom/google/android/exoplayer2/k;

    .line 33
    .line 34
    iget-object v4, v0, Lcom/google/android/exoplayer2/k;->a:Ljava/lang/String;

    .line 35
    .line 36
    iget v7, v0, Lcom/google/android/exoplayer2/k;->h:I

    .line 37
    .line 38
    move-wide/from16 v5, p2

    .line 39
    .line 40
    invoke-virtual/range {v3 .. v9}, Ll/y5k0;->a(Ljava/lang/String;JIJ)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v11

    .line 44
    new-instance v10, Ll/mkc0;

    .line 45
    .line 46
    const-wide/16 v12, 0x0

    .line 47
    .line 48
    const-wide/16 v14, -0x1

    .line 49
    .line 50
    invoke-direct/range {v10 .. v15}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 51
    .line 52
    .line 53
    return-object v10
.end method
