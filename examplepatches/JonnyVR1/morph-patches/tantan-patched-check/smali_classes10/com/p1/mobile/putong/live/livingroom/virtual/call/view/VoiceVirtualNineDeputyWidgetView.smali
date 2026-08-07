.class public Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;
.super Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public p:Landroid/widget/LinearLayout;

.field public q:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public t:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

.field public u:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic u0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->getPresenter()Ll/scp0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->getPresenter()Ll/scp0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/scp0;->g4()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {p0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getDeputyViewList()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->l:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->m:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->n:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->o:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->q:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->r:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->s:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->t:Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->r0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->n0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->h:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    new-instance v1, Ll/zfp0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/zfp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/agp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/agp0;->b(Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public t0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x2

    .line 11
    div-int/2addr v0, v1

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    new-array v0, v1, [F

    .line 17
    .line 18
    fill-array-data v0, :array_0

    .line 19
    .line 20
    .line 21
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 22
    .line 23
    invoke-static {p0, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {v0}, [Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-wide/16 v1, 0xfa

    .line 32
    .line 33
    invoke-static {v1, v2, v0}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 38
    .line 39
    sget-object v1, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    nop

    .line 51
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public v0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x2

    .line 11
    div-int/2addr v0, v1

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    new-array v0, v1, [F

    .line 21
    .line 22
    fill-array-data v0, :array_0

    .line 23
    .line 24
    .line 25
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 26
    .line 27
    invoke-static {p0, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0}, [Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-wide/16 v1, 0xfa

    .line 36
    .line 37
    invoke-static {v1, v2, v0}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 42
    .line 43
    sget-object v1, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->u:Landroid/animation/Animator;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    nop

    .line 55
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public w0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y0(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ")V"
        }
    .end annotation

    .line 1
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->getDeputyViewList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->getDeputyViewList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->r(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public z0(Ll/nsv;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->d:Ll/scp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ll/h64;

    .line 16
    .line 17
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
