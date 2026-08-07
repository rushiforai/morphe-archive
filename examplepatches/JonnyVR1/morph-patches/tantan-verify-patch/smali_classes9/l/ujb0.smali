.class public final synthetic Ll/ujb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ujb0;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/ujb0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ujb0;->a:Landroid/content/Context;

    iget-object p0, p0, Ll/ujb0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->k(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/pf60;)Lcom/p1/mobile/putong/core/ui/purchase/d;

    move-result-object p0

    return-object p0
.end method
