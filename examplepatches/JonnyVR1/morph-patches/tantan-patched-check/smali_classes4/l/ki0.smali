.class public final synthetic Ll/ki0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qi0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SignPaymentParam;


# direct methods
.method public synthetic constructor <init>(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ki0;->a:Ll/qi0;

    iput-object p2, p0, Ll/ki0;->b:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ki0;->a:Ll/qi0;

    iget-object p0, p0, Ll/ki0;->b:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    check-cast p1, Lcom/p1/mobile/putong/data/OrderData;

    invoke-static {v0, p0, p1}, Ll/qi0;->m(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/data/OrderData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
