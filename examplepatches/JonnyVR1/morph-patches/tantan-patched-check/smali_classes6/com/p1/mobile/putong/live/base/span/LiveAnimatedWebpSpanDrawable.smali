.class public final Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;
.super Ll/ruf0;
.source "SourceFile"


# instance fields
.field public a:Ll/wp0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ll/fb5;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/ker;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Landroidx/lifecycle/DefaultLifecycleObserver;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/wp0;Ll/fb5;)V
    .locals 1
    .param p1    # Ll/wp0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/fb5;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wp0;",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ruf0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->c:Z

    .line 6
    .line 7
    new-instance v0, Ll/gvr;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/gvr;-><init>(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->g:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->b:Ll/fb5;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->i()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)Ll/wp0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->d:Landroid/widget/TextView;

    return-object p0
.end method

.method public static j(Ljava/lang/String;)Z
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, ".webp"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wp0;->draw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e(Landroid/widget/TextView;)V
    .locals 1
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->d:Landroid/widget/TextView;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->g:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->n(Landroid/widget/TextView;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->g:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->p()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->d:Landroid/widget/TextView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->g:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->o()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/wp0;->a()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->b:Ll/fb5;

    .line 24
    .line 25
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->b:Ll/fb5;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->d:Landroid/widget/TextView;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->c:Z

    .line 37
    .line 38
    return-void
.end method

.method public final g(Landroid/content/Context;)Ll/ker;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :goto_0
    instance-of p0, p1, Landroid/content/ContextWrapper;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    instance-of p0, p1, Ll/ker;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    check-cast p1, Ll/ker;

    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_0
    check-cast p1, Landroid/content/ContextWrapper;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wp0;->getOpacity()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x2

    .line 11
    return p0
.end method

.method public getRatio()F
    .locals 0

    const p0, 0x409db6db

    return p0
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$a;-><init>(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->n(Landroid/widget/TextView;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final k(Landroid/widget/TextView;)V
    .locals 1
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->l(Landroid/widget/TextView;)Ll/ker;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->e:Ll/ker;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$1;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable$1;-><init>(Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f:Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/ker;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f:Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroidx/lifecycle/Lifecycle;->a(Ll/jer;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final l(Landroid/widget/TextView;)Ll/ker;
    .locals 1
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/pml0;->a(Landroid/view/View;)Ll/ker;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->g(Landroid/content/Context;)Ll/ker;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->c:Z

    .line 4
    .line 5
    if-nez v1, :cond_2

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v1}, Ll/wp0;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->n(Landroid/widget/TextView;)V

    .line 22
    .line 23
    .line 24
    :cond_2
    :goto_0
    return-void
.end method

.method public final n(Landroid/widget/TextView;)V
    .locals 2
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->h()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/wp0;->start()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->postInvalidateOnAnimation()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->k(Landroid/widget/TextView;)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->c:Z

    .line 33
    .line 34
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->e:Ll/ker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f:Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/ker;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f:Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/lifecycle/Lifecycle;->d(Ll/jer;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->e:Ll/ker;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->f:Landroidx/lifecycle/DefaultLifecycleObserver;

    .line 22
    .line 23
    return-void
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wp0;->setAlpha(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setBounds(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sub-int/2addr p3, p1

    .line 9
    sub-int/2addr p4, p2

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1, p1, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/span/LiveAnimatedWebpSpanDrawable;->a:Ll/wp0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wp0;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
