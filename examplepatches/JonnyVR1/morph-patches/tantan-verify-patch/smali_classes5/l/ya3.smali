.class public final Ll/ya3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$k;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Ll/ya3;",
        "Landroidx/viewpager/widget/ViewPager$k;",
        "<init>",
        "()V",
        "Landroid/view/View;",
        "page",
        "",
        "position",
        "",
        "a",
        "(Landroid/view/View;F)V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


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
    .locals 6
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/BottomContentCoverView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    move-object p0, p1

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/BottomContentCoverView;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    :goto_0
    if-nez p0, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    move-object p0, p1

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/BottomContentCoverView;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/BottomContentCoverView;->b(F)V

    .line 21
    .line 22
    .line 23
    const/high16 v1, -0x40800000    # -1.0f

    .line 24
    .line 25
    cmpg-float v1, p2, v1

    .line 26
    .line 27
    const/16 v2, 0x8

    .line 28
    .line 29
    if-gtz v1, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    cmpg-float v1, p2, v0

    .line 39
    .line 40
    const/high16 v3, 0x40000000    # 2.0f

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    const/high16 v5, 0x3f800000    # 1.0f

    .line 44
    .line 45
    if-gtz v1, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    div-float v0, p2, v3

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    int-to-float v1, v1

    .line 57
    mul-float/2addr v0, v1

    .line 58
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 63
    .line 64
    .line 65
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/BottomContentCoverView;

    .line 66
    .line 67
    neg-float p0, p2

    .line 68
    sub-float/2addr v5, p0

    .line 69
    invoke-virtual {p1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    cmpg-float v1, p2, v5

    .line 74
    .line 75
    if-gez v1, :cond_4

    .line 76
    .line 77
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    div-float v0, p2, v3

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    int-to-float v1, v1

    .line 87
    mul-float/2addr v0, v1

    .line 88
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    neg-float v0, v0

    .line 93
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 94
    .line 95
    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/bottom/BottomContentCoverView;

    .line 97
    .line 98
    sub-float/2addr v5, p2

    .line 99
    invoke-virtual {p1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    cmpl-float p1, p2, v5

    .line 104
    .line 105
    if-ltz p1, :cond_5

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    :cond_5
    :goto_1
    return-void
.end method
