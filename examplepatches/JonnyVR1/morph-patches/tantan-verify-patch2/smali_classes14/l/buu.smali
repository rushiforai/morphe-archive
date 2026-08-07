.class public Ll/buu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/knu;

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
.method public constructor <init>(Ll/knu;)V
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
    iput-object v0, p0, Ll/buu;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/buu;->a:Ll/knu;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(I)Lrx/c;
    .locals 2

    .line 1
    int-to-long v0, p0

    .line 2
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 3
    .line 4
    invoke-static {v0, v1, p0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/pcj;Ljava/lang/Long;)Ljava/lang/Boolean;
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


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/buu;->b:Ljava/util/ArrayList;

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

.method public e(ILl/pcj;Ll/x20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "createWatchDog: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/buu;->a:Ll/knu;

    .line 21
    .line 22
    iget-object v0, v0, Ll/knu;->d:Ll/ner;

    .line 23
    .line 24
    new-instance v1, Ll/xtu;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Ll/xtu;-><init>(I)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-interface {v0, v1, p1}, Ll/ner;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/ytu;

    .line 47
    .line 48
    invoke-direct {v0, p2}, Ll/ytu;-><init>(Ll/pcj;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance p2, Ll/ztu;

    .line 56
    .line 57
    invoke-direct {p2, p3}, Ll/ztu;-><init>(Ll/x20;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p0, p0, Ll/buu;->b:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-void
.end method
