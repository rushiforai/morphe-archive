.class public Ll/boy;
.super Ll/bhy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/bhy<",
        "TD;",
        "Ll/vny;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ll/hcr;",
            "Ll/cm0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/bhy;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vny;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/vny;-><init>(Lcom/p1/mobile/android/app/Act;Ll/boy;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic W3(Ll/boy;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/boy;->e4(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic X3(Ll/boy;Ll/hcr;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/boy;->d4(Ll/hcr;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/boy;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/boy;->f4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Ll/boy;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/boy;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/boy;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/ely;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/ely;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Lj:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/vny;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vny;->i()Lcom/p1/mobile/putong/live/livingroom/common/member/view/MemberWeekLeaderBoardContentView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-direct {v0, v1, p0, v2}, Ll/ely;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/boy;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b4(Ll/hcr;)Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hcr;",
            ")",
            "Landroid/util/Pair<",
            "Ll/hcr;",
            "Ll/cm0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/oo2;->B:Ll/x7g;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/x7g;->A()Ll/cm0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/vny;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/vny;->j()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p2, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->w7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic d4(Ll/hcr;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/boy;->b4(Ll/hcr;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic e4(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/boy;->j:Landroid/util/Pair;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Ll/vny;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vny;->p()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/vny;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/vny;->n(Landroid/util/Pair;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic f4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/vny;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vny;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vny;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vny;->m()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/boy;->j:Landroid/util/Pair;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/vny;

    .line 19
    .line 20
    iget-object p0, p0, Ll/boy;->j:Landroid/util/Pair;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/vny;->n(Landroid/util/Pair;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public h4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vny;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vny;->m()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/oo2;->m2()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    new-instance v2, Ll/wny;

    .line 28
    .line 29
    invoke-direct {v2}, Ll/wny;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/xny;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0}, Ll/xny;-><init>(Ll/boy;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/yny;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/yny;-><init>(Ll/boy;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/zny;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/zny;-><init>(Ll/boy;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/aoy;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/aoy;-><init>(Ll/boy;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vny;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vny;->init()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/boy;->h4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
