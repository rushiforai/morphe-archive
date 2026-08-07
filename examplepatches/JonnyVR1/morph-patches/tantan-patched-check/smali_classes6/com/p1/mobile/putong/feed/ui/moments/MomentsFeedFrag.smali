.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/uv00;",
        "Lcom/p1/mobile/putong/feed/ui/moments/b;",
        ">;"
    }
.end annotation


# instance fields
.field public B:Z

.field public C:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->B:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->C:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->Q4()Ll/uv00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->R4()Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->q(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->s()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q4()Ll/uv00;
    .locals 1

    .line 1
    new-instance v0, Ll/uv00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uv00;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public R4()Lcom/p1/mobile/putong/feed/ui/moments/b;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/uv00;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uv00;->n0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public T4(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/b;->G(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/uv00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/uv00;->t0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V4()Lcom/p1/mobile/putong/feed/ui/moments/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 4
    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/b;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/b;->F(IILandroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 13
    .line 14
    check-cast p0, Ll/uv00;

    .line 15
    .line 16
    iget-object p0, p0, Ll/uv00;->b:Lrx/subjects/a;

    .line 17
    .line 18
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->C:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->B:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 13
    .line 14
    check-cast v0, Ll/uv00;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/uv00;->s0()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->C:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->B:Z

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/uv00;->pageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
