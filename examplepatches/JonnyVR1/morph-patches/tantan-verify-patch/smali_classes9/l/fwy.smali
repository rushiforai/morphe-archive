.class public Ll/fwy;
.super Ll/ruy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ruy<",
        "Ll/hwy;",
        ">;"
    }
.end annotation


# instance fields
.field public d:I

.field public e:I

.field public f:Ll/kcg0;

.field public g:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ruy;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A0(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1, p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Da(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v1, Ll/vvy;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/vvy;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, p0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic C0(Ll/fwy;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->x1(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D0(Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/api/g;->mo(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v2, Ll/qvy;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/qvy;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, p0, v2}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic E0(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

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

.method public static synthetic F0(Ll/fwy;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->v1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic G0(Ll/fwy;Ljava/lang/String;Lcom/p1/mobile/putong/data/ConversationStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fwy;->P1(Ljava/lang/String;Lcom/p1/mobile/putong/data/ConversationStatus;)V

    return-void
.end method

.method public static synthetic H0(Ll/fwy;Ll/clz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fwy;->I1(Ll/clz;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I0(Ll/fwy;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->E1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic J0(Ll/fwy;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->F1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic L0(Ll/fwy;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->J1(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic N0(Ll/fwy;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->D1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic O0(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/dkb;->La(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic P0(Ll/fwy;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->u1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q0(Ll/fwy;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->s1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic R0(Ll/fwy;Ll/ovb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->z1(Ll/ovb0;)V

    return-void
.end method

.method public static synthetic S0(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic U0(Ll/fwy;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->H1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic V0(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->vm(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic W0(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isLoveBuzz()Z

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

.method public static synthetic X0(Ll/fwy;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->t1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Y0(Ll/fwy;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->O1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a1(Ll/bkj0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/pf60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic b1(Ll/fwy;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->L1(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic c1(Ll/fwy;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->N1(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic d1(Ll/fwy;Ljava/lang/String;Lcom/p1/mobile/putong/data/GPMemo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fwy;->B1(Ljava/lang/String;Lcom/p1/mobile/putong/data/GPMemo;)V

    return-void
.end method

.method public static synthetic z0(Ll/fwy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwy;->C1(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final synthetic B1(Ljava/lang/String;Lcom/p1/mobile/putong/data/GPMemo;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/GPMemo;->memo:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/hwy;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/GPMemo;->memo:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ll/hwy;->M(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {p2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget-boolean v0, p2, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/hwy;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, p2}, Ll/hwy;->M(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p2, Ll/hwy;

    .line 46
    .line 47
    const-string v0, ""

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Ll/hwy;->M(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {p2, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p2, Ll/hwy;

    .line 65
    .line 66
    invoke-virtual {p2, p1}, Ll/hwy;->F(Lcom/p1/mobile/putong/data/User;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p0, Ll/hwy;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/hwy;->M(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public final synthetic C1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/fwy;->f1()Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/fwy;->f:Ll/kcg0;

    .line 27
    .line 28
    iget-boolean p1, p0, Ll/fwy;->g:Z

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/hwy;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/hwy;->K()V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x1

    .line 41
    iput-boolean p1, p0, Ll/fwy;->g:Z

    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic D1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/fwy;->f:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/hwy;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/hwy;->L()V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Ll/fwy;->g:Z

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic E1(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ll/pf60;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Ll/fwy;->e:I

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic F1(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hwy;->B(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H1(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hwy;->C(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I1(Ll/clz;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-interface {p2}, Ll/r97;->k1()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-interface {p2}, Ll/r97;->z0()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    iget-object p2, p1, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 30
    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    iget-object p2, p1, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 38
    .line 39
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 40
    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_0

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/fwy;->r1()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-nez p2, :cond_0

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-interface {p1}, Ll/r97;->S()V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p1, p0}, Ll/r97;->d1(Lcom/p1/mobile/android/app/Act;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_0
    iget-object p2, p1, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 97
    .line 98
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_1

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    iget-object v0, p1, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 113
    .line 114
    invoke-interface {p2, v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->lo(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_1

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wl(Lcom/p1/mobile/android/app/Act;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_1
    invoke-static {}, Ll/h39;->M()Z

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    if-eqz p2, :cond_2

    .line 141
    .line 142
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {}, Ll/pzi0;->o()J

    .line 147
    .line 148
    .line 149
    move-result-wide v0

    .line 150
    invoke-virtual {p2, v0, v1}, Ll/hcm;->q(J)Z

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-eqz p2, :cond_2

    .line 155
    .line 156
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-virtual {p1, p0}, Ll/hcm;->F(Lcom/p1/mobile/android/app/Act;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->kb()Z

    .line 177
    .line 178
    .line 179
    move-result p2

    .line 180
    if-eqz p2, :cond_3

    .line 181
    .line 182
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p2}, Ll/k05;->n()Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-eqz p2, :cond_3

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/clz;->b4()Z

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    if-eqz p2, :cond_3

    .line 197
    .line 198
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 199
    .line 200
    check-cast p2, Ll/hwy;

    .line 201
    .line 202
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1, v0}, Ll/clz;->w3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p2, p1}, Ll/hwy;->F(Lcom/p1/mobile/putong/data/User;)Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-nez p1, :cond_3

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p1}, Ll/k05;->f()I

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    invoke-static {p0, p1}, Ll/k05;->v(Lcom/p1/mobile/android/app/Act;I)V

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :cond_3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 245
    .line 246
    .line 247
    return-void
.end method

.method public final synthetic J1(Ll/bkj0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ll/pf60;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Ll/fwy;->d:I

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic L1(Ll/bkj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hwy;->E(Ll/bkj0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N1(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/hwy;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hwy;->z()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p0, Ll/hwy;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/hwy;->I(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic O1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hwy;->z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P1(Ljava/lang/String;Lcom/p1/mobile/putong/data/ConversationStatus;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/fwy;->h1(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xn()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IklTNDI2NFI2R1ZaVEpWWjRWVFJDUTJEVEVQVllZRzE0IiwidyI6NjAsImgiOjYwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzEyMjQyMzAzNzQ3NTY0Nzc4N30.png"

    .line 20
    .line 21
    if-eqz p2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 46
    .line 47
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isConfessionFirstConv()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_0

    .line 68
    .line 69
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast p0, Ll/hwy;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/hwy;->H(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 78
    .line 79
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_1

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-eqz p2, :cond_1

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 112
    .line 113
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_1

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 128
    .line 129
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 130
    .line 131
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p2

    .line 135
    if-eqz p2, :cond_1

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 146
    .line 147
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 148
    .line 149
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 150
    .line 151
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    if-eqz p2, :cond_1

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 166
    .line 167
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 168
    .line 169
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 170
    .line 171
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/GreetingInfo;->fromGreeting:Z

    .line 172
    .line 173
    if-eqz p2, :cond_1

    .line 174
    .line 175
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 176
    .line 177
    check-cast p0, Ll/hwy;

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Ll/hwy;->H(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jj()Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-eqz p2, :cond_2

    .line 196
    .line 197
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    if-eqz p2, :cond_2

    .line 210
    .line 211
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 220
    .line 221
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    if-eqz p2, :cond_2

    .line 226
    .line 227
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-interface {p2}, Ll/mzl;->l()Ll/clz;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    iget-object p2, p2, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 236
    .line 237
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Conversation;->isConfessionFirstConv()Z

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    if-eqz p2, :cond_2

    .line 242
    .line 243
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 244
    .line 245
    check-cast p0, Ll/hwy;

    .line 246
    .line 247
    invoke-virtual {p0, v0}, Ll/hwy;->H(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_2
    new-instance p2, Ll/svy;

    .line 252
    .line 253
    invoke-direct {p2, p1}, Ll/svy;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0, p2}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    new-instance p2, Ll/tvy;

    .line 261
    .line 262
    invoke-direct {p2, p0}, Ll/tvy;-><init>(Ll/fwy;)V

    .line 263
    .line 264
    .line 265
    new-instance v0, Ll/uvy;

    .line 266
    .line 267
    invoke-direct {v0, p0}, Ll/uvy;-><init>(Ll/fwy;)V

    .line 268
    .line 269
    .line 270
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 279
    .line 280
    check-cast p0, Ll/hwy;

    .line 281
    .line 282
    invoke-virtual {p0}, Ll/hwy;->z()V

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method public Q1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fwy;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final R1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/r97;->x()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, "default"

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fwy;->i1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/clz;->P2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final f1()Ll/kcg0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/core/data/KeepConnection;->chatTypingInterval:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v1, p0, Ll/fwy;->f:Ll/kcg0;

    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 24
    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-wide/16 v0, 0xc

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    add-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    int-to-long v0, v0

    .line 34
    :goto_1
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 35
    .line 36
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/wvy;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/wvy;-><init>(Ll/fwy;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public final g1(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of p0, p0, Ll/jlz;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/r97;->c()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->mo(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final h1(Lcom/p1/mobile/putong/data/ConversationStatus;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "dismissed"

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "deleted"

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const-string p0, "blocked"

    .line 20
    .line 21
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

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

.method public final i1()V
    .locals 2

    .line 1
    new-instance v0, Ll/cvy;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cvy;-><init>(Ll/fwy;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fwy;->o1()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fwy;->l1()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/fwy;->j1()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/fwy;->m1()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/fwy;->k1()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/fwy;->p1()V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->jb()Lrx/subjects/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/nvy;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/nvy;-><init>(Ll/fwy;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->f9()Lrx/subjects/b;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/xvy;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/xvy;-><init>(Ll/fwy;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method

.method public final j1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/zvy;

    .line 14
    .line 15
    invoke-direct {v1, p0, v0}, Ll/zvy;-><init>(Ll/fwy;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ll/awy;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/awy;-><init>(Ll/fwy;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-interface {v1}, Ll/r97;->L5()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    new-instance v1, Ll/bwy;

    .line 49
    .line 50
    invoke-direct {v1, v0}, Ll/bwy;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/cwy;

    .line 58
    .line 59
    invoke-direct {v2, p0, v0}, Ll/cwy;-><init>(Ll/fwy;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public k0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fwy;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final k1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/fwy;->r1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/r97;->R4()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/dkb;->T6()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/dwy;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/dwy;-><init>(Ll/fwy;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/ewy;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/ewy;-><init>(Ll/fwy;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public l0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fwy;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final l1()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object v2, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 40
    .line 41
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/16 v2, 0x64

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iput v2, p0, Ll/fwy;->e:I

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v3, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 61
    .line 62
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->v6(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/kvy;

    .line 73
    .line 74
    invoke-direct {v1, v0}, Ll/kvy;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/lvy;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/lvy;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/mvy;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/mvy;-><init>(Ll/fwy;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/ovy;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/ovy;-><init>(Ll/fwy;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget-object v0, v0, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 121
    .line 122
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->zo(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_4

    .line 127
    .line 128
    iput v2, p0, Ll/fwy;->e:I

    .line 129
    .line 130
    :cond_4
    :goto_0
    return-void
.end method

.method public final m1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ivy;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ll/ivy;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/jvy;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/jvy;-><init>(Ll/fwy;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public n1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->kb()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/clz;->i4()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    sget v2, Ll/ibc0;->L3:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    sget v2, Ll/ibc0;->F1:I

    .line 85
    .line 86
    :goto_1
    invoke-virtual {v1, v2}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 87
    .line 88
    .line 89
    :cond_3
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    new-instance v2, Ll/yvy;

    .line 98
    .line 99
    invoke-direct {v2, p0, v0}, Ll/yvy;-><init>(Ll/fwy;Ll/clz;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v2}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final o1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ll/r97;->c()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/fwy;->q1(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    new-instance v1, Ll/dvy;

    .line 34
    .line 35
    invoke-direct {v1, v0}, Ll/dvy;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/evy;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/evy;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/fvy;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/fvy;-><init>(Ll/fwy;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/gvy;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/gvy;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/hvy;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/hvy;-><init>(Ll/fwy;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    :cond_0
    return-void
.end method

.method public final p1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v1, Ll/hwy;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2, v0}, Ll/clz;->w3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ll/hwy;->F(Lcom/p1/mobile/putong/data/User;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, v0}, Ll/clz;->w3(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    :goto_0
    return-void

    .line 61
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ab(Ljava/lang/String;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const/4 v2, 0x1

    .line 74
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/pvy;

    .line 79
    .line 80
    invoke-direct {v2, p0, v0}, Ll/pvy;-><init>(Ll/fwy;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final q1(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "default"

    .line 36
    .line 37
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationProperty;->quickchat:Lcom/p1/mobile/putong/core/data/ConversationQuickChat;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationQuickChat;->bellType:Ljava/lang/String;

    .line 48
    .line 49
    const-string p1, "male"

    .line 50
    .line 51
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_0
    const/4 p0, 0x0

    .line 60
    return p0
.end method

.method public r0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_getback_match"

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/joa;->L3()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/clz;->j3()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Op(Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v1, "p_unmatch,getback_match"

    .line 55
    .line 56
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    invoke-interface {v0, p0, v1, v2}, Ll/r97;->y4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public r1()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, v0}, Ll/clz;->k4(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public s0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/fwy;->R1(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic s1(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/hwy;->L()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/fwy;->g:Z

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic t1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/hwy;->y(Ll/fwy;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/fwy;->n1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u1(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fwy;->p1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v1(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fwy;->p1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hwy;->J(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x1(Ljava/lang/String;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, p1}, Ll/fwy;->g1(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/clz;->T2()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v2, Ll/rvy;

    .line 32
    .line 33
    invoke-direct {v2}, Ll/rvy;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1, p1, p0, v2}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final synthetic z1(Ll/ovb0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hwy;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hwy;->A(Ll/ovb0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
