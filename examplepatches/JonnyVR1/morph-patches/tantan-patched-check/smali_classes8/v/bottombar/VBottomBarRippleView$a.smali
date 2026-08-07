.class public Lv/bottombar/VBottomBarRippleView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/bottombar/VBottomBarRippleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final e:Landroid/graphics/Paint;

.field public static final f:Landroid/graphics/Xfermode;


# instance fields
.field public a:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public b:[I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public c:[F

.field public d:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lv/bottombar/VBottomBarRippleView$a;->e:Landroid/graphics/Paint;

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 10
    .line 11
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lv/bottombar/VBottomBarRippleView$a;->f:Landroid/graphics/Xfermode;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/z8c0;->f:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lv/bottombar/VBottomBarRippleView$a;->a:I

    .line 19
    .line 20
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/z8c0;->g:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/z8c0;->h:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget v3, Ll/z8c0;->i:I

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    sget v4, Ll/z8c0;->j:I

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    filled-new-array {v0, v1, v2, v3}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lv/bottombar/VBottomBarRippleView$a;->b:[I

    .line 81
    .line 82
    const/4 v0, 0x4

    .line 83
    new-array v0, v0, [F

    .line 84
    .line 85
    fill-array-data v0, :array_0

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lv/bottombar/VBottomBarRippleView$a;->c:[F

    .line 89
    .line 90
    new-instance v0, Landroid/graphics/RectF;

    .line 91
    .line 92
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 96
    .line 97
    return-void

    .line 98
    nop

    .line 99
    :array_0
    .array-data 4
        0x0
        0x3e8f5c29    # 0.28f
        0x3f1eb852    # 0.62f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public synthetic constructor <init>(Ll/kok0;)V
    .locals 0

    .line 99
    invoke-direct {p0}, Lv/bottombar/VBottomBarRippleView$a;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lv/bottombar/VBottomBarRippleView$a;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic b(Lv/bottombar/VBottomBarRippleView$a;Landroid/graphics/Canvas;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBarRippleView$a;->d(Landroid/graphics/Canvas;F)V

    return-void
.end method

.method public static bridge synthetic c()Landroid/graphics/Paint;
    .locals 1

    .line 1
    sget-object v0, Lv/bottombar/VBottomBarRippleView$a;->e:Landroid/graphics/Paint;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/graphics/Canvas;F)V
    .locals 12

    .line 1
    sget-object v0, Lv/bottombar/VBottomBarRippleView$a;->e:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget-object v1, Lv/bottombar/VBottomBarRippleView$a;->f:Landroid/graphics/Xfermode;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    cmpl-float v1, v1, v2

    .line 26
    .line 27
    if-lez v1, :cond_1

    .line 28
    .line 29
    const v1, 0x3f4ccccd    # 0.8f

    .line 30
    .line 31
    .line 32
    cmpg-float v1, p2, v1

    .line 33
    .line 34
    if-gez v1, :cond_0

    .line 35
    .line 36
    new-instance v3, Landroid/graphics/RadialGradient;

    .line 37
    .line 38
    iget-object v1, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/high16 v4, 0x40000000    # 2.0f

    .line 45
    .line 46
    div-float/2addr v1, v4

    .line 47
    iget-object v5, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    const/high16 v6, 0x40800000    # 4.0f

    .line 54
    .line 55
    mul-float/2addr v5, v6

    .line 56
    const/high16 v6, 0x40a00000    # 5.0f

    .line 57
    .line 58
    div-float/2addr v5, v6

    .line 59
    iget-object v6, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 60
    .line 61
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    iget-object v7, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 66
    .line 67
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    const v7, 0x3c23d70a    # 0.01f

    .line 76
    .line 77
    .line 78
    add-float/2addr v7, p2

    .line 79
    mul-float/2addr v6, v7

    .line 80
    mul-float/2addr v6, v4

    .line 81
    iget v7, p0, Lv/bottombar/VBottomBarRippleView$a;->a:I

    .line 82
    .line 83
    const/4 v8, 0x0

    .line 84
    filled-new-array {v7, v7, v8}, [I

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    div-float/2addr p2, v4

    .line 89
    const/4 v4, 0x3

    .line 90
    new-array v4, v4, [F

    .line 91
    .line 92
    aput v2, v4, v8

    .line 93
    .line 94
    const/4 v2, 0x1

    .line 95
    aput p2, v4, v2

    .line 96
    .line 97
    const/high16 p2, 0x3f800000    # 1.0f

    .line 98
    .line 99
    const/4 v2, 0x2

    .line 100
    aput p2, v4, v2

    .line 101
    .line 102
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 103
    .line 104
    move-object v8, v4

    .line 105
    move v4, v1

    .line 106
    invoke-direct/range {v3 .. v9}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_0
    new-instance v4, Landroid/graphics/LinearGradient;

    .line 114
    .line 115
    iget-object p2, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 116
    .line 117
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    iget-object p2, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 122
    .line 123
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    iget-object v9, p0, Lv/bottombar/VBottomBarRippleView$a;->b:[I

    .line 128
    .line 129
    iget-object v10, p0, Lv/bottombar/VBottomBarRippleView$a;->c:[F

    .line 130
    .line 131
    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 132
    .line 133
    const/4 v5, 0x0

    .line 134
    const/4 v8, 0x0

    .line 135
    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 139
    .line 140
    .line 141
    :goto_0
    iget-object p2, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 142
    .line 143
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    iget-object v1, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 148
    .line 149
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    iget-object v2, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 154
    .line 155
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    iget-object p0, p0, Lv/bottombar/VBottomBarRippleView$a;->d:Landroid/graphics/RectF;

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    invoke-virtual {p1, p2, v1, p0, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 170
    .line 171
    .line 172
    :cond_1
    return-void
.end method

.method public e(I[I[F)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p2    # [I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p3    # [F
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lv/bottombar/VBottomBarRippleView$a;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Lv/bottombar/VBottomBarRippleView$a;->b:[I

    .line 4
    .line 5
    iput-object p3, p0, Lv/bottombar/VBottomBarRippleView$a;->c:[F

    .line 6
    .line 7
    return-void
.end method
