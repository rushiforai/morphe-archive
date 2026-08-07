.class public final synthetic Ll/ar60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ar60;->a:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar60;->a:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {p0, p1}, Ll/br60;->f(Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
