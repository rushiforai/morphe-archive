.class public final Ll/u8b0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u8b0;->register()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "l/u8b0$d",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;",
        "agreementState",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic a:Ll/u8b0;


# direct methods
.method public constructor <init>(Ll/u8b0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u8b0$d;->a:Ll/u8b0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/u8b0$d;->a:Ll/u8b0;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/z4;->d(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/u8b0$d;->a:Ll/u8b0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/u8b0;->j(Ll/u8b0;)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/u8b0$d;->a:Ll/u8b0;

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Ll/u8b0;->k(Ll/u8b0;Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
