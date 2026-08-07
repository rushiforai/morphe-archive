.class public Ll/w620;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v1b0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/v1b0<",
        "Ll/v620;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/ViewGroup;

.field public b:Landroid/view/View;

.field public c:Ll/x20;

.field public final d:Lcom/p1/mobile/android/app/Frag;

.field public e:Landroidx/fragment/app/Fragment;

.field public f:Ll/v620;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w620;->d:Lcom/p1/mobile/android/app/Frag;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w620;->d:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public D1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w620;->e:Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/w620;->e:Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public a(Ll/v620;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w620;->f:Ll/v620;

    .line 2
    .line 3
    return-void
.end method

.method public b(Landroid/view/View;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w620;->b:Landroid/view/View;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w620;->c:Ll/x20;

    .line 4
    .line 5
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w620;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/w620;->a:Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/w620;->c:Ll/x20;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;->PERSONAL_PAGE_IN_MINE_TAB:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->C6(Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedMomentListType;)Ll/fog;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Landroid/os/Bundle;

    .line 30
    .line 31
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    const-string v3, "user_id"

    .line 45
    .line 46
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Ll/w620;->d:Lcom/p1/mobile/android/app/Frag;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, p0, Ll/w620;->d:Lcom/p1/mobile/android/app/Frag;

    .line 58
    .line 59
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v3, p0, Ll/w620;->a:Landroid/view/ViewGroup;

    .line 64
    .line 65
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-interface {v0, v2, v3, v1}, Ll/fog;->a(Landroidx/fragment/app/FragmentManager;ILandroid/os/Bundle;)Landroidx/fragment/app/Fragment;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Ll/w620;->e:Landroidx/fragment/app/Fragment;

    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v620;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w620;->a(Ll/v620;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iput-object p2, p0, Ll/w620;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w620;->c()V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public o()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public r()V
    .locals 0

    .line 1
    return-void
.end method

.method public x1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w620;->e:Landroidx/fragment/app/Fragment;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/w620;->e:Landroidx/fragment/app/Fragment;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public x2()V
    .locals 0

    .line 1
    return-void
.end method
