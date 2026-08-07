.class public Ll/a5n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$k;


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
.method public a(Landroid/view/View;F)V
    .locals 5

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlBottomContentCoverView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move-object p0, p1

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlBottomContentCoverView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/view/bottom/IntlBottomContentCoverView;->a(F)V

    .line 11
    .line 12
    .line 13
    const/high16 p0, -0x40800000    # -1.0f

    .line 14
    .line 15
    cmpg-float p0, p2, p0

    .line 16
    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    if-gtz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    cmpg-float p0, p2, v0

    .line 29
    .line 30
    const/high16 v2, 0x40000000    # 2.0f

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    const/high16 v4, 0x3f800000    # 1.0f

    .line 34
    .line 35
    if-gtz p0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    div-float p0, p2, v2

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    mul-float/2addr p0, v0

    .line 48
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 53
    .line 54
    .line 55
    neg-float p0, p2

    .line 56
    sub-float/2addr v4, p0

    .line 57
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    cmpg-float p0, p2, v4

    .line 62
    .line 63
    if-gez p0, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    div-float p0, p2, v2

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    int-to-float v0, v0

    .line 75
    mul-float/2addr p0, v0

    .line 76
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    neg-float p0, p0

    .line 81
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 82
    .line 83
    .line 84
    sub-float/2addr v4, p2

    .line 85
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    cmpl-float p0, p2, v4

    .line 90
    .line 91
    if-ltz p0, :cond_4

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_0
    return-void
.end method
