.class public Ll/apo;
.super Ll/j4n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/j4n<",
        "Ll/cpo;",
        ">;"
    }
.end annotation


# instance fields
.field public b:I

.field public c:[Ljava/lang/String;

.field public final d:[Z

.field public final e:[Z

.field public final f:[Ljava/lang/String;

.field public final g:[Lcom/p1/mobile/putong/data/DbLinks;

.field public h:Lcom/p1/mobile/putong/data/DbLinks;

.field public final i:[Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/j4n;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/apo;->b:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Ll/apo;->c:[Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    new-array v1, v0, [Z

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/apo;->d:[Z

    .line 17
    .line 18
    new-array v1, v0, [Z

    .line 19
    .line 20
    fill-array-data v1, :array_1

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/apo;->e:[Z

    .line 24
    .line 25
    const-string v1, "&filter=recv"

    .line 26
    .line 27
    const-string v2, "&filter=sent"

    .line 28
    .line 29
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Ll/apo;->f:[Ljava/lang/String;

    .line 34
    .line 35
    filled-new-array {p1, p1}, [Lcom/p1/mobile/putong/data/DbLinks;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, p0, Ll/apo;->g:[Lcom/p1/mobile/putong/data/DbLinks;

    .line 40
    .line 41
    iput-object p1, p0, Ll/apo;->h:Lcom/p1/mobile/putong/data/DbLinks;

    .line 42
    .line 43
    new-array p1, v0, [Z

    .line 44
    .line 45
    fill-array-data p1, :array_2

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/apo;->i:[Z

    .line 49
    .line 50
    return-void

    .line 51
    :array_0
    .array-data 1
        0x0t
        0x1t
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    nop

    .line 57
    :array_1
    .array-data 1
        0x1t
        0x0t
    .end array-data

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    nop

    .line 63
    :array_2
    .array-data 1
        0x0t
        0x0t
    .end array-data
.end method

.method public static synthetic A0(Ll/apo;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/apo;->S0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic C0(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic D0(Ll/apo;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/apo;->Y0(ILjava/util/List;)V

    return-void
.end method

.method public static synthetic E0(Ll/apo;Ll/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/apo;->V0(Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F0(Ll/apo;Lcom/p1/mobile/putong/data/DbLinks;ILjava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/apo;->X0(Lcom/p1/mobile/putong/data/DbLinks;ILjava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G0(Ll/apo;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/apo;->U0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic H0(Ll/apo;Ll/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/apo;->R0(Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I0(Ll/apo;ILl/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/apo;->b1(ILl/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J0(Ll/fzq;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic L0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N0(Ll/apo;ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/apo;->d1(ILjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O0(Ll/apo;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/apo;->e1(Ljava/util/List;)V

    return-void
.end method

.method private synthetic V0(Ll/pf60;)Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/j4n;->l0(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic u0(Ll/apo;Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/apo;->Q0(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic x0(Ll/apo;ILjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/apo;->c1(ILjava/util/List;)V

    return-void
.end method

.method public static synthetic y0(Ll/apo;ILjava/util/List;Ll/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/apo;->W0(ILjava/util/List;Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z0(Ll/apo;ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/apo;->a1(ILjava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public P0(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ll/fzq;

    .line 33
    .line 34
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/fzq;->o()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-lez v3, :cond_1

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/fzq;->p()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    if-eqz p2, :cond_3

    .line 80
    .line 81
    :goto_1
    return-void

    .line 82
    :cond_3
    new-instance p2, Ll/noo;

    .line 83
    .line 84
    invoke-direct {p2, p0, p1, v0, v1}, Ll/noo;-><init>(Ll/apo;Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;Ljava/util/List;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p1, p2}, Ll/dgm;->b(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/apo;->g1(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R0(Ll/pf60;)Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/vg60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 7
    .line 8
    iput-object v1, p0, Ll/apo;->h:Lcom/p1/mobile/putong/data/DbLinks;

    .line 9
    .line 10
    check-cast v0, Ll/vg60;

    .line 11
    .line 12
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Ll/j4n;->m0(Ll/vg60;Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic S0(Ljava/util/List;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ll/fzq;

    .line 26
    .line 27
    invoke-virtual {v3}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    invoke-virtual {v3}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {v5}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_2

    .line 72
    .line 73
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast v2, Ll/cpo;

    .line 76
    .line 77
    const/4 v3, 0x0

    .line 78
    invoke-virtual {v2, v3, v0}, Ll/cpo;->n(ILjava/util/List;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_3

    .line 86
    .line 87
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p0, Ll/cpo;

    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    invoke-virtual {p0, v0, p1}, Ll/cpo;->n(ILjava/util/List;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    return-void
.end method

.method public final synthetic U0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cpo;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k4n;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W0(ILjava/util/List;Ll/pf60;)Ljava/util/List;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/apo;->g:[Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    iget-object v1, p3, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    check-cast v2, Ll/vg60;

    .line 7
    .line 8
    iget-object v2, v2, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 9
    .line 10
    aput-object v2, v0, p1

    .line 11
    .line 12
    check-cast v1, Ll/vg60;

    .line 13
    .line 14
    iget-object p1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p0, v1, p1}, Ll/j4n;->m0(Ll/vg60;Ljava/util/List;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/moo;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/moo;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public final synthetic X0(Lcom/p1/mobile/putong/data/DbLinks;ILjava/util/List;)Lrx/c;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object v1, p0, Ll/j4n;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Ll/apo;->f:[Ljava/lang/String;

    .line 8
    .line 9
    aget-object v2, v2, p2

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/api/j;->r5(Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/loo;

    .line 16
    .line 17
    invoke-direct {v0, p0, p2, p3}, Ll/loo;-><init>(Ll/apo;ILjava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic Y0(ILjava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/apo;->i:[Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput-boolean v1, v0, p1

    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/cpo;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/cpo;->n(ILjava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->f4:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

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
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->g4:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/apo;->c:[Ljava/lang/String;

    .line 26
    .line 27
    invoke-super {p0}, Ll/j4n;->a0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic a1(ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/cpo;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/k4n;->d()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/apo;->i:[Z

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    aput-boolean p2, p0, p1

    .line 12
    .line 13
    return-void
.end method

.method public final synthetic b1(ILl/pf60;)Ljava/util/List;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/apo;->g:[Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    iget-object v1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    check-cast v2, Ll/vg60;

    .line 7
    .line 8
    iget-object v2, v2, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 9
    .line 10
    aput-object v2, v0, p1

    .line 11
    .line 12
    check-cast v1, Ll/vg60;

    .line 13
    .line 14
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p0, v1, p1}, Ll/j4n;->m0(Ll/vg60;Ljava/util/List;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic c1(ILjava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/apo;->i:[Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput-boolean v1, v0, p1

    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/cpo;

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/cpo;->n(ILjava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic d1(ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/cpo;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/k4n;->d()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/apo;->i:[Z

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    aput-boolean p2, p0, p1

    .line 12
    .line 13
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e1(Ljava/util/List;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/cpo;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/cpo;->p(Ljava/util/Set;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final f1(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/apo;->g:[Lcom/p1/mobile/putong/data/DbLinks;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    if-nez p1, :cond_1

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 27
    .line 28
    iget-object v2, p0, Ll/j4n;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/j;->u5(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/too;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/too;-><init>(Ll/apo;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/uoo;

    .line 48
    .line 49
    invoke-direct {v2, p0, v0, p1}, Ll/uoo;-><init>(Ll/apo;Lcom/p1/mobile/putong/data/DbLinks;I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/voo;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1}, Ll/voo;-><init>(Ll/apo;I)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Ll/woo;

    .line 62
    .line 63
    invoke-direct {v2, p0, p1}, Ll/woo;-><init>(Ll/apo;I)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    const/4 v1, 0x1

    .line 75
    if-ne p1, v1, :cond_2

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 80
    .line 81
    iget-object v2, p0, Ll/j4n;->a:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p0, Ll/apo;->f:[Ljava/lang/String;

    .line 84
    .line 85
    aget-object v3, v3, p1

    .line 86
    .line 87
    invoke-virtual {v1, v2, v0, v3}, Lcom/p1/mobile/putong/core/api/j;->r5(Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/xoo;

    .line 92
    .line 93
    invoke-direct {v1, p0, p1}, Ll/xoo;-><init>(Ll/apo;I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/yoo;

    .line 105
    .line 106
    invoke-direct {v1, p0, p1}, Ll/yoo;-><init>(Ll/apo;I)V

    .line 107
    .line 108
    .line 109
    new-instance v2, Ll/zoo;

    .line 110
    .line 111
    invoke-direct {v2, p0, p1}, Ll/zoo;-><init>(Ll/apo;I)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    :cond_2
    :goto_0
    return-void
.end method

.method public final g1(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/api/j;->g5(Ljava/util/List;Ljava/util/List;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/ooo;

    .line 14
    .line 15
    invoke-direct {p2}, Ll/ooo;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/poo;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/poo;-><init>(Ll/apo;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/qoo;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/qoo;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public k0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/j4n;->k0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/apo;->h:Lcom/p1/mobile/putong/data/DbLinks;

    .line 6
    .line 7
    return-void
.end method

.method public r0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object v1, p0, Ll/j4n;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Ll/apo;->h:Lcom/p1/mobile/putong/data/DbLinks;

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/j;->t5(Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/koo;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/koo;-><init>(Ll/apo;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/roo;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/roo;-><init>(Ll/apo;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/soo;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/soo;-><init>(Ll/apo;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public s0(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Ll/apo;->b:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/apo;->f1(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    iget-object v0, p0, Ll/apo;->c:[Ljava/lang/String;

    .line 11
    .line 12
    array-length v0, v0

    .line 13
    if-ge p1, v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/apo;->f1(I)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/apo;->i:[Z

    .line 2
    .line 3
    iget v1, p0, Ll/apo;->b:I

    .line 4
    .line 5
    aget-boolean v0, v0, v1

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/apo;->g:[Lcom/p1/mobile/putong/data/DbLinks;

    .line 10
    .line 11
    aget-object v0, v0, v1

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Ll/apo;->i:[Z

    .line 27
    .line 28
    iget v1, p0, Ll/apo;->b:I

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    aput-boolean v2, v0, v1

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Ll/apo;->s0(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method
