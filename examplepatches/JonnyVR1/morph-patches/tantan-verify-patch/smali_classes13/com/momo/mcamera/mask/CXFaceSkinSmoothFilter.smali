.class public Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;
.super Ll/sx3;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;
    }
.end annotation


# static fields
.field public static final STEP_FIRST:I = 0x1

.field public static final STEP_SECOND:I = 0x2

.field private static final TYPE_FULL_SCREEN:I = 0x0

.field private static final TYPE_HD:I = 0x2

.field private static final TYPE_NORMAL:I = 0x1

.field private static final UNIFORM_CX_SKIN_SMOOTHING_CONSIDERS_SKIN_RELATION:Ljava/lang/String; = "cxSkinSmoothingConsidersSkinRelation"

.field private static final UNIFORM_CX_SKIN_SMOOTHING_USES_MASK:Ljava/lang/String; = "cxSkinSmoothingUsesMask"

.field private static final UNIFORM_EPSLONE:Ljava/lang/String; = "epslone"

.field private static final UNIFORM_LAND:Ljava/lang/String; = "land"

.field private static final UNIFORM_SAMPLE_STEP:Ljava/lang/String; = "sampleStep"

.field private static final UNIFORM_WINSIZE:Ljava/lang/String; = "winSize"


# instance fields
.field private isDiscard:Z

.field private land:I

.field private mCxSkinSmoothingConsidersSkinRelation:I

.field private mCxSkinSmoothingConsidersSkinRelationHandle:I

.field private mCxSkinSmoothingUsesMask:I

.field private mCxSkinSmoothingUsesMaskHandle:I

.field private mDefaultSkinThreshold:[I

.field private mDefaultSkinThresholdHandle:I

.field private mDermabrasion:F

.field private mEpslone:[F

.field private mEpsloneHandle:I

.field private mEyesAreaAmount:F

.field private mFaceWidth:F

.field private mHighSkinThreshold:[I

.field private mLandHandle:I

.field private mLowSkinThreshold:[I

.field private mMMCVWidth:F

.field private mMmcvInfo:Ll/omw;

.field private mSampleStep:[F

.field private mSampleStepHandle:I

.field private mType:I

.field private mWinSize:I

.field private mWinSizeHandle:I

.field private maskPath:Ljava/lang/String;

.field private maskTexCoordHandle:I

.field private maskTexture:I

.field private maskTextureHandle:I

.field private skinBuffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;",
            ">;"
        }
    .end annotation
.end field

.field public skinStep:I

.field private step:F

.field private textureBeforeId:I

.field private textureId:I

.field private textureInId:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/sx3;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSize:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    filled-new-array {v1, v1, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iput-object v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 13
    .line 14
    const/16 v2, 0xff

    .line 15
    .line 16
    filled-new-array {v2, v2, v2}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 21
    .line 22
    const/16 v2, 0x78

    .line 23
    .line 24
    const/16 v3, 0x6e

    .line 25
    .line 26
    const/16 v4, 0xa0

    .line 27
    .line 28
    filled-new-array {v4, v2, v3}, [I

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDefaultSkinThreshold:[I

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 36
    .line 37
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMask:I

    .line 38
    .line 39
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingConsidersSkinRelation:I

    .line 40
    .line 41
    const/4 v3, 0x3

    .line 42
    new-array v4, v3, [F

    .line 43
    .line 44
    iput-object v4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpslone:[F

    .line 45
    .line 46
    const/4 v4, 0x2

    .line 47
    new-array v4, v4, [F

    .line 48
    .line 49
    iput-object v4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mSampleStep:[F

    .line 50
    .line 51
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->step:F

    .line 52
    .line 53
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mFaceWidth:F

    .line 54
    .line 55
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexture:I

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    iput-object v4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskPath:Ljava/lang/String;

    .line 59
    .line 60
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTextureHandle:I

    .line 61
    .line 62
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexCoordHandle:I

    .line 63
    .line 64
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDefaultSkinThresholdHandle:I

    .line 65
    .line 66
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpsloneHandle:I

    .line 67
    .line 68
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMaskHandle:I

    .line 69
    .line 70
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingConsidersSkinRelationHandle:I

    .line 71
    .line 72
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mSampleStepHandle:I

    .line 73
    .line 74
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mLandHandle:I

    .line 75
    .line 76
    iput v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSizeHandle:I

    .line 77
    .line 78
    new-instance v4, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 81
    .line 82
    .line 83
    iput-object v4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinBuffers:Ljava/util/List;

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    iput v3, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mType:I

    .line 87
    .line 88
    iput v3, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinStep:I

    .line 89
    .line 90
    iget v3, p0, Ll/sx3;->currentPass:I

    .line 91
    .line 92
    iput v3, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->land:I

    .line 93
    .line 94
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDermabrasion:F

    .line 95
    .line 96
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEyesAreaAmount:F

    .line 97
    .line 98
    const/4 v2, -0x1

    .line 99
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureId:I

    .line 100
    .line 101
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureInId:I

    .line 102
    .line 103
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureBeforeId:I

    .line 104
    .line 105
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->isDiscard:Z

    .line 106
    .line 107
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->init(I)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method private CXSkinSmoothingEpsloneForAmount(F)F
    .locals 0

    const p0, 0x3ba3d70a    # 0.005f

    mul-float/2addr p0, p1

    mul-float/2addr p0, p1

    return p0
.end method

.method private CXSkinSmoothingEpsloneForMaskAmount(F)F
    .locals 0

    const p0, 0x3c23d70a    # 0.01f

    mul-float/2addr p0, p1

    mul-float/2addr p0, p1

    return p0
.end method

.method private drawFace([F[F[FLcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)V
    .locals 8

    .line 1
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$000(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    array-length v0, p1

    .line 9
    mul-int/2addr v0, v1

    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p4, v0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$002(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$000(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$100(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$000(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {p4, v0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$102(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$100(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$100(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    .line 59
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$100(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 67
    .line 68
    const/4 v6, 0x0

    .line 69
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$100(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    const/4 v3, 0x2

    .line 74
    const/16 v4, 0x1406

    .line 75
    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 78
    .line 79
    .line 80
    iget p1, p0, Ll/wej;->positionHandle:I

    .line 81
    .line 82
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 83
    .line 84
    .line 85
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$200(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    if-nez p1, :cond_2

    .line 90
    .line 91
    array-length p1, p2

    .line 92
    mul-int/2addr p1, v1

    .line 93
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p4, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$202(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    .line 100
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$200(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    :cond_2
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$300(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    if-nez p1, :cond_3

    .line 116
    .line 117
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$200(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p4, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$302(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$300(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 133
    .line 134
    .line 135
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$300(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 140
    .line 141
    .line 142
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$300(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 147
    .line 148
    .line 149
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 150
    .line 151
    const/4 v6, 0x0

    .line 152
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$300(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    const/4 v3, 0x2

    .line 157
    const/16 v4, 0x1406

    .line 158
    .line 159
    const/4 v5, 0x0

    .line 160
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 161
    .line 162
    .line 163
    iget p1, p0, Ll/wej;->texCoordHandle:I

    .line 164
    .line 165
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 166
    .line 167
    .line 168
    iget p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMask:I

    .line 169
    .line 170
    if-lez p1, :cond_6

    .line 171
    .line 172
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$400(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    if-nez p1, :cond_4

    .line 177
    .line 178
    array-length p1, p2

    .line 179
    mul-int/2addr p1, v1

    .line 180
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-static {p4, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$402(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 185
    .line 186
    .line 187
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$400(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 196
    .line 197
    .line 198
    :cond_4
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$500(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    if-nez p1, :cond_5

    .line 203
    .line 204
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$400(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/ByteBuffer;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-static {p4, p1}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$502(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;

    .line 213
    .line 214
    .line 215
    :cond_5
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$500(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 220
    .line 221
    .line 222
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$500(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p1, p3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 227
    .line 228
    .line 229
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$500(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 234
    .line 235
    .line 236
    iget v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexCoordHandle:I

    .line 237
    .line 238
    const/4 v6, 0x0

    .line 239
    invoke-static {p4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;->access$500(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)Ljava/nio/FloatBuffer;

    .line 240
    .line 241
    .line 242
    move-result-object v7

    .line 243
    const/4 v3, 0x2

    .line 244
    const/16 v4, 0x1406

    .line 245
    .line 246
    const/4 v5, 0x0

    .line 247
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 248
    .line 249
    .line 250
    iget p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexCoordHandle:I

    .line 251
    .line 252
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 253
    .line 254
    .line 255
    :cond_6
    array-length p1, p2

    .line 256
    div-int/lit8 p1, p1, 0x2

    .line 257
    .line 258
    const/4 p2, 0x0

    .line 259
    invoke-static {v1, p2, p1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 260
    .line 261
    .line 262
    invoke-direct {p0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->faceDisableDrawArray()V

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method private faceDisableDrawArray()V
    .locals 1

    .line 1
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 7
    .line 8
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexCoordHandle:I

    .line 12
    .line 13
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0xde1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private facePassShaderValues()V
    .locals 8

    .line 1
    const v0, 0x84c0

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Ll/wej;->texture_in:I

    .line 8
    .line 9
    const/16 v1, 0xde1

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMask:I

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    const v0, 0x84c1

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 29
    .line 30
    .line 31
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexture:I

    .line 32
    .line 33
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 34
    .line 35
    .line 36
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTextureHandle:I

    .line 37
    .line 38
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget v0, p0, Ll/sx3;->currentPass:I

    .line 42
    .line 43
    sub-int/2addr v0, v3

    .line 44
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->land:I

    .line 45
    .line 46
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mLandHandle:I

    .line 47
    .line 48
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSizeHandle:I

    .line 52
    .line 53
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSize:I

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 56
    .line 57
    .line 58
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDefaultSkinThresholdHandle:I

    .line 59
    .line 60
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDefaultSkinThreshold:[I

    .line 61
    .line 62
    aget v4, v1, v2

    .line 63
    .line 64
    int-to-float v4, v4

    .line 65
    const/high16 v5, 0x437f0000    # 255.0f

    .line 66
    .line 67
    div-float/2addr v4, v5

    .line 68
    aget v6, v1, v3

    .line 69
    .line 70
    int-to-float v6, v6

    .line 71
    div-float/2addr v6, v5

    .line 72
    const/4 v7, 0x2

    .line 73
    aget v1, v1, v7

    .line 74
    .line 75
    int-to-float v1, v1

    .line 76
    div-float/2addr v1, v5

    .line 77
    invoke-static {v0, v4, v6, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 78
    .line 79
    .line 80
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMaskHandle:I

    .line 81
    .line 82
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMask:I

    .line 83
    .line 84
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 85
    .line 86
    .line 87
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingConsidersSkinRelationHandle:I

    .line 88
    .line 89
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingConsidersSkinRelation:I

    .line 90
    .line 91
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 92
    .line 93
    .line 94
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpsloneHandle:I

    .line 95
    .line 96
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpslone:[F

    .line 97
    .line 98
    aget v4, v1, v2

    .line 99
    .line 100
    aget v5, v1, v3

    .line 101
    .line 102
    aget v1, v1, v7

    .line 103
    .line 104
    invoke-static {v0, v4, v5, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 105
    .line 106
    .line 107
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mSampleStepHandle:I

    .line 108
    .line 109
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mSampleStep:[F

    .line 110
    .line 111
    aget v1, p0, v2

    .line 112
    .line 113
    aget p0, p0, v3

    .line 114
    .line 115
    invoke-static {v0, v1, p0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private getNasolabialFoldAreaAmount(F)F
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/high16 v0, 0x3f000000    # 0.5f

    .line 3
    .line 4
    sub-float/2addr p1, v0

    .line 5
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/high16 p1, 0x40000000    # 2.0f

    .line 14
    .line 15
    mul-float/2addr p0, p1

    .line 16
    return p0
.end method

.method private init(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSize:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    aput v0, p1, v0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    aput v0, p1, v1

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aput v0, p1, v2

    .line 13
    .line 14
    iget-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 15
    .line 16
    const/16 v3, 0xff

    .line 17
    .line 18
    aput v3, p1, v0

    .line 19
    .line 20
    aput v3, p1, v1

    .line 21
    .line 22
    aput v3, p1, v2

    .line 23
    .line 24
    :goto_0
    const/4 p1, 0x3

    .line 25
    if-ge v0, p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinBuffers:Ljava/util/List;

    .line 28
    .line 29
    new-instance v1, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;-><init>(Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method private landMark104ToPoint([FFF)[F
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    new-array p0, p0, [F

    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    div-int/lit8 v2, v0, 0x2

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget v3, p1, v1

    .line 11
    .line 12
    div-float/2addr v3, p2

    .line 13
    aput v3, p0, v1

    .line 14
    .line 15
    add-int/2addr v2, v1

    .line 16
    aget v3, p1, v2

    .line 17
    .line 18
    div-float/2addr v3, p3

    .line 19
    aput v3, p0, v2

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-object p0
.end method

.method private setParamters(IIIFFF)V
    .locals 3

    .line 1
    const/high16 v0, 0x40400000    # 3.0f

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    if-eq p1, v2, :cond_1

    .line 8
    .line 9
    if-eq p1, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 p1, 0xc

    .line 13
    .line 14
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSize:I

    .line 15
    .line 16
    const p1, 0x3fd9999a    # 1.7f

    .line 17
    .line 18
    .line 19
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->step:F

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/16 p1, 0xa

    .line 23
    .line 24
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSize:I

    .line 25
    .line 26
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->step:F

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/4 p1, 0x4

    .line 30
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSize:I

    .line 31
    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->step:F

    .line 33
    .line 34
    :goto_0
    iput p2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingConsidersSkinRelation:I

    .line 35
    .line 36
    iput p3, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMask:I

    .line 37
    .line 38
    iput p4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mFaceWidth:F

    .line 39
    .line 40
    const/high16 p1, 0x43b40000    # 360.0f

    .line 41
    .line 42
    div-float/2addr p4, p1

    .line 43
    iget p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->step:F

    .line 44
    .line 45
    iget p2, p0, Ll/wej;->width:I

    .line 46
    .line 47
    int-to-float p2, p2

    .line 48
    div-float p2, p1, p2

    .line 49
    .line 50
    mul-float/2addr p2, p4

    .line 51
    iget v0, p0, Ll/wej;->height:I

    .line 52
    .line 53
    int-to-float v0, v0

    .line 54
    div-float/2addr p1, v0

    .line 55
    mul-float/2addr p1, p4

    .line 56
    iget-object p4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mSampleStep:[F

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    aput p2, p4, v0

    .line 60
    .line 61
    aput p1, p4, v2

    .line 62
    .line 63
    if-lez p3, :cond_3

    .line 64
    .line 65
    iget-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpslone:[F

    .line 66
    .line 67
    invoke-direct {p0, p6}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->CXSkinSmoothingEpsloneForMaskAmount(F)F

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    aput p2, p1, v0

    .line 72
    .line 73
    iget-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpslone:[F

    .line 74
    .line 75
    invoke-direct {p0, p5}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->getNasolabialFoldAreaAmount(F)F

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    invoke-direct {p0, p2}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->CXSkinSmoothingEpsloneForMaskAmount(F)F

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    aput p2, p1, v2

    .line 84
    .line 85
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpslone:[F

    .line 86
    .line 87
    const/4 p1, 0x0

    .line 88
    aput p1, p0, v1

    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    invoke-direct {p0, p5}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->CXSkinSmoothingEpsloneForAmount(F)F

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpslone:[F

    .line 96
    .line 97
    aput p1, p0, v0

    .line 98
    .line 99
    aput p1, p0, v2

    .line 100
    .line 101
    aput p1, p0, v1

    .line 102
    .line 103
    return-void
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->bindShaderAttributes()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    const-string v1, "inputTextureCoordinate1"

    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/sx3;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexture:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexture:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public drawSub()V
    .locals 12

    .line 1
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->isDiscard:Z

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_4

    .line 6
    .line 7
    :cond_0
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinStep:I

    .line 8
    .line 9
    const/high16 v2, 0x40000000    # 2.0f

    .line 10
    .line 11
    const/4 v7, 0x2

    .line 12
    const/4 v8, 0x0

    .line 13
    const/4 v9, 0x1

    .line 14
    if-eq v1, v9, :cond_3

    .line 15
    .line 16
    if-eq v1, v7, :cond_1

    .line 17
    .line 18
    goto/16 :goto_4

    .line 19
    .line 20
    :cond_1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    div-float v4, v1, v2

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v6, 0x0

    .line 29
    const/4 v1, 0x0

    .line 30
    const/4 v2, 0x1

    .line 31
    const/4 v3, 0x0

    .line 32
    move-object v0, p0

    .line 33
    invoke-direct/range {v0 .. v6}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setParamters(IIIFFF)V

    .line 34
    .line 35
    .line 36
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 40
    .line 41
    if-eqz v1, :cond_5

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-lez v1, :cond_5

    .line 48
    .line 49
    move v10, v8

    .line 50
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-ge v10, v1, :cond_5

    .line 57
    .line 58
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 59
    .line 60
    invoke-virtual {v1, v10}, Ll/omw;->j(I)Ll/nuf;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 72
    .line 73
    invoke-virtual {v1, v10}, Ll/omw;->j(I)Ll/nuf;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    int-to-float v2, v2

    .line 86
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    int-to-float v3, v3

    .line 91
    invoke-direct {p0, v1, v2, v3}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->landMark104ToPoint([FFF)[F

    .line 92
    .line 93
    .line 94
    move-result-object v11

    .line 95
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 96
    .line 97
    invoke-virtual {v1, v10}, Ll/omw;->j(I)Ll/nuf;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget v2, p0, Ll/wej;->width:I

    .line 106
    .line 107
    int-to-float v2, v2

    .line 108
    iget v3, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 109
    .line 110
    div-float/2addr v2, v3

    .line 111
    invoke-static {v1, v2}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulationWidth([FF)F

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mType:I

    .line 116
    .line 117
    iget v5, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDermabrasion:F

    .line 118
    .line 119
    iget v6, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEyesAreaAmount:F

    .line 120
    .line 121
    const/4 v2, 0x1

    .line 122
    const/4 v3, 0x0

    .line 123
    move-object v0, p0

    .line 124
    invoke-direct/range {v0 .. v6}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setParamters(IIIFFF)V

    .line 125
    .line 126
    .line 127
    invoke-direct {p0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->facePassShaderValues()V

    .line 128
    .line 129
    .line 130
    invoke-static {v11, v8}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceSkinHead([FZ)[[F

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    aget-object v2, v1, v8

    .line 135
    .line 136
    aget-object v3, v1, v9

    .line 137
    .line 138
    aget-object v1, v1, v7

    .line 139
    .line 140
    iget-object v4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinBuffers:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    check-cast v4, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;

    .line 147
    .line 148
    invoke-direct {p0, v2, v3, v1, v4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->drawFace([F[F[FLcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)V

    .line 149
    .line 150
    .line 151
    :goto_1
    add-int/lit8 v10, v10, 0x1

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_3
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDermabrasion:F

    .line 155
    .line 156
    const v3, 0x3e99999a    # 0.3f

    .line 157
    .line 158
    .line 159
    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    int-to-float v1, v1

    .line 168
    div-float v4, v1, v2

    .line 169
    .line 170
    const/4 v6, 0x0

    .line 171
    const/4 v1, 0x0

    .line 172
    const/4 v2, 0x1

    .line 173
    const/4 v3, 0x0

    .line 174
    move-object v0, p0

    .line 175
    invoke-direct/range {v0 .. v6}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setParamters(IIIFFF)V

    .line 176
    .line 177
    .line 178
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 182
    .line 183
    if-eqz v1, :cond_5

    .line 184
    .line 185
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-lez v1, :cond_5

    .line 190
    .line 191
    move v10, v8

    .line 192
    :goto_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 193
    .line 194
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-ge v10, v1, :cond_5

    .line 199
    .line 200
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 201
    .line 202
    invoke-virtual {v1, v10}, Ll/omw;->j(I)Ll/nuf;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    if-nez v1, :cond_4

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_4
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 214
    .line 215
    invoke-virtual {v1, v10}, Ll/omw;->j(I)Ll/nuf;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    int-to-float v2, v2

    .line 228
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    int-to-float v3, v3

    .line 233
    invoke-direct {p0, v1, v2, v3}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->landMark104ToPoint([FFF)[F

    .line 234
    .line 235
    .line 236
    move-result-object v11

    .line 237
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 238
    .line 239
    invoke-virtual {v1, v10}, Ll/omw;->j(I)Ll/nuf;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v1}, Ll/nuf;->r()[F

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    iget v2, p0, Ll/wej;->width:I

    .line 248
    .line 249
    int-to-float v2, v2

    .line 250
    iget v3, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 251
    .line 252
    div-float/2addr v2, v3

    .line 253
    invoke-static {v1, v2}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulationWidth([FF)F

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mType:I

    .line 258
    .line 259
    iget v5, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDermabrasion:F

    .line 260
    .line 261
    iget v6, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEyesAreaAmount:F

    .line 262
    .line 263
    const/4 v2, 0x1

    .line 264
    const/4 v3, 0x0

    .line 265
    move-object v0, p0

    .line 266
    invoke-direct/range {v0 .. v6}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setParamters(IIIFFF)V

    .line 267
    .line 268
    .line 269
    invoke-direct {p0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->facePassShaderValues()V

    .line 270
    .line 271
    .line 272
    invoke-static {v11, v8}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceSkinHead([FZ)[[F

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    aget-object v2, v1, v8

    .line 277
    .line 278
    aget-object v3, v1, v9

    .line 279
    .line 280
    aget-object v1, v1, v7

    .line 281
    .line 282
    iget-object v5, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinBuffers:Ljava/util/List;

    .line 283
    .line 284
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    check-cast v5, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;

    .line 289
    .line 290
    invoke-direct {p0, v2, v3, v1, v5}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->drawFace([F[F[FLcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)V

    .line 291
    .line 292
    .line 293
    iget v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mType:I

    .line 294
    .line 295
    iget v5, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDermabrasion:F

    .line 296
    .line 297
    iget v6, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEyesAreaAmount:F

    .line 298
    .line 299
    const/4 v2, 0x1

    .line 300
    const/4 v3, 0x0

    .line 301
    invoke-direct/range {v0 .. v6}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->setParamters(IIIFFF)V

    .line 302
    .line 303
    .line 304
    invoke-direct {p0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->facePassShaderValues()V

    .line 305
    .line 306
    .line 307
    invoke-static {v11, v9}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getfaceSkinBelowHead([FZ)[[F

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    aget-object v2, v1, v8

    .line 312
    .line 313
    aget-object v3, v1, v9

    .line 314
    .line 315
    aget-object v1, v1, v7

    .line 316
    .line 317
    iget-object v4, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->skinBuffers:Ljava/util/List;

    .line 318
    .line 319
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    check-cast v4, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;

    .line 324
    .line 325
    invoke-direct {p0, v2, v3, v1, v4}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->drawFace([F[F[FLcom/momo/mcamera/mask/CXFaceSkinSmoothFilter$SkinFaceBuffer;)V

    .line 326
    .line 327
    .line 328
    :goto_3
    add-int/lit8 v10, v10, 0x1

    .line 329
    .line 330
    goto/16 :goto_2

    .line 331
    .line 332
    :cond_5
    :goto_4
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nuniform vec3 skinDefaultRGB;\nuniform vec3 epslone;\nuniform int cxSkinSmoothingUsesMask;\nuniform int cxSkinSmoothingConsidersSkinRelation;\nuniform int land;\nuniform vec2 sampleStep;\nuniform int winSize;\nvoid main() {\n    mediump vec4 meanI = vec4(0., 0., 0., 0.);\n    mediump vec4 meanII = vec4(0., 0., 0., 0.);\n    mediump vec4 temp = vec4(0., 0., 0., 0.);\n    mediump vec4 sourceColor = texture2D(inputImageTexture0,textureCoordinate);\n    float eps = epslone.r;\n    if (cxSkinSmoothingUsesMask > 0) {\n            vec4 mask = texture2D(inputImageTexture1,textureCoordinate1);\n            eps = dot(epslone, vec3(mask.rgb));\n    };\n    if (cxSkinSmoothingConsidersSkinRelation > 0) {\n            vec3 relation = vec3(1.) + min((sourceColor.xyz - vec3(skinDefaultRGB)), vec3(0.0));\n            float meanrelation = dot(relation, vec3(1.0/3.0));\n            float r = 1.0 / (1.0 + exp(24.0 - 30.0 * meanrelation));\n            eps = eps * r;\n        }\n    if (eps < 0.000001) {\n         gl_FragColor = sourceColor;\n         return;\n    }\n    mediump float sumW = 0.0;\n    float xInc = sampleStep.x;\n    float yInc = sampleStep.y;\n    if(land == 1){\n    float x = textureCoordinate.x + (-float(winSize) * 0.5 * xInc);\n    float y = textureCoordinate.y;\n         int j = 0;\n         for (int i = 0; i < winSize; i++) {\n             temp = texture2D(inputImageTexture0, vec2(x + float(i) * xInc, y));\n             vec3 weightsRelation = clamp((vec3(1.0) - vec3(5.0) * abs(temp.xyz - sourceColor.xyz)), vec3(0.0), vec3(1.0));\n             mediump float weightFloat = dot(weightsRelation, vec3(1.0/3.0));\n             sumW += weightFloat;\n             meanI += weightFloat * temp;\n             meanII += weightFloat * temp * temp;\n         }\n    }else{\n    float x = textureCoordinate.x;\n    float y = textureCoordinate.y + (-float(winSize) * 0.5 * yInc);\n          int i = 0;\n          for (int j = 0; j < winSize; j++) {\n              temp = texture2D(inputImageTexture0, vec2(x, y + float(j) * yInc));\n              vec3 weightsRelation = clamp((vec3(1.0) - vec3(5.0) * abs(temp.xyz - sourceColor.xyz)), vec3(0.0), vec3(1.0));\n              mediump float weightFloat = dot(weightsRelation, vec3(1.0/3.0));\n              sumW += weightFloat;\n              meanI += weightFloat * temp;\n              meanII += weightFloat * temp * temp;\n          }\n    }\n    meanI /= sumW;\n    meanII /= sumW;\n    temp = meanII - meanI * meanI;\n    vec3 a = clamp((vec4(temp) / (vec4(temp) + vec4(vec3(eps), 1.0))), vec4(0.0), vec4(1.0)).rgb;\n    vec3 b = vec4(meanI).rgb - a * vec4(meanI).rgb;\n    gl_FragColor = vec4(a * sourceColor.rgb + b,sourceColor.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaskPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mType:I

    .line 2
    .line 3
    return p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nattribute vec2 inputTextureCoordinate1;\nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate1;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\n  textureCoordinate1 = inputTextureCoordinate1;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "inputTextureCoordinate1"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexCoordHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "inputImageTexture1"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTextureHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "skinDefaultRGB"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDefaultSkinThresholdHandle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "epslone"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEpsloneHandle:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "cxSkinSmoothingUsesMask"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingUsesMaskHandle:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "cxSkinSmoothingConsidersSkinRelation"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mCxSkinSmoothingConsidersSkinRelationHandle:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "sampleStep"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mSampleStepHandle:I

    .line 73
    .line 74
    iget v0, p0, Ll/wej;->programHandle:I

    .line 75
    .line 76
    const-string v1, "land"

    .line 77
    .line 78
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mLandHandle:I

    .line 83
    .line 84
    iget v0, p0, Ll/wej;->programHandle:I

    .line 85
    .line 86
    const-string v1, "winSize"

    .line 87
    .line 88
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mWinSizeHandle:I

    .line 93
    .line 94
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexture:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskPath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/umw;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskPath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskTexture:I

    .line 28
    .line 29
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureInId:I

    .line 30
    .line 31
    const/4 v1, -0x1

    .line 32
    if-eq v0, v1, :cond_2

    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureId:I

    .line 35
    .line 36
    if-eq v0, v1, :cond_2

    .line 37
    .line 38
    iget v2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureBeforeId:I

    .line 39
    .line 40
    if-eq v2, v1, :cond_2

    .line 41
    .line 42
    if-ne p1, v0, :cond_1

    .line 43
    .line 44
    if-eq v2, p1, :cond_2

    .line 45
    .line 46
    :cond_1
    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->isDiscard:Z

    .line 48
    .line 49
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureId:I

    .line 50
    .line 51
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureBeforeId:I

    .line 52
    .line 53
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureId:I

    .line 54
    .line 55
    iget v0, p0, Ll/wej;->texture_in:I

    .line 56
    .line 57
    iput v0, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->textureInId:I

    .line 58
    .line 59
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onDrawFrame()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/wej;->curRotation:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v1, p0, Ll/wej;->curRotation:I

    .line 39
    .line 40
    aget-object v7, v0, v1

    .line 41
    .line 42
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 46
    .line 47
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->facePassShaderValues()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMmcvInfo:Ll/omw;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mLowSkinThreshold:[I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    aput v2, v1, v2

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    aput v2, v1, v3

    .line 21
    .line 22
    const/4 v4, 0x2

    .line 23
    aput v2, v1, v4

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mHighSkinThreshold:[I

    .line 26
    .line 27
    const/16 v5, 0xff

    .line 28
    .line 29
    aput v5, v1, v2

    .line 30
    .line 31
    aput v5, v1, v3

    .line 32
    .line 33
    aput v5, v1, v4

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDefaultSkinThreshold:[I

    .line 36
    .line 37
    const/16 v5, 0xa0

    .line 38
    .line 39
    aput v5, v1, v2

    .line 40
    .line 41
    const/16 v2, 0x78

    .line 42
    .line 43
    aput v2, v1, v3

    .line 44
    .line 45
    const/16 v2, 0x6e

    .line 46
    .line 47
    aput v2, v1, v4

    .line 48
    .line 49
    iget v1, p1, Ll/omw;->c:I

    .line 50
    .line 51
    rem-int/lit8 v2, v1, 0x5a

    .line 52
    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    rem-int/lit16 v1, v1, 0xb4

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    iget p1, p1, Ll/omw;->f:I

    .line 60
    .line 61
    int-to-float p1, p1

    .line 62
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget p1, p1, Ll/omw;->e:I

    .line 66
    .line 67
    int-to-float p1, p1

    .line 68
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mMMCVWidth:F

    .line 69
    .line 70
    :goto_0
    monitor-exit v0

    .line 71
    return-void

    .line 72
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    throw p0
.end method

.method public setMaskPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->maskPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSkinParameter(FF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mDermabrasion:F

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mEyesAreaAmount:F

    .line 4
    .line 5
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/CXFaceSkinSmoothFilter;->mType:I

    .line 2
    .line 3
    return-void
.end method
