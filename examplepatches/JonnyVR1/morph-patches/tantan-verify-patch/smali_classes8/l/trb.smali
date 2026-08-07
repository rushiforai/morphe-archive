.class public Ll/trb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method


# virtual methods
.method public b(ILl/qrl;)V
    .locals 5
    .param p2    # Ll/qrl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/rrb;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/rrb;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/srb;

    .line 40
    .line 41
    invoke-direct {v0, p2}, Ll/srb;-><init>(Ll/qrl;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/trb$a;

    .line 49
    .line 50
    invoke-direct {v0, p0, p2}, Ll/trb$a;-><init>(Ll/trb;Ll/qrl;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Ll/trb;->a:Ll/kcg0;

    .line 62
    .line 63
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/trb;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
