.class public final synthetic Ll/qjb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/qjb0;->a:Z

    iput-object p2, p0, Ll/qjb0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/qjb0;->a:Z

    iget-object p0, p0, Ll/qjb0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->j(ZLcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
