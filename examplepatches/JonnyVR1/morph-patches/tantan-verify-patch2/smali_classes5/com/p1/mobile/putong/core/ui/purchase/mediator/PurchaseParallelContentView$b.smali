.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;


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
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J1\u0010\t\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0002H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$b",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "section",
        "",
        "scroll",
        "isClick",
        "sectionSource",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V",
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->l(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ll/lib0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/lib0;->B(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
