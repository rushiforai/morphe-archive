.class public Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;
    }
.end annotation


# static fields
.field protected static final UNIFORM_TEXELHEIGHT:Ljava/lang/String; = "texelHeightOffset"

.field protected static final UNIFORM_TEXELWIDTH:Ljava/lang/String; = "texelWidthOffset"


# instance fields
.field private bSkinDetect_:Z

.field private defaultSkinThreshold:[I

.field private defaultSkinThresholdHandle:I

.field private edgePassFilterType_:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

.field protected height:I

.field private highSkinThreshold:[I

.field private highSkinThresholdHandle:I

.field private lowSkinThreshold:[I

.field private lowSkinThresholdHandle:I

.field private skinSmoothScale:F

.field private skinSmoothScaleHanle:I

.field protected texelHeight:F

.field private texelHeightHandle:I

.field protected texelWidth:F

.field private texelWidthHandle:I

.field protected width:I

.field private winsize_:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 75
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    const/4 v0, 0x0

    .line 76
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->bSkinDetect_:Z

    const/4 v1, 0x4

    .line 77
    iput v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->winsize_:I

    const/4 v2, 0x0

    .line 78
    iput v2, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScale:F

    .line 79
    filled-new-array {v0, v0, v0}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThreshold:[I

    const/16 v0, 0xff

    .line 80
    filled-new-array {v0, v0, v0}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThreshold:[I

    const/16 v0, 0x78

    const/16 v2, 0x6e

    const/16 v3, 0xa0

    .line 81
    filled-new-array {v3, v0, v2}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThreshold:[I

    .line 82
    sget-object v0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;->guidedFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->init(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;IZ)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->bSkinDetect_:Z

    .line 6
    .line 7
    const/4 v1, 0x4

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->winsize_:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput v2, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScale:F

    .line 12
    .line 13
    filled-new-array {v0, v0, v0}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThreshold:[I

    .line 18
    .line 19
    const/16 v0, 0xff

    .line 20
    .line 21
    filled-new-array {v0, v0, v0}, [I

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThreshold:[I

    .line 26
    .line 27
    const/16 v0, 0x78

    .line 28
    .line 29
    const/16 v2, 0x6e

    .line 30
    .line 31
    const/16 v3, 0xa0

    .line 32
    .line 33
    filled-new-array {v3, v0, v2}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThreshold:[I

    .line 38
    .line 39
    sget-object v0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$1;->$SwitchMap$com$momo$mcamera$mask$FaceSkinSmoothFilter$edgePassFilterVersion:[I

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    aget p1, v0, p1

    .line 46
    .line 47
    const/4 v0, 0x3

    .line 48
    const/4 v2, 0x1

    .line 49
    if-eq p1, v2, :cond_2

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    if-eq p1, v3, :cond_1

    .line 53
    .line 54
    if-eq p1, v0, :cond_0

    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    sget-object p1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;->transitionalGuidedFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 58
    .line 59
    invoke-direct {p0, p1, v1, v2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->init(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;IZ)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    sget-object p1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;->guidedFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 64
    .line 65
    invoke-direct {p0, p1, v1, v2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->init(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;IZ)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    sget-object p1, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;->surfaceFilter:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 70
    .line 71
    invoke-direct {p0, p1, v0, v2}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->init(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;IZ)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private getGuidedFilterFragmentShaderString(IZ)Ljava/lang/String;
    .locals 5

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move-object v2, p0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    if-ge v1, p1, :cond_1

    .line 7
    .line 8
    move v3, v0

    .line 9
    :goto_1
    if-ge v3, p1, :cond_0

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "         tmpVec4 = texture2D(inputImageTexture0, vec2( textureCoordinate.x + (-float("

    .line 20
    .line 21
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ") * 0.5 * xInc) + float("

    .line 32
    .line 33
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ") * xInc, textureCoordinate.y + (-float("

    .line 44
    .line 45
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ") * 0.5 * yInc) + float("

    .line 56
    .line 57
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ") * yInc));\n        meanI += tmpVec4;\n        meanII += tmpVec4 * tmpVec4;\n"

    .line 68
    .line 69
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v1, "        meanI /= float("

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v1, " * "

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v2, ");\n        meanII /= float("

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string p1, ");\n"

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    if-eqz p2, :cond_2

    .line 146
    .line 147
    const-string p0, "mediump   float m_r = sourceColorVec4.r;\nmediump   float m_g = sourceColorVec4.g;\nmediump    float m_b = sourceColorVec4.b;\nmediump    float m_max = max(m_r, max(m_g, m_b));\nmediump    float m_min = min(m_r, min(m_g, m_b));\nmediump    float r_low = lowSkinThreshold.x;\nmediump    float g_low = lowSkinThreshold.y;\nmediump    float b_low = lowSkinThreshold.z;\nmediump    float r_high = highSkinThreshold.x;\nmediump    float g_high = highSkinThreshold.y;\nmediump    float b_high = highSkinThreshold.z;\n    if(!(r_low<=m_r  && g_low<=m_g &&  b_low<=m_b)) {\n        gl_FragColor = sourceColorVec4 ;\n        return;\n    }\n"

    .line 148
    .line 149
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform mediump float parameter;\nuniform mediump vec3 lowSkinThreshold;\nuniform mediump vec3 highSkinThreshold;\nuniform float texelWidthOffset; \nuniform float texelHeightOffset; \nmediump float minstep = 3.5;\nvoid main() {\n    float xInc = minstep * texelWidthOffset;\n    float yInc = minstep * texelHeightOffset;\n    float epslone = 0.004*parameter*parameter;\n    vec4 eps = vec4(epslone, epslone, epslone, epslone);\n    vec4 meanI = vec4(0., 0., 0., 0.);\n    vec4 meanII = vec4(0., 0., 0., 0.);\n    vec4 tmpVec4;\n    mediump vec4 sourceColorVec4 = texture2D(inputImageTexture0,textureCoordinate);\n    if (parameter < 0.01 || epslone <=0.){\n         gl_FragColor = sourceColorVec4;\n         return;\n    }\n"

    .line 152
    .line 153
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string p0, "    tmpVec4 = meanII - meanI * meanI;\n    vec4 temp2 = tmpVec4 + eps;\n    if (temp2.x <= 0. || temp2.y <= 0. || temp2.z <= 0. || temp2.x > 1.0 || temp2.y > 1.0 || temp2.z > 1.0 ){\n            gl_FragColor = sourceColorVec4 ;\n            return;\n    }\n    else {\n        vec4 a = tmpVec4 /temp2;\n        vec4 b = meanI - a * meanI;\n        gl_FragColor = a * sourceColorVec4 + b;\n        gl_FragColor.w = sourceColorVec4.w;\n        return;\n    }\n}\n"

    .line 163
    .line 164
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    return-object p0
.end method

.method private getSurfaceFilterFragmentShaderString(IZ)Ljava/lang/String;
    .locals 5

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move-object v2, p0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    if-ge v1, p1, :cond_1

    .line 7
    .line 8
    move v3, v0

    .line 9
    :goto_1
    if-ge v3, p1, :cond_0

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "                tmpVec4 = texture2D(inputImageTexture0, vec2( textureCoordinate.x + (-float("

    .line 20
    .line 21
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ")  * 0.5 * xInc) + float("

    .line 32
    .line 33
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ") * xInc, textureCoordinate.y + (-float("

    .line 44
    .line 45
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ") * 0.5 * yInc) + float("

    .line 56
    .line 57
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ") * yInc));\n                w = 1. - abs(tmpVec4.xyz - sourceColorVec4.xyz)/(2.5*threshold);\n                if (w.x < 0.|| w.y < 0. || w.z < 0.) {\n                    w.x = 0.;\n                    w.y = 0.;\n                    w.z = 0.;\n                }\n                sumW = sumW +w;\n                sum = sum + w*tmpVec4.xyz;\n"

    .line 68
    .line 69
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    if-eqz p2, :cond_2

    .line 83
    .line 84
    const-string p0, "    float m_r = sourceColorVec4.r;\n    float m_g = sourceColorVec4.g;\n    float m_b = sourceColorVec4.b;\n    float m_max = max(m_r, max(m_g, m_b));\n    float m_min = min(m_r, min(m_g, m_b));\n    float r_low = lowSkinThreshold.x;\n    float g_low = lowSkinThreshold.y;\n    float b_low = lowSkinThreshold.z;\n    float r_high = highSkinThreshold.x;\n    float g_high = highSkinThreshold.y;\n    float b_high = highSkinThreshold.z;\n    if(!(r_low<=m_r &&  g_low<=m_g && b_low<=m_b ) ) {\n        gl_FragColor = sourceColorVec4 ;\n        return;\n    }\n"

    .line 85
    .line 86
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string p2, "    precision mediump float;\n    uniform sampler2D inputImageTexture0;\n    varying vec2 textureCoordinate;\n    uniform float parameter;\n    uniform vec3 lowSkinThreshold;\n    uniform vec3 highSkinThreshold;\n    uniform float texelWidthOffset; \n    uniform float texelHeightOffset; \n    vec4 a;\n    vec4 b;\n    void main() {\n        float minstep = 5.0;\n        float xInc = minstep * texelWidthOffset;\n        float yInc = minstep * texelHeightOffset;\n        vec4 tmpVec4;\n        mediump vec4 tmpMediump4;\n        mediump vec4 sourceColorVec4 = texture2D(inputImageTexture0,textureCoordinate);\n        if (parameter <0.001 ) {\n            gl_FragColor = sourceColorVec4;\n            return;\n        }\n        float threshold = parameter*20./255.;\n        vec3 sum = vec3(0.,0.,0.);\n        vec3 sumW = vec3(0.,0.,0.);\n        vec3 w;"

    .line 89
    .line 90
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p0, "        if (sumW.x == 0. || sumW.y == 0. || sumW.z == 0.){\n            gl_FragColor = sourceColorVec4;\n        }\n        else {\n            gl_FragColor.xyz = sum/sumW;\n            gl_FragColor.w = sourceColorVec4.w;\n        }\n    }\n"

    .line 100
    .line 101
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0
.end method

.method private getTransitionalGuidedFilterFragmentShaderString(IZ)Ljava/lang/String;
    .locals 5

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move-object v2, p0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    if-ge v1, p1, :cond_1

    .line 7
    .line 8
    move v3, v0

    .line 9
    :goto_1
    if-ge v3, p1, :cond_0

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "        tmpVec4 = texture2D(inputImageTexture0, vec2( textureCoordinate.x + (-float("

    .line 20
    .line 21
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ") * 0.5 * xInc) + float("

    .line 32
    .line 33
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ") * xInc, textureCoordinate.y + (-float("

    .line 44
    .line 45
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ") * 0.5 * yInc) + float("

    .line 56
    .line 57
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ") * yInc));\n        meanI += tmpVec4;\n        meanII += tmpVec4 * tmpVec4;\n"

    .line 68
    .line 69
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v1, "        meanI /= float("

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v1, " * "

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v2, ");\n        meanII /= float("

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string p1, ");\n"

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    if-eqz p2, :cond_2

    .line 146
    .line 147
    const-string p0, "vec3 relation = vec3(1.0) + min((sourceColorVec4.xyz - skinDefaultRGB),vec3(0.0));\nrelation = vec3((relation.x+relation.y+relation.z)/3.0);\nrelation = 1./(1. + exp(24. - 30. * relation));\neps = vec4(epslone * relation, epslone);\nif (any(lessThan(eps, vec4(0.000001)))) {\n     gl_FragColor = sourceColorVec4;\n     return;\n}\n"

    .line 148
    .line 149
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform mediump float parameter;\nuniform mediump vec3 lowSkinThreshold;\nuniform mediump vec3 highSkinThreshold;\nuniform float texelWidthOffset; \nuniform float texelHeightOffset; \nmediump float minstep = 3.5;\nuniform vec3 skinDefaultRGB;\nvoid main() {\n    float xInc = minstep * texelWidthOffset;\n    float yInc = minstep * texelHeightOffset;\n    float epslone = 0.004*parameter*parameter;\n    vec4 eps = vec4(epslone, epslone, epslone, epslone);\n    vec4 meanI = vec4(0., 0., 0., 0.);\n    vec4 meanII = vec4(0., 0., 0., 0.);\n    vec4 tmpVec4;\n    mediump vec4 sourceColorVec4 = texture2D(inputImageTexture0,textureCoordinate);\n    if (parameter < 0.01 || epslone <=0.){\n         gl_FragColor = sourceColorVec4;\n         return;\n    }\n"

    .line 152
    .line 153
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string p0, "    tmpVec4 = meanII - meanI * meanI;\n    vec4 temp2 = tmpVec4 + eps;\n    if (temp2.x <= 0. || temp2.y <= 0. || temp2.z <= 0. || temp2.x > 1.0 || temp2.y > 1.0 || temp2.z > 1.0 ){\n            gl_FragColor = sourceColorVec4 ;\n            return;\n    }\n    else {\n        vec4 a = tmpVec4 /temp2;\n        vec4 b = meanI - a * meanI;\n        gl_FragColor = a * sourceColorVec4 + b;\n        gl_FragColor.w = sourceColorVec4.w;\n        return;\n    }\n}\n"

    .line 163
    .line 164
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    return-object p0
.end method

.method private init(Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;IZ)V
    .locals 1

    .line 1
    iput p2, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->winsize_:I

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->edgePassFilterType_:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->bSkinDetect_:Z

    .line 6
    .line 7
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThreshold:[I

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    aput p2, p1, p2

    .line 11
    .line 12
    const/4 p3, 0x1

    .line 13
    aput p2, p1, p3

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    aput p2, p1, v0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThreshold:[I

    .line 19
    .line 20
    const/16 p1, 0xff

    .line 21
    .line 22
    aput p1, p0, p2

    .line 23
    .line 24
    aput p1, p0, p3

    .line 25
    .line 26
    aput p1, p0, v0

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public clearPoints()V
    .locals 0

    return-void
.end method

.method public drawSub()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->width:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->height:I

    .line 12
    .line 13
    sget-object v0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$1;->$SwitchMap$com$momo$mcamera$mask$FaceSkinSmoothFilter$edgePassFilterVersion:[I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->edgePassFilterType_:Lcom/momo/mcamera/mask/FaceSkinSmoothFilter$edgePassFilterVersion;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    aget v0, v0, v1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-eq v0, v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    if-eq v0, v1, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    if-eq v0, v1, :cond_0

    .line 31
    .line 32
    const-string p0, "Beauty log"

    .line 33
    .line 34
    const-string v0, "Parameters Error: Invalid filter type!"

    .line 35
    .line 36
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string p0, ""

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->winsize_:I

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->bSkinDetect_:Z

    .line 45
    .line 46
    invoke-direct {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->getTransitionalGuidedFilterFragmentShaderString(IZ)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->winsize_:I

    .line 52
    .line 53
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->bSkinDetect_:Z

    .line 54
    .line 55
    invoke-direct {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->getGuidedFilterFragmentShaderString(IZ)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->winsize_:I

    .line 61
    .line 62
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->bSkinDetect_:Z

    .line 63
    .line 64
    invoke-direct {p0, v0, v1}, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->getSurfaceFilterFragmentShaderString(IZ)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public getSkinSmoothScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScale:F

    .line 2
    .line 3
    return p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->getVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    div-float v0, v1, v0

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelWidth:F

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    div-float/2addr v1, v0

    .line 21
    iput v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelHeight:F

    .line 22
    .line 23
    return-void
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
    const-string v1, "parameter"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScaleHanle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "lowSkinThreshold"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThresholdHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "highSkinThreshold"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThresholdHandle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "skinDefaultRGB"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThresholdHandle:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "texelWidthOffset"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelWidthHandle:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "texelHeightOffset"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelHeightHandle:I

    .line 63
    .line 64
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->width:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->height:I

    .line 12
    .line 13
    iget v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->width:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    div-float v1, v2, v1

    .line 19
    .line 20
    iput v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelWidth:F

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    div-float/2addr v2, v0

    .line 24
    iput v2, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelHeight:F

    .line 25
    .line 26
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScaleHanle:I

    .line 30
    .line 31
    iget v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScale:F

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 34
    .line 35
    .line 36
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThresholdHandle:I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThreshold:[I

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    aget v3, v1, v2

    .line 42
    .line 43
    int-to-float v3, v3

    .line 44
    const/high16 v4, 0x437f0000    # 255.0f

    .line 45
    .line 46
    div-float/2addr v3, v4

    .line 47
    const/4 v5, 0x1

    .line 48
    aget v6, v1, v5

    .line 49
    .line 50
    int-to-float v6, v6

    .line 51
    div-float/2addr v6, v4

    .line 52
    const/4 v7, 0x2

    .line 53
    aget v1, v1, v7

    .line 54
    .line 55
    add-int/lit8 v1, v1, -0xa

    .line 56
    .line 57
    int-to-float v1, v1

    .line 58
    div-float/2addr v1, v4

    .line 59
    invoke-static {v0, v3, v6, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 60
    .line 61
    .line 62
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThresholdHandle:I

    .line 63
    .line 64
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThreshold:[I

    .line 65
    .line 66
    aget v3, v1, v2

    .line 67
    .line 68
    int-to-float v3, v3

    .line 69
    div-float/2addr v3, v4

    .line 70
    aget v6, v1, v5

    .line 71
    .line 72
    int-to-float v6, v6

    .line 73
    div-float/2addr v6, v4

    .line 74
    aget v1, v1, v7

    .line 75
    .line 76
    int-to-float v1, v1

    .line 77
    div-float/2addr v1, v4

    .line 78
    invoke-static {v0, v3, v6, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThresholdHandle:I

    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThreshold:[I

    .line 84
    .line 85
    aget v2, v1, v2

    .line 86
    .line 87
    int-to-float v2, v2

    .line 88
    div-float/2addr v2, v4

    .line 89
    aget v3, v1, v5

    .line 90
    .line 91
    int-to-float v3, v3

    .line 92
    div-float/2addr v3, v4

    .line 93
    aget v1, v1, v7

    .line 94
    .line 95
    int-to-float v1, v1

    .line 96
    div-float/2addr v1, v4

    .line 97
    invoke-static {v0, v2, v3, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 98
    .line 99
    .line 100
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelWidthHandle:I

    .line 101
    .line 102
    iget v1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelWidth:F

    .line 103
    .line 104
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 105
    .line 106
    .line 107
    iget v0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelHeightHandle:I

    .line 108
    .line 109
    iget p0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->texelHeight:F

    .line 110
    .line 111
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/nuf;->w()[I

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    array-length v3, p1

    .line 19
    const/16 v4, 0x9

    .line 20
    .line 21
    if-ge v3, v4, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThreshold:[I

    .line 25
    .line 26
    aget v4, p1, v0

    .line 27
    .line 28
    aput v4, v3, v0

    .line 29
    .line 30
    aget v4, p1, v2

    .line 31
    .line 32
    aput v4, v3, v2

    .line 33
    .line 34
    aget v4, p1, v1

    .line 35
    .line 36
    aput v4, v3, v1

    .line 37
    .line 38
    iget-object v3, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThreshold:[I

    .line 39
    .line 40
    const/4 v4, 0x3

    .line 41
    aget v4, p1, v4

    .line 42
    .line 43
    aput v4, v3, v0

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    aget v4, p1, v4

    .line 47
    .line 48
    aput v4, v3, v2

    .line 49
    .line 50
    const/4 v4, 0x5

    .line 51
    aget v4, p1, v4

    .line 52
    .line 53
    aput v4, v3, v1

    .line 54
    .line 55
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThreshold:[I

    .line 56
    .line 57
    const/4 v3, 0x6

    .line 58
    aget v3, p1, v3

    .line 59
    .line 60
    aput v3, p0, v0

    .line 61
    .line 62
    const/4 v0, 0x7

    .line 63
    aget v0, p1, v0

    .line 64
    .line 65
    aput v0, p0, v2

    .line 66
    .line 67
    const/16 v0, 0x8

    .line 68
    .line 69
    aget p1, p1, v0

    .line 70
    .line 71
    aput p1, p0, v1

    .line 72
    .line 73
    return-void

    .line 74
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->lowSkinThreshold:[I

    .line 75
    .line 76
    aput v0, p1, v0

    .line 77
    .line 78
    aput v0, p1, v2

    .line 79
    .line 80
    aput v0, p1, v1

    .line 81
    .line 82
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->highSkinThreshold:[I

    .line 83
    .line 84
    const/16 v3, 0xff

    .line 85
    .line 86
    aput v3, p1, v0

    .line 87
    .line 88
    aput v3, p1, v2

    .line 89
    .line 90
    aput v3, p1, v1

    .line 91
    .line 92
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->defaultSkinThreshold:[I

    .line 93
    .line 94
    const/16 p1, 0xa0

    .line 95
    .line 96
    aput p1, p0, v0

    .line 97
    .line 98
    const/16 p1, 0x78

    .line 99
    .line 100
    aput p1, p0, v2

    .line 101
    .line 102
    const/16 p1, 0x6e

    .line 103
    .line 104
    aput p1, p0, v1

    .line 105
    .line 106
    return-void
.end method

.method public setSkinSmoothScale(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/FaceSkinSmoothFilter;->skinSmoothScale:F

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method
