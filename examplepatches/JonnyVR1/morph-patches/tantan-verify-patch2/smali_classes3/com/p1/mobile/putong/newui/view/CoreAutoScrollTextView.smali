.class public Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;
.super Landroid/widget/TextSwitcher;
.source "SourceFile"

# interfaces
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;,
        Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

.field public c:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

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
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    iput p2, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g:I

    .line 6
    .line 7
    const/16 p2, 0x3e8

    .line 8
    .line 9
    iput p2, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->h:I

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->a:Landroid/content/Context;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->d:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance p1, Ll/zz6;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/zz6;-><init>(Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->e:Ljava/lang/Runnable;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->f()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(ZZ)Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;-><init>(Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;ZZ)V

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
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->c(ZZ)Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->b:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

    .line 6
    .line 7
    xor-int/lit8 v0, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->c(ZZ)Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->c:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->b:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->c:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->b:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

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
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->f:Ljava/util/List;

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
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g:I

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->f:Ljava/util/List;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g:I

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
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->d:Landroid/os/Handler;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->e:Ljava/lang/Runnable;

    .line 40
    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->h:I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->b:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->c:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$b;

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

.method public h(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->h:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->g:I

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->d:Landroid/os/Handler;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->e:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public makeView()Landroid/view/View;
    .locals 4

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/16 v1, 0x10

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 15
    .line 16
    .line 17
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 23
    .line 24
    .line 25
    const/high16 v2, 0x41600000    # 14.0f

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    sget v3, Ll/b9c0;->b:I

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ll/a07;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/a07;-><init>(Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->d:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->e:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->d:Landroid/os/Handler;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setClickLisener(Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView$a;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->f:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->d(Z)V

    .line 5
    .line 6
    .line 7
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
