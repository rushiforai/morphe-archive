.class public Ll/or0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Landroid/view/animation/Interpolator;

.field public static final b:Landroid/view/animation/Interpolator;

.field public static final c:Landroid/view/animation/Interpolator;

.field public static final d:Landroid/view/animation/Interpolator;

.field public static final e:Landroid/view/animation/Interpolator;

.field public static final f:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/or0;->a:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    new-instance v0, Ll/zjg;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/zjg;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/or0;->b:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    new-instance v0, Ll/yjg;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/yjg;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/or0;->c:Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    new-instance v0, Ll/lor;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/lor;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/or0;->d:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/or0;->e:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    const/high16 v2, 0x3f800000    # 1.0f

    .line 40
    .line 41
    const v3, 0x3e99999a    # 0.3f

    .line 42
    .line 43
    .line 44
    const v4, 0x3f19999a    # 0.6f

    .line 45
    .line 46
    .line 47
    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Ll/or0;->f:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(IIF)I
    .locals 0

    .line 1
    sub-int/2addr p1, p0

    .line 2
    int-to-float p1, p1

    .line 3
    mul-float/2addr p2, p1

    .line 4
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    add-int/2addr p0, p1

    .line 9
    return p0
.end method
