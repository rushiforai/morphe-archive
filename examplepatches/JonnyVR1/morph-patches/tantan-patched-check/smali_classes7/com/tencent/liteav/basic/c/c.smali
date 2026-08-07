.class public Lcom/tencent/liteav/basic/c/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation


# static fields
.field private static a:I = 0x2

.field private static final b:Ljava/lang/String; = "c"

.field private static k:[I

.field private static l:[I


# instance fields
.field private c:Landroid/opengl/EGLDisplay;

.field private d:Landroid/opengl/EGLContext;

.field private e:Landroid/opengl/EGLConfig;

.field private f:I

.field private g:I

.field private h:Z

.field private i:Landroid/opengl/EGLSurface;

.field private j:I


# direct methods
.method static constructor <clinit>()V
    .locals 24

    .line 1
    sget v0, Lcom/tencent/liteav/basic/c/c;->a:I

    .line 2
    .line 3
    const/16 v1, 0x44

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    const/4 v3, 0x2

    .line 7
    if-ne v0, v3, :cond_0

    .line 8
    .line 9
    move/from16 v17, v2

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move/from16 v17, v1

    .line 13
    .line 14
    :goto_0
    const/16 v19, 0x1

    .line 15
    .line 16
    const/16 v20, 0x3038

    .line 17
    .line 18
    const/16 v4, 0x3024

    .line 19
    .line 20
    const/16 v5, 0x8

    .line 21
    .line 22
    const/16 v6, 0x3023

    .line 23
    .line 24
    const/16 v7, 0x8

    .line 25
    .line 26
    const/16 v8, 0x3022

    .line 27
    .line 28
    const/16 v9, 0x8

    .line 29
    .line 30
    const/16 v10, 0x3021

    .line 31
    .line 32
    const/16 v11, 0x8

    .line 33
    .line 34
    const/16 v12, 0x3025

    .line 35
    .line 36
    const/4 v13, 0x0

    .line 37
    const/16 v14, 0x3026

    .line 38
    .line 39
    const/4 v15, 0x0

    .line 40
    const/16 v16, 0x3040

    .line 41
    .line 42
    const/16 v18, 0x3142

    .line 43
    .line 44
    filled-new-array/range {v4 .. v20}, [I

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    sput-object v4, Lcom/tencent/liteav/basic/c/c;->k:[I

    .line 49
    .line 50
    if-ne v0, v3, :cond_1

    .line 51
    .line 52
    move/from16 v20, v2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    move/from16 v20, v1

    .line 56
    .line 57
    :goto_1
    const/16 v22, 0x1

    .line 58
    .line 59
    const/16 v23, 0x3038

    .line 60
    .line 61
    const/16 v5, 0x3033

    .line 62
    .line 63
    const/4 v6, 0x1

    .line 64
    const/16 v7, 0x3024

    .line 65
    .line 66
    const/16 v8, 0x8

    .line 67
    .line 68
    const/16 v9, 0x3023

    .line 69
    .line 70
    const/16 v10, 0x8

    .line 71
    .line 72
    const/16 v11, 0x3022

    .line 73
    .line 74
    const/16 v12, 0x8

    .line 75
    .line 76
    const/16 v13, 0x3021

    .line 77
    .line 78
    const/16 v14, 0x8

    .line 79
    .line 80
    const/16 v15, 0x3025

    .line 81
    .line 82
    const/16 v16, 0x0

    .line 83
    .line 84
    const/16 v17, 0x3026

    .line 85
    .line 86
    const/16 v18, 0x0

    .line 87
    .line 88
    const/16 v19, 0x3040

    .line 89
    .line 90
    const/16 v21, 0x3142

    .line 91
    .line 92
    filled-new-array/range {v5 .. v23}, [I

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sput-object v0, Lcom/tencent/liteav/basic/c/c;->l:[I

    .line 97
    .line 98
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/tencent/liteav/basic/c/c;->f:I

    .line 17
    .line 18
    iput v0, p0, Lcom/tencent/liteav/basic/c/c;->g:I

    .line 19
    .line 20
    const/4 v0, -0x1

    .line 21
    iput v0, p0, Lcom/tencent/liteav/basic/c/c;->j:I

    .line 22
    .line 23
    return-void
.end method

.method private static a(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;ILandroid/opengl/EGLContext;)Landroid/opengl/EGLContext;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tencent/liteav/basic/c/d;
        }
    .end annotation

    const/16 v0, 0x3098

    const/16 v1, 0x3038

    .line 208
    filled-new-array {v0, p2, v1}, [I

    move-result-object p2

    const/4 v0, 0x0

    .line 209
    invoke-static {p0, p1, p3, p2, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object p0

    .line 210
    invoke-static {}, Lcom/tencent/liteav/basic/c/c;->f()V

    return-object p0
.end method

.method public static a(Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;Landroid/view/Surface;II)Lcom/tencent/liteav/basic/c/c;
    .locals 1

    .line 204
    new-instance v0, Lcom/tencent/liteav/basic/c/c;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/c;-><init>()V

    .line 205
    iput p3, v0, Lcom/tencent/liteav/basic/c/c;->f:I

    .line 206
    iput p4, v0, Lcom/tencent/liteav/basic/c/c;->g:I

    .line 207
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/liteav/basic/c/c;->a(Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;Landroid/view/Surface;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;Landroid/view/Surface;)Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v3}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    iput-object v4, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 13
    .line 14
    sget-object v5, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 15
    .line 16
    if-ne v4, v5, :cond_0

    .line 17
    .line 18
    sget-object v4, Lcom/tencent/liteav/basic/c/c;->b:Ljava/lang/String;

    .line 19
    .line 20
    const-string v5, "unable to get EGL14 display"

    .line 21
    .line 22
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 v4, 0x2

    .line 26
    new-array v5, v4, [I

    .line 27
    .line 28
    iget-object v6, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 29
    .line 30
    const/4 v7, 0x1

    .line 31
    invoke-static {v6, v5, v3, v5, v7}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-nez v5, :cond_1

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    iput-object v5, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 39
    .line 40
    sget-object v5, Lcom/tencent/liteav/basic/c/c;->b:Ljava/lang/String;

    .line 41
    .line 42
    const-string v6, "unable to initialize EGL14"

    .line 43
    .line 44
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iput-object v1, v0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_2
    const/4 v13, 0x1

    .line 53
    new-array v11, v13, [Landroid/opengl/EGLConfig;

    .line 54
    .line 55
    new-array v14, v7, [I

    .line 56
    .line 57
    iget-object v8, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 58
    .line 59
    if-nez v2, :cond_3

    .line 60
    .line 61
    sget-object v1, Lcom/tencent/liteav/basic/c/c;->l:[I

    .line 62
    .line 63
    :goto_0
    move-object v9, v1

    .line 64
    goto :goto_1

    .line 65
    :cond_3
    sget-object v1, Lcom/tencent/liteav/basic/c/c;->k:[I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :goto_1
    const/4 v12, 0x0

    .line 69
    const/4 v15, 0x0

    .line 70
    const/4 v10, 0x0

    .line 71
    invoke-static/range {v8 .. v15}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_4

    .line 76
    .line 77
    return v3

    .line 78
    :cond_4
    aget-object v1, v11, v3

    .line 79
    .line 80
    iput-object v1, v0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 81
    .line 82
    :goto_2
    if-eqz p2, :cond_5

    .line 83
    .line 84
    iput-boolean v7, v0, Lcom/tencent/liteav/basic/c/c;->h:Z

    .line 85
    .line 86
    move-object/from16 v1, p2

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :cond_5
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 90
    .line 91
    :goto_3
    :try_start_0
    iget-object v5, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 92
    .line 93
    iget-object v6, v0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 94
    .line 95
    invoke-static {v5, v6, v4, v1}, Lcom/tencent/liteav/basic/c/c;->a(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;ILandroid/opengl/EGLContext;)Landroid/opengl/EGLContext;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    iput-object v4, v0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;
    :try_end_0
    .catch Lcom/tencent/liteav/basic/c/d; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    goto :goto_4

    .line 102
    :catch_0
    sget-object v4, Lcom/tencent/liteav/basic/c/c;->b:Ljava/lang/String;

    .line 103
    .line 104
    const-string v5, "failed to create EGLContext of OpenGL ES 2.0, try 3.0"

    .line 105
    .line 106
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :try_start_1
    iget-object v4, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 110
    .line 111
    iget-object v5, v0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 112
    .line 113
    const/4 v6, 0x3

    .line 114
    invoke-static {v4, v5, v6, v1}, Lcom/tencent/liteav/basic/c/c;->a(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;ILandroid/opengl/EGLContext;)Landroid/opengl/EGLContext;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, v0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;
    :try_end_1
    .catch Lcom/tencent/liteav/basic/c/d; {:try_start_1 .. :try_end_1} :catch_1

    .line 119
    .line 120
    :goto_4
    const/16 v1, 0x3038

    .line 121
    .line 122
    filled-new-array {v1}, [I

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    if-nez v2, :cond_6

    .line 127
    .line 128
    iget v2, v0, Lcom/tencent/liteav/basic/c/c;->f:I

    .line 129
    .line 130
    const/16 v4, 0x3056

    .line 131
    .line 132
    iget v5, v0, Lcom/tencent/liteav/basic/c/c;->g:I

    .line 133
    .line 134
    const/16 v6, 0x3057

    .line 135
    .line 136
    filled-new-array {v6, v2, v4, v5, v1}, [I

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v2, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 141
    .line 142
    iget-object v4, v0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 143
    .line 144
    invoke-static {v2, v4, v1, v3}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    .line 149
    .line 150
    goto :goto_5

    .line 151
    :cond_6
    iget-object v1, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 152
    .line 153
    iget-object v5, v0, Lcom/tencent/liteav/basic/c/c;->e:Landroid/opengl/EGLConfig;

    .line 154
    .line 155
    invoke-static {v1, v5, v2, v4, v3}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    .line 160
    .line 161
    :goto_5
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->a()V

    .line 162
    .line 163
    .line 164
    iget-object v1, v0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 165
    .line 166
    iget-object v2, v0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    .line 167
    .line 168
    iget-object v4, v0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;

    .line 169
    .line 170
    invoke-static {v1, v2, v2, v4}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_7

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->a()V

    .line 177
    .line 178
    .line 179
    return v3

    .line 180
    :cond_7
    return v7

    .line 181
    :catch_1
    move-exception v0

    .line 182
    sget-object v1, Lcom/tencent/liteav/basic/c/c;->b:Ljava/lang/String;

    .line 183
    .line 184
    new-instance v2, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v4, "failed to create EGLContext of 3.0. "

    .line 187
    .line 188
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    return v3
.end method

.method private static f()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tencent/liteav/basic/c/d;
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x3000

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Lcom/tencent/liteav/basic/c/d;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lcom/tencent/liteav/basic/c/d;-><init>(I)V

    .line 13
    .line 14
    .line 15
    throw v1
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 202
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result p0

    const/16 v0, 0x3000

    if-eq p0, v0, :cond_0

    .line 203
    sget-object v0, Lcom/tencent/liteav/basic/c/c;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "EGL error:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public a(J)V
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    iget-object p0, p0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    invoke-static {v0, p0, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;

    .line 8
    .line 9
    invoke-static {v0, v1, v1, p0}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/tencent/liteav/basic/c/c;->b:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "eglMakeCurrent failed"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 8
    .line 9
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 10
    .line 11
    invoke-static {v0, v1, v1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 26
    .line 27
    .line 28
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;

    .line 31
    .line 32
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 43
    .line 44
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/c;->c:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/c;->i:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()Landroid/opengl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/c;->d:Landroid/opengl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method
