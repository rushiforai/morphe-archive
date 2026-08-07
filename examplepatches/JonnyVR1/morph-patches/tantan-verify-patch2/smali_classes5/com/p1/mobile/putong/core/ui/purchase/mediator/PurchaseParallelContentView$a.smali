.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->w()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001d\u0010\u0006\u001a\u00020\u00052\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0016\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;",
        "",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "sections",
        "",
        "a",
        "(Ljava/util/List;)V",
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast p1, Ljava/util/Collection;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->o(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ljava/util/Collection;

    .line 47
    .line 48
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->p(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->q(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->E()V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method
