.class public final Ll/pbs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J

.field public final g:J

.field public final h:Ljava/lang/Long;

.field public final i:Ljava/lang/Long;

.field public final j:Ljava/lang/Long;

.field public final k:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 13

    .line 1
    move-wide/from16 v0, p3

    .line 2
    .line 3
    move-wide/from16 v2, p5

    .line 4
    .line 5
    move-wide/from16 v4, p7

    .line 6
    .line 7
    move-wide/from16 v6, p11

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    const-wide/16 v8, 0x0

    .line 19
    .line 20
    cmp-long v10, v0, v8

    .line 21
    .line 22
    const/4 v11, 0x0

    .line 23
    const/4 v12, 0x1

    .line 24
    if-ltz v10, :cond_0

    .line 25
    .line 26
    move v10, v12

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v10, v11

    .line 29
    :goto_0
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 30
    .line 31
    .line 32
    cmp-long v10, v2, v8

    .line 33
    .line 34
    if-ltz v10, :cond_1

    .line 35
    .line 36
    move v10, v12

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v10, v11

    .line 39
    :goto_1
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 40
    .line 41
    .line 42
    cmp-long v10, v4, v8

    .line 43
    .line 44
    if-ltz v10, :cond_2

    .line 45
    .line 46
    move v10, v12

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v10, v11

    .line 49
    :goto_2
    invoke-static {v10}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 50
    .line 51
    .line 52
    cmp-long v8, v6, v8

    .line 53
    .line 54
    if-ltz v8, :cond_3

    .line 55
    .line 56
    move v11, v12

    .line 57
    :cond_3
    invoke-static {v11}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/pbs0;->a:Ljava/lang/String;

    .line 61
    .line 62
    iput-object p2, p0, Ll/pbs0;->b:Ljava/lang/String;

    .line 63
    .line 64
    iput-wide v0, p0, Ll/pbs0;->c:J

    .line 65
    .line 66
    iput-wide v2, p0, Ll/pbs0;->d:J

    .line 67
    .line 68
    iput-wide v4, p0, Ll/pbs0;->e:J

    .line 69
    .line 70
    move-wide/from16 p1, p9

    .line 71
    .line 72
    iput-wide p1, p0, Ll/pbs0;->f:J

    .line 73
    .line 74
    iput-wide v6, p0, Ll/pbs0;->g:J

    .line 75
    .line 76
    move-object/from16 p1, p13

    .line 77
    .line 78
    iput-object p1, p0, Ll/pbs0;->h:Ljava/lang/Long;

    .line 79
    .line 80
    move-object/from16 p1, p14

    .line 81
    .line 82
    iput-object p1, p0, Ll/pbs0;->i:Ljava/lang/Long;

    .line 83
    .line 84
    move-object/from16 p1, p15

    .line 85
    .line 86
    iput-object p1, p0, Ll/pbs0;->j:Ljava/lang/Long;

    .line 87
    .line 88
    move-object/from16 p1, p16

    .line 89
    .line 90
    iput-object p1, p0, Ll/pbs0;->k:Ljava/lang/Boolean;

    .line 91
    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 17

    const/4 v15, 0x0

    const/16 v16, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v9, p7

    .line 93
    invoke-direct/range {v0 .. v16}, Ll/pbs0;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final a(J)Ll/pbs0;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/pbs0;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/pbs0;->a:Ljava/lang/String;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/pbs0;->b:Ljava/lang/String;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/pbs0;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/pbs0;->d:J

    .line 16
    .line 17
    move-object v9, v7

    .line 18
    iget-wide v7, v0, Ll/pbs0;->e:J

    .line 19
    .line 20
    iget-wide v11, v0, Ll/pbs0;->g:J

    .line 21
    .line 22
    iget-object v13, v0, Ll/pbs0;->h:Ljava/lang/Long;

    .line 23
    .line 24
    iget-object v14, v0, Ll/pbs0;->i:Ljava/lang/Long;

    .line 25
    .line 26
    iget-object v15, v0, Ll/pbs0;->j:Ljava/lang/Long;

    .line 27
    .line 28
    iget-object v0, v0, Ll/pbs0;->k:Ljava/lang/Boolean;

    .line 29
    .line 30
    move-object/from16 v16, v0

    .line 31
    .line 32
    move-object v0, v9

    .line 33
    move-wide/from16 v9, p1

    .line 34
    .line 35
    invoke-direct/range {v0 .. v16}, Ll/pbs0;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public final b(JJ)Ll/pbs0;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/pbs0;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v0, Ll/pbs0;->a:Ljava/lang/String;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v0, Ll/pbs0;->b:Ljava/lang/String;

    .line 10
    .line 11
    move-object v5, v3

    .line 12
    iget-wide v3, v0, Ll/pbs0;->c:J

    .line 13
    .line 14
    move-object v7, v5

    .line 15
    iget-wide v5, v0, Ll/pbs0;->d:J

    .line 16
    .line 17
    move-object v9, v7

    .line 18
    iget-wide v7, v0, Ll/pbs0;->e:J

    .line 19
    .line 20
    move-object v11, v9

    .line 21
    iget-wide v9, v0, Ll/pbs0;->f:J

    .line 22
    .line 23
    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v13

    .line 27
    iget-object v14, v0, Ll/pbs0;->i:Ljava/lang/Long;

    .line 28
    .line 29
    iget-object v15, v0, Ll/pbs0;->j:Ljava/lang/Long;

    .line 30
    .line 31
    iget-object v0, v0, Ll/pbs0;->k:Ljava/lang/Boolean;

    .line 32
    .line 33
    move-object/from16 v16, v0

    .line 34
    .line 35
    move-object v0, v11

    .line 36
    move-wide/from16 v11, p1

    .line 37
    .line 38
    invoke-direct/range {v0 .. v16}, Ll/pbs0;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    move-object v11, v0

    .line 42
    return-object v11
.end method

.method public final c(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)Ll/pbs0;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    move-object/from16 v18, v1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object/from16 v18, p3

    .line 16
    .line 17
    :goto_0
    new-instance v2, Ll/pbs0;

    .line 18
    .line 19
    iget-object v3, v0, Ll/pbs0;->a:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v4, v0, Ll/pbs0;->b:Ljava/lang/String;

    .line 22
    .line 23
    iget-wide v5, v0, Ll/pbs0;->c:J

    .line 24
    .line 25
    iget-wide v7, v0, Ll/pbs0;->d:J

    .line 26
    .line 27
    iget-wide v9, v0, Ll/pbs0;->e:J

    .line 28
    .line 29
    iget-wide v11, v0, Ll/pbs0;->f:J

    .line 30
    .line 31
    iget-wide v13, v0, Ll/pbs0;->g:J

    .line 32
    .line 33
    iget-object v15, v0, Ll/pbs0;->h:Ljava/lang/Long;

    .line 34
    .line 35
    move-object/from16 v16, p1

    .line 36
    .line 37
    move-object/from16 v17, p2

    .line 38
    .line 39
    invoke-direct/range {v2 .. v18}, Ll/pbs0;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V

    .line 40
    .line 41
    .line 42
    return-object v2
.end method
