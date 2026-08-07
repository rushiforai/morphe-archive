.class public Ll/b210;
.super Ll/eas;
.source "SourceFile"

# interfaces
.implements Ll/szl;


# instance fields
.field public final a:Ll/u1f;

.field public b:Z

.field public c:J

.field public d:I

.field public e:Ll/v6m;

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

.field public g:Z

.field public h:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;",
            ">;>;"
        }
    .end annotation
.end field

.field public k:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Landroid/content/Context;

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/u1f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/b210;->d:I

    .line 6
    .line 7
    new-instance v0, Ll/b210$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/b210$b;-><init>(Ll/b210;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/b210;->i:Ll/y20;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/b210;->j:Ljava/util/ArrayList;

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 22
    .line 23
    iput-object v0, p0, Ll/b210;->l:Landroid/content/Context;

    .line 24
    .line 25
    iput-object p1, p0, Ll/b210;->a:Ll/u1f;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic S0(Ll/b210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b210;->e1(Ll/zmw;)V

    return-void
.end method

.method public static synthetic T0(Ll/b210;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b210;->h1(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic U0(Ll/b210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b210;->f1(Ll/zmw;)V

    return-void
.end method

.method public static synthetic V0(Ll/b210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b210;->g1(Ll/zmw;)V

    return-void
.end method

.method public static synthetic W0(Ll/b210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b210;->d1(Ll/zmw;)V

    return-void
.end method

.method public static bridge synthetic X0(Ll/b210;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->j:Ljava/util/ArrayList;

    return-object p0
.end method

.method private synthetic d1(Ll/zmw;)V
    .locals 3

    .line 1
    new-instance v0, Ll/hyh0;

    .line 2
    .line 3
    const/16 v1, 0x2d0

    .line 4
    .line 5
    const/16 v2, 0x500

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/hyh0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/b210;->o1(Ll/hyh0;Ll/zmw;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public C(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->C(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/eas;->T(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/b210;->k:Ll/z20;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public Y0(ILandroid/view/SurfaceView;)Ll/zmw;
    .locals 6

    .line 1
    new-instance v0, Ll/zmw;

    .line 2
    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    move v1, p1

    .line 7
    move-object v5, p2

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/zmw;-><init>(IIIILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/r110;

    .line 12
    .line 13
    invoke-direct {p1, p0, v0}, Ll/r110;-><init>(Ll/b210;Ll/zmw;)V

    .line 14
    .line 15
    .line 16
    new-instance p2, Ll/t110;

    .line 17
    .line 18
    invoke-direct {p2, p0, v0}, Ll/t110;-><init>(Ll/b210;Ll/zmw;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/v110;

    .line 25
    .line 26
    invoke-direct {p1, p0, v0}, Ll/v110;-><init>(Ll/b210;Ll/zmw;)V

    .line 27
    .line 28
    .line 29
    new-instance p2, Ll/w110;

    .line 30
    .line 31
    invoke-direct {p2, p0, v0}, Ll/w110;-><init>(Ll/b210;Ll/zmw;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/b210;->a1()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->isValid()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureFps:I

    .line 50
    .line 51
    new-instance v1, Ll/hyh0;

    .line 52
    .line 53
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureWidth:I

    .line 54
    .line 55
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureHeight:I

    .line 56
    .line 57
    invoke-direct {v1, v2, p1}, Ll/hyh0;-><init>(II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v1, v0}, Ll/b210;->o1(Ll/hyh0;Ll/zmw;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const/16 p2, 0xf

    .line 65
    .line 66
    :goto_0
    invoke-virtual {v0, p2}, Ll/zmw;->y(I)Ll/zmw;

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public Z0()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b210;->h:Ll/pf60;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a1()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b210;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/jfv;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/jfv;->j()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/jfv;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/jfv;->j()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/vwt;->Q5()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    iput-object v0, p0, Ll/b210;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "video quality:"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/b210;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->toJson()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "live_sdk"

    .line 63
    .line 64
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object p0, p0, Ll/b210;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 68
    .line 69
    return-object p0
.end method

.method public b1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->b:Ll/v6m;

    .line 4
    .line 5
    iput-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 6
    .line 7
    invoke-static {}, Ll/l210;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Ll/b210;->b:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-interface {v0, v1}, Ll/v6m;->a0(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/x110;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/x110;-><init>(Ll/b210;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/b210;->m:Ll/kcg0;

    .line 37
    .line 38
    return-void
.end method

.method public final c1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic e1(Ll/zmw;)V
    .locals 3

    .line 1
    new-instance v0, Ll/hyh0;

    .line 2
    .line 3
    const/16 v1, 0x1e0

    .line 4
    .line 5
    const/16 v2, 0x280

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/hyh0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/b210;->o1(Ll/hyh0;Ll/zmw;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/b210;->c:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/b210;->c1()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/b210;->b:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->y7:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/v6m;->f()I

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p0, Ll/b210;->b:Z

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget v0, p0, Ll/b210;->d:I

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    if-ne v0, v2, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_0
    iput v1, p0, Ll/b210;->d:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/b210;->i:Ll/y20;

    .line 51
    .line 52
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;->ACTION_SWITCH_CAMERA:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;

    .line 53
    .line 54
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    iput-wide v0, p0, Ll/b210;->c:J

    .line 62
    .line 63
    :cond_3
    return-void
.end method

.method public final synthetic f1(Ll/zmw;)V
    .locals 3

    .line 1
    new-instance v0, Ll/hyh0;

    .line 2
    .line 3
    const/16 v1, 0x2d0

    .line 4
    .line 5
    const/16 v2, 0x500

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/hyh0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/b210;->o1(Ll/hyh0;Ll/zmw;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g()Ll/mob0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->g()Ll/mob0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic g1(Ll/zmw;)V
    .locals 3

    .line 1
    new-instance v0, Ll/hyh0;

    .line 2
    .line 3
    const/16 v1, 0x1e0

    .line 4
    .line 5
    const/16 v2, 0x280

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/hyh0;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/b210;->o1(Ll/hyh0;Ll/zmw;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic h1(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/b210;->l:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/qj20;->x(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ll/v6m;->z(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->s()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0, v0}, Ll/v6m;->s(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public k1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b210;->m:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 8
    .line 9
    return-void
.end method

.method public l1(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b210;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m0(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/b210;->j1()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/p6s;->F1()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_ENGINE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ll/v6m;->O(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 19
    .line 20
    .line 21
    sget-object p1, Ll/tyr;->k:Ljava/util/ArrayList;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/b210;->e:Ll/v6m;

    .line 26
    .line 27
    invoke-interface {v0, p1}, Ll/v6m;->l(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/b210;->a:Ll/u1f;

    .line 31
    .line 32
    iget-object p0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->a1()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    sget-object p1, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_BYTE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Ll/v6m;->O(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ljava/io/File;

    .line 44
    .line 45
    invoke-static {}, Ll/coi;->p()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Ll/cnw;->e(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Ll/tyr;->l:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-static {p1}, Ll/cnw;->f(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/b210;->a:Ll/u1f;

    .line 67
    .line 68
    iget-object p0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->a1()V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public m1()V
    .locals 2

    .line 1
    const-string v0, "[live]sdk_engine"

    .line 2
    .line 3
    const-string v1, "recorder release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n1()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/b210;->d:I

    .line 3
    .line 4
    return-void
.end method

.method public final o1(Ll/hyh0;Ll/zmw;)V
    .locals 3

    .line 1
    iget v0, p1, Ll/hyh0;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p1, Ll/hyh0;->a:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget-object v1, p0, Ll/b210;->l:Landroid/content/Context;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, p1, v2, v0}, Ll/pvh0;->c(Landroid/content/Context;Ll/hyh0;IF)Ll/hyh0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object p1, v0

    .line 19
    :goto_0
    iget v0, p1, Ll/hyh0;->b:I

    .line 20
    .line 21
    iget v1, p1, Ll/hyh0;->a:I

    .line 22
    .line 23
    invoke-virtual {p2, v0, v1}, Ll/zmw;->z(II)Ll/zmw;

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/pf60;

    .line 27
    .line 28
    iget v0, p1, Ll/hyh0;->b:I

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v1, p1, Ll/hyh0;->a:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {p2, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iput-object p2, p0, Ll/b210;->h:Ll/pf60;

    .line 44
    .line 45
    new-instance p0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string p2, "LiveEngine setCameraSize,with: "

    .line 48
    .line 49
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget p2, p1, Ll/hyh0;->b:I

    .line 53
    .line 54
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p2, " , height: "

    .line 58
    .line 59
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget p1, p1, Ll/hyh0;->a:I

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "LivePkConstant"

    .line 72
    .line 73
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public p1(Ll/w6m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->K(Ll/w6m;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public q1(Landroid/view/SurfaceView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/b210$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/b210$a;-><init>(Ll/b210;Landroid/view/SurfaceView;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public r1(Ll/zmw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b210;->e:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->w(Ll/zmw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final s1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->g:Ll/r610;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/b210;->a()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public t1(Landroid/view/SurfaceHolder;Landroid/view/SurfaceView;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/b210;->d:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget-boolean p1, p0, Ll/b210;->b:Z

    .line 7
    .line 8
    iput p1, p0, Ll/b210;->d:I

    .line 9
    .line 10
    :cond_0
    iget-boolean p1, p0, Ll/b210;->g:Z

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/b210;->s1()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/b210;->i:Ll/y20;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;->ACTION_BEFORE_PREVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, Ll/b210;->d:I

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Ll/b210;->Y0(ILandroid/view/SurfaceView;)Ll/zmw;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/b210;->r1(Ll/zmw;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string p2, "mediaEngine.startPreview lastPreviewCameraID:"

    .line 36
    .line 37
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget p2, p0, Ll/b210;->d:I

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string p2, "[live]sdk_engine"

    .line 50
    .line 51
    invoke-static {p2, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/b210;->i:Ll/y20;

    .line 55
    .line 56
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;->ACTION_AFTER_PREVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;

    .line 57
    .line 58
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Ll/b210;->g:Z

    .line 63
    .line 64
    return-void
.end method

.method public u1(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b210;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y0(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/b210;->k:Ll/z20;

    .line 2
    .line 3
    return-void
.end method
