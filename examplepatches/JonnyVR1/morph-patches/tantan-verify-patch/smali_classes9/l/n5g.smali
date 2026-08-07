.class public Ll/n5g;
.super Ll/ruf0;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n5g$a;
    }
.end annotation


# static fields
.field public static final q:[I

.field public static final r:[F

.field public static final s:I

.field public static final t:I

.field public static final u:I


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/RectF;

.field public final c:Landroid/graphics/Path;

.field public final d:Landroid/graphics/Path;

.field public e:Landroid/graphics/LinearGradient;

.field public f:Landroid/graphics/LinearGradient;

.field public g:Landroid/graphics/LinearGradient;

.field public h:Z

.field public i:Landroid/graphics/ColorMatrix;

.field public j:Ll/n5g$a;

.field public k:Ljava/lang/String;

.field public l:F

.field public m:Z

.field public n:Landroid/graphics/Rect;

.field public o:I

.field public p:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "#00ffffff"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "#55ffffff"

    .line 8
    .line 9
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    filled-new-array {v1, v2, v0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/n5g;->q:[I

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    new-array v1, v0, [F

    .line 25
    .line 26
    fill-array-data v1, :array_0

    .line 27
    .line 28
    .line 29
    sput-object v1, Ll/n5g;->r:[F

    .line 30
    .line 31
    sget v1, Ll/qa00;->o:I

    .line 32
    .line 33
    sput v1, Ll/n5g;->s:I

    .line 34
    .line 35
    div-int/2addr v1, v0

    .line 36
    sput v1, Ll/n5g;->t:I

    .line 37
    .line 38
    sget v0, Ll/qa00;->c:I

    .line 39
    .line 40
    neg-int v0, v0

    .line 41
    sput v0, Ll/n5g;->u:I

    .line 42
    .line 43
    return-void

    .line 44
    nop

    .line 45
    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Ll/n5g$a;)V
    .locals 2

    .line 124
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 125
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Ll/n5g;->a:Landroid/graphics/Paint;

    .line 126
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 127
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 128
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Ll/n5g;->d:Landroid/graphics/Path;

    .line 129
    iput-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 130
    new-instance v0, Landroid/graphics/ColorMatrix;

    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    iput-object v0, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    .line 131
    iget-object p1, p1, Ll/n5g$a;->e:Ll/nxp;

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

    .line 132
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    iget-object p1, p1, Ll/n5g$a;->e:Ll/nxp;

    invoke-virtual {p1}, Ll/nxp;->f()I

    move-result p1

    invoke-static {p1}, Ll/n5g;->b(I)Landroid/graphics/Paint;

    move-result-object p1

    iput-object p1, p0, Ll/n5g;->p:Landroid/graphics/Paint;

    .line 133
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    iget-object p1, p1, Ll/n5g$a;->a:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    iget-object v1, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    invoke-direct {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 134
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    iget-object p1, p1, Ll/n5g$a;->c:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    iget-object v1, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    invoke-direct {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 135
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    iget-object p1, p1, Ll/n5g$a;->b:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    iget-object p0, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    invoke-direct {v0, p0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method

.method public synthetic constructor <init>(Ll/n5g$a;Ll/o5g;)V
    .locals 0

    .line 123
    invoke-direct {p0, p1}, Ll/n5g;-><init>(Ll/n5g$a;)V

    return-void
.end method

.method public constructor <init>(Ll/nxp;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x7

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/n5g;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/Path;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/n5g;->d:Landroid/graphics/Path;

    .line 32
    .line 33
    new-instance v0, Ll/n5g$a;

    .line 34
    .line 35
    invoke-direct {v0, p1, p2}, Ll/n5g$a;-><init>(Ll/nxp;Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 39
    .line 40
    new-instance p2, Landroid/graphics/ColorMatrix;

    .line 41
    .line 42
    invoke-direct {p2}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p2, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/nxp;->h()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "gray"

    .line 52
    .line 53
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 62
    .line 63
    :goto_0
    invoke-virtual {p2, p1}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 67
    .line 68
    iget-object p1, p1, Ll/n5g$a;->e:Ll/nxp;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/nxp;->f()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p1}, Ll/n5g;->b(I)Landroid/graphics/Paint;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Ll/n5g;->p:Landroid/graphics/Paint;

    .line 79
    .line 80
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 81
    .line 82
    iget-object p1, p1, Ll/n5g$a;->a:Landroid/graphics/Paint;

    .line 83
    .line 84
    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    .line 85
    .line 86
    iget-object v0, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    .line 87
    .line 88
    invoke-direct {p2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 95
    .line 96
    iget-object p1, p1, Ll/n5g$a;->c:Landroid/graphics/Paint;

    .line 97
    .line 98
    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    .line 99
    .line 100
    iget-object v0, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    .line 101
    .line 102
    invoke-direct {p2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 109
    .line 110
    iget-object p1, p1, Ll/n5g$a;->b:Landroid/graphics/Paint;

    .line 111
    .line 112
    new-instance p2, Landroid/graphics/ColorMatrixColorFilter;

    .line 113
    .line 114
    iget-object p0, p0, Ll/n5g;->i:Landroid/graphics/ColorMatrix;

    .line 115
    .line 116
    invoke-direct {p2, p0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 120
    .line 121
    .line 122
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
    const v1, 0x3f11eb85    # 0.57f

    .line 19
    .line 20
    .line 21
    mul-float/2addr p0, v1

    .line 22
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static g(Ljava/lang/CharSequence;)Ljava/lang/String;
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

.method public static h(Landroid/graphics/Paint;Ljava/lang/String;I)I
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ll/n5g;->b(I)Landroid/graphics/Paint;

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
    iget v0, p0, Ll/n5g;->o:I

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

.method public final c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 13

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v6, v0

    .line 8
    const/high16 v0, 0x40000000    # 2.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v9

    .line 14
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 15
    .line 16
    add-int/2addr v1, v9

    .line 17
    int-to-float v2, v1

    .line 18
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    int-to-float v4, v3

    .line 24
    const/4 v10, 0x0

    .line 25
    mul-float/2addr v4, v10

    .line 26
    add-float/2addr v1, v4

    .line 27
    iget v4, p2, Landroid/graphics/Rect;->right:I

    .line 28
    .line 29
    int-to-float v4, v4

    .line 30
    int-to-float v3, v3

    .line 31
    const/high16 v11, 0x3f800000    # 1.0f

    .line 32
    .line 33
    mul-float v5, v3, v11

    .line 34
    .line 35
    iget-object v3, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 36
    .line 37
    iget-object v8, v3, Ll/n5g$a;->b:Landroid/graphics/Paint;

    .line 38
    .line 39
    move v7, v6

    .line 40
    move v3, v1

    .line 41
    move-object v1, p1

    .line 42
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/n5g;->d:Landroid/graphics/Path;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/n5g;->d:Landroid/graphics/Path;

    .line 51
    .line 52
    iget v2, p2, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    add-int/2addr v2, v9

    .line 55
    int-to-float v2, v2

    .line 56
    iget v3, p2, Landroid/graphics/Rect;->top:I

    .line 57
    .line 58
    int-to-float v3, v3

    .line 59
    iget v4, p2, Landroid/graphics/Rect;->bottom:I

    .line 60
    .line 61
    int-to-float v5, v4

    .line 62
    mul-float/2addr v5, v10

    .line 63
    add-float/2addr v3, v5

    .line 64
    iget v5, p2, Landroid/graphics/Rect;->right:I

    .line 65
    .line 66
    int-to-float v5, v5

    .line 67
    int-to-float v4, v4

    .line 68
    mul-float/2addr v4, v11

    .line 69
    sget-object v8, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 70
    .line 71
    move v12, v5

    .line 72
    move v5, v4

    .line 73
    move v4, v12

    .line 74
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/n5g$a;->b()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    iget-object v1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/n5g$a;->a()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_0

    .line 92
    .line 93
    iget-object v1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 94
    .line 95
    iget-object v1, v1, Ll/n5g$a;->c:Landroid/graphics/Paint;

    .line 96
    .line 97
    iget v2, p2, Landroid/graphics/Rect;->bottom:I

    .line 98
    .line 99
    int-to-float v2, v2

    .line 100
    const/high16 v3, 0x41a00000    # 20.0f

    .line 101
    .line 102
    div-float/2addr v2, v3

    .line 103
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 104
    .line 105
    .line 106
    iget v1, p2, Landroid/graphics/Rect;->left:I

    .line 107
    .line 108
    add-int/lit8 v1, v1, 0x2

    .line 109
    .line 110
    add-int/2addr v1, v9

    .line 111
    int-to-float v2, v1

    .line 112
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 113
    .line 114
    int-to-float v1, v1

    .line 115
    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    .line 116
    .line 117
    int-to-float v4, v3

    .line 118
    mul-float/2addr v4, v10

    .line 119
    add-float/2addr v1, v4

    .line 120
    add-float/2addr v1, v0

    .line 121
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 122
    .line 123
    add-int/lit8 p2, p2, -0x2

    .line 124
    .line 125
    int-to-float v4, p2

    .line 126
    int-to-float p2, v3

    .line 127
    mul-float/2addr p2, v11

    .line 128
    sub-float v5, p2, v0

    .line 129
    .line 130
    iget-object p0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 131
    .line 132
    iget-object v8, p0, Ll/n5g$a;->c:Landroid/graphics/Paint;

    .line 133
    .line 134
    move v7, v6

    .line 135
    move v3, v1

    .line 136
    move-object v1, p1

    .line 137
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 138
    .line 139
    .line 140
    :cond_0
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    mul-int/lit8 v1, v1, 0xa

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {p0}, Ll/n5g;->e()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    mul-float/2addr v1, v2

    .line 15
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-float v2, v2

    .line 20
    sub-float/2addr v1, v2

    .line 21
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 22
    .line 23
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 24
    .line 25
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 26
    .line 27
    sget v2, Ll/n5g;->s:I

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    add-float/2addr v1, v2

    .line 31
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    int-to-float p2, p2

    .line 41
    iput p2, v0, Landroid/graphics/RectF;->bottom:F

    .line 42
    .line 43
    iget-object p2, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 44
    .line 45
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/graphics/Path;->reset()V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 54
    .line 55
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 56
    .line 57
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 58
    .line 59
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 60
    .line 61
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Path;->moveTo(FF)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 65
    .line 66
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 67
    .line 68
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 69
    .line 70
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 71
    .line 72
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 76
    .line 77
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 78
    .line 79
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 80
    .line 81
    sget v2, Ll/n5g;->t:I

    .line 82
    .line 83
    int-to-float v3, v2

    .line 84
    sub-float/2addr v1, v3

    .line 85
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 86
    .line 87
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 91
    .line 92
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 93
    .line 94
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 95
    .line 96
    int-to-float v2, v2

    .line 97
    sub-float/2addr v1, v2

    .line 98
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 99
    .line 100
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 104
    .line 105
    iget-object v0, p0, Ll/n5g;->b:Landroid/graphics/RectF;

    .line 106
    .line 107
    iget v1, v0, Landroid/graphics/RectF;->left:F

    .line 108
    .line 109
    iget v0, v0, Landroid/graphics/RectF;->top:F

    .line 110
    .line 111
    invoke-virtual {p2, v1, v0}, Landroid/graphics/Path;->lineTo(FF)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 115
    .line 116
    iget-object v0, p0, Ll/n5g;->d:Landroid/graphics/Path;

    .line 117
    .line 118
    sget-object v1, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    .line 119
    .line 120
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Ll/n5g;->c:Landroid/graphics/Path;

    .line 124
    .line 125
    iget-object p0, p0, Ll/n5g;->a:Landroid/graphics/Paint;

    .line 126
    .line 127
    invoke-virtual {p1, p2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n5g$a;->d:Landroid/graphics/Bitmap;

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
    invoke-virtual {p0, p1, v1}, Ll/n5g;->c(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/n5g;->n:Landroid/graphics/Rect;

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
    iput-object v2, p0, Ll/n5g;->n:Landroid/graphics/Rect;

    .line 25
    .line 26
    :cond_1
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    const/high16 v3, 0x3f800000    # 1.0f

    .line 32
    .line 33
    mul-float/2addr v2, v3

    .line 34
    float-to-int v2, v2

    .line 35
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    int-to-float v4, v4

    .line 40
    mul-float/2addr v4, v3

    .line 41
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    div-float/2addr v4, v3

    .line 47
    int-to-float v3, v2

    .line 48
    mul-float/2addr v4, v3

    .line 49
    float-to-int v3, v4

    .line 50
    iget-object v4, p0, Ll/n5g;->n:Landroid/graphics/Rect;

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-virtual {v4, v5, v5, v3, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 57
    .line 58
    .line 59
    iget-boolean v2, p0, Ll/n5g;->h:Z

    .line 60
    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0, p1, v1}, Ll/n5g;->d(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object v1, p0, Ll/n5g;->n:Landroid/graphics/Rect;

    .line 67
    .line 68
    iget-object v2, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 69
    .line 70
    iget-object v2, v2, Ll/n5g$a;->a:Landroid/graphics/Paint;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-virtual {p1, v0, v3, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/n5g;->k:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v1, p0, Ll/n5g;->n:Landroid/graphics/Rect;

    .line 82
    .line 83
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    int-to-float v1, v1

    .line 88
    const v2, 0x3f8ccccd    # 1.1f

    .line 89
    .line 90
    .line 91
    mul-float/2addr v1, v2

    .line 92
    const/4 v2, 0x0

    .line 93
    add-float/2addr v2, v1

    .line 94
    iget v1, p0, Ll/n5g;->l:F

    .line 95
    .line 96
    iget-object p0, p0, Ll/n5g;->p:Landroid/graphics/Paint;

    .line 97
    .line 98
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public e()F
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1388

    .line 6
    .line 7
    rem-long/2addr v0, v2

    .line 8
    long-to-float p0, v0

    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    const v0, 0x459c4000    # 5000.0f

    .line 13
    .line 14
    .line 15
    div-float/2addr p0, v0

    .line 16
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/n5g;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpacity()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n5g$a;->d:Landroid/graphics/Bitmap;

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
    iget-object p0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 20
    .line 21
    iget-object p0, p0, Ll/n5g$a;->a:Landroid/graphics/Paint;

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

.method public i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/n5g;->h:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/n5g;->g(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/n5g;->k:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 8
    .line 9
    iget-object v0, v0, Ll/n5g$a;->e:Ll/nxp;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/nxp;->f()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ll/n5g;->b(I)Landroid/graphics/Paint;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/n5g;->p:Landroid/graphics/Paint;

    .line 20
    .line 21
    iget-object v1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 22
    .line 23
    iget-object v1, v1, Ll/n5g$a;->e:Ll/nxp;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/nxp;->f()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {v0, p1, v1}, Ll/n5g;->h(Landroid/graphics/Paint;Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Ll/n5g;->o:I

    .line 34
    .line 35
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 36
    .line 37
    iget-object v0, v0, Ll/n5g$a;->e:Ll/nxp;

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

.method public k(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/n5g$a;->e:Ll/nxp;

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

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/n5g;->m:Z

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
    new-instance v0, Ll/n5g$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/n5g$a;-><init>(Ll/n5g$a;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/n5g;->m:Z

    .line 22
    .line 23
    :cond_0
    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/n5g;->p:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 8
    .line 9
    neg-float v1, v1

    .line 10
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 11
    .line 12
    add-float/2addr v1, v2

    .line 13
    iget-object v2, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 14
    .line 15
    iget-object v2, v2, Ll/n5g$a;->e:Ll/nxp;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/nxp;->f()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    sub-float/2addr v2, v1

    .line 23
    const/high16 v1, 0x40000000    # 2.0f

    .line 24
    .line 25
    div-float/2addr v2, v1

    .line 26
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 27
    .line 28
    sub-float/2addr v2, v0

    .line 29
    iput v2, p0, Ll/n5g;->l:F

    .line 30
    .line 31
    iget-object v0, p0, Ll/n5g;->p:Landroid/graphics/Paint;

    .line 32
    .line 33
    iget-object v1, p0, Ll/n5g;->k:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v2, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 36
    .line 37
    iget-object v2, v2, Ll/n5g$a;->e:Ll/nxp;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/nxp;->f()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v0, v1, v2}, Ll/n5g;->h(Landroid/graphics/Paint;Ljava/lang/String;I)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Ll/n5g;->o:I

    .line 48
    .line 49
    iget-object v1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 50
    .line 51
    iget-object v1, v1, Ll/n5g$a;->e:Ll/nxp;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/nxp;->f()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-virtual {p0, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/n5g;->e:Landroid/graphics/LinearGradient;

    .line 62
    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 66
    .line 67
    if-lez v0, :cond_0

    .line 68
    .line 69
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 70
    .line 71
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 72
    .line 73
    int-to-float v2, v0

    .line 74
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 75
    .line 76
    int-to-float v4, v0

    .line 77
    sget v0, Ll/n5g;->s:I

    .line 78
    .line 79
    sget v3, Ll/n5g;->t:I

    .line 80
    .line 81
    mul-int/2addr v0, v3

    .line 82
    int-to-float v0, v0

    .line 83
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    .line 84
    .line 85
    int-to-float v3, v3

    .line 86
    div-float v5, v0, v3

    .line 87
    .line 88
    sget-object v6, Ll/n5g;->q:[I

    .line 89
    .line 90
    sget-object v7, Ll/n5g;->r:[F

    .line 91
    .line 92
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 96
    .line 97
    .line 98
    iput-object v1, p0, Ll/n5g;->e:Landroid/graphics/LinearGradient;

    .line 99
    .line 100
    iget-object v0, p0, Ll/n5g;->a:Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 103
    .line 104
    .line 105
    :cond_0
    iget-object v0, p0, Ll/n5g;->f:Landroid/graphics/LinearGradient;

    .line 106
    .line 107
    if-nez v0, :cond_1

    .line 108
    .line 109
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 110
    .line 111
    if-lez v0, :cond_1

    .line 112
    .line 113
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 114
    .line 115
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 116
    .line 117
    int-to-float v5, v0

    .line 118
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/n5g$a;->d()I

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/n5g$a;->c()I

    .line 127
    .line 128
    .line 129
    move-result v7

    .line 130
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 131
    .line 132
    const/4 v2, 0x0

    .line 133
    const/4 v3, 0x0

    .line 134
    const/4 v4, 0x0

    .line 135
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 136
    .line 137
    .line 138
    iput-object v1, p0, Ll/n5g;->f:Landroid/graphics/LinearGradient;

    .line 139
    .line 140
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 141
    .line 142
    iget-object v0, v0, Ll/n5g$a;->b:Landroid/graphics/Paint;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 145
    .line 146
    .line 147
    :cond_1
    iget-object v0, p0, Ll/n5g;->g:Landroid/graphics/LinearGradient;

    .line 148
    .line 149
    if-nez v0, :cond_2

    .line 150
    .line 151
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 152
    .line 153
    if-lez v0, :cond_2

    .line 154
    .line 155
    new-instance v1, Landroid/graphics/LinearGradient;

    .line 156
    .line 157
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 158
    .line 159
    int-to-float v4, p1

    .line 160
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 161
    .line 162
    invoke-virtual {p1}, Ll/n5g$a;->b()I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    iget-object p1, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 167
    .line 168
    invoke-virtual {p1}, Ll/n5g$a;->a()I

    .line 169
    .line 170
    .line 171
    move-result v7

    .line 172
    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 173
    .line 174
    const/4 v2, 0x0

    .line 175
    const/4 v3, 0x0

    .line 176
    const/4 v5, 0x0

    .line 177
    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 178
    .line 179
    .line 180
    iput-object v1, p0, Ll/n5g;->g:Landroid/graphics/LinearGradient;

    .line 181
    .line 182
    iget-object p0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 183
    .line 184
    iget-object p0, p0, Ll/n5g$a;->c:Landroid/graphics/Paint;

    .line 185
    .line 186
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 187
    .line 188
    .line 189
    :cond_2
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n5g$a;->a:Landroid/graphics/Paint;

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
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 12
    .line 13
    iget-object v0, v0, Ll/n5g$a;->a:Landroid/graphics/Paint;

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
    iget-object v0, p0, Ll/n5g;->j:Ll/n5g$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n5g$a;->a:Landroid/graphics/Paint;

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
