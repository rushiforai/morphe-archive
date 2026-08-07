.class public Ll/voq;
.super Lcom/momo/mcamera/mask/FaceFilterPipeline;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;
.implements Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;
.implements Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;


# instance fields
.field private A:Z

.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation
.end field

.field private b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

.field private c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

.field private d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

.field private e:Ll/qgm;

.field private f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

.field private g:Ll/h5w;

.field private i:Ll/wsi;

.field private j:Lcom/momo/mcamera/mask/MosaicFilter;

.field private k:Ll/dul;

.field private l:Ll/ytl;

.field private m:Ll/aul;

.field private n:Ll/ztl;

.field private o:Ll/l6m$a;

.field private p:Landroid/content/Context;

.field protected q:Ll/omw;

.field private r:Ll/s23;

.field private s:I

.field private t:Ll/czd;

.field private u:Ll/s1f;

.field private v:Lcom/momo/mcamera/util/fft/AudioRecordThread;

.field private x:Ll/l30;

.field protected y:Ll/o410;

.field private final z:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/o410;Ll/ytl;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/voq;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Ll/voq;->s:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 16
    .line 17
    new-instance v0, Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/voq;->z:Ljava/util/Queue;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/voq;->A:Z

    .line 26
    .line 27
    iput-object p2, p0, Ll/voq;->y:Ll/o410;

    .line 28
    .line 29
    iput-object p3, p0, Ll/voq;->l:Ll/ytl;

    .line 30
    .line 31
    invoke-direct {p0, p1}, Ll/voq;->k2(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic Q1(Ll/voq;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/voq;->A:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic R1(Ll/voq;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/voq;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S1(Ll/voq;)Ll/s1f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->u:Ll/s1f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T1(Ll/voq;IFF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/voq;->e2(IFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U1(Ll/voq;)Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V1(Ll/voq;)Ll/dul;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->k:Ll/dul;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W1(Ll/voq;)Ll/bul;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic X1(Ll/voq;)Lcom/momo/mcamera/mask/StickerAdjustFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z1(Ll/voq;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/voq;->j2(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic a2(Ll/voq;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/voq;->f2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b2(Ll/voq;)Ljava/util/Queue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->z:Ljava/util/Queue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c2(Ll/voq;)Ll/ytl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->l:Ll/ytl;

    .line 2
    .line 3
    return-object p0
.end method

.method private d2(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->isForbidClone()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0, p1}, Ll/voq;->g2(Lcom/momo/mcamera/mask/MaskModel;)Lcom/momo/mcamera/mask/MaskModel;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    goto/16 :goto_4

    .line 15
    .line 16
    :cond_1
    iget-object v0, p0, Ll/voq;->t:Ll/czd;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/czd;->c(Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v2, 0x1

    .line 33
    if-eqz v0, :cond_b

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isStylizeFaceEnable()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    iget-object v0, p0, Ll/voq;->n:Ll/ztl;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    invoke-interface {v0, v2}, Ll/ztl;->a(Z)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw(Z)V

    .line 57
    .line 58
    .line 59
    :cond_4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCartoonFaceEnable()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_7

    .line 68
    .line 69
    iget-object v0, p0, Ll/voq;->n:Ll/ztl;

    .line 70
    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    invoke-interface {v0, v2}, Ll/ztl;->a(Z)V

    .line 74
    .line 75
    .line 76
    :cond_5
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 77
    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw(Z)V

    .line 81
    .line 82
    .line 83
    :cond_6
    new-instance v0, Ll/voq$i;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/voq$i;-><init>(Ll/voq;)V

    .line 86
    .line 87
    .line 88
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 89
    .line 90
    .line 91
    :cond_7
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCoverMosaicWhenNoFace()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_8

    .line 100
    .line 101
    iget-object v0, p0, Ll/voq;->j:Lcom/momo/mcamera/mask/MosaicFilter;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/high16 v3, 0x40000000    # 2.0f

    .line 106
    .line 107
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/mask/MosaicFilter;->setTileSize(F)V

    .line 108
    .line 109
    .line 110
    :cond_8
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->getMosaicTriggerAngle()[F

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_9

    .line 119
    .line 120
    iget-object v0, p0, Ll/voq;->j:Lcom/momo/mcamera/mask/MosaicFilter;

    .line 121
    .line 122
    if-eqz v0, :cond_9

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/AdditionalInfo;->getMosaicTriggerAngle()[F

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v0, v3}, Lcom/momo/mcamera/mask/MosaicFilter;->setMosaicTriggerAngle([F)V

    .line 133
    .line 134
    .line 135
    :cond_9
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->getDetectAction()Lcom/momo/mcamera/mask/ActionInfo;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    if-eqz v0, :cond_b

    .line 144
    .line 145
    iget-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 146
    .line 147
    if-nez v0, :cond_a

    .line 148
    .line 149
    new-instance v0, Ll/l30;

    .line 150
    .line 151
    invoke-direct {v0}, Ll/l30;-><init>()V

    .line 152
    .line 153
    .line 154
    iput-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 155
    .line 156
    const/4 v3, 0x2

    .line 157
    invoke-static {v3}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v0, v3}, Ll/l30;->e(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 165
    .line 166
    const/4 v3, 0x6

    .line 167
    invoke-static {v3}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {v0, v3}, Ll/l30;->d(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 175
    .line 176
    const/4 v3, 0x3

    .line 177
    invoke-static {v3}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-virtual {v0, v3}, Ll/l30;->c(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    :cond_a
    iget-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 185
    .line 186
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/AdditionalInfo;->getDetectAction()Lcom/momo/mcamera/mask/ActionInfo;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    invoke-virtual {v0, v3, v4}, Ll/l30;->f(Lcom/momo/mcamera/mask/ActionInfo;Z)V

    .line 199
    .line 200
    .line 201
    :cond_b
    move v0, v1

    .line 202
    :goto_1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-ge v1, v3, :cond_10

    .line 211
    .line 212
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v3

    .line 220
    check-cast v3, Lcom/momo/mcamera/mask/Sticker;

    .line 221
    .line 222
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result v4

    .line 230
    if-nez v4, :cond_f

    .line 231
    .line 232
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    const-string v5, "3d"

    .line 237
    .line 238
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    if-eqz v4, :cond_f

    .line 243
    .line 244
    iget-object v4, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 245
    .line 246
    if-eqz v4, :cond_f

    .line 247
    .line 248
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    if-eqz v4, :cond_c

    .line 253
    .line 254
    iget-object v4, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 255
    .line 256
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    invoke-interface {v4}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    if-eqz v4, :cond_c

    .line 265
    .line 266
    iget-object v4, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 267
    .line 268
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    invoke-interface {v4}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 273
    .line 274
    .line 275
    move-result-object v4

    .line 276
    invoke-virtual {v4, v2}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 277
    .line 278
    .line 279
    :cond_c
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    if-eqz v4, :cond_d

    .line 284
    .line 285
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 290
    .line 291
    .line 292
    move-result v4

    .line 293
    if-nez v4, :cond_d

    .line 294
    .line 295
    new-instance v0, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v4

    .line 304
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v5

    .line 316
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    new-instance v5, Ljava/lang/StringBuilder;

    .line 327
    .line 328
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v6

    .line 335
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v6

    .line 345
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v6

    .line 355
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v4

    .line 365
    iget-object v5, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 366
    .line 367
    invoke-virtual {v5, v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->addLibraryPath(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 371
    .line 372
    invoke-virtual {v0, v4}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->addLibraryPath(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    new-instance v0, Ll/voq$j;

    .line 376
    .line 377
    invoke-direct {v0, p0, p1, v3}, Ll/voq$j;-><init>(Ll/voq;Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/mcamera/mask/Sticker;)V

    .line 378
    .line 379
    .line 380
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 381
    .line 382
    .line 383
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-interface {v0, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    :goto_2
    move v0, v2

    .line 391
    goto :goto_3

    .line 392
    :cond_d
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v4

    .line 396
    if-eqz v4, :cond_e

    .line 397
    .line 398
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 403
    .line 404
    .line 405
    move-result v4

    .line 406
    if-nez v4, :cond_e

    .line 407
    .line 408
    new-instance v0, Ljava/lang/StringBuilder;

    .line 409
    .line 410
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 411
    .line 412
    .line 413
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v4

    .line 417
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 421
    .line 422
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    new-instance v5, Ljava/lang/StringBuilder;

    .line 430
    .line 431
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 432
    .line 433
    .line 434
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v6

    .line 438
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v6

    .line 448
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v4

    .line 458
    iget-object v5, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 459
    .line 460
    invoke-virtual {v5, v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->addLibraryPath(Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 464
    .line 465
    invoke-virtual {v0, v4}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->addLibraryPath(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    new-instance v0, Ll/voq$k;

    .line 469
    .line 470
    invoke-direct {v0, p0, p1, v3}, Ll/voq$k;-><init>(Ll/voq;Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/mcamera/mask/Sticker;)V

    .line 471
    .line 472
    .line 473
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    invoke-interface {v0, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 481
    .line 482
    .line 483
    goto :goto_2

    .line 484
    :cond_e
    :goto_3
    iget-object v4, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 485
    .line 486
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getSegmentType()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v3

    .line 490
    invoke-virtual {v4, v3}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setSegmentType(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    :cond_f
    add-int/lit8 v1, v1, 0x1

    .line 494
    .line 495
    goto/16 :goto_1

    .line 496
    .line 497
    :cond_10
    if-eqz v0, :cond_11

    .line 498
    .line 499
    iget-object v1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 500
    .line 501
    if-eqz v1, :cond_11

    .line 502
    .line 503
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 504
    .line 505
    .line 506
    move-result-object v1

    .line 507
    if-eqz v1, :cond_11

    .line 508
    .line 509
    iget-object v1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 510
    .line 511
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 512
    .line 513
    .line 514
    move-result-object v1

    .line 515
    invoke-interface {v1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 516
    .line 517
    .line 518
    move-result-object v1

    .line 519
    if-eqz v1, :cond_11

    .line 520
    .line 521
    iget-object v1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 522
    .line 523
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 524
    .line 525
    .line 526
    move-result-object v1

    .line 527
    invoke-interface {v1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    new-instance v2, Ll/voq$l;

    .line 532
    .line 533
    invoke-direct {v2, p0}, Ll/voq$l;-><init>(Ll/voq;)V

    .line 534
    .line 535
    .line 536
    invoke-interface {v1, v2}, Lcom/momo/xeengine/script/XEScriptEngine;->registerModule(Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;)V

    .line 537
    .line 538
    .line 539
    :cond_11
    if-eqz v0, :cond_13

    .line 540
    .line 541
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    if-eqz v0, :cond_12

    .line 546
    .line 547
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 552
    .line 553
    .line 554
    move-result v0

    .line 555
    if-nez v0, :cond_12

    .line 556
    .line 557
    goto :goto_5

    .line 558
    :cond_12
    :goto_4
    return-void

    .line 559
    :cond_13
    :goto_5
    new-instance v0, Ll/voq$m;

    .line 560
    .line 561
    invoke-direct {v0, p0, p1}, Ll/voq$m;-><init>(Ll/voq;Lcom/momo/mcamera/mask/MaskModel;)V

    .line 562
    .line 563
    .line 564
    invoke-direct {p0, v0}, Ll/voq;->n2(Ljava/lang/Runnable;)V

    .line 565
    .line 566
    .line 567
    return-void
.end method

.method private e2(IFF)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->setEnableWarp(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->setEnableWarp(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setWarpType(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 22
    .line 23
    const-string v0, "thin_face"

    .line 24
    .line 25
    invoke-virtual {p1, v0, p2}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->changeFaceBeautyValue(Ljava/lang/String;F)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 29
    .line 30
    const-string p1, "big_eye"

    .line 31
    .line 32
    invoke-virtual {p0, p1, p3}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->changeFaceBeautyValue(Ljava/lang/String;F)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method private f2(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setSkinSmoothVersion(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setSkinWhiteVersion(I)V

    .line 18
    .line 19
    .line 20
    :cond_2
    return-void
.end method

.method private g2(Lcom/momo/mcamera/mask/MaskModel;)Lcom/momo/mcamera/mask/MaskModel;
    .locals 1

    .line 1
    new-instance p0, Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/gson/Gson;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/gson/Gson;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-class v0, Lcom/momo/mcamera/mask/MaskModel;

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/momo/mcamera/mask/MaskModel;

    .line 22
    .line 23
    return-object p0
.end method

.method private h2()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    move-object v1, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/detect/DetectManager;->removeGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopGestureDetect()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/detect/DetectManager;->removeObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 40
    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    :goto_1
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/detect/DetectManager;->removeGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopObjectDetect()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private i2(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/voq;->u:Ll/s1f;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/voq;->z:Ljava/util/Queue;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    return-void
.end method

.method private j2(I)I
    .locals 1

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    return p0

    .line 10
    :cond_1
    const/16 p0, 0x68

    .line 11
    .line 12
    return p0
.end method

.method private k2(Landroid/content/Context;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/voq;->p:Landroid/content/Context;

    .line 6
    .line 7
    new-instance v1, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, v1, Ll/gfj;->useCache:Z

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->setOnBeautyErrorListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IBeautyErrorListener;)V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    :try_start_0
    new-instance v0, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 23
    .line 24
    invoke-direct {v0, p1, v3, v2}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;-><init>(Landroid/content/Context;ZZ)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 28
    .line 29
    iput-boolean v2, v0, Ll/gfj;->useCache:Z

    .line 30
    .line 31
    new-instance p1, Ll/voq$h;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Ll/voq$h;-><init>(Ll/voq;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setInitCallback(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    sget-object p1, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    const-string v5, "beauty"

    .line 57
    .line 58
    const-string v6, "momoengine_render"

    .line 59
    .line 60
    const/16 v7, -0x190

    .line 61
    .line 62
    invoke-virtual/range {v4 .. v9}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/voq;->l:Ll/ytl;

    .line 66
    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    const/16 v0, -0x190

    .line 70
    .line 71
    invoke-interface {p1, v0, v8}, Ll/ytl;->onBeautyError(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iput-object v1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 75
    .line 76
    :goto_0
    new-instance p1, Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 77
    .line 78
    iget-object v0, p0, Ll/voq;->p:Landroid/content/Context;

    .line 79
    .line 80
    invoke-direct {p1, v0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;-><init>(Landroid/content/Context;)V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 84
    .line 85
    iput-boolean v2, p1, Ll/gfj;->useCache:Z

    .line 86
    .line 87
    new-instance p1, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 88
    .line 89
    invoke-direct {p1}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 93
    .line 94
    iput-boolean v2, p1, Ll/gfj;->useCache:Z

    .line 95
    .line 96
    new-instance p1, Ll/wsi;

    .line 97
    .line 98
    sget-object v0, Lcom/immomo/momomediaext/filter/FlipType;->NONE:Lcom/immomo/momomediaext/filter/FlipType;

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    sub-int/2addr v0, v3

    .line 105
    invoke-direct {p1, v0}, Ll/wsi;-><init>(I)V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Ll/voq;->i:Ll/wsi;

    .line 109
    .line 110
    iput-boolean v2, p1, Ll/gfj;->useCache:Z

    .line 111
    .line 112
    new-instance p1, Lcom/momo/mcamera/mask/MosaicFilter;

    .line 113
    .line 114
    invoke-direct {p1}, Lcom/momo/mcamera/mask/MosaicFilter;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, Ll/voq;->j:Lcom/momo/mcamera/mask/MosaicFilter;

    .line 118
    .line 119
    iput-boolean v2, p1, Ll/gfj;->useCache:Z

    .line 120
    .line 121
    const/4 v0, 0x0

    .line 122
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/MosaicFilter;->setTileSize(F)V

    .line 123
    .line 124
    .line 125
    new-instance p1, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 131
    .line 132
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 136
    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    :cond_1
    iget-object v0, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 143
    .line 144
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 148
    .line 149
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Ll/voq;->i:Ll/wsi;

    .line 153
    .line 154
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/voq;->j:Lcom/momo/mcamera/mask/MosaicFilter;

    .line 158
    .line 159
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->constructGroupFilter(Ljava/util/List;)V

    .line 163
    .line 164
    .line 165
    invoke-direct {p0}, Ll/voq;->l2()V

    .line 166
    .line 167
    .line 168
    new-instance p1, Ll/s1f;

    .line 169
    .line 170
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 171
    .line 172
    invoke-direct {p1, v0}, Ll/s1f;-><init>(Lcom/momo/mcamera/mask/LiveLightningEngineFilter;)V

    .line 173
    .line 174
    .line 175
    iput-object p1, p0, Ll/voq;->u:Ll/s1f;

    .line 176
    .line 177
    new-instance p1, Ll/czd;

    .line 178
    .line 179
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 180
    .line 181
    if-eqz v0, :cond_2

    .line 182
    .line 183
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    :cond_2
    invoke-direct {p1, v1}, Ll/czd;-><init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V

    .line 188
    .line 189
    .line 190
    iput-object p1, p0, Ll/voq;->t:Ll/czd;

    .line 191
    .line 192
    return-void
.end method

.method private l2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    new-instance v1, Ll/voq$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/voq$b;-><init>(Ll/voq;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setFinishListener(Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 12
    .line 13
    new-instance v1, Ll/voq$c;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/voq$c;-><init>(Ll/voq;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setGestureDetectedListener(Lcom/momo/mcamera/mask/StickerAdjustFilter$GestureDetectedListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 22
    .line 23
    new-instance v1, Ll/voq$d;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/voq$d;-><init>(Ll/voq;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setStickerStateChangeListener(Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private n2(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq;->y:Ll/o410;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/o410;->J()Ll/g510;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/voq;->y:Ll/o410;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/o410;->J()Ll/g510;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/g510;->m()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, p1, v0}, Ll/o410;->W(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private r2(ZLjava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/immomo/medialog/thread/ThreadType;->Normal:Lcom/immomo/medialog/thread/ThreadType;

    .line 4
    .line 5
    new-instance v0, Ll/voq$e;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Ll/voq$e;-><init>(Ll/voq;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jg00;->a(Lcom/immomo/medialog/thread/ThreadType;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Ll/voq;->g:Ll/h5w;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->removeDstFilter(Ll/jt2;)Z

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/voq;->a:Ljava/util/List;

    .line 22
    .line 23
    iget-object p2, p0, Ll/voq;->g:Ll/h5w;

    .line 24
    .line 25
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Ll/voq;->g:Ll/h5w;

    .line 30
    .line 31
    :cond_1
    return-void
.end method


# virtual methods
.method public I1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/voq;->v:Lcom/momo/mcamera/util/fft/AudioRecordThread;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/momo/mcamera/util/fft/AudioRecordThread;

    .line 10
    .line 11
    const/16 v1, 0x400

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {v0, v2, v2, v1}, Lcom/momo/mcamera/util/fft/AudioRecordThread;-><init>(Landroid/content/Context;Landroid/os/Handler;I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/voq;->v:Lcom/momo/mcamera/util/fft/AudioRecordThread;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/momo/mcamera/mask/StickerAdjustFilter;->mSoundInput:Lcom/momo/mcamera/mask/SoundInputFilter;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/voq;->v:Lcom/momo/mcamera/util/fft/AudioRecordThread;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/util/fft/AudioRecordThread;->setSoundInputFilter(Lcom/momo/mcamera/mask/SoundInputFilter;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq;->v:Lcom/momo/mcamera/util/fft/AudioRecordThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Lcom/momo/mcamera/util/fft/AudioRecordThread;->stopThread()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/voq;->v:Lcom/momo/mcamera/util/fft/AudioRecordThread;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string v0, "JniEngineAdjustFilter"

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public addGestureMaskModel(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addGestureMaskModel(Ljava/lang/String;Lcom/momo/mcamera/mask/MaskModel;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public addMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/voq;->d2(Lcom/momo/mcamera/mask/MaskModel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public addSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->addSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public changeFaceWarp(IFF)V
    .locals 1

    .line 1
    new-instance v0, Ll/voq$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/voq$a;-><init>(Ll/voq;IFF)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/voq;->n2(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public clearMaskWithModelType(I)V
    .locals 1

    .line 1
    new-instance v0, Ll/voq$n;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/voq$n;-><init>(Ll/voq;I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->clearMaskWithModelType(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/h6x;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/voq;->X()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/voq;->h2()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/voq;->X()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/voq;->t:Ll/czd;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/czd;->d()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/voq;->r:Ll/s23;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v2, p0, Ll/voq;->r:Ll/s23;

    .line 33
    .line 34
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Ll/voq;->r:Ll/s23;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/s23;->destroy()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll/voq;->r:Ll/s23;

    .line 43
    .line 44
    :cond_2
    iput-object v1, p0, Ll/voq;->o:Ll/l6m$a;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Ll/voq;->A:Z

    .line 48
    .line 49
    return-void
.end method

.method public getTextOutID()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ogk;->getTerminalFilters()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/jt2;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    return v0
.end method

.method public isByteDanceBeautyFilter()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/voq;->s:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public m2(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getObjectTriggerType()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    iget-object v3, p0, Ll/voq;->k:Ll/dul;

    .line 29
    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->isUseHandGestureDetectNewVersion()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    const/16 v3, 0x10

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/16 v3, 0x8

    .line 42
    .line 43
    :goto_1
    invoke-virtual {v1, v3}, Lcom/momo/mcamera/mask/Sticker;->updateTriggerFlag(I)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Ll/voq;->k:Ll/dul;

    .line 47
    .line 48
    invoke-interface {v3, v2, v1}, Ll/dul;->a(ILcom/momo/mcamera/mask/Sticker;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {v0, v1, v3}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setAdditionalInfo(Ljava/lang/String;Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCoverMosaicWhenNoFace()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    iget-object v0, p0, Ll/voq;->j:Lcom/momo/mcamera/mask/MosaicFilter;

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    const/4 v1, 0x0

    .line 85
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MosaicFilter;->setTileSize(F)V

    .line 86
    .line 87
    .line 88
    :cond_4
    iget-object v0, p0, Ll/voq;->t:Ll/czd;

    .line 89
    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ll/czd;->a(Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 97
    .line 98
    .line 99
    :cond_5
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    if-eqz v0, :cond_a

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isStylizeFaceEnable()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_7

    .line 114
    .line 115
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 116
    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw(Z)V

    .line 124
    .line 125
    .line 126
    :cond_6
    iget-object v0, p0, Ll/voq;->n:Ll/ztl;

    .line 127
    .line 128
    if-eqz v0, :cond_7

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    xor-int/2addr v1, v2

    .line 135
    invoke-interface {v0, v1}, Ll/ztl;->a(Z)V

    .line 136
    .line 137
    .line 138
    :cond_7
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCartoonFaceEnable()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-eqz p1, :cond_a

    .line 147
    .line 148
    iget-object p1, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 149
    .line 150
    if-eqz p1, :cond_8

    .line 151
    .line 152
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-virtual {p1, v0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw(Z)V

    .line 157
    .line 158
    .line 159
    :cond_8
    iget-object p1, p0, Ll/voq;->n:Ll/ztl;

    .line 160
    .line 161
    if-eqz p1, :cond_9

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    xor-int/2addr v0, v2

    .line 168
    invoke-interface {p1, v0}, Ll/ztl;->a(Z)V

    .line 169
    .line 170
    .line 171
    :cond_9
    new-instance p1, Ll/voq$o;

    .line 172
    .line 173
    invoke-direct {p1, p0}, Ll/voq$o;-><init>(Ll/voq;)V

    .line 174
    .line 175
    .line 176
    invoke-direct {p0, p1}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 177
    .line 178
    .line 179
    :cond_a
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    monitor-enter v2

    .line 10
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/voq;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    check-cast p2, Ll/jt2;

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/gfj;->destroy()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    iget-object p0, p0, Ll/voq;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 40
    .line 41
    .line 42
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 44
    .line 45
    .line 46
    move-result-wide p0

    .line 47
    sub-long/2addr p0, v0

    .line 48
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p2, p0, p1}, Ll/u6y;->h0(J)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :goto_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p0
.end method

.method public o2(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/qki;->a(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->changeLookupFilter(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    new-instance v0, Ll/voq$f;

    .line 35
    .line 36
    invoke-direct {v0, p0, p1}, Ll/voq$f;-><init>(Ll/voq;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public onBeautyError(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->l:Ll/ytl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/ytl;->onBeautyError(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onFaceDetectComplete(Ll/omw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/voq;->t:Ll/czd;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/czd;->setMMCVInfo(Ll/omw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-ge v1, v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    instance-of v2, v2, Ll/suf;

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Ll/voq;->f:Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 32
    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->isWarpFailed()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    instance-of v2, v2, Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Ll/suf;

    .line 62
    .line 63
    const/4 v3, 0x0

    .line 64
    invoke-interface {v2, v3}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->getFilters()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Ll/suf;

    .line 77
    .line 78
    invoke-interface {v2, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/detect/DetectManager;->setMMCVInfo(Ll/omw;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/voq;->m:Ll/aul;

    .line 92
    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    invoke-interface {v0, p1}, Ll/aul;->a(Ll/omw;)V

    .line 96
    .line 97
    .line 98
    :cond_4
    iget-object v0, p0, Ll/voq;->x:Ll/l30;

    .line 99
    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    invoke-virtual {v0, p1}, Ll/l30;->setMMCVInfo(Ll/omw;)V

    .line 103
    .line 104
    .line 105
    :cond_5
    iget-object v0, p0, Ll/voq;->j:Lcom/momo/mcamera/mask/MosaicFilter;

    .line 106
    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/MosaicFilter;->setMMCVInfo(Ll/omw;)V

    .line 110
    .line 111
    .line 112
    :cond_6
    iput-object p1, p0, Ll/voq;->q:Ll/omw;

    .line 113
    .line 114
    return-void
.end method

.method public onStickerCompleted(Lcom/momo/xeengine/lightningrender/StickerModel;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/h6x;->b(Lcom/momo/xeengine/lightningrender/StickerModel;)Lcom/momo/mcamera/mask/MaskModel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/voq;->t:Ll/czd;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/czd;->a(Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->getBusinessType()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/h6x;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public p2(Ll/ztl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq;->n:Ll/ztl;

    .line 2
    .line 3
    return-void
.end method

.method public q2(Ll/aul;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq;->m:Ll/aul;

    .line 2
    .line 3
    return-void
.end method

.method public releaseSoundPlayer()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->releaseSoundPlayer()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget v0, p0, Ll/voq;->s:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->removeMakeupStyle(Ljava/lang/String;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p1, 0x3

    .line 14
    if-ne v0, p1, :cond_1

    .line 15
    .line 16
    new-instance p1, Ll/voq$s;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/voq$s;-><init>(Ll/voq;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public removeSticker(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/voq$p;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/voq$p;-><init>(Ll/voq;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Ll/voq;->n2(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public s2()V
    .locals 9

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->A0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p0, v2}, Ll/voq;->setDeblurEnable(Z)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/csx;->Y0()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Ll/csx;->C0()F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v4}, Ll/csx;->X0()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v5}, Ll/csx;->B0()F

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {v6}, Ll/csx;->W0()Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-virtual {v7}, Ll/csx;->z0()F

    .line 61
    .line 62
    .line 63
    move-result v7

    .line 64
    const/4 v8, 0x0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    move v3, v8

    .line 69
    :goto_0
    if-eqz v4, :cond_1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move v5, v8

    .line 73
    :goto_1
    if-eqz v6, :cond_2

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_2
    move v7, v8

    .line 77
    :goto_2
    invoke-virtual {p0, v3, v5, v7}, Ll/voq;->setDeblurParams(FFF)V

    .line 78
    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_3
    invoke-virtual {p0, v1}, Ll/voq;->setDeblurEnable(Z)V

    .line 82
    .line 83
    .line 84
    :goto_3
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/csx;->T0()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Ll/csx;->T()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-direct {p0, v2, v0}, Ll/voq;->r2(ZLjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    const-string v0, ""

    .line 107
    .line 108
    invoke-direct {p0, v1, v0}, Ll/voq;->r2(ZLjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public setDeblurEnable(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq;->e:Ll/qgm;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    new-instance p1, Ll/qgm;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/qgm;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/voq;->e:Ll/qgm;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p1, Ll/gfj;->useCache:Z

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->addTerminalFilter(Ll/jt2;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/FaceFilterPipeline;->removeDstFilter(Ll/jt2;)Z

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/voq;->a:Ljava/util/List;

    .line 27
    .line 28
    iget-object v0, p0, Ll/voq;->e:Ll/qgm;

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Ll/voq;->e:Ll/qgm;

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public setDeblurParams(FFF)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/voq;->e:Ll/qgm;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/qgm;->R1(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/voq;->e:Ll/qgm;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/qgm;->T1(F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/voq;->e:Ll/qgm;

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ll/qgm;->S1(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/voq;->e:Ll/qgm;

    .line 20
    .line 21
    invoke-virtual {p0, p3}, Ll/qgm;->Q1(F)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public setEnableSound(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/StickerAdjustFilter;->setEnableSound(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLookupIntensity(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x42c80000    # 100.0f

    .line 8
    .line 9
    div-float/2addr p1, v0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/csx;->S()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object p0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 29
    .line 30
    mul-float/2addr p1, v0

    .line 31
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->updateLookupFilterIntensity(F)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void

    .line 35
    :cond_2
    new-instance v0, Ll/voq$g;

    .line 36
    .line 37
    invoke-direct {v0, p0, p1}, Ll/voq$g;-><init>(Ll/voq;F)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->isEnableDraw()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->setMMCVInfo(Ll/omw;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Ll/voq;->onFaceDetectComplete(Ll/omw;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setWarpScaleFactor(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->changeWarpScaleFactor(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setWarpScaleFactor(F)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ll/voq;->t:Ll/czd;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/czd;->b(F)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public startGestureDetect()V
    .locals 1

    const/4 v0, 0x0

    .line 120
    invoke-virtual {p0, v0, v0}, Ll/voq;->startGestureDetect(ZI)V

    return-void
.end method

.method public startGestureDetect(ZI)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-virtual {v1, v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->registerGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x7

    .line 25
    invoke-static {v0}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->setGestureModelPath(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/detect/DetectManager;->setHandGestureType(I)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->startGestureDetect()V

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    iget-object v1, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 52
    .line 53
    invoke-virtual {p2, v1}, Lcom/momo/mcamera/mask/detect/DetectManager;->registerObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 61
    .line 62
    if-nez p0, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :goto_1
    invoke-virtual {p2, v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->registerObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 p2, 0x2

    .line 77
    invoke-static {p2}, Ll/cnw;->d(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/detect/DetectManager;->setObjectModelPath(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->startObjectDetect()V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const/16 p2, 0x1f4

    .line 96
    .line 97
    invoke-virtual {p0, p2}, Lcom/momo/mcamera/mask/detect/DetectManager;->setObjectDetectInterval(I)V

    .line 98
    .line 99
    .line 100
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string p2, "statGestureDetect "

    .line 103
    .line 104
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string p1, "JniEngineAdjustFilter"

    .line 115
    .line 116
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public stopGestureDetect()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/voq;->u2(Z)V

    .line 3
    .line 4
    .line 5
    const-string p0, "JniEngineAdjustFilter"

    .line 6
    .line 7
    const-string v0, "stopGestureDetect"

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t2(Ll/dul;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq;->k:Ll/dul;

    .line 2
    .line 3
    return-void
.end method

.method public u2(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->removeGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopGestureDetect()V

    .line 25
    .line 26
    .line 27
    goto :goto_2

    .line 28
    :cond_1
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v1, p0, Ll/voq;->d:Lcom/momo/mcamera/mask/StickerAdjustFilter;

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Lcom/momo/mcamera/mask/detect/DetectManager;->removeObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 42
    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :goto_1
    invoke-virtual {p1, v0}, Lcom/momo/mcamera/mask/detect/DetectManager;->removeObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/momo/mcamera/mask/detect/DetectManager;->getInstance()Lcom/momo/mcamera/mask/detect/DetectManager;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/detect/DetectManager;->stopObjectDetect()V

    .line 58
    .line 59
    .line 60
    :goto_2
    const-string p0, "JniEngineAdjustFilter"

    .line 61
    .line 62
    const-string p1, "stopGestureDetect"

    .line 63
    .line 64
    invoke-static {p0, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public updateByteDanceFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    iget v0, p0, Ll/voq;->s:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->updateByteDanceFaceBeautyValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 v1, 0x3

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    new-instance v0, Ll/voq$q;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2, p3}, Ll/voq$q;-><init>(Ll/voq;Ljava/lang/String;Ljava/lang/String;F)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z
    .locals 2

    .line 1
    iget v0, p0, Ll/voq;->s:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->updateMakeupStyleValue(Ljava/lang/String;Ljava/lang/String;F)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 v1, 0x3

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    new-instance v0, Ll/voq$r;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2, p3}, Ll/voq$r;-><init>(Ll/voq;Ljava/lang/String;Ljava/lang/String;F)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0}, Ll/voq;->i2(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public v2(I)V
    .locals 5

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "switchBeautyType beautyType === "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "JniEngineAdjustFilter"

    .line 20
    .line 21
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "switchBeautyType isEngineInit === "

    .line 35
    .line 36
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-boolean v3, p0, Ll/voq;->A:Z

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iput p1, p0, Ll/voq;->s:I

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ll/voq;->f2(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/voq;->t:Ll/czd;

    .line 61
    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ll/czd;->e(I)V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 68
    .line 69
    const/4 v1, 0x2

    .line 70
    const/4 v2, 0x0

    .line 71
    const/4 v3, 0x1

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    if-ne p1, v1, :cond_1

    .line 75
    .line 76
    move v4, v3

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    move v4, v2

    .line 79
    :goto_0
    invoke-virtual {v0, v2}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->forbidBeauty(Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 83
    .line 84
    invoke-virtual {v0, v4}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->enableDraw(Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 88
    .line 89
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->switchBeauty(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/voq;->b:Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Lcom/immomo/momomediaext/filter/beauty/BeautyFilterAdapter;->setOnDetectCompleteListener(Lcom/immomo/momomediaext/filter/beauty/ByteDanceHelper$IFaceDetectCompleteListener;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v0, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 98
    .line 99
    if-eqz v0, :cond_7

    .line 100
    .line 101
    iget v4, p0, Ll/voq;->s:I

    .line 102
    .line 103
    if-eq v4, v1, :cond_3

    .line 104
    .line 105
    const/4 v1, -0x1

    .line 106
    if-eq v4, v1, :cond_3

    .line 107
    .line 108
    move v1, v3

    .line 109
    goto :goto_1

    .line 110
    :cond_3
    move v1, v2

    .line 111
    :goto_1
    invoke-direct {p0, p1}, Ll/voq;->j2(I)I

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->setFaceWarpType(I)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    if-eqz p1, :cond_5

    .line 125
    .line 126
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    if-eqz p1, :cond_5

    .line 137
    .line 138
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget v0, p0, Ll/voq;->s:I

    .line 149
    .line 150
    const/4 v4, 0x3

    .line 151
    if-ne v0, v4, :cond_4

    .line 152
    .line 153
    move v2, v3

    .line 154
    :cond_4
    invoke-interface {p1, v2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEnable(Z)V

    .line 155
    .line 156
    .line 157
    :cond_5
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 158
    .line 159
    invoke-virtual {p1, v1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->enableBeautyFace(Z)V

    .line 160
    .line 161
    .line 162
    iget p1, p0, Ll/voq;->s:I

    .line 163
    .line 164
    if-eq p1, v3, :cond_6

    .line 165
    .line 166
    if-nez p1, :cond_7

    .line 167
    .line 168
    :cond_6
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    if-eqz p1, :cond_7

    .line 175
    .line 176
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 177
    .line 178
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    if-eqz p1, :cond_7

    .line 187
    .line 188
    iget-object p1, p0, Ll/voq;->c:Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->isEffectActive()Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-eqz p1, :cond_7

    .line 203
    .line 204
    iget-object p0, p0, Ll/voq;->u:Ll/s1f;

    .line 205
    .line 206
    invoke-virtual {p0}, Ll/s1f;->f()V

    .line 207
    .line 208
    .line 209
    :cond_7
    return-void
.end method
