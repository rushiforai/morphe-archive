.class public Lcom/idv/identity/face/ui/widget/EllipseHoleView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# static fields
.field private static final K:Landroid/graphics/Xfermode;


# instance fields
.field private A:I

.field private B:Z

.field private C:I

.field private D:Landroid/os/Handler;

.field private E:Z

.field private F:Ljava/lang/Runnable;

.field private G:F

.field private H:F

.field private I:Z

.field J:Z

.field private c:Landroid/graphics/Bitmap;

.field private d:Landroid/graphics/Paint;

.field private e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field private j:Z

.field private k:Z

.field private l:I

.field private m:F

.field private n:F

.field private o:F

.field protected p:I

.field protected q:I

.field protected r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:Landroid/graphics/RectF;

.field public x:Landroid/graphics/BitmapShader;

.field private y:Landroid/graphics/SweepGradient;

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->XOR:Landroid/graphics/PorterDuff$Mode;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->K:Landroid/graphics/Xfermode;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->t()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 73
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->q(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->t()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p3, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->f:F

    .line 7
    .line 8
    iput p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->g:F

    .line 9
    .line 10
    iput p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 11
    .line 12
    iput p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->j:Z

    .line 16
    .line 17
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->k:Z

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    iput v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->l:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->m:F

    .line 24
    .line 25
    iput v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->n:F

    .line 26
    .line 27
    iput p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->v:I

    .line 28
    .line 29
    new-instance v2, Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 35
    .line 36
    iput v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->C:I

    .line 37
    .line 38
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->E:Z

    .line 39
    .line 40
    new-instance v0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;-><init>(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->F:Ljava/lang/Runnable;

    .line 46
    .line 47
    iput v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->G:F

    .line 48
    .line 49
    iput v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->H:F

    .line 50
    .line 51
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->I:Z

    .line 52
    .line 53
    iput-boolean p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->J:Z

    .line 54
    .line 55
    new-instance p3, Landroid/os/Handler;

    .line 56
    .line 57
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-direct {p3, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 62
    .line 63
    .line 64
    iput-object p3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->D:Landroid/os/Handler;

    .line 65
    .line 66
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->q(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->t()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic d(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->E:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->D:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Ll/pte;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Lcom/idv/identity/face/ui/widget/EllipseHoleView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->I:Z

    .line 2
    .line 3
    return p1
.end method

.method private q(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    sget-object v0, Ll/dhc0;->h:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p2, Ll/dhc0;->n:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->f:F

    .line 17
    .line 18
    sget p2, Ll/dhc0;->o:I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->g:F

    .line 25
    .line 26
    sget p2, Ll/dhc0;->q:I

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 33
    .line 34
    sget p2, Ll/dhc0;->m:I

    .line 35
    .line 36
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 41
    .line 42
    sget p2, Ll/dhc0;->l:I

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->j:Z

    .line 50
    .line 51
    sget p2, Ll/dhc0;->p:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->k:Z

    .line 58
    .line 59
    sget p2, Ll/dhc0;->v:I

    .line 60
    .line 61
    const/high16 v1, 0x40a00000    # 5.0f

    .line 62
    .line 63
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 68
    .line 69
    sget p2, Ll/dhc0;->t:I

    .line 70
    .line 71
    const/high16 v1, -0x10000

    .line 72
    .line 73
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->p:I

    .line 78
    .line 79
    sget p2, Ll/dhc0;->x:I

    .line 80
    .line 81
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->v:I

    .line 86
    .line 87
    sget p2, Ll/dhc0;->k:I

    .line 88
    .line 89
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->z:I

    .line 94
    .line 95
    sget p2, Ll/dhc0;->j:I

    .line 96
    .line 97
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->A:I

    .line 102
    .line 103
    sget p2, Ll/dhc0;->s:I

    .line 104
    .line 105
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    iput-boolean p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->B:Z

    .line 110
    .line 111
    sget p2, Ll/dhc0;->u:I

    .line 112
    .line 113
    const v1, -0xff0100

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->q:I

    .line 121
    .line 122
    sget p2, Ll/dhc0;->w:I

    .line 123
    .line 124
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->r:I

    .line 129
    .line 130
    sget p2, Ll/dhc0;->i:I

    .line 131
    .line 132
    const/16 v0, 0x168

    .line 133
    .line 134
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->s:I

    .line 139
    .line 140
    sget p2, Ll/dhc0;->r:I

    .line 141
    .line 142
    const/16 v0, 0x64

    .line 143
    .line 144
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    iput p2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->u:I

    .line 149
    .line 150
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 151
    .line 152
    .line 153
    :cond_0
    return-void
.end method

.method private s(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->p:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 16
    .line 17
    const/16 v1, 0x80

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->x:Landroid/graphics/BitmapShader;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 40
    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->B:Z

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->z:I

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->A:I

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->y:Landroid/graphics/SweepGradient;

    .line 56
    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    new-instance v3, Landroid/graphics/SweepGradient;

    .line 68
    .line 69
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->z:I

    .line 70
    .line 71
    iget v5, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->A:I

    .line 72
    .line 73
    filled-new-array {v4, v5}, [I

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-direct {v3, v0, v2, v4, v1}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 78
    .line 79
    .line 80
    iput-object v3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->y:Landroid/graphics/SweepGradient;

    .line 81
    .line 82
    new-instance v3, Landroid/graphics/Matrix;

    .line 83
    .line 84
    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 85
    .line 86
    .line 87
    const/high16 v4, 0x42b40000    # 90.0f

    .line 88
    .line 89
    invoke-virtual {v3, v4, v0, v2}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->y:Landroid/graphics/SweepGradient;

    .line 93
    .line 94
    invoke-virtual {v0, v3}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->y:Landroid/graphics/SweepGradient;

    .line 98
    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 102
    .line 103
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 107
    .line 108
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->q:I

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 111
    .line 112
    .line 113
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->t:I

    .line 114
    .line 115
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->s:I

    .line 116
    .line 117
    iget v3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->r:I

    .line 118
    .line 119
    sub-int/2addr v2, v3

    .line 120
    mul-int/2addr v0, v2

    .line 121
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getMax()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    div-int/2addr v0, v2

    .line 126
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->r:I

    .line 127
    .line 128
    int-to-float v5, v2

    .line 129
    int-to-float v6, v0

    .line 130
    const/4 v7, 0x0

    .line 131
    iget-object v8, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 132
    .line 133
    move-object v3, p1

    .line 134
    move-object v4, p2

    .line 135
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 139
    .line 140
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method private t()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public declared-synchronized getMax()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->u:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized getProgress()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->t:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public getRectF()Landroid/graphics/RectF;
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->f:F

    .line 12
    .line 13
    const/high16 v3, -0x40800000    # -1.0f

    .line 14
    .line 15
    cmpl-float v4, v2, v3

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    if-lez v4, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v2, v5

    .line 22
    :goto_0
    iget-boolean v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->j:Z

    .line 23
    .line 24
    const/high16 v6, 0x40000000    # 2.0f

    .line 25
    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    div-float v2, v0, v6

    .line 29
    .line 30
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 31
    .line 32
    div-float/2addr v4, v6

    .line 33
    sub-float/2addr v2, v4

    .line 34
    cmpg-float v4, v2, v5

    .line 35
    .line 36
    if-gez v4, :cond_1

    .line 37
    .line 38
    move v2, v5

    .line 39
    :cond_1
    sub-float v4, v1, v0

    .line 40
    .line 41
    div-float/2addr v4, v6

    .line 42
    iget v7, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->g:F

    .line 43
    .line 44
    cmpl-float v8, v7, v3

    .line 45
    .line 46
    if-lez v8, :cond_2

    .line 47
    .line 48
    move v4, v7

    .line 49
    :cond_2
    iget-boolean v7, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->k:Z

    .line 50
    .line 51
    if-eqz v7, :cond_4

    .line 52
    .line 53
    div-float/2addr v1, v6

    .line 54
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 55
    .line 56
    div-float/2addr v4, v6

    .line 57
    sub-float/2addr v1, v4

    .line 58
    cmpg-float v4, v1, v5

    .line 59
    .line 60
    if-gez v4, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    move v5, v1

    .line 64
    goto :goto_1

    .line 65
    :cond_4
    move v5, v4

    .line 66
    :goto_1
    iget v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 67
    .line 68
    cmpl-float v4, v1, v3

    .line 69
    .line 70
    if-lez v4, :cond_5

    .line 71
    .line 72
    add-float/2addr v1, v2

    .line 73
    goto :goto_2

    .line 74
    :cond_5
    move v1, v0

    .line 75
    :goto_2
    add-float/2addr v0, v5

    .line 76
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 77
    .line 78
    cmpl-float v3, v4, v3

    .line 79
    .line 80
    if-lez v3, :cond_6

    .line 81
    .line 82
    add-float v0, v5, v4

    .line 83
    .line 84
    :cond_6
    iget-object v3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 85
    .line 86
    invoke-virtual {v3, v2, v5, v1, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 90
    .line 91
    return-object p0
.end method

.method public invalidate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->e:Ljava/lang/ref/WeakReference;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->c:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-super {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j(Landroid/animation/Animator$AnimatorListener;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    const v3, 0x3f333333    # 0.7f

    .line 13
    .line 14
    .line 15
    mul-float/2addr v0, v3

    .line 16
    cmpl-float v4, v2, v0

    .line 17
    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 21
    .line 22
    int-to-float v5, v1

    .line 23
    mul-float/2addr v5, v3

    .line 24
    cmpl-float v4, v4, v5

    .line 25
    .line 26
    if-nez v4, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-interface {p1, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 v4, 0x2

    .line 34
    new-array v5, v4, [F

    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    aput v2, v5, v6

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    aput v0, v5, v2

    .line 41
    .line 42
    const-string v0, "widthAttr"

    .line 43
    .line 44
    invoke-static {v0, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget v5, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 49
    .line 50
    int-to-float v1, v1

    .line 51
    mul-float/2addr v1, v3

    .line 52
    new-array v3, v4, [F

    .line 53
    .line 54
    aput v5, v3, v6

    .line 55
    .line 56
    aput v1, v3, v2

    .line 57
    .line 58
    const-string v1, "heightAttr"

    .line 59
    .line 60
    invoke-static {v1, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {v0, v1}, [Landroid/animation/PropertyValuesHolder;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 73
    .line 74
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 78
    .line 79
    .line 80
    const-wide/16 v1, 0x3e8

    .line 81
    .line 82
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 89
    .line 90
    .line 91
    iget p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 92
    .line 93
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->G:F

    .line 94
    .line 95
    iget p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 96
    .line 97
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->H:F

    .line 98
    .line 99
    return-void
.end method

.method public k(Landroid/animation/Animator$AnimatorListener;)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->I:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    int-to-float v1, v1

    .line 13
    const v3, 0x3ee66666    # 0.45f

    .line 14
    .line 15
    .line 16
    mul-float/2addr v1, v3

    .line 17
    int-to-float v2, v2

    .line 18
    mul-float/2addr v2, v3

    .line 19
    iget v3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 20
    .line 21
    const/4 v4, 0x2

    .line 22
    new-array v5, v4, [F

    .line 23
    .line 24
    const/4 v6, 0x0

    .line 25
    aput v3, v5, v6

    .line 26
    .line 27
    aput v1, v5, v0

    .line 28
    .line 29
    const-string v1, "widthAttr"

    .line 30
    .line 31
    invoke-static {v1, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget v3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 36
    .line 37
    new-array v4, v4, [F

    .line 38
    .line 39
    aput v3, v4, v6

    .line 40
    .line 41
    aput v2, v4, v0

    .line 42
    .line 43
    const-string v0, "heightAttr"

    .line 44
    .line 45
    invoke-static {v0, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 50
    .line 51
    iput v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->G:F

    .line 52
    .line 53
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 54
    .line 55
    iput v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->H:F

    .line 56
    .line 57
    filled-new-array {v1, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 66
    .line 67
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Lcom/idv/identity/face/ui/widget/EllipseHoleView$b;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView$b;-><init>(Lcom/idv/identity/face/ui/widget/EllipseHoleView;Landroid/animation/Animator$AnimatorListener;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 79
    .line 80
    .line 81
    if-eqz p1, :cond_0

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    const-wide/16 v1, 0x3e8

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 92
    .line 93
    .line 94
    iget p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 95
    .line 96
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->G:F

    .line 97
    .line 98
    iget p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 99
    .line 100
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->H:F

    .line 101
    .line 102
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->m(Landroid/animation/Animator$AnimatorListener;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m(Landroid/animation/Animator$AnimatorListener;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v0, v0

    .line 10
    const v2, 0x3f35c28f    # 0.71f

    .line 11
    .line 12
    .line 13
    mul-float/2addr v0, v2

    .line 14
    int-to-float v1, v1

    .line 15
    mul-float/2addr v1, v2

    .line 16
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 17
    .line 18
    const/4 v3, 0x2

    .line 19
    new-array v4, v3, [F

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    aput v2, v4, v5

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    aput v0, v4, v2

    .line 26
    .line 27
    const-string v0, "widthAttr"

    .line 28
    .line 29
    invoke-static {v0, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 34
    .line 35
    new-array v3, v3, [F

    .line 36
    .line 37
    aput v4, v3, v5

    .line 38
    .line 39
    aput v1, v3, v2

    .line 40
    .line 41
    const-string v1, "heightAttr"

    .line 42
    .line 43
    invoke-static {v1, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    filled-new-array {v0, v1}, [Landroid/animation/PropertyValuesHolder;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {p0, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 56
    .line 57
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    const-wide/16 v1, 0x3e8

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 74
    .line 75
    .line 76
    iget p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 77
    .line 78
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->G:F

    .line 79
    .line 80
    iget p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 81
    .line 82
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->H:F

    .line 83
    .line 84
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->l:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v4, v0

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v5, v0

    .line 17
    const/4 v6, 0x0

    .line 18
    const/16 v7, 0x1f

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x0

    .line 22
    move-object v1, p1

    .line 23
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->e:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/graphics/Bitmap;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object p0, v0

    .line 41
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_0
    move-object v0, v2

    .line 44
    :goto_0
    const/4 v3, 0x0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_4

    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    if-eqz v4, :cond_4

    .line 58
    .line 59
    :try_start_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 68
    .line 69
    invoke-static {v0, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    :try_start_2
    new-instance v5, Landroid/graphics/Canvas;

    .line 74
    .line 75
    invoke-direct {v5, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    const/4 v8, 0x0

    .line 87
    invoke-virtual {v4, v8, v8, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 91
    .line 92
    .line 93
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->c:Landroid/graphics/Bitmap;

    .line 94
    .line 95
    if-eqz v4, :cond_2

    .line 96
    .line 97
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-eqz v4, :cond_3

    .line 102
    .line 103
    :cond_2
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->p()Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iput-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->c:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    :cond_3
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {v4}, Landroid/graphics/Paint;->reset()V

    .line 112
    .line 113
    .line 114
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 115
    .line 116
    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 117
    .line 118
    .line 119
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 120
    .line 121
    sget-object v6, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->K:Landroid/graphics/Xfermode;

    .line 122
    .line 123
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 124
    .line 125
    .line 126
    iget v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->l:I

    .line 127
    .line 128
    invoke-virtual {v5, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->c:Landroid/graphics/Bitmap;

    .line 132
    .line 133
    iget-object v6, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 134
    .line 135
    invoke-virtual {v5, v4, v3, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    new-instance v4, Ljava/lang/ref/WeakReference;

    .line 139
    .line 140
    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    iput-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->e:Ljava/lang/ref/WeakReference;

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :catch_0
    invoke-static {}, Ljava/lang/System;->gc()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_4
    :goto_1
    if-eqz v0, :cond_5

    .line 154
    .line 155
    :try_start_3
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 156
    .line 157
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 161
    .line 162
    invoke-virtual {v1, v0, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 163
    .line 164
    .line 165
    :cond_5
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 166
    .line 167
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->p:I

    .line 168
    .line 169
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 173
    .line 174
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 175
    .line 176
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 180
    .line 181
    iget v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 187
    .line 188
    const/4 v2, 0x1

    .line 189
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d:Landroid/graphics/Paint;

    .line 193
    .line 194
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 195
    .line 196
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getRectF()Landroid/graphics/RectF;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    iget v2, v2, Landroid/graphics/RectF;->left:F

    .line 206
    .line 207
    iget v3, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 208
    .line 209
    const/high16 v4, 0x40000000    # 2.0f

    .line 210
    .line 211
    div-float/2addr v3, v4

    .line 212
    sub-float/2addr v2, v3

    .line 213
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getRectF()Landroid/graphics/RectF;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    iget v3, v3, Landroid/graphics/RectF;->top:F

    .line 218
    .line 219
    iget v5, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 220
    .line 221
    div-float/2addr v5, v4

    .line 222
    sub-float/2addr v3, v5

    .line 223
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getRectF()Landroid/graphics/RectF;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    iget v5, v5, Landroid/graphics/RectF;->right:F

    .line 228
    .line 229
    iget v6, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 230
    .line 231
    div-float/2addr v6, v4

    .line 232
    add-float/2addr v5, v6

    .line 233
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getRectF()Landroid/graphics/RectF;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    .line 238
    .line 239
    iget v7, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 240
    .line 241
    div-float/2addr v7, v4

    .line 242
    add-float/2addr v6, v7

    .line 243
    invoke-virtual {v0, v2, v3, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 244
    .line 245
    .line 246
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->v:I

    .line 247
    .line 248
    if-eqz v0, :cond_6

    .line 249
    .line 250
    goto :goto_2

    .line 251
    :cond_6
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 252
    .line 253
    invoke-direct {p0, v1, v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->s(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 254
    .line 255
    .line 256
    :catch_1
    :goto_2
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 257
    .line 258
    .line 259
    goto :goto_4

    .line 260
    :goto_3
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 261
    .line 262
    .line 263
    throw p0

    .line 264
    :goto_4
    return-void

    .line 265
    :cond_7
    move-object v1, p1

    .line 266
    invoke-super {p0, v1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()Landroid/graphics/Bitmap;
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Landroid/graphics/Paint;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    const/4 v3, -0x1

    .line 30
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getRectF()Landroid/graphics/RectF;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v4, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 38
    .line 39
    iget v5, v3, Landroid/graphics/RectF;->left:F

    .line 40
    .line 41
    iget v6, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->o:F

    .line 42
    .line 43
    sub-float/2addr v5, v6

    .line 44
    iget v7, v3, Landroid/graphics/RectF;->top:F

    .line 45
    .line 46
    sub-float/2addr v7, v6

    .line 47
    iget v8, v3, Landroid/graphics/RectF;->right:F

    .line 48
    .line 49
    add-float/2addr v8, v6

    .line 50
    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    .line 51
    .line 52
    add-float/2addr v3, v6

    .line 53
    invoke-virtual {v4, v5, v7, v8, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->w:Landroid/graphics/RectF;

    .line 57
    .line 58
    invoke-virtual {v1, p0, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public setHeightAttr(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->i:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized setProgress(I)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    if-ltz p1, :cond_2

    .line 3
    .line 4
    :try_start_0
    iget v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->u:I

    .line 5
    .line 6
    if-le p1, v0, :cond_0

    .line 7
    .line 8
    move p1, v0

    .line 9
    :cond_0
    if-gt p1, v0, :cond_1

    .line 10
    .line 11
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->t:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :cond_2
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 22
    .line 23
    const-string v0, "progress not less than 0"

    .line 24
    .line 25
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p1

    .line 29
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p1
.end method

.method public setWidthAttr(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
