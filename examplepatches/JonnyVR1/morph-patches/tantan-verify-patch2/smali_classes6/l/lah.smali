.class public Ll/lah;
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
    invoke-virtual {p0, p1, p2}, Ll/lah;->e(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

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
    iput-object v0, p0, Ll/lah;->a:Landroidx/viewpager/widget/ViewPager;

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
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    neg-int v1, v1

    .line 45
    int-to-float v1, v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-wide/16 v1, 0x12c

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/lah$a;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1, p2}, Ll/lah$a;-><init>(Ll/lah;Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 66
    .line 67
    .line 68
    return-void
.end method
