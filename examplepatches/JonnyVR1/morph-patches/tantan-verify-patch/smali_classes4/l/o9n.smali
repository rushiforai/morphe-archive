.class public Ll/o9n;
.super Ll/gp60;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/gp60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)Ljava/lang/Long;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jan;->M3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/m9n;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/m9n;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/n9n;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/n9n;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public d()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jan;->P3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
