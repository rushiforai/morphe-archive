.class public Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private final animator:Landroid/animation/ValueAnimator;

.field private final animatorSet:Landroid/animation/AnimatorSet;

.field private currentType:I

.field private map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "[",
            "Lcom/momo/mcamera/mask/hotdance/DanceModel;",
            ">;"
        }
    .end annotation
.end field

.field private matrix:[F

.field private matrixHandle:I

.field private final offsetAnimator:Landroid/animation/ValueAnimator;

.field private scale:F

.field private translateX:F

.field private translateY:F


# direct methods
.method public constructor <init>()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jt2;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    new-array v1, v1, [F

    .line 9
    .line 10
    iput-object v1, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrix:[F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput v1, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrixHandle:I

    .line 14
    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    iput v2, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->scale:F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput v2, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->translateX:F

    .line 21
    .line 22
    iput v2, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->translateY:F

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    new-array v3, v2, [F

    .line 26
    .line 27
    fill-array-data v3, :array_0

    .line 28
    .line 29
    .line 30
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iput-object v3, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    new-array v2, v2, [F

    .line 37
    .line 38
    fill-array-data v2, :array_1

    .line 39
    .line 40
    .line 41
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 48
    .line 49
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v2, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    new-instance v2, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v2, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->map:Ljava/util/HashMap;

    .line 60
    .line 61
    new-instance v3, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 62
    .line 63
    const/4 v9, 0x0

    .line 64
    const-wide/16 v10, 0x190

    .line 65
    .line 66
    const/high16 v4, 0x3f800000    # 1.0f

    .line 67
    .line 68
    const/high16 v5, 0x40000000    # 2.0f

    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    const/4 v7, 0x0

    .line 72
    const/4 v8, 0x0

    .line 73
    invoke-direct/range {v3 .. v11}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 74
    .line 75
    .line 76
    new-instance v4, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 77
    .line 78
    const/4 v10, 0x0

    .line 79
    const-wide/16 v11, 0x190

    .line 80
    .line 81
    const/high16 v6, 0x3f800000    # 1.0f

    .line 82
    .line 83
    const/high16 v8, 0x3f800000    # 1.0f

    .line 84
    .line 85
    invoke-direct/range {v4 .. v12}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 86
    .line 87
    .line 88
    new-instance v5, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 89
    .line 90
    const/4 v11, 0x0

    .line 91
    const-wide/16 v12, 0x190

    .line 92
    .line 93
    const/high16 v7, 0x3f800000    # 1.0f

    .line 94
    .line 95
    const/4 v8, 0x0

    .line 96
    const/high16 v9, 0x3f800000    # 1.0f

    .line 97
    .line 98
    invoke-direct/range {v5 .. v13}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 99
    .line 100
    .line 101
    new-instance v6, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 102
    .line 103
    const/4 v12, 0x0

    .line 104
    const-wide/16 v13, 0x190

    .line 105
    .line 106
    const/high16 v7, 0x40000000    # 2.0f

    .line 107
    .line 108
    const/high16 v8, 0x40000000    # 2.0f

    .line 109
    .line 110
    const/4 v9, 0x0

    .line 111
    invoke-direct/range {v6 .. v14}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 112
    .line 113
    .line 114
    filled-new-array {v3, v4, v5, v6}, [Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    iget-object v3, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->map:Ljava/util/HashMap;

    .line 119
    .line 120
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    new-instance v5, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 128
    .line 129
    const-wide/16 v12, 0x190

    .line 130
    .line 131
    const/high16 v6, 0x3f800000    # 1.0f

    .line 132
    .line 133
    const/4 v8, 0x0

    .line 134
    const/high16 v9, -0x40800000    # -1.0f

    .line 135
    .line 136
    invoke-direct/range {v5 .. v13}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 137
    .line 138
    .line 139
    new-instance v6, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 140
    .line 141
    const/4 v12, 0x0

    .line 142
    const-wide/16 v13, 0x190

    .line 143
    .line 144
    const/high16 v8, 0x3f800000    # 1.0f

    .line 145
    .line 146
    const/4 v9, 0x0

    .line 147
    invoke-direct/range {v6 .. v14}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 148
    .line 149
    .line 150
    new-instance v7, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 151
    .line 152
    const/4 v13, 0x0

    .line 153
    const-wide/16 v14, 0x190

    .line 154
    .line 155
    const/high16 v9, 0x3f800000    # 1.0f

    .line 156
    .line 157
    const/high16 v11, -0x40800000    # -1.0f

    .line 158
    .line 159
    invoke-direct/range {v7 .. v15}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 160
    .line 161
    .line 162
    new-instance v8, Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 163
    .line 164
    const/4 v14, 0x0

    .line 165
    const-wide/16 v15, 0x190

    .line 166
    .line 167
    const/high16 v9, 0x40000000    # 2.0f

    .line 168
    .line 169
    const/high16 v10, 0x40000000    # 2.0f

    .line 170
    .line 171
    const/4 v11, 0x0

    .line 172
    invoke-direct/range {v8 .. v16}, Lcom/momo/mcamera/mask/hotdance/DanceModel;-><init>(FFFFFFJ)V

    .line 173
    .line 174
    .line 175
    filled-new-array {v5, v6, v7, v8}, [Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    iget-object v3, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->map:Ljava/util/HashMap;

    .line 180
    .line 181
    const/4 v4, 0x1

    .line 182
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    iput v1, v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->currentType:I

    .line 190
    .line 191
    return-void

    .line 192
    nop

    .line 193
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->scale:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$102(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->translateX:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$202(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;F)F
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->translateY:F

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->currentType:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->currentType:I

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform mat4 matrix;\nvoid main() {\n  textureCoordinate = (matrix * inputTextureCoordinate).xy;\n   gl_Position = position;\n}\n"

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
    const-string v1, "matrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrixHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public onMusicBeatDetect(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->map:Ljava/util/HashMap;

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->currentType:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, [Lcom/momo/mcamera/mask/hotdance/DanceModel;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v1, 0x1

    .line 19
    if-ne p1, v1, :cond_1

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    aget-object v2, v0, v2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    aget-object v2, v0, v1

    .line 26
    .line 27
    :goto_0
    if-ne p1, v1, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x3

    .line 30
    aget-object p1, v0, p1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    const/4 p1, 0x2

    .line 34
    aget-object p1, v0, p1

    .line 35
    .line 36
    :goto_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    iget-wide v3, v2, Lcom/momo/mcamera/mask/hotdance/DanceModel;->duration:J

    .line 44
    .line 45
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$1;

    .line 51
    .line 52
    invoke-direct {v1, p0, v2}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$1;-><init>(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;Lcom/momo/mcamera/mask/hotdance/DanceModel;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    iget-wide v1, p1, Lcom/momo/mcamera/mask/hotdance/DanceModel;->duration:J

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;

    .line 73
    .line 74
    invoke-direct {v1, p0, p1}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$2;-><init>(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;Lcom/momo/mcamera/mask/hotdance/DanceModel;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    new-instance v0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$3;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter$3;-><init>(Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 91
    .line 92
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->offsetAnimator:Landroid/animation/ValueAnimator;

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animator:Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->animatorSet:Landroid/animation/AnimatorSet;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public passShaderValues()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrix:[F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrix:[F

    .line 11
    .line 12
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->translateX:F

    .line 13
    .line 14
    iget v3, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->translateY:F

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v0, v1, v2, v3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrix:[F

    .line 21
    .line 22
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->scale:F

    .line 23
    .line 24
    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    .line 26
    invoke-static {v0, v1, v2, v2, v3}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrixHandle:I

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/DynamicNineGridFilter;->matrix:[F

    .line 33
    .line 34
    invoke-static {v0, v2, v1, p0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
