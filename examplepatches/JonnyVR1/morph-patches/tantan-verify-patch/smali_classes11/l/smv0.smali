.class public final Ll/smv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x11
.end annotation


# static fields
.field public static final g:[I


# instance fields
.field public final a:Landroid/os/Handler;

.field public final b:[I

.field public c:Landroid/opengl/EGLDisplay;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Landroid/opengl/EGLContext;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Landroid/opengl/EGLSurface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Landroid/graphics/SurfaceTexture;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/smv0;->g:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3025
        0x0
        0x3027
        0x3038
        0x3033
        0x4
        0x3038
    .end array-data
.end method

.method public constructor <init>(Landroid/os/Handler;Ll/mlv0;)V
    .locals 0
    .param p2    # Ll/mlv0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/smv0;->a:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    new-array p1, p1, [I

    .line 8
    .line 9
    iput-object p1, p0, Ll/smv0;->b:[I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smv0;->f:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final b(I)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzet;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v9, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move v2, v9

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v2, v0

    .line 12
    :goto_0
    const-string v3, "eglGetDisplay failed"

    .line 13
    .line 14
    invoke-static {v2, v3}, Ll/iqv0;->b(ZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v10, 0x2

    .line 18
    new-array v2, v10, [I

    .line 19
    .line 20
    invoke-static {v1, v2, v0, v2, v9}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const-string v3, "eglInitialize failed"

    .line 25
    .line 26
    invoke-static {v2, v3}, Ll/iqv0;->b(ZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 30
    .line 31
    new-array v4, v9, [Landroid/opengl/EGLConfig;

    .line 32
    .line 33
    new-array v7, v9, [I

    .line 34
    .line 35
    sget-object v2, Ll/smv0;->g:[I

    .line 36
    .line 37
    const/4 v6, 0x1

    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v3, 0x0

    .line 40
    const/4 v5, 0x0

    .line 41
    invoke-static/range {v1 .. v8}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    aget v2, v7, v0

    .line 48
    .line 49
    if-lez v2, :cond_1

    .line 50
    .line 51
    aget-object v2, v4, v0

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    move v2, v9

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    move v2, v0

    .line 58
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    aget v3, v7, v0

    .line 63
    .line 64
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    aget-object v5, v4, v0

    .line 69
    .line 70
    filled-new-array {v1, v3, v5}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 75
    .line 76
    const-string v5, "eglChooseConfig failed: success=%b, numConfigs[0]=%d, configs[0]=%s"

    .line 77
    .line 78
    invoke-static {v3, v5, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v2, v1}, Ll/iqv0;->b(ZLjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    aget-object v1, v4, v0

    .line 86
    .line 87
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 88
    .line 89
    const/16 v3, 0x32c0

    .line 90
    .line 91
    const/16 v4, 0x3098

    .line 92
    .line 93
    const/4 v5, 0x4

    .line 94
    const/4 v6, 0x5

    .line 95
    const/16 v7, 0x3038

    .line 96
    .line 97
    const/4 v8, 0x3

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    new-array v11, v8, [I

    .line 101
    .line 102
    aput v4, v11, v0

    .line 103
    .line 104
    aput v10, v11, v9

    .line 105
    .line 106
    aput v7, v11, v10

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    new-array v11, v6, [I

    .line 110
    .line 111
    aput v4, v11, v0

    .line 112
    .line 113
    aput v10, v11, v9

    .line 114
    .line 115
    aput v3, v11, v10

    .line 116
    .line 117
    aput v9, v11, v8

    .line 118
    .line 119
    aput v7, v11, v5

    .line 120
    .line 121
    :goto_2
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 122
    .line 123
    invoke-static {v2, v1, v4, v11, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    if-eqz v2, :cond_3

    .line 128
    .line 129
    move v4, v9

    .line 130
    goto :goto_3

    .line 131
    :cond_3
    move v4, v0

    .line 132
    :goto_3
    const-string v11, "eglCreateContext failed"

    .line 133
    .line 134
    invoke-static {v4, v11}, Ll/iqv0;->b(ZLjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iput-object v2, p0, Ll/smv0;->d:Landroid/opengl/EGLContext;

    .line 138
    .line 139
    iget-object v4, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 140
    .line 141
    if-ne p1, v9, :cond_4

    .line 142
    .line 143
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 144
    .line 145
    goto :goto_6

    .line 146
    :cond_4
    const/16 v11, 0x3056

    .line 147
    .line 148
    const/16 v12, 0x3057

    .line 149
    .line 150
    if-ne p1, v10, :cond_5

    .line 151
    .line 152
    const/4 p1, 0x7

    .line 153
    new-array p1, p1, [I

    .line 154
    .line 155
    aput v12, p1, v0

    .line 156
    .line 157
    aput v9, p1, v9

    .line 158
    .line 159
    aput v11, p1, v10

    .line 160
    .line 161
    aput v9, p1, v8

    .line 162
    .line 163
    aput v3, p1, v5

    .line 164
    .line 165
    aput v9, p1, v6

    .line 166
    .line 167
    const/4 v3, 0x6

    .line 168
    aput v7, p1, v3

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_5
    new-array p1, v6, [I

    .line 172
    .line 173
    aput v12, p1, v0

    .line 174
    .line 175
    aput v9, p1, v9

    .line 176
    .line 177
    aput v11, p1, v10

    .line 178
    .line 179
    aput v9, p1, v8

    .line 180
    .line 181
    aput v7, p1, v5

    .line 182
    .line 183
    :goto_4
    invoke-static {v4, v1, p1, v0}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    if-eqz p1, :cond_6

    .line 188
    .line 189
    move v1, v9

    .line 190
    goto :goto_5

    .line 191
    :cond_6
    move v1, v0

    .line 192
    :goto_5
    const-string v3, "eglCreatePbufferSurface failed"

    .line 193
    .line 194
    invoke-static {v1, v3}, Ll/iqv0;->b(ZLjava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :goto_6
    invoke-static {v4, p1, p1, v2}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    const-string v2, "eglMakeCurrent failed"

    .line 202
    .line 203
    invoke-static {v1, v2}, Ll/iqv0;->b(ZLjava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iput-object p1, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 207
    .line 208
    iget-object p1, p0, Ll/smv0;->b:[I

    .line 209
    .line 210
    invoke-static {v9, p1, v0}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 211
    .line 212
    .line 213
    invoke-static {}, Ll/iqv0;->a()V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/smv0;->b:[I

    .line 217
    .line 218
    new-instance v1, Landroid/graphics/SurfaceTexture;

    .line 219
    .line 220
    aget p1, p1, v0

    .line 221
    .line 222
    invoke-direct {v1, p1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 223
    .line 224
    .line 225
    iput-object v1, p0, Ll/smv0;->f:Landroid/graphics/SurfaceTexture;

    .line 226
    .line 227
    invoke-virtual {v1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final c()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/smv0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :try_start_0
    iget-object v1, p0, Ll/smv0;->f:Landroid/graphics/SurfaceTexture;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/smv0;->b:[I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 37
    .line 38
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 39
    .line 40
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 41
    .line 42
    invoke-static {v1, v2, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v1, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 58
    .line 59
    iget-object v2, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 60
    .line 61
    invoke-static {v1, v2}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Ll/smv0;->d:Landroid/opengl/EGLContext;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 69
    .line 70
    invoke-static {v2, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 71
    .line 72
    .line 73
    :cond_3
    sget v1, Ll/mpw0;->a:I

    .line 74
    .line 75
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 79
    .line 80
    if-eqz v1, :cond_4

    .line 81
    .line 82
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_4

    .line 89
    .line 90
    iget-object v1, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 91
    .line 92
    invoke-static {v1}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 93
    .line 94
    .line 95
    :cond_4
    iput-object v0, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 96
    .line 97
    iput-object v0, p0, Ll/smv0;->d:Landroid/opengl/EGLContext;

    .line 98
    .line 99
    iput-object v0, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 100
    .line 101
    iput-object v0, p0, Ll/smv0;->f:Landroid/graphics/SurfaceTexture;

    .line 102
    .line 103
    return-void

    .line 104
    :goto_1
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 105
    .line 106
    if-eqz v2, :cond_5

    .line 107
    .line 108
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-nez v2, :cond_5

    .line 115
    .line 116
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 117
    .line 118
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 119
    .line 120
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 121
    .line 122
    invoke-static {v2, v3, v3, v4}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 123
    .line 124
    .line 125
    :cond_5
    iget-object v2, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 126
    .line 127
    if-eqz v2, :cond_6

    .line 128
    .line 129
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 130
    .line 131
    invoke-virtual {v2, v3}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-nez v2, :cond_6

    .line 136
    .line 137
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 138
    .line 139
    iget-object v3, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 140
    .line 141
    invoke-static {v2, v3}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 142
    .line 143
    .line 144
    :cond_6
    iget-object v2, p0, Ll/smv0;->d:Landroid/opengl/EGLContext;

    .line 145
    .line 146
    if-eqz v2, :cond_7

    .line 147
    .line 148
    iget-object v3, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 149
    .line 150
    invoke-static {v3, v2}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 151
    .line 152
    .line 153
    :cond_7
    sget v2, Ll/mpw0;->a:I

    .line 154
    .line 155
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 159
    .line 160
    if-eqz v2, :cond_9

    .line 161
    .line 162
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 163
    .line 164
    invoke-virtual {v2, v3}, Landroid/opengl/EGLDisplay;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_8

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_8
    iget-object v2, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 172
    .line 173
    invoke-static {v2}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 174
    .line 175
    .line 176
    :cond_9
    :goto_2
    iput-object v0, p0, Ll/smv0;->c:Landroid/opengl/EGLDisplay;

    .line 177
    .line 178
    iput-object v0, p0, Ll/smv0;->d:Landroid/opengl/EGLContext;

    .line 179
    .line 180
    iput-object v0, p0, Ll/smv0;->e:Landroid/opengl/EGLSurface;

    .line 181
    .line 182
    iput-object v0, p0, Ll/smv0;->f:Landroid/graphics/SurfaceTexture;

    .line 183
    .line 184
    throw v1
.end method

.method public final onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/smv0;->a:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smv0;->f:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    return-void
.end method
