.class public Ll/vuu;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Ll/guu;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/ve4;

.field public h:Ljava/lang/String;

.field public i:Z

.field public final j:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/knu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p2, p0, Ll/vuu;->j:Landroid/view/View;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic R2(Ll/vuu;[IZIILjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Ll/vuu;->s3([IZIILjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    return-void
.end method

.method public static synthetic S2(Ll/vuu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vuu;->k3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T2(Ll/vuu;Ll/bcg0;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vuu;->n3(Ll/bcg0;)Z

    move-result p0

    return p0
.end method

.method public static synthetic U2(Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic V2(Ll/vuu;Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vuu;->w3(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic W2(Ll/vuu;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->t3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic X2(Ll/vuu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->r3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y2(Ll/vuu;Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->u3(Ll/bcg0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z2(Ll/vuu;Ll/bcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->v3(Ll/bcg0;)V

    return-void
.end method

.method public static synthetic a3(Ll/vuu;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vuu;->x3(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b3(Ll/vuu;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vuu;->q3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic c3(Ll/vuu;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->F3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V

    return-void
.end method

.method public static synthetic d3(Ll/vuu;Ll/ypu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->o3(Ll/ypu;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/vuu;Ll/ypu;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vuu;->p3(Ll/ypu;)V

    return-void
.end method

.method private k3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "calling"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/vuu;->B3()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p1, p1, Ll/xnu;->c:Ll/ecl0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ecl0;->l()Ll/aj1;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/aj1;->g()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/tuu;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/tuu;-><init>(Ll/vuu;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private n3(Ll/bcg0;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vuu;->f3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p1, p1, Ll/bcg0;->b:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/guu;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/guu;->l()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ne p1, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private synthetic q3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/guu;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/guu;->j()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public B3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;->a()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/c;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/uuu;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/uuu;-><init>(Ll/vuu;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;->c()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lrx/c;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/iuu;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/iuu;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/juu;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/juu;-><init>(Ll/vuu;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/kuu;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/kuu;-><init>(Ll/vuu;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/luu;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/luu;-><init>(Ll/vuu;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final C3(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/guu;

    .line 17
    .line 18
    invoke-virtual {v0, p1, p3, p4, p5}, Ll/guu;->F(Ljava/lang/String;ZZLl/x20;)V

    .line 19
    .line 20
    .line 21
    iget-boolean p3, p0, Ll/vuu;->i:Z

    .line 22
    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p3, Ll/guu;

    .line 28
    .line 29
    invoke-virtual {p3}, Ll/guu;->E()V

    .line 30
    .line 31
    .line 32
    const/4 p3, 0x0

    .line 33
    iput-boolean p3, p0, Ll/vuu;->i:Z

    .line 34
    .line 35
    :cond_1
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p3, Ll/guu;

    .line 38
    .line 39
    invoke-virtual {p3, p2}, Ll/guu;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/vuu;->E3(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public D3(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZILl/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vuu;->g3()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "_bid"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v1, Ll/guu;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {v1, v0, p1, p5}, Ll/guu;->m(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    aget v0, p2, v0

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    aget v0, p2, v0

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual/range {p0 .. p9}, Ll/vuu;->m3(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZILl/x20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    move-object p2, p5

    .line 40
    move p3, p6

    .line 41
    move p4, p7

    .line 42
    move-object p5, p9

    .line 43
    invoke-virtual/range {p0 .. p5}, Ll/vuu;->C3(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final E3(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 10
    .line 11
    const-string v1, "H5-Authorization"

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/vuu;->h:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/wrv;->a()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/ruu;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/ruu;-><init>(Ll/vuu;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Ll/suu;

    .line 44
    .line 45
    invoke-direct {v2, p0, p1}, Ll/suu;-><init>(Ll/vuu;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast v0, Ll/guu;

    .line 59
    .line 60
    iget-object v1, p0, Ll/vuu;->h:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p0, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 63
    .line 64
    invoke-virtual {v0, v1, p1, p0}, Ll/guu;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast v0, Ll/guu;

    .line 71
    .line 72
    iget-object p0, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 73
    .line 74
    invoke-virtual {v0, p1, p0}, Ll/guu;->z(Ljava/lang/String;Ljava/util/Map;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final F3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vuu;->g:Ll/ve4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/guu;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;->getUrl()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/guu;->q(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;->getUpdateType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;->setUpdateType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;->getData()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;->setData(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    .line 45
    .line 46
    iget-object p0, p0, Ll/vuu;->g:Ll/ve4;

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ll/ve4;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatOpenH5Event:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;->b()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/huu;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/huu;-><init>(Ll/vuu;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/muu;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/muu;-><init>(Ll/vuu;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatOpenH5Event:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;->a()Ll/v3f$c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/nuu;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/nuu;-><init>(Ll/vuu;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/ouu;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/ouu;-><init>(Ll/vuu;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;->b()Ll/v3f$d;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lrx/c;

    .line 121
    .line 122
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v1, Ll/puu;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/puu;-><init>(Ll/vuu;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public f3()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public g3()V
    .locals 1

    .line 1
    new-instance v0, Ll/guu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/guu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final h3(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "tantanapp://live/room/"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "tantanapp://voice-live/room/"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public i3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/guu;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/guu;->j()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/guu;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/guu;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final j3(Ljava/lang/String;Ll/ypu;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p2}, Ll/ypu;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x1f4

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/vuu;->i:Z

    .line 11
    .line 12
    const-string v0, "vipCooperation"

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/ypu;->e()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ll/ypu;->m()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, "?watchLiveSeconds="

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/df4;

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ll/df4;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/ahu;->Q2(Ll/hk2;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/df4;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ll/df4;-><init>(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/ahu;->Q2(Ll/hk2;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p0, "&id="

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Ll/ypu;->g()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_0
    return-object p1
.end method

.method public final m3(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZILl/x20;)V
    .locals 11

    .line 1
    new-instance v0, Ll/quu;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v6, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object/from16 v7, p5

    .line 9
    .line 10
    move/from16 v8, p6

    .line 11
    .line 12
    move/from16 v9, p7

    .line 13
    .line 14
    move/from16 v5, p8

    .line 15
    .line 16
    move-object/from16 v10, p9

    .line 17
    .line 18
    invoke-direct/range {v0 .. v10}, Ll/quu;-><init>(Ll/vuu;[IZIILjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/vuu;->g:Ll/ve4;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic o3(Ll/ypu;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/ypu;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/vuu;->h3(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic p3(Ll/ypu;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Ll/ypu;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1}, Ll/vuu;->j3(Ljava/lang/String;Ll/ypu;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/ypu;->l()[I

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {p1}, Ll/ypu;->i()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {p1}, Ll/ypu;->h()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    invoke-virtual {p1}, Ll/ypu;->b()Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-virtual {p1}, Ll/ypu;->k()Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    invoke-virtual {p1}, Ll/ypu;->j()Z

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    invoke-virtual {p1}, Ll/ypu;->f()I

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    invoke-virtual {p1}, Ll/ypu;->d()Ll/x20;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    move-object v1, p0

    .line 42
    invoke-virtual/range {v1 .. v10}, Ll/vuu;->D3(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZILl/x20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic r3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vuu;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/guu;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/guu;->x(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic s3([IZIILjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/guu;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/guu;->B([IZII)V

    .line 6
    .line 7
    .line 8
    move-object p1, p5

    .line 9
    move-object p2, p6

    .line 10
    move p3, p7

    .line 11
    move p4, p8

    .line 12
    move-object p5, p9

    .line 13
    invoke-virtual/range {p0 .. p5}, Ll/vuu;->C3(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic t3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vuu;->i3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u3(Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic v3(Ll/bcg0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bcg0;->c:Ll/ve4;

    .line 2
    .line 3
    iput-object v0, p0, Ll/vuu;->g:Ll/ve4;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/guu;

    .line 8
    .line 9
    iget-object v0, p1, Ll/bcg0;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/guu;->q(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    iget-object p1, p1, Ll/bcg0;->d:Ll/y20;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic w3(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vuu;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/guu;

    .line 8
    .line 9
    iget-object p0, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {v0, p2, p1, p0}, Ll/guu;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic x3(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/guu;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    iget-object p0, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1, p0}, Ll/guu;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string p1, "accessOutterToken"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "[live]webDialog"

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public y3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vuu;->f:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vuu;->j:Landroid/view/View;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vuu;->j:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
