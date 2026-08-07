.class public Ll/zdn0;
.super Ll/ruf0;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zdn0$a;
    }
.end annotation


# static fields
.field public static final i:I


# instance fields
.field public a:Landroid/graphics/ColorMatrix;

.field public b:Ll/zdn0$a;

.field public c:Ljava/lang/String;

.field public d:F

.field public e:Z

.field public f:Landroid/graphics/Rect;

.field public g:I

.field public h:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->c:I

    .line 2
    .line 3
    neg-int v0, v0

    .line 4
    sput v0, Ll/zdn0;->i:I

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ll/nxp;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zdn0$a;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2}, Ll/zdn0$a;-><init>(Ll/nxp;Landroid/graphics/Bitmap;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 10
    .line 11
    new-instance p2, Landroid/graphics/ColorMatrix;

    .line 12
    .line 13
    invoke-direct {p2}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/nxp;->h()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "gray"

    .line 23
    .line 24
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    :goto_0
    invoke-virtual {p2, p1}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 38
    .line 39
    iget-object p1, p1, Ll/zdn0$a;->e:Ll/nxp;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/nxp;->f()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-static {p1}, Ll/zdn0;->b(I)Landroid/graphics/Paint;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/zdn0;->h:Landroid/graphics/Paint;

    .line 50
    .line 51
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 52
    .line 53
    iget-object p1, p1, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    .line 54
    .line 55
    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    .line 56
    .line 57
    iget-object v0, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    .line 58
    .line 59
    invoke-direct {p2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 66
    .line 67
    iget-object p1, p1, Ll/zdn0$a;->c:Landroid/graphics/Paint;

    .line 68
    .line 69
    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    .line 70
    .line 71
    iget-object v0, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    .line 72
    .line 73
    invoke-direct {p2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 80
    .line 81
    iget-object p1, p1, Ll/zdn0$a;->b:Landroid/graphics/Paint;

    .line 82
    .line 83
    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    .line 84
    .line 85
    iget-object p0, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    .line 86
    .line 87
    invoke-direct {p2, p0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public constructor <init>(Ll/zdn0$a;)V
    .locals 2

    .line 95
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 96
    iput-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 97
    new-instance v0, Landroid/graphics/ColorMatrix;

    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    iput-object v0, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    .line 98
    iget-object p1, p1, Ll/zdn0$a;->e:Ll/nxp;

    invoke-virtual {p1}, Ll/nxp;->h()Ljava/lang/String;

    move-result-object p1

    const-string v1, "gray"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v0, p1}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 99
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    iget-object p1, p1, Ll/zdn0$a;->e:Ll/nxp;

    invoke-virtual {p1}, Ll/nxp;->f()I

    move-result p1

    invoke-static {p1}, Ll/zdn0;->b(I)Landroid/graphics/Paint;

    move-result-object p1

    iput-object p1, p0, Ll/zdn0;->h:Landroid/graphics/Paint;

    .line 100
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    iget-object p1, p1, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    iget-object v1, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    invoke-direct {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 101
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    iget-object p1, p1, Ll/zdn0$a;->c:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    iget-object v1, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    invoke-direct {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 102
    iget-object p1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    iget-object p1, p1, Ll/zdn0$a;->b:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    iget-object p0, p0, Ll/zdn0;->a:Landroid/graphics/ColorMatrix;

    invoke-direct {v0, p0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method

.method public synthetic constructor <init>(Ll/zdn0$a;Ll/aen0;)V
    .locals 0

    .line 94
    invoke-direct {p0, p1}, Ll/zdn0;-><init>(Ll/zdn0$a;)V

    return-void
.end method

.method public static b(I)Landroid/graphics/Paint;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    const v1, 0x3d4ccccd    # 0.05f

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    .line 15
    .line 16
    .line 17
    int-to-float p0, p0

    .line 18
    const/high16 v1, 0x40200000    # 2.5f

    .line 19
    .line 20
    div-float/2addr p0, v1

    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method private c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 6
    .line 7
    int-to-float v2, v2

    .line 8
    const/high16 v3, 0x40a00000    # 5.0f

    .line 9
    .line 10
    div-float v9, v2, v3

    .line 11
    .line 12
    new-instance v10, Landroid/graphics/LinearGradient;

    .line 13
    .line 14
    iget v2, v1, Landroid/graphics/Rect;->right:I

    .line 15
    .line 16
    int-to-float v13, v2

    .line 17
    iget-object v2, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/zdn0$a;->d()I

    .line 20
    .line 21
    .line 22
    move-result v15

    .line 23
    iget-object v2, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/zdn0$a;->c()I

    .line 26
    .line 27
    .line 28
    move-result v16

    .line 29
    sget-object v17, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 30
    .line 31
    const/4 v11, 0x0

    .line 32
    const/4 v12, 0x0

    .line 33
    const/4 v14, 0x0

    .line 34
    invoke-direct/range {v10 .. v17}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 38
    .line 39
    iget-object v2, v2, Ll/zdn0$a;->b:Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-virtual {v2, v10}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 42
    .line 43
    .line 44
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 45
    .line 46
    div-int/lit8 v2, v2, 0x2

    .line 47
    .line 48
    iget-object v3, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 49
    .line 50
    iget-object v3, v3, Ll/zdn0$a;->e:Ll/nxp;

    .line 51
    .line 52
    invoke-virtual {v3}, Ll/nxp;->l()Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget v3, Ll/zdn0;->i:I

    .line 61
    .line 62
    :goto_0
    add-int/2addr v2, v3

    .line 63
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 64
    .line 65
    add-int/2addr v3, v2

    .line 66
    int-to-float v5, v3

    .line 67
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 68
    .line 69
    int-to-float v3, v3

    .line 70
    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    .line 71
    .line 72
    int-to-float v6, v4

    .line 73
    const v12, 0x3e23d70a    # 0.16f

    .line 74
    .line 75
    .line 76
    mul-float/2addr v6, v12

    .line 77
    add-float/2addr v6, v3

    .line 78
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 79
    .line 80
    int-to-float v7, v3

    .line 81
    int-to-float v3, v4

    .line 82
    const v13, 0x3f570a3d    # 0.84f

    .line 83
    .line 84
    .line 85
    mul-float v8, v3, v13

    .line 86
    .line 87
    iget-object v3, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 88
    .line 89
    iget-object v11, v3, Ll/zdn0$a;->b:Landroid/graphics/Paint;

    .line 90
    .line 91
    move v10, v9

    .line 92
    move-object/from16 v4, p1

    .line 93
    .line 94
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 95
    .line 96
    .line 97
    iget-object v3, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 98
    .line 99
    invoke-virtual {v3}, Ll/zdn0$a;->b()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_1

    .line 104
    .line 105
    iget-object v3, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 106
    .line 107
    invoke-virtual {v3}, Ll/zdn0$a;->a()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_1

    .line 112
    .line 113
    move-object/from16 v24, v17

    .line 114
    .line 115
    new-instance v17, Landroid/graphics/LinearGradient;

    .line 116
    .line 117
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 118
    .line 119
    int-to-float v3, v3

    .line 120
    iget-object v4, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 121
    .line 122
    invoke-virtual {v4}, Ll/zdn0$a;->b()I

    .line 123
    .line 124
    .line 125
    move-result v22

    .line 126
    iget-object v4, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 127
    .line 128
    invoke-virtual {v4}, Ll/zdn0$a;->a()I

    .line 129
    .line 130
    .line 131
    move-result v23

    .line 132
    const/16 v18, 0x0

    .line 133
    .line 134
    const/16 v19, 0x0

    .line 135
    .line 136
    const/16 v21, 0x0

    .line 137
    .line 138
    move/from16 v20, v3

    .line 139
    .line 140
    invoke-direct/range {v17 .. v24}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 141
    .line 142
    .line 143
    move-object/from16 v3, v17

    .line 144
    .line 145
    iget-object v4, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 146
    .line 147
    iget-object v4, v4, Ll/zdn0$a;->c:Landroid/graphics/Paint;

    .line 148
    .line 149
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 150
    .line 151
    .line 152
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 153
    .line 154
    div-int/lit8 v4, v3, 0x28

    .line 155
    .line 156
    iget-object v5, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 157
    .line 158
    iget-object v5, v5, Ll/zdn0$a;->c:Landroid/graphics/Paint;

    .line 159
    .line 160
    int-to-float v3, v3

    .line 161
    const/high16 v6, 0x41a00000    # 20.0f

    .line 162
    .line 163
    div-float/2addr v3, v6

    .line 164
    invoke-virtual {v5, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 165
    .line 166
    .line 167
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 168
    .line 169
    add-int/2addr v3, v4

    .line 170
    add-int/2addr v3, v2

    .line 171
    int-to-float v5, v3

    .line 172
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 173
    .line 174
    int-to-float v2, v2

    .line 175
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 176
    .line 177
    int-to-float v6, v3

    .line 178
    mul-float/2addr v6, v12

    .line 179
    add-float/2addr v2, v6

    .line 180
    int-to-float v6, v4

    .line 181
    add-float/2addr v2, v6

    .line 182
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 183
    .line 184
    sub-int/2addr v1, v4

    .line 185
    int-to-float v7, v1

    .line 186
    int-to-float v1, v3

    .line 187
    mul-float/2addr v1, v13

    .line 188
    sub-float v8, v1, v6

    .line 189
    .line 190
    iget-object v0, v0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 191
    .line 192
    iget-object v11, v0, Ll/zdn0$a;->c:Landroid/graphics/Paint;

    .line 193
    .line 194
    move v10, v9

    .line 195
    move-object/from16 v4, p1

    .line 196
    .line 197
    move v6, v2

    .line 198
    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 199
    .line 200
    .line 201
    :cond_1
    return-void
.end method

.method public static d(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-eqz p0, :cond_2

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v1, v3, :cond_2

    .line 15
    .line 16
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-static {v3}, Ll/a9g0;->h(C)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x2

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    :goto_1
    const/16 v4, 0x18

    .line 32
    .line 33
    if-gt v2, v4, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    if-eqz p0, :cond_3

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_3
    const-string p0, ""

    .line 54
    .line 55
    return-object p0
.end method

.method public static e(Landroid/graphics/Paint;Ljava/lang/String;I)I
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ll/zdn0;->b(I)Landroid/graphics/Paint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    float-to-int p0, p0

    .line 12
    int-to-float p1, p2

    .line 13
    const/high16 p2, 0x3fc00000    # 1.5f

    .line 14
    .line 15
    mul-float/2addr p1, p2

    .line 16
    float-to-int p1, p1

    .line 17
    add-int/2addr p0, p1

    .line 18
    return p0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget v0, p0, Ll/zdn0;->g:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zdn0$a;->d:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0, p1, v1}, Ll/zdn0;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/zdn0;->f:Landroid/graphics/Rect;

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    new-instance v2, Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Ll/zdn0;->f:Landroid/graphics/Rect;

    .line 25
    .line 26
    :cond_1
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    mul-float/2addr v1, v2

    .line 34
    float-to-int v1, v1

    .line 35
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    int-to-float v3, v3

    .line 40
    mul-float/2addr v3, v2

    .line 41
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    int-to-float v2, v2

    .line 46
    div-float/2addr v3, v2

    .line 47
    int-to-float v2, v1

    .line 48
    mul-float/2addr v3, v2

    .line 49
    float-to-int v2, v3

    .line 50
    iget-object v3, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 51
    .line 52
    iget-object v3, v3, Ll/zdn0$a;->e:Ll/nxp;

    .line 53
    .line 54
    invoke-virtual {v3}, Ll/nxp;->l()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    const/4 v4, 0x0

    .line 59
    if-eqz v3, :cond_2

    .line 60
    .line 61
    move v3, v4

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    sget v3, Ll/zdn0;->i:I

    .line 64
    .line 65
    :goto_0
    iget-object v5, p0, Ll/zdn0;->f:Landroid/graphics/Rect;

    .line 66
    .line 67
    add-int/2addr v2, v3

    .line 68
    invoke-virtual {v5, v3, v4, v2, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/zdn0;->f:Landroid/graphics/Rect;

    .line 75
    .line 76
    iget-object v2, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 77
    .line 78
    iget-object v2, v2, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    .line 79
    .line 80
    const/4 v4, 0x0

    .line 81
    invoke-virtual {p1, v0, v4, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/zdn0;->c:Ljava/lang/String;

    .line 88
    .line 89
    int-to-float v1, v3

    .line 90
    iget-object v2, p0, Ll/zdn0;->f:Landroid/graphics/Rect;

    .line 91
    .line 92
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 93
    .line 94
    int-to-float v2, v2

    .line 95
    const v3, 0x3f8ccccd    # 1.1f

    .line 96
    .line 97
    .line 98
    mul-float/2addr v2, v3

    .line 99
    add-float/2addr v1, v2

    .line 100
    iget v2, p0, Ll/zdn0;->d:F

    .line 101
    .line 102
    iget-object p0, p0, Ll/zdn0;->h:Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/zdn0;->d(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/zdn0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 8
    .line 9
    iget-object v0, v0, Ll/zdn0$a;->e:Ll/nxp;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/nxp;->f()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ll/zdn0;->b(I)Landroid/graphics/Paint;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/zdn0;->h:Landroid/graphics/Paint;

    .line 20
    .line 21
    iget-object v1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 22
    .line 23
    iget-object v1, v1, Ll/zdn0$a;->e:Ll/nxp;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/nxp;->f()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v0, p1, v1}, Ll/zdn0;->e(Landroid/graphics/Paint;Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Ll/zdn0;->g:I

    .line 34
    .line 35
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 36
    .line 37
    iget-object v0, v0, Ll/zdn0$a;->e:Ll/nxp;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/nxp;->f()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p0, v1, v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public g(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/zdn0$a;->e:Ll/nxp;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/nxp;->o(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zdn0$a;->d:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 20
    .line 21
    iget-object p0, p0, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/16 v0, 0xff

    .line 28
    .line 29
    if-ge p0, v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, -0x1

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, -0x3

    .line 35
    return p0
.end method

.method public getRatio()F
    .locals 0

    .line 1
    const p0, 0x40649249

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/zdn0;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/zdn0$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/zdn0$a;-><init>(Ll/zdn0$a;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/zdn0;->e:Z

    .line 22
    .line 23
    :cond_0
    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/zdn0;->h:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget v0, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 8
    .line 9
    neg-float v0, v0

    .line 10
    iget v1, p1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 11
    .line 12
    add-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 14
    .line 15
    iget-object v1, v1, Ll/zdn0$a;->e:Ll/nxp;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/nxp;->f()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    sub-float/2addr v1, v0

    .line 23
    const/high16 v0, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v1, v0

    .line 26
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 27
    .line 28
    sub-float/2addr v1, p1

    .line 29
    iput v1, p0, Ll/zdn0;->d:F

    .line 30
    .line 31
    iget-object p1, p0, Ll/zdn0;->h:Landroid/graphics/Paint;

    .line 32
    .line 33
    iget-object v0, p0, Ll/zdn0;->c:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v1, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 36
    .line 37
    iget-object v1, v1, Ll/zdn0$a;->e:Ll/nxp;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/nxp;->f()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-static {p1, v0, v1}, Ll/zdn0;->e(Landroid/graphics/Paint;Ljava/lang/String;I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Ll/zdn0;->g:I

    .line 48
    .line 49
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 50
    .line 51
    iget-object v0, v0, Ll/zdn0$a;->e:Ll/nxp;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/nxp;->f()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p0, v1, v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 12
    .line 13
    iget-object v0, v0, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zdn0;->b:Ll/zdn0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zdn0$a;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public start()V
    .locals 0

    .line 1
    return-void
.end method

.method public stop()V
    .locals 0

    .line 1
    return-void
.end method
