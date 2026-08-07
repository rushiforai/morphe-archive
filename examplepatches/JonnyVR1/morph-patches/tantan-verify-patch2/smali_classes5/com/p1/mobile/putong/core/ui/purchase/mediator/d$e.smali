.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->c0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/purchase/mediator/d$e",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;",
        "Ll/jn60;",
        "paymentHandlerData",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "a",
        "(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$e;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d$e;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;->M(Lcom/p1/mobile/putong/core/ui/purchase/mediator/d;)Ll/lib0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ll/lib0;->x(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
