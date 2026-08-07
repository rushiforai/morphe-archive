.class public interface abstract Lcom/bytedance/realx/video/EglBase;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/EglBase$Config;,
        Lcom/bytedance/realx/video/EglBase$Context;,
        Lcom/bytedance/realx/video/EglBase$EglContextChecker;,
        Lcom/bytedance/realx/video/EglBase$EglVersion;,
        Lcom/bytedance/realx/video/EglBase$EglLock;
    }
.end annotation


# static fields
.field public static final CONFIG_PIXEL_BUFFER:[I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final CONFIG_PIXEL_RGBA_BUFFER:[I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final CONFIG_PLAIN:[I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final CONFIG_RECORDABLE:[I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final CONFIG_RGBA:[I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final EGL_OPENGL_ES2_BIT:I = 0x4

.field public static final EGL_OPENGL_ES3_BIT:I = 0x40

.field public static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field public static final ES2_CONFIG_PIXEL_BUFFER:[I

.field public static final ES2_CONFIG_PIXEL_RGBA_BUFFER:[I

.field public static final ES2_CONFIG_PLAIN:[I

.field public static final ES2_CONFIG_RECORDABLE:[I

.field public static final ES2_CONFIG_RGBA:[I

.field public static final ES3_CONFIG_PIXEL_BUFFER:[I

.field public static final ES3_CONFIG_PIXEL_RGBA_BUFFER:[I

.field public static final ES3_CONFIG_PLAIN:[I

.field public static final ES3_CONFIG_RECORDABLE:[I

.field public static final ES3_CONFIG_RGBA:[I

.field public static final TAG:Ljava/lang/String; = "EglBase"

.field public static final lock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bytedance/realx/video/EglBase;->lock:Ljava/lang/Object;

    .line 7
    .line 8
    const/16 v0, 0x9

    .line 9
    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    fill-array-data v1, :array_0

    .line 13
    .line 14
    .line 15
    sput-object v1, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_PLAIN:[I

    .line 16
    .line 17
    new-array v0, v0, [I

    .line 18
    .line 19
    fill-array-data v0, :array_1

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_PLAIN:[I

    .line 23
    .line 24
    const/16 v1, 0xb

    .line 25
    .line 26
    new-array v2, v1, [I

    .line 27
    .line 28
    fill-array-data v2, :array_2

    .line 29
    .line 30
    .line 31
    sput-object v2, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_RGBA:[I

    .line 32
    .line 33
    new-array v2, v1, [I

    .line 34
    .line 35
    fill-array-data v2, :array_3

    .line 36
    .line 37
    .line 38
    sput-object v2, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_RGBA:[I

    .line 39
    .line 40
    new-array v3, v1, [I

    .line 41
    .line 42
    fill-array-data v3, :array_4

    .line 43
    .line 44
    .line 45
    sput-object v3, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_PIXEL_BUFFER:[I

    .line 46
    .line 47
    new-array v1, v1, [I

    .line 48
    .line 49
    fill-array-data v1, :array_5

    .line 50
    .line 51
    .line 52
    sput-object v1, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_PIXEL_BUFFER:[I

    .line 53
    .line 54
    const/16 v3, 0xd

    .line 55
    .line 56
    new-array v4, v3, [I

    .line 57
    .line 58
    fill-array-data v4, :array_6

    .line 59
    .line 60
    .line 61
    sput-object v4, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_PIXEL_RGBA_BUFFER:[I

    .line 62
    .line 63
    new-array v4, v3, [I

    .line 64
    .line 65
    fill-array-data v4, :array_7

    .line 66
    .line 67
    .line 68
    sput-object v4, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_PIXEL_RGBA_BUFFER:[I

    .line 69
    .line 70
    new-array v5, v3, [I

    .line 71
    .line 72
    fill-array-data v5, :array_8

    .line 73
    .line 74
    .line 75
    sput-object v5, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_RECORDABLE:[I

    .line 76
    .line 77
    new-array v3, v3, [I

    .line 78
    .line 79
    fill-array-data v3, :array_9

    .line 80
    .line 81
    .line 82
    sput-object v3, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_RECORDABLE:[I

    .line 83
    .line 84
    sput-object v0, Lcom/bytedance/realx/video/EglBase;->CONFIG_PLAIN:[I

    .line 85
    .line 86
    sput-object v2, Lcom/bytedance/realx/video/EglBase;->CONFIG_RGBA:[I

    .line 87
    .line 88
    sput-object v1, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_BUFFER:[I

    .line 89
    .line 90
    sput-object v4, Lcom/bytedance/realx/video/EglBase;->CONFIG_PIXEL_RGBA_BUFFER:[I

    .line 91
    .line 92
    sput-object v3, Lcom/bytedance/realx/video/EglBase;->CONFIG_RECORDABLE:[I

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
        0x3040
        0x40
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
        0x3038
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_2
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x40
        0x3038
    .end array-data

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :array_3
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x4
        0x3038
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :array_4
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3040
        0x40
        0x3033
        0x1
        0x3038
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    :array_5
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3040
        0x4
        0x3033
        0x1
        0x3038
    .end array-data

    :array_6
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x40
        0x3033
        0x1
        0x3038
    .end array-data

    :array_7
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x4
        0x3033
        0x1
        0x3038
    .end array-data

    :array_8
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x40
        0x3142
        0x1
        0x3038
    .end array-data

    :array_9
    .array-data 4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x4
        0x3142
        0x1
        0x3038
    .end array-data
.end method

.method public static create()Lcom/bytedance/realx/video/EglBase;
    .locals 2

    .line 33
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    move-result v0

    sget-object v1, Lcom/bytedance/realx/video/EglBase$Config;->CONFIG_PLAIN:Lcom/bytedance/realx/video/EglBase$Config;

    invoke-static {v0, v1}, Lcom/bytedance/realx/video/EglBase;->getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/bytedance/realx/video/EglBase$Context;)Lcom/bytedance/realx/video/EglBase;
    .locals 2

    .line 34
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    move-result v0

    sget-object v1, Lcom/bytedance/realx/video/EglBase$Config;->CONFIG_PLAIN:Lcom/bytedance/realx/video/EglBase$Config;

    invoke-static {v0, v1}, Lcom/bytedance/realx/video/EglBase;->getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lcom/bytedance/realx/video/EglBase$Context;[I)Lcom/bytedance/realx/video/EglBase;
    .locals 2
    .param p0    # Lcom/bytedance/realx/video/EglBase$Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/bytedance/realx/video/EglBase14;->isEGL14Supported()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    instance-of v0, p0, Lcom/bytedance/realx/video/EglBase14$Context;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    new-instance v0, Lcom/bytedance/realx/video/EglBase14;

    .line 14
    .line 15
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    check-cast p0, Lcom/bytedance/realx/video/EglBase14$Context;

    .line 20
    .line 21
    invoke-direct {v0, v1, p0, p1}, Lcom/bytedance/realx/video/EglBase14;-><init>(ILcom/bytedance/realx/video/EglBase14$Context;[I)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    new-instance v0, Lcom/bytedance/realx/video/EglBase10;

    .line 26
    .line 27
    check-cast p0, Lcom/bytedance/realx/video/EglBase10$Context;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Lcom/bytedance/realx/video/EglBase10;-><init>(Lcom/bytedance/realx/video/EglBase10$Context;[I)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public static createEgl10(Ljavax/microedition/khronos/egl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;
    .locals 3

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/16 v2, 0x3040

    .line 5
    .line 6
    invoke-static {p1, v2, v0, v1}, Lcom/bytedance/realx/video/EglBase;->createModifiedEGLConfigArray([IIII)[I

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Lcom/bytedance/realx/video/EglBase10;

    .line 11
    .line 12
    new-instance v1, Lcom/bytedance/realx/video/EglBase10$Context;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/bytedance/realx/video/EglBase10$Context;-><init>(Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1, p1}, Lcom/bytedance/realx/video/EglBase10;-><init>(Lcom/bytedance/realx/video/EglBase10$Context;[I)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public static createEgl10([I)Lcom/bytedance/realx/video/EglBase;
    .locals 2

    .line 21
    new-instance v0, Lcom/bytedance/realx/video/EglBase10;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/bytedance/realx/video/EglBase10;-><init>(Lcom/bytedance/realx/video/EglBase10$Context;[I)V

    return-object v0
.end method

.method public static createEgl14(Landroid/opengl/EGLContext;[I)Lcom/bytedance/realx/video/EglBase;
    .locals 4

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/EglBase14;

    .line 2
    .line 3
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    new-instance v2, Lcom/bytedance/realx/video/EglBase14$Context;

    .line 8
    .line 9
    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-direct {v2, p0, v3}, Lcom/bytedance/realx/video/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;I)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1, v2, p1}, Lcom/bytedance/realx/video/EglBase14;-><init>(ILcom/bytedance/realx/video/EglBase14$Context;[I)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static createEgl14([I)Lcom/bytedance/realx/video/EglBase;
    .locals 3

    .line 20
    new-instance v0, Lcom/bytedance/realx/video/EglBase14;

    invoke-static {}, Lcom/bytedance/realx/video/EglBase$EglVersion;->getPreferredEglVersion()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lcom/bytedance/realx/video/EglBase14;-><init>(ILcom/bytedance/realx/video/EglBase14$Context;[I)V

    return-object v0
.end method

.method public static createModifiedEGLConfigArray([IIII)[I
    .locals 3

    .line 1
    invoke-static {p0}, Ll/ese;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, [I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    array-length v1, p0

    .line 9
    if-ge v0, v1, :cond_1

    .line 10
    .line 11
    aget v1, p0, v0

    .line 12
    .line 13
    if-ne v1, p1, :cond_0

    .line 14
    .line 15
    add-int/lit8 v1, v0, 0x1

    .line 16
    .line 17
    array-length v2, p0

    .line 18
    if-ge v1, v2, :cond_0

    .line 19
    .line 20
    aget v2, p0, v1

    .line 21
    .line 22
    if-ne v2, p2, :cond_0

    .line 23
    .line 24
    aput p3, p0, v1

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-object p0
.end method

.method public static eglContextDestoryEnd()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->EglContextDestoryEnd()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static eglContextDestoryStart()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->EglContextDestoryStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getEGLConfig(ILcom/bytedance/realx/video/EglBase$Config;)[I
    .locals 2

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/EglBase$1;->$SwitchMap$com$bytedance$realx$video$EglBase$Config:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x3

    .line 11
    if-eq p1, v0, :cond_7

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p1, v0, :cond_5

    .line 15
    .line 16
    if-eq p1, v1, :cond_3

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p1, v0, :cond_1

    .line 20
    .line 21
    if-ne p0, v1, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_PLAIN:[I

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_PLAIN:[I

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    if-ne p0, v1, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_RECORDABLE:[I

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_RECORDABLE:[I

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    if-ne p0, v1, :cond_4

    .line 38
    .line 39
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_PIXEL_RGBA_BUFFER:[I

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_4
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_PIXEL_RGBA_BUFFER:[I

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_5
    if-ne p0, v1, :cond_6

    .line 46
    .line 47
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_PIXEL_BUFFER:[I

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_6
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_PIXEL_BUFFER:[I

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_7
    if-ne p0, v1, :cond_8

    .line 54
    .line 55
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES3_CONFIG_RGBA:[I

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_8
    sget-object p0, Lcom/bytedance/realx/video/EglBase;->ES2_CONFIG_RGBA:[I

    .line 59
    .line 60
    return-object p0
.end method

.method public static setEglContextChecker(Lcom/bytedance/realx/video/EglBase$EglContextChecker;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/bytedance/realx/video/EglBaseCheckerHelper;->setEglContextChecker(Lcom/bytedance/realx/video/EglBase$EglContextChecker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract createDummyPbufferSurface()V
.end method

.method public abstract createPbufferSurface(II)V
.end method

.method public abstract createSurface(Landroid/graphics/SurfaceTexture;)V
.end method

.method public abstract createSurface(Landroid/view/Surface;)V
.end method

.method public abstract detachCurrent()V
.end method

.method public abstract getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;
.end method

.method public abstract getGLESVersion()I
.end method

.method public abstract hasSurface()Z
.end method

.method public abstract makeCurrent()V
.end method

.method public abstract release()V
.end method

.method public abstract releaseSurface()V
.end method

.method public abstract surfaceHeight()I
.end method

.method public abstract surfaceWidth()I
.end method

.method public abstract swapBuffers()V
.end method

.method public abstract swapBuffers(J)V
.end method
