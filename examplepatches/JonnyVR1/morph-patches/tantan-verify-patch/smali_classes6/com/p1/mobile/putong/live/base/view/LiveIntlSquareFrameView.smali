.class public Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public b:Lv/VDraweeView;


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

.method private setFrame(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->b:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    const-string v0, "context_square"

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->b:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k1t;->a(Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->b:Lv/VDraweeView;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 30
    .line 31
    const/4 v0, -0x1

    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->b(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->setFrame(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const/4 p1, 0x0

    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->d()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
