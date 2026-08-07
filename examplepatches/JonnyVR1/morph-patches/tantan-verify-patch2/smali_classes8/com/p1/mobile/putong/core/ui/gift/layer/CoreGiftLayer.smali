.class public Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$f;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;

.field public c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VImage;

.field public h:Z

.field public i:Z

.field public j:Ll/kcg0;

.field public k:I

.field public l:Z

.field public m:Landroid/view/TextureView$SurfaceTextureListener;

.field public n:Z

.field public o:Ljava/lang/Runnable;

.field public p:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->h:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i:Z

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n:Z

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$a;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o:Ljava/lang/Runnable;

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p:Z

    .line 21
    .line 22
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

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->h:Z

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i:Z

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n:Z

    .line 28
    new-instance p2, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$a;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o:Ljava/lang/Runnable;

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p:Z

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

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->h:Z

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i:Z

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n:Z

    .line 35
    new-instance p2, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$a;

    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o:Ljava/lang/Runnable;

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p:Z

    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->t(Ll/x20;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;Landroid/view/TextureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->s(Ll/x20;Landroid/view/TextureView;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->r(Ll/x20;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->v(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;Ll/x20;Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->u(Ll/x20;Ll/x20;Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p:Z

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->B()V

    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;->TEXTURE_VIEW:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setRenderMode(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public C(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->j:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->d:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public G(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->e:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uu8;->a(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/velib/player/VideoEffectView;->isPlaying()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->stop()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 8
    .line 9
    sget-object v1, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;->TEXTURE_VIEW:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setRenderMode(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer$RenderMode;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->g:Lv/VImage;

    .line 15
    .line 16
    new-instance v1, Ll/mu8;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/mu8;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/y4m$a;)Z
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    const-string p0, "video"

    .line 6
    .line 7
    invoke-static {p0}, Ll/ahe;->b(Ljava/lang/String;)Ll/k4;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, p1, v0, p2}, Ll/k4;->c(Ljava/lang/String;ZLl/y4m$a;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Ll/x20;)V
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-ge p0, v0, :cond_0

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic s(Ll/x20;Landroid/view/TextureView;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->d:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 22
    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n:Z

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 29
    .line 30
    const/16 v1, 0xa

    .line 31
    .line 32
    if-ge p1, v1, :cond_2

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    instance-of p1, p2, Lcom/immomo/velib/player/EffectTextureView;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    check-cast p2, Lcom/immomo/velib/player/EffectTextureView;

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/immomo/velib/player/EffectTextureView;->c()V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->A(Z)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 53
    .line 54
    return-void
.end method

.method public setEnableFrameCheck(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public setErrorWhenFrameJank(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method public setThxTipClickListener(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    new-instance v1, Ll/nu8;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/nu8;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic t(Ll/x20;II)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic u(Ll/x20;Ll/x20;Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)V
    .locals 4

    .line 1
    if-eqz p3, :cond_7

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 4
    .line 5
    if-eqz v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->getVideoFolder()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/immomo/velib/player/VideoEffectView;->isPlaying()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->A(Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    :goto_0
    new-instance v0, Ll/qu8;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/qu8;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->setEffectModel(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    sget v0, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;->MERGE_ALPHA:I

    .line 58
    .line 59
    invoke-virtual {p3, v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->setEffectType(I)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-virtual {p3, v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->setEffectMatchInfo(Ljava/util/List;)Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    invoke-virtual {p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig$Builder;->build()Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 73
    .line 74
    invoke-virtual {v1, p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setVideoEffectConfig(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectConfig;)V

    .line 75
    .line 76
    .line 77
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->n:Z

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    if-nez p3, :cond_2

    .line 81
    .line 82
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->l:Z

    .line 83
    .line 84
    if-eqz p3, :cond_4

    .line 85
    .line 86
    :cond_2
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 87
    .line 88
    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    instance-of p3, p3, Landroid/view/TextureView;

    .line 93
    .line 94
    if-eqz p3, :cond_4

    .line 95
    .line 96
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 97
    .line 98
    invoke-virtual {p3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    move-object v0, p3

    .line 103
    check-cast v0, Landroid/view/TextureView;

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->m:Landroid/view/TextureView$SurfaceTextureListener;

    .line 110
    .line 111
    if-eqz v2, :cond_3

    .line 112
    .line 113
    invoke-virtual {v2, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-nez v2, :cond_4

    .line 118
    .line 119
    :cond_3
    new-instance v2, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$d;

    .line 120
    .line 121
    invoke-direct {v2, p0, p3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$d;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 122
    .line 123
    .line 124
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->m:Landroid/view/TextureView$SurfaceTextureListener;

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 127
    .line 128
    .line 129
    :cond_4
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 130
    .line 131
    invoke-virtual {p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->prepare()V

    .line 132
    .line 133
    .line 134
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i:Z

    .line 135
    .line 136
    if-eqz p3, :cond_5

    .line 137
    .line 138
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->i:Z

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o:Ljava/lang/Runnable;

    .line 145
    .line 146
    const-wide/16 v2, 0xc8

    .line 147
    .line 148
    invoke-static {p3, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 149
    .line 150
    .line 151
    :cond_5
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->l:Z

    .line 152
    .line 153
    if-eqz p3, :cond_6

    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 156
    .line 157
    .line 158
    move-result-object p3

    .line 159
    new-instance v1, Ll/ru8;

    .line 160
    .line 161
    invoke-direct {v1, p0, p1}, Ll/ru8;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;)V

    .line 162
    .line 163
    .line 164
    const-wide/16 v2, 0x3e8

    .line 165
    .line 166
    invoke-static {p3, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 167
    .line 168
    .line 169
    :cond_6
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 170
    .line 171
    invoke-virtual {p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->start()V

    .line 172
    .line 173
    .line 174
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 175
    .line 176
    new-instance v1, Ll/su8;

    .line 177
    .line 178
    invoke-direct {v1, p0, p2, v0}, Ll/su8;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;Landroid/view/TextureView;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p3, v1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setCompletionListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnCompletionListener;)V

    .line 182
    .line 183
    .line 184
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 185
    .line 186
    new-instance p3, Ll/tu8;

    .line 187
    .line 188
    invoke-direct {p3, p0, p1}, Ll/tu8;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p2, p3}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->setOnErrorListener(Lcom/tantanapp/media/ttmediaeffect/video/IVdieoEffect$OnErrorListener;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_7
    :goto_1
    if-eqz p1, :cond_8

    .line 196
    .line 197
    invoke-interface {p1}, Ll/x20;->call()V

    .line 198
    .line 199
    .line 200
    :cond_8
    return-void
.end method

.method public final synthetic v(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->f:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$c;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/y4m$a;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->y(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->x(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->clearDynamicData()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "HeadisHere"

    .line 14
    .line 15
    invoke-virtual {v0, p1, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v1, "https://auto.tancdn.com/v1/raw/719775d5-33be-45b7-9d72-3eb7f6dffe9610.so"

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;

    .line 42
    .line 43
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$e;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 53
    .line 54
    .line 55
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->h:Z

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 60
    .line 61
    .line 62
    new-instance p1, Ll/ou8;

    .line 63
    .line 64
    invoke-direct {p1}, Ll/ou8;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Ll/x20;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->k:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->c:Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectPlayer;->stop()V

    .line 7
    .line 8
    .line 9
    const-string v0, "video"

    .line 10
    .line 11
    invoke-static {v0}, Ll/ahe;->b(Ljava/lang/String;)Ll/k4;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/dfl0;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 22
    .line 23
    new-instance v3, Ll/pu8;

    .line 24
    .line 25
    invoke-direct {v3, p0, p3, p2}, Ll/pu8;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;Ll/x20;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, p1, v3}, Ll/dfl0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/dfl0$a;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->j:Ll/kcg0;

    .line 33
    .line 34
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer$b;-><init>(Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->p(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/y4m$a;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->y(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eqz p4, :cond_1

    .line 17
    .line 18
    invoke-interface {p4}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method
