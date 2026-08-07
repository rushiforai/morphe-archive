.class public Ll/ymm;
.super Ll/n570;
.source "SourceFile"

# interfaces
.implements Ll/wh00;


# instance fields
.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/fmm;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/fmm;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/n570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 3
    .line 4
    .line 5
    iput-object p3, p0, Ll/ymm;->d:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/ymm;->e:Ljava/lang/String;

    .line 8
    .line 9
    new-instance p3, Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-direct {p3, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object p3, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 15
    .line 16
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Ll/ymm;->g:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic C(Ll/fmm;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fmm;->L0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ll/fmm;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fmm;->P0(Ll/bkj0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fmm;->O0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G(Ll/fmm;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fmm;->N0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/ymm;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ymm;->L(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic I(Ll/ymm;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ymm;->K(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic J(Ll/fmm;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fmm;->Q0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic K(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fmm;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/fmm;->R0(Ll/bkj0;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic L(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fmm;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/fmm;->S0(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ymm;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 13
    .line 14
    iget-object v2, p0, Ll/ymm;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p0, Ll/ymm;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3}, Ll/jka;->Rb(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/smm;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/smm;-><init>(Ll/ymm;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/tmm;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/tmm;-><init>(Ll/ymm;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fmm;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/fmm;->a1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fmm;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/fmm;->A0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ymm;->A()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/fmm;

    .line 11
    .line 12
    iget-object p0, p0, Ll/ymm;->g:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 26
    .line 27
    iget-object v1, v1, Ll/jka;->C0:Lrx/subjects/b;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Ll/umm;

    .line 34
    .line 35
    invoke-direct {v2, v0}, Ll/umm;-><init>(Ll/fmm;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object v1, v1, Ll/jka;->l0:Lrx/subjects/b;

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/vmm;

    .line 54
    .line 55
    invoke-direct {v2, v0}, Ll/vmm;-><init>(Ll/fmm;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 66
    .line 67
    iget-object v1, v1, Ll/jka;->J0:Lrx/subjects/b;

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/wmm;

    .line 74
    .line 75
    invoke-direct {v2, v0}, Ll/wmm;-><init>(Ll/fmm;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 86
    .line 87
    iget-object v1, v1, Ll/jka;->K0:Lrx/subjects/b;

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance v1, Ll/xmm;

    .line 94
    .line 95
    invoke-direct {v1, v0}, Ll/xmm;-><init>(Ll/fmm;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    :cond_1
    :goto_0
    return-void
.end method

.method public z()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ymm;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v1, p0, Ll/ymm;->f:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/fmm;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 23
    .line 24
    iget-object v3, p0, Ll/ymm;->d:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Ll/ymm;->e:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v4, v1, Ll/fmm;->f:Lcom/p1/mobile/putong/data/Links;

    .line 29
    .line 30
    invoke-virtual {v2, v3, p0, v4}, Ll/jka;->M6(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Ll/qmm;

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ll/qmm;-><init>(Ll/fmm;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/rmm;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/rmm;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method
