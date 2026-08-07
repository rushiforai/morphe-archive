.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;
.super Landroid/widget/TextSwitcher;
.source "SourceFile"

# interfaces
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/os/Handler;

.field public b:I

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:J

.field public e:Z

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/TextSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b:I

    .line 6
    .line 7
    const-wide/16 p1, 0xbb8

    .line 8
    .line 9
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->d:J

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e:Z

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c:Ljava/util/List;

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->f:Ljava/util/List;

    .line 27
    .line 28
    new-instance p1, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;Ll/weh0;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->a:Landroid/os/Handler;

    .line 35
    .line 36
    invoke-virtual {p0, p0}, Landroid/widget/ViewSwitcher;->setFactory(Landroid/widget/ViewSwitcher$ViewFactory;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;J[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->h(J[I)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->d:J

    return-wide v0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b:I

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setTextColor(I)V

    return-void
.end method

.method private setTextColor(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ViewSwitcher;->getNextView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/TextSwitcher;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(J[I)V
    .locals 5

    .line 1
    new-instance v0, Landroid/view/animation/AnimationSet;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    .line 8
    .line 9
    aget v3, p3, v1

    .line 10
    .line 11
    int-to-float v3, v3

    .line 12
    const/4 v4, 0x0

    .line 13
    invoke-direct {v2, v4, v4, v3, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Landroid/view/animation/AlphaAnimation;

    .line 20
    .line 21
    const/high16 v3, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-direct {v2, v4, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Landroid/view/animation/AnimationSet;

    .line 36
    .line 37
    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Landroid/view/animation/TranslateAnimation;

    .line 41
    .line 42
    aget p3, p3, v1

    .line 43
    .line 44
    neg-int p3, p3

    .line 45
    int-to-float p3, p3

    .line 46
    invoke-direct {v2, v4, v4, v4, p3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 50
    .line 51
    .line 52
    new-instance p3, Landroid/view/animation/AlphaAnimation;

    .line 53
    .line 54
    invoke-direct {p3, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p3}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->a:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->a:Landroid/os/Handler;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public makeView()Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v1, Ll/bnl0;->e:I

    .line 13
    .line 14
    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    const/16 v1, 0x10

    .line 18
    .line 19
    iput v1, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 20
    .line 21
    sget v2, Ll/qa00;->d:I

    .line 22
    .line 23
    iput v2, p0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 26
    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    const/high16 v2, 0x41200000    # 10.0f

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x3

    .line 39
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->a:Landroid/os/Handler;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setAnimTime(J)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    new-instance v0, Ll/veh0;

    .line 25
    .line 26
    invoke-direct {v0, p0, p1, p2}, Ll/veh0;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;J)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setTextColorList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->f:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    const/4 p1, -0x1

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b:I

    .line 43
    .line 44
    return-void
.end method

.method public setTextList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/lit8 v0, v0, -0x1

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 p1, -0x1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b:I

    .line 39
    .line 40
    return-void
.end method

.method public setTextStillTime(J)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->d:J

    .line 7
    .line 8
    return-void
.end method
