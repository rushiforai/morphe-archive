.class public final Ll/dn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn5;


# instance fields
.field public volatile a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

.field public volatile b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

.field public volatile c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

.field public volatile d:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A2()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->A2()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public B5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Video;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;->B5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Video;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->C3(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public D5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->D5()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public G(Lcom/p1/mobile/putong/app/PutongAct;)Lcom/p1/mobile/putong/app/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->G(Lcom/p1/mobile/putong/app/PutongAct;)Lcom/p1/mobile/putong/app/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public G2()Ll/qyx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->G2()Ll/qyx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public H0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;->H0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/data/Envelope;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->I(Lcom/p1/mobile/putong/data/Envelope;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public L0()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->L0()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public O0(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/Integer;)Ljava/util/HashSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;->O0(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/Integer;)Ljava/util/HashSet;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public P1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->P1()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public P4()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->P4()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public R0()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;->R0()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->R3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashSet;Ljava/lang/Integer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->T3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashSet;Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public U4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->U4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

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

.method public X4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->X4()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Y1(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->Y1(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->getUserByIdInModule(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->a3()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public accessOutterToken()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->accessOutterToken()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public accessToken()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public alipayAuthWithErrorCode(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alipay/sdk/app/AuthTask;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->alipayAuthWithErrorCode(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Ll/tq8;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->a()Ll/tq8;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ll/hbs;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->d:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/LiveCommonService;->a()Ll/hbs;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c2(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->c2(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clientNeedsForceUpdate()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->clientNeedsForceUpdate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public counter_()Lcom/p1/mobile/putong/data/Counter;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->counter_()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->c:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;->nh()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->G9()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->x9()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()Ll/bo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->a()Ll/bo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAuthData()Ll/gxd0;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSignOutJumpAct()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->getSignOutJumpAct()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j0()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->j0()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l3(Ljava/util/List;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->l3(Ljava/util/List;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l5()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->l5()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public me()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->me()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public me_()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public mergeNetworkStateIntoLocalState(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->mergeNetworkStateIntoLocalState(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public pollUserCounters()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->pollUserCounters()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public queryMe()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->queryMe()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->r(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public sendThirdPartLoginResult(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->sendThirdPartLoginResult(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public signOut()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->signOut()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public signedIn_()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/bzd0;->b()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public t2()Ll/s0y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->t2()Ll/s0y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t5()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountCommonService;->Vs()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public trackPlayerBlockTime(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->trackPlayerBlockTime(JLjava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->u4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public userId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dn5;->getAuthData()Ll/gxd0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/dn5;->getAuthData()Ll/gxd0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/AuthData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0
.end method

.method public v0()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->v0()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z5(Ll/pcj;Lrx/subjects/a;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;>;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dn5;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;->z5(Ll/pcj;Lrx/subjects/a;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
