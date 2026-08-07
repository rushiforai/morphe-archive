.class public Ll/hsj0;
.super Ll/lud0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/lud0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/lud0;->b()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/lud0;->d()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/m27;->V3()Lrx/c;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
