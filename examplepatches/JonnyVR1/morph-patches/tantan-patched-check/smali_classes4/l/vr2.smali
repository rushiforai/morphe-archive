.class public Ll/vr2;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    const p0, 0x3f99999a    # 1.2f

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public c(F)Landroid/view/animation/PathInterpolator;
    .locals 2

    .line 1
    new-instance p0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const v1, 0x3f147ae1    # 0.58f

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0, v0, v1, p1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public d()Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    new-instance p0, Landroid/view/animation/DecelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public e(F)Landroid/view/animation/PathInterpolator;
    .locals 2

    .line 1
    new-instance p0, Landroid/view/animation/PathInterpolator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const v1, 0x3f147ae1    # 0.58f

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0, v0, v1, p1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public f(Ll/nh4;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g()J
    .locals 2

    .line 1
    const-wide/16 v0, 0xc8

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
