.class public final synthetic Ll/tk40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/fl40;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;


# direct methods
.method public synthetic constructor <init>(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tk40;->a:Ll/fl40;

    iput-object p2, p0, Ll/tk40;->b:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tk40;->a:Ll/fl40;

    iget-object p0, p0, Ll/tk40;->b:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    invoke-static {v0, p0}, Ll/fl40;->k(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    return-void
.end method
