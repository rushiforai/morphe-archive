.class public Ll/pc;
.super Ll/fc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fc<",
        "Ll/gc;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Ljava/lang/String;

.field public l:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/fc;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gc;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/gc;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pc;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic V3(Ll/pc;ILl/uwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pc;->b4(ILl/uwl;)V

    return-void
.end method

.method public static synthetic W3(Ll/pc;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pc;->a4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic X3(Ljava/util/List;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/fc;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p1, Ll/fc;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/fc;->S3()Ll/ely;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic Y3(Ll/ely;Ll/ely;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ely;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Ll/ely;->a()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p0, p1

    .line 10
    return p0
.end method

.method private synthetic a4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gc;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private c4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/kc;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/kc;-><init>(Ll/pc;I)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public R3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->R3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jc;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/jc;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/fjg;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ll/fjg;-><init>(Ll/dum;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualCompanionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;->dismiss()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/nc;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/nc;-><init>(Ll/pc;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualCompanionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualCompanionEvent;->show()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/oc;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/oc;-><init>(Ll/pc;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public Z3()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ely;",
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
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v1, Ll/lc;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ll/lc;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/mc;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/mc;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final synthetic b4(ILl/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p2, Ll/fc;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Ll/fc;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/fc;->T3()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/pc;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Ll/fc;->U3(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public d4(Ll/yn5;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/yn5;->b:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/pc;->k:Ljava/lang/String;

    .line 4
    .line 5
    iget p1, p1, Ll/yn5;->a:I

    .line 6
    .line 7
    iput p1, p0, Ll/pc;->l:I

    .line 8
    .line 9
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/gc;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/gc;->J(I)V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Ll/pc;->l:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/pc;->e4(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e4(I)V
    .locals 1

    .line 1
    iput p1, p0, Ll/pc;->l:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/pc;->c4(I)V

    .line 4
    .line 5
    .line 6
    iget p1, p0, Ll/pc;->l:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/t3m0;->o(Ll/i6t;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
