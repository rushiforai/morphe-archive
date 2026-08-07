.class public final synthetic Ll/tl60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xl60;

.field public final synthetic b:Ll/mdf0;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/SignPaymentParam;


# direct methods
.method public synthetic constructor <init>(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tl60;->a:Ll/xl60;

    iput-object p2, p0, Ll/tl60;->b:Ll/mdf0;

    iput-object p3, p0, Ll/tl60;->c:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tl60;->a:Ll/xl60;

    iget-object v1, p0, Ll/tl60;->b:Ll/mdf0;

    iget-object p0, p0, Ll/tl60;->c:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    check-cast p1, Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    invoke-static {v0, v1, p0, p1}, Ll/xl60;->e(Ll/xl60;Ll/mdf0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method
