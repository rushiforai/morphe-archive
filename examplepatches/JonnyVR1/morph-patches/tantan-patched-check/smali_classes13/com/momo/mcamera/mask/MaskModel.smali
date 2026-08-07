.class public Lcom/momo/mcamera/mask/MaskModel;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final FACEWARPTYPE_AWL_FACE:Ljava/lang/String; = "awlface"

.field public static final FACEWARPTYPE_BEAUTY:Ljava/lang/String; = "beauty"

.field public static final FACEWARPTYPE_BIG_HEAD:Ljava/lang/String; = "bighead"

.field public static final FACEWARPTYPE_BIG_HEAD_2:Ljava/lang/String; = "big_head_2"

.field public static final FACEWARPTYPE_FAT_FACE_SMALL_CHIN:Ljava/lang/String; = "fat_face_small_chin"

.field public static final FACEWARPTYPE_FAT_FACE_THIN_LIP:Ljava/lang/String; = "fat_face_thin_lip"

.field public static final FACEWARPTYPE_PEARFACE_SMALLEYE_BIGMOUTH:Ljava/lang/String; = "pear_face_small_eye_big_mouth"

.field public static final FACEWARPTYPE_RECTANGLEFACE_SMALLFEATURE:Ljava/lang/String; = "rectangle_face_small_feature"

.field public static final FACEWARPTYPE_ROUND_FACE:Ljava/lang/String; = "round_face"

.field public static final FACEWARPTYPE_SHORT_FACE:Ljava/lang/String; = "shortface"

.field public static final FACEWARPTYPE_SMALLFACE_BIGEYE:Ljava/lang/String; = "small_face_big_eye"

.field public static final FACEWARPTYPE_TINYFACE_BIGEYE:Ljava/lang/String; = "tiny_face_big_eye"

.field public static final TYPE_ACTION_DETECT:I = 0x63

.field public static final TYPE_FACE_3D_GAME:I = 0xd

.field public static final TYPE_FACE_3D_GAME_HEAD:I = 0xe

.field public static final TYPE_FACE_EXPRESSION:I = 0x7

.field public static final TYPE_GAME_STICKER:I = 0x6

.field public static final TYPE_HANI_STICKER:I = 0x5

.field public static final TYPE_LIVE_GAME:I = 0x8

.field public static final TYPE_MOMENT:I = 0x0

.field public static final TYPE_VIDEO_DECORATE:I = 0x2

.field public static final TYPE_VIDEO_EFFECT:I = 0x3

.field public static final TYPE_VIDEO_FUNNY_EFFECT:I = 0xc

.field public static final TYPE_VIDEO_GESTURE_DETECT_EFFECT:I = 0x4

.field public static final TYPE_VIDEO_GIFT:I = 0x1

.field public static final TYPE_VIDEO_GIFT_ADDITION:I = 0xb

.field public static final TYPE_VIDEO_INTERACTIVE_EFFECT:I = 0xa

.field public static final TYPE_VIDEO_SCENE:I = 0x9

.field public static final TYPE_VIRTUAL_AVATAR:I = 0xf

.field public static final TYPE_VIRTUAL_AVATAR_VOICE:I = 0x10

.field public static faceWarpTypeSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public addTime:J

.field private additionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "additionalInfo"
    .end annotation
.end field

.field private audioRecord:Z

.field private beautyFace:Lcom/momo/mcamera/mask/BeautyFace;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "beautyFace"
    .end annotation
.end field

.field private decorationGiftPack:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "ml_decoration_gift_pack"
    .end annotation
.end field

.field distortionList:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "distortionList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;"
        }
    .end annotation
.end field

.field private duration:J

.field private effectList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/bean/EffectFilterItem;",
            ">;"
        }
    .end annotation
.end field

.field faceFacialFeatureScale:F

.field faceScale:F

.field private facialLandmarksCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "facialLandmarksCount"
    .end annotation
.end field

.field private filterDisable:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "filterDisable"
    .end annotation
.end field

.field folderPath:Ljava/lang/String;

.field private forbidClone:Z

.field frameRate:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frameRate"
    .end annotation
.end field

.field lookUpFilters:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "filterList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/LookUpModel;",
            ">;"
        }
    .end annotation
.end field

.field masks:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "faceMaskList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;"
        }
    .end annotation
.end field

.field private modelType:I

.field name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private orderedIndex:I

.field private pollGroupNum:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pollGroupNum"
    .end annotation
.end field

.field previewPath:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "previewPath"
    .end annotation
.end field

.field sound:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sound"
    .end annotation
.end field

.field private soundId:I

.field soundPath:Ljava/lang/String;

.field soundPitchMode:I

.field public spectrumSticker:Lcom/momo/mcamera/mask/Sticker;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "spectrumFilter"
    .end annotation
.end field

.field stickers:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "itemList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field triggerRegion:[I

.field private triggerTip:Lcom/momo/mcamera/mask/TriggerTip;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerTip"
    .end annotation
.end field

.field triggerType:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggerType"
    .end annotation
.end field

.field private triggeringMicEffect:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "triggeringMicEffect"
    .end annotation
.end field

.field warpType:Ljava/lang/String;

.field xengineEsPath:Ljava/lang/String;

.field private xengineSearchPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 7
    .line 8
    const-string v1, "beauty"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 14
    .line 15
    const-string v1, "awlface"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 21
    .line 22
    const-string v1, "shortface"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 28
    .line 29
    const-string v1, "bighead"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 35
    .line 36
    const-string v1, "tiny_face_big_eye"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 42
    .line 43
    const-string v1, "small_face_big_eye"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 49
    .line 50
    const-string v1, "rectangle_face_small_feature"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 56
    .line 57
    const-string v1, "pear_face_small_eye_big_mouth"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 63
    .line 64
    const-string v1, "round_face"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 70
    .line 71
    const-string v1, "big_head_2"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 77
    .line 78
    const-string v1, "fat_face_thin_lip"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    sget-object v0, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 84
    .line 85
    const-string v1, "fat_face_small_chin"

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/MaskModel;->orderedIndex:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/MaskModel;->soundPitchMode:I

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MaskModel;->forbidClone:Z

    .line 10
    .line 11
    return-void
.end method

.method public static mappingWarpType(Ljava/lang/String;)I
    .locals 11

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    const/4 v2, 0x7

    .line 11
    const/4 v3, 0x6

    .line 12
    const/4 v4, 0x5

    .line 13
    const/4 v5, 0x4

    .line 14
    const/4 v6, 0x3

    .line 15
    const/4 v7, 0x2

    .line 16
    const/4 v8, 0x1

    .line 17
    const/4 v9, 0x0

    .line 18
    const/4 v10, -0x1

    .line 19
    sparse-switch v0, :sswitch_data_0

    .line 20
    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :sswitch_0
    const-string v0, "big_head_2"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    goto/16 :goto_0

    .line 33
    .line 34
    :cond_0
    const/16 v10, 0xb

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :sswitch_1
    const-string v0, "fat_face_thin_lip"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :cond_1
    const/16 v10, 0xa

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :sswitch_2
    const-string v0, "rectangle_face_small_feature"

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_2

    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_2
    const/16 v10, 0x9

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :sswitch_3
    const-string v0, "pear_face_small_eye_big_mouth"

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_3

    .line 73
    .line 74
    goto/16 :goto_0

    .line 75
    .line 76
    :cond_3
    move v10, v1

    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :sswitch_4
    const-string v0, "bighead"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_4

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_4
    move v10, v2

    .line 90
    goto :goto_0

    .line 91
    :sswitch_5
    const-string v0, "round_face"

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_5

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    move v10, v3

    .line 101
    goto :goto_0

    .line 102
    :sswitch_6
    const-string v0, "tiny_face_big_eye"

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-nez p0, :cond_6

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    move v10, v4

    .line 112
    goto :goto_0

    .line 113
    :sswitch_7
    const-string v0, "fat_face_small_chin"

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-nez p0, :cond_7

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_7
    move v10, v5

    .line 123
    goto :goto_0

    .line 124
    :sswitch_8
    const-string v0, "awlface"

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-nez p0, :cond_8

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_8
    move v10, v6

    .line 134
    goto :goto_0

    .line 135
    :sswitch_9
    const-string v0, "small_face_big_eye"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-nez p0, :cond_9

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_9
    move v10, v7

    .line 145
    goto :goto_0

    .line 146
    :sswitch_a
    const-string v0, "beauty"

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-nez p0, :cond_a

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_a
    move v10, v8

    .line 156
    goto :goto_0

    .line 157
    :sswitch_b
    const-string v0, "shortface"

    .line 158
    .line 159
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-nez p0, :cond_b

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_b
    move v10, v9

    .line 167
    :goto_0
    packed-switch v10, :pswitch_data_0

    .line 168
    .line 169
    .line 170
    return v9

    .line 171
    :pswitch_0
    const/16 p0, 0xd

    .line 172
    .line 173
    return p0

    .line 174
    :pswitch_1
    const/16 p0, 0xe

    .line 175
    .line 176
    return p0

    .line 177
    :pswitch_2
    return v2

    .line 178
    :pswitch_3
    return v1

    .line 179
    :pswitch_4
    return v5

    .line 180
    :pswitch_5
    const/16 p0, 0xc

    .line 181
    .line 182
    return p0

    .line 183
    :pswitch_6
    return v4

    .line 184
    :pswitch_7
    const/16 p0, 0xf

    .line 185
    .line 186
    return p0

    .line 187
    :pswitch_8
    return v6

    .line 188
    :pswitch_9
    return v3

    .line 189
    :pswitch_a
    return v8

    .line 190
    :pswitch_b
    return v7

    .line 191
    :sswitch_data_0
    .sparse-switch
        -0x78d94327 -> :sswitch_b
        -0x5307ef84 -> :sswitch_a
        -0x34900138 -> :sswitch_9
        -0x239119ad -> :sswitch_8
        -0x1e5dd982 -> :sswitch_7
        -0x14ea8291 -> :sswitch_6
        -0x8b95992 -> :sswitch_5
        -0x6d43520 -> :sswitch_4
        0x20708b59 -> :sswitch_3
        0x2147ee2c -> :sswitch_2
        0x5af9dce9 -> :sswitch_1
        0x786cc1b2 -> :sswitch_0
    .end sparse-switch

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
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
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

.method public static momentMappingWarpType(Ljava/lang/String;)I
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    const/4 v2, 0x7

    .line 11
    const/4 v3, 0x6

    .line 12
    const/4 v4, 0x5

    .line 13
    const/4 v5, 0x4

    .line 14
    const/4 v6, 0x3

    .line 15
    const/4 v7, 0x2

    .line 16
    const/4 v8, 0x1

    .line 17
    const/4 v9, -0x1

    .line 18
    sparse-switch v0, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v0, "big_head_2"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    const/16 v9, 0xb

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_1
    const-string v0, "fat_face_thin_lip"

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_1
    const/16 v9, 0xa

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_2
    const-string v0, "rectangle_face_small_feature"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_2
    const/16 v9, 0x9

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_3
    const-string v0, "pear_face_small_eye_big_mouth"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_3

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_3
    move v9, v1

    .line 76
    goto/16 :goto_0

    .line 77
    .line 78
    :sswitch_4
    const-string v0, "bighead"

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_4

    .line 85
    .line 86
    goto/16 :goto_0

    .line 87
    .line 88
    :cond_4
    move v9, v2

    .line 89
    goto :goto_0

    .line 90
    :sswitch_5
    const-string v0, "round_face"

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_5

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    move v9, v3

    .line 100
    goto :goto_0

    .line 101
    :sswitch_6
    const-string v0, "tiny_face_big_eye"

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_6

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    move v9, v4

    .line 111
    goto :goto_0

    .line 112
    :sswitch_7
    const-string v0, "fat_face_small_chin"

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-nez p0, :cond_7

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    move v9, v5

    .line 122
    goto :goto_0

    .line 123
    :sswitch_8
    const-string v0, "awlface"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_8

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_8
    move v9, v6

    .line 133
    goto :goto_0

    .line 134
    :sswitch_9
    const-string v0, "small_face_big_eye"

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-nez p0, :cond_9

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_9
    move v9, v7

    .line 144
    goto :goto_0

    .line 145
    :sswitch_a
    const-string v0, "beauty"

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-nez p0, :cond_a

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_a
    move v9, v8

    .line 155
    goto :goto_0

    .line 156
    :sswitch_b
    const-string v0, "shortface"

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-nez p0, :cond_b

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_b
    const/4 v9, 0x0

    .line 166
    :goto_0
    packed-switch v9, :pswitch_data_0

    .line 167
    .line 168
    .line 169
    const/16 p0, 0x68

    .line 170
    .line 171
    return p0

    .line 172
    :pswitch_0
    const/16 p0, 0xd

    .line 173
    .line 174
    return p0

    .line 175
    :pswitch_1
    const/16 p0, 0xe

    .line 176
    .line 177
    return p0

    .line 178
    :pswitch_2
    return v2

    .line 179
    :pswitch_3
    return v1

    .line 180
    :pswitch_4
    return v5

    .line 181
    :pswitch_5
    const/16 p0, 0xc

    .line 182
    .line 183
    return p0

    .line 184
    :pswitch_6
    return v4

    .line 185
    :pswitch_7
    const/16 p0, 0xf

    .line 186
    .line 187
    return p0

    .line 188
    :pswitch_8
    return v6

    .line 189
    :pswitch_9
    return v3

    .line 190
    :pswitch_a
    return v8

    .line 191
    :pswitch_b
    return v7

    .line 192
    nop

    .line 193
    :sswitch_data_0
    .sparse-switch
        -0x78d94327 -> :sswitch_b
        -0x5307ef84 -> :sswitch_a
        -0x34900138 -> :sswitch_9
        -0x239119ad -> :sswitch_8
        -0x1e5dd982 -> :sswitch_7
        -0x14ea8291 -> :sswitch_6
        -0x8b95992 -> :sswitch_5
        -0x6d43520 -> :sswitch_4
        0x20708b59 -> :sswitch_3
        0x2147ee2c -> :sswitch_2
        0x5af9dce9 -> :sswitch_1
        0x786cc1b2 -> :sswitch_0
    .end sparse-switch

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
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
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
.method public getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->additionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBeautyFace()Lcom/momo/mcamera/mask/BeautyFace;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->beautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDistortionList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->distortionList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/MaskModel;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEffectList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/bean/EffectFilterItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->effectList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceFacialFeatureScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->faceFacialFeatureScale:F

    .line 2
    .line 3
    return p0
.end method

.method public getFaceScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->faceScale:F

    .line 2
    .line 3
    return p0
.end method

.method public getFacialLandmarksCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->facialLandmarksCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getFilterDisable()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->filterDisable:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFolderPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->folderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getLookUpFilters()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/LookUpModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->lookUpFilters:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskTransferSticker()Lcom/momo/mcamera/mask/Sticker;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/MaskModel;->masks:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->masks:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/momo/mcamera/mask/Mask;

    .line 19
    .line 20
    new-instance v0, Lcom/momo/mcamera/mask/Sticker;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "FACE_MASK_TYPE"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Mask;->getFolder()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/Sticker;->setImagePreName(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Mask;->getTriggerType()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/Sticker;->setTriggerType(I)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method

.method public getMasks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->masks:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->modelType:I

    .line 2
    .line 3
    return p0
.end method

.method public getMomentWrapType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->warpType:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    invoke-static {p0}, Lcom/momo/mcamera/mask/MaskModel;->momentMappingWarpType(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOrderedIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->orderedIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getPollGroupNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->pollGroupNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreviewPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->previewPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRealWrapType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->warpType:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    invoke-static {p0}, Lcom/momo/mcamera/mask/MaskModel;->mappingWarpType(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getSound()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->sound:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoundId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->soundId:I

    .line 2
    .line 3
    return p0
.end method

.method public getSoundPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->soundPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSoundPitchMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->soundPitchMode:I

    .line 2
    .line 3
    return p0
.end method

.method public getStickers()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->stickers:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerRegion()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->triggerRegion:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerTip()Lcom/momo/mcamera/mask/TriggerTip;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->triggerTip:Lcom/momo/mcamera/mask/TriggerTip;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggerType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->triggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTriggeringMicEffect()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MaskModel;->triggeringMicEffect:I

    .line 2
    .line 3
    return p0
.end method

.method public getWarpType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->warpType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWrapType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->warpType:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    invoke-static {p0}, Lcom/momo/mcamera/mask/MaskModel;->mappingWarpType(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getXengineEsPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->xengineEsPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getXengineSearchPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MaskModel;->xengineSearchPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAudioRecord()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/MaskModel;->audioRecord:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDecorationGiftPack()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/MaskModel;->decorationGiftPack:Z

    .line 2
    .line 3
    return p0
.end method

.method public isForbidClone()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/MaskModel;->forbidClone:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAdditionalInfo(Lcom/momo/mcamera/mask/AdditionalInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->additionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioRecord(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MaskModel;->audioRecord:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBeautyFace(Lcom/momo/mcamera/mask/BeautyFace;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->beautyFace:Lcom/momo/mcamera/mask/BeautyFace;

    .line 2
    .line 3
    return-void
.end method

.method public setDecorationGiftPack(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MaskModel;->decorationGiftPack:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDistortionList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->distortionList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/MaskModel;->duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setEffectList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/bean/EffectFilterItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->effectList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceFacialFeatureScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->faceFacialFeatureScale:F

    .line 2
    .line 3
    return-void
.end method

.method public setFaceScale(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->faceScale:F

    .line 2
    .line 3
    return-void
.end method

.method public setFacialLandmarksCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->facialLandmarksCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setFilterDisable(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->filterDisable:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setFolderPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->folderPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setForbidClone(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MaskModel;->forbidClone:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->frameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setLookUpFilters(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/LookUpModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->lookUpFilters:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setMasks(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Mask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->masks:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setModelType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->modelType:I

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOrderedIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->orderedIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setPollGroupNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->pollGroupNum:I

    .line 2
    .line 3
    return-void
.end method

.method public setPreviewPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->previewPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSound(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->sound:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSoundId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->soundId:I

    .line 2
    .line 3
    return-void
.end method

.method public setSoundPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->soundPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSoundPitchMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->soundPitchMode:I

    .line 2
    .line 3
    return-void
.end method

.method public setStickers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->stickers:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerRegion([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->triggerRegion:[I

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerTip(Lcom/momo/mcamera/mask/TriggerTip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->triggerTip:Lcom/momo/mcamera/mask/TriggerTip;

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->triggerType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTriggeringMicEffect(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/MaskModel;->triggeringMicEffect:I

    .line 2
    .line 3
    return-void
.end method

.method public setWrapType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->warpType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setXengineEsPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->xengineEsPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setXengineSearchPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/MaskModel;->xengineSearchPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
