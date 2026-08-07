.class public Ll/xbx;
.super Ll/k8x;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k8x<",
        "Ll/xcx;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Z

.field public i:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k8x;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/xbx;->f:Lrx/subjects/a;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Ll/xbx;->g:Z

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Ll/xbx;->h:Z

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Ll/xbx;->i:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic C0(Ll/xbx;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xbx;->R1(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E0(Ll/xbx;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->B1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private synthetic E1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xbx;->g2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic F0(Ll/xbx;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xbx;->T1(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic G0(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xbx;->V1()V

    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/obx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/obx;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic H1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xbx;->f2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic I0(Ll/xbx;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xbx;->O1(Ll/uxj0;)V

    return-void
.end method

.method private synthetic I1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xbx;->j2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic J0(Ll/xbx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xbx;->S1(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    const-string v0, "default"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic O0(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xbx;->X1()V

    return-void
.end method

.method private synthetic O1(Ll/uxj0;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v1, Ll/xcx;

    .line 24
    .line 25
    iget v2, p0, Ll/k8x;->a:I

    .line 26
    .line 27
    iget-object p0, p0, Ll/xbx;->e:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v1, p1, v0, v2, p0}, Ll/xcx;->U1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic P0(Ll/xbx;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->U1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q0(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xbx;->Y1()V

    return-void
.end method

.method public static synthetic R0(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xbx;->N1()V

    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V0(Ll/xbx;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->z1(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic W0(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xbx;->J1()V

    return-void
.end method

.method public static synthetic X0(Ll/xbx;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->x1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic Y0(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xbx;->W1()V

    return-void
.end method

.method public static synthetic a1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/pbx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/pbx;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d1(Ll/xbx;ZZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xbx;->Q1(ZZLl/uxj0;)V

    return-void
.end method

.method public static synthetic e1(Ll/xbx;Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xbx;->C1(Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f1(Ll/xbx;Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->P1(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public static synthetic g1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h1(Ll/xbx;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->u1(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic i1(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xbx;->H1()V

    return-void
.end method

.method public static synthetic j1(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xbx;->v1()V

    return-void
.end method

.method public static synthetic k1(Ll/xbx;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->F1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic l1(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xbx;->I1()V

    return-void
.end method

.method public static synthetic m1(Ll/xbx;Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->D1(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public static synthetic n1(Ll/xbx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xbx;->E1()V

    return-void
.end method

.method public static synthetic o1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p1(Ll/xbx;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xbx;->L1(Landroid/os/Bundle;)V

    return-void
.end method

.method private q1()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, "p_intl_instantmatch_no_ultra_view,e_intl_instantmatch_no_ultra_click,click"

    .line 25
    .line 26
    return-object p0
.end method

.method private synthetic v1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xbx;->h2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final synthetic B1(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/match/b;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 6
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
    return-void
.end method

.method public final synthetic C1(Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    new-instance p2, Ll/bbx;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/bbx;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    sget-object p2, Ll/f760;->Companion:Ll/f760$a;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/f760$a;->c()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pollConversation()Lrx/c;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Ll/cbx;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1}, Ll/cbx;-><init>(Ll/xbx;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 p0, 0x3e8

    .line 31
    .line 32
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic D1(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/pax;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/pax;-><init>(Ll/xbx;Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, p1, v1}, Ll/yie0;->t(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic F1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/xcx;

    .line 9
    .line 10
    iget-object v0, v0, Ll/xcx;->P0:Ll/f0r;

    .line 11
    .line 12
    check-cast p1, Ll/xcx;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p1, Ll/xcx;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/xcx;->f2()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/xcx;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xcx;->i2()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 37
    .line 38
    if-ne p1, v0, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/xcx;

    .line 43
    .line 44
    iget-object p0, p0, Ll/xcx;->P0:Ll/f0r;

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 52
    .line 53
    if-ne p1, v0, :cond_2

    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/xcx;

    .line 58
    .line 59
    iget-object p0, p0, Ll/xcx;->P0:Ll/f0r;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public final synthetic J1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xbx;->e2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic L1(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/toh0;->s()V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Ll/k8x;->a:I

    .line 13
    .line 14
    const/16 v2, 0xd

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    if-ne v0, v2, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/tx0;->B()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/spl0;->F()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup_store:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2, v1, v3}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/high16 v2, 0x40a00000    # 5.0f

    .line 57
    .line 58
    const-string v4, "superlike"

    .line 59
    .line 60
    invoke-static {v0, v1, v2, v4}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast v0, Ll/xcx;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget v1, p0, Ll/k8x;->a:I

    .line 72
    .line 73
    invoke-virtual {v0, p1, v1}, Ll/xcx;->j1(ZI)V

    .line 74
    .line 75
    .line 76
    iget p1, p0, Ll/k8x;->a:I

    .line 77
    .line 78
    const/16 v0, 0x28

    .line 79
    .line 80
    const-wide/16 v1, 0x5dc

    .line 81
    .line 82
    if-ne p1, v0, :cond_2

    .line 83
    .line 84
    invoke-static {}, Ll/yie0;->c()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    iput-boolean v3, p0, Ll/xbx;->g:Z

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance v0, Ll/tax;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/tax;-><init>(Ll/xbx;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    iget p1, p0, Ll/k8x;->a:I

    .line 106
    .line 107
    const/16 v0, 0x29

    .line 108
    .line 109
    if-ne p1, v0, :cond_3

    .line 110
    .line 111
    iput-boolean v3, p0, Ll/xbx;->g:Z

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    const-string v0, "o_diamond_fake_auto_match"

    .line 122
    .line 123
    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iput-boolean p1, p0, Ll/xbx;->h:Z

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance v0, Ll/uax;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ll/uax;-><init>(Ll/xbx;)V

    .line 136
    .line 137
    .line 138
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_3
    const/16 v0, 0x32

    .line 143
    .line 144
    if-ne p1, v0, :cond_4

    .line 145
    .line 146
    iput-boolean v3, p0, Ll/xbx;->g:Z

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    new-instance v0, Ll/vax;

    .line 153
    .line 154
    invoke-direct {v0, p0}, Ll/vax;-><init>(Ll/xbx;)V

    .line 155
    .line 156
    .line 157
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_4
    const/16 v0, 0x2b

    .line 162
    .line 163
    if-ne p1, v0, :cond_5

    .line 164
    .line 165
    iput-boolean v3, p0, Ll/xbx;->g:Z

    .line 166
    .line 167
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    new-instance v0, Ll/wax;

    .line 172
    .line 173
    invoke-direct {v0, p0}, Ll/wax;-><init>(Ll/xbx;)V

    .line 174
    .line 175
    .line 176
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_5
    const/16 v0, 0x31

    .line 181
    .line 182
    if-ne p1, v0, :cond_6

    .line 183
    .line 184
    iput-boolean v3, p0, Ll/xbx;->g:Z

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    new-instance v0, Ll/xax;

    .line 191
    .line 192
    invoke-direct {v0, p0}, Ll/xax;-><init>(Ll/xbx;)V

    .line 193
    .line 194
    .line 195
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 196
    .line 197
    .line 198
    :cond_6
    return-void
.end method

.method public final synthetic N1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/xcx;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xcx;->destroy()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P1(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic Q1(ZZLl/uxj0;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->S1:Lrx/subjects/a;

    .line 8
    .line 9
    iget-object p3, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    const-string p1, "\u6d88\u606f\u5df2\u53d1\u9001"

    .line 17
    .line 18
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic R1(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/rv4;->f(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 12
    .line 13
    invoke-static {p0, p2, p1}, Ll/rv4;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p2}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIllegalContent(Ljava/lang/Throwable;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Of(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Th:I

    .line 39
    .line 40
    iget-object p2, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {p1, p2}, Ll/bfx;->f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic S1(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/kbx;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/kbx;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p2, v3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 21
    .line 22
    const-string p1, "text"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, v3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 29
    .line 30
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p1, Ll/xcx;

    .line 33
    .line 34
    iget-boolean p1, p1, Ll/xcx;->J0:Z

    .line 35
    .line 36
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    iget-object v2, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    const/4 v6, 0x0

    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    new-instance v0, Ll/lbx;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/lbx;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    new-instance v0, Ll/mbx;

    .line 59
    .line 60
    invoke-direct {v0, p0, p1, p3}, Ll/mbx;-><init>(Ll/xbx;ZZ)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Ll/nbx;

    .line 64
    .line 65
    invoke-direct {p1, p0, v3}, Ll/nbx;-><init>(Ll/xbx;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic T1(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/xbx;->b2(Ljava/lang/String;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic U1(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/xbx;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xbx;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic W1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xbx;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xbx;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xbx;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public Z1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xbx;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/xbx;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p0, Ll/xbx;->d:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/xbx;->e:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/xbx;->f:Lrx/subjects/a;

    .line 32
    .line 33
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v0, Ll/xcx;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/xcx;->Q1()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/d79;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x29

    .line 6
    .line 7
    const/16 v2, 0x28

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Ll/k8x;->a:I

    .line 12
    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ll/nax;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/nax;-><init>(Ll/xbx;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ll/jbx;

    .line 30
    .line 31
    invoke-direct {v3, p0}, Ll/jbx;-><init>(Ll/xbx;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0, v3}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/xbx;->f:Lrx/subjects/a;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v3, Ll/qbx;

    .line 44
    .line 45
    invoke-direct {v3, p0}, Ll/qbx;-><init>(Ll/xbx;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    iget v0, p0, Ll/k8x;->a:I

    .line 56
    .line 57
    if-ne v0, v2, :cond_1

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

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
    new-instance v1, Ll/rbx;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/rbx;-><init>(Ll/xbx;)V

    .line 76
    .line 77
    .line 78
    new-instance p0, Ll/sbx;

    .line 79
    .line 80
    invoke-direct {p0}, Ll/sbx;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    if-ne v0, v1, :cond_2

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 96
    .line 97
    const-string v1, "oDiamond"

    .line 98
    .line 99
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/tbx;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/tbx;-><init>(Ll/xbx;)V

    .line 118
    .line 119
    .line 120
    new-instance p0, Ll/ubx;

    .line 121
    .line 122
    invoke-direct {p0}, Ll/ubx;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_2
    const/16 v1, 0x2b

    .line 134
    .line 135
    if-ne v0, v1, :cond_3

    .line 136
    .line 137
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/vbx;

    .line 152
    .line 153
    invoke-direct {v1}, Ll/vbx;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const/4 v1, 0x1

    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    new-instance v1, Ll/wbx;

    .line 166
    .line 167
    invoke-direct {v1, p0}, Ll/wbx;-><init>(Ll/xbx;)V

    .line 168
    .line 169
    .line 170
    new-instance p0, Ll/oax;

    .line 171
    .line 172
    invoke-direct {p0}, Ll/oax;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_3
    const/16 v1, 0x31

    .line 184
    .line 185
    if-ne v0, v1, :cond_4

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/k8x;->r0()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_4
    const/16 v1, 0x32

    .line 192
    .line 193
    if-ne v0, v1, :cond_5

    .line 194
    .line 195
    invoke-virtual {p0}, Ll/k8x;->s0()V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_5
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    new-instance v1, Ll/yax;

    .line 204
    .line 205
    invoke-direct {v1, p0}, Ll/yax;-><init>(Ll/xbx;)V

    .line 206
    .line 207
    .line 208
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 213
    .line 214
    .line 215
    invoke-static {}, Ll/gra;->f2()Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-eqz v0, :cond_6

    .line 220
    .line 221
    invoke-virtual {p0}, Ll/xbx;->t1()V

    .line 222
    .line 223
    .line 224
    :cond_6
    return-void
.end method

.method public a2(Lcom/p1/mobile/putong/core/data/BreakIce;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xbx;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput-object p2, p0, Ll/xbx;->j:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, p1, p2, v0}, Ll/xbx;->b2(Ljava/lang/String;ZZ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final b2(Ljava/lang/String;ZZ)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/fbx;

    .line 16
    .line 17
    invoke-direct {v2, p0, v0, p1, p3}, Ll/fbx;-><init>(Ll/xbx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    const-wide/16 v3, 0x1f4

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-wide/16 v3, 0x1

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v1, v2, v3, v4}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 28
    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public c2(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 43
    .line 44
    new-instance v2, Ll/zax;

    .line 45
    .line 46
    invoke-direct {v2, p0, p1, p2}, Ll/zax;-><init>(Ll/xbx;Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 54
    .line 55
    .line 56
    new-instance p1, Ljava/util/HashSet;

    .line 57
    .line 58
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Ljava/util/Collection;

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 67
    .line 68
    .line 69
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    iget-object p0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p2, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    const/4 v0, 0x0

    .line 91
    invoke-virtual {p0, p1, p2, v0}, Ll/xbx;->b2(Ljava/lang/String;ZZ)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public d2()V
    .locals 9

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "matched"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkIntent;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 13
    .line 14
    const-string v1, "unknown"

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 21
    .line 22
    const-string v2, "share_to"

    .line 23
    .line 24
    const-string v3, "system"

    .line 25
    .line 26
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v2}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "e_match_share_button"

    .line 35
    .line 36
    const-string v4, "p_successful_match_view"

    .line 37
    .line 38
    invoke-static {v3, v4, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Lcom/p1/mobile/putong/data/IdBoxed;

    .line 42
    .line 43
    iget-object v3, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 44
    .line 45
    const-string v4, "relationship"

    .line 46
    .line 47
    invoke-direct {v2, v3, v4}, Lcom/p1/mobile/putong/data/IdBoxed;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    filled-new-array {v2}, [Lcom/p1/mobile/putong/data/IdBoxed;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 59
    .line 60
    new-instance v3, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 61
    .line 62
    invoke-direct {v3, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v2, Lcom/p1/mobile/putong/core/R$string;->So:I

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget v0, Lcom/p1/mobile/putong/core/R$string;->To:I

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    const/4 v8, 0x1

    .line 102
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Z)Lrx/c;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e2(Z)V
    .locals 6

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/xbx;->g:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/xbx;->g:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    new-instance v4, Ll/hbx;

    .line 27
    .line 28
    invoke-direct {v4}, Ll/hbx;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v5, Ll/ibx;

    .line 32
    .line 33
    invoke-direct {v5, p0}, Ll/ibx;-><init>(Ll/xbx;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "p_intl_premium_match,e_intl_match_sayhi,click"

    .line 37
    .line 38
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public f2(Z)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/xbx;->g:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0}, Ll/xbx;->q1()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/gbx;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/gbx;-><init>(Ll/xbx;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public g2(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/xbx;->g:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/xcx;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "p_chat_greet,odiamond_sayhi"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p1, Ll/xcx;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "p_user_live_room,e_odiamond_sayhi,click"

    .line 37
    .line 38
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast p1, Ll/xcx;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "p_home,odiamond_sayhi"

    .line 55
    .line 56
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p1, Ll/xcx;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 71
    .line 72
    const-string v0, "p_album,e_odiamond_sayhi,click"

    .line 73
    .line 74
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast p1, Ll/xcx;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 89
    .line 90
    const-string v0, "p_home_nearby,odiamond_sayhi"

    .line 91
    .line 92
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_2

    .line 97
    .line 98
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 99
    .line 100
    check-cast p1, Ll/xcx;

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 107
    .line 108
    const-string v0, "p_meet,e_odiamond_sayhi,click"

    .line 109
    .line 110
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_2

    .line 115
    .line 116
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 117
    .line 118
    check-cast p1, Ll/xcx;

    .line 119
    .line 120
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 125
    .line 126
    const-string v0, "p_navigation_nearby,odiamond_sayhi"

    .line 127
    .line 128
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_2

    .line 133
    .line 134
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 135
    .line 136
    check-cast p1, Ll/xcx;

    .line 137
    .line 138
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 143
    .line 144
    const-string v0, "p_personalized,odiamond_sayhi"

    .line 145
    .line 146
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-nez p1, :cond_2

    .line 151
    .line 152
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 153
    .line 154
    check-cast p1, Ll/xcx;

    .line 155
    .line 156
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 161
    .line 162
    const-string v0, "p_profile,odiamond_sayhi"

    .line 163
    .line 164
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-nez p1, :cond_2

    .line 169
    .line 170
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 171
    .line 172
    check-cast p1, Ll/xcx;

    .line 173
    .line 174
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 179
    .line 180
    const-string v0, "p_meet_nearby,odiamond_sayhi"

    .line 181
    .line 182
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-eqz p1, :cond_1

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_1
    const-string p1, "p_suggest_user_profile_info_view,e_odiamond_sayhi,click"

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 193
    .line 194
    check-cast p1, Ll/xcx;

    .line 195
    .line 196
    invoke-virtual {p1}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 201
    .line 202
    :goto_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    new-instance v1, Ll/dbx;

    .line 207
    .line 208
    invoke-direct {v1, p0}, Ll/dbx;-><init>(Ll/xbx;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/match/b;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public h2(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/xcx;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "p_meet_see,card_button_pull"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_5

    .line 18
    .line 19
    const-string v1, "p_meet_see,newlike"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_5

    .line 26
    .line 27
    const-string v1, "p_popup_see,card_button_pull"

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_0
    const-string v1, "p_message,nomatch_guide"

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0, p1, v0}, Ll/xbx;->i2(ZLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const-string v1, "p_navigation,see_module"

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-static {v1, v2}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v3, 0x2

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    move v2, v3

    .line 66
    :goto_0
    invoke-static {v1, v2}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, p1, v0}, Ll/xbx;->i2(ZLjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    if-eqz p1, :cond_4

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    const/4 v3, 0x3

    .line 78
    :goto_1
    const-string v0, "p_navigation_see,card_button_pull"

    .line 79
    .line 80
    invoke-static {v0, v3}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p0, p1, v0}, Ll/xbx;->i2(ZLjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_5
    :goto_2
    invoke-virtual {p0, p1, v0}, Ll/xbx;->i2(ZLjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final i2(ZLjava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wk(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-boolean p1, p0, Ll/xbx;->g:Z

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Ll/xbx;->g:Z

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/abx;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/abx;-><init>(Ll/xbx;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public j2(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/xbx;->g:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/xbx;->g:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 17
    .line 18
    new-instance v1, Ll/ebx;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ebx;-><init>(Ll/xbx;)V

    .line 21
    .line 22
    .line 23
    const-string p0, "p_message,locked_match"

    .line 24
    .line 25
    invoke-static {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/k8x;->q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/xbx;->d:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p4, p0, Ll/xbx;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public r1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/k8x;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public s1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "cards"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->M5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final t1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "matchPage"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/dkb;->r7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/qax;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/qax;-><init>(Ll/xbx;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/rax;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/rax;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic u1(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 10
    .line 11
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/xcx;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/xcx;->S1(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final synthetic x1(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/match/b;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 6
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
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->O3()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    iget-boolean p1, p0, Ll/xbx;->h:Z

    .line 16
    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/sax;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/sax;-><init>(Ll/xbx;Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/match/b;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
