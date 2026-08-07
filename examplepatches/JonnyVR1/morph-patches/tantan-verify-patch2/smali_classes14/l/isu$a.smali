.class public Ll/isu$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/isu;->i0(D)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
        ">;",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/isu;


# direct methods
.method public constructor <init>(Ll/isu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isu$a;->a:Ll/isu;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/isu$a;->a:Ll/isu;

    .line 2
    .line 3
    invoke-static {v0}, Ll/isu;->t(Ll/isu;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x6

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x5

    .line 22
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const/4 v1, 0x0

    .line 33
    iput-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 34
    .line 35
    iput-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRechargeInput:Z

    .line 36
    .line 37
    iget-object v1, p0, Ll/isu$a;->a:Ll/isu;

    .line 38
    .line 39
    invoke-static {v1}, Ll/isu;->t(Ll/isu;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 48
    .line 49
    iget-object p0, p0, Ll/isu$a;->a:Ll/isu;

    .line 50
    .line 51
    invoke-static {p0}, Ll/isu;->t(Ll/isu;)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    int-to-double v2, p0

    .line 56
    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    .line 57
    .line 58
    div-double/2addr v2, v4

    .line 59
    iput-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isIncomingPrice:Z

    .line 63
    .line 64
    const/4 p0, 0x4

    .line 65
    invoke-interface {v0, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    invoke-interface {v0, p0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_0
    return-object p1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/isu$a;->a(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
