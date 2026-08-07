.class public abstract Ll/s2s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r2s0;


# static fields
.field public static volatile u:Ll/b4s0;


# instance fields
.field public a:Landroid/view/MotionEvent;

.field public final b:Ljava/util/LinkedList;

.field public c:J

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:J

.field public j:D

.field public k:D

.field public l:D

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:Z

.field public r:Z

.field public s:Landroid/util/DisplayMetrics;

.field public t:Ll/u3s0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/s2s0;->c:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/s2s0;->d:J

    .line 16
    .line 17
    iput-wide v0, p0, Ll/s2s0;->e:J

    .line 18
    .line 19
    iput-wide v0, p0, Ll/s2s0;->f:J

    .line 20
    .line 21
    iput-wide v0, p0, Ll/s2s0;->g:J

    .line 22
    .line 23
    iput-wide v0, p0, Ll/s2s0;->h:J

    .line 24
    .line 25
    iput-wide v0, p0, Ll/s2s0;->i:J

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ll/s2s0;->q:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/s2s0;->r:Z

    .line 31
    .line 32
    :try_start_0
    invoke-static {}, Ll/s0s0;->d()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/s2s0;->s:Landroid/util/DisplayMetrics;

    .line 44
    .line 45
    sget-object p1, Ll/sgs0;->z2:Ll/dgs0;

    .line 46
    .line 47
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_0

    .line 62
    .line 63
    new-instance p1, Ll/u3s0;

    .line 64
    .line 65
    invoke-direct {p1}, Ll/u3s0;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Ll/s2s0;->t:Ll/u3s0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .line 70
    :catchall_0
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-static {}, Ll/e4s0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v6, 0x0

    .line 8
    const/4 v7, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x1

    .line 11
    const/4 v5, 0x0

    .line 12
    move-object v1, p0

    .line 13
    move-object v2, p1

    .line 14
    invoke-virtual/range {v1 .. v7}, Ll/s2s0;->o(Landroid/content/Context;Ljava/lang/String;ILandroid/view/View;Landroid/app/Activity;[B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const-string p0, "The caller must not be called from the UI thread."

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public final declared-synchronized b(III)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v0, v1, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    sget-object v0, Ll/sgs0;->p2:Ll/dgs0;

    .line 9
    .line 10
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/s2s0;->n()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    iget-object v0, v1, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    iget-object v0, v1, Ll/s2s0;->s:Landroid/util/DisplayMetrics;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    move/from16 v2, p3

    .line 42
    .line 43
    int-to-long v4, v2

    .line 44
    move/from16 v2, p1

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 48
    .line 49
    mul-float v7, v2, v0

    .line 50
    .line 51
    move/from16 v2, p2

    .line 52
    .line 53
    int-to-float v2, v2

    .line 54
    mul-float v8, v2, v0

    .line 55
    .line 56
    const/4 v14, 0x0

    .line 57
    const/4 v15, 0x0

    .line 58
    const-wide/16 v2, 0x0

    .line 59
    .line 60
    const/4 v6, 0x1

    .line 61
    const/4 v9, 0x0

    .line 62
    const/4 v10, 0x0

    .line 63
    const/4 v11, 0x0

    .line 64
    const/4 v12, 0x0

    .line 65
    const/4 v13, 0x0

    .line 66
    invoke-static/range {v2 .. v15}, Landroid/view/MotionEvent;->obtain(JJIFFFFIFFII)Landroid/view/MotionEvent;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, v1, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const/4 v0, 0x0

    .line 74
    iput-object v0, v1, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 75
    .line 76
    :goto_1
    const/4 v0, 0x0

    .line 77
    iput-boolean v0, v1, Ll/s2s0;->r:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    monitor-exit p0

    .line 80
    return-void

    .line 81
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    throw v0
.end method

.method public final c(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)Ljava/lang/String;
    .locals 7
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v3, 0x3

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v4, p3

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/s2s0;->o(Landroid/content/Context;Ljava/lang/String;ILandroid/view/View;Landroid/app/Activity;[B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final d([Ljava/lang/StackTraceElement;)V
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->z2:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/s2s0;->t:Ll/u3s0;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/u3s0;->b(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final declared-synchronized f(Landroid/view/MotionEvent;)V
    .locals 13
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/s2s0;->q:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/s2s0;->n()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Ll/s2s0;->q:Z

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x2

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    if-eq v0, v2, :cond_1

    .line 25
    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    float-to-double v3, v0

    .line 34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    float-to-double v5, v0

    .line 39
    iget-wide v7, p0, Ll/s2s0;->k:D

    .line 40
    .line 41
    sub-double v7, v3, v7

    .line 42
    .line 43
    iget-wide v9, p0, Ll/s2s0;->l:D

    .line 44
    .line 45
    sub-double v9, v5, v9

    .line 46
    .line 47
    iget-wide v11, p0, Ll/s2s0;->j:D

    .line 48
    .line 49
    mul-double/2addr v7, v7

    .line 50
    mul-double/2addr v9, v9

    .line 51
    add-double/2addr v7, v9

    .line 52
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 53
    .line 54
    .line 55
    move-result-wide v7

    .line 56
    add-double/2addr v11, v7

    .line 57
    iput-wide v11, p0, Ll/s2s0;->j:D

    .line 58
    .line 59
    iput-wide v3, p0, Ll/s2s0;->k:D

    .line 60
    .line 61
    iput-wide v5, p0, Ll/s2s0;->l:D

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    const-wide/16 v3, 0x0

    .line 65
    .line 66
    iput-wide v3, p0, Ll/s2s0;->j:D

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    float-to-double v3, v0

    .line 73
    iput-wide v3, p0, Ll/s2s0;->k:D

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    float-to-double v3, v0

    .line 80
    iput-wide v3, p0, Ll/s2s0;->l:D

    .line 81
    .line 82
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const-wide/16 v3, 0x1

    .line 87
    .line 88
    if-eqz v0, :cond_8

    .line 89
    .line 90
    if-eq v0, v2, :cond_6

    .line 91
    .line 92
    if-eq v0, v1, :cond_4

    .line 93
    .line 94
    const/4 p1, 0x3

    .line 95
    if-eq v0, p1, :cond_3

    .line 96
    .line 97
    goto/16 :goto_2

    .line 98
    .line 99
    :cond_3
    iget-wide v0, p0, Ll/s2s0;->f:J

    .line 100
    .line 101
    add-long/2addr v0, v3

    .line 102
    iput-wide v0, p0, Ll/s2s0;->f:J

    .line 103
    .line 104
    goto/16 :goto_2

    .line 105
    .line 106
    :cond_4
    iget-wide v0, p0, Ll/s2s0;->d:J

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getHistorySize()I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    add-int/2addr v3, v2

    .line 113
    int-to-long v3, v3

    .line 114
    add-long/2addr v0, v3

    .line 115
    iput-wide v0, p0, Ll/s2s0;->d:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    .line 117
    :try_start_1
    invoke-virtual {p0, p1}, Ll/s2s0;->m(Landroid/view/MotionEvent;)Ll/d4s0;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iget-object v0, p1, Ll/d4s0;->d:Ljava/lang/Long;

    .line 122
    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    iget-object v1, p1, Ll/d4s0;->g:Ljava/lang/Long;

    .line 126
    .line 127
    if-eqz v1, :cond_5

    .line 128
    .line 129
    iget-wide v3, p0, Ll/s2s0;->h:J

    .line 130
    .line 131
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 132
    .line 133
    .line 134
    move-result-wide v0

    .line 135
    iget-object v5, p1, Ll/d4s0;->g:Ljava/lang/Long;

    .line 136
    .line 137
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 138
    .line 139
    .line 140
    move-result-wide v5

    .line 141
    add-long/2addr v0, v5

    .line 142
    add-long/2addr v3, v0

    .line 143
    iput-wide v3, p0, Ll/s2s0;->h:J

    .line 144
    .line 145
    :cond_5
    iget-object v0, p0, Ll/s2s0;->s:Landroid/util/DisplayMetrics;

    .line 146
    .line 147
    if-eqz v0, :cond_9

    .line 148
    .line 149
    iget-object v0, p1, Ll/d4s0;->e:Ljava/lang/Long;

    .line 150
    .line 151
    if-eqz v0, :cond_9

    .line 152
    .line 153
    iget-object v1, p1, Ll/d4s0;->h:Ljava/lang/Long;

    .line 154
    .line 155
    if-eqz v1, :cond_9

    .line 156
    .line 157
    iget-wide v3, p0, Ll/s2s0;->i:J

    .line 158
    .line 159
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 160
    .line 161
    .line 162
    move-result-wide v0

    .line 163
    iget-object p1, p1, Ll/d4s0;->h:Ljava/lang/Long;

    .line 164
    .line 165
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 166
    .line 167
    .line 168
    move-result-wide v5

    .line 169
    add-long/2addr v0, v5

    .line 170
    add-long/2addr v3, v0

    .line 171
    iput-wide v3, p0, Ll/s2s0;->i:J
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzavz; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_6
    :try_start_2
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iput-object p1, p0, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 179
    .line 180
    iget-object v0, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 181
    .line 182
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    const/4 v0, 0x6

    .line 192
    if-le p1, v0, :cond_7

    .line 193
    .line 194
    iget-object p1, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 195
    .line 196
    invoke-virtual {p1}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    check-cast p1, Landroid/view/MotionEvent;

    .line 201
    .line 202
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 203
    .line 204
    .line 205
    :cond_7
    iget-wide v0, p0, Ll/s2s0;->e:J

    .line 206
    .line 207
    add-long/2addr v0, v3

    .line 208
    iput-wide v0, p0, Ll/s2s0;->e:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 209
    .line 210
    :try_start_3
    new-instance p1, Ljava/lang/Throwable;

    .line 211
    .line 212
    invoke-direct {p1}, Ljava/lang/Throwable;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {p0, p1}, Ll/s2s0;->i([Ljava/lang/StackTraceElement;)J

    .line 220
    .line 221
    .line 222
    move-result-wide v0

    .line 223
    iput-wide v0, p0, Ll/s2s0;->g:J
    :try_end_3
    .catch Lcom/google/android/gms/internal/ads/zzavz; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_8
    :try_start_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    iput v0, p0, Ll/s2s0;->m:F

    .line 231
    .line 232
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    iput v0, p0, Ll/s2s0;->n:F

    .line 237
    .line 238
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    iput v0, p0, Ll/s2s0;->o:F

    .line 243
    .line 244
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    iput p1, p0, Ll/s2s0;->p:F

    .line 249
    .line 250
    iget-wide v0, p0, Ll/s2s0;->c:J

    .line 251
    .line 252
    add-long/2addr v0, v3

    .line 253
    iput-wide v0, p0, Ll/s2s0;->c:J

    .line 254
    .line 255
    :catch_0
    :cond_9
    :goto_2
    iput-boolean v2, p0, Ll/s2s0;->r:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 256
    .line 257
    monitor-exit p0

    .line 258
    return-void

    .line 259
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 260
    throw p1
.end method

.method public final g(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Landroid/app/Activity;)Ljava/lang/String;
    .locals 7
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v3, 0x3

    .line 2
    const/4 v6, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/s2s0;->o(Landroid/content/Context;Ljava/lang/String;ILandroid/view/View;Landroid/app/Activity;[B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final h(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ljava/lang/String;
    .locals 7
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v3, 0x2

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v4, p2

    .line 7
    move-object v5, p3

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/s2s0;->o(Landroid/content/Context;Ljava/lang/String;ILandroid/view/View;Landroid/app/Activity;[B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public abstract i([Ljava/lang/StackTraceElement;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzavz;
        }
    .end annotation
.end method

.method public abstract j(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ll/fzr0;
.end method

.method public abstract k(Landroid/content/Context;Lcom/google/android/gms/internal/ads/d;)Ll/fzr0;
.end method

.method public abstract l(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ll/fzr0;
.end method

.method public abstract m(Landroid/view/MotionEvent;)Ll/d4s0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzavz;
        }
    .end annotation
.end method

.method public final n()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/s2s0;->g:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/s2s0;->c:J

    .line 6
    .line 7
    iput-wide v0, p0, Ll/s2s0;->d:J

    .line 8
    .line 9
    iput-wide v0, p0, Ll/s2s0;->e:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/s2s0;->f:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/s2s0;->h:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/s2s0;->i:J

    .line 16
    .line 17
    iget-object v0, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Landroid/view/MotionEvent;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Ll/s2s0;->b:Ljava/util/LinkedList;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    iget-object v0, p0, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Ll/s2s0;->a:Landroid/view/MotionEvent;

    .line 62
    .line 63
    return-void
.end method

.method public final o(Landroid/content/Context;Ljava/lang/String;ILandroid/view/View;Landroid/app/Activity;[B)Ljava/lang/String;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v5

    .line 15
    sget-object v7, Ll/sgs0;->r2:Ll/dgs0;

    .line 16
    .line 17
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 18
    .line 19
    .line 20
    move-result-object v8

    .line 21
    invoke-virtual {v8, v7}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    check-cast v7, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    const/4 v8, 0x0

    .line 32
    if-eqz v7, :cond_1

    .line 33
    .line 34
    sget-object v9, Ll/s2s0;->u:Ll/b4s0;

    .line 35
    .line 36
    if-eqz v9, :cond_0

    .line 37
    .line 38
    sget-object v9, Ll/s2s0;->u:Ll/b4s0;

    .line 39
    .line 40
    invoke-virtual {v9}, Ll/b4s0;->d()Ll/q2s0;

    .line 41
    .line 42
    .line 43
    move-result-object v9

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move-object v9, v8

    .line 46
    :goto_0
    const-string v10, "be"

    .line 47
    .line 48
    move-object v11, v9

    .line 49
    move-object/from16 v16, v10

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move-object v11, v8

    .line 53
    move-object/from16 v16, v11

    .line 54
    .line 55
    :goto_1
    const/4 v9, 0x1

    .line 56
    const/4 v10, 0x2

    .line 57
    const/4 v12, 0x3

    .line 58
    if-ne v2, v12, :cond_2

    .line 59
    .line 60
    :try_start_0
    invoke-virtual {v0, v1, v3, v4}, Ll/s2s0;->j(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ll/fzr0;

    .line 61
    .line 62
    .line 63
    move-result-object v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 64
    :try_start_1
    iput-boolean v9, v0, Ll/s2s0;->q:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 65
    .line 66
    const/16 v0, 0x3ea

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :catch_0
    move-exception v0

    .line 70
    move-object/from16 v17, v0

    .line 71
    .line 72
    move v1, v12

    .line 73
    goto :goto_5

    .line 74
    :cond_2
    if-ne v2, v10, :cond_3

    .line 75
    .line 76
    :try_start_2
    invoke-virtual {v0, v1, v3, v4}, Ll/s2s0;->l(Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Ll/fzr0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/16 v1, 0x3f0

    .line 81
    .line 82
    :goto_2
    move-object v8, v0

    .line 83
    move v0, v1

    .line 84
    goto :goto_3

    .line 85
    :cond_3
    invoke-virtual {v0, v1, v8}, Ll/s2s0;->k(Landroid/content/Context;Lcom/google/android/gms/internal/ads/d;)Ll/fzr0;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/16 v1, 0x3e8

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :goto_3
    if-eqz v7, :cond_4

    .line 93
    .line 94
    if-eqz v11, :cond_4

    .line 95
    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 100
    sub-long v14, v3, v5

    .line 101
    .line 102
    const/4 v13, -0x1

    .line 103
    const/16 v17, 0x0

    .line 104
    .line 105
    move v1, v12

    .line 106
    move v12, v0

    .line 107
    :try_start_3
    invoke-virtual/range {v11 .. v17}, Ll/q2s0;->c(IIJLjava/lang/String;Ljava/lang/Exception;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 108
    .line 109
    .line 110
    goto :goto_8

    .line 111
    :catch_1
    move-exception v0

    .line 112
    goto :goto_4

    .line 113
    :catch_2
    move-exception v0

    .line 114
    move v1, v12

    .line 115
    :goto_4
    move-object/from16 v17, v0

    .line 116
    .line 117
    goto :goto_5

    .line 118
    :cond_4
    move v1, v12

    .line 119
    goto :goto_8

    .line 120
    :goto_5
    if-eqz v7, :cond_7

    .line 121
    .line 122
    if-eqz v11, :cond_7

    .line 123
    .line 124
    if-ne v2, v1, :cond_5

    .line 125
    .line 126
    const/16 v0, 0x3eb

    .line 127
    .line 128
    :goto_6
    move v12, v0

    .line 129
    goto :goto_7

    .line 130
    :cond_5
    if-ne v2, v10, :cond_6

    .line 131
    .line 132
    const/16 v0, 0x3f1

    .line 133
    .line 134
    goto :goto_6

    .line 135
    :cond_6
    const/16 v0, 0x3e9

    .line 136
    .line 137
    move v12, v0

    .line 138
    move v2, v9

    .line 139
    :goto_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    sub-long v14, v3, v5

    .line 144
    .line 145
    const/4 v13, -0x1

    .line 146
    invoke-virtual/range {v11 .. v17}, Ll/q2s0;->c(IIJLjava/lang/String;Ljava/lang/Exception;)V

    .line 147
    .line 148
    .line 149
    :cond_7
    :goto_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 150
    .line 151
    .line 152
    move-result-wide v3

    .line 153
    if-eqz v8, :cond_b

    .line 154
    .line 155
    :try_start_4
    invoke-virtual {v8}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lcom/google/android/gms/internal/ads/n;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/p5;->zzaz()I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_8

    .line 166
    .line 167
    goto :goto_a

    .line 168
    :cond_8
    invoke-virtual {v8}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/google/android/gms/internal/ads/n;

    .line 173
    .line 174
    sget-boolean v5, Ll/s0s0;->a:Z

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    move-object/from16 v5, p2

    .line 181
    .line 182
    invoke-static {v0, v5}, Ll/s0s0;->a([BLjava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    if-eqz v7, :cond_f

    .line 187
    .line 188
    if-eqz v11, :cond_f

    .line 189
    .line 190
    if-ne v2, v1, :cond_9

    .line 191
    .line 192
    const/16 v5, 0x3ee

    .line 193
    .line 194
    goto :goto_9

    .line 195
    :cond_9
    if-ne v2, v10, :cond_a

    .line 196
    .line 197
    const/16 v5, 0x3f2

    .line 198
    .line 199
    goto :goto_9

    .line 200
    :cond_a
    const/16 v5, 0x3ec

    .line 201
    .line 202
    :goto_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 203
    .line 204
    .line 205
    move-result-wide v8
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 206
    sub-long/2addr v8, v3

    .line 207
    const/4 v6, -0x1

    .line 208
    const/4 v12, 0x0

    .line 209
    move/from16 p1, v5

    .line 210
    .line 211
    move/from16 p2, v6

    .line 212
    .line 213
    move-wide/from16 p3, v8

    .line 214
    .line 215
    move-object/from16 p0, v11

    .line 216
    .line 217
    move-object/from16 p6, v12

    .line 218
    .line 219
    move-object/from16 p5, v16

    .line 220
    .line 221
    :try_start_5
    invoke-virtual/range {p0 .. p6}, Ll/q2s0;->c(IIJLjava/lang/String;Ljava/lang/Exception;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 222
    .line 223
    .line 224
    goto :goto_d

    .line 225
    :catch_3
    move-exception v0

    .line 226
    move-object/from16 v11, p0

    .line 227
    .line 228
    move-object/from16 v16, p5

    .line 229
    .line 230
    goto :goto_b

    .line 231
    :catch_4
    move-exception v0

    .line 232
    goto :goto_b

    .line 233
    :cond_b
    :goto_a
    const/4 v0, 0x5

    .line 234
    :try_start_6
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 238
    goto :goto_d

    .line 239
    :goto_b
    const/4 v5, 0x7

    .line 240
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    if-eqz v7, :cond_e

    .line 245
    .line 246
    if-eqz v11, :cond_e

    .line 247
    .line 248
    if-ne v2, v1, :cond_c

    .line 249
    .line 250
    const/16 v1, 0x3ef

    .line 251
    .line 252
    goto :goto_c

    .line 253
    :cond_c
    if-ne v2, v10, :cond_d

    .line 254
    .line 255
    const/16 v1, 0x3f3

    .line 256
    .line 257
    goto :goto_c

    .line 258
    :cond_d
    const/16 v1, 0x3ed

    .line 259
    .line 260
    :goto_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 261
    .line 262
    .line 263
    move-result-wide v6

    .line 264
    sub-long/2addr v6, v3

    .line 265
    const/4 v2, -0x1

    .line 266
    move-object/from16 p6, v0

    .line 267
    .line 268
    move/from16 p1, v1

    .line 269
    .line 270
    move/from16 p2, v2

    .line 271
    .line 272
    move-wide/from16 p3, v6

    .line 273
    .line 274
    move-object/from16 p0, v11

    .line 275
    .line 276
    move-object/from16 p5, v16

    .line 277
    .line 278
    invoke-virtual/range {p0 .. p6}, Ll/q2s0;->c(IIJLjava/lang/String;Ljava/lang/Exception;)V

    .line 279
    .line 280
    .line 281
    :cond_e
    move-object v0, v5

    .line 282
    :cond_f
    :goto_d
    return-object v0
.end method
