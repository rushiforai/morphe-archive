.class public final synthetic Ll/gop0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nop0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/PurchasePaymentParam;


# direct methods
.method public synthetic constructor <init>(Ll/nop0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gop0;->a:Ll/nop0;

    iput-object p2, p0, Ll/gop0;->b:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gop0;->a:Ll/nop0;

    iget-object p0, p0, Ll/gop0;->b:Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/nop0;->d(Ll/nop0;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method
