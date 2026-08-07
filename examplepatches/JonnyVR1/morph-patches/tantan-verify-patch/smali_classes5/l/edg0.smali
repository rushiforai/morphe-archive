.class public Ll/edg0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/hdg0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

.field public final b:Ll/c;

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;Ll/c;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 5
    .line 6
    iput-object p2, p0, Ll/edg0;->b:Ll/c;

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-static {p0}, Ll/jdg0;->b(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e0(Ll/edg0;Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edg0;->t0(Ljava/util/ArrayList;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic g0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->S()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static synthetic h0(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edg0;->A0(Lcom/p1/mobile/putong/data/Contract;)V

    return-void
.end method

.method public static synthetic i0(Ll/edg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/edg0;->D0()V

    return-void
.end method

.method public static synthetic j0(Ll/edg0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edg0;->u0(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic k0(Ll/edg0;Lcom/p1/mobile/putong/data/ContractEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edg0;->E0(Lcom/p1/mobile/putong/data/ContractEnvelope;)V

    return-void
.end method

.method public static synthetic l0(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edg0;->z0(Lcom/p1/mobile/putong/data/Contract;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic m0(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edg0;->y0(Lcom/p1/mobile/putong/data/Contract;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic n0(Ll/edg0;Ll/x20;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edg0;->x0(Ll/x20;Lcom/p1/mobile/putong/data/Contract;)V

    return-void
.end method

.method public static synthetic o0(Ll/edg0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/edg0;->s0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic p0(Ll/fp60$a;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->T()Lrx/c;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic q0(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r0(Ll/edg0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edg0;->C0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic s0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/hdg0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/hdg0;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/hdg0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/hdg0;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/edg0;->I0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic D0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/bpc0;->c()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/data/ContractEnvelope;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    new-instance v1, Ll/tcg0;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/tcg0;-><init>()V

    .line 11
    .line 12
    .line 13
    const-wide/16 v2, 0x3e8

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ContractEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 19
    .line 20
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 21
    .line 22
    const/16 v2, 0xc8

    .line 23
    .line 24
    if-ne v1, v2, :cond_0

    .line 25
    .line 26
    iget v1, v0, Lcom/p1/mobile/putong/data/Meta;->subCode:I

    .line 27
    .line 28
    const v2, 0x11171

    .line 29
    .line 30
    .line 31
    if-ne v1, v2, :cond_0

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ContractEnvelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/R$string;->k:I

    .line 50
    .line 51
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 59
    .line 60
    .line 61
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 62
    .line 63
    new-instance v0, Ll/ucg0;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/ucg0;-><init>(Ll/edg0;)V

    .line 66
    .line 67
    .line 68
    const-wide/16 v1, 0x7d0

    .line 69
    .line 70
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public F0(Lcom/p1/mobile/putong/data/Contract;Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/edg0;->b:Ll/c;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/c;->d(Lcom/p1/mobile/putong/data/Contract;)Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Io:I

    .line 18
    .line 19
    new-instance v2, Ll/ddg0;

    .line 20
    .line 21
    invoke-direct {v2, p0, p2, p1}, Ll/ddg0;-><init>(Ll/edg0;Ll/x20;Lcom/p1/mobile/putong/data/Contract;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iget-object v0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 29
    .line 30
    sget v1, Ll/c9c0;->S1:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->o0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ho:I

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->s0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    new-instance v0, Ll/rcg0;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Ll/rcg0;-><init>(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B0(Landroid/content/DialogInterface$OnShowListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    new-instance v0, Ll/scg0;

    .line 56
    .line 57
    invoke-direct {v0, p0, p1}, Ll/scg0;-><init>(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public G0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 6
    .line 7
    const-string v1, "p_settings,auto"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/data/Contract;)V
    .locals 1

    .line 1
    new-instance v0, Ll/adg0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/adg0;-><init>(Ll/edg0;Lcom/p1/mobile/putong/data/Contract;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Ll/edg0;->F0(Lcom/p1/mobile/putong/data/Contract;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final I0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->Q(Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/bdg0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/bdg0;-><init>(Ll/edg0;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/cdg0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/cdg0;-><init>(Ll/edg0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->T()Lrx/c;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/qcg0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qcg0;-><init>(Ll/edg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/fp60;->B()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/vcg0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/vcg0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/wcg0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/wcg0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/xcg0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/xcg0;-><init>(Ll/edg0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/ycg0;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/ycg0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/zcg0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/zcg0;-><init>(Ll/edg0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p0}, Ll/jdg0;->b(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t0(Ljava/util/ArrayList;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edg0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic u0(Ljava/util/ArrayList;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/edg0;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/edg0;->b:Ll/c;

    .line 13
    .line 14
    const-string v2, "auto_renew_subscriptions_option_type"

    .line 15
    .line 16
    const-string v3, "e_auto_renew_subscriptions_option"

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {v1}, Ll/c;->e()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Ll/edg0;->b:Ll/c;

    .line 25
    .line 26
    iget-object v1, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->pageId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v4, "subscribe"

    .line 33
    .line 34
    invoke-static {v2, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    filled-new-array {v2}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v0, v3, v1, v2}, Ll/c;->a(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->pageId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v4, "cancel"

    .line 53
    .line 54
    invoke-static {v2, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    filled-new-array {v2}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {v1, v3, v0, v2}, Ll/c;->a(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast p0, Ll/hdg0;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/hdg0;->j(Ljava/util/ArrayList;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic x0(Ll/x20;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1, p2}, Ll/xzc0;->A(Lcom/p1/mobile/putong/data/Contract;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/edg0;->b:Ll/c;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    new-array p1, p1, [Ll/pf60;

    .line 18
    .line 19
    const-string p2, "e_auto_renew_subscriptions_cancel_yes"

    .line 20
    .line 21
    const-string v0, "p_auto_renew_subscriptions_cancel_popup"

    .line 22
    .line 23
    invoke-interface {p0, p2, v0, p1}, Ll/c;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/data/Contract;Landroid/content/DialogInterface;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2, p1}, Ll/xzc0;->A(Lcom/p1/mobile/putong/data/Contract;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/edg0;->b:Ll/c;

    .line 12
    .line 13
    const-string p2, "e_auto_renew_subscriptions_cancel_yes"

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    new-array v1, v0, [Ll/pf60;

    .line 17
    .line 18
    const-string v2, "p_auto_renew_subscriptions_cancel_popup"

    .line 19
    .line 20
    invoke-interface {p1, p2, v2, v1}, Ll/c;->a(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/edg0;->b:Ll/c;

    .line 24
    .line 25
    const-string p2, "e_auto_renew_subscriptions_cancel_no"

    .line 26
    .line 27
    new-array v0, v0, [Ll/pf60;

    .line 28
    .line 29
    invoke-interface {p1, p2, v2, v0}, Ll/c;->a(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/edg0;->b:Ll/c;

    .line 33
    .line 34
    iget-object p0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p1, v2, p0}, Ll/c;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/data/Contract;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2, p1}, Ll/xzc0;->A(Lcom/p1/mobile/putong/data/Contract;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/edg0;->b:Ll/c;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    new-array p2, p2, [Ll/pf60;

    .line 15
    .line 16
    const-string v0, "e_auto_renew_subscriptions_cancel_no"

    .line 17
    .line 18
    const-string v1, "p_auto_renew_subscriptions_cancel_popup"

    .line 19
    .line 20
    invoke-interface {p1, v0, v1, p2}, Ll/c;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/edg0;->b:Ll/c;

    .line 24
    .line 25
    iget-object p0, p0, Ll/edg0;->a:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p1, v1, p0}, Ll/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method
