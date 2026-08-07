.class public Ll/v060;
.super Ll/qq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qq2<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;",
        "Ll/u060;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qq2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->L4:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/k3m;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v060;->f(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/u060;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qq2;->c:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->a(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/u060;
    .locals 1

    .line 1
    new-instance v0, Ll/u060;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qq2;->a:Ll/dum;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/u060;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
