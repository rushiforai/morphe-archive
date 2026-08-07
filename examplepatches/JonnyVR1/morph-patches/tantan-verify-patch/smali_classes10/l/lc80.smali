.class public Ll/lc80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/dum;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lc80;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/lc80;->a:Ll/dum;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/pcj;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 1

    .line 1
    const-string v0, "watchDog execute callback"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/n180;->i(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lc80;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/auu;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/auu;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Ll/pcj;Ll/x20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "createWatchDog"

    .line 2
    .line 3
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/lc80;->a:Ll/dum;

    .line 7
    .line 8
    iget-object v1, v0, Ll/dum;->g:Ll/ner;

    .line 9
    .line 10
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 11
    .line 12
    const/16 v2, 0x1e

    .line 13
    .line 14
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-virtual {v0, v2, v3}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/ic80;

    .line 42
    .line 43
    invoke-direct {v1, p1}, Ll/ic80;-><init>(Ll/pcj;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/jc80;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/jc80;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Ll/kc80;

    .line 60
    .line 61
    invoke-direct {v0, p2}, Ll/kc80;-><init>(Ll/x20;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p0, p0, Ll/lc80;->b:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return-void
.end method
