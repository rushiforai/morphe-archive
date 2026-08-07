.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e:Z

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 16
    .line 17
    const-string p1, "https://auto.tancdn.com/v1/raw/54e8aeb4-7273-42e8-835b-760674ef213314.so"

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e:Z

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d:Z

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 16
    .line 17
    const-string p1, "https://auto.tancdn.com/v1/raw/42b34630-f2e8-4932-bb33-20e140dcacc514.so"

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d:Z

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->f:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->f:Z

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 16
    .line 17
    const-string p1, "https://auto.tancdn.com/v1/raw/7b84354a-5216-4332-83b5-680d2660dcf014.so"

    .line 18
    .line 19
    const/4 v0, -0x1

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->f:Z

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->f:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->e:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->d:Z

    .line 22
    .line 23
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 36
    .line 37
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 38
    .line 39
    sget v1, Ll/qa00;->t:I

    .line 40
    .line 41
    sget v2, Ll/qa00;->p:I

    .line 42
    .line 43
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 47
    .line 48
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 52
    .line 53
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 57
    .line 58
    const/4 v1, -0x1

    .line 59
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 63
    .line 64
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public setCursorOffset(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    sget v1, Ll/qa00;->t:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    sub-float v1, p1, v1

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
