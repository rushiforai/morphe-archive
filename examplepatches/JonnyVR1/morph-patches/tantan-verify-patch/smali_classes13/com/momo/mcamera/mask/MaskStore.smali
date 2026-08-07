.class public Lcom/momo/mcamera/mask/MaskStore;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static ourInstance:Lcom/momo/mcamera/mask/MaskStore;


# instance fields
.field private final PATH_FOLDER:Ljava/lang/String;

.field private folderPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/mcamera/mask/MaskStore;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/mcamera/mask/MaskStore;->ourInstance:Lcom/momo/mcamera/mask/MaskStore;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "stickers"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/MaskStore;->PATH_FOLDER:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static getInstance()Lcom/momo/mcamera/mask/MaskStore;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/MaskStore;->ourInstance:Lcom/momo/mcamera/mask/MaskStore;

    .line 2
    .line 3
    return-object v0
.end method

.method private getMaskFolder(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, "/"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method private getMasksByFolderName(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/MaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MaskStore;->getMaskFolder(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Lcom/core/glcore/util/FileUtil;->checkFile(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljava/io/File;

    .line 14
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MaskStore;->getMaskFolder(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_0
    invoke-static {p2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    array-length v1, p2

    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    if-ge v2, v1, :cond_2

    .line 35
    .line 36
    aget-object v3, p2, v2

    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {p0, p1, v4}, Lcom/momo/mcamera/mask/MaskStore;->getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    if-eqz v4, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-eqz v6, :cond_1

    .line 64
    .line 65
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    check-cast v6, Lcom/momo/mcamera/mask/Sticker;

    .line 70
    .line 71
    iget v7, v4, Lcom/momo/mcamera/mask/MaskModel;->frameRate:I

    .line 72
    .line 73
    invoke-virtual {v6, v7}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v7

    .line 80
    invoke-virtual {v6, v7}, Lcom/momo/mcamera/mask/Sticker;->setImageFolderPath(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    :goto_2
    return-object v0
.end method


# virtual methods
.method public getFolderPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskStore;->folderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGestureMasks(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/MaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "MaskG"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/mask/MaskStore;->getMasksByFolderName(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMask(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/mask/MaskModel;
    .locals 9

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "/params.txt"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, "/params.json"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, p1, v0}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    const/4 v2, 0x0

    .line 67
    if-nez v1, :cond_11

    .line 68
    .line 69
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const-class v3, Lcom/momo/mcamera/mask/MaskModel;

    .line 74
    .line 75
    invoke-virtual {v1, v0, v3}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/momo/mcamera/mask/MaskModel;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    if-nez v1, :cond_1

    .line 86
    .line 87
    new-instance v1, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MaskModel;->setStickers(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v2, "/preview.png"

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    const/4 v3, 0x0

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MaskModel;->setPreviewPath(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_2
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-eqz v2, :cond_3

    .line 159
    .line 160
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    check-cast v1, Lcom/momo/mcamera/mask/Sticker;

    .line 165
    .line 166
    invoke-virtual {v1, p2}, Lcom/momo/mcamera/mask/Sticker;->setImageFolderPath(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, p1, v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePathByIndex(Landroid/content/Context;I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MaskModel;->setPreviewPath(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_3
    :goto_0
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSound()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    const-string v2, "/"

    .line 185
    .line 186
    if-nez v1, :cond_4

    .line 187
    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getSound()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MaskModel;->setSoundPath(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    :cond_4
    invoke-virtual {v0, p2}, Lcom/momo/mcamera/mask/MaskModel;->setFolderPath(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getLookUpFilters()Ljava/util/List;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    if-eqz v1, :cond_5

    .line 225
    .line 226
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getLookUpFilters()Ljava/util/List;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 235
    .line 236
    .line 237
    move-result v4

    .line 238
    if-eqz v4, :cond_5

    .line 239
    .line 240
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    check-cast v4, Lcom/momo/mcamera/mask/LookUpModel;

    .line 245
    .line 246
    new-instance v5, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v6

    .line 255
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/LookUpModel;->getFolder()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v6

    .line 265
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    invoke-static {p1, v5}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->getPresetFilterByFolder(Landroid/content/Context;Ljava/lang/String;)Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 273
    .line 274
    .line 275
    move-result-object v5

    .line 276
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/LookUpModel;->setPresetFilter(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    .line 277
    .line 278
    .line 279
    new-instance v5, Lcom/momo/mcamera/mask/Sticker;

    .line 280
    .line 281
    invoke-direct {v5}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getOrderedIndex()I

    .line 285
    .line 286
    .line 287
    move-result v6

    .line 288
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setOrderedIndex(I)V

    .line 289
    .line 290
    .line 291
    const-string v6, "FACE_LOOK_UP_TYPE"

    .line 292
    .line 293
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/LookUpModel;->getTriggerType()I

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setTriggerType(I)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v5, v4}, Lcom/momo/mcamera/mask/Sticker;->setLookUpModel(Lcom/momo/mcamera/mask/LookUpModel;)V

    .line 304
    .line 305
    .line 306
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/LookUpModel;->getHiddenTriggerType()I

    .line 307
    .line 308
    .line 309
    move-result v4

    .line 310
    invoke-virtual {v5, v4}, Lcom/momo/mcamera/mask/Sticker;->setHiddenTriggerType(I)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    invoke-interface {v4, v3, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    goto :goto_1

    .line 321
    :cond_5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getMasks()Ljava/util/List;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    if-eqz v1, :cond_8

    .line 326
    .line 327
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getMasks()Ljava/util/List;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    :cond_6
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 336
    .line 337
    .line 338
    move-result v4

    .line 339
    if-eqz v4, :cond_8

    .line 340
    .line 341
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    check-cast v4, Lcom/momo/mcamera/mask/Mask;

    .line 346
    .line 347
    new-instance v5, Ljava/lang/StringBuilder;

    .line 348
    .line 349
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v6

    .line 356
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getFolder()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v6

    .line 366
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    const-string v6, "/metadata.json"

    .line 370
    .line 371
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v5

    .line 378
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 379
    .line 380
    .line 381
    move-result-object v6

    .line 382
    invoke-virtual {v6, p1, v5}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v5

    .line 386
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 387
    .line 388
    .line 389
    move-result-object v6

    .line 390
    const-class v7, Lcom/momo/mcamera/mask/Mask;

    .line 391
    .line 392
    invoke-virtual {v6, v5, v7}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object v5

    .line 396
    check-cast v5, Lcom/momo/mcamera/mask/Mask;

    .line 397
    .line 398
    if-eqz v5, :cond_6

    .line 399
    .line 400
    iget-object v5, v5, Lcom/momo/mcamera/mask/Mask;->landmarks:[F

    .line 401
    .line 402
    if-nez v5, :cond_7

    .line 403
    .line 404
    goto :goto_2

    .line 405
    :cond_7
    iput-object v5, v4, Lcom/momo/mcamera/mask/Mask;->landmarks:[F

    .line 406
    .line 407
    new-instance v5, Ljava/lang/StringBuilder;

    .line 408
    .line 409
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 410
    .line 411
    .line 412
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v6

    .line 416
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getFolder()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v6

    .line 426
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    const-string v6, "/texture.png"

    .line 430
    .line 431
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v5

    .line 438
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Mask;->setTexturePath(Ljava/lang/String;)V

    .line 439
    .line 440
    .line 441
    new-instance v5, Lcom/momo/mcamera/mask/Sticker;

    .line 442
    .line 443
    invoke-direct {v5}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 444
    .line 445
    .line 446
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getOrderedIndex()I

    .line 447
    .line 448
    .line 449
    move-result v6

    .line 450
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setOrderedIndex(I)V

    .line 451
    .line 452
    .line 453
    const-string v6, "FACE_MASK_TYPE"

    .line 454
    .line 455
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getTriggerType()I

    .line 459
    .line 460
    .line 461
    move-result v6

    .line 462
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setTriggerType(I)V

    .line 463
    .line 464
    .line 465
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getHiddenTriggerType()I

    .line 466
    .line 467
    .line 468
    move-result v6

    .line 469
    invoke-virtual {v5, v6}, Lcom/momo/mcamera/mask/Sticker;->setHiddenTriggerType(I)V

    .line 470
    .line 471
    .line 472
    invoke-virtual {v5, v4}, Lcom/momo/mcamera/mask/Sticker;->setMask(Lcom/momo/mcamera/mask/Mask;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    invoke-interface {v4, v3, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 480
    .line 481
    .line 482
    goto/16 :goto_2

    .line 483
    .line 484
    :cond_8
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getDistortionList()Ljava/util/List;

    .line 485
    .line 486
    .line 487
    move-result-object v1

    .line 488
    if-eqz v1, :cond_9

    .line 489
    .line 490
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getDistortionList()Ljava/util/List;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 495
    .line 496
    .line 497
    move-result-object v1

    .line 498
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 499
    .line 500
    .line 501
    move-result v4

    .line 502
    if-eqz v4, :cond_9

    .line 503
    .line 504
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    check-cast v4, Lcom/momo/mcamera/mask/Mask;

    .line 509
    .line 510
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getStrength()F

    .line 511
    .line 512
    .line 513
    move-result v5

    .line 514
    invoke-virtual {v0, v5}, Lcom/momo/mcamera/mask/MaskModel;->setFaceScale(F)V

    .line 515
    .line 516
    .line 517
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getStrengthB()F

    .line 518
    .line 519
    .line 520
    move-result v5

    .line 521
    invoke-virtual {v0, v5}, Lcom/momo/mcamera/mask/MaskModel;->setFaceFacialFeatureScale(F)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getType()Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v5

    .line 528
    invoke-virtual {v0, v5}, Lcom/momo/mcamera/mask/MaskModel;->setWrapType(Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getTriggerType()I

    .line 532
    .line 533
    .line 534
    move-result v5

    .line 535
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getHiddenTriggerType()I

    .line 536
    .line 537
    .line 538
    move-result v6

    .line 539
    new-instance v7, Lcom/momo/mcamera/mask/Sticker;

    .line 540
    .line 541
    invoke-direct {v7}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getOrderedIndex()I

    .line 545
    .line 546
    .line 547
    move-result v8

    .line 548
    invoke-virtual {v7, v8}, Lcom/momo/mcamera/mask/Sticker;->setOrderedIndex(I)V

    .line 549
    .line 550
    .line 551
    invoke-virtual {v7, v5}, Lcom/momo/mcamera/mask/Sticker;->setTriggerType(I)V

    .line 552
    .line 553
    .line 554
    invoke-virtual {v7, v6}, Lcom/momo/mcamera/mask/Sticker;->setHiddenTriggerType(I)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {v7, v4}, Lcom/momo/mcamera/mask/Sticker;->setMask(Lcom/momo/mcamera/mask/Mask;)V

    .line 558
    .line 559
    .line 560
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 561
    .line 562
    .line 563
    move-result-object v4

    .line 564
    invoke-interface {v4, v3, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 565
    .line 566
    .line 567
    goto :goto_3

    .line 568
    :cond_9
    iget-object v1, v0, Lcom/momo/mcamera/mask/MaskModel;->spectrumSticker:Lcom/momo/mcamera/mask/Sticker;

    .line 569
    .line 570
    if-eqz v1, :cond_a

    .line 571
    .line 572
    const-string v4, "STICKER_TYPE_VOICE"

    .line 573
    .line 574
    invoke-virtual {v1, v4}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 575
    .line 576
    .line 577
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 578
    .line 579
    .line 580
    move-result-object v1

    .line 581
    iget-object v4, v0, Lcom/momo/mcamera/mask/MaskModel;->spectrumSticker:Lcom/momo/mcamera/mask/Sticker;

    .line 582
    .line 583
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 584
    .line 585
    .line 586
    :cond_a
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 591
    .line 592
    .line 593
    move-result-object v1

    .line 594
    :cond_b
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 595
    .line 596
    .line 597
    move-result v4

    .line 598
    if-eqz v4, :cond_f

    .line 599
    .line 600
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v4

    .line 604
    check-cast v4, Lcom/momo/mcamera/mask/Sticker;

    .line 605
    .line 606
    iget v5, v0, Lcom/momo/mcamera/mask/MaskModel;->frameRate:I

    .line 607
    .line 608
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Sticker;->setFrameRate(I)V

    .line 609
    .line 610
    .line 611
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v5

    .line 615
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Sticker;->setImageFolderPath(Ljava/lang/String;)V

    .line 616
    .line 617
    .line 618
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getOrderedIndex()I

    .line 619
    .line 620
    .line 621
    move-result v5

    .line 622
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Sticker;->setOrderedIndex(I)V

    .line 623
    .line 624
    .line 625
    const-string v5, "3d"

    .line 626
    .line 627
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v6

    .line 631
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 632
    .line 633
    .line 634
    move-result v5

    .line 635
    if-eqz v5, :cond_c

    .line 636
    .line 637
    invoke-virtual {p2, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 638
    .line 639
    .line 640
    move-result v5

    .line 641
    invoke-virtual {p2, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v5

    .line 645
    invoke-virtual {v0, v5}, Lcom/momo/mcamera/mask/MaskModel;->setXengineEsPath(Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Sticker;->setXengineEsPath(Ljava/lang/String;)V

    .line 649
    .line 650
    .line 651
    :cond_c
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 652
    .line 653
    .line 654
    move-result-object v5

    .line 655
    if-eqz v5, :cond_d

    .line 656
    .line 657
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 658
    .line 659
    .line 660
    move-result-object v5

    .line 661
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/AdditionalInfo;->isComic()Z

    .line 662
    .line 663
    .line 664
    move-result v5

    .line 665
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Sticker;->setComic(Z)V

    .line 666
    .line 667
    .line 668
    :cond_d
    const-string v5, "video_file"

    .line 669
    .line 670
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getLayerType()Ljava/lang/String;

    .line 671
    .line 672
    .line 673
    move-result-object v6

    .line 674
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 675
    .line 676
    .line 677
    move-result v5

    .line 678
    if-eqz v5, :cond_b

    .line 679
    .line 680
    new-instance v5, Ljava/lang/StringBuilder;

    .line 681
    .line 682
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 683
    .line 684
    .line 685
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    .line 687
    .line 688
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    .line 690
    .line 691
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 692
    .line 693
    .line 694
    move-result-object v6

    .line 695
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    .line 697
    .line 698
    const-string v6, "/config.json"

    .line 699
    .line 700
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 701
    .line 702
    .line 703
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v5

    .line 707
    invoke-static {v5}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 708
    .line 709
    .line 710
    move-result v6

    .line 711
    if-eqz v6, :cond_e

    .line 712
    .line 713
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 714
    .line 715
    .line 716
    move-result-object v6

    .line 717
    invoke-virtual {v6, p1, v5}, Lcom/core/glcore/util/JsonUtil;->jsonStringFromFile(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 718
    .line 719
    .line 720
    move-result-object v5

    .line 721
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 722
    .line 723
    .line 724
    move-result v6

    .line 725
    if-nez v6, :cond_b

    .line 726
    .line 727
    :try_start_1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 728
    .line 729
    .line 730
    move-result-object v6

    .line 731
    const-class v7, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

    .line 732
    .line 733
    invoke-virtual {v6, v5, v7}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 734
    .line 735
    .line 736
    move-result-object v5

    .line 737
    check-cast v5, Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;

    .line 738
    .line 739
    if-eqz v5, :cond_b

    .line 740
    .line 741
    invoke-virtual {v4, v5}, Lcom/momo/mcamera/mask/Sticker;->setVideoFileConfig(Lcom/momo/mcamera/mask/Sticker$VideoFileConfig;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 742
    .line 743
    .line 744
    goto/16 :goto_4

    .line 745
    .line 746
    :catch_0
    move-exception v4

    .line 747
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 748
    .line 749
    .line 750
    goto/16 :goto_4

    .line 751
    .line 752
    :cond_e
    const-class v4, Lcom/momo/mcamera/mask/MaskStore;

    .line 753
    .line 754
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 755
    .line 756
    .line 757
    move-result-object v4

    .line 758
    const-string v5, "video_file\u7c7b\u578b\u4f46\u6ca1\u6709config.json\u6587\u4ef6."

    .line 759
    .line 760
    invoke-static {v4, v5}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 761
    .line 762
    .line 763
    goto/16 :goto_4

    .line 764
    .line 765
    :cond_f
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getEffectList()Ljava/util/List;

    .line 766
    .line 767
    .line 768
    move-result-object p0

    .line 769
    if-eqz p0, :cond_10

    .line 770
    .line 771
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MaskModel;->getEffectList()Ljava/util/List;

    .line 772
    .line 773
    .line 774
    move-result-object p0

    .line 775
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 776
    .line 777
    .line 778
    move-result-object p0

    .line 779
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 780
    .line 781
    .line 782
    move-result p1

    .line 783
    if-eqz p1, :cond_10

    .line 784
    .line 785
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 786
    .line 787
    .line 788
    move-result-object p1

    .line 789
    check-cast p1, Lcom/momo/mcamera/mask/bean/EffectFilterItem;

    .line 790
    .line 791
    invoke-virtual {p1, p2}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->setImageFolderPath(Ljava/lang/String;)V

    .line 792
    .line 793
    .line 794
    goto :goto_5

    .line 795
    :cond_10
    return-object v0

    .line 796
    :catch_1
    move-exception p0

    .line 797
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 798
    .line 799
    .line 800
    :cond_11
    return-object v2
.end method

.method public getMasks(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/MaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "Mask"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/mask/MaskStore;->getMasksByFolderName(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public setFolderPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskStore;->folderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
