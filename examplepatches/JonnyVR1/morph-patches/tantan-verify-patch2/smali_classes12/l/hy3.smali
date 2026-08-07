.class public final Ll/hy3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J


# direct methods
.method public constructor <init>(JJJJJJ)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p3

    .line 6
    .line 7
    move-wide/from16 v5, p5

    .line 8
    .line 9
    move-wide/from16 v7, p7

    .line 10
    .line 11
    move-wide/from16 v9, p9

    .line 12
    .line 13
    move-wide/from16 v11, p11

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    const-wide/16 v13, 0x0

    .line 19
    .line 20
    cmp-long v15, v1, v13

    .line 21
    .line 22
    const/16 v16, 0x0

    .line 23
    .line 24
    const/16 v17, 0x1

    .line 25
    .line 26
    if-ltz v15, :cond_0

    .line 27
    .line 28
    move/from16 v15, v17

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move/from16 v15, v16

    .line 32
    .line 33
    :goto_0
    invoke-static {v15}, Ll/xn80;->d(Z)V

    .line 34
    .line 35
    .line 36
    cmp-long v15, v3, v13

    .line 37
    .line 38
    if-ltz v15, :cond_1

    .line 39
    .line 40
    move/from16 v15, v17

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    move/from16 v15, v16

    .line 44
    .line 45
    :goto_1
    invoke-static {v15}, Ll/xn80;->d(Z)V

    .line 46
    .line 47
    .line 48
    cmp-long v15, v5, v13

    .line 49
    .line 50
    if-ltz v15, :cond_2

    .line 51
    .line 52
    move/from16 v15, v17

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    move/from16 v15, v16

    .line 56
    .line 57
    :goto_2
    invoke-static {v15}, Ll/xn80;->d(Z)V

    .line 58
    .line 59
    .line 60
    cmp-long v15, v7, v13

    .line 61
    .line 62
    if-ltz v15, :cond_3

    .line 63
    .line 64
    move/from16 v15, v17

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_3
    move/from16 v15, v16

    .line 68
    .line 69
    :goto_3
    invoke-static {v15}, Ll/xn80;->d(Z)V

    .line 70
    .line 71
    .line 72
    cmp-long v15, v9, v13

    .line 73
    .line 74
    if-ltz v15, :cond_4

    .line 75
    .line 76
    move/from16 v15, v17

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_4
    move/from16 v15, v16

    .line 80
    .line 81
    :goto_4
    invoke-static {v15}, Ll/xn80;->d(Z)V

    .line 82
    .line 83
    .line 84
    cmp-long v13, v11, v13

    .line 85
    .line 86
    if-ltz v13, :cond_5

    .line 87
    .line 88
    move/from16 v16, v17

    .line 89
    .line 90
    :cond_5
    invoke-static/range {v16 .. v16}, Ll/xn80;->d(Z)V

    .line 91
    .line 92
    .line 93
    iput-wide v1, v0, Ll/hy3;->a:J

    .line 94
    .line 95
    iput-wide v3, v0, Ll/hy3;->b:J

    .line 96
    .line 97
    iput-wide v5, v0, Ll/hy3;->c:J

    .line 98
    .line 99
    iput-wide v7, v0, Ll/hy3;->d:J

    .line 100
    .line 101
    iput-wide v9, v0, Ll/hy3;->e:J

    .line 102
    .line 103
    iput-wide v11, v0, Ll/hy3;->f:J

    .line 104
    .line 105
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hy3;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hy3;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hy3;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hy3;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hy3;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 1
    instance-of v0, p1, Ll/hy3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Ll/hy3;

    .line 7
    .line 8
    iget-wide v2, p0, Ll/hy3;->a:J

    .line 9
    .line 10
    iget-wide v4, p1, Ll/hy3;->a:J

    .line 11
    .line 12
    cmp-long v0, v2, v4

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-wide v2, p0, Ll/hy3;->b:J

    .line 17
    .line 18
    iget-wide v4, p1, Ll/hy3;->b:J

    .line 19
    .line 20
    cmp-long v0, v2, v4

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-wide v2, p0, Ll/hy3;->c:J

    .line 25
    .line 26
    iget-wide v4, p1, Ll/hy3;->c:J

    .line 27
    .line 28
    cmp-long v0, v2, v4

    .line 29
    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-wide v2, p0, Ll/hy3;->d:J

    .line 33
    .line 34
    iget-wide v4, p1, Ll/hy3;->d:J

    .line 35
    .line 36
    cmp-long v0, v2, v4

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-wide v2, p0, Ll/hy3;->e:J

    .line 41
    .line 42
    iget-wide v4, p1, Ll/hy3;->e:J

    .line 43
    .line 44
    cmp-long v0, v2, v4

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iget-wide v2, p0, Ll/hy3;->f:J

    .line 49
    .line 50
    iget-wide p0, p1, Ll/hy3;->f:J

    .line 51
    .line 52
    cmp-long p0, v2, p0

    .line 53
    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_0
    return v1
.end method

.method public f()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/hy3;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget-wide v0, p0, Ll/hy3;->a:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-wide v0, p0, Ll/hy3;->b:J

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-wide v0, p0, Ll/hy3;->c:J

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget-wide v0, p0, Ll/hy3;->d:J

    .line 20
    .line 21
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    iget-wide v0, p0, Ll/hy3;->e:J

    .line 26
    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    iget-wide v0, p0, Ll/hy3;->f:J

    .line 32
    .line 33
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v7

    .line 37
    filled-new-array/range {v2 .. v7}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/google/common/base/a;->b(Ljava/lang/Object;)Lcom/google/common/base/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "hitCount"

    .line 6
    .line 7
    iget-wide v2, p0, Ll/hy3;->a:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/a$b;->c(Ljava/lang/String;J)Lcom/google/common/base/a$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "missCount"

    .line 14
    .line 15
    iget-wide v2, p0, Ll/hy3;->b:J

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/a$b;->c(Ljava/lang/String;J)Lcom/google/common/base/a$b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "loadSuccessCount"

    .line 22
    .line 23
    iget-wide v2, p0, Ll/hy3;->c:J

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/a$b;->c(Ljava/lang/String;J)Lcom/google/common/base/a$b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "loadExceptionCount"

    .line 30
    .line 31
    iget-wide v2, p0, Ll/hy3;->d:J

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/a$b;->c(Ljava/lang/String;J)Lcom/google/common/base/a$b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "totalLoadTime"

    .line 38
    .line 39
    iget-wide v2, p0, Ll/hy3;->e:J

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/a$b;->c(Ljava/lang/String;J)Lcom/google/common/base/a$b;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "evictionCount"

    .line 46
    .line 47
    iget-wide v2, p0, Ll/hy3;->f:J

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/common/base/a$b;->c(Ljava/lang/String;J)Lcom/google/common/base/a$b;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/google/common/base/a$b;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method
