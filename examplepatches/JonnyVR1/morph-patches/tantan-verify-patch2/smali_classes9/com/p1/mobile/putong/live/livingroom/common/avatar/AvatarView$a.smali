.class public Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView$a;->a:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView$a;->a:Z

    .line 6
    .line 7
    const-wide v4, 0x3feb333333333333L    # 0.85

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const v6, 0x3f0ccccd    # 0.55f

    .line 13
    .line 14
    .line 15
    const-wide v7, 0x3fe6666666666666L    # 0.7

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    const v9, 0x3ecccccd    # 0.4f

    .line 21
    .line 22
    .line 23
    const/high16 v10, 0x40400000    # 3.0f

    .line 24
    .line 25
    const-wide v11, 0x3fe199999999999aL    # 0.55

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    const/high16 v13, 0x40e00000    # 7.0f

    .line 31
    .line 32
    const-wide v14, 0x3fd999999999999aL    # 0.4

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    const-wide/high16 v16, 0x3fd0000000000000L    # 0.25

    .line 38
    .line 39
    const/high16 v18, 0x40000000    # 2.0f

    .line 40
    .line 41
    const/high16 v19, 0x3e800000    # 0.25f

    .line 42
    .line 43
    const/high16 v20, 0x40a00000    # 5.0f

    .line 44
    .line 45
    const/high16 v21, 0x3f800000    # 1.0f

    .line 46
    .line 47
    const v22, 0x3e19999a    # 0.15f

    .line 48
    .line 49
    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    const/16 p0, 0x0

    .line 53
    .line 54
    const v0, 0x3f333333    # 0.7f

    .line 55
    .line 56
    .line 57
    float-to-double v2, v1

    .line 58
    cmpg-double v16, v2, v16

    .line 59
    .line 60
    if-gtz v16, :cond_0

    .line 61
    .line 62
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    neg-int v0, v0

    .line 67
    int-to-float v0, v0

    .line 68
    div-float v1, v1, v19

    .line 69
    .line 70
    mul-float/2addr v0, v1

    .line 71
    return v0

    .line 72
    :cond_0
    cmpg-double v14, v2, v14

    .line 73
    .line 74
    if-gtz v14, :cond_1

    .line 75
    .line 76
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    neg-int v0, v0

    .line 81
    int-to-float v0, v0

    .line 82
    invoke-static {v13}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    int-to-float v2, v2

    .line 87
    sub-float v1, v1, v19

    .line 88
    .line 89
    div-float v1, v1, v22

    .line 90
    .line 91
    mul-float/2addr v2, v1

    .line 92
    add-float/2addr v0, v2

    .line 93
    return v0

    .line 94
    :cond_1
    cmpg-double v11, v2, v11

    .line 95
    .line 96
    if-gtz v11, :cond_2

    .line 97
    .line 98
    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    int-to-float v0, v0

    .line 103
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    int-to-float v2, v2

    .line 108
    sub-float/2addr v1, v9

    .line 109
    div-float v1, v1, v22

    .line 110
    .line 111
    mul-float/2addr v2, v1

    .line 112
    sub-float/2addr v0, v2

    .line 113
    return v0

    .line 114
    :cond_2
    cmpg-double v7, v2, v7

    .line 115
    .line 116
    if-gtz v7, :cond_3

    .line 117
    .line 118
    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    neg-int v0, v0

    .line 123
    int-to-float v0, v0

    .line 124
    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    int-to-float v2, v2

    .line 129
    sub-float/2addr v1, v6

    .line 130
    div-float v1, v1, v22

    .line 131
    .line 132
    mul-float/2addr v2, v1

    .line 133
    add-float/2addr v0, v2

    .line 134
    return v0

    .line 135
    :cond_3
    cmpg-double v2, v2, v4

    .line 136
    .line 137
    if-gtz v2, :cond_4

    .line 138
    .line 139
    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    int-to-float v2, v2

    .line 144
    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    neg-int v3, v3

    .line 149
    :goto_0
    int-to-float v3, v3

    .line 150
    sub-float v0, v1, v0

    .line 151
    .line 152
    div-float v0, v0, v22

    .line 153
    .line 154
    mul-float/2addr v3, v0

    .line 155
    add-float/2addr v2, v3

    .line 156
    return v2

    .line 157
    :cond_4
    return p0

    .line 158
    :cond_5
    const/16 p0, 0x0

    .line 159
    .line 160
    const v0, 0x3f333333    # 0.7f

    .line 161
    .line 162
    .line 163
    float-to-double v2, v1

    .line 164
    cmpg-double v16, v2, v16

    .line 165
    .line 166
    if-gtz v16, :cond_6

    .line 167
    .line 168
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    int-to-float v0, v0

    .line 173
    div-float v1, v1, v19

    .line 174
    .line 175
    mul-float/2addr v0, v1

    .line 176
    return v0

    .line 177
    :cond_6
    cmpg-double v14, v2, v14

    .line 178
    .line 179
    if-gtz v14, :cond_7

    .line 180
    .line 181
    invoke-static/range {v20 .. v20}, Ll/qa00;->d(F)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    int-to-float v0, v0

    .line 186
    invoke-static {v13}, Ll/qa00;->d(F)I

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    int-to-float v2, v2

    .line 191
    sub-float v1, v1, v19

    .line 192
    .line 193
    div-float v1, v1, v22

    .line 194
    .line 195
    mul-float/2addr v2, v1

    .line 196
    sub-float/2addr v0, v2

    .line 197
    return v0

    .line 198
    :cond_7
    cmpg-double v11, v2, v11

    .line 199
    .line 200
    if-gtz v11, :cond_8

    .line 201
    .line 202
    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    neg-int v0, v0

    .line 207
    int-to-float v0, v0

    .line 208
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    int-to-float v2, v2

    .line 213
    sub-float/2addr v1, v9

    .line 214
    div-float v1, v1, v22

    .line 215
    .line 216
    mul-float/2addr v2, v1

    .line 217
    add-float/2addr v0, v2

    .line 218
    return v0

    .line 219
    :cond_8
    cmpg-double v7, v2, v7

    .line 220
    .line 221
    if-gtz v7, :cond_9

    .line 222
    .line 223
    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    int-to-float v0, v0

    .line 228
    invoke-static/range {v18 .. v18}, Ll/qa00;->d(F)I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    int-to-float v2, v2

    .line 233
    sub-float/2addr v1, v6

    .line 234
    div-float v1, v1, v22

    .line 235
    .line 236
    mul-float/2addr v2, v1

    .line 237
    sub-float/2addr v0, v2

    .line 238
    return v0

    .line 239
    :cond_9
    cmpg-double v2, v2, v4

    .line 240
    .line 241
    if-gtz v2, :cond_a

    .line 242
    .line 243
    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    neg-int v2, v2

    .line 248
    int-to-float v2, v2

    .line 249
    invoke-static/range {v21 .. v21}, Ll/qa00;->d(F)I

    .line 250
    .line 251
    .line 252
    move-result v3

    .line 253
    goto :goto_0

    .line 254
    :cond_a
    return p0
.end method
