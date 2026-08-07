.class public Lv/VPager_Squared;
.super Lv/VPager;
.source "SourceFile"


# instance fields
.field public P0:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VPager;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 2

    .line 1
    iget v0, p0, Lv/VPager_Squared;->P0:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v1, v0, v1

    .line 5
    .line 6
    if-lez v1, :cond_0

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    cmpg-float v0, v0, v1

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    int-to-float p2, p1

    .line 19
    iget v0, p0, Lv/VPager_Squared;->P0:F

    .line 20
    .line 21
    div-float/2addr p2, v0

    .line 22
    float-to-int p2, p2

    .line 23
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-super {p0, p1, p2}, Lv/VPager;->onMeasure(II)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-super {p0, p1, p1}, Lv/VPager;->onMeasure(II)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public setWidthHeightRate(F)V
    .locals 1

    .line 1
    iget v0, p0, Lv/VPager_Squared;->P0:F

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    iput p1, p0, Lv/VPager_Squared;->P0:F

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method
