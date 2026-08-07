.class public Ll/yfl0$b;
.super Ll/pow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yfl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public final f:Ljava/lang/String;

.field public final synthetic g:Ll/yfl0;


# direct methods
.method public constructor <init>(Ll/yfl0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yfl0$b;->g:Ll/yfl0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/pow;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    iput-object p4, p0, Ll/yfl0$b;->e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 7
    .line 8
    iput-object p5, p0, Ll/yfl0$b;->f:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pow;->c()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yfl0$b;->g:Ll/yfl0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yfl0;->n()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public x()[Ljava/lang/Object;
    .locals 9

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/yfl0$b;->e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/yfl0$b;->e:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 24
    .line 25
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 26
    .line 27
    move-wide v3, v0

    .line 28
    const-string v1, "currency"

    .line 29
    .line 30
    move-wide v4, v3

    .line 31
    const-string v3, "value"

    .line 32
    .line 33
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const-string v5, "skuID"

    .line 38
    .line 39
    iget-object v6, p0, Ll/yfl0$b;->f:Ljava/lang/String;

    .line 40
    .line 41
    const-string v7, "platform"

    .line 42
    .line 43
    const-string v8, "android"

    .line 44
    .line 45
    filled-new-array/range {v1 .. v8}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    return-object p0

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string v1, "Failed to generate payment params"

    .line 55
    .line 56
    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    sget-object p0, Ll/pow;->d:[Ljava/lang/Object;

    .line 63
    .line 64
    return-object p0
.end method
