.class public Ll/nfw;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/qfw;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/nfw;Lcom/p1/mobile/putong/core/data/GreetingItem;Lcom/p1/mobile/putong/data/Detect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nfw;->q0(Lcom/p1/mobile/putong/core/data/GreetingItem;Lcom/p1/mobile/putong/data/Detect;)V

    return-void
.end method

.method public static synthetic f0(Ll/nfw;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nfw;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/nfw;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nfw;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/nfw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i0(Ll/nfw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j0(Ll/nfw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k0(Ll/nfw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l0(Ll/nfw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m0(Ll/nfw;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qfw;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/qfw;->n(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kfw;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/kfw;-><init>(Ll/nfw;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/core/data/GreetingItem;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/GreetingItem;->id:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s2:Ll/hlg;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/hlg;->J3(Lcom/p1/mobile/putong/core/data/GreetingItem;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s2:Ll/hlg;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/hlg;->L3(Lcom/p1/mobile/putong/core/data/GreetingItem;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    :goto_0
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/nfw$c;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/nfw$c;-><init>(Ll/nfw;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/nfw$d;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/nfw$d;-><init>(Ll/nfw;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public o0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/qfw;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/qfw;->u()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->s2:Ll/hlg;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/hlg;->F3()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/nfw$a;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/nfw$a;-><init>(Ll/nfw;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/nfw$b;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/nfw$b;-><init>(Ll/nfw;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/data/GreetingItem;Lcom/p1/mobile/putong/data/Detect;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/qfw;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/qfw;->m()V

    .line 22
    .line 23
    .line 24
    const-string p1, "p_artwork_send_message"

    .line 25
    .line 26
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->a(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/core/R$string;->c0:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p0, Ll/qfw;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/qfw;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p1, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0, p1}, Ll/nfw;->n0(Lcom/p1/mobile/putong/core/data/GreetingItem;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qfw;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qfw;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/core/data/GreetingItem;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/qfw;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/qfw;->u()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GreetingItem;->category:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "ai"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/nfw;->n0(Lcom/p1/mobile/putong/core/data/GreetingItem;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/DetectRequest;->new_()Lcom/p1/mobile/putong/data/DetectRequest;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "greeting"

    .line 30
    .line 31
    invoke-static {v1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, v0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 36
    .line 37
    new-instance v2, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/data/DetectText;->new_()Lcom/p1/mobile/putong/data/DetectText;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v1, v3, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GreetingItem;->value:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v3, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iput-object v2, v0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 56
    .line 57
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast v1, Ll/qfw;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/qfw;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v0}, Ll/yb5;->Q(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/lfw;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1}, Ll/lfw;-><init>(Ll/nfw;Lcom/p1/mobile/putong/core/data/GreetingItem;)V

    .line 76
    .line 77
    .line 78
    new-instance p1, Ll/mfw;

    .line 79
    .line 80
    invoke-direct {p1, p0}, Ll/mfw;-><init>(Ll/nfw;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
.end method
