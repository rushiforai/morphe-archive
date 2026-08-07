.class public Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;
.super Landroid/widget/TextSwitcher;
.source "SourceFile"

# interfaces
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;,
        Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

.field public c:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

.field public d:Landroid/os/Handler;

.field public e:Ljava/lang/Runnable;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/TextSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->g:I

    .line 6
    .line 7
    const/16 p2, 0x3e8

    .line 8
    .line 9
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h:I

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {p0, p0}, Landroid/widget/ViewSwitcher;->setFactory(Landroid/widget/ViewSwitcher$ViewFactory;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Landroid/os/Handler;

    .line 17
    .line 18
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->d:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance p1, Ll/eqg;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/eqg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->e:Ljava/lang/Runnable;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->f()V

    return-void
.end method


# virtual methods
.method public final c(ZZ)Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;ZZ)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p0, 0xfa

    .line 7
    .line 8
    invoke-virtual {v0, p0, p1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Landroid/view/animation/AccelerateInterpolator;

    .line 16
    .line 17
    invoke-direct {p0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public clearAnimation()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->c(ZZ)Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 6
    .line 7
    xor-int/lit8 v0, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->c(ZZ)Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic f()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->g:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->g:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->f:Ljava/util/List;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->g:I

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->g()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->f:Ljava/util/List;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->g:I

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->d:Landroid/os/Handler;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->e:Ljava/lang/Runnable;

    .line 40
    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h:I

    .line 42
    .line 43
    int-to-long v2, p0

    .line 44
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getInAnimation()Landroid/view/animation/Animation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->b:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getOutAnimation()Landroid/view/animation/Animation;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->c:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$b;

    .line 17
    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lv/VText;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public h(Ljava/lang/CharSequence;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->d(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public makeView()Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/16 v1, 0x11

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 11
    .line 12
    .line 13
    const/high16 v2, 0x41400000    # 12.0f

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget v2, Ll/k9c0;->K:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/dqg;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/dqg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public setClickLisener(Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView$a;)V
    .locals 0

    return-void
.end method

.method public setList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->f:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setTextColor(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lv/VText;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setTextSize(F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lv/VText;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
