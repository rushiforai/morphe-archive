.class public final Ll/wlr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tlr0;


# instance fields
.field public final a:J

.field public final b:I

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:[J
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(JIJJ[J)V
    .locals 0
    .param p8    # [J
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/wlr0;->a:J

    .line 5
    .line 6
    iput p3, p0, Ll/wlr0;->b:I

    .line 7
    .line 8
    iput-wide p4, p0, Ll/wlr0;->c:J

    .line 9
    .line 10
    iput-object p8, p0, Ll/wlr0;->f:[J

    .line 11
    .line 12
    iput-wide p6, p0, Ll/wlr0;->d:J

    .line 13
    .line 14
    const-wide/16 p3, -0x1

    .line 15
    .line 16
    cmp-long p5, p6, p3

    .line 17
    .line 18
    if-nez p5, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    add-long p3, p1, p6

    .line 22
    .line 23
    :goto_0
    iput-wide p3, p0, Ll/wlr0;->e:J

    .line 24
    .line 25
    return-void
.end method

.method public static c(JLl/vlr0;J)Ll/wlr0;
    .locals 17
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-wide/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    iget-wide v3, v2, Ll/vlr0;->b:J

    .line 6
    .line 7
    const-wide/16 v5, -0x1

    .line 8
    .line 9
    cmp-long v7, v3, v5

    .line 10
    .line 11
    if-nez v7, :cond_0

    .line 12
    .line 13
    move-wide v3, v5

    .line 14
    :cond_0
    iget-object v7, v2, Ll/vlr0;->a:Ll/vfr0;

    .line 15
    .line 16
    iget v8, v7, Ll/vfr0;->g:I

    .line 17
    .line 18
    int-to-long v8, v8

    .line 19
    mul-long/2addr v3, v8

    .line 20
    add-long/2addr v3, v5

    .line 21
    iget v7, v7, Ll/vfr0;->d:I

    .line 22
    .line 23
    invoke-static {v3, v4, v7}, Ll/mpw0;->G(JI)J

    .line 24
    .line 25
    .line 26
    move-result-wide v12

    .line 27
    iget-wide v3, v2, Ll/vlr0;->c:J

    .line 28
    .line 29
    cmp-long v7, v3, v5

    .line 30
    .line 31
    if-eqz v7, :cond_3

    .line 32
    .line 33
    iget-object v7, v2, Ll/vlr0;->f:[J

    .line 34
    .line 35
    if-nez v7, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    cmp-long v5, v0, v5

    .line 39
    .line 40
    if-eqz v5, :cond_2

    .line 41
    .line 42
    add-long v3, p3, v3

    .line 43
    .line 44
    cmp-long v5, v0, v3

    .line 45
    .line 46
    if-eqz v5, :cond_2

    .line 47
    .line 48
    new-instance v5, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v6, "XING data size mismatch: "

    .line 51
    .line 52
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v0, ", "

    .line 59
    .line 60
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "XingSeeker"

    .line 71
    .line 72
    invoke-static {v1, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object v0, v2, Ll/vlr0;->a:Ll/vfr0;

    .line 76
    .line 77
    iget-wide v14, v2, Ll/vlr0;->c:J

    .line 78
    .line 79
    iget-object v1, v2, Ll/vlr0;->f:[J

    .line 80
    .line 81
    new-instance v8, Ll/wlr0;

    .line 82
    .line 83
    iget v11, v0, Ll/vfr0;->c:I

    .line 84
    .line 85
    move-wide/from16 v9, p3

    .line 86
    .line 87
    move-object/from16 v16, v1

    .line 88
    .line 89
    invoke-direct/range {v8 .. v16}, Ll/wlr0;-><init>(JIJJ[J)V

    .line 90
    .line 91
    .line 92
    return-object v8

    .line 93
    :cond_3
    :goto_0
    iget-object v0, v2, Ll/vlr0;->a:Ll/vfr0;

    .line 94
    .line 95
    new-instance v8, Ll/wlr0;

    .line 96
    .line 97
    iget v11, v0, Ll/vfr0;->c:I

    .line 98
    .line 99
    const-wide/16 v14, -0x1

    .line 100
    .line 101
    const/16 v16, 0x0

    .line 102
    .line 103
    move-wide/from16 v9, p3

    .line 104
    .line 105
    invoke-direct/range {v8 .. v16}, Ll/wlr0;-><init>(JIJJ[J)V

    .line 106
    .line 107
    .line 108
    return-object v8
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/wlr0;->zzh()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-wide p1, p0, Ll/wlr0;->a:J

    .line 10
    .line 11
    iget p0, p0, Ll/wlr0;->b:I

    .line 12
    .line 13
    new-instance v0, Ll/zfr0;

    .line 14
    .line 15
    new-instance v3, Ll/cgr0;

    .line 16
    .line 17
    int-to-long v4, p0

    .line 18
    add-long/2addr p1, v4

    .line 19
    invoke-direct {v3, v1, v2, p1, p2}, Ll/cgr0;-><init>(JJ)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v3, v3}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    iget-wide v3, p0, Ll/wlr0;->c:J

    .line 27
    .line 28
    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide p1

    .line 32
    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 33
    .line 34
    .line 35
    move-result-wide p1

    .line 36
    long-to-double v0, p1

    .line 37
    iget-wide v2, p0, Ll/wlr0;->c:J

    .line 38
    .line 39
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 40
    .line 41
    mul-double/2addr v0, v4

    .line 42
    long-to-double v2, v2

    .line 43
    div-double/2addr v0, v2

    .line 44
    const-wide/16 v2, 0x0

    .line 45
    .line 46
    cmpg-double v6, v0, v2

    .line 47
    .line 48
    const-wide/high16 v7, 0x4070000000000000L    # 256.0

    .line 49
    .line 50
    if-gtz v6, :cond_1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    cmpl-double v2, v0, v4

    .line 54
    .line 55
    if-ltz v2, :cond_2

    .line 56
    .line 57
    move-wide v2, v7

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    double-to-int v2, v0

    .line 60
    iget-object v3, p0, Ll/wlr0;->f:[J

    .line 61
    .line 62
    invoke-static {v3}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    aget-wide v4, v3, v2

    .line 66
    .line 67
    long-to-double v4, v4

    .line 68
    const/16 v6, 0x63

    .line 69
    .line 70
    if-ne v2, v6, :cond_3

    .line 71
    .line 72
    move-wide v9, v7

    .line 73
    goto :goto_0

    .line 74
    :cond_3
    add-int/lit8 v6, v2, 0x1

    .line 75
    .line 76
    aget-wide v9, v3, v6

    .line 77
    .line 78
    long-to-double v9, v9

    .line 79
    :goto_0
    int-to-double v2, v2

    .line 80
    sub-double/2addr v0, v2

    .line 81
    sub-double/2addr v9, v4

    .line 82
    mul-double/2addr v0, v9

    .line 83
    add-double v2, v4, v0

    .line 84
    .line 85
    :goto_1
    div-double/2addr v2, v7

    .line 86
    iget-wide v0, p0, Ll/wlr0;->d:J

    .line 87
    .line 88
    iget v4, p0, Ll/wlr0;->b:I

    .line 89
    .line 90
    long-to-double v5, v0

    .line 91
    mul-double/2addr v2, v5

    .line 92
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    .line 93
    .line 94
    .line 95
    move-result-wide v2

    .line 96
    const-wide/16 v5, -0x1

    .line 97
    .line 98
    add-long/2addr v0, v5

    .line 99
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 100
    .line 101
    .line 102
    move-result-wide v0

    .line 103
    int-to-long v2, v4

    .line 104
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    iget-wide v2, p0, Ll/wlr0;->a:J

    .line 109
    .line 110
    add-long/2addr v2, v0

    .line 111
    new-instance p0, Ll/zfr0;

    .line 112
    .line 113
    new-instance v0, Ll/cgr0;

    .line 114
    .line 115
    invoke-direct {v0, p1, p2, v2, v3}, Ll/cgr0;-><init>(JJ)V

    .line 116
    .line 117
    .line 118
    invoke-direct {p0, v0, v0}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 119
    .line 120
    .line 121
    return-object p0
.end method

.method public final b(J)J
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/wlr0;->zzh()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-wide v0, p0, Ll/wlr0;->a:J

    .line 8
    .line 9
    sub-long/2addr p1, v0

    .line 10
    iget v0, p0, Ll/wlr0;->b:I

    .line 11
    .line 12
    int-to-long v0, v0

    .line 13
    cmp-long v0, p1, v0

    .line 14
    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object v0, p0, Ll/wlr0;->f:[J

    .line 19
    .line 20
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    long-to-double p1, p1

    .line 24
    iget-wide v1, p0, Ll/wlr0;->d:J

    .line 25
    .line 26
    const-wide/high16 v3, 0x4070000000000000L    # 256.0

    .line 27
    .line 28
    mul-double/2addr p1, v3

    .line 29
    long-to-double v1, v1

    .line 30
    div-double/2addr p1, v1

    .line 31
    double-to-long v1, p1

    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-static {v0, v1, v2, v3, v3}, Ll/mpw0;->r([JJZZ)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0, v1}, Ll/wlr0;->d(I)J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    aget-wide v4, v0, v1

    .line 42
    .line 43
    add-int/lit8 v6, v1, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, v6}, Ll/wlr0;->d(I)J

    .line 46
    .line 47
    .line 48
    move-result-wide v7

    .line 49
    const/16 p0, 0x63

    .line 50
    .line 51
    if-ne v1, p0, :cond_1

    .line 52
    .line 53
    const-wide/16 v0, 0x100

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    aget-wide v9, v0, v6

    .line 57
    .line 58
    move-wide v0, v9

    .line 59
    :goto_0
    cmp-long p0, v4, v0

    .line 60
    .line 61
    if-nez p0, :cond_2

    .line 62
    .line 63
    const-wide/16 p0, 0x0

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    long-to-double v9, v4

    .line 67
    sub-double/2addr p1, v9

    .line 68
    sub-long/2addr v0, v4

    .line 69
    long-to-double v0, v0

    .line 70
    div-double p0, p1, v0

    .line 71
    .line 72
    :goto_1
    sub-long/2addr v7, v2

    .line 73
    long-to-double v0, v7

    .line 74
    mul-double/2addr p0, v0

    .line 75
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    .line 76
    .line 77
    .line 78
    move-result-wide p0

    .line 79
    add-long/2addr v2, p0

    .line 80
    return-wide v2

    .line 81
    :cond_3
    :goto_2
    const-wide/16 p0, 0x0

    .line 82
    .line 83
    return-wide p0
.end method

.method public final d(I)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/wlr0;->c:J

    .line 2
    .line 3
    int-to-long p0, p1

    .line 4
    mul-long/2addr v0, p0

    .line 5
    const-wide/16 p0, 0x64

    .line 6
    .line 7
    div-long/2addr v0, p0

    .line 8
    return-wide v0
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/wlr0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzc()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/wlr0;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzh()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wlr0;->f:[J

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
