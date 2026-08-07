.class public final synthetic Ll/tpa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreProduct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreProduct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tpa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tpa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    check-cast p1, Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->m4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;

    move-result-object p0

    return-object p0
.end method
