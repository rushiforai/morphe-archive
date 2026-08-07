.class public Ll/zm00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/jn00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zm00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 5
    .line 6
    return-void
.end method

.method private W0(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const-string v0, "moment_id"

    .line 6
    .line 7
    iget-object v1, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v0, "owner_id"

    .line 14
    .line 15
    iget-object p0, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "comment_user_id"

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    const-string p0, "success"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p0, "fail"

    .line 41
    .line 42
    :goto_0
    const-string p2, "comment_state"

    .line 43
    .line 44
    invoke-static {p2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const-string p0, "reply"

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const-string p0, "comment"

    .line 54
    .line 55
    :goto_1
    const-string p1, "comment_detail"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    if-nez p3, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    :goto_2
    move-object v7, p0

    .line 65
    goto :goto_3

    .line 66
    :cond_2
    const-string p0, "error"

    .line 67
    .line 68
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    goto :goto_2

    .line 77
    :goto_3
    filled-new-array/range {v2 .. v7}, [Ll/tfj0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "e_comment_send"

    .line 82
    .line 83
    const-string p2, "p_user_moment_interactions_details_view"

    .line 84
    .line 85
    invoke-static {p1, p2, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static synthetic e0(Ll/zm00;ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zm00;->D0(ILcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic f0(Ll/zm00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->O0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    .line 6
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

.method public static synthetic h0(Ll/zm00;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->F0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic i0(Ll/zm00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zm00;->S0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/zm00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zm00;->A0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ll/zm00;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->I0(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/data/PartialIdList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m0(Ll/zm00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zm00;->R0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic n0(Ll/zm00;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->Q0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic o0(ILcom/p1/mobile/putong/data/PartialIdList;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gt v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic p0(Ll/zm00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zm00;->P0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q0(Ll/zm00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->H0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic r0(Ll/zm00;I)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->C0(I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s0(Ll/zm00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zm00;->E0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t0(Ll/zm00;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->L0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic u0(Ll/zm00;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->N0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x0(Ll/zm00;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zm00;->J0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic y0(Ll/zm00;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zm00;->G0()Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A0()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic C0(I)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->W3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/hm00;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/hm00;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/im00;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/im00;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic D0(ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jn00;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/jn00;->F(Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->c3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic F0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jn00;->B(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic G0()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jn00;->E(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->a(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic J0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/zm00;->f:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Ll/zm00;->f:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/jn00;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jn00;->z()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    instance-of p1, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic O0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/jn00;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jn00;->init()V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 9
    .line 10
    iget-object v0, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->s4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/jm00;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/jm00;-><init>(Ll/zm00;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/km00;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/km00;-><init>(Ll/zm00;)V

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

.method public final synthetic P0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->W3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jn00;->C(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    const/4 p2, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, v0}, Ll/zm00;->W0(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic S0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, p2}, Ll/zm00;->W0(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public U0(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/zm00;->d:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/zm00;->f:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput-boolean p1, p0, Ll/zm00;->e:Z

    .line 22
    .line 23
    return-void
.end method

.method public V0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jn00;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jn00;->l()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 20
    .line 21
    iget-object v1, p0, Ll/zm00;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/feed/api/b;->b3(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v1, Ll/lm00;

    .line 32
    .line 33
    invoke-direct {v1, p0, v0}, Ll/lm00;-><init>(Ll/zm00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/mm00;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0}, Ll/mm00;-><init>(Ll/zm00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public X0()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zm00;->b:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/og3;->c:Ll/og3;

    .line 4
    .line 5
    const-string v1, "moment id"

    .line 6
    .line 7
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public z0()V
    .locals 3

    .line 1
    new-instance v0, Ll/cm00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cm00;-><init>(Ll/zm00;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Ll/sm00;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/sm00;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Ll/tm00;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/tm00;-><init>(Ll/zm00;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v2, Ll/um00;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/um00;-><init>(Ll/zm00;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/vm00;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/vm00;-><init>(Ll/zm00;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/wm00;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/wm00;-><init>(Ll/zm00;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/xm00;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Ll/xm00;-><init>(Ll/zm00;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    :goto_0
    sget v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T0:I

    .line 71
    .line 72
    if-ge v1, v0, :cond_0

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v2, Ll/em00;

    .line 79
    .line 80
    invoke-direct {v2, p0, v1}, Ll/em00;-><init>(Ll/zm00;I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v2, Ll/fm00;

    .line 88
    .line 89
    invoke-direct {v2, p0, v1}, Ll/fm00;-><init>(Ll/zm00;I)V

    .line 90
    .line 91
    .line 92
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    new-instance v0, Ll/gm00;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Ll/gm00;-><init>(Ll/zm00;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/nm00;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/nm00;-><init>(Ll/zm00;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    new-instance v0, Ll/pm00;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/pm00;-><init>(Ll/zm00;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v1, Ll/rm00;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/rm00;-><init>(Ll/zm00;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    return-void
.end method
