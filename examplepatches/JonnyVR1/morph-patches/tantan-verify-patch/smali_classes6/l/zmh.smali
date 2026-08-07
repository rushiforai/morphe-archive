.class public Ll/zmh;
.super Ll/umh;
.source "SourceFile"

# interfaces
.implements Ll/omg;


# instance fields
.field public m:Ll/hnh;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/umh;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W1(Lcom/p1/mobile/putong/data/Counter;)Lcom/p1/mobile/putong/data/FeedFlower;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X1(Ll/zmh;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmh;->c2(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic Y1(Ll/zmh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zmh;->e2()V

    return-void
.end method

.method public static synthetic Z1(Ll/zmh;Lcom/p1/mobile/putong/data/FeedFlower;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmh;->d2(Lcom/p1/mobile/putong/data/FeedFlower;)V

    return-void
.end method

.method public static synthetic a2(Ll/zmh;)V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/umh;->V1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e2()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zmh;->a2(Ll/zmh;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hnh;

    .line 4
    .line 5
    iput-object v0, p0, Ll/zmh;->m:Ll/hnh;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-object v0, v0, Ll/jka;->W0:Lrx/subjects/b;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/vmh;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/vmh;-><init>(Ll/zmh;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/cmg;->q()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/ksg;->d0()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v0}, Ll/cmg;->F(Z)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/wmh;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/wmh;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/xmh;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/xmh;-><init>(Ll/zmh;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_0
    invoke-virtual {p0}, Ll/zmh;->b2()Ll/hnh;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ll/hnh;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/ymh;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/ymh;-><init>(Ll/zmh;)V

    .line 91
    .line 92
    .line 93
    const-wide/16 v2, 0x3e8

    .line 94
    .line 95
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public b2()Ll/hnh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmh;->m:Ll/hnh;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic c2(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Ll/zmh;->m:Ll/hnh;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/util/List;

    .line 16
    .line 17
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, v0, p1}, Ll/hnh;->y(Ljava/util/List;I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/hnh;->n()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic d2(Lcom/p1/mobile/putong/data/FeedFlower;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmh;->m:Ll/hnh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hnh;->a0(Lcom/p1/mobile/putong/data/FeedFlower;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
