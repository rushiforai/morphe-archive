.class public Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/tencent/could/huiyansdk/turing/a;


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/view/SurfaceView;

.field public c:Landroid/view/SurfaceHolder;

.field public d:I

.field public e:I

.field public f:I

.field public g:Landroid/graphics/Point;

.field public h:Landroid/graphics/Path;

.field public i:Lcom/tencent/could/aicamare/CameraHolder;

.field public j:I

.field public k:I

.field public l:Landroid/renderscript/RenderScript;

.field public m:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

.field public n:Landroid/renderscript/ScriptIntrinsicBlur;

.field public o:Landroid/renderscript/Type$Builder;

.field public p:Landroid/renderscript/Type$Builder;

.field public q:Landroid/renderscript/Allocation;

.field public r:Landroid/renderscript/Allocation;

.field public s:Landroid/renderscript/Allocation;

.field public t:Landroid/os/HandlerThread;

.field public volatile u:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, v0}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->j:I

    .line 6
    .line 7
    iput p2, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->k:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;[B)V
    .locals 0

    .line 285
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a([B)V

    return-void
.end method

.method private a([B)V
    .locals 10

    .line 1
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->j:I

    .line 2
    .line 3
    div-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->k:I

    .line 6
    .line 7
    div-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    :try_start_0
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->o:Landroid/renderscript/Type$Builder;

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    new-instance v3, Landroid/renderscript/Type$Builder;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    .line 17
    .line 18
    invoke-static {v4}, Landroid/renderscript/Element;->U8(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    invoke-direct {v3, v4, v5}, Landroid/renderscript/Type$Builder;-><init>(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)V

    .line 23
    .line 24
    .line 25
    array-length v4, p1

    .line 26
    invoke-virtual {v3, v4}, Landroid/renderscript/Type$Builder;->setX(I)Landroid/renderscript/Type$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->o:Landroid/renderscript/Type$Builder;

    .line 31
    .line 32
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/renderscript/Type$Builder;->create()Landroid/renderscript/Type;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const/4 v5, 0x1

    .line 39
    invoke-static {v4, v3, v5}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;I)Landroid/renderscript/Allocation;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->q:Landroid/renderscript/Allocation;

    .line 44
    .line 45
    new-instance v3, Landroid/renderscript/Type$Builder;

    .line 46
    .line 47
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    .line 48
    .line 49
    invoke-static {v4}, Landroid/renderscript/Element;->RGBA_8888(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    invoke-direct {v3, v4, v6}, Landroid/renderscript/Type$Builder;-><init>(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v0}, Landroid/renderscript/Type$Builder;->setX(I)Landroid/renderscript/Type$Builder;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3, v1}, Landroid/renderscript/Type$Builder;->setY(I)Landroid/renderscript/Type$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->p:Landroid/renderscript/Type$Builder;

    .line 65
    .line 66
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    .line 67
    .line 68
    invoke-virtual {v3}, Landroid/renderscript/Type$Builder;->create()Landroid/renderscript/Type;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v4, v3, v5}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;I)Landroid/renderscript/Allocation;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->r:Landroid/renderscript/Allocation;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    .line 79
    .line 80
    invoke-virtual {v3}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-static {v4, v3}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;)Landroid/renderscript/Allocation;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->s:Landroid/renderscript/Allocation;

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catch_0
    move-exception v0

    .line 92
    :goto_0
    move-object p1, v0

    .line 93
    goto :goto_2

    .line 94
    :catch_1
    move-exception v0

    .line 95
    goto :goto_0

    .line 96
    :cond_0
    :goto_1
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->q:Landroid/renderscript/Allocation;

    .line 97
    .line 98
    invoke-virtual {v3, p1}, Landroid/renderscript/Allocation;->copyFrom([B)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->m:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->q:Landroid/renderscript/Allocation;

    .line 104
    .line 105
    invoke-virtual {p1, v3}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->setInput(Landroid/renderscript/Allocation;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->m:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    .line 109
    .line 110
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->r:Landroid/renderscript/Allocation;

    .line 111
    .line 112
    invoke-virtual {p1, v3}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->forEach(Landroid/renderscript/Allocation;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->n:Landroid/renderscript/ScriptIntrinsicBlur;

    .line 116
    .line 117
    const/high16 v3, 0x40f00000    # 7.5f

    .line 118
    .line 119
    invoke-virtual {p1, v3}, Landroid/renderscript/ScriptIntrinsicBlur;->setRadius(F)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->n:Landroid/renderscript/ScriptIntrinsicBlur;

    .line 123
    .line 124
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->r:Landroid/renderscript/Allocation;

    .line 125
    .line 126
    invoke-virtual {p1, v3}, Landroid/renderscript/ScriptIntrinsicBlur;->setInput(Landroid/renderscript/Allocation;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->n:Landroid/renderscript/ScriptIntrinsicBlur;

    .line 130
    .line 131
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->s:Landroid/renderscript/Allocation;

    .line 132
    .line 133
    invoke-virtual {p1, v3}, Landroid/renderscript/ScriptIntrinsicBlur;->forEach(Landroid/renderscript/Allocation;)V

    .line 134
    .line 135
    .line 136
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 137
    .line 138
    invoke-static {v0, v1, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->s:Landroid/renderscript/Allocation;

    .line 143
    .line 144
    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyTo(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    move-object v3, p1

    .line 148
    goto :goto_3

    .line 149
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v1, "nv21ToBitmap happen some error: "

    .line 152
    .line 153
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    const-string v0, "CameraDateBotGatherView"

    .line 168
    .line 169
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-object v3, v2

    .line 173
    :goto_3
    const-class p1, Lcom/tencent/could/huiyansdk/view/a;

    .line 174
    .line 175
    monitor-enter p1

    .line 176
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    if-nez v3, :cond_1

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_1
    new-instance v8, Landroid/graphics/Matrix;

    .line 181
    .line 182
    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 183
    .line 184
    .line 185
    const/high16 p1, 0x42b40000    # 90.0f

    .line 186
    .line 187
    invoke-virtual {v8, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 188
    .line 189
    .line 190
    const p1, 0x3e4ccccd    # 0.2f

    .line 191
    .line 192
    .line 193
    const v0, -0x41b33333    # -0.2f

    .line 194
    .line 195
    .line 196
    invoke-virtual {v8, p1, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 197
    .line 198
    .line 199
    :try_start_2
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 204
    .line 205
    .line 206
    move-result v7

    .line 207
    const/4 v9, 0x1

    .line 208
    const/4 v4, 0x0

    .line 209
    const/4 v5, 0x0

    .line 210
    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 211
    .line 212
    .line 213
    move-result-object v2
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_2

    .line 214
    if-nez v2, :cond_2

    .line 215
    .line 216
    move-object v2, v3

    .line 217
    goto :goto_4

    .line 218
    :cond_2
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    .line 219
    .line 220
    .line 221
    goto :goto_4

    .line 222
    :catch_2
    move-exception v0

    .line 223
    move-object p1, v0

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v1, "rotateBitmapByDegree  OutOfMemoryError: "

    .line 227
    .line 228
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    const-string v0, "CameraDateBotGatherView"

    .line 243
    .line 244
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    :goto_4
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a:Landroid/widget/ImageView;

    .line 248
    .line 249
    if-eqz p1, :cond_3

    .line 250
    .line 251
    new-instance v0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;

    .line 252
    .line 253
    invoke-direct {v0, p0, v2}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView$a;-><init>(Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;Landroid/graphics/Bitmap;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 257
    .line 258
    .line 259
    :cond_3
    return-void

    .line 260
    :catchall_0
    move-exception v0

    .line 261
    move-object p0, v0

    .line 262
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 263
    throw p0
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 264
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v1, "start preview"

    const/4 v2, 0x1

    .line 265
    const-string v3, "CameraDateBotGatherView"

    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 266
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->i:Lcom/tencent/could/aicamare/CameraHolder;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->c:Landroid/view/SurfaceHolder;

    if-eqz p0, :cond_0

    .line 267
    invoke-virtual {v0, p0}, Lcom/tencent/could/aicamare/CameraHolder;->startPreview(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method

.method public final a(Landroid/content/Context;)V
    .locals 2

    .line 268
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 269
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v1, Lcom/tencent/cloud/turingempty/R$layout;->txy_camera_camera_bot_view_layout:I

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getLayout(I)Landroid/content/res/XmlResourceParser;

    move-result-object p1

    invoke-virtual {v0, p1, p0}, Landroid/view/LayoutInflater;->inflate(Lorg/xmlpull/v1/XmlPullParser;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_0

    .line 270
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string p1, "create view is null!"

    const/4 v0, 0x2

    .line 271
    const-string v1, "CameraDateBotGatherView"

    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 272
    :cond_0
    sget v0, Lcom/tencent/cloud/turingempty/R$id;->txy_huiyan_bot_image_view:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a:Landroid/widget/ImageView;

    .line 273
    sget v0, Lcom/tencent/cloud/turingempty/R$id;->txy_bot_turing_view:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/SurfaceView;

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->b:Landroid/view/SurfaceView;

    if-eqz p1, :cond_1

    .line 274
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->c:Landroid/view/SurfaceHolder;

    .line 275
    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 276
    :cond_1
    new-instance p1, Landroid/graphics/Point;

    invoke-direct {p1}, Landroid/graphics/Point;-><init>()V

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->g:Landroid/graphics/Point;

    .line 277
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->h:Landroid/graphics/Path;

    .line 278
    sget-object p1, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 279
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/renderscript/RenderScript;->create(Landroid/content/Context;)Landroid/renderscript/RenderScript;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    .line 280
    invoke-static {p1}, Landroid/renderscript/Element;->U8_4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->m:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    .line 281
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->l:Landroid/renderscript/RenderScript;

    invoke-static {p1}, Landroid/renderscript/Element;->U8_4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/renderscript/ScriptIntrinsicBlur;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->n:Landroid/renderscript/ScriptIntrinsicBlur;

    .line 282
    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "blur-image"

    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->t:Landroid/os/HandlerThread;

    .line 283
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 284
    new-instance p1, Landroid/os/Handler;

    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->t:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->u:Landroid/os/Handler;

    return-void
.end method

.method public a([BII)[B
    .locals 8

    .line 286
    div-int/lit8 p0, p2, 0x2

    .line 287
    div-int/lit8 v0, p3, 0x2

    .line 288
    const-class v1, Lcom/tencent/could/huiyansdk/view/a;

    monitor-enter v1

    .line 289
    :try_start_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    mul-int/2addr p0, v0

    mul-int/lit8 p0, p0, 0x3

    .line 290
    div-int/lit8 p0, p0, 0x2

    new-array p0, p0, [B

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, p3, :cond_1

    move v4, v1

    :goto_1
    if-ge v4, p2, :cond_0

    mul-int v5, v2, p2

    add-int/2addr v5, v4

    .line 291
    aget-byte v5, p1, v5

    aput-byte v5, p0, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_1
    move v2, v1

    :goto_2
    if-ge v2, v0, :cond_3

    move v4, v1

    :goto_3
    if-ge v4, p2, :cond_2

    mul-int v5, p2, p3

    mul-int v6, v2, p2

    add-int/2addr v5, v6

    add-int v6, v5, v4

    .line 292
    aget-byte v6, p1, v6

    aput-byte v6, p0, v3

    add-int/lit8 v6, v3, 0x1

    add-int/lit8 v7, v4, 0x1

    add-int/2addr v5, v7

    .line 293
    aget-byte v5, p1, v5

    aput-byte v5, p0, v6

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v4, v4, 0x4

    goto :goto_3

    :cond_2
    add-int/lit8 v2, v2, 0x2

    goto :goto_2

    :cond_3
    return-object p0

    :catchall_0
    move-exception p0

    .line 294
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public b([B)V
    .locals 2

    .line 1
    :try_start_0
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->k:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->j:I

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->i:Lcom/tencent/could/aicamare/CameraHolder;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/CameraHolder;->getCameraSize()Landroid/hardware/Camera$Size;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    .line 16
    .line 17
    iput v1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->j:I

    .line 18
    .line 19
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->k:I

    .line 22
    .line 23
    :cond_1
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->j:I

    .line 24
    .line 25
    iget v1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->k:I

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a([BII)[B

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->u:Landroid/os/Handler;

    .line 32
    .line 33
    new-instance v1, Ll/q94;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/q94;-><init>(Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;[B)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v0, "frame error! "

    .line 46
    .line 47
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "CameraDateBotGatherView"

    .line 62
    .line 63
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->h:Landroid/graphics/Path;

    .line 4
    .line 5
    const/16 v2, 0x1a

    .line 6
    .line 7
    if-lt v0, v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    .line 14
    .line 15
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public getTuringPreviewView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->b:Landroid/view/SurfaceView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->d:I

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->e:I

    .line 15
    .line 16
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->g:Landroid/graphics/Point;

    .line 17
    .line 18
    iget v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->d:I

    .line 19
    .line 20
    shr-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    iput v0, p2, Landroid/graphics/Point;->x:I

    .line 23
    .line 24
    shr-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    iput p1, p2, Landroid/graphics/Point;->y:I

    .line 27
    .line 28
    if-le v0, p1, :cond_0

    .line 29
    .line 30
    move v0, p1

    .line 31
    :cond_0
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->f:I

    .line 32
    .line 33
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->h:Landroid/graphics/Path;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->h:Landroid/graphics/Path;

    .line 39
    .line 40
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->g:Landroid/graphics/Point;

    .line 41
    .line 42
    iget v0, p2, Landroid/graphics/Point;->x:I

    .line 43
    .line 44
    int-to-float v0, v0

    .line 45
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    int-to-float p2, p2

    .line 48
    iget v1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->f:I

    .line 49
    .line 50
    int-to-float v1, v1

    .line 51
    sget-object v2, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 52
    .line 53
    invoke-virtual {p1, v0, p2, v1, v2}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 54
    .line 55
    .line 56
    iget p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->f:I

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    .line 67
    .line 68
    const v0, 0x3ff33333    # 1.9f

    .line 69
    .line 70
    .line 71
    mul-float/2addr p2, v0

    .line 72
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    sub-int/2addr p1, p2

    .line 77
    iput p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->f:I

    .line 78
    .line 79
    iget p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->d:I

    .line 80
    .line 81
    iget p2, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->e:I

    .line 82
    .line 83
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public setCameraHolder(Lcom/tencent/could/aicamare/CameraHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->i:Lcom/tencent/could/aicamare/CameraHolder;

    .line 2
    .line 3
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->c:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
