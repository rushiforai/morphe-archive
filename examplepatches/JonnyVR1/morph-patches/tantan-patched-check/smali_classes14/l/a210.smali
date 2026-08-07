.class public Ll/a210;
.super Ll/eas;
.source "SourceFile"

# interfaces
.implements Ll/tzl;


# instance fields
.field public final a:Ll/v1f;

.field public b:Z

.field public c:I

.field public d:Ll/v6m;

.field public e:Z

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;",
            ">;>;"
        }
    .end annotation
.end field

.field public h:Landroid/content/Context;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;


# direct methods
.method public constructor <init>(Ll/v1f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/a210;->c:I

    .line 6
    .line 7
    new-instance v0, Ll/a210$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/a210$a;-><init>(Ll/a210;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/a210;->f:Ll/y20;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/a210;->g:Ljava/util/ArrayList;

    .line 20
    .line 21
    iput-object p1, p0, Ll/a210;->a:Ll/v1f;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic S0(Ll/a210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a210;->Y0(Ll/zmw;)V

    return-void
.end method

.method public static synthetic T0(Ll/a210;Ll/zmw;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a210;->Z0(Ll/zmw;)V

    return-void
.end method

.method public static bridge synthetic U0(Ll/a210;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210;->g:Ljava/util/ArrayList;

    return-object p0
.end method


# virtual methods
.method public C(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/v6m;->C(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F0(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a210;->b1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/a210;->d:Ll/v6m;

    .line 5
    .line 6
    sget-object p2, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_BYTE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 7
    .line 8
    invoke-interface {p1, p2}, Ll/v6m;->O(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ljava/io/File;

    .line 12
    .line 13
    invoke-static {}, Ll/coi;->p()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ll/cnw;->e(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Ll/tyr;->l:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {p1}, Ll/cnw;->f(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/a210;->a:Ll/v1f;

    .line 35
    .line 36
    iget-object p0, p0, Ll/v1f;->e:Ll/j210;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/j210;->a1()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public V0(ILandroid/view/SurfaceView;)Ll/zmw;
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
    new-instance p1, Ll/s110;

    .line 12
    .line 13
    invoke-direct {p1, p0, v0}, Ll/s110;-><init>(Ll/a210;Ll/zmw;)V

    .line 14
    .line 15
    .line 16
    new-instance p2, Ll/u110;

    .line 17
    .line 18
    invoke-direct {p2, p0, v0}, Ll/u110;-><init>(Ll/a210;Ll/zmw;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/m210;->a(Ll/x20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/a210;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->capture:Lcom/p1/mobile/putong/live/base/data/BLiveCapture;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCapture;->isValid()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    iget-object p1, p0, Ll/a210;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 37
    .line 38
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 39
    .line 40
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->fps:I

    .line 41
    .line 42
    iget-object v1, p0, Ll/a210;->h:Landroid/content/Context;

    .line 43
    .line 44
    new-instance v2, Ll/hyh0;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->capture:Lcom/p1/mobile/putong/live/base/data/BLiveCapture;

    .line 47
    .line 48
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCapture;->width:I

    .line 49
    .line 50
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCapture;->height:I

    .line 51
    .line 52
    invoke-direct {v2, v3, p1}, Ll/hyh0;-><init>(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v1, v2, v0}, Ll/a210;->f1(Landroid/content/Context;Ll/hyh0;Ll/zmw;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p0}, Ll/a210;->W0()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->isValid()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureFps:I

    .line 72
    .line 73
    iget-object v1, p0, Ll/a210;->h:Landroid/content/Context;

    .line 74
    .line 75
    new-instance v2, Ll/hyh0;

    .line 76
    .line 77
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureWidth:I

    .line 78
    .line 79
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureHeight:I

    .line 80
    .line 81
    invoke-direct {v2, v3, p1}, Ll/hyh0;-><init>(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v1, v2, v0}, Ll/a210;->f1(Landroid/content/Context;Ll/hyh0;Ll/zmw;)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    const/16 p2, 0xf

    .line 89
    .line 90
    :goto_0
    invoke-virtual {v0, p2}, Ll/zmw;->y(I)Ll/zmw;

    .line 91
    .line 92
    .line 93
    return-object v0
.end method

.method public W0()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 1

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/jfv;->j()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/jfv;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/jfv;->j()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/vwt;->Q5()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public X0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a210;->a:Ll/v1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/v1f;->b:Ll/v6m;

    .line 4
    .line 5
    iput-object v0, p0, Ll/a210;->d:Ll/v6m;

    .line 6
    .line 7
    invoke-static {}, Ll/m210;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Ll/a210;->b:Z

    .line 12
    .line 13
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-interface {p0, v0}, Ll/v6m;->a0(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic Y0(Ll/zmw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a210;->h:Landroid/content/Context;

    .line 2
    .line 3
    new-instance v1, Ll/hyh0;

    .line 4
    .line 5
    const/16 v2, 0x2d0

    .line 6
    .line 7
    const/16 v3, 0x500

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Ll/hyh0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, v1, p1}, Ll/a210;->f1(Landroid/content/Context;Ll/hyh0;Ll/zmw;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic Z0(Ll/zmw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a210;->h:Landroid/content/Context;

    .line 2
    .line 3
    new-instance v1, Ll/hyh0;

    .line 4
    .line 5
    const/16 v2, 0x1e0

    .line 6
    .line 7
    const/16 v3, 0x280

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Ll/hyh0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0, v1, p1}, Ll/a210;->f1(Landroid/content/Context;Ll/hyh0;Ll/zmw;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

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

.method public a1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a210;->h:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Ll/a210;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 4
    .line 5
    iget-object p1, p0, Ll/a210;->d:Ll/v6m;

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-interface {p1, p2}, Ll/v6m;->z(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

    .line 12
    .line 13
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/wrv;->s()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ll/v6m;->s(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public c1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/a210;->d:Ll/v6m;

    .line 3
    .line 4
    return-void
.end method

.method public d1(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a210;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e1()V
    .locals 2

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    const-string v1, "recorder release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

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

.method public final f1(Landroid/content/Context;Ll/hyh0;Ll/zmw;)V
    .locals 1

    .line 1
    iget p0, p2, Ll/hyh0;->b:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    iget v0, p2, Ll/hyh0;->a:I

    .line 5
    .line 6
    int-to-float v0, v0

    .line 7
    div-float/2addr p0, v0

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p1, p2, v0, p0}, Ll/pvh0;->c(Landroid/content/Context;Ll/hyh0;IF)Ll/hyh0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object p2, p0

    .line 17
    :goto_0
    iget p0, p2, Ll/hyh0;->b:I

    .line 18
    .line 19
    iget p1, p2, Ll/hyh0;->a:I

    .line 20
    .line 21
    invoke-virtual {p3, p0, p1}, Ll/zmw;->z(II)Ll/zmw;

    .line 22
    .line 23
    .line 24
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string p1, "with: "

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget p1, p2, Ll/hyh0;->b:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, " , height: "

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget p1, p2, Ll/hyh0;->a:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "videoChat"

    .line 51
    .line 52
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public g1(Ll/w6m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

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

.method public h1(Landroid/view/SurfaceView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/a210$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/a210$b;-><init>(Ll/a210;Landroid/view/SurfaceView;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i1(Ll/zmw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210;->d:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->w(Ll/zmw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j1(Landroid/view/SurfaceHolder;Landroid/view/SurfaceView;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/a210;->c:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget-boolean p1, p0, Ll/a210;->b:Z

    .line 7
    .line 8
    iput p1, p0, Ll/a210;->c:I

    .line 9
    .line 10
    :cond_0
    iget-boolean p1, p0, Ll/a210;->e:Z

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Ll/a210;->f:Ll/y20;

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;->ACTION_BEFORE_PREVIEW:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;

    .line 17
    .line 18
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget p1, p0, Ll/a210;->c:I

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ll/a210;->V0(ILandroid/view/SurfaceView;)Ll/zmw;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/a210;->i1(Ll/zmw;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string p2, "mediaEngine.startPreview lastPreviewCameraID:"

    .line 33
    .line 34
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget p2, p0, Ll/a210;->c:I

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string p2, "videoChat"

    .line 47
    .line 48
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/a210;->f:Ll/y20;

    .line 52
    .line 53
    sget-object p2, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;->ACTION_AFTER_PREVIEW:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;

    .line 54
    .line 55
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    const/4 p1, 0x0

    .line 59
    iput-boolean p1, p0, Ll/a210;->e:Z

    .line 60
    .line 61
    return-void
.end method

.method public k1(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a210;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
