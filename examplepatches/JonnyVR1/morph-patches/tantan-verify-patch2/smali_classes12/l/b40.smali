.class public Ll/b40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ool;


# instance fields
.field private a:Ll/omw;

.field private b:Lcom/core/glcore/cv/MMCVBoxes;

.field private c:Lcom/momocv/express/ExpressInfo;

.field private d:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

.field private e:Ll/xtl;

.field private final f:Lcom/momocv/MMBox;

.field private final g:Lcom/momocv/express/SingleExpressInfo;

.field private final h:[Lcom/momocv/MMJoint;

.field private i:Lcom/momo/mcamera/mask/ActionInfo;

.field private final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private k:[I


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v3, p0, Ll/b40;->j:Ljava/util/Map;

    .line 25
    .line 26
    const/16 v3, 0xe

    .line 27
    .line 28
    new-array v4, v3, [I

    .line 29
    .line 30
    fill-array-data v4, :array_0

    .line 31
    .line 32
    .line 33
    iput-object v4, p0, Ll/b40;->k:[I

    .line 34
    .line 35
    new-instance v4, Lcom/momocv/MMBox;

    .line 36
    .line 37
    invoke-direct {v4}, Lcom/momocv/MMBox;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v4, p0, Ll/b40;->f:Lcom/momocv/MMBox;

    .line 41
    .line 42
    new-instance v4, Lcom/momocv/express/SingleExpressInfo;

    .line 43
    .line 44
    invoke-direct {v4}, Lcom/momocv/express/SingleExpressInfo;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v4, p0, Ll/b40;->g:Lcom/momocv/express/SingleExpressInfo;

    .line 48
    .line 49
    new-array v3, v3, [Lcom/momocv/MMJoint;

    .line 50
    .line 51
    iput-object v3, p0, Ll/b40;->h:[Lcom/momocv/MMJoint;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    :goto_0
    iget-object v4, p0, Ll/b40;->h:[Lcom/momocv/MMJoint;

    .line 55
    .line 56
    array-length v5, v4

    .line 57
    if-ge v3, v5, :cond_0

    .line 58
    .line 59
    new-instance v5, Lcom/momocv/MMJoint;

    .line 60
    .line 61
    invoke-direct {v5}, Lcom/momocv/MMJoint;-><init>()V

    .line 62
    .line 63
    .line 64
    aput-object v5, v4, v3

    .line 65
    .line 66
    add-int/lit8 v3, v3, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    iget-object v3, p0, Ll/b40;->j:Ljava/util/Map;

    .line 70
    .line 71
    const-string v4, "du"

    .line 72
    .line 73
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object v3, p0, Ll/b40;->j:Ljava/util/Map;

    .line 77
    .line 78
    const-string v4, "smile"

    .line 79
    .line 80
    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    iget-object v3, p0, Ll/b40;->j:Ljava/util/Map;

    .line 84
    .line 85
    const-string v4, "open_mouth"

    .line 86
    .line 87
    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Ll/b40;->j:Ljava/util/Map;

    .line 91
    .line 92
    const-string v4, "left_head"

    .line 93
    .line 94
    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Ll/b40;->j:Ljava/util/Map;

    .line 98
    .line 99
    const-string v3, "right_head"

    .line 100
    .line 101
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Ll/b40;->j:Ljava/util/Map;

    .line 105
    .line 106
    const-string v1, "bow_head"

    .line 107
    .line 108
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    nop

    .line 113
    :array_0
    .array-data 4
        0x3
        0x4
        0x5
        0x0
        0x1
        0x2
        0x9
        0xa
        0xb
        0x6
        0x7
        0x8
        0xc
        0xd
    .end array-data
.end method

.method private g()[Lcom/momocv/MMJoint;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b40;->d:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    if-gtz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    aget-object p0, v0, p0

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/b40;->h:[Lcom/momocv/MMJoint;

    .line 18
    .line 19
    return-object p0
.end method

.method private h()Lcom/momocv/express/SingleExpressInfo;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b40;->c:Lcom/momocv/express/ExpressInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/momocv/express/ExpressInfo;->express_infos_:[Lcom/momocv/express/SingleExpressInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    if-gtz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    aget-object p0, v0, p0

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/b40;->g:Lcom/momocv/express/SingleExpressInfo;

    .line 18
    .line 19
    return-object p0
.end method

.method private i()Lcom/momocv/MMBox;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b40;->b:Lcom/core/glcore/cv/MMCVBoxes;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/b40;->b:Lcom/core/glcore/cv/MMCVBoxes;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    array-length v0, v0

    .line 18
    if-gtz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/b40;->b:Lcom/core/glcore/cv/MMCVBoxes;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/core/glcore/cv/MMCVBoxes;->getDetectResult()[Lcom/momocv/MMBox;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v0, 0x0

    .line 28
    aget-object p0, p0, v0

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/b40;->f:Lcom/momocv/MMBox;

    .line 32
    .line 33
    return-object p0
.end method

.method private j(Ll/omw;I)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p1, Ll/omw;->a:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return p2

    .line 8
    :cond_0
    iget-object p0, p0, Ll/b40;->k:[I

    .line 9
    .line 10
    aget p0, p0, p2

    .line 11
    .line 12
    return p0
.end method

.method private k([Lcom/momocv/MMJoint;Ljava/util/List;)Z
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/momocv/MMJoint;",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/ActionInfo$BodyBean;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v2, v1

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    move v2, v0

    .line 15
    :goto_1
    if-nez v2, :cond_a

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    :cond_2
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_a

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getFirst()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-ltz v4, :cond_2

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getFirst()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    array-length v5, p1

    .line 44
    if-lt v4, v5, :cond_3

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getSecond()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-ltz v4, :cond_2

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getSecond()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    array-length v5, p1

    .line 58
    if-lt v4, v5, :cond_4

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_4
    iget-object v4, p0, Ll/b40;->a:Ll/omw;

    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getFirst()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    invoke-direct {p0, v4, v5}, Ll/b40;->j(Ll/omw;I)I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    aget-object v4, p1, v4

    .line 72
    .line 73
    iget v5, v4, Lcom/momocv/MMJoint;->score_:F

    .line 74
    .line 75
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getScore()F

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    cmpg-float v5, v5, v6

    .line 80
    .line 81
    if-gez v5, :cond_5

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_5
    iget-object v5, p0, Ll/b40;->a:Ll/omw;

    .line 85
    .line 86
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getSecond()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    invoke-direct {p0, v5, v6}, Ll/b40;->j(Ll/omw;I)I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    aget-object v5, p1, v5

    .line 95
    .line 96
    iget v6, v5, Lcom/momocv/MMJoint;->score_:F

    .line 97
    .line 98
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getScore()F

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    cmpg-float v6, v6, v7

    .line 103
    .line 104
    if-gez v6, :cond_6

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_6
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetX()Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    if-eqz v6, :cond_2

    .line 112
    .line 113
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetX()Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    const/4 v7, 0x2

    .line 122
    if-eq v6, v7, :cond_7

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_7
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetX()Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    check-cast v6, Ljava/lang/Float;

    .line 134
    .line 135
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetX()Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object v8

    .line 143
    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    check-cast v8, Ljava/lang/Float;

    .line 148
    .line 149
    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    .line 150
    .line 151
    .line 152
    move-result v8

    .line 153
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetY()Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object v9

    .line 157
    if-eqz v9, :cond_2

    .line 158
    .line 159
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetY()Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 164
    .line 165
    .line 166
    move-result v9

    .line 167
    if-eq v9, v7, :cond_8

    .line 168
    .line 169
    goto/16 :goto_2

    .line 170
    .line 171
    :cond_8
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetY()Ljava/util/List;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    check-cast v2, Ljava/lang/Float;

    .line 180
    .line 181
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->getOffsetY()Ljava/util/List;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Ljava/lang/Float;

    .line 194
    .line 195
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    iget-object v7, p0, Ll/b40;->a:Ll/omw;

    .line 200
    .line 201
    iget v9, v7, Ll/omw;->f:I

    .line 202
    .line 203
    iget v7, v7, Ll/omw;->e:I

    .line 204
    .line 205
    iget v10, v4, Lcom/momocv/MMPoint;->x_:I

    .line 206
    .line 207
    int-to-float v10, v10

    .line 208
    const/high16 v11, 0x3f800000    # 1.0f

    .line 209
    .line 210
    mul-float/2addr v10, v11

    .line 211
    int-to-float v9, v9

    .line 212
    div-float/2addr v10, v9

    .line 213
    iget v4, v4, Lcom/momocv/MMPoint;->y_:I

    .line 214
    .line 215
    int-to-float v4, v4

    .line 216
    mul-float/2addr v4, v11

    .line 217
    int-to-float v7, v7

    .line 218
    div-float/2addr v4, v7

    .line 219
    iget v12, v5, Lcom/momocv/MMPoint;->x_:I

    .line 220
    .line 221
    int-to-float v12, v12

    .line 222
    mul-float/2addr v12, v11

    .line 223
    div-float/2addr v12, v9

    .line 224
    iget v5, v5, Lcom/momocv/MMPoint;->y_:I

    .line 225
    .line 226
    int-to-float v5, v5

    .line 227
    mul-float/2addr v5, v11

    .line 228
    div-float/2addr v5, v7

    .line 229
    sub-float/2addr v10, v12

    .line 230
    cmpl-float v6, v10, v6

    .line 231
    .line 232
    if-ltz v6, :cond_9

    .line 233
    .line 234
    cmpg-float v6, v10, v8

    .line 235
    .line 236
    if-gtz v6, :cond_9

    .line 237
    .line 238
    sub-float/2addr v4, v5

    .line 239
    cmpl-float v2, v4, v2

    .line 240
    .line 241
    if-ltz v2, :cond_9

    .line 242
    .line 243
    cmpg-float v2, v4, v3

    .line 244
    .line 245
    if-gtz v2, :cond_9

    .line 246
    .line 247
    move v2, v0

    .line 248
    goto/16 :goto_2

    .line 249
    .line 250
    :cond_9
    move v2, v1

    .line 251
    goto/16 :goto_2

    .line 252
    .line 253
    :cond_a
    return v2
.end method

.method private l(Lcom/momocv/express/SingleExpressInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/b40;->j:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ljava/lang/Integer;

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iget v0, p1, Lcom/momocv/express/SingleExpressInfo;->mouth_:I

    .line 24
    .line 25
    if-ne p2, v0, :cond_0

    .line 26
    .line 27
    move v0, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v0, v1

    .line 30
    :cond_1
    :goto_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Ll/b40;->j:Ljava/util/Map;

    .line 37
    .line 38
    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/Integer;

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    iget p2, p1, Lcom/momocv/express/SingleExpressInfo;->head_:I

    .line 51
    .line 52
    if-ne p0, p2, :cond_2

    .line 53
    .line 54
    move p2, v2

    .line 55
    goto :goto_1

    .line 56
    :cond_2
    move p2, v1

    .line 57
    :cond_3
    :goto_1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_9

    .line 62
    .line 63
    const-string p3, "single_eye"

    .line 64
    .line 65
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    if-eqz p3, :cond_5

    .line 70
    .line 71
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 72
    .line 73
    iget p1, p1, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 74
    .line 75
    if-eq p0, p1, :cond_4

    .line 76
    .line 77
    :goto_2
    move p0, v2

    .line 78
    goto :goto_3

    .line 79
    :cond_4
    move p0, v1

    .line 80
    goto :goto_3

    .line 81
    :cond_5
    const-string p3, "close_eye"

    .line 82
    .line 83
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    if-eqz p3, :cond_6

    .line 88
    .line 89
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 90
    .line 91
    if-nez p0, :cond_4

    .line 92
    .line 93
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 94
    .line 95
    if-nez p0, :cond_4

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_6
    const-string p3, "open_eye"

    .line 99
    .line 100
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result p3

    .line 104
    if-eqz p3, :cond_7

    .line 105
    .line 106
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 107
    .line 108
    if-ne p0, v2, :cond_4

    .line 109
    .line 110
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 111
    .line 112
    if-ne p0, v2, :cond_4

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_7
    const-string p3, "left_open_right_close"

    .line 116
    .line 117
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    if-eqz p3, :cond_8

    .line 122
    .line 123
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 124
    .line 125
    if-nez p0, :cond_4

    .line 126
    .line 127
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 128
    .line 129
    if-ne p0, v2, :cond_4

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_8
    const-string p3, "left_close_right_open"

    .line 133
    .line 134
    invoke-static {p4, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result p3

    .line 138
    if-eqz p3, :cond_9

    .line 139
    .line 140
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 141
    .line 142
    if-ne p0, v2, :cond_4

    .line 143
    .line 144
    iget p0, p1, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 145
    .line 146
    if-nez p0, :cond_4

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_9
    :goto_3
    if-eqz v0, :cond_a

    .line 150
    .line 151
    if-eqz p2, :cond_a

    .line 152
    .line 153
    if-eqz p0, :cond_a

    .line 154
    .line 155
    return v2

    .line 156
    :cond_a
    return v1
.end method

.method private m(Lcom/momocv/MMBox;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method


# virtual methods
.method public a(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b40;->d:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 2
    .line 3
    return-void
.end method

.method public b(Lcom/momocv/express/ExpressInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b40;->c:Lcom/momocv/express/ExpressInfo;

    .line 2
    .line 3
    return-void
.end method

.method public c(Lcom/momo/mcamera/mask/ActionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/xtl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b40;->e:Ll/xtl;

    .line 2
    .line 3
    return-void
.end method

.method public e()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/b40;->e:Ll/xtl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0}, Ll/b40;->i()Lcom/momocv/MMBox;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/ActionInfo;->getHand()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {p0, v0, v1}, Ll/b40;->m(Lcom/momocv/MMBox;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-direct {p0}, Ll/b40;->h()Lcom/momocv/express/SingleExpressInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/ActionInfo;->getMouth()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v3, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo;->getHead()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    iget-object v4, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 41
    .line 42
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/ActionInfo;->getEye()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-direct {p0, v1, v2, v3, v4}, Ll/b40;->l(Lcom/momocv/express/SingleExpressInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-direct {p0}, Ll/b40;->g()[Lcom/momocv/MMJoint;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Ll/b40;->i:Lcom/momo/mcamera/mask/ActionInfo;

    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/ActionInfo;->getBody()Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-direct {p0, v2, v3}, Ll/b40;->k([Lcom/momocv/MMJoint;Ljava/util/List;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    if-eqz v2, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Ll/b40;->e:Ll/xtl;

    .line 71
    .line 72
    invoke-interface {p0}, Ll/xtl;->a()V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return-void
.end method

.method public f(Lcom/core/glcore/cv/MMCVBoxes;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b40;->b:Lcom/core/glcore/cv/MMCVBoxes;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b40;->a:Ll/omw;

    .line 2
    .line 3
    return-void
.end method
