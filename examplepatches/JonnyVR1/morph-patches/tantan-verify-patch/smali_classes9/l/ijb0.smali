.class public final synthetic Ll/ijb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ijb0;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    iput-object p2, p0, Ll/ijb0;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/ijb0;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ijb0;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    iget-object v1, p0, Ll/ijb0;->b:Landroid/content/Context;

    iget-object p0, p0, Ll/ijb0;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->f(Lcom/p1/mobile/putong/core/data/ProductCategory;Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
