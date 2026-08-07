.class public final synthetic Ll/zq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/br60;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;


# direct methods
.method public synthetic constructor <init>(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zq60;->a:Ll/br60;

    iput-object p2, p0, Ll/zq60;->b:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zq60;->a:Ll/br60;

    iget-object p0, p0, Ll/zq60;->b:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/br60;->g(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
