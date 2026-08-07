.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Landroidx/fragment/app/Fragment;

.field public z:Lv/VFrame;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Y4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Y4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;->A:Landroidx/fragment/app/Fragment;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->I4()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->mg()Ll/s1u;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1, p0}, Ll/s1u;->d(Landroidx/fragment/app/Fragment;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;->l5()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;->k5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/t1u;->b(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l5()V
    .locals 4

    .line 1
    invoke-static {}, Ll/mbs;->i()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;->LIVE_SQUARE_DYNAMIC:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->C6(Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;)Ll/fog;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "user_id"

    .line 23
    .line 24
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    sget v3, Ll/ldc0;->i0:I

    .line 32
    .line 33
    invoke-interface {v0, v2, v3, v1}, Ll/fog;->a(Landroidx/fragment/app/FragmentManager;ILandroid/os/Bundle;)Landroidx/fragment/app/Fragment;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;->A:Landroidx/fragment/app/Fragment;

    .line 38
    .line 39
    return-void
.end method

.method public onDestroyView()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->onDestroyView()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->mg()Ll/s1u;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/s1u;->c()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
