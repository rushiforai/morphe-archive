.class public Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/ttl;


# instance fields
.field public A:Ll/fsh;

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public z:Ll/dsh;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M4()V
    .locals 1

    .line 1
    new-instance v0, Ll/dsh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dsh;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->z:Ll/dsh;

    .line 7
    .line 8
    new-instance v0, Ll/fsh;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/fsh;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->z:Ll/dsh;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->B:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "key_target_moment"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->C:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public M2(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/fsh;->p(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public N4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->z:Ll/dsh;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/dsh;->p0()Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public O4()Ll/fsh;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q4()V
    .locals 2

    .line 1
    const-string v0, "p_poi_detail"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->B:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->S4(Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "\u9644\u8fd1\u4eba\u6570\u636e\u83b7\u53d6\u5931\u8d25"

    .line 17
    .line 18
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/fsh;->d()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public R4()V
    .locals 2

    .line 1
    const-string v0, "p_poi_detail"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->B:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/fsh;->e()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->S4(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/fsh;->d()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final S4(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "p_poi_nearby_card"

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->C:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v1, v2, v3, p0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public a2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->A(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->P4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->M4()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->z:Ll/dsh;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dsh;->a0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fsh;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->z:Ll/dsh;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/dsh;->o0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fsh;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k2(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->B(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->z:Ll/dsh;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/dsh;->H0(IILandroid/content/Intent;)V

    .line 7
    .line 8
    .line 9
    return-void
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

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/fsh;->c()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;->A:Ll/fsh;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/fsh;->i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->w()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method
