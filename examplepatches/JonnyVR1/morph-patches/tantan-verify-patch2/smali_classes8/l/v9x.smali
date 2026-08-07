.class public Ll/v9x;
.super Ll/k8x;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k8x<",
        "Ll/jax;",
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

.field public f:I

.field public g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/core/data/BreakIce;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k8x;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Ll/v9x;->f:I

    .line 6
    .line 7
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/v9x;->g:Lrx/subjects/a;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic C0(Ll/v9x;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v9x;->c1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic D0(Ll/v9x;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v9x;->U0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
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

.method public static synthetic F0(Ll/v9x;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v9x;->b1(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic G0(Ll/v9x;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v9x;->W0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/core/data/Conversation;)V
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

.method public static synthetic I0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/l9x;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/l9x;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic J0(Ll/v9x;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v9x;->d1(Ll/x20;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic L0(Ll/v9x;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v9x;->X0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic N0(Ll/v9x;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v9x;->a1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic O0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 10
    .line 11
    const v1, 0x9dcf

    .line 12
    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "\u8bbe\u7f6e\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 21
    .line 22
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic P0(Ll/v9x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/v9x;->V0()V

    return-void
.end method

.method public static synthetic Q0(Ll/v9x;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v9x;->Y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic U0(Landroid/os/Bundle;)V
    .locals 2

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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/jax;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0, p1}, Ll/jax;->b0(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic V0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jax;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jax;->destroy()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public R0()Lcom/p1/mobile/putong/core/data/BreakIce;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    return-object p0
.end method

.method public S0()V
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

.method public final synthetic W0(Ll/uxj0;)V
    .locals 2

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

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
    check-cast v1, Ll/jax;

    .line 24
    .line 25
    iget p0, p0, Ll/k8x;->a:I

    .line 26
    .line 27
    invoke-virtual {v1, p1, v0, p0}, Ll/jax;->p0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic X0(Lcom/p1/mobile/putong/data/Envelope;)V
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
    check-cast p0, Ll/jax;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/jax;->m0(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Ll/v9x;->e1()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic Y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v9x;->e1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/i9x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i9x;-><init>(Ll/v9x;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/m9x;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/m9x;-><init>(Ll/v9x;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/v9x;->g:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/n9x;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/n9x;-><init>(Ll/v9x;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/v9x;->f1()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic a1(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p1, "\u6d88\u606f\u5df2\u53d1\u9001"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic b1(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
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

.method public final synthetic c1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v9x;->h1(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d1(Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v9x;->f1()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final e1()V
    .locals 6

    .line 1
    invoke-static {}, Ll/gra;->x0()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ljava/lang/String;

    .line 25
    .line 26
    new-instance v4, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 27
    .line 28
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/BreakIce;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Ll/jax;

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/jax;->m0(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final f1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/o9x;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/o9x;-><init>(Ll/v9x;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/p9x;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/p9x;-><init>(Ll/v9x;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public g1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v9x;->d:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/v9x;->d:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/v9x;->d:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/v9x;->e:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/v9x;->g:Lrx/subjects/a;

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
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final h1(Ljava/lang/String;)V
    .locals 8

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
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ll/r9x;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/r9x;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    new-instance v4, Lcom/p1/mobile/putong/core/data/Message;

    .line 26
    .line 27
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, v4, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 31
    .line 32
    const-string p1, "text"

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, v4, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v2, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 43
    .line 44
    iget-object v3, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 45
    .line 46
    const/4 v6, 0x0

    .line 47
    const/4 v7, 0x0

    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ll/s9x;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/s9x;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/t9x;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/t9x;-><init>(Ll/v9x;)V

    .line 65
    .line 66
    .line 67
    new-instance v1, Ll/u9x;

    .line 68
    .line 69
    invoke-direct {v1, p0, v4}, Ll/u9x;-><init>(Ll/v9x;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public i1(Ljava/lang/String;Z)V
    .locals 2

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
    if-eqz p2, :cond_1

    .line 9
    .line 10
    sget-object p2, Ll/uqb0;->Z:Ll/a4j;

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 45
    .line 46
    new-instance v1, Ll/q9x;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/q9x;-><init>(Ll/v9x;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 56
    .line 57
    .line 58
    new-instance p1, Ljava/util/HashSet;

    .line 59
    .line 60
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 61
    .line 62
    invoke-virtual {p2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Ljava/util/Collection;

    .line 67
    .line 68
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 69
    .line 70
    .line 71
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 74
    .line 75
    iget-object p0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p2, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    invoke-virtual {p0, p1}, Ll/v9x;->h1(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public j1(Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/dkb;->W6(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v1, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1, p1}, Ll/dkb;->Z6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    :goto_0
    if-nez p1, :cond_2

    .line 53
    .line 54
    invoke-interface {p2}, Ll/x20;->call()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/j9x;

    .line 63
    .line 64
    invoke-direct {v0, p0, p2}, Ll/j9x;-><init>(Ll/v9x;Ll/x20;)V

    .line 65
    .line 66
    .line 67
    new-instance p0, Ll/k9x;

    .line 68
    .line 69
    invoke-direct {p0}, Ll/k9x;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public k1(Lcom/p1/mobile/putong/core/data/BreakIce;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v9x;->h:Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
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
    iput-object p3, p0, Ll/v9x;->d:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p4, p0, Ll/v9x;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method
