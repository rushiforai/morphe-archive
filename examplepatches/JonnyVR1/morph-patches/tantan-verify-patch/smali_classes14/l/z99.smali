.class public Ll/z99;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:I

.field public S:D

.field public T:D

.field public U:D

.field public V:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0xa

    .line 5
    .line 6
    iput p1, p0, Ll/z99;->R:I

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/z99;->S:D

    .line 11
    .line 12
    const-wide v0, 0x3fd7ae147ae147aeL    # 0.37

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    iput-wide v0, p0, Ll/z99;->T:D

    .line 18
    .line 19
    const-wide v0, 0x3fc851eb851eb852L    # 0.19

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    iput-wide v0, p0, Ll/z99;->U:D

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/payWillInfo"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic b3(Ll/z99;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z99;->n3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/z99;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z99;->m3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public d3()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->pn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_NONE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-wide v0, p0, Ll/z99;->S:D

    .line 19
    .line 20
    iget-wide v2, p0, Ll/z99;->T:D

    .line 21
    .line 22
    cmpl-double v0, v0, v2

    .line 23
    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Or()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iget-wide v0, p0, Ll/z99;->S:D

    .line 44
    .line 45
    iget-wide v2, p0, Ll/z99;->U:D

    .line 46
    .line 47
    cmpg-double p0, v0, v2

    .line 48
    .line 49
    if-gez p0, :cond_2

    .line 50
    .line 51
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->As()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    iget-wide v0, p0, Ll/z99;->S:D

    .line 72
    .line 73
    iget-wide v2, p0, Ll/z99;->U:D

    .line 74
    .line 75
    cmpg-double p0, v0, v2

    .line 76
    .line 77
    if-gez p0, :cond_4

    .line 78
    .line 79
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_NONE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 86
    .line 87
    return-object p0
.end method

.method public e3()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bm()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/z99;->f3()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final f3()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget v0, p0, Ll/z99;->R:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne v0, v2, :cond_1

    .line 21
    .line 22
    iget-wide v3, p0, Ll/z99;->S:D

    .line 23
    .line 24
    iget-wide v5, p0, Ll/z99;->U:D

    .line 25
    .line 26
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-ltz p0, :cond_1

    .line 31
    .line 32
    return v2

    .line 33
    :cond_1
    return v1
.end method

.method public g3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public h3()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bm()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/z99;->f3()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public i3()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bm()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    return v2

    .line 33
    :cond_1
    iget v0, p0, Ll/z99;->R:I

    .line 34
    .line 35
    if-gt v0, v2, :cond_3

    .line 36
    .line 37
    if-ne v0, v2, :cond_2

    .line 38
    .line 39
    iget-wide v3, p0, Ll/z99;->S:D

    .line 40
    .line 41
    iget-wide v5, p0, Ll/z99;->T:D

    .line 42
    .line 43
    cmpg-double p0, v3, v5

    .line 44
    .line 45
    if-gtz p0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return v1

    .line 49
    :cond_3
    :goto_0
    return v2
.end method

.method public j3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public k3()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/z99;->S:D

    .line 2
    .line 3
    iget-wide v2, p0, Ll/z99;->T:D

    .line 4
    .line 5
    cmpl-double p0, v0, v2

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public l3()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bm()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    iget v0, p0, Ll/z99;->R:I

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    if-ne v0, v2, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Ll/z99;->S:D

    .line 38
    .line 39
    iget-wide v5, p0, Ll/z99;->T:D

    .line 40
    .line 41
    cmpl-double p0, v3, v5

    .line 42
    .line 43
    if-lez p0, :cond_2

    .line 44
    .line 45
    return v2

    .line 46
    :cond_2
    return v1
.end method

.method public final synthetic m3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    .line 10
    .line 11
    const/16 v1, 0xa

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    if-gt v0, v1, :cond_0

    .line 16
    .line 17
    iput v0, p0, Ll/z99;->R:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iput v1, p0, Ll/z99;->R:I

    .line 21
    .line 22
    :goto_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    .line 23
    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmpl-double v4, v0, v2

    .line 27
    .line 28
    if-ltz v4, :cond_1

    .line 29
    .line 30
    iput-wide v0, p0, Ll/z99;->S:D

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iput-wide v2, p0, Ll/z99;->S:D

    .line 34
    .line 35
    :goto_1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    .line 36
    .line 37
    cmpl-double v4, v0, v2

    .line 38
    .line 39
    if-ltz v4, :cond_2

    .line 40
    .line 41
    iput-wide v0, p0, Ll/z99;->T:D

    .line 42
    .line 43
    :cond_2
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    .line 44
    .line 45
    cmpl-double p1, v0, v2

    .line 46
    .line 47
    if-ltz p1, :cond_3

    .line 48
    .line 49
    iput-wide v0, p0, Ll/z99;->U:D

    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public final synthetic n3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/x99;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x99;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/y99;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/y99;-><init>(Ll/z99;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public o3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/w99;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w99;-><init>(Ll/z99;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "payWillInfo"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
