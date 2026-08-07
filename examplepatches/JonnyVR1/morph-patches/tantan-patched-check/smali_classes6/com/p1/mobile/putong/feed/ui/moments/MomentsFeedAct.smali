.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;->a2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V

    return-void
.end method

.method public static Y1(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public Z1()Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 13
    .line 14
    return-object p0
.end method

.method public final synthetic a2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->O4(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const p2, 0x1020002

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2, v0}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroidx/fragment/app/k;->i()I

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e0()Z

    .line 39
    .line 40
    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->Y3:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;->Z1()Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->V4()Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance v1, Ll/iv00;

    .line 22
    .line 23
    invoke-direct {v1, p0, v0}, Ll/iv00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 v2, 0xc8

    .line 27
    .line 28
    invoke-virtual {p0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->V4()Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/b;->i:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 38
    .line 39
    invoke-virtual {v0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->U(IILandroid/content/Intent;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;->Z1()Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->T4(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
