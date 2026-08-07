.class public final synthetic Ll/geb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/geb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    iput-object p2, p0, Ll/geb0;->b:Ljava/util/List;

    iput-object p3, p0, Ll/geb0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/geb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    iget-object v1, p0, Ll/geb0;->b:Ljava/util/List;

    iget-object p0, p0, Ll/geb0;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
