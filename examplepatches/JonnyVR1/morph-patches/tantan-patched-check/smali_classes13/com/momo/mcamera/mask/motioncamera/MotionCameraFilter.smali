.class public Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;
.super Ll/i4;
.source "SourceFile"

# interfaces
.implements Ll/suf;
.implements Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;


# instance fields
.field private adapter:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

.field private texData0:[F

.field private texData1:[F

.field private texData2:[F

.field private texData3:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData0:[F

    .line 9
    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData1:[F

    .line 13
    .line 14
    new-array v1, v0, [F

    .line 15
    .line 16
    iput-object v1, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData2:[F

    .line 17
    .line 18
    new-array v0, v0, [F

    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData3:[F

    .line 21
    .line 22
    new-instance v0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;-><init>(Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter$OnCropRegionChangedListener;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->adapter:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 28
    .line 29
    return-void
.end method

.method private updateTextureVertices(FFFF)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData0:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aput p2, v0, v2

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    aput p3, v0, v3

    .line 11
    .line 12
    const/4 v4, 0x3

    .line 13
    aput p2, v0, v4

    .line 14
    .line 15
    const/4 v5, 0x4

    .line 16
    aput p1, v0, v5

    .line 17
    .line 18
    const/4 v6, 0x5

    .line 19
    aput p4, v0, v6

    .line 20
    .line 21
    const/4 v7, 0x6

    .line 22
    aput p3, v0, v7

    .line 23
    .line 24
    const/4 v8, 0x7

    .line 25
    aput p4, v0, v8

    .line 26
    .line 27
    iget-object v9, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    aget-object v10, v9, v1

    .line 30
    .line 31
    if-nez v10, :cond_0

    .line 32
    .line 33
    array-length v0, v0

    .line 34
    mul-int/2addr v0, v5

    .line 35
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    aput-object v0, v9, v1

    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    aget-object v0, v0, v1

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 61
    .line 62
    aget-object v0, v0, v1

    .line 63
    .line 64
    iget-object v9, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData0:[F

    .line 65
    .line 66
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData1:[F

    .line 74
    .line 75
    aput p1, v0, v1

    .line 76
    .line 77
    aput p4, v0, v2

    .line 78
    .line 79
    aput p1, v0, v3

    .line 80
    .line 81
    aput p2, v0, v4

    .line 82
    .line 83
    aput p3, v0, v5

    .line 84
    .line 85
    aput p4, v0, v6

    .line 86
    .line 87
    aput p3, v0, v7

    .line 88
    .line 89
    aput p2, v0, v8

    .line 90
    .line 91
    iget-object v9, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    aget-object v10, v9, v2

    .line 94
    .line 95
    if-nez v10, :cond_1

    .line 96
    .line 97
    array-length v0, v0

    .line 98
    mul-int/2addr v0, v5

    .line 99
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    aput-object v0, v9, v2

    .line 116
    .line 117
    :cond_1
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 118
    .line 119
    aget-object v0, v0, v2

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 125
    .line 126
    aget-object v0, v0, v2

    .line 127
    .line 128
    iget-object v9, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData1:[F

    .line 129
    .line 130
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData2:[F

    .line 138
    .line 139
    aput p3, v0, v1

    .line 140
    .line 141
    aput p4, v0, v2

    .line 142
    .line 143
    aput p1, v0, v3

    .line 144
    .line 145
    aput p4, v0, v4

    .line 146
    .line 147
    aput p3, v0, v5

    .line 148
    .line 149
    aput p2, v0, v6

    .line 150
    .line 151
    aput p1, v0, v7

    .line 152
    .line 153
    aput p2, v0, v8

    .line 154
    .line 155
    iget-object v9, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 156
    .line 157
    aget-object v10, v9, v3

    .line 158
    .line 159
    if-nez v10, :cond_2

    .line 160
    .line 161
    array-length v0, v0

    .line 162
    mul-int/2addr v0, v5

    .line 163
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 168
    .line 169
    .line 170
    move-result-object v10

    .line 171
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    aput-object v0, v9, v3

    .line 180
    .line 181
    :cond_2
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 182
    .line 183
    aget-object v0, v0, v3

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 189
    .line 190
    aget-object v0, v0, v3

    .line 191
    .line 192
    iget-object v9, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData2:[F

    .line 193
    .line 194
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData3:[F

    .line 202
    .line 203
    aput p3, v0, v1

    .line 204
    .line 205
    aput p2, v0, v2

    .line 206
    .line 207
    aput p3, v0, v3

    .line 208
    .line 209
    aput p4, v0, v4

    .line 210
    .line 211
    aput p1, v0, v5

    .line 212
    .line 213
    aput p2, v0, v6

    .line 214
    .line 215
    aput p1, v0, v7

    .line 216
    .line 217
    aput p4, v0, v8

    .line 218
    .line 219
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 220
    .line 221
    aget-object p2, p1, v4

    .line 222
    .line 223
    if-nez p2, :cond_3

    .line 224
    .line 225
    array-length p2, v0

    .line 226
    mul-int/2addr p2, v5

    .line 227
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 232
    .line 233
    .line 234
    move-result-object p3

    .line 235
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    aput-object p2, p1, v4

    .line 244
    .line 245
    :cond_3
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 246
    .line 247
    aget-object p1, p1, v4

    .line 248
    .line 249
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 253
    .line 254
    aget-object p1, p1, v4

    .line 255
    .line 256
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->texData3:[F

    .line 257
    .line 258
    invoke-virtual {p1, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 263
    .line 264
    .line 265
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->adapter:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->release()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCropRegionChanged(FFFF)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float p4, v0, p4

    .line 4
    .line 5
    sub-float/2addr v0, p2

    .line 6
    invoke-direct {p0, p1, p4, p3, v0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->updateTextureVertices(FFFF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->adapter:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;->adapter:Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;

    .line 2
    .line 3
    iget v1, p0, Ll/wej;->width:I

    .line 4
    .line 5
    iget p0, p0, Ll/wej;->height:I

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1, p0}, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilterAdapter;->updateMMCVInfo(Ll/omw;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
