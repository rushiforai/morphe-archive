.class public Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator;,
        Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;
    }
.end annotation


# static fields
.field static final COMMON_RESOLUTIONS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ss/bytertc/base/media/Size;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "CameraEnumerationAndroid"


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/base/media/Size;

    .line 4
    .line 5
    const/16 v2, 0x78

    .line 6
    .line 7
    const/16 v3, 0xa0

    .line 8
    .line 9
    invoke-direct {v1, v3, v2}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Lcom/ss/bytertc/base/media/Size;

    .line 13
    .line 14
    const/16 v4, 0xf0

    .line 15
    .line 16
    invoke-direct {v2, v4, v3}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 17
    .line 18
    .line 19
    new-instance v3, Lcom/ss/bytertc/base/media/Size;

    .line 20
    .line 21
    const/16 v5, 0x140

    .line 22
    .line 23
    invoke-direct {v3, v5, v4}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 24
    .line 25
    .line 26
    new-instance v6, Lcom/ss/bytertc/base/media/Size;

    .line 27
    .line 28
    const/16 v7, 0x190

    .line 29
    .line 30
    invoke-direct {v6, v7, v4}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 31
    .line 32
    .line 33
    new-instance v4, Lcom/ss/bytertc/base/media/Size;

    .line 34
    .line 35
    const/16 v7, 0x1e0

    .line 36
    .line 37
    invoke-direct {v4, v7, v5}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 38
    .line 39
    .line 40
    move-object v5, v4

    .line 41
    move-object v4, v6

    .line 42
    new-instance v6, Lcom/ss/bytertc/base/media/Size;

    .line 43
    .line 44
    const/16 v8, 0x168

    .line 45
    .line 46
    const/16 v9, 0x280

    .line 47
    .line 48
    invoke-direct {v6, v9, v8}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 49
    .line 50
    .line 51
    new-instance v8, Lcom/ss/bytertc/base/media/Size;

    .line 52
    .line 53
    invoke-direct {v8, v9, v7}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 54
    .line 55
    .line 56
    move-object v10, v8

    .line 57
    new-instance v8, Lcom/ss/bytertc/base/media/Size;

    .line 58
    .line 59
    const/16 v11, 0x300

    .line 60
    .line 61
    invoke-direct {v8, v11, v7}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 62
    .line 63
    .line 64
    new-instance v11, Lcom/ss/bytertc/base/media/Size;

    .line 65
    .line 66
    const/16 v12, 0x356

    .line 67
    .line 68
    invoke-direct {v11, v12, v7}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 69
    .line 70
    .line 71
    move-object v7, v10

    .line 72
    new-instance v10, Lcom/ss/bytertc/base/media/Size;

    .line 73
    .line 74
    const/16 v12, 0x320

    .line 75
    .line 76
    const/16 v13, 0x258

    .line 77
    .line 78
    invoke-direct {v10, v12, v13}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 79
    .line 80
    .line 81
    move-object v12, v11

    .line 82
    new-instance v11, Lcom/ss/bytertc/base/media/Size;

    .line 83
    .line 84
    const/16 v14, 0x21c

    .line 85
    .line 86
    const/16 v15, 0x3c0

    .line 87
    .line 88
    invoke-direct {v11, v15, v14}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 89
    .line 90
    .line 91
    move-object v14, v12

    .line 92
    new-instance v12, Lcom/ss/bytertc/base/media/Size;

    .line 93
    .line 94
    invoke-direct {v12, v15, v9}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 95
    .line 96
    .line 97
    new-instance v9, Lcom/ss/bytertc/base/media/Size;

    .line 98
    .line 99
    const/16 v15, 0x240

    .line 100
    .line 101
    const/16 v13, 0x400

    .line 102
    .line 103
    invoke-direct {v9, v13, v15}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 104
    .line 105
    .line 106
    move-object v15, v9

    .line 107
    move-object v9, v14

    .line 108
    new-instance v14, Lcom/ss/bytertc/base/media/Size;

    .line 109
    .line 110
    move-object/from16 v17, v1

    .line 111
    .line 112
    const/16 v1, 0x258

    .line 113
    .line 114
    invoke-direct {v14, v13, v1}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 115
    .line 116
    .line 117
    move-object v1, v15

    .line 118
    new-instance v15, Lcom/ss/bytertc/base/media/Size;

    .line 119
    .line 120
    const/16 v13, 0x2d0

    .line 121
    .line 122
    move-object/from16 v18, v1

    .line 123
    .line 124
    const/16 v1, 0x500

    .line 125
    .line 126
    invoke-direct {v15, v1, v13}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 127
    .line 128
    .line 129
    new-instance v13, Lcom/ss/bytertc/base/media/Size;

    .line 130
    .line 131
    move-object/from16 v19, v2

    .line 132
    .line 133
    const/16 v2, 0x400

    .line 134
    .line 135
    invoke-direct {v13, v1, v2}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 136
    .line 137
    .line 138
    new-instance v1, Lcom/ss/bytertc/base/media/Size;

    .line 139
    .line 140
    const/16 v2, 0x438

    .line 141
    .line 142
    move-object/from16 v16, v3

    .line 143
    .line 144
    const/16 v3, 0x780

    .line 145
    .line 146
    invoke-direct {v1, v3, v2}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 147
    .line 148
    .line 149
    new-instance v2, Lcom/ss/bytertc/base/media/Size;

    .line 150
    .line 151
    move-object/from16 v20, v1

    .line 152
    .line 153
    const/16 v1, 0x5a0

    .line 154
    .line 155
    invoke-direct {v2, v3, v1}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 156
    .line 157
    .line 158
    new-instance v3, Lcom/ss/bytertc/base/media/Size;

    .line 159
    .line 160
    move-object/from16 v21, v2

    .line 161
    .line 162
    const/16 v2, 0xa00

    .line 163
    .line 164
    invoke-direct {v3, v2, v1}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 165
    .line 166
    .line 167
    new-instance v1, Lcom/ss/bytertc/base/media/Size;

    .line 168
    .line 169
    const/16 v2, 0xf00

    .line 170
    .line 171
    move-object/from16 v22, v3

    .line 172
    .line 173
    const/16 v3, 0x870

    .line 174
    .line 175
    invoke-direct {v1, v2, v3}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 176
    .line 177
    .line 178
    move-object/from16 v2, v20

    .line 179
    .line 180
    move-object/from16 v20, v1

    .line 181
    .line 182
    move-object/from16 v1, v17

    .line 183
    .line 184
    move-object/from16 v17, v2

    .line 185
    .line 186
    move-object/from16 v3, v16

    .line 187
    .line 188
    move-object/from16 v2, v19

    .line 189
    .line 190
    move-object/from16 v19, v22

    .line 191
    .line 192
    move-object/from16 v16, v13

    .line 193
    .line 194
    move-object/from16 v13, v18

    .line 195
    .line 196
    move-object/from16 v18, v21

    .line 197
    .line 198
    filled-new-array/range {v1 .. v20}, [Lcom/ss/bytertc/base/media/Size;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 207
    .line 208
    .line 209
    sput-object v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->COMMON_RESOLUTIONS:Ljava/util/ArrayList;

    .line 210
    .line 211
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getClosestSupportedFramerateRange(Ljava/util/List;I)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;",
            ">;I)",
            "Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 11
    .line 12
    return-object p0
.end method

.method public static getClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/base/media/Size;",
            ">;II)",
            "Lcom/ss/bytertc/base/media/Size;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/ss/bytertc/base/media/Size;

    .line 11
    .line 12
    return-object p0
.end method

.method public static getUpClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/base/media/Size;",
            ">;II)",
            "Lcom/ss/bytertc/base/media/Size;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/Size;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1}, Lcom/ss/bytertc/base/media/Size;-><init>(II)V

    .line 5
    .line 6
    .line 7
    const v2, 0x7fffffff

    .line 8
    .line 9
    .line 10
    move v3, v2

    .line 11
    move v2, v1

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    if-ge v1, v4, :cond_2

    .line 17
    .line 18
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    check-cast v4, Lcom/ss/bytertc/base/media/Size;

    .line 23
    .line 24
    iget v5, v4, Lcom/ss/bytertc/base/media/Size;->width:I

    .line 25
    .line 26
    if-ge v5, p1, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    sub-int v5, p1, v5

    .line 30
    .line 31
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    iget v6, v4, Lcom/ss/bytertc/base/media/Size;->height:I

    .line 36
    .line 37
    sub-int v6, p2, v6

    .line 38
    .line 39
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    add-int/2addr v5, v6

    .line 44
    if-gt v5, v3, :cond_1

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    move v2, v0

    .line 48
    move-object v0, v4

    .line 49
    move v3, v5

    .line 50
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    if-nez v2, :cond_3

    .line 54
    .line 55
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_3
    return-object v0
.end method

.method public static reportCameraResolution(Lcom/ss/bytertc/base/media/camera/Histogram;Lcom/ss/bytertc/base/media/Size;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->COMMON_RESOLUTIONS:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/camera/Histogram;->addSample(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
