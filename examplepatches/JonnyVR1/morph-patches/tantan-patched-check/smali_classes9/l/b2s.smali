.class public Ll/b2s;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/v1s;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/hx50;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/v1s;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, v0, p0}, Ll/v1s;-><init>(Lcom/p1/mobile/android/app/Act;Ll/b2s;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic S3(Ll/b2s;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2s;->X3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic T3(Ll/b2s;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2s;->W3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic U3(Ll/b2s;Ll/hx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2s;->a4(Ll/hx50;)V

    return-void
.end method

.method public static synthetic V3(Ll/b2s;Ll/hx50;Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b2s;->Y3(Ll/hx50;Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;)V

    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/b2s;->j:Ll/hx50;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic W3(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/v1s;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Ll/v1s;->Y(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/v1s;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 14
    .line 15
    .line 16
    const-string p0, "\u63d0\u4ea4\u6210\u529f\uff0c\u5ba1\u6838\u901a\u8fc7\u5373\u53ef\u5c55\u793a\uff0c\u5ba1\u6838\u5931\u8d25\u9700\u91cd\u65b0\u53d1\u9001\u3002"

    .line 17
    .line 18
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic X3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/v1s;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic Y3(Ll/hx50;Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2s;->j:Ll/hx50;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/v1s;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/v1s;->Z(Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Z3(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v0, p0, Ll/b2s;->j:Ll/hx50;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/hx50;->a()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    const/4 v1, 0x0

    .line 36
    move-object v5, p1

    .line 37
    invoke-static/range {v1 .. v7}, Ll/geu;->b(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/y1s;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/y1s;-><init>(Ll/b2s;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/z1s;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/z1s;-><init>(Ll/b2s;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final a4(Ll/hx50;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->b6(ZLjava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/a2s;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/a2s;-><init>(Ll/b2s;Ll/hx50;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallCardEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallCardEventGroup;->openCallCardDialog()Ll/v3f$d;

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
    new-instance v1, Ll/x1s;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/x1s;-><init>(Ll/b2s;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
