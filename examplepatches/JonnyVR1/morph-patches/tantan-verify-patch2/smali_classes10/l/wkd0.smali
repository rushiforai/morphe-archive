.class public Ll/wkd0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/tjd0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/nv2;

.field public j:Z

.field public k:Ll/kcg0;

.field public l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public m:Ll/zed0;

.field public n:Lcom/p1/mobile/android/app/Dialog;

.field public o:Z

.field public p:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Ll/dum;Ll/zed0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/wkd0;->m:Ll/zed0;

    .line 5
    .line 6
    iget-object p1, p2, Ll/zed0;->l:Ll/nv2;

    .line 7
    .line 8
    iput-object p1, p0, Ll/wkd0;->i:Ll/nv2;

    .line 9
    .line 10
    new-instance p1, Ll/tjd0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/tjd0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/jsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jsv;->c()Z

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

.method public static synthetic K3(Ll/wkd0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wkd0;->V4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    return-void
.end method

.method public static synthetic L3(Ll/wkd0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wkd0;->O4(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

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

.method public static synthetic N3()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/wkd0;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wkd0;->Q4(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P3(Ll/wkd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->J4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S3(Ll/wkd0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->S4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic T3(Ll/wkd0;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->R4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic U3(Ll/wkd0;Ll/y20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wkd0;->K4(Ll/y20;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic V3(Ll/wkd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->M4()V

    return-void
.end method

.method private V4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 1

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCallId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/wkd0;->b5(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/16 v0, 0xd

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCallId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/wkd0;->n4(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/wkd0;->v4()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public static synthetic W3(Ll/wkd0;Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wkd0;->P4(Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic X3(Ll/wkd0;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wkd0;->y4(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Y3(Ll/wkd0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wkd0;->x4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Z3(Ll/wkd0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wkd0;->N4(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a4(Ll/y20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b4(Ll/wkd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->H4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c4(Ll/wkd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->A4()V

    return-void
.end method

.method public static synthetic d4(Ll/wkd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->C4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e4(Ll/wkd0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->D4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f4(Ll/wkd0;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wkd0;->F4(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g4(Ll/wkd0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->G4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h4(Ll/wkd0;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->I4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic i4(Ll/wkd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->z4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j4(Ll/wkd0;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic k4(Ll/wkd0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->E4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l4(Ll/wkd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->L4()V

    return-void
.end method

.method private m4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->x3(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/xjd0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/xjd0;-><init>(Ll/wkd0;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/yjd0;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/yjd0;-><init>(Ll/wkd0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private x4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wkd0;->T4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wkd0;->U4()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method


# virtual methods
.method public final synthetic A4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/tjd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tjd0;->e()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wkd0;->u4()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wkd0;->r4()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic B4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wkd0;->Z4()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic E4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wkd0;->q4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wkd0;->v4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic F4(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    iput-boolean p2, p0, Ll/wkd0;->o:Z

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/wkd0;->d5(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/wkd0;->Z4()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic G4(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic H4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic J4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K4(Ll/y20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput-boolean p1, p0, Ll/wkd0;->o:Z

    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->w4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->p4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N4(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/wkd0;->m4(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic O4(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/wkd0;->W4(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic P4(Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/Long;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x1e

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p3, v0, v2

    .line 11
    .line 12
    if-gtz p3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/wkd0;->W4(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wb:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic Q4(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/mdc0;->D0:I

    .line 2
    .line 3
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/TextView;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/mdc0;->a:I

    .line 15
    .line 16
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->S0:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/vkd0;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/vkd0;-><init>(Ll/wkd0;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    sget v0, Ll/mdc0;->f0:I

    .line 36
    .line 37
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    check-cast p3, Landroid/widget/TextView;

    .line 42
    .line 43
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    new-instance p2, Ll/vjd0;

    .line 47
    .line 48
    invoke-direct {p2, p0, p1}, Ll/vjd0;-><init>(Ll/wkd0;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    new-instance p2, Ll/wjd0;

    .line 55
    .line 56
    invoke-direct {p2, p0, p1, p3}, Ll/wjd0;-><init>(Ll/wkd0;Ljava/lang/String;Landroid/widget/TextView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p2}, Ll/wkd0;->c5(Ll/y20;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic R4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->v4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wkd0;->v4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/ujd0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ujd0;-><init>(Ll/wkd0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0}, Ll/wkd0;->Y4(Ll/y20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public T4()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/wkd0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/wkd0;->j:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public U4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/wkd0;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final W4(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->M1:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/wkd0;->k:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->T6(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/zjd0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/zjd0;-><init>(Ll/wkd0;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/akd0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/akd0;-><init>(Ll/wkd0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public X4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Y7(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/kkd0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/kkd0;-><init>(Ll/wkd0;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/lkd0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/lkd0;-><init>(Ll/wkd0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Y4(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->x7()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/tkd0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/tkd0;-><init>(Ll/wkd0;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ukd0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ukd0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final Z4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->C1:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->W0:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z5:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ll/ikd0;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/ikd0;-><init>(Ll/wkd0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/jkd0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/jkd0;-><init>(Ll/wkd0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Ll/wkd0;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 70
    .line 71
    return-void
.end method

.method public final a5(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/tjd0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/tjd0;->s(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "android.permission.CAMERA"

    .line 9
    .line 10
    filled-new-array {p1}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/tjd0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/tjd0;->e()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/wkd0;->r4()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wkd0;->u4()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/wkd0;->o4()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final b5(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wb:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-wide/16 v1, 0x1e

    .line 10
    .line 11
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    iget-object v2, p0, Ll/wkd0;->m:Ll/zed0;

    .line 26
    .line 27
    sget v3, Ll/yec0;->S2:I

    .line 28
    .line 29
    invoke-static {}, Ll/qag0;->f()Ll/rq2;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Ll/xzs;ILl/rq2;)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 43
    .line 44
    new-instance v2, Ll/skd0;

    .line 45
    .line 46
    invoke-direct {v2, p0, p1, v0}, Ll/skd0;-><init>(Ll/wkd0;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final c5(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/bkd0;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/bkd0;-><init>(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/wkd0;->k:Ll/kcg0;

    .line 29
    .line 30
    return-void
.end method

.method public d5(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E1:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/wkd0;->X4(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/z310;

    .line 10
    .line 11
    const/16 v0, 0x1130

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ll/z310;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/h0m;

    .line 21
    .line 22
    invoke-interface {p1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/wkd0;->v4()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->delayStartVideoPreview()Ll/v3f$c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public e5()V
    .locals 2

    .line 1
    new-instance v0, Ll/c210;

    .line 2
    .line 3
    const/16 v1, 0x1130

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/c210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/szl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/szl;->f()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wkd0;->v4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final n4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->l:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o4()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.CAMERA"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/ckd0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/ckd0;-><init>(Ll/wkd0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final p4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final q4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->W7(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/mkd0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/mkd0;-><init>(Ll/wkd0;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/nkd0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/nkd0;-><init>(Ll/wkd0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public r4()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/wkd0;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/dkd0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/dkd0;-><init>(Ll/wkd0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/wkd0;->Y4(Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public s4(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a1:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->P1:I

    .line 16
    .line 17
    new-instance v2, Ll/gkd0;

    .line 18
    .line 19
    invoke-direct {v2, p0, p1}, Ll/gkd0;-><init>(Ll/wkd0;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w1:I

    .line 27
    .line 28
    new-instance v1, Ll/hkd0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/hkd0;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/wkd0;->p:Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->f()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/fkd0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/fkd0;-><init>(Ll/wkd0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/zed0;->O4()Lrx/c;

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
    new-instance v1, Ll/okd0;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/okd0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/pkd0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/pkd0;-><init>(Ll/wkd0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/qkd0;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/qkd0;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/rkd0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/rkd0;-><init>(Ll/wkd0;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public t4(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "android.permission.CAMERA"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wkd0;->o4()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-boolean v0, p0, Ll/wkd0;->o:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/ekd0;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Ll/ekd0;-><init>(Ll/wkd0;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/wkd0;->Y4(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, Ll/wkd0;->d5(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final u4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/tjd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tjd0;->l()Landroid/widget/FrameLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/z310;

    .line 13
    .line 14
    const/16 v1, 0x1130

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/h0m;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    check-cast v0, Ll/v14;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p0, Ll/tjd0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/tjd0;->l()Landroid/widget/FrameLayout;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, v1, p0}, Ll/v14;->t1(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public v4()V
    .locals 2

    .line 1
    new-instance v0, Ll/c210;

    .line 2
    .line 3
    const/16 v1, 0x1130

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/c210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/szl;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ll/szl;->a()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/tjd0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/tjd0;->k()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/wkd0;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    invoke-static {v0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/wkd0;->p:Lcom/p1/mobile/android/app/Dialog;

    .line 32
    .line 33
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final w4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Ll/efv;->l:Ljava/lang/String;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->m:I

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic y4(Ljava/lang/String;Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wkd0;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ll/zed0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/wkd0;->a5(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wkd0;->m:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
