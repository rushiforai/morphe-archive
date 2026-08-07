.class public final Ll/gyx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/source/i$b;

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/i$b;JJJJZZZZ)V
    .locals 7

    .line 1
    move/from16 v0, p10

    .line 2
    .line 3
    move/from16 v1, p11

    .line 4
    .line 5
    move/from16 v2, p12

    .line 6
    .line 7
    move/from16 v3, p13

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    if-eqz v3, :cond_1

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v6, v5

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    move v6, v4

    .line 22
    :goto_1
    invoke-static {v6}, Ll/w11;->a(Z)V

    .line 23
    .line 24
    .line 25
    if-eqz v2, :cond_3

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_2
    move v6, v5

    .line 31
    goto :goto_3

    .line 32
    :cond_3
    :goto_2
    move v6, v4

    .line 33
    :goto_3
    invoke-static {v6}, Ll/w11;->a(Z)V

    .line 34
    .line 35
    .line 36
    if-eqz v0, :cond_5

    .line 37
    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    if-nez v2, :cond_4

    .line 41
    .line 42
    if-nez v3, :cond_4

    .line 43
    .line 44
    goto :goto_4

    .line 45
    :cond_4
    move v4, v5

    .line 46
    :cond_5
    :goto_4
    invoke-static {v4}, Ll/w11;->a(Z)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 50
    .line 51
    iput-wide p2, p0, Ll/gyx;->b:J

    .line 52
    .line 53
    iput-wide p4, p0, Ll/gyx;->c:J

    .line 54
    .line 55
    iput-wide p6, p0, Ll/gyx;->d:J

    .line 56
    .line 57
    move-wide p1, p8

    .line 58
    iput-wide p1, p0, Ll/gyx;->e:J

    .line 59
    .line 60
    iput-boolean v0, p0, Ll/gyx;->f:Z

    .line 61
    .line 62
    iput-boolean v1, p0, Ll/gyx;->g:Z

    .line 63
    .line 64
    iput-boolean v2, p0, Ll/gyx;->h:Z

    .line 65
    .line 66
    iput-boolean v3, p0, Ll/gyx;->i:Z

    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a(J)Ll/gyx;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Ll/gyx;->c:J

    .line 4
    .line 5
    cmp-long v1, p1, v1

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    new-instance v2, Ll/gyx;

    .line 11
    .line 12
    iget-object v3, v0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 13
    .line 14
    iget-wide v4, v0, Ll/gyx;->b:J

    .line 15
    .line 16
    iget-wide v8, v0, Ll/gyx;->d:J

    .line 17
    .line 18
    iget-wide v10, v0, Ll/gyx;->e:J

    .line 19
    .line 20
    iget-boolean v12, v0, Ll/gyx;->f:Z

    .line 21
    .line 22
    iget-boolean v13, v0, Ll/gyx;->g:Z

    .line 23
    .line 24
    iget-boolean v14, v0, Ll/gyx;->h:Z

    .line 25
    .line 26
    iget-boolean v15, v0, Ll/gyx;->i:Z

    .line 27
    .line 28
    move-wide/from16 v6, p1

    .line 29
    .line 30
    invoke-direct/range {v2 .. v15}, Ll/gyx;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJJJZZZZ)V

    .line 31
    .line 32
    .line 33
    return-object v2
.end method

.method public b(J)Ll/gyx;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Ll/gyx;->b:J

    .line 4
    .line 5
    cmp-long v1, p1, v1

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    new-instance v2, Ll/gyx;

    .line 11
    .line 12
    iget-object v3, v0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 13
    .line 14
    iget-wide v6, v0, Ll/gyx;->c:J

    .line 15
    .line 16
    iget-wide v8, v0, Ll/gyx;->d:J

    .line 17
    .line 18
    iget-wide v10, v0, Ll/gyx;->e:J

    .line 19
    .line 20
    iget-boolean v12, v0, Ll/gyx;->f:Z

    .line 21
    .line 22
    iget-boolean v13, v0, Ll/gyx;->g:Z

    .line 23
    .line 24
    iget-boolean v14, v0, Ll/gyx;->h:Z

    .line 25
    .line 26
    iget-boolean v15, v0, Ll/gyx;->i:Z

    .line 27
    .line 28
    move-wide/from16 v4, p1

    .line 29
    .line 30
    invoke-direct/range {v2 .. v15}, Ll/gyx;-><init>(Lcom/google/android/exoplayer2/source/i$b;JJJJZZZZ)V

    .line 31
    .line 32
    .line 33
    return-object v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

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
    const-class v2, Ll/gyx;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/gyx;

    .line 18
    .line 19
    iget-wide v2, p0, Ll/gyx;->b:J

    .line 20
    .line 21
    iget-wide v4, p1, Ll/gyx;->b:J

    .line 22
    .line 23
    cmp-long v2, v2, v4

    .line 24
    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    iget-wide v2, p0, Ll/gyx;->c:J

    .line 28
    .line 29
    iget-wide v4, p1, Ll/gyx;->c:J

    .line 30
    .line 31
    cmp-long v2, v2, v4

    .line 32
    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    iget-wide v2, p0, Ll/gyx;->d:J

    .line 36
    .line 37
    iget-wide v4, p1, Ll/gyx;->d:J

    .line 38
    .line 39
    cmp-long v2, v2, v4

    .line 40
    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    iget-wide v2, p0, Ll/gyx;->e:J

    .line 44
    .line 45
    iget-wide v4, p1, Ll/gyx;->e:J

    .line 46
    .line 47
    cmp-long v2, v2, v4

    .line 48
    .line 49
    if-nez v2, :cond_2

    .line 50
    .line 51
    iget-boolean v2, p0, Ll/gyx;->f:Z

    .line 52
    .line 53
    iget-boolean v3, p1, Ll/gyx;->f:Z

    .line 54
    .line 55
    if-ne v2, v3, :cond_2

    .line 56
    .line 57
    iget-boolean v2, p0, Ll/gyx;->g:Z

    .line 58
    .line 59
    iget-boolean v3, p1, Ll/gyx;->g:Z

    .line 60
    .line 61
    if-ne v2, v3, :cond_2

    .line 62
    .line 63
    iget-boolean v2, p0, Ll/gyx;->h:Z

    .line 64
    .line 65
    iget-boolean v3, p1, Ll/gyx;->h:Z

    .line 66
    .line 67
    if-ne v2, v3, :cond_2

    .line 68
    .line 69
    iget-boolean v2, p0, Ll/gyx;->i:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Ll/gyx;->i:Z

    .line 72
    .line 73
    if-ne v2, v3, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 76
    .line 77
    iget-object p1, p1, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/bmk0;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    return v0

    .line 86
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gyx;->a:Lcom/google/android/exoplayer2/source/i$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fyx;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x20f

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    mul-int/lit8 v1, v1, 0x1f

    .line 11
    .line 12
    iget-wide v2, p0, Ll/gyx;->b:J

    .line 13
    .line 14
    long-to-int v0, v2

    .line 15
    add-int/2addr v1, v0

    .line 16
    mul-int/lit8 v1, v1, 0x1f

    .line 17
    .line 18
    iget-wide v2, p0, Ll/gyx;->c:J

    .line 19
    .line 20
    long-to-int v0, v2

    .line 21
    add-int/2addr v1, v0

    .line 22
    mul-int/lit8 v1, v1, 0x1f

    .line 23
    .line 24
    iget-wide v2, p0, Ll/gyx;->d:J

    .line 25
    .line 26
    long-to-int v0, v2

    .line 27
    add-int/2addr v1, v0

    .line 28
    mul-int/lit8 v1, v1, 0x1f

    .line 29
    .line 30
    iget-wide v2, p0, Ll/gyx;->e:J

    .line 31
    .line 32
    long-to-int v0, v2

    .line 33
    add-int/2addr v1, v0

    .line 34
    mul-int/lit8 v1, v1, 0x1f

    .line 35
    .line 36
    iget-boolean v0, p0, Ll/gyx;->f:Z

    .line 37
    .line 38
    add-int/2addr v1, v0

    .line 39
    mul-int/lit8 v1, v1, 0x1f

    .line 40
    .line 41
    iget-boolean v0, p0, Ll/gyx;->g:Z

    .line 42
    .line 43
    add-int/2addr v1, v0

    .line 44
    mul-int/lit8 v1, v1, 0x1f

    .line 45
    .line 46
    iget-boolean v0, p0, Ll/gyx;->h:Z

    .line 47
    .line 48
    add-int/2addr v1, v0

    .line 49
    mul-int/lit8 v1, v1, 0x1f

    .line 50
    .line 51
    iget-boolean p0, p0, Ll/gyx;->i:Z

    .line 52
    .line 53
    add-int/2addr v1, p0

    .line 54
    return v1
.end method
