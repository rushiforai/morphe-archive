.class public Ll/jjj0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

.field public j:Ll/kcg0;

.field public k:I

.field public l:I

.field public m:Z

.field public final n:Ll/db2;


# direct methods
.method public constructor <init>(Ll/dum;Ll/db2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/jjj0;->m:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/jjj0;->n:Ll/db2;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic J3(Ll/jjj0;Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jjj0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/jjj0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjj0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic L3(Ll/jjj0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjj0;->i4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N3(Ll/jjj0;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjj0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic O3(Ll/jjj0;Ll/gf4;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjj0;->d4(Ll/gf4;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T3(Ll/jjj0;Ll/aiv$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjj0;->f4(Ll/aiv$b;)V

    return-void
.end method

.method public static synthetic U3(Ll/jjj0;Ll/hf4;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jjj0;->c4(Ll/hf4;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private init()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/jjj0;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/aiv;->O0()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/bjj0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/bjj0;-><init>(Ll/jjj0;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/cjj0;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/cjj0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 32
    .line 33
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/hiv;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/hiv;->u()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/djj0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/djj0;-><init>(Ll/jjj0;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ll/ejj0;

    .line 53
    .line 54
    invoke-direct {p0}, Ll/ejj0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private p4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jjj0;->j:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/gjj0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/gjj0;-><init>(Ll/jjj0;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/hjj0;

    .line 32
    .line 33
    invoke-direct {v2}, Ll/hjj0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/jjj0;->j:Ll/kcg0;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/yij0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/yij0;-><init>(Ll/jjj0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/hf4;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/ajj0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/ajj0;-><init>(Ll/jjj0;)V

    .line 17
    .line 18
    .line 19
    const-class v1, Ll/gf4;

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public V3()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 2
    .line 3
    const-string v1, "created"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 12
    .line 13
    const-string v0, "pending"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public W3()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 2
    .line 3
    const-string v1, "completed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jjj0;->b4()Z

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

.method public final X3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjj0;->n:Ll/db2;

    .line 2
    .line 3
    iget-object v0, v0, Ll/kf2;->k:Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->d:Lv/VText;

    .line 11
    .line 12
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tb:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/jjj0;->n:Ll/db2;

    .line 18
    .line 19
    iget-object v0, v0, Ll/kf2;->k:Landroid/view/View;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->c:Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;

    .line 24
    .line 25
    const/16 v1, 0x64

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->setProgress(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/jjj0;->n:Ll/db2;

    .line 31
    .line 32
    iget-object v0, v0, Ll/kf2;->k:Landroid/view/View;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->c:Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/jjj0;->n:Ll/db2;

    .line 43
    .line 44
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 45
    .line 46
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->d:Lv/VText;

    .line 49
    .line 50
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final Y3(I)Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget p0, p0, Ll/jjj0;->k:I

    .line 2
    .line 3
    sub-int/2addr p0, p1

    .line 4
    const/4 p1, 0x1

    .line 5
    if-ge p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    :cond_0
    div-int/lit8 p1, p0, 0x3c

    .line 9
    .line 10
    rem-int/lit8 p1, p1, 0x3c

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    rem-int/lit8 p0, p0, 0x3c

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "%02d:%02d"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;)Ljava/lang/String;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->entranceUrl:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, "?countDownSeconds="

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget p1, p0, Ll/jjj0;->k:I

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p1, "&liveid="

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p1, "&anchorid="

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public final a4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jjj0;->n:Ll/db2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/kf2;->b4(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final b4()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 2
    .line 3
    const-string v1, "pending"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/civ;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/civ;->p()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget p0, p0, Ll/jjj0;->k:I

    .line 24
    .line 25
    if-lt v0, p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final synthetic c4(Ll/hf4;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jjj0;->W3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic d4(Ll/gf4;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jjj0;->V3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->countDownSeconds:I

    .line 7
    .line 8
    iput v0, p0, Ll/jjj0;->k:I

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->status:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 11
    .line 12
    iput-object v0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->bubbleIdsConfig:Lcom/p1/mobile/putong/live/base/data/BubbleIdsConfig;

    .line 15
    .line 16
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BubbleIdsConfig;->take:I

    .line 17
    .line 18
    iput v0, p0, Ll/jjj0;->l:I

    .line 19
    .line 20
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/civ;

    .line 27
    .line 28
    iget-object v1, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/civ;->D(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->canShowTreasureBox()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x1

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/jjj0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/jjj0;->n4()V

    .line 48
    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->status:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 51
    .line 52
    invoke-virtual {p0, p1, v1}, Ll/jjj0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;Z)V

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    iput-boolean p1, p0, Ll/jjj0;->m:Z

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->hideGiftPacket()Ll/v3f$c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    iput-boolean v1, p0, Ll/jjj0;->m:Z

    .line 73
    .line 74
    return-void
.end method

.method public final synthetic f4(Ll/aiv$b;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Ll/aiv$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "refreshStatus"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object p1, p1, Ll/aiv$b;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Ll/jjj0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    const-string p1, "completed"

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 8
    .line 9
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 10
    .line 11
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/civ;

    .line 16
    .line 17
    iget-object p0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Ll/civ;->D(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/jjj0;->n:Ll/db2;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/kf2;->g4()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/jjj0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->detailInset:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0, p2, p1}, Ll/jjj0;->m4(Ljava/lang/String;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "newUserTreasureBoxGetBubble"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string p2, "newUserTreasureBoxTakeBubble"

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p2}, Ll/vp20;->k()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "liveId"

    .line 58
    .line 59
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    .line 73
    const-string v0, "anchorId"

    .line 74
    .line 75
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    filled-new-array {p2, p0}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p2, "e_live_newsuer_redpakge"

    .line 84
    .line 85
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic i4(Ljava/lang/Long;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 2
    .line 3
    const-string v0, "pending"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 14
    .line 15
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/civ;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/civ;->p()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/vp20;->m()Ll/jsv;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/jsv;->d()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget-object v2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 48
    .line 49
    if-ne v1, v2, :cond_1

    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Ll/civ;

    .line 58
    .line 59
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p1, v1}, Ll/civ;->E(Ljava/lang/Integer;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget p1, p0, Ll/jjj0;->k:I

    .line 67
    .line 68
    if-lt v0, p1, :cond_2

    .line 69
    .line 70
    const-string p1, "completed"

    .line 71
    .line 72
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const/4 v0, 0x0

    .line 77
    invoke-virtual {p0, p1, v0}, Ll/jjj0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/jjj0;->j:Ll/kcg0;

    .line 81
    .line 82
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleById()Ll/v3f$d;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget v0, p0, Ll/jjj0;->l:I

    .line 96
    .line 97
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    iget-object p1, p0, Ll/jjj0;->n:Ll/db2;

    .line 106
    .line 107
    iget-object p1, p1, Ll/kf2;->k:Landroid/view/View;

    .line 108
    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->d:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ll/jjj0;->Y3(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/jjj0;->n:Ll/db2;

    .line 123
    .line 124
    iget-object p1, p1, Ll/kf2;->k:Landroid/view/View;

    .line 125
    .line 126
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->c:Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;

    .line 129
    .line 130
    mul-int/lit8 v0, v0, 0x64

    .line 131
    .line 132
    iget v1, p0, Ll/jjj0;->k:I

    .line 133
    .line 134
    div-int/2addr v0, v1

    .line 135
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;->setProgress(I)V

    .line 136
    .line 137
    .line 138
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/jjj0;->n:Ll/db2;

    .line 139
    .line 140
    iget-object p1, p1, Ll/kf2;->k:Landroid/view/View;

    .line 141
    .line 142
    if-eqz p1, :cond_4

    .line 143
    .line 144
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->c:Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;

    .line 147
    .line 148
    const/4 v0, 0x1

    .line 149
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/jjj0;->n:Ll/db2;

    .line 153
    .line 154
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 155
    .line 156
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->d:Lv/VText;

    .line 159
    .line 160
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    :cond_4
    :goto_1
    return-void
.end method

.method public final j4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/jjj0;->j:Ll/kcg0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    if-nez p2, :cond_1

    .line 9
    .line 10
    iget-object p2, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 11
    .line 12
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    invoke-virtual {p0}, Ll/jjj0;->b4()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/jjj0;->X3()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/jjj0;->k4()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    const-string p2, "completed"

    .line 33
    .line 34
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/jjj0;->X3()V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    const-string p2, "deleted"

    .line 45
    .line 46
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_6

    .line 51
    .line 52
    const-string p2, "taken"

    .line 53
    .line 54
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_4

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_4
    iget-object p2, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 62
    .line 63
    const-string v0, "created"

    .line 64
    .line 65
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    const-string v0, "pending"

    .line 70
    .line 71
    if-eqz p2, :cond_5

    .line 72
    .line 73
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_5

    .line 78
    .line 79
    invoke-direct {p0}, Ll/jjj0;->p4()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_5
    iget-object p2, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 84
    .line 85
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-eqz p2, :cond_7

    .line 90
    .line 91
    invoke-direct {p0}, Ll/jjj0;->p4()V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_6
    :goto_0
    invoke-virtual {p0}, Ll/jjj0;->a4()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 103
    .line 104
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2}, Ll/v3f$c;->p()V

    .line 109
    .line 110
    .line 111
    :cond_7
    :goto_1
    iput-object p1, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 112
    .line 113
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 114
    .line 115
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Ll/civ;

    .line 120
    .line 121
    iget-object p0, p0, Ll/jjj0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBoxStatus;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1, p0}, Ll/civ;->D(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public final k4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/aiv;->j1()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ijj0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ijj0;-><init>(Ll/jjj0;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/zij0;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/zij0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final l4(Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jjj0;->n:Ll/db2;

    .line 2
    .line 3
    iget-object v0, v0, Ll/kf2;->k:Landroid/view/View;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v1, Ll/fjj0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/fjj0;-><init>(Ll/jjj0;Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/jjj0;->n:Ll/db2;

    .line 17
    .line 18
    iget-object p1, p1, Ll/kf2;->k:Landroid/view/View;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->c:Lcom/p1/mobile/putong/live/base/view/CountdownGiftProgressView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/jjj0;->n:Ll/db2;

    .line 29
    .line 30
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/TreasureBoxView;->d:Lv/VText;

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public m4(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isNeedCloseBtn:Z

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/16 p1, 0x1f4

    .line 28
    .line 29
    invoke-static {p1}, Ll/px50;->c(I)Ll/px50$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v0}, Ll/px50$a;->r(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/px50$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jjj0;->a4()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/jjj0;->j:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final n4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jjj0;->n:Ll/db2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/kf2;->b4(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "liveId"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "anchorId"

    .line 36
    .line 37
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {v1, p0}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v1, "e_live_newsuer_redpakge"

    .line 46
    .line 47
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public o4()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jjj0;->init()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
