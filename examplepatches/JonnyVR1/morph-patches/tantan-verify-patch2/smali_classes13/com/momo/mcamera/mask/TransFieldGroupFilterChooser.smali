.class public Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;
.super Ll/jgj0;
.source "SourceFile"


# instance fields
.field albumGrayFilter:Ll/ih0;

.field albumTemplateGroupFilter:Ll/mh0;

.field albumTemplateOverlapGroupFilter:Ll/oh0;

.field albumTemplateVerticalGroupFilter:Ll/qh0;

.field bottomToTopGroupFilter:Ll/ue3;

.field curImgFilter:Ll/h6j;

.field downwardWithColorFilter:Ll/oae;

.field private effectIndex:I

.field private effectsCount:I

.field filterList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;"
        }
    .end annotation
.end field

.field private fixIndex:I

.field frameAdpterBlurFilter:Ll/h6j;

.field fuzzyGradShiftFilter:Ll/pdj;

.field imageScaleWithColorChangingFilter:Ll/pkm;

.field private isFirstFrame:Z

.field private lookupFilter:Ll/h5w;

.field private mBasicFilterPost:Ll/cm80;

.field private mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

.field private mBitmap:Landroid/graphics/Bitmap;

.field mFilterListener:Ll/ap50;

.field private mImageMovePreStickerBlendFilter:Ll/bjm;

.field private mLookup:Landroid/graphics/Bitmap;

.field private mStickerPre:Lcom/momo/mcamera/mask/Sticker;

.field processFilter:Ll/jqf0;

.field rightToLeftGroupFilter:Ll/cdd0;

.field private softTransferIndex:I

.field private startPostWatermark:Z

.field private startPreWatermark:Z

.field threeGradualEffectFilter:Ll/pyi0;

.field threeStateEnterFilter:Ll/qyi0;

.field threeStateInFilter:Ll/ryi0;

.field topShiftFilter:Ll/y6j0;

.field zoomEffectGroupFilter:Ll/pqq0;

.field zoomFusionFilter:Ll/rqq0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jgj0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectsCount:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    iput v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fixIndex:I

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferIndex:I

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->isFirstFrame:Z

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->filterList:Ljava/util/List;

    .line 27
    .line 28
    new-instance v1, Ll/rqq0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/rqq0;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomFusionFilter:Ll/rqq0;

    .line 34
    .line 35
    new-instance v1, Ll/ryi0;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/ryi0;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeStateInFilter:Ll/ryi0;

    .line 41
    .line 42
    new-instance v1, Ll/qyi0;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/qyi0;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeStateEnterFilter:Ll/qyi0;

    .line 48
    .line 49
    new-instance v1, Ll/cdd0;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/cdd0;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->rightToLeftGroupFilter:Ll/cdd0;

    .line 55
    .line 56
    new-instance v1, Ll/pyi0;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/pyi0;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeGradualEffectFilter:Ll/pyi0;

    .line 62
    .line 63
    new-instance v1, Ll/h6j;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/h6j;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 69
    .line 70
    new-instance v1, Ll/pkm;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/pkm;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->imageScaleWithColorChangingFilter:Ll/pkm;

    .line 76
    .line 77
    new-instance v1, Ll/oae;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/oae;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->downwardWithColorFilter:Ll/oae;

    .line 83
    .line 84
    new-instance v1, Ll/ue3;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/ue3;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->bottomToTopGroupFilter:Ll/ue3;

    .line 90
    .line 91
    new-instance v1, Ll/oh0;

    .line 92
    .line 93
    invoke-direct {v1}, Ll/oh0;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateOverlapGroupFilter:Ll/oh0;

    .line 97
    .line 98
    new-instance v1, Ll/mh0;

    .line 99
    .line 100
    invoke-direct {v1}, Ll/mh0;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateGroupFilter:Ll/mh0;

    .line 104
    .line 105
    new-instance v1, Ll/ih0;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/ih0;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumGrayFilter:Ll/ih0;

    .line 111
    .line 112
    new-instance v1, Ll/qh0;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/qh0;-><init>()V

    .line 115
    .line 116
    .line 117
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateVerticalGroupFilter:Ll/qh0;

    .line 118
    .line 119
    new-instance v1, Ll/y6j0;

    .line 120
    .line 121
    invoke-direct {v1}, Ll/y6j0;-><init>()V

    .line 122
    .line 123
    .line 124
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->topShiftFilter:Ll/y6j0;

    .line 125
    .line 126
    new-instance v1, Ll/pqq0;

    .line 127
    .line 128
    invoke-direct {v1}, Ll/pqq0;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 132
    .line 133
    new-instance v1, Ll/pdj;

    .line 134
    .line 135
    invoke-direct {v1}, Ll/pdj;-><init>()V

    .line 136
    .line 137
    .line 138
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 139
    .line 140
    new-instance v1, Ll/h6j;

    .line 141
    .line 142
    invoke-direct {v1}, Ll/h6j;-><init>()V

    .line 143
    .line 144
    .line 145
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 146
    .line 147
    new-instance v1, Ll/qv40;

    .line 148
    .line 149
    invoke-direct {v1}, Ll/qv40;-><init>()V

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->filterList:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    new-instance v1, Ll/jqf0;

    .line 158
    .line 159
    iget-object v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->filterList:Ljava/util/List;

    .line 160
    .line 161
    invoke-direct {v1, v2}, Ll/jqf0;-><init>(Ljava/util/List;)V

    .line 162
    .line 163
    .line 164
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 165
    .line 166
    invoke-virtual {v1, v0}, Ll/jqf0;->Q1(Z)V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private analysisMaskMode(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "/Pre/params.txt"

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {p2}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    new-instance p2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "/Pre/params.json"

    .line 46
    .line 47
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, "/Pre/lookup.png"

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->exist(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_1

    .line 80
    .line 81
    iget-object v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mLookup:Landroid/graphics/Bitmap;

    .line 82
    .line 83
    if-eqz v2, :cond_1

    .line 84
    .line 85
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mLookup:Landroid/graphics/Bitmap;

    .line 90
    .line 91
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, "/Post/overlayPost/overlayPost_000.png"

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    .line 113
    .line 114
    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBitmap:Landroid/graphics/Bitmap;

    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :catch_0
    move-exception v1

    .line 128
    const-string v2, "ImageMove"

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :goto_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1, p1, p2}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-nez p2, :cond_3

    .line 150
    .line 151
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    const-class v1, Lcom/momo/mcamera/mask/MaskModel;

    .line 156
    .line 157
    invoke-virtual {p2, p1, v1}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    check-cast p1, Lcom/momo/mcamera/mask/MaskModel;

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    if-nez p2, :cond_2

    .line 168
    .line 169
    new-instance p2, Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/MaskModel;->setStickers(Ljava/util/List;)V

    .line 175
    .line 176
    .line 177
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    const/4 p2, 0x0

    .line 182
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    check-cast p1, Lcom/momo/mcamera/mask/Sticker;

    .line 187
    .line 188
    iput-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 189
    .line 190
    new-instance p0, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string p2, "/Pre"

    .line 203
    .line 204
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {p1, p0}, Lcom/momo/mcamera/mask/Sticker;->setImageFolderPath(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    :cond_3
    return-void
.end method

.method private exist(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance p0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private processFirstFrame(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/List<",
            "Ll/jt2;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_a

    .line 6
    .line 7
    new-instance v0, Ll/h5w;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/h5w;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->lookupFilter:Ll/h5w;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mLookup:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Ll/h5w;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v3, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    new-instance v3, Ll/bjm;

    .line 34
    .line 35
    invoke-direct {v3, v0}, Ll/bjm;-><init>(Ll/jt2;)V

    .line 36
    .line 37
    .line 38
    iput-object v3, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object v3, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 45
    .line 46
    if-eqz v3, :cond_2

    .line 47
    .line 48
    iput v2, v0, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getBlendMode()Lcom/momo/mcamera/mask/Sticker$BlendMode;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Lcom/momo/mcamera/mask/Sticker$BlendMode;->name:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ll/bjm;->Q1(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    if-nez p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 62
    .line 63
    if-eqz p1, :cond_3

    .line 64
    .line 65
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 66
    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    :cond_3
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->isFirstFrame:Z

    .line 70
    .line 71
    if-eqz p1, :cond_b

    .line 72
    .line 73
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 74
    .line 75
    if-eqz p1, :cond_b

    .line 76
    .line 77
    :cond_4
    iget p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fixIndex:I

    .line 78
    .line 79
    const/4 v0, -0x3

    .line 80
    const/4 v3, 0x0

    .line 81
    const v4, 0x3f4ccccd    # 0.8f

    .line 82
    .line 83
    .line 84
    if-ne p1, v0, :cond_7

    .line 85
    .line 86
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/pdj;->a2()V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 97
    .line 98
    invoke-virtual {p1, v4}, Ll/pdj;->S1(F)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 102
    .line 103
    const p2, 0x3b23d70a    # 0.0025f

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2}, Ll/pdj;->U1(F)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 110
    .line 111
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 115
    .line 116
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mLookup:Landroid/graphics/Bitmap;

    .line 120
    .line 121
    if-eqz p1, :cond_5

    .line 122
    .line 123
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->lookupFilter:Ll/h5w;

    .line 124
    .line 125
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    :cond_5
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 129
    .line 130
    if-eqz p1, :cond_6

    .line 131
    .line 132
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 133
    .line 134
    if-eqz p2, :cond_6

    .line 135
    .line 136
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 137
    .line 138
    if-eqz p2, :cond_6

    .line 139
    .line 140
    invoke-virtual {p1}, Ll/bjm;->R1()V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 144
    .line 145
    invoke-virtual {p1, v3}, Ll/bjm;->S1(F)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 149
    .line 150
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    :cond_6
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 154
    .line 155
    invoke-virtual {p1, p3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 156
    .line 157
    .line 158
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->isFirstFrame:Z

    .line 159
    .line 160
    return v1

    .line 161
    :cond_7
    const/4 v0, -0x4

    .line 162
    if-ne p1, v0, :cond_b

    .line 163
    .line 164
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/pdj;->a2()V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 170
    .line 171
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 175
    .line 176
    invoke-virtual {p1, v4}, Ll/pdj;->R1(F)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 180
    .line 181
    const p2, -0x44dc28f6    # -0.0025f

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, p2}, Ll/pdj;->U1(F)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 188
    .line 189
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 193
    .line 194
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mLookup:Landroid/graphics/Bitmap;

    .line 198
    .line 199
    if-eqz p1, :cond_8

    .line 200
    .line 201
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->lookupFilter:Ll/h5w;

    .line 202
    .line 203
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    :cond_8
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 207
    .line 208
    if-eqz p1, :cond_9

    .line 209
    .line 210
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 211
    .line 212
    if-eqz p2, :cond_9

    .line 213
    .line 214
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 215
    .line 216
    if-eqz p2, :cond_9

    .line 217
    .line 218
    invoke-virtual {p1}, Ll/bjm;->R1()V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 222
    .line 223
    invoke-virtual {p1, v3}, Ll/bjm;->S1(F)V

    .line 224
    .line 225
    .line 226
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mImageMovePreStickerBlendFilter:Ll/bjm;

    .line 227
    .line 228
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    :cond_9
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 232
    .line 233
    invoke-virtual {p1, p3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 234
    .line 235
    .line 236
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->isFirstFrame:Z

    .line 237
    .line 238
    return v1

    .line 239
    :cond_a
    if-nez p1, :cond_b

    .line 240
    .line 241
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 242
    .line 243
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 247
    .line 248
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 252
    .line 253
    invoke-virtual {p1, p3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 254
    .line 255
    .line 256
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->isFirstFrame:Z

    .line 257
    .line 258
    return v1

    .line 259
    :cond_b
    return v2
.end method

.method private quickTransferTemplate(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    new-instance v3, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iget v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferIndex:I

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    add-int/2addr v4, v5

    .line 16
    rem-int/lit8 v4, v4, 0xa

    .line 17
    .line 18
    iput v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferIndex:I

    .line 19
    .line 20
    const v7, 0x3f8ccccd    # 1.1f

    .line 21
    .line 22
    .line 23
    const v8, 0x3ca3d70a    # 0.02f

    .line 24
    .line 25
    .line 26
    const v9, 0x3f333333    # 0.7f

    .line 27
    .line 28
    .line 29
    const v10, 0x3f4ccccd    # 0.8f

    .line 30
    .line 31
    .line 32
    const v12, 0x3d4ccccd    # 0.05f

    .line 33
    .line 34
    .line 35
    const v13, 0x3da3d70a    # 0.08f

    .line 36
    .line 37
    .line 38
    const v14, 0x3ecccccd    # 0.4f

    .line 39
    .line 40
    .line 41
    const/high16 v15, 0x3f800000    # 1.0f

    .line 42
    .line 43
    const/high16 v5, 0x40400000    # 3.0f

    .line 44
    .line 45
    const/high16 v6, 0x3f000000    # 0.5f

    .line 46
    .line 47
    const/4 v11, 0x0

    .line 48
    packed-switch v4, :pswitch_data_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :pswitch_0
    new-instance v4, Ll/pe5;

    .line 53
    .line 54
    invoke-direct {v4}, Ll/pe5;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4}, Ll/pe5;->U1()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4, v5}, Ll/pe5;->T1(F)V

    .line 61
    .line 62
    .line 63
    iget-object v5, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 64
    .line 65
    invoke-virtual {v5, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 69
    .line 70
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 74
    .line 75
    invoke-virtual {v1, v10}, Ll/pqq0;->R1(F)V

    .line 76
    .line 77
    .line 78
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 79
    .line 80
    invoke-virtual {v1, v8}, Ll/pqq0;->S1(F)V

    .line 81
    .line 82
    .line 83
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 84
    .line 85
    invoke-virtual {v1, v15}, Ll/pqq0;->T1(F)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 89
    .line 90
    invoke-virtual {v1, v11}, Ll/pqq0;->U1(F)V

    .line 91
    .line 92
    .line 93
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 94
    .line 95
    invoke-virtual {v1, v6}, Ll/pqq0;->V1(F)V

    .line 96
    .line 97
    .line 98
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 99
    .line 100
    invoke-virtual {v1, v11}, Ll/pqq0;->W1(F)V

    .line 101
    .line 102
    .line 103
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 104
    .line 105
    const v2, 0x3fa66666    # 1.3f

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 109
    .line 110
    .line 111
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 112
    .line 113
    invoke-virtual {v1, v7}, Ll/pqq0;->b2(F)V

    .line 114
    .line 115
    .line 116
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 117
    .line 118
    invoke-virtual {v1, v6}, Ll/pqq0;->X1(F)V

    .line 119
    .line 120
    .line 121
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 122
    .line 123
    const v2, 0x3ab78034    # 0.0014f

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, v2}, Ll/pqq0;->Y1(F)V

    .line 127
    .line 128
    .line 129
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 133
    .line 134
    if-eqz v1, :cond_0

    .line 135
    .line 136
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 137
    .line 138
    if-eqz v1, :cond_0

    .line 139
    .line 140
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 141
    .line 142
    .line 143
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 144
    .line 145
    const v2, 0x40733333    # 3.8f

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ll/cm80;->Z1(F)V

    .line 149
    .line 150
    .line 151
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 152
    .line 153
    invoke-virtual {v1, v14}, Ll/cm80;->setAlpha(F)V

    .line 154
    .line 155
    .line 156
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 157
    .line 158
    invoke-virtual {v1, v13}, Ll/cm80;->U1(F)V

    .line 159
    .line 160
    .line 161
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 162
    .line 163
    invoke-virtual {v1, v12, v6}, Ll/cm80;->X1(FF)V

    .line 164
    .line 165
    .line 166
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 167
    .line 168
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    :cond_0
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 172
    .line 173
    invoke-virtual {v0, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :pswitch_1
    new-instance v1, Ll/ryf0;

    .line 178
    .line 179
    invoke-direct {v1}, Ll/ryf0;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Ll/ryf0;->S1()V

    .line 183
    .line 184
    .line 185
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 186
    .line 187
    invoke-virtual {v4}, Ll/pdj;->a2()V

    .line 188
    .line 189
    .line 190
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 191
    .line 192
    invoke-virtual {v4, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 193
    .line 194
    .line 195
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 196
    .line 197
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 201
    .line 202
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    iget-boolean v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 209
    .line 210
    if-eqz v2, :cond_1

    .line 211
    .line 212
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 213
    .line 214
    if-eqz v2, :cond_1

    .line 215
    .line 216
    invoke-virtual {v2}, Ll/cm80;->T1()V

    .line 217
    .line 218
    .line 219
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 220
    .line 221
    invoke-virtual {v2, v5}, Ll/cm80;->Z1(F)V

    .line 222
    .line 223
    .line 224
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 225
    .line 226
    invoke-virtual {v2, v14}, Ll/cm80;->setAlpha(F)V

    .line 227
    .line 228
    .line 229
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 230
    .line 231
    invoke-virtual {v2, v13}, Ll/cm80;->U1(F)V

    .line 232
    .line 233
    .line 234
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 235
    .line 236
    invoke-virtual {v2, v12, v6}, Ll/cm80;->X1(FF)V

    .line 237
    .line 238
    .line 239
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 240
    .line 241
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    :cond_1
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 245
    .line 246
    invoke-virtual {v2, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1, v11}, Ll/ryf0;->R1(F)V

    .line 250
    .line 251
    .line 252
    const v2, 0x3da9fbe7    # 0.083f

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1, v2}, Ll/ryf0;->Q1(F)V

    .line 256
    .line 257
    .line 258
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 259
    .line 260
    invoke-virtual {v1, v15}, Ll/pdj;->S1(F)V

    .line 261
    .line 262
    .line 263
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 264
    .line 265
    invoke-virtual {v1, v9}, Ll/pdj;->R1(F)V

    .line 266
    .line 267
    .line 268
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 269
    .line 270
    const v2, -0x445c28f6    # -0.005f

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1, v2}, Ll/pdj;->U1(F)V

    .line 274
    .line 275
    .line 276
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 277
    .line 278
    const v1, 0x3f19999a    # 0.6f

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ll/pdj;->X1(F)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :pswitch_2
    new-instance v4, Ll/qj0;

    .line 286
    .line 287
    invoke-direct {v4}, Ll/qj0;-><init>()V

    .line 288
    .line 289
    .line 290
    new-instance v7, Ll/qj0;

    .line 291
    .line 292
    invoke-direct {v7}, Ll/qj0;-><init>()V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v4}, Ll/qj0;->W1()V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v7}, Ll/qj0;->W1()V

    .line 299
    .line 300
    .line 301
    iget-object v9, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 302
    .line 303
    invoke-virtual {v9, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 304
    .line 305
    .line 306
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 307
    .line 308
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 312
    .line 313
    if-eqz v1, :cond_2

    .line 314
    .line 315
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 316
    .line 317
    if-eqz v1, :cond_2

    .line 318
    .line 319
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 320
    .line 321
    .line 322
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 323
    .line 324
    invoke-virtual {v1, v5}, Ll/cm80;->Z1(F)V

    .line 325
    .line 326
    .line 327
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 328
    .line 329
    invoke-virtual {v1, v14}, Ll/cm80;->setAlpha(F)V

    .line 330
    .line 331
    .line 332
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 333
    .line 334
    invoke-virtual {v1, v13}, Ll/cm80;->U1(F)V

    .line 335
    .line 336
    .line 337
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 338
    .line 339
    invoke-virtual {v1, v12, v6}, Ll/cm80;->X1(FF)V

    .line 340
    .line 341
    .line 342
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 343
    .line 344
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 345
    .line 346
    .line 347
    :cond_2
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 354
    .line 355
    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 356
    .line 357
    .line 358
    invoke-virtual {v4, v11}, Ll/qj0;->T1(F)V

    .line 359
    .line 360
    .line 361
    const v1, 0x3f19999a    # 0.6f

    .line 362
    .line 363
    .line 364
    invoke-virtual {v4, v1}, Ll/qj0;->V1(F)V

    .line 365
    .line 366
    .line 367
    const v1, -0x42dc28f6    # -0.04f

    .line 368
    .line 369
    .line 370
    invoke-virtual {v4, v1}, Ll/qj0;->U1(F)V

    .line 371
    .line 372
    .line 373
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 374
    .line 375
    const v2, 0x3f99999a    # 1.2f

    .line 376
    .line 377
    .line 378
    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 379
    .line 380
    .line 381
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 382
    .line 383
    invoke-virtual {v1, v10}, Ll/pqq0;->R1(F)V

    .line 384
    .line 385
    .line 386
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 387
    .line 388
    invoke-virtual {v1, v8}, Ll/pqq0;->S1(F)V

    .line 389
    .line 390
    .line 391
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 392
    .line 393
    invoke-virtual {v1, v2}, Ll/pqq0;->T1(F)V

    .line 394
    .line 395
    .line 396
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    .line 397
    .line 398
    const v1, 0x3b449ba6    # 0.003f

    .line 399
    .line 400
    .line 401
    invoke-virtual {v0, v1}, Ll/pqq0;->U1(F)V

    .line 402
    .line 403
    .line 404
    const v0, 0x4019999a    # 2.4f

    .line 405
    .line 406
    .line 407
    invoke-virtual {v7, v0}, Ll/qj0;->T1(F)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v7, v11}, Ll/qj0;->V1(F)V

    .line 411
    .line 412
    .line 413
    const v0, 0x3d89374c    # 0.067f

    .line 414
    .line 415
    .line 416
    invoke-virtual {v7, v0}, Ll/qj0;->U1(F)V

    .line 417
    .line 418
    .line 419
    return-void

    .line 420
    :pswitch_3
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 421
    .line 422
    invoke-virtual {v1}, Ll/pdj;->a2()V

    .line 423
    .line 424
    .line 425
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 426
    .line 427
    invoke-virtual {v1, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 428
    .line 429
    .line 430
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 431
    .line 432
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 436
    .line 437
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 441
    .line 442
    if-eqz v1, :cond_3

    .line 443
    .line 444
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 445
    .line 446
    if-eqz v1, :cond_3

    .line 447
    .line 448
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 449
    .line 450
    .line 451
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 452
    .line 453
    invoke-virtual {v1, v5}, Ll/cm80;->Z1(F)V

    .line 454
    .line 455
    .line 456
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 457
    .line 458
    invoke-virtual {v1, v14}, Ll/cm80;->setAlpha(F)V

    .line 459
    .line 460
    .line 461
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 462
    .line 463
    invoke-virtual {v1, v13}, Ll/cm80;->U1(F)V

    .line 464
    .line 465
    .line 466
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 467
    .line 468
    invoke-virtual {v1, v12, v6}, Ll/cm80;->X1(FF)V

    .line 469
    .line 470
    .line 471
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 472
    .line 473
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    :cond_3
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 477
    .line 478
    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 479
    .line 480
    .line 481
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 482
    .line 483
    invoke-virtual {v1, v15}, Ll/pdj;->S1(F)V

    .line 484
    .line 485
    .line 486
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 487
    .line 488
    invoke-virtual {v1, v10}, Ll/pdj;->R1(F)V

    .line 489
    .line 490
    .line 491
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 492
    .line 493
    const v1, -0x44cf0d84    # -0.0027f

    .line 494
    .line 495
    .line 496
    invoke-virtual {v0, v1}, Ll/pdj;->U1(F)V

    .line 497
    .line 498
    .line 499
    return-void

    .line 500
    :pswitch_4
    new-instance v1, Ll/qj0;

    .line 501
    .line 502
    invoke-direct {v1}, Ll/qj0;-><init>()V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v1}, Ll/qj0;->W1()V

    .line 506
    .line 507
    .line 508
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 509
    .line 510
    invoke-virtual {v4}, Ll/pdj;->a2()V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v1, v11, v11, v11, v11}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 514
    .line 515
    .line 516
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 517
    .line 518
    invoke-virtual {v4, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 519
    .line 520
    .line 521
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 522
    .line 523
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 527
    .line 528
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    .line 530
    .line 531
    iget-boolean v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 532
    .line 533
    if-eqz v2, :cond_4

    .line 534
    .line 535
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 536
    .line 537
    if-eqz v2, :cond_4

    .line 538
    .line 539
    invoke-virtual {v2}, Ll/cm80;->T1()V

    .line 540
    .line 541
    .line 542
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 543
    .line 544
    invoke-virtual {v2, v5}, Ll/cm80;->Z1(F)V

    .line 545
    .line 546
    .line 547
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 548
    .line 549
    invoke-virtual {v2, v14}, Ll/cm80;->setAlpha(F)V

    .line 550
    .line 551
    .line 552
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 553
    .line 554
    invoke-virtual {v2, v13}, Ll/cm80;->U1(F)V

    .line 555
    .line 556
    .line 557
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 558
    .line 559
    invoke-virtual {v2, v12, v6}, Ll/cm80;->X1(FF)V

    .line 560
    .line 561
    .line 562
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 563
    .line 564
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    :cond_4
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    .line 569
    .line 570
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 571
    .line 572
    invoke-virtual {v2, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 573
    .line 574
    .line 575
    const/high16 v2, 0x40000000    # 2.0f

    .line 576
    .line 577
    invoke-virtual {v1, v2}, Ll/qj0;->T1(F)V

    .line 578
    .line 579
    .line 580
    const v2, 0x3f19999a    # 0.6f

    .line 581
    .line 582
    .line 583
    invoke-virtual {v1, v2}, Ll/qj0;->V1(F)V

    .line 584
    .line 585
    .line 586
    const v2, 0x3c83126f    # 0.016f

    .line 587
    .line 588
    .line 589
    invoke-virtual {v1, v2}, Ll/qj0;->U1(F)V

    .line 590
    .line 591
    .line 592
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 593
    .line 594
    invoke-virtual {v1, v15}, Ll/pdj;->S1(F)V

    .line 595
    .line 596
    .line 597
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 598
    .line 599
    invoke-virtual {v1, v6}, Ll/pdj;->R1(F)V

    .line 600
    .line 601
    .line 602
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 603
    .line 604
    const v1, -0x44247454    # -0.0067f

    .line 605
    .line 606
    .line 607
    invoke-virtual {v0, v1}, Ll/pdj;->U1(F)V

    .line 608
    .line 609
    .line 610
    return-void

    .line 611
    :pswitch_5
    new-instance v1, Ll/x43;

    .line 612
    .line 613
    invoke-direct {v1}, Ll/x43;-><init>()V

    .line 614
    .line 615
    .line 616
    invoke-virtual {v1}, Ll/x43;->R1()V

    .line 617
    .line 618
    .line 619
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 620
    .line 621
    invoke-virtual {v4}, Ll/pdj;->a2()V

    .line 622
    .line 623
    .line 624
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 625
    .line 626
    invoke-virtual {v4, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 627
    .line 628
    .line 629
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 630
    .line 631
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 632
    .line 633
    .line 634
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 635
    .line 636
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 637
    .line 638
    .line 639
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 640
    .line 641
    .line 642
    iget-boolean v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 643
    .line 644
    if-eqz v2, :cond_5

    .line 645
    .line 646
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 647
    .line 648
    if-eqz v2, :cond_5

    .line 649
    .line 650
    invoke-virtual {v2}, Ll/cm80;->T1()V

    .line 651
    .line 652
    .line 653
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 654
    .line 655
    invoke-virtual {v2, v5}, Ll/cm80;->Z1(F)V

    .line 656
    .line 657
    .line 658
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 659
    .line 660
    invoke-virtual {v2, v14}, Ll/cm80;->setAlpha(F)V

    .line 661
    .line 662
    .line 663
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 664
    .line 665
    invoke-virtual {v2, v13}, Ll/cm80;->U1(F)V

    .line 666
    .line 667
    .line 668
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 669
    .line 670
    invoke-virtual {v2, v12, v6}, Ll/cm80;->X1(FF)V

    .line 671
    .line 672
    .line 673
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 674
    .line 675
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 676
    .line 677
    .line 678
    :cond_5
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 679
    .line 680
    invoke-virtual {v2, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v1, v11}, Ll/x43;->Q1(F)V

    .line 684
    .line 685
    .line 686
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 687
    .line 688
    const v2, 0x3f6147ae    # 0.88f

    .line 689
    .line 690
    .line 691
    invoke-virtual {v1, v2}, Ll/pdj;->S1(F)V

    .line 692
    .line 693
    .line 694
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 695
    .line 696
    const v1, 0x3ad1b717    # 0.0016f

    .line 697
    .line 698
    .line 699
    invoke-virtual {v0, v1}, Ll/pdj;->U1(F)V

    .line 700
    .line 701
    .line 702
    return-void

    .line 703
    :pswitch_6
    new-instance v1, Ll/qj0;

    .line 704
    .line 705
    invoke-direct {v1}, Ll/qj0;-><init>()V

    .line 706
    .line 707
    .line 708
    invoke-virtual {v1}, Ll/qj0;->W1()V

    .line 709
    .line 710
    .line 711
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 712
    .line 713
    invoke-virtual {v4}, Ll/pdj;->a2()V

    .line 714
    .line 715
    .line 716
    invoke-virtual {v1, v11, v11, v11, v11}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 717
    .line 718
    .line 719
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 720
    .line 721
    invoke-virtual {v4, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 722
    .line 723
    .line 724
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 725
    .line 726
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 727
    .line 728
    .line 729
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 730
    .line 731
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 732
    .line 733
    .line 734
    iget-boolean v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 735
    .line 736
    if-eqz v2, :cond_6

    .line 737
    .line 738
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 739
    .line 740
    if-eqz v2, :cond_6

    .line 741
    .line 742
    invoke-virtual {v2}, Ll/cm80;->T1()V

    .line 743
    .line 744
    .line 745
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 746
    .line 747
    invoke-virtual {v2, v5}, Ll/cm80;->Z1(F)V

    .line 748
    .line 749
    .line 750
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 751
    .line 752
    invoke-virtual {v2, v14}, Ll/cm80;->setAlpha(F)V

    .line 753
    .line 754
    .line 755
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 756
    .line 757
    invoke-virtual {v2, v13}, Ll/cm80;->U1(F)V

    .line 758
    .line 759
    .line 760
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 761
    .line 762
    invoke-virtual {v2, v12, v6}, Ll/cm80;->X1(FF)V

    .line 763
    .line 764
    .line 765
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 766
    .line 767
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 768
    .line 769
    .line 770
    :cond_6
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 771
    .line 772
    .line 773
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 774
    .line 775
    invoke-virtual {v2, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 776
    .line 777
    .line 778
    const/high16 v2, 0x40200000    # 2.5f

    .line 779
    .line 780
    invoke-virtual {v1, v2}, Ll/qj0;->T1(F)V

    .line 781
    .line 782
    .line 783
    const v2, 0x3f19999a    # 0.6f

    .line 784
    .line 785
    .line 786
    invoke-virtual {v1, v2}, Ll/qj0;->V1(F)V

    .line 787
    .line 788
    .line 789
    const v2, 0x3d6978d5    # 0.057f

    .line 790
    .line 791
    .line 792
    invoke-virtual {v1, v2}, Ll/qj0;->U1(F)V

    .line 793
    .line 794
    .line 795
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 796
    .line 797
    invoke-virtual {v1, v15}, Ll/pdj;->S1(F)V

    .line 798
    .line 799
    .line 800
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 801
    .line 802
    invoke-virtual {v1, v9}, Ll/pdj;->R1(F)V

    .line 803
    .line 804
    .line 805
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 806
    .line 807
    const v1, -0x447ced91    # -0.004f

    .line 808
    .line 809
    .line 810
    invoke-virtual {v0, v1}, Ll/pdj;->U1(F)V

    .line 811
    .line 812
    .line 813
    return-void

    .line 814
    :pswitch_7
    new-instance v1, Ll/qj0;

    .line 815
    .line 816
    invoke-direct {v1}, Ll/qj0;-><init>()V

    .line 817
    .line 818
    .line 819
    invoke-virtual {v1}, Ll/qj0;->W1()V

    .line 820
    .line 821
    .line 822
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 823
    .line 824
    invoke-virtual {v4}, Ll/pdj;->a2()V

    .line 825
    .line 826
    .line 827
    invoke-virtual {v1, v15, v15, v15, v15}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 828
    .line 829
    .line 830
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 831
    .line 832
    invoke-virtual {v4, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 833
    .line 834
    .line 835
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 836
    .line 837
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 838
    .line 839
    .line 840
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 841
    .line 842
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 843
    .line 844
    .line 845
    iget-boolean v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 846
    .line 847
    if-eqz v2, :cond_7

    .line 848
    .line 849
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 850
    .line 851
    if-eqz v2, :cond_7

    .line 852
    .line 853
    invoke-virtual {v2}, Ll/cm80;->T1()V

    .line 854
    .line 855
    .line 856
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 857
    .line 858
    invoke-virtual {v2, v5}, Ll/cm80;->Z1(F)V

    .line 859
    .line 860
    .line 861
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 862
    .line 863
    invoke-virtual {v2, v14}, Ll/cm80;->setAlpha(F)V

    .line 864
    .line 865
    .line 866
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 867
    .line 868
    invoke-virtual {v2, v13}, Ll/cm80;->U1(F)V

    .line 869
    .line 870
    .line 871
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 872
    .line 873
    invoke-virtual {v2, v12, v6}, Ll/cm80;->X1(FF)V

    .line 874
    .line 875
    .line 876
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 877
    .line 878
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 879
    .line 880
    .line 881
    :cond_7
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 882
    .line 883
    .line 884
    iget-object v2, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 885
    .line 886
    invoke-virtual {v2, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 887
    .line 888
    .line 889
    invoke-virtual {v1, v11}, Ll/qj0;->Q1(F)V

    .line 890
    .line 891
    .line 892
    const v2, 0x3c83126f    # 0.016f

    .line 893
    .line 894
    .line 895
    invoke-virtual {v1, v2}, Ll/qj0;->R1(F)V

    .line 896
    .line 897
    .line 898
    const v2, 0x3f19999a    # 0.6f

    .line 899
    .line 900
    .line 901
    invoke-virtual {v1, v2}, Ll/qj0;->S1(F)V

    .line 902
    .line 903
    .line 904
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 905
    .line 906
    invoke-virtual {v1, v7}, Ll/pdj;->Z1(F)V

    .line 907
    .line 908
    .line 909
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 910
    .line 911
    const v2, 0x3aaa64c3    # 0.0013f

    .line 912
    .line 913
    .line 914
    invoke-virtual {v1, v2}, Ll/pdj;->W1(F)V

    .line 915
    .line 916
    .line 917
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 918
    .line 919
    invoke-virtual {v0, v11}, Ll/pdj;->V1(F)V

    .line 920
    .line 921
    .line 922
    return-void

    .line 923
    :pswitch_8
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 924
    .line 925
    invoke-virtual {v1}, Ll/pdj;->a2()V

    .line 926
    .line 927
    .line 928
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 929
    .line 930
    invoke-virtual {v1, v2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 931
    .line 932
    .line 933
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->frameAdpterBlurFilter:Ll/h6j;

    .line 934
    .line 935
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 936
    .line 937
    .line 938
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 939
    .line 940
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 941
    .line 942
    .line 943
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 944
    .line 945
    if-eqz v1, :cond_8

    .line 946
    .line 947
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 948
    .line 949
    if-eqz v1, :cond_8

    .line 950
    .line 951
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 952
    .line 953
    .line 954
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 955
    .line 956
    invoke-virtual {v1, v5}, Ll/cm80;->Z1(F)V

    .line 957
    .line 958
    .line 959
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 960
    .line 961
    invoke-virtual {v1, v14}, Ll/cm80;->setAlpha(F)V

    .line 962
    .line 963
    .line 964
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 965
    .line 966
    invoke-virtual {v1, v13}, Ll/cm80;->U1(F)V

    .line 967
    .line 968
    .line 969
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 970
    .line 971
    invoke-virtual {v1, v12, v6}, Ll/cm80;->X1(FF)V

    .line 972
    .line 973
    .line 974
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 975
    .line 976
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 977
    .line 978
    .line 979
    goto :goto_0

    .line 980
    :cond_8
    new-instance v1, Ll/ogj0;

    .line 981
    .line 982
    invoke-direct {v1}, Ll/ogj0;-><init>()V

    .line 983
    .line 984
    .line 985
    invoke-virtual {v1}, Ll/ogj0;->Q1()V

    .line 986
    .line 987
    .line 988
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 989
    .line 990
    .line 991
    invoke-virtual {v1}, Ll/ogj0;->Q1()V

    .line 992
    .line 993
    .line 994
    :goto_0
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 995
    .line 996
    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 997
    .line 998
    .line 999
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 1000
    .line 1001
    invoke-virtual {v1, v9}, Ll/pdj;->S1(F)V

    .line 1002
    .line 1003
    .line 1004
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fuzzyGradShiftFilter:Ll/pdj;

    .line 1005
    .line 1006
    const/4 v1, 0x1

    .line 1007
    invoke-virtual {v0, v1}, Ll/pdj;->Y1(Z)V

    .line 1008
    .line 1009
    .line 1010
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private declared-synchronized setEffectIndex(I)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fixIndex:I

    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->isFirstFrame:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 9
    .line 10
    iput p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferIndex:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p1
.end method

.method private softTransferTemplate(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2
    new-instance v4, Ll/qj0;

    invoke-direct {v4}, Ll/qj0;-><init>()V

    const/high16 v5, 0x3f800000    # 1.0f

    .line 3
    invoke-virtual {v4, v5, v5, v5, v5}, Ll/wej;->setBackgroundColour(FFFF)V

    .line 4
    iget v6, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferIndex:I

    const/4 v7, 0x1

    add-int/2addr v6, v7

    rem-int/lit8 v6, v6, 0xa

    iput v6, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferIndex:I

    const v10, 0x3a83126f    # 0.001f

    const v13, -0x44d59b3d    # -0.0026f

    const v15, -0x43fced91    # -0.008f

    const v7, 0x3f7ae148    # 0.98f

    const v8, 0x3ca3d70a    # 0.02f

    const/high16 v11, 0x40400000    # 3.0f

    const v14, 0x3f99999a    # 1.2f

    const/4 v9, 0x0

    const/high16 v12, 0x3f000000    # 0.5f

    const v5, 0x3f733333    # 0.95f

    packed-switch v6, :pswitch_data_0

    return-void

    .line 5
    :pswitch_0
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v4, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 6
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_0

    .line 8
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 9
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 10
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 11
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 12
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 13
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 14
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 15
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    :cond_0
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 17
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v5}, Ll/pqq0;->R1(F)V

    .line 18
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v10}, Ll/pqq0;->S1(F)V

    .line 19
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->T1(F)V

    .line 20
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v13}, Ll/pqq0;->U1(F)V

    .line 21
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 22
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->W1(F)V

    .line 23
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 24
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v14}, Ll/pqq0;->b2(F)V

    return-void

    .line 25
    :pswitch_1
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v4, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 26
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_1

    .line 28
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 29
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 30
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 31
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 32
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 33
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 34
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 35
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    :cond_1
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 37
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v5}, Ll/pqq0;->R1(F)V

    .line 38
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v10}, Ll/pqq0;->S1(F)V

    .line 39
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->T1(F)V

    .line 40
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->U1(F)V

    .line 41
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 42
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v3, 0x3b2a64c3    # 0.0026f

    invoke-virtual {v1, v3}, Ll/pqq0;->W1(F)V

    .line 43
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 44
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v14}, Ll/pqq0;->b2(F)V

    return-void

    .line 45
    :pswitch_2
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v4, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 46
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_2

    .line 48
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 49
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 50
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 51
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 52
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 53
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 54
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 55
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    :cond_2
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 57
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3f59999a    # 0.85f

    invoke-virtual {v1, v2}, Ll/pqq0;->R1(F)V

    .line 58
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c449ba6    # 0.012f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 59
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->T1(F)V

    .line 60
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v13}, Ll/pqq0;->U1(F)V

    .line 61
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 62
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->W1(F)V

    .line 63
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 64
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v2}, Ll/pqq0;->b2(F)V

    return-void

    .line 65
    :pswitch_3
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v4, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 66
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_3

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_3

    .line 68
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 69
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 70
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 71
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 72
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 73
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 74
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 75
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 76
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    :cond_3
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 78
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3f666666    # 0.9f

    invoke-virtual {v1, v2}, Ll/pqq0;->R1(F)V

    .line 79
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c03126f    # 0.008f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 80
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->T1(F)V

    .line 81
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->U1(F)V

    .line 82
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 83
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v3, 0x3b2a64c3    # 0.0026f

    invoke-virtual {v1, v3}, Ll/pqq0;->W1(F)V

    .line 84
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 85
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v14}, Ll/pqq0;->b2(F)V

    return-void

    .line 86
    :pswitch_4
    invoke-virtual {v4}, Ll/qj0;->W1()V

    .line 87
    invoke-virtual {v4, v9}, Ll/qj0;->Q1(F)V

    .line 88
    iget-object v6, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v6, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 89
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_4

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_4

    .line 91
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 92
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 93
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 94
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 95
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 96
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 97
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 98
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    :cond_4
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 101
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3f4ccccd    # 0.8f

    invoke-virtual {v1, v2}, Ll/pqq0;->R1(F)V

    .line 102
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c83126f    # 0.016f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 103
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->T1(F)V

    .line 104
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v3, 0x3b2a64c3    # 0.0026f

    invoke-virtual {v1, v3}, Ll/pqq0;->U1(F)V

    .line 105
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 106
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->W1(F)V

    .line 107
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 108
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v2}, Ll/pqq0;->b2(F)V

    const v2, 0x3f4ccccd    # 0.8f

    .line 109
    invoke-virtual {v4, v2}, Ll/qj0;->S1(F)V

    const v0, 0x3d23d70a    # 0.04f

    .line 110
    invoke-virtual {v4, v0}, Ll/qj0;->R1(F)V

    return-void

    .line 111
    :pswitch_5
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v4, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 112
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_5

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_5

    .line 114
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 115
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 116
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 117
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 118
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 119
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 120
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 121
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    :cond_5
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 123
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v5}, Ll/pqq0;->R1(F)V

    .line 124
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c23d70a    # 0.01f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 125
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->T1(F)V

    .line 126
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v13}, Ll/pqq0;->U1(F)V

    .line 127
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 128
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->W1(F)V

    .line 129
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 130
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v2}, Ll/pqq0;->b2(F)V

    return-void

    .line 131
    :pswitch_6
    invoke-virtual {v4}, Ll/qj0;->W1()V

    .line 132
    invoke-virtual {v4, v9}, Ll/qj0;->Q1(F)V

    .line 133
    iget-object v6, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v6, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 134
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_6

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_6

    .line 136
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 137
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 138
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 139
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 140
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 141
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 142
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 143
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    :cond_6
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 146
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3f666666    # 0.9f

    invoke-virtual {v1, v2}, Ll/pqq0;->R1(F)V

    .line 147
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c23d70a    # 0.01f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 148
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->T1(F)V

    .line 149
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->U1(F)V

    .line 150
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 151
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3b23d70a    # 0.0025f

    invoke-virtual {v1, v2}, Ll/pqq0;->W1(F)V

    .line 152
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->Q1(F)V

    .line 153
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->b2(F)V

    const v1, 0x3f333333    # 0.7f

    .line 154
    invoke-virtual {v4, v1}, Ll/qj0;->S1(F)V

    const v1, 0x3cf5c28f    # 0.03f

    .line 155
    invoke-virtual {v4, v1}, Ll/qj0;->R1(F)V

    .line 156
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Ll/pqq0;->a2(ZI)V

    return-void

    .line 157
    :pswitch_7
    invoke-virtual {v4}, Ll/qj0;->W1()V

    .line 158
    invoke-virtual {v4, v9}, Ll/qj0;->Q1(F)V

    .line 159
    iget-object v6, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v6, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 160
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_7

    .line 162
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 163
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 164
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 165
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 166
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 167
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 168
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 169
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v2, v2}, Ll/pqq0;->a2(ZI)V

    goto :goto_0

    .line 171
    :cond_7
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/4 v5, 0x1

    invoke-virtual {v1, v5, v2}, Ll/pqq0;->a2(ZI)V

    .line 172
    :goto_0
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 174
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3f4ccccd    # 0.8f

    invoke-virtual {v1, v2}, Ll/pqq0;->R1(F)V

    .line 175
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c83126f    # 0.016f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 176
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v14}, Ll/pqq0;->T1(F)V

    .line 177
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, -0x44bb645a    # -0.003f

    invoke-virtual {v1, v2}, Ll/pqq0;->U1(F)V

    .line 178
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 179
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->W1(F)V

    .line 180
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 181
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v2}, Ll/pqq0;->b2(F)V

    const v2, 0x3f4ccccd    # 0.8f

    .line 182
    invoke-virtual {v4, v2}, Ll/qj0;->S1(F)V

    const v0, 0x3bc49ba6    # 0.006f

    .line 183
    invoke-virtual {v4, v0}, Ll/qj0;->R1(F)V

    return-void

    .line 184
    :pswitch_8
    iget-object v4, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v4, v1, v2}, Ll/pqq0;->Z1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 185
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    iget-boolean v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    if-eqz v1, :cond_8

    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    if-eqz v1, :cond_8

    .line 187
    invoke-virtual {v1}, Ll/cm80;->T1()V

    .line 188
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v11}, Ll/cm80;->Z1(F)V

    .line 189
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v12}, Ll/cm80;->setAlpha(F)V

    .line 190
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v8}, Ll/cm80;->U1(F)V

    .line 191
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v5, v5}, Ll/cm80;->V1(FF)V

    .line 192
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v7, v5}, Ll/cm80;->X1(FF)V

    .line 193
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-virtual {v1, v15}, Ll/cm80;->W1(F)V

    .line 194
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_8
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    invoke-virtual {v1, v3}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 196
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3f4ccccd    # 0.8f

    invoke-virtual {v1, v2}, Ll/pqq0;->R1(F)V

    .line 197
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3c83126f    # 0.016f

    invoke-virtual {v1, v2}, Ll/pqq0;->S1(F)V

    .line 198
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3fa66666    # 1.3f

    invoke-virtual {v1, v2}, Ll/pqq0;->T1(F)V

    .line 199
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const v2, 0x3b83126f    # 0.004f

    invoke-virtual {v1, v2}, Ll/pqq0;->U1(F)V

    .line 200
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v12}, Ll/pqq0;->V1(F)V

    .line 201
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v1, v9}, Ll/pqq0;->W1(F)V

    .line 202
    iget-object v1, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ll/pqq0;->Q1(F)V

    .line 203
    iget-object v0, v0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomEffectGroupFilter:Ll/pqq0;

    invoke-virtual {v0, v2}, Ll/pqq0;->b2(F)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getVideoProcessFilter()Ll/jt2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public lockCoverFrame(Landroid/graphics/Bitmap;Ll/k6j$a;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 10
    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    iget-object v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {v1, p1}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/k6j;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/k6j;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ll/k6j;->Q1(Ll/k6j$a;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public declared-synchronized lockFrame(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    iget-object v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {v1, p1}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    :goto_0
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p1
.end method

.method public reset()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fixIndex:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEffectBottomToTop()V
    .locals 1

    .line 1
    sget v0, Ll/jgj0;->FILTER_BOTTOM_TO_TOP_INDEX:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEffectDiffusion()V
    .locals 1

    .line 1
    sget v0, Ll/jgj0;->FILTER_DIFFUSION_INDEX:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEffectRightToLeft()V
    .locals 1

    .line 1
    sget v0, Ll/jgj0;->FILTER_RIGHT_TO_LEFT_INDEX:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setEffectSeries()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setEffectTemplateQuick(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, -0x4

    .line 2
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->analysisMaskMode(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance p2, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 17
    .line 18
    invoke-direct {p2, p1, v0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-eqz p2, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->updateSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    iput-object p3, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBitmap:Landroid/graphics/Bitmap;

    .line 34
    .line 35
    new-instance p1, Ll/cm80;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/cm80;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBitmap:Landroid/graphics/Bitmap;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ll/cm80;->Y1(Landroid/graphics/Bitmap;)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x1

    .line 48
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 49
    .line 50
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 51
    .line 52
    return-void
.end method

.method public setEffectTemplateSeries()V
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setEffectTemplateSoft(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, -0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->setEffectIndex(I)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->analysisMaskMode(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance p2, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 17
    .line 18
    invoke-direct {p2, p1, v0}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;-><init>(Landroid/content/Context;Lcom/momo/mcamera/mask/Sticker;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPre:Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-eqz p2, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mStickerPre:Lcom/momo/mcamera/mask/Sticker;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Lcom/momo/mcamera/mask/ImageMoveStickerMaskFilter;->updateSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    new-instance p1, Ll/cm80;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/cm80;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBasicFilterPost:Ll/cm80;

    .line 39
    .line 40
    iget-object p2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->mBitmap:Landroid/graphics/Bitmap;

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ll/cm80;->Y1(Landroid/graphics/Bitmap;)V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 47
    .line 48
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 49
    .line 50
    return-void
.end method

.method public setFrameRate(I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomFusionFilter:Ll/rqq0;

    .line 2
    .line 3
    const/16 v0, 0x19

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/rqq0;->setFrameRate(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->rightToLeftGroupFilter:Ll/cdd0;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/cdd0;->setFrameRate(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->bottomToTopGroupFilter:Ll/ue3;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ue3;->setFrameRate(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setLookupPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->downwardWithColorFilter:Ll/oae;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/oae;->setLookupPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->imageScaleWithColorChangingFilter:Ll/pkm;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/pkm;->setLookupPath(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeGradualEffectFilter:Ll/pyi0;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/pyi0;->setLookupPath(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public setTransFieldFilterListener(Ll/ap50;)V
    .locals 0

    .line 1
    return-void
.end method

.method public declared-synchronized setTransferFieldImage(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFirstFrame(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Ljava/util/List;)Z

    .line 12
    .line 13
    .line 14
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :cond_1
    :try_start_1
    iget v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->fixIndex:I

    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    const/16 v3, 0x8

    .line 23
    .line 24
    const/4 v4, 0x4

    .line 25
    const/4 v5, 0x1

    .line 26
    if-ne v1, v2, :cond_2

    .line 27
    .line 28
    iget v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 29
    .line 30
    add-int/2addr v1, v5

    .line 31
    iput v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 32
    .line 33
    iget v2, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectsCount:I

    .line 34
    .line 35
    rem-int/2addr v1, v2

    .line 36
    iput v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto/16 :goto_2

    .line 41
    .line 42
    :cond_2
    const/4 v2, -0x2

    .line 43
    if-ne v1, v2, :cond_3

    .line 44
    .line 45
    iget v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 46
    .line 47
    add-int/2addr v1, v5

    .line 48
    rem-int/2addr v1, v4

    .line 49
    add-int/2addr v1, v3

    .line 50
    iput v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    const/4 v2, -0x3

    .line 54
    if-ne v1, v2, :cond_4

    .line 55
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->softTransferTemplate(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    .line 59
    monitor-exit p0

    .line 60
    return-void

    .line 61
    :cond_4
    const/4 v2, -0x4

    .line 62
    if-ne v1, v2, :cond_5

    .line 63
    .line 64
    :try_start_2
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->quickTransferTemplate(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    .line 66
    .line 67
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :cond_5
    :try_start_3
    iput v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 70
    .line 71
    :goto_0
    iget v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->effectIndex:I

    .line 72
    .line 73
    if-nez v1, :cond_6

    .line 74
    .line 75
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeGradualEffectFilter:Ll/pyi0;

    .line 76
    .line 77
    invoke-virtual {v1, p1, p2}, Ll/pyi0;->R1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeGradualEffectFilter:Ll/pyi0;

    .line 81
    .line 82
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 88
    .line 89
    .line 90
    goto/16 :goto_1

    .line 91
    .line 92
    :cond_6
    if-ne v1, v5, :cond_7

    .line 93
    .line 94
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 100
    .line 101
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeStateInFilter:Ll/ryi0;

    .line 105
    .line 106
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeStateInFilter:Ll/ryi0;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/ryi0;->Q1()V

    .line 117
    .line 118
    .line 119
    goto/16 :goto_1

    .line 120
    .line 121
    :cond_7
    const/4 v2, 0x2

    .line 122
    if-ne v1, v2, :cond_8

    .line 123
    .line 124
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->downwardWithColorFilter:Ll/oae;

    .line 125
    .line 126
    invoke-virtual {v1, p1, p2}, Ll/oae;->R1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->downwardWithColorFilter:Ll/oae;

    .line 130
    .line 131
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 137
    .line 138
    .line 139
    goto/16 :goto_1

    .line 140
    .line 141
    :cond_8
    const/4 v2, 0x3

    .line 142
    if-ne v1, v2, :cond_9

    .line 143
    .line 144
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 145
    .line 146
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 150
    .line 151
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeStateEnterFilter:Ll/qyi0;

    .line 155
    .line 156
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->threeStateEnterFilter:Ll/qyi0;

    .line 165
    .line 166
    invoke-virtual {p1}, Ll/qyi0;->Q1()V

    .line 167
    .line 168
    .line 169
    goto/16 :goto_1

    .line 170
    .line 171
    :cond_9
    if-ne v1, v4, :cond_a

    .line 172
    .line 173
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 174
    .line 175
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 179
    .line 180
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->imageScaleWithColorChangingFilter:Ll/pkm;

    .line 184
    .line 185
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->imageScaleWithColorChangingFilter:Ll/pkm;

    .line 194
    .line 195
    invoke-virtual {p1}, Ll/pkm;->R1()V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_1

    .line 199
    .line 200
    :cond_a
    const/4 v2, 0x5

    .line 201
    if-ne v1, v2, :cond_b

    .line 202
    .line 203
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomFusionFilter:Ll/rqq0;

    .line 204
    .line 205
    invoke-virtual {v1, p1, p2}, Ll/rqq0;->Q1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->zoomFusionFilter:Ll/rqq0;

    .line 209
    .line 210
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 216
    .line 217
    .line 218
    goto/16 :goto_1

    .line 219
    .line 220
    :cond_b
    const/4 v2, 0x6

    .line 221
    if-ne v1, v2, :cond_c

    .line 222
    .line 223
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->rightToLeftGroupFilter:Ll/cdd0;

    .line 224
    .line 225
    invoke-virtual {v1, p1, p2}, Ll/cdd0;->Q1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->rightToLeftGroupFilter:Ll/cdd0;

    .line 229
    .line 230
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 234
    .line 235
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 236
    .line 237
    .line 238
    goto/16 :goto_1

    .line 239
    .line 240
    :cond_c
    const/4 v2, 0x7

    .line 241
    if-ne v1, v2, :cond_d

    .line 242
    .line 243
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->bottomToTopGroupFilter:Ll/ue3;

    .line 244
    .line 245
    invoke-virtual {v1, p1, p2}, Ll/ue3;->Q1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 246
    .line 247
    .line 248
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->bottomToTopGroupFilter:Ll/ue3;

    .line 249
    .line 250
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 254
    .line 255
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 256
    .line 257
    .line 258
    goto :goto_1

    .line 259
    :cond_d
    if-ne v1, v3, :cond_e

    .line 260
    .line 261
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateGroupFilter:Ll/mh0;

    .line 262
    .line 263
    invoke-virtual {v1, p1, p2}, Ll/mh0;->Q1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateGroupFilter:Ll/mh0;

    .line 267
    .line 268
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 272
    .line 273
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 274
    .line 275
    .line 276
    goto :goto_1

    .line 277
    :cond_e
    const/16 v2, 0x9

    .line 278
    .line 279
    if-ne v1, v2, :cond_f

    .line 280
    .line 281
    iget-object v1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateOverlapGroupFilter:Ll/oh0;

    .line 282
    .line 283
    invoke-virtual {v1, p1, p2}, Ll/oh0;->Q1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumTemplateOverlapGroupFilter:Ll/oh0;

    .line 287
    .line 288
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 292
    .line 293
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 294
    .line 295
    .line 296
    goto :goto_1

    .line 297
    :cond_f
    const/16 p1, 0xa

    .line 298
    .line 299
    if-ne v1, p1, :cond_10

    .line 300
    .line 301
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 302
    .line 303
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 307
    .line 308
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    .line 310
    .line 311
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumGrayFilter:Ll/ih0;

    .line 312
    .line 313
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 317
    .line 318
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->albumGrayFilter:Ll/ih0;

    .line 322
    .line 323
    invoke-virtual {p1}, Ll/ih0;->Q1()V

    .line 324
    .line 325
    .line 326
    goto :goto_1

    .line 327
    :cond_10
    const/16 p1, 0xb

    .line 328
    .line 329
    if-ne v1, p1, :cond_11

    .line 330
    .line 331
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 332
    .line 333
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->curImgFilter:Ll/h6j;

    .line 337
    .line 338
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->topShiftFilter:Ll/y6j0;

    .line 342
    .line 343
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->processFilter:Ll/jqf0;

    .line 347
    .line 348
    invoke-virtual {p1, v0}, Ll/jqf0;->R1(Ljava/util/List;)V

    .line 349
    .line 350
    .line 351
    iget-object p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->topShiftFilter:Ll/y6j0;

    .line 352
    .line 353
    invoke-virtual {p1}, Ll/y6j0;->Q1()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 354
    .line 355
    .line 356
    :cond_11
    :goto_1
    monitor-exit p0

    .line 357
    return-void

    .line 358
    :goto_2
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 359
    throw p1
.end method

.method public startPostWatermark(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPostWatermark:Z

    .line 2
    .line 3
    return-void
.end method

.method public startPreWatermark(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/TransFieldGroupFilterChooser;->startPreWatermark:Z

    .line 2
    .line 3
    return-void
.end method
