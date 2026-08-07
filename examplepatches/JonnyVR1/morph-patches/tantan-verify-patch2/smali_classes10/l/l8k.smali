.class public Ll/l8k;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/t8k;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ll/nln0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/nln0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Ll/nln0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/t8k;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/t8k;-><init>(Ll/l8k;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/l8k;->j:Ll/nln0;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic S3(Ll/l8k;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8k;->o4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic T3(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x6

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V3(Ll/l8k;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8k;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/l8k;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8k;->l4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X3(Ll/l8k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8k;->k4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y3(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/fln0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->C5:I

    .line 12
    .line 13
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic Z3(Ll/l8k;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8k;->q4()V

    return-void
.end method

.method public static synthetic a4(Ll/l8k;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8k;->p4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b4(Ll/l8k;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8k;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V

    return-void
.end method

.method public static synthetic c4(Ll/l8k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l8k;->j4(Landroid/view/View;)V

    return-void
.end method

.method private synthetic l4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    new-instance v0, Ll/i8k;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/i8k;-><init>(Ll/l8k;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Ll/l8k;->h4(ZLl/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private p4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/t8k;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/t8k;

    .line 11
    .line 12
    iget-object p0, p0, Ll/l8k;->j:Ll/nln0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 15
    .line 16
    invoke-virtual {v0, p1, p0}, Ll/t8k;->R(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->h2:I

    .line 11
    .line 12
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o0:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/j8k;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/j8k;-><init>(Ll/l8k;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public e4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l8k;->j:Ll/nln0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 4
    .line 5
    invoke-static {v0}, Ll/fln0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/th0$a;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y2:I

    .line 21
    .line 22
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->p0:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/h8k;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/h8k;-><init>(Ll/l8k;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-virtual {p0, v0}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, v0}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    invoke-virtual {p0}, Ll/l8k;->s4()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "closeGameSuccess,id="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voiceGrabHat"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/l8k;->j:Ll/nln0;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/nln0;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/t8k;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/ain0;->f()Ll/ain0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/ain0;->k()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final g4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/l8k;->i4()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, v1}, Ll/eln0;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/k8k;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/k8k;-><init>(Ll/l8k;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/r5k;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final h4(ZLl/x20;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/eln0;->h(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance p1, Ll/y7k;

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ll/y7k;-><init>(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    new-instance p2, Ll/r5k;

    .line 27
    .line 28
    invoke-direct {p2}, Ll/r5k;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-interface {p2}, Ll/x20;->call()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final i4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l8k;->j:Ll/nln0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nln0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic j4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8k;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8k;->u4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/t8k;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic n4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8k;->q4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l8k;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/eln0;->g(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/g8k;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/g8k;-><init>(Ll/l8k;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public r4(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v1, 0x1b62

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0, v3, p1, v1}, Ll/csq;->b(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p0, v3, p1, v1}, Ll/csq;->e(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "grabHat"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public s4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "live_id"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "anchor_id"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_audio_join_hat_game"

    .line 40
    .line 41
    const-string v2, "p_anchor_audio_room"

    .line 42
    .line 43
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0}, Ll/l8k;->i4()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Ll/eln0;->j(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/z7k;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/z7k;-><init>(Ll/l8k;)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/r5k;

    .line 74
    .line 75
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->openHatCpDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/x7k;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/x7k;-><init>(Ll/l8k;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/aj1;->l()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/c8k;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/c8k;-><init>(Ll/l8k;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/d8k;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/d8k;-><init>(Ll/l8k;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->stopVoiceGame()Ll/v3f$d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lrx/c;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/e8k;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/e8k;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/f8k;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/f8k;-><init>(Ll/l8k;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startGrabSuccess,id="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voiceGrabHat"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/t8k;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/t8k;->S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/l8k;->j:Ll/nln0;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/nln0;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/t8k;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public u4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/l8k;->i4()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, v1}, Ll/eln0;->k(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/a8k;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/a8k;-><init>(Ll/l8k;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/b8k;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/b8k;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public v4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "stopGrabSuccess,id="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "voiceGrabHat"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/l8k;->j:Ll/nln0;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/nln0;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Ll/t8k;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/t8k;->S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/t8k;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
