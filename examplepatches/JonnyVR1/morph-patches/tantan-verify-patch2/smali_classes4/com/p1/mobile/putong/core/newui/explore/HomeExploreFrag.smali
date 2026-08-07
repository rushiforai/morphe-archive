.class public Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"

# interfaces
.implements Ll/btl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/s9l;",
        "Ll/w9l;",
        ">;",
        "Ll/btl;"
    }
.end annotation


# instance fields
.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private P4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "key_from"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->B:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "key_explore_type"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->C:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public D0(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Ll/w9l;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/w9l;->u(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public M3(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "reason_type"

    .line 8
    .line 9
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_user_cant_rightswipe_reason"

    .line 18
    .line 19
    const-string p2, "p_tantanx_card"

    .line 20
    .line 21
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->Q4()Ll/s9l;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->R4()Ll/w9l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w9l;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/w9l;->j()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q4()Ll/s9l;
    .locals 2

    .line 1
    new-instance v0, Ll/s9l;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->C:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/s9l;-><init>(Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public R4()Ll/w9l;
    .locals 1

    .line 1
    new-instance v0, Ll/w9l;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w9l;-><init>(Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S4()V
    .locals 0

    .line 1
    const-string p0, "\u5f53\u524d\u7528\u6237\u72b6\u6001\u5f02\u5e38\uff0c\u8bf7\u66f4\u65b0\u72b6\u6001\u540e\u5c1d\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w9l;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/w9l;->y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->P4()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->d4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Ll/s9l;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/s9l;->s0(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/w9l;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/w9l;->r()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w9l;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/w9l;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongFrag;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
