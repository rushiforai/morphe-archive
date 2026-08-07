.class public Lcom/p1/mobile/putong/live/external/page/setting/b;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/page/setting/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/page/setting/b$a;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jfs;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/jfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/b;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/b;->a:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/live/external/page/setting/b;Lcom/p1/mobile/putong/live/external/page/setting/a;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/b;->H2(Lcom/p1/mobile/putong/live/external/page/setting/a;Z)V

    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/live/external/page/setting/b;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/b;->A2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/live/external/page/setting/b;Ljava/lang/String;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/page/setting/b;->D2(Ljava/lang/String;ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic w2(Lcom/p1/mobile/putong/live/external/page/setting/b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/b;->B2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/live/external/page/setting/b;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/b;->C2(ZLjava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic A2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->list:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->list:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e2(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e2(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic B2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g2()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->Z:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic C2(ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 4
    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i2(Z)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 11
    .line 12
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->Z:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic D2(Ljava/lang/String;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 4
    .line 5
    xor-int/lit8 p2, p2, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->l2(Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 11
    .line 12
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->Z:I

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public E2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->h2()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getFollowPushNoticeList()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/kfs;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/kfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/b;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/lfs;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/lfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/b;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public F2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->c2()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->b2()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    xor-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i2(Z)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->updateAllFollowPushStatus(Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Ll/mfs;

    .line 53
    .line 54
    invoke-direct {v2}, Ll/mfs;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v3, Ll/nfs;

    .line 58
    .line 59
    invoke-direct {v3, p0, v0}, Ll/nfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/b;Z)V

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final H2(Lcom/p1/mobile/putong/live/external/page/setting/a;Z)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->anchorId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->l2(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->updateFollowPushStatus(Ljava/lang/String;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ofs;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/ofs;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/pfs;

    .line 28
    .line 29
    invoke-direct {v2, p0, p1, p2}, Ll/pfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/b;Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public z2()Lcom/p1/mobile/putong/live/external/page/setting/b$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/b;->a:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    .line 2
    .line 3
    return-object p0
.end method
