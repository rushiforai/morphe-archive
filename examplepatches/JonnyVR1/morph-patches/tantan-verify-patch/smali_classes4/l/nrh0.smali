.class public Ll/nrh0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final a:I

.field protected final b:F

.field protected final c:F

.field private d:I

.field e:I

.field private f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/nrh0;->h:Ljava/util/List;

    .line 7
    .line 8
    const-string v1, "multilaser"

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    const-string v1, "ms40"

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x5a

    .line 5
    .line 6
    iput v0, p0, Ll/nrh0;->a:I

    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    iput v0, p0, Ll/nrh0;->b:F

    .line 11
    .line 12
    const/high16 v0, 0x40000000    # 2.0f

    .line 13
    .line 14
    iput v0, p0, Ll/nrh0;->c:F

    .line 15
    .line 16
    iput p1, p0, Ll/nrh0;->d:I

    .line 17
    .line 18
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/nrh0;->f:Ljava/util/List;

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/nrh0;->g:Ljava/util/List;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a(IIFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIFIII",
            "Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;",
            ")",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation

    .line 1
    const/high16 v4, 0x42b40000    # 90.0f

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-virtual/range {v0 .. v8}, Ll/nrh0;->c(IIFFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p0, Ll/nrh0;->f:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-lez p2, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Ll/nrh0;->f:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p2, p0, Ll/nrh0;->f:Ljava/util/List;

    .line 30
    .line 31
    new-instance p3, Landroid/hardware/Camera$Area;

    .line 32
    .line 33
    const/16 p4, 0x3e8

    .line 34
    .line 35
    invoke-direct {p3, p1, p4}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/nrh0;->f:Ljava/util/List;

    .line 42
    .line 43
    return-object p0
.end method

.method public b(IIFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIFIII",
            "Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;",
            ")",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation

    .line 1
    const/high16 v4, 0x43340000    # 180.0f

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-virtual/range {v0 .. v8}, Ll/nrh0;->c(IIFFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p0, Ll/nrh0;->g:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-lez p2, :cond_0

    .line 23
    .line 24
    iget-object p2, p0, Ll/nrh0;->g:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p2, p0, Ll/nrh0;->g:Ljava/util/List;

    .line 30
    .line 31
    new-instance p3, Landroid/hardware/Camera$Area;

    .line 32
    .line 33
    const/16 p4, 0x3e8

    .line 34
    .line 35
    invoke-direct {p3, p1, p4}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/nrh0;->g:Ljava/util/List;

    .line 42
    .line 43
    return-object p0
.end method

.method public c(IIFFIIILcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)Landroid/graphics/Rect;
    .locals 2

    .line 1
    mul-float/2addr p3, p4

    .line 2
    const/high16 p4, 0x3f000000    # 0.5f

    .line 3
    .line 4
    add-float/2addr p3, p4

    .line 5
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p3}, Ljava/lang/Float;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    mul-int/lit16 p5, p5, 0x7d0

    .line 14
    .line 15
    int-to-float p4, p5

    .line 16
    const/high16 p5, 0x3f800000    # 1.0f

    .line 17
    .line 18
    mul-float/2addr p4, p5

    .line 19
    int-to-float p1, p1

    .line 20
    div-float/2addr p4, p1

    .line 21
    float-to-int p1, p4

    .line 22
    const/16 p4, 0x3e8

    .line 23
    .line 24
    sub-int/2addr p1, p4

    .line 25
    mul-int/lit16 p6, p6, 0x7d0

    .line 26
    .line 27
    int-to-float p6, p6

    .line 28
    mul-float/2addr p6, p5

    .line 29
    int-to-float p2, p2

    .line 30
    div-float/2addr p6, p2

    .line 31
    float-to-int p2, p6

    .line 32
    sub-int/2addr p2, p4

    .line 33
    iget p0, p0, Ll/nrh0;->e:I

    .line 34
    .line 35
    const/4 p5, 0x1

    .line 36
    if-ne p0, p5, :cond_0

    .line 37
    .line 38
    sget-object p0, Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;->VIEW:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 39
    .line 40
    if-ne p8, p0, :cond_0

    .line 41
    .line 42
    neg-int p1, p1

    .line 43
    :cond_0
    div-int/lit8 p0, p3, 0x2

    .line 44
    .line 45
    sub-int/2addr p1, p0

    .line 46
    const/16 p5, -0x3e8

    .line 47
    .line 48
    invoke-static {p1, p5, p4}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    sub-int/2addr p2, p0

    .line 53
    invoke-static {p2, p5, p4}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    new-instance p2, Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance p6, Landroid/graphics/RectF;

    .line 63
    .line 64
    int-to-float v0, p1

    .line 65
    int-to-float v1, p0

    .line 66
    add-int/2addr p1, p3

    .line 67
    invoke-static {p1}, Lcom/ss/android/ttvecamera/f;->d(I)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-float p1, p1

    .line 72
    add-int/2addr p0, p3

    .line 73
    invoke-static {p0}, Lcom/ss/android/ttvecamera/f;->d(I)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    int-to-float p0, p0

    .line 78
    invoke-direct {p6, v0, v1, p1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Landroid/graphics/Rect;

    .line 82
    .line 83
    iget p1, p6, Landroid/graphics/RectF;->left:F

    .line 84
    .line 85
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iget p3, p6, Landroid/graphics/RectF;->top:F

    .line 90
    .line 91
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 92
    .line 93
    .line 94
    move-result p3

    .line 95
    iget v0, p6, Landroid/graphics/RectF;->right:F

    .line 96
    .line 97
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget p6, p6, Landroid/graphics/RectF;->bottom:F

    .line 102
    .line 103
    invoke-static {p6}, Ljava/lang/Math;->round(F)I

    .line 104
    .line 105
    .line 106
    move-result p6

    .line 107
    invoke-direct {p0, p1, p3, v0, p6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 108
    .line 109
    .line 110
    new-instance p1, Landroid/graphics/Rect;

    .line 111
    .line 112
    invoke-direct {p1, p5, p5, p4, p4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 113
    .line 114
    .line 115
    sget-object p3, Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;->VIEW:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 116
    .line 117
    if-ne p8, p3, :cond_1

    .line 118
    .line 119
    invoke-static {p7, p1, p0}, Lcom/ss/android/ttvecamera/f;->w(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 120
    .line 121
    .line 122
    new-instance p2, Landroid/graphics/Rect;

    .line 123
    .line 124
    iget p1, p0, Landroid/graphics/Rect;->left:I

    .line 125
    .line 126
    sub-int/2addr p1, p4

    .line 127
    iget p3, p0, Landroid/graphics/Rect;->top:I

    .line 128
    .line 129
    sub-int/2addr p3, p4

    .line 130
    iget p5, p0, Landroid/graphics/Rect;->right:I

    .line 131
    .line 132
    sub-int/2addr p5, p4

    .line 133
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 134
    .line 135
    sub-int/2addr p0, p4

    .line 136
    invoke-direct {p2, p1, p3, p5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    sget-object p1, Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;->ORIGINAL_FRAME:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 141
    .line 142
    if-ne p8, p1, :cond_2

    .line 143
    .line 144
    new-instance p2, Landroid/graphics/Rect;

    .line 145
    .line 146
    iget p1, p0, Landroid/graphics/Rect;->left:I

    .line 147
    .line 148
    iget p3, p0, Landroid/graphics/Rect;->top:I

    .line 149
    .line 150
    iget p4, p0, Landroid/graphics/Rect;->right:I

    .line 151
    .line 152
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 153
    .line 154
    invoke-direct {p2, p1, p3, p4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 155
    .line 156
    .line 157
    :cond_2
    :goto_0
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 158
    .line 159
    invoke-static {p0}, Lcom/ss/android/ttvecamera/f;->d(I)I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    iput p0, p2, Landroid/graphics/Rect;->left:I

    .line 164
    .line 165
    iget p0, p2, Landroid/graphics/Rect;->right:I

    .line 166
    .line 167
    invoke-static {p0}, Lcom/ss/android/ttvecamera/f;->d(I)I

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    iput p0, p2, Landroid/graphics/Rect;->right:I

    .line 172
    .line 173
    iget p0, p2, Landroid/graphics/Rect;->top:I

    .line 174
    .line 175
    invoke-static {p0}, Lcom/ss/android/ttvecamera/f;->d(I)I

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    iput p0, p2, Landroid/graphics/Rect;->top:I

    .line 180
    .line 181
    iget p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 182
    .line 183
    invoke-static {p0}, Lcom/ss/android/ttvecamera/f;->d(I)I

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    iput p0, p2, Landroid/graphics/Rect;->bottom:I

    .line 188
    .line 189
    return-object p2
.end method

.method public d(Landroid/hardware/Camera$Parameters;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/nrh0;->h:Ljava/util/List;

    .line 4
    .line 5
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public e(Landroid/hardware/Camera$Parameters;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nrh0;->d(Landroid/hardware/Camera$Parameters;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public f(ILandroid/hardware/Camera$Parameters;)Z
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/hardware/Camera$Parameters;->getMaxNumMeteringAreas()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public g(ILandroid/hardware/Camera$Parameters;Z)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iput p1, p0, Ll/nrh0;->e:I

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 p2, 0x1

    .line 13
    const-string v1, "auto"

    .line 14
    .line 15
    const-string v2, "continuous-video"

    .line 16
    .line 17
    if-ne p1, p2, :cond_3

    .line 18
    .line 19
    if-eqz p3, :cond_1

    .line 20
    .line 21
    invoke-interface {p0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    return-object v2

    .line 28
    :cond_1
    const-string p1, "macro"

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_2

    .line 35
    .line 36
    return-object p1

    .line 37
    :cond_2
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_6

    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_3
    invoke-interface {p0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    return-object v2

    .line 51
    :cond_4
    const-string p1, "continuous-picture"

    .line 52
    .line 53
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_5

    .line 58
    .line 59
    return-object p1

    .line 60
    :cond_5
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    return-object v1

    .line 67
    :cond_6
    return-object v0
.end method
