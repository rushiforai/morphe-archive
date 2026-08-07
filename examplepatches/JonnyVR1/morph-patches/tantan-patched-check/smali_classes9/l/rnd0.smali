.class public Ll/rnd0;
.super Ll/sce;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/sce<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/sce;-><init>(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public f(Ll/ruf0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/sce;->c()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/rnd0;->h(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Ll/sce;->f(Ll/ruf0;)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/sce;->e:I

    .line 12
    .line 13
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v1, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 18
    .line 19
    const/16 v2, 0x1e0

    .line 20
    .line 21
    if-ge v1, v2, :cond_0

    .line 22
    .line 23
    iget p0, p0, Ll/sce;->e:I

    .line 24
    .line 25
    const/high16 v0, 0x40400000    # 3.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr v0, p0

    .line 32
    :cond_0
    invoke-interface {p1}, Ll/a6m;->getRatio()F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    int-to-float v1, v0

    .line 37
    mul-float/2addr p0, v1

    .line 38
    float-to-int p0, p0

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p1, v1, v1, p0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
