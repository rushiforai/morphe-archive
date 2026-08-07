.class public Ll/dah0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field a:I

.field b:[I

.field c:[I

.field d:[I

.field e:[Ljavax/microedition/khronos/egl/EGLConfig;

.field f:[I

.field g:[I

.field h:[I

.field private i:Ljavax/microedition/khronos/egl/EGLContext;

.field private j:Ljavax/microedition/khronos/egl/EGLContext;

.field private k:Ljavax/microedition/khronos/egl/EGLSurface;

.field private l:Ljavax/microedition/khronos/egl/EGLSurface;

.field private m:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private n:Ljavax/microedition/khronos/egl/EGL10;

.field private o:Ljava/lang/Object;

.field private p:[I

.field private q:[I


# direct methods
.method public constructor <init>(Ljava/lang/Object;ILjavax/microedition/khronos/egl/EGLContext;Ljava/lang/Object;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 p4, 0x3057

    .line 5
    .line 6
    const/16 v0, 0x280

    .line 7
    .line 8
    const/16 v1, 0x3056

    .line 9
    .line 10
    const/16 v2, 0x160

    .line 11
    .line 12
    const/16 v3, 0x3038

    .line 13
    .line 14
    filled-new-array {p4, v0, v1, v2, v3}, [I

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    iput-object p4, p0, Ll/dah0;->b:[I

    .line 19
    .line 20
    filled-new-array {v3}, [I

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    iput-object p4, p0, Ll/dah0;->c:[I

    .line 25
    .line 26
    const/16 p4, 0x3098

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    filled-new-array {p4, v0, v3}, [I

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    iput-object p4, p0, Ll/dah0;->d:[I

    .line 34
    .line 35
    const/4 p4, 0x1

    .line 36
    new-array v0, p4, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 37
    .line 38
    iput-object v0, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 39
    .line 40
    new-array v0, p4, [I

    .line 41
    .line 42
    iput-object v0, p0, Ll/dah0;->f:[I

    .line 43
    .line 44
    const/16 v0, 0xb

    .line 45
    .line 46
    new-array v1, v0, [I

    .line 47
    .line 48
    fill-array-data v1, :array_0

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Ll/dah0;->g:[I

    .line 52
    .line 53
    new-array v0, v0, [I

    .line 54
    .line 55
    fill-array-data v0, :array_1

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/dah0;->h:[I

    .line 59
    .line 60
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 61
    .line 62
    iput-object v0, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 63
    .line 64
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 65
    .line 66
    iput-object v0, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 67
    .line 68
    iput-object v0, p0, Ll/dah0;->l:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 69
    .line 70
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 71
    .line 72
    iput-object v0, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    iput-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 76
    .line 77
    new-array v0, p4, [I

    .line 78
    .line 79
    iput-object v0, p0, Ll/dah0;->p:[I

    .line 80
    .line 81
    new-array p4, p4, [I

    .line 82
    .line 83
    iput-object p4, p0, Ll/dah0;->q:[I

    .line 84
    .line 85
    iput-object p1, p0, Ll/dah0;->o:Ljava/lang/Object;

    .line 86
    .line 87
    iput-object p3, p0, Ll/dah0;->j:Ljavax/microedition/khronos/egl/EGLContext;

    .line 88
    .line 89
    iput p2, p0, Ll/dah0;->a:I

    .line 90
    .line 91
    invoke-direct {p0}, Ll/dah0;->b()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :array_0
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3033
        0x1
        0x3040
        0x4
        0x3038
    .end array-data

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    :array_1
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3040
        0x4
        0x3142
        0x1
        0x3038
    .end array-data
.end method

.method private a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private b()V
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 10
    .line 11
    iput-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 25
    .line 26
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 27
    .line 28
    if-ne v0, v2, :cond_1

    .line 29
    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :cond_1
    iget-object v2, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-interface {v2, v0, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    goto/16 :goto_2

    .line 42
    .line 43
    :cond_2
    iget v0, p0, Ll/dah0;->a:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    iget-object v2, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 46
    .line 47
    const/4 v3, 0x2

    .line 48
    if-eq v0, v3, :cond_3

    .line 49
    .line 50
    :try_start_1
    iget-object v3, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 51
    .line 52
    iget-object v4, p0, Ll/dah0;->g:[I

    .line 53
    .line 54
    iget-object v5, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 55
    .line 56
    iget-object v7, p0, Ll/dah0;->f:[I

    .line 57
    .line 58
    const/4 v6, 0x1

    .line 59
    invoke-interface/range {v2 .. v7}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    iget-object v3, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 64
    .line 65
    iget-object v4, p0, Ll/dah0;->h:[I

    .line 66
    .line 67
    iget-object v5, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 68
    .line 69
    iget-object v7, p0, Ll/dah0;->f:[I

    .line 70
    .line 71
    const/4 v6, 0x1

    .line 72
    invoke-interface/range {v2 .. v7}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 73
    .line 74
    .line 75
    :goto_0
    const-string v0, "eglCreateContext RGB888+recordable ES2"

    .line 76
    .line 77
    invoke-direct {p0, v0}, Ll/dah0;->a(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/dah0;->j:Ljavax/microedition/khronos/egl/EGLContext;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 81
    .line 82
    iget-object v2, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 83
    .line 84
    if-nez v0, :cond_4

    .line 85
    .line 86
    :try_start_2
    iget-object v0, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 87
    .line 88
    iget-object v3, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 89
    .line 90
    aget-object v3, v3, v1

    .line 91
    .line 92
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 93
    .line 94
    iget-object v5, p0, Ll/dah0;->d:[I

    .line 95
    .line 96
    invoke-interface {v2, v0, v3, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    iget-object v3, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 104
    .line 105
    iget-object v4, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 106
    .line 107
    aget-object v4, v4, v1

    .line 108
    .line 109
    iget-object v5, p0, Ll/dah0;->d:[I

    .line 110
    .line 111
    invoke-interface {v2, v3, v4, v0, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 116
    .line 117
    :goto_1
    const-string v0, "eglCreateContext"

    .line 118
    .line 119
    invoke-direct {p0, v0}, Ll/dah0;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/dah0;->o:Ljava/lang/Object;

    .line 123
    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    iget-object v2, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 127
    .line 128
    iget-object v3, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 129
    .line 130
    iget-object v4, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 131
    .line 132
    aget-object v1, v4, v1

    .line 133
    .line 134
    iget-object v4, p0, Ll/dah0;->c:[I

    .line 135
    .line 136
    invoke-interface {v2, v3, v1, v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 141
    .line 142
    const-string v0, "eglCreateWindowSurface"

    .line 143
    .line 144
    invoke-direct {p0, v0}, Ll/dah0;->a(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 148
    .line 149
    iget-object v1, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 150
    .line 151
    iget-object v2, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 152
    .line 153
    iget-object v3, p0, Ll/dah0;->q:[I

    .line 154
    .line 155
    const/16 v4, 0x3056

    .line 156
    .line 157
    invoke-interface {v0, v1, v2, v4, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 161
    .line 162
    iget-object v1, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 163
    .line 164
    iget-object v2, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 165
    .line 166
    iget-object p0, p0, Ll/dah0;->p:[I

    .line 167
    .line 168
    const/16 v3, 0x3057

    .line 169
    .line 170
    invoke-interface {v0, v1, v2, v3, p0}, Ljavax/microedition/khronos/egl/EGL10;->eglQuerySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;I[I)Z

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_5
    iget v0, p0, Ll/dah0;->a:I

    .line 175
    .line 176
    if-nez v0, :cond_6

    .line 177
    .line 178
    iget-object v0, p0, Ll/dah0;->l:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 179
    .line 180
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 181
    .line 182
    if-ne v0, v2, :cond_6

    .line 183
    .line 184
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 185
    .line 186
    iget-object v2, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 187
    .line 188
    iget-object v3, p0, Ll/dah0;->e:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 189
    .line 190
    aget-object v1, v3, v1

    .line 191
    .line 192
    iget-object v3, p0, Ll/dah0;->b:[I

    .line 193
    .line 194
    invoke-interface {v0, v2, v1, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iput-object v0, p0, Ll/dah0;->l:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 199
    .line 200
    const-string v0, "eglCreatePbufferSurface"

    .line 201
    .line 202
    invoke-direct {p0, v0}, Ll/dah0;->a(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 203
    .line 204
    .line 205
    :catch_0
    :cond_6
    :goto_2
    return-void
.end method


# virtual methods
.method public c()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 8
    .line 9
    iget-object v2, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 10
    .line 11
    iget-object v3, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 12
    .line 13
    invoke-interface {v0, v2, v1, v1, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 17
    .line 18
    iget-object v2, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 19
    .line 20
    iget-object v3, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 21
    .line 22
    iget-object v4, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 23
    .line 24
    invoke-interface {v0, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/dah0;->l:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 28
    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 32
    .line 33
    iget-object v2, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 34
    .line 35
    iget-object p0, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 36
    .line 37
    invoke-interface {v1, v2, v0, v0, p0}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public d()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 2
    .line 3
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 4
    .line 5
    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 6
    .line 7
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 8
    .line 9
    if-eq v0, v3, :cond_0

    .line 10
    .line 11
    iget-object v4, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    invoke-interface {v4, v0, v2, v2, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 17
    .line 18
    iget-object v4, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 19
    .line 20
    iget-object v5, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 21
    .line 22
    invoke-interface {v0, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 26
    .line 27
    iget-object v4, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 28
    .line 29
    iget-object v5, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 30
    .line 31
    invoke-interface {v0, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 35
    .line 36
    iget-object v4, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 37
    .line 38
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    iput-object v3, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 42
    .line 43
    iput-object v1, p0, Ll/dah0;->i:Ljavax/microedition/khronos/egl/EGLContext;

    .line 44
    .line 45
    iput-object v2, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 46
    .line 47
    iput-object v2, p0, Ll/dah0;->l:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 48
    .line 49
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dah0;->k:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 2
    .line 3
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/dah0;->n:Ljavax/microedition/khronos/egl/EGL10;

    .line 8
    .line 9
    iget-object p0, p0, Ll/dah0;->m:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 10
    .line 11
    invoke-interface {v1, p0, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
