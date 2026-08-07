.class public Ll/mre;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mre$a;,
        Ll/mre$b;
    }
.end annotation


# instance fields
.field public A:I

.field protected B:I

.field protected C:I

.field protected D:I

.field protected a:Ll/mre$b;

.field protected b:Ll/mre$a;

.field protected c:Ll/vje;

.field protected d:Ll/vje;

.field protected e:Ljava/lang/Object;

.field private final f:Ljava/lang/Object;

.field private final g:Ljava/lang/Object;

.field protected final h:Ljava/lang/Object;

.field private i:Z

.field protected j:Ljava/lang/Boolean;

.field protected k:Z

.field protected l:I

.field private m:Z

.field protected n:Ljava/lang/String;

.field protected o:Ljava/lang/Runnable;

.field private p:Z

.field private q:Z

.field private r:Z

.field protected s:Z

.field protected t:J

.field protected u:J

.field protected v:J

.field protected w:I

.field protected x:I

.field protected y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/mre;->c:Ll/vje;

    .line 6
    .line 7
    iput-object v0, p0, Ll/mre;->d:Ll/vje;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/mre;->f:Ljava/lang/Object;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/mre;->g:Ljava/lang/Object;

    .line 22
    .line 23
    new-instance v0, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/mre;->h:Ljava/lang/Object;

    .line 29
    .line 30
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    iput-object v0, p0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Ll/mre;->k:Z

    .line 36
    .line 37
    iput v0, p0, Ll/mre;->l:I

    .line 38
    .line 39
    iput-boolean v0, p0, Ll/mre;->p:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Ll/mre;->q:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Ll/mre;->r:Z

    .line 44
    .line 45
    iput-boolean v0, p0, Ll/mre;->s:Z

    .line 46
    .line 47
    const-wide/16 v1, 0x0

    .line 48
    .line 49
    iput-wide v1, p0, Ll/mre;->v:J

    .line 50
    .line 51
    iput v0, p0, Ll/mre;->w:I

    .line 52
    .line 53
    iput v0, p0, Ll/mre;->x:I

    .line 54
    .line 55
    const/16 v1, 0x1e

    .line 56
    .line 57
    iput v1, p0, Ll/mre;->z:I

    .line 58
    .line 59
    iput v0, p0, Ll/mre;->A:I

    .line 60
    .line 61
    iput v0, p0, Ll/mre;->B:I

    .line 62
    .line 63
    return-void
.end method

.method public static synthetic a(Ll/mre;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mre;->g:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/mre;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mre;->i:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/mre;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mre;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/mre;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mre;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/mre;->c:Ll/vje;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/mre;->e:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/vje;->e()Z

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {v0, v0, v0, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x4000

    .line 17
    .line 18
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/mre;->c:Ll/vje;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/vje;->g()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mre;->c:Ll/vje;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/vje;->f()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/mre;->c:Ll/vje;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/mre;->b:Ll/mre$a;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ll/mre$a;->f(Ll/mre;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/mre;->b:Ll/mre$a;

    .line 19
    .line 20
    :cond_1
    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mre;->a:Ll/mre$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v1, p0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Ll/mre;->p:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Ll/mre;->k:Z

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/mre$b;->a()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/mre;->a:Ll/mre$b;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mre;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Landroid/graphics/SurfaceTexture;
    .locals 4

    .line 1
    const/4 p0, 0x1

    .line 2
    new-array v0, p0, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget p0, v0, v1

    .line 9
    .line 10
    const v2, 0x8d65

    .line 11
    .line 12
    .line 13
    invoke-static {v2, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x2801

    .line 17
    .line 18
    const v3, 0x46180400    # 9729.0f

    .line 19
    .line 20
    .line 21
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 22
    .line 23
    .line 24
    const/16 p0, 0x2800

    .line 25
    .line 26
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x2802

    .line 30
    .line 31
    const v3, 0x812f

    .line 32
    .line 33
    .line 34
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 35
    .line 36
    .line 37
    const/16 p0, 0x2803

    .line 38
    .line 39
    invoke-static {v2, p0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Landroid/graphics/SurfaceTexture;

    .line 43
    .line 44
    aget v0, v0, v1

    .line 45
    .line 46
    invoke-direct {p0, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 47
    .line 48
    .line 49
    return-object p0
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mre;->b:Ll/mre$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/mre;->d:Ll/vje;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/mre;->c:Ll/vje;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ll/mre$a;->a()Ll/vje;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/mre;->d:Ll/vje;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/mre;->c:Ll/vje;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Ll/mre;->d:Ll/vje;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Ll/mre;->e:Ljava/lang/Object;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/mre;->h()Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/mre;->e:Ljava/lang/Object;

    .line 36
    .line 37
    :cond_1
    :try_start_0
    new-instance v0, Ll/vje;

    .line 38
    .line 39
    iget-object v1, p0, Ll/mre;->b:Ll/mre$a;

    .line 40
    .line 41
    invoke-interface {v1}, Ll/mre$a;->b()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-direct {v0, v1}, Ll/vje;-><init>(Z)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/mre;->c:Ll/vje;

    .line 49
    .line 50
    iget-object v1, p0, Ll/mre;->d:Ll/vje;

    .line 51
    .line 52
    iget-object v1, v1, Ll/vje;->c:Landroid/opengl/EGLContext;

    .line 53
    .line 54
    iget-object v2, p0, Ll/mre;->e:Ljava/lang/Object;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ll/vje;->b(Landroid/opengl/EGLContext;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catch_0
    move-exception v0

    .line 61
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object v0, p0, Ll/mre;->b:Ll/mre$a;

    .line 65
    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    invoke-interface {v0, p0}, Ll/mre$a;->g(Ll/mre;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public j()V
    .locals 15

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/mre;->o:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-object v2, p0, Ll/mre;->o:Ljava/lang/Runnable;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    move-object v10, p0

    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    :goto_0
    iget-boolean v2, p0, Ll/mre;->m:Z

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    iget-object v2, p0, Ll/mre;->d:Ll/vje;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {v2}, Ll/vje;->e()Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/mre;->b:Ll/mre$a;

    .line 32
    .line 33
    iget-object v1, p0, Ll/mre;->d:Ll/vje;

    .line 34
    .line 35
    invoke-interface {v0, v1, p0}, Ll/mre$a;->i(Ll/vje;Ll/mre;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/mre;->d:Ll/vje;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/vje;->g()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object v2, p0, Ll/mre;->c:Ll/vje;

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    const/4 v4, 0x1

    .line 48
    if-eqz v2, :cond_6

    .line 49
    .line 50
    iget-object v5, p0, Ll/mre;->e:Ljava/lang/Object;

    .line 51
    .line 52
    if-eqz v5, :cond_6

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/vje;->d()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget-object v5, p0, Ll/mre;->c:Ll/vje;

    .line 59
    .line 60
    invoke-virtual {v5}, Ll/vje;->c()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    iget v6, p0, Ll/mre;->C:I

    .line 65
    .line 66
    if-ne v5, v6, :cond_2

    .line 67
    .line 68
    iget v7, p0, Ll/mre;->D:I

    .line 69
    .line 70
    if-eq v2, v7, :cond_3

    .line 71
    .line 72
    :cond_2
    if-lez v6, :cond_3

    .line 73
    .line 74
    iget-object v6, p0, Ll/mre;->b:Ll/mre$a;

    .line 75
    .line 76
    invoke-interface {v6, v5, v2}, Ll/mre$a;->e(II)V

    .line 77
    .line 78
    .line 79
    move v6, v4

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    move v6, v3

    .line 82
    :goto_1
    iput v5, p0, Ll/mre;->C:I

    .line 83
    .line 84
    iput v2, p0, Ll/mre;->D:I

    .line 85
    .line 86
    iget-object v2, p0, Ll/mre;->b:Ll/mre$a;

    .line 87
    .line 88
    if-eqz v2, :cond_5

    .line 89
    .line 90
    iget-object v2, p0, Ll/mre;->c:Ll/vje;

    .line 91
    .line 92
    invoke-virtual {v2}, Ll/vje;->e()Z

    .line 93
    .line 94
    .line 95
    iget-object v2, p0, Ll/mre;->b:Ll/mre$a;

    .line 96
    .line 97
    iget-object v5, p0, Ll/mre;->c:Ll/vje;

    .line 98
    .line 99
    invoke-interface {v2, v5, p0}, Ll/mre$a;->i(Ll/vje;Ll/mre;)V

    .line 100
    .line 101
    .line 102
    iget-boolean v2, p0, Ll/mre;->r:Z

    .line 103
    .line 104
    if-nez v2, :cond_4

    .line 105
    .line 106
    iput-boolean v4, p0, Ll/mre;->r:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .line 108
    :cond_4
    :try_start_1
    iget-object v2, p0, Ll/mre;->c:Ll/vje;

    .line 109
    .line 110
    invoke-virtual {v2}, Ll/vje;->g()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    .line 112
    .line 113
    :catch_0
    :cond_5
    if-eqz v6, :cond_6

    .line 114
    .line 115
    :try_start_2
    iget-object v2, p0, Ll/mre;->b:Ll/mre$a;

    .line 116
    .line 117
    invoke-interface {v2}, Ll/mre$a;->d()V

    .line 118
    .line 119
    .line 120
    :cond_6
    iget v2, p0, Ll/mre;->l:I

    .line 121
    .line 122
    if-ne v2, v4, :cond_7

    .line 123
    .line 124
    iget-object v2, p0, Ll/mre;->b:Ll/mre$a;

    .line 125
    .line 126
    invoke-interface {v2}, Ll/mre$a;->c()V

    .line 127
    .line 128
    .line 129
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 130
    .line 131
    .line 132
    move-result-wide v5

    .line 133
    iget v2, p0, Ll/mre;->w:I

    .line 134
    .line 135
    add-int/2addr v2, v4

    .line 136
    iput v2, p0, Ll/mre;->w:I

    .line 137
    .line 138
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 139
    .line 140
    .line 141
    move-result-wide v7

    .line 142
    const-wide/16 v9, 0x3e8

    .line 143
    .line 144
    div-long/2addr v7, v9

    .line 145
    iput-wide v7, p0, Ll/mre;->t:J

    .line 146
    .line 147
    iget v2, p0, Ll/mre;->w:I

    .line 148
    .line 149
    const/4 v4, 0x3

    .line 150
    const-wide/16 v9, 0x1

    .line 151
    .line 152
    if-le v2, v4, :cond_8

    .line 153
    .line 154
    iget v4, p0, Ll/mre;->x:I

    .line 155
    .line 156
    int-to-long v11, v4

    .line 157
    iget-wide v13, p0, Ll/mre;->u:J

    .line 158
    .line 159
    sub-long/2addr v7, v13

    .line 160
    add-long/2addr v11, v7

    .line 161
    long-to-int v4, v11

    .line 162
    iput v4, p0, Ll/mre;->x:I

    .line 163
    .line 164
    iget-wide v7, p0, Ll/mre;->v:J

    .line 165
    .line 166
    add-long/2addr v7, v9

    .line 167
    iput-wide v7, p0, Ll/mre;->v:J

    .line 168
    .line 169
    :cond_8
    const/16 v4, 0x14

    .line 170
    .line 171
    if-le v2, v4, :cond_b

    .line 172
    .line 173
    iget v2, p0, Ll/mre;->x:I

    .line 174
    .line 175
    int-to-long v7, v2

    .line 176
    iget-wide v11, p0, Ll/mre;->v:J

    .line 177
    .line 178
    div-long/2addr v7, v11

    .line 179
    const-wide/16 v11, 0x0

    .line 180
    .line 181
    cmp-long v2, v7, v11

    .line 182
    .line 183
    if-lez v2, :cond_9

    .line 184
    .line 185
    const-wide/32 v13, 0xf4240

    .line 186
    .line 187
    .line 188
    div-long/2addr v13, v7

    .line 189
    add-long/2addr v13, v9

    .line 190
    long-to-int v2, v13

    .line 191
    iput v2, p0, Ll/mre;->y:I

    .line 192
    .line 193
    :cond_9
    iget v2, p0, Ll/mre;->y:I

    .line 194
    .line 195
    if-lez v2, :cond_a

    .line 196
    .line 197
    const/16 v4, 0x3e8

    .line 198
    .line 199
    div-int/2addr v4, v2

    .line 200
    iput v4, p0, Ll/mre;->z:I

    .line 201
    .line 202
    :cond_a
    iput-wide v11, p0, Ll/mre;->v:J

    .line 203
    .line 204
    iput-wide v11, p0, Ll/mre;->u:J

    .line 205
    .line 206
    iput-wide v11, p0, Ll/mre;->t:J

    .line 207
    .line 208
    iput v3, p0, Ll/mre;->x:I

    .line 209
    .line 210
    iput v3, p0, Ll/mre;->w:I

    .line 211
    .line 212
    :cond_b
    iget-wide v7, p0, Ll/mre;->t:J

    .line 213
    .line 214
    iput-wide v7, p0, Ll/mre;->u:J

    .line 215
    .line 216
    iget-object v9, p0, Ll/mre;->b:Ll/mre$a;

    .line 217
    .line 218
    if-eqz v9, :cond_d

    .line 219
    .line 220
    sub-long/2addr v5, v0

    .line 221
    long-to-int v0, v5

    .line 222
    iget v11, p0, Ll/mre;->y:I

    .line 223
    .line 224
    if-gez v0, :cond_c

    .line 225
    .line 226
    move v12, v3

    .line 227
    goto :goto_2

    .line 228
    :cond_c
    move v12, v0

    .line 229
    :goto_2
    iget v14, p0, Ll/mre;->A:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 230
    .line 231
    const/4 v13, 0x0

    .line 232
    move-object v10, p0

    .line 233
    :try_start_3
    invoke-interface/range {v9 .. v14}, Ll/mre$a;->h(Ll/mre;IIII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 234
    .line 235
    .line 236
    goto :goto_4

    .line 237
    :catchall_1
    move-exception v0

    .line 238
    :goto_3
    invoke-virtual {v10}, Ll/mre;->m()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 242
    .line 243
    .line 244
    :cond_d
    :goto_4
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mre;->a:Ll/mre$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/mre$b;

    .line 6
    .line 7
    const-string v1, "EffectPipRender"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ll/mre$b;-><init>(Ll/mre;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/mre;->a:Ll/mre$b;

    .line 13
    .line 14
    const/16 v1, 0xa

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/mre;->a:Ll/mre$b;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/mre;->g:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter v0

    .line 27
    :try_start_0
    iget-boolean v1, p0, Ll/mre;->i:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/mre;->g:Ljava/lang/Object;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 45
    throw p0
.end method

.method public m()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/mre;->s:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/mre;->h:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    iput-object v1, p0, Ll/mre;->j:Ljava/lang/Boolean;

    .line 20
    .line 21
    iget-object p0, p0, Ll/mre;->h:Ljava/lang/Object;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 24
    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0

    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public n(Ll/mre$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mre;->b:Ll/mre$a;

    .line 2
    .line 3
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mre;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public p(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mre;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/mre;->e:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/mre;->i()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/mre;->g:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 12
    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method
