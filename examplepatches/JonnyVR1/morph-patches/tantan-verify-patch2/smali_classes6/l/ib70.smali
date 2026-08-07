.class public Ll/ib70;
.super Ll/n570;
.source "SourceFile"

# interfaces
.implements Ll/wh00;


# instance fields
.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:Z

.field public j:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/n570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/qn00;

    .line 6
    .line 7
    const/16 v1, 0x11

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/qn00;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/n570;->b:Ll/qn00;

    .line 13
    .line 14
    iput-boolean p4, p0, Ll/ib70;->h:Z

    .line 15
    .line 16
    iput-object p2, p0, Ll/ib70;->d:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p3, p0, Ll/ib70;->e:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    iput-object p5, p0, Ll/ib70;->f:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->T4(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->Z4(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->U4(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->S4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->V4(Ll/bkj0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/ib70;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ib70;->O(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/pf60;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->X4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->a5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Ll/ib70;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ib70;->P(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic L(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->a5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

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
    iget-object v2, p0, Ll/ib70;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p0, Ll/ib70;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string v4, "detail"

    .line 19
    .line 20
    invoke-virtual {v1, v2, v3, v4}, Ll/jka;->Sb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ll/cb70;

    .line 29
    .line 30
    invoke-direct {v2, p0, v0}, Ll/cb70;-><init>(Ll/ib70;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ll/db70;

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ll/db70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/pf60;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ib70;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ib70$a;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, p2}, Ll/ib70$a;-><init>(Ll/ib70;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/pf60;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/ib70;->j:Ll/x20;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->W4(Ll/pf60;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/bkj0;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ib70;->i:Z

    .line 3
    .line 4
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->Y4(Ll/bkj0;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/ib70;->j:Ll/x20;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Ll/ib70;->j:Ll/x20;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public Q(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

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
    iget-object v2, p0, Ll/ib70;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p0, Ll/ib70;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3, p1}, Ll/jka;->Wb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v1, Ll/ab70;

    .line 27
    .line 28
    invoke-direct {v1, p0, v0}, Ll/ab70;-><init>(Ll/ib70;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/bb70;

    .line 32
    .line 33
    invoke-direct {p0}, Ll/bb70;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
    iget-object p0, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->b5(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->P4()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ib70;->A()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 17
    .line 18
    iget-object v1, v1, Ll/jka;->C0:Lrx/subjects/b;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/eb70;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ll/eb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    iget-object v1, v1, Ll/jka;->Q0:Lrx/subjects/b;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/fb70;

    .line 45
    .line 46
    invoke-direct {v2, v0}, Ll/fb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 57
    .line 58
    iget-object v1, v1, Ll/jka;->S0:Lrx/subjects/b;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/gb70;

    .line 65
    .line 66
    invoke-direct {v2, v0}, Ll/gb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 77
    .line 78
    iget-object v1, v1, Ll/jka;->l0:Lrx/subjects/b;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    new-instance v2, Ll/hb70;

    .line 85
    .line 86
    invoke-direct {v2, v0}, Ll/hb70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    iget-boolean p0, p0, Ll/ib70;->h:Z

    .line 97
    .line 98
    if-nez p0, :cond_1

    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 101
    .line 102
    iget-object p0, p0, Ll/jka;->J0:Lrx/subjects/b;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v1, Ll/xa70;

    .line 109
    .line 110
    invoke-direct {v1, v0}, Ll/xa70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 121
    .line 122
    iget-object p0, p0, Ll/jka;->K0:Lrx/subjects/b;

    .line 123
    .line 124
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    new-instance v1, Ll/ya70;

    .line 129
    .line 130
    invoke-direct {v1, v0}, Ll/ya70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    :cond_1
    :goto_0
    return-void
.end method

.method public z()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ib70;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

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
    iget-object v2, p0, Ll/ib70;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Ll/ib70;->e:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;->B:Lcom/p1/mobile/putong/data/Links;

    .line 19
    .line 20
    invoke-virtual {v1, v2, p0, v3}, Ll/jka;->M6(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance v1, Ll/wa70;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ll/wa70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/za70;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/za70;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method
