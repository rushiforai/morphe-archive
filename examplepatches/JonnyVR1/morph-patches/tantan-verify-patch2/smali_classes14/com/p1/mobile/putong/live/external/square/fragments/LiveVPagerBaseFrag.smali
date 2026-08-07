.class public abstract Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field protected volatile endSubscribeSignal:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field private final logTag:Ljava/lang/String;

.field private viewCreated:Z

.field private final visibleHelper:Ll/lf60;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->viewCreated:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->logTag:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, Ll/lf60;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/lf60;-><init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 23
    .line 24
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->endSubscribeSignal:Lrx/subjects/b;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic M4(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic N4(Ll/pf60;)Landroid/util/Pair;
    .locals 3

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Landroid/util/Pair;

    .line 6
    .line 7
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Ljava/lang/Boolean;

    .line 10
    .line 11
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {v0, v2, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method


# virtual methods
.method public O4()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public P4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lf60;->g()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Q4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lf60;->i()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public R4(Z)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    return-void
.end method

.method public S4(ZIJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public T4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lf60;->o(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public U4(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public V4(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/lf60;->q(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W4(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lf60;->s(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 47
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Ll/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->P4()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/yuu;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/yuu;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/zuu;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/zuu;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->endSubscribeSignal:Lrx/subjects/b;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p1, p0, p2}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 46
    new-instance v0, Ll/avu;

    invoke-direct {v0, p1}, Ll/avu;-><init>(Lrx/c;)V

    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Ll/pcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0, p1}, Ll/lf60;->l(Lcom/p1/mobile/android/app/Act;Landroid/os/Bundle;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onAttach(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lf60;->m()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroyView()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->endSubscribeSignal:Lrx/subjects/b;

    .line 5
    .line 6
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->U4(Landroid/view/View;Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->viewCreated:Z

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    new-instance v0, Ll/xuu;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/xuu;-><init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2, v0}, Ll/lf60;->p(ZLl/y20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->viewCreated:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->visibleHelper:Ll/lf60;

    .line 16
    .line 17
    new-instance v1, Ll/xuu;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/xuu;-><init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1, v1}, Ll/lf60;->r(ZLl/y20;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method
