.class public Ll/vzi;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/vzi;",
        ">;",
        "Ll/iam<",
        "Ll/vzi;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/vzi;Ll/nwi;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vzi;->N3(Ll/nwi;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/pf60;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/szi;->a()Ll/szi;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/szi;->d(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public L3(Ll/vzi;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final M3(Ljava/lang/String;)Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/szi;->a()Ll/szi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/szi;->b()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/szi;->a()Ll/szi;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/szi;->c()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Ll/szi;->a()Ll/szi;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    add-int/lit8 v0, v0, -0x1

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/szi;->e(I)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/szi;->a()Ll/szi;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v1}, Ll/szi;->d(Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p0, Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_0
    invoke-static {}, Ll/szi;->a()Ll/szi;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v1}, Ll/szi;->d(Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-static {p0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public final synthetic N3(Ll/nwi;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/nwi;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/vzi;->M3(Ljava/lang/String;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tzi;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tzi;-><init>(Ll/vzi;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/nwi;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->AvatarEvent:Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;->onScrollNext()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lrx/c;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/uzi;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/uzi;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vzi;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vzi;->L3(Ll/vzi;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
