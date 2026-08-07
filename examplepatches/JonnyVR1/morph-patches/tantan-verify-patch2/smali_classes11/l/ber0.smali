.class public Ll/ber0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/vdr0;

.field public final b:Ll/aer0;

.field public c:Ll/xdr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final d:I


# direct methods
.method public constructor <init>(Ll/ydr0;Ll/aer0;JJJJJJI)V
    .locals 14

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    move-object/from16 v0, p2

    .line 5
    .line 6
    iput-object v0, p0, Ll/ber0;->b:Ll/aer0;

    .line 7
    .line 8
    move/from16 v0, p15

    .line 9
    .line 10
    iput v0, p0, Ll/ber0;->d:I

    .line 11
    .line 12
    new-instance v0, Ll/vdr0;

    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    move-wide/from16 v2, p3

    .line 18
    .line 19
    move-wide/from16 v6, p7

    .line 20
    .line 21
    move-wide/from16 v8, p9

    .line 22
    .line 23
    move-wide/from16 v10, p11

    .line 24
    .line 25
    move-wide/from16 v12, p13

    .line 26
    .line 27
    invoke-direct/range {v0 .. v13}, Ll/vdr0;-><init>(Ll/ydr0;JJJJJJ)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/ber0;->a:Ll/vdr0;

    .line 31
    .line 32
    return-void
.end method

.method public static final f(Ll/qer0;JLl/yfr0;)I
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/qer0;->zzf()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long p0, p1, v0

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iput-wide p1, p3, Ll/yfr0;->a:J

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public static final g(Ll/qer0;J)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/qer0;->zzf()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v0, p1, v0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    const-wide/32 v2, 0x40000

    .line 14
    .line 15
    .line 16
    cmp-long v0, p1, v2

    .line 17
    .line 18
    if-gtz v0, :cond_0

    .line 19
    .line 20
    long-to-int p1, p1

    .line 21
    check-cast p0, Ll/fer0;

    .line 22
    .line 23
    invoke-virtual {p0, p1, v1}, Ll/fer0;->k(IZ)Z

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method


# virtual methods
.method public final a(Ll/qer0;Ll/yfr0;)I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Ll/ber0;->c:Ll/xdr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/xdr0;->b(Ll/xdr0;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {v0}, Ll/xdr0;->a(Ll/xdr0;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    sub-long/2addr v3, v1

    .line 15
    iget v5, p0, Ll/ber0;->d:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/xdr0;->c(Ll/xdr0;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v6

    .line 21
    int-to-long v8, v5

    .line 22
    cmp-long v3, v3, v8

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    if-gtz v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v4, v1, v2}, Ll/ber0;->c(ZJ)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v1, v2, p2}, Ll/ber0;->f(Ll/qer0;JLl/yfr0;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_0
    invoke-static {p1, v6, v7}, Ll/ber0;->g(Ll/qer0;J)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    invoke-static {p1, v6, v7, p2}, Ll/ber0;->f(Ll/qer0;JLl/yfr0;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_1
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/ber0;->b:Ll/aer0;

    .line 50
    .line 51
    invoke-static {v0}, Ll/xdr0;->e(Ll/xdr0;)J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    invoke-interface {v1, p1, v2, v3}, Ll/aer0;->a(Ll/qer0;J)Ll/zdr0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Ll/zdr0;->a(Ll/zdr0;)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    const/4 v3, -0x3

    .line 64
    if-eq v2, v3, :cond_4

    .line 65
    .line 66
    const/4 v3, -0x2

    .line 67
    if-eq v2, v3, :cond_3

    .line 68
    .line 69
    const/4 v3, -0x1

    .line 70
    if-eq v2, v3, :cond_2

    .line 71
    .line 72
    invoke-static {v1}, Ll/zdr0;->b(Ll/zdr0;)J

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    invoke-static {p1, v2, v3}, Ll/ber0;->g(Ll/qer0;J)Z

    .line 77
    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    invoke-static {v1}, Ll/zdr0;->b(Ll/zdr0;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-virtual {p0, v0, v2, v3}, Ll/ber0;->c(ZJ)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1}, Ll/zdr0;->b(Ll/zdr0;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    invoke-static {p1, v0, v1, p2}, Ll/ber0;->f(Ll/qer0;JLl/yfr0;)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    return p0

    .line 96
    :cond_2
    invoke-static {v1}, Ll/zdr0;->c(Ll/zdr0;)J

    .line 97
    .line 98
    .line 99
    move-result-wide v2

    .line 100
    invoke-static {v1}, Ll/zdr0;->b(Ll/zdr0;)J

    .line 101
    .line 102
    .line 103
    move-result-wide v4

    .line 104
    invoke-static {v0, v2, v3, v4, v5}, Ll/xdr0;->g(Ll/xdr0;JJ)V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    invoke-static {v1}, Ll/zdr0;->c(Ll/zdr0;)J

    .line 109
    .line 110
    .line 111
    move-result-wide v2

    .line 112
    invoke-static {v1}, Ll/zdr0;->b(Ll/zdr0;)J

    .line 113
    .line 114
    .line 115
    move-result-wide v4

    .line 116
    invoke-static {v0, v2, v3, v4, v5}, Ll/xdr0;->h(Ll/xdr0;JJ)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    invoke-virtual {p0, v4, v6, v7}, Ll/ber0;->c(ZJ)V

    .line 121
    .line 122
    .line 123
    invoke-static {p1, v6, v7, p2}, Ll/ber0;->f(Ll/qer0;JLl/yfr0;)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    return p0
.end method

.method public final b()Ll/bgr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ber0;->a:Ll/vdr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(ZJ)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/ber0;->c:Ll/xdr0;

    .line 3
    .line 4
    iget-object p0, p0, Ll/ber0;->b:Ll/aer0;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/aer0;->zzb()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(J)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v2, p1

    .line 4
    .line 5
    iget-object v1, v0, Ll/ber0;->c:Ll/xdr0;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v1}, Ll/xdr0;->d(Ll/xdr0;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    cmp-long v1, v4, v2

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v1, v0, Ll/ber0;->a:Ll/vdr0;

    .line 19
    .line 20
    new-instance v4, Ll/xdr0;

    .line 21
    .line 22
    move-object v6, v4

    .line 23
    invoke-virtual {v1, v2, v3}, Ll/vdr0;->g(J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    invoke-static {v1}, Ll/vdr0;->e(Ll/vdr0;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v8

    .line 31
    invoke-static {v1}, Ll/vdr0;->f(Ll/vdr0;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v10

    .line 35
    invoke-static {v1}, Ll/vdr0;->d(Ll/vdr0;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v12

    .line 39
    invoke-static {v1}, Ll/vdr0;->c(Ll/vdr0;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v14

    .line 43
    move-object v1, v6

    .line 44
    const-wide/16 v6, 0x0

    .line 45
    .line 46
    invoke-direct/range {v1 .. v15}, Ll/xdr0;-><init>(JJJJJJJ)V

    .line 47
    .line 48
    .line 49
    iput-object v1, v0, Ll/ber0;->c:Ll/xdr0;

    .line 50
    .line 51
    return-void
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ber0;->c:Ll/xdr0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
