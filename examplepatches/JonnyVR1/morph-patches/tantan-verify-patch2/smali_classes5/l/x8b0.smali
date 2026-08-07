.class public final synthetic Ll/x8b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public final synthetic b:Ll/y8b0;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/y8b0;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x8b0;->a:Lcom/p1/mobile/putong/core/ui/purchase/d;

    iput-object p2, p0, Ll/x8b0;->b:Ll/y8b0;

    iput-object p3, p0, Ll/x8b0;->c:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x8b0;->a:Lcom/p1/mobile/putong/core/ui/purchase/d;

    iget-object v1, p0, Ll/x8b0;->b:Ll/y8b0;

    iget-object p0, p0, Ll/x8b0;->c:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    invoke-static {v0, v1, p0}, Ll/y8b0;->e(Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/y8b0;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    return-void
.end method
