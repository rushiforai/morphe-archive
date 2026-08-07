.class public Ll/fmm;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/omm;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/n570;

.field public c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/data/Links;

.field public g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 17
    .line 18
    const-string v0, ""

    .line 19
    .line 20
    iput-object v0, p0, Ll/fmm;->i:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Ll/fmm;->n:Z

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Ll/fmm;->o:Z

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Ll/fmm;->p:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    return-void
.end method

.method private synthetic D0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/omm;->x()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/omm;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/omm;->p()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/fmm;->b:Ll/n570;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/n570;->o()V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/omm;

    .line 23
    .line 24
    iget-object p0, p0, Ll/fmm;->b:Ll/n570;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/omm;->u(Ll/n570;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/omm;->q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private X0(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "moment_id"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object p0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "owner_id"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "comment_user_id"

    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    const-string p0, "success"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p0, "fail"

    .line 45
    .line 46
    :goto_0
    const-string p2, "comment_state"

    .line 47
    .line 48
    invoke-static {p2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    const-string p0, "reply"

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    const-string p0, "comment"

    .line 58
    .line 59
    :goto_1
    const-string p1, "comment_detail"

    .line 60
    .line 61
    invoke-static {p1, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    if-nez p3, :cond_2

    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    :goto_2
    move-object v7, p0

    .line 69
    goto :goto_3

    .line 70
    :cond_2
    const-string p0, "error"

    .line 71
    .line 72
    invoke-virtual {p3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p0, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    goto :goto_2

    .line 81
    :goto_3
    filled-new-array/range {v2 .. v7}, [Ll/tfj0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string p1, "e_comment_send"

    .line 86
    .line 87
    const-string p2, "p_immersion_comment_page"

    .line 88
    .line 89
    invoke-static {p1, p2, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic e0(Ll/fmm;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fmm;->D0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic g0(Ll/fmm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fmm;->E0()V

    return-void
.end method

.method public static synthetic h0(Ll/fmm;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fmm;->G0(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic i0(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fmm;->J0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic l0(Ll/fmm;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fmm;->t0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Ll/fmm;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fmm;->I0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method

.method public static synthetic o0(Ll/fmm;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fmm;->C0(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic p0(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fmm;->H0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic q0(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fmm;->F0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private y0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    const-string v1, "p_user_passive_show_nearby"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/emm;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/emm;-><init>(Ll/fmm;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/tlm;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/tlm;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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


# virtual methods
.method public A0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/omm;->y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/omm;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fmm;->r0(Ll/omm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C0(Ljava/lang/String;Ljava/lang/Boolean;)V
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
    iget-object p0, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/k3h;->J0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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

.method public final synthetic G0(Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/fmm;->h:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 14
    .line 15
    iget-object p3, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    const/4 p3, 0x1

    .line 24
    invoke-direct {p0, p2, p3, p1}, Ll/fmm;->X0(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0, p2}, Ll/fmm;->X0(Lcom/p1/mobile/putong/feed/data/MomentMessage;ZLjava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/omm;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/omm;->s(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p1, Ll/omm;

    .line 42
    .line 43
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 44
    .line 45
    iget-object p0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p1, v0, p0}, Ll/omm;->J(Ljava/util/List;Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p2}, Ll/i4h;->e(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic I0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fmm;->b:Ll/n570;

    .line 4
    .line 5
    invoke-virtual {v1, p1, p2}, Ll/n570;->i(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/ulm;

    .line 14
    .line 15
    invoke-direct {v0, p0, p3, p2}, Ll/ulm;-><init>(Ll/fmm;Ll/x20;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 16
    .line 17
    .line 18
    new-instance p3, Ll/vlm;

    .line 19
    .line 20
    invoke-direct {p3, p0, p2}, Ll/vlm;-><init>(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fmm;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Ll/fmm;->V0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/omm;

    .line 4
    .line 5
    iget-object v1, p0, Ll/fmm;->d:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/omm;->J(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public N0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fmm;->j:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/bmm;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/bmm;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Ll/fmm;->d:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 37
    .line 38
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast p1, Ll/omm;

    .line 47
    .line 48
    iget-object p0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Ll/omm;->I(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fmm;->j:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/cmm;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/cmm;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, -0x1

    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Ll/fmm;->d:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v0, Ll/omm;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Ll/omm;->M(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/omm;

    .line 40
    .line 41
    iget-object p0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ll/omm;->I(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public P0(Ll/bkj0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/omm;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/omm;->K(Lcom/p1/mobile/putong/data/Links;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    iput-object v0, p0, Ll/fmm;->f:Lcom/p1/mobile/putong/data/Links;

    .line 17
    .line 18
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 27
    .line 28
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Ljava/util/Collection;

    .line 31
    .line 32
    new-instance v2, Ll/zlm;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/zlm;-><init>(Ll/fmm;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v0, Ljava/util/Collection;

    .line 47
    .line 48
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 55
    .line 56
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast p1, Ljava/util/Collection;

    .line 59
    .line 60
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast p1, Ll/omm;

    .line 66
    .line 67
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 68
    .line 69
    iget-object p0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 70
    .line 71
    invoke-virtual {p1, v0, p0}, Ll/omm;->J(Ljava/util/List;Ljava/util/List;)V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public Q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/omm;->N()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R0(Ll/bkj0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Music;",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/omm;->O(Ll/bkj0;)Z

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
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 17
    .line 18
    move-object v1, v0

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iput-object v1, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v1, Ll/omm;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ll/omm;->L(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Ll/pf60;

    .line 37
    .line 38
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Lcom/p1/mobile/putong/data/Music;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Ll/fmm;->d1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Music;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/fmm;->U0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v1, Ll/pf60;

    .line 54
    .line 55
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast v1, Lcom/p1/mobile/putong/data/Music;

    .line 58
    .line 59
    invoke-virtual {p0, v0, v1}, Ll/fmm;->d1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Music;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 63
    .line 64
    move-object v1, v0

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 66
    .line 67
    iput-object v1, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 68
    .line 69
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast v1, Ll/omm;

    .line 72
    .line 73
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ll/omm;->L(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 79
    .line 80
    move-object v1, v0

    .line 81
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 86
    .line 87
    iput-object v1, p0, Ll/fmm;->f:Lcom/p1/mobile/putong/data/Links;

    .line 88
    .line 89
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v1, Ll/omm;

    .line 92
    .line 93
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Ll/omm;->K(Lcom/p1/mobile/putong/data/Links;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 108
    .line 109
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast v1, Ll/pf60;

    .line 112
    .line 113
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v1, Ljava/util/List;

    .line 116
    .line 117
    invoke-virtual {p0, v1}, Ll/fmm;->c1(Ljava/util/List;)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 122
    .line 123
    .line 124
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast v0, Ll/pf60;

    .line 127
    .line 128
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 129
    .line 130
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_2

    .line 135
    .line 136
    iget-object v0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 137
    .line 138
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 139
    .line 140
    check-cast p1, Ll/pf60;

    .line 141
    .line 142
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast p1, Ljava/util/Collection;

    .line 145
    .line 146
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 147
    .line 148
    .line 149
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 150
    .line 151
    check-cast p1, Ll/omm;

    .line 152
    .line 153
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 154
    .line 155
    iget-object p0, p0, Ll/fmm;->e:Ljava/util/List;

    .line 156
    .line 157
    invoke-virtual {p1, v0, p0}, Ll/omm;->J(Ljava/util/List;Ljava/util/List;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public S0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/omm;->P(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final U0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "normal"

    .line 10
    .line 11
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    xor-int/2addr v1, v2

    .line 17
    invoke-virtual {v0, v1}, Ll/omm;->Q(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-ne v0, v2, :cond_0

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-boolean p1, p0, Ll/fmm;->n:Z

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iput-boolean v2, p0, Ll/fmm;->n:Z

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public V0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "comment"

    .line 6
    .line 7
    invoke-static {v2}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v5, Ll/dmm;

    .line 12
    .line 13
    invoke-direct {v5, p0, p1, p2, p3}, Ll/dmm;-><init>(Ll/fmm;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    const-string v3, "comment"

    .line 17
    .line 18
    const-string v4, "p_immersion_comment_page"

    .line 19
    .line 20
    invoke-static/range {v0 .. v5}, Ll/ksg;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public W0(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p0, Ll/fmm;->j:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p0, Ll/fmm;->h:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isCommentFromKanKan:Z

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v1, p0, Ll/fmm;->i:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, ""

    .line 38
    .line 39
    iput-object v2, p0, Ll/fmm;->i:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 42
    .line 43
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    iget-object p1, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->replyCommentId:Ljava/lang/String;

    .line 62
    .line 63
    :cond_0
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object p1, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    new-instance p2, Ll/amm;

    .line 74
    .line 75
    invoke-direct {p2, p0, v0, p3}, Ll/amm;-><init>(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    invoke-static {p1, p2, p0}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    iget-object p1, p0, Ll/fmm;->k:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, p1, v0, p3}, Ll/fmm;->V0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    .line 86
    .line 87
    .line 88
    invoke-direct {p0, p2}, Ll/fmm;->y0(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public Y0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->X2:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iput-object p1, p0, Ll/fmm;->g:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p1, p0, Ll/fmm;->h:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p2, p0, Ll/fmm;->i:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/fmm;->s0()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/slm;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/slm;-><init>(Ll/fmm;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/wlm;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/wlm;-><init>(Ll/fmm;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/omm;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/omm;->S(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b1(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fmm;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final c1(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ll/ylm;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ll/ylm;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_0

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    iput-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    return-object v0
.end method

.method public final d1(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/Music;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public r0(Ll/omm;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s0()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fmm;->b:Ll/n570;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/fmm;->b:Ll/n570;

    .line 24
    .line 25
    iget-object v2, p0, Ll/fmm;->h:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 39
    .line 40
    :goto_0
    invoke-static {v2, v1}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v2, Ll/omm;

    .line 47
    .line 48
    iget-object v2, v2, Ll/omm;->k:Lv/VEditText;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p0}, Ll/fmm;->x0()F

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    new-instance v4, Ll/xlm;

    .line 59
    .line 60
    invoke-direct {v4, p0}, Ll/xlm;-><init>(Ll/fmm;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v2, v3, v0, v1, v4}, Ll/h9i;->g(Landroid/graphics/Paint;FLjava/lang/String;Ljava/lang/String;Ll/rcj;)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/String;

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0, v1, v0}, Ll/fmm;->t0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public final t0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ": "

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public u0()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fmm;->b:Ll/n570;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fmm;->j:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/n570;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public x0()F
    .locals 1

    .line 1
    const/high16 v0, 0x41c00000    # 24.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/omm;

    .line 10
    .line 11
    iget-object p0, p0, Ll/omm;->l:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/2addr v0, p0

    .line 18
    int-to-float p0, v0

    .line 19
    return p0
.end method

.method public z0()V
    .locals 4

    .line 1
    new-instance v0, Ll/ymm;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fmm;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fmm;->k:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/fmm;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0, v2, v3}, Ll/ymm;-><init>(Lcom/p1/mobile/android/app/Act;Ll/fmm;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/fmm;->b:Ll/n570;

    .line 13
    .line 14
    iget-object v1, p0, Ll/fmm;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/n570;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v1, p0, Ll/fmm;->p:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/fmm;->U0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
