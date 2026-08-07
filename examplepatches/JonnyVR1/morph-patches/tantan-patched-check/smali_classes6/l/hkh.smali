.class public Ll/hkh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tih;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/tih<",
        "Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/viewpager/widget/ViewPager;


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
.method public bridge synthetic d(Ll/uql;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/hkh;->e(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->d1:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/tih;->a(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    const/16 v1, 0x1e

    .line 8
    .line 9
    if-ge v0, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    instance-of v1, v1, Landroidx/viewpager/widget/ViewPager;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    .line 24
    .line 25
    iput-object v0, p0, Ll/hkh;->a:Landroidx/viewpager/widget/ViewPager;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    new-instance v1, Landroid/view/animation/RotateAnimation;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    int-to-float v0, v0

    .line 38
    const/high16 v2, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float v5, v0, v2

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/high16 v2, 0x42480000    # 50.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    add-int/2addr v0, v2

    .line 53
    int-to-float v7, v0

    .line 54
    const/4 v2, 0x0

    .line 55
    const/high16 v3, -0x3ee00000    # -10.0f

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    const/4 v6, 0x0

    .line 59
    invoke-direct/range {v1 .. v7}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 68
    .line 69
    .line 70
    const-wide/16 v2, 0x190

    .line 71
    .line 72
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 73
    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    invoke-virtual {v1, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v1, 0x0

    .line 87
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/hkh;->a:Landroidx/viewpager/widget/ViewPager;

    .line 99
    .line 100
    invoke-interface {p0, v0, p1, p2}, Ll/tih;->b(Landroidx/viewpager/widget/ViewPager;Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
