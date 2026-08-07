.class public final synthetic Ll/qo60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Privilege;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qo60;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    iput-object p2, p0, Ll/qo60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p3, p0, Ll/qo60;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    iput-object p4, p0, Ll/qo60;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qo60;->a:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    iget-object v1, p0, Ll/qo60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object v2, p0, Ll/qo60;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    iget-object p0, p0, Ll/qo60;->d:Ljava/lang/Object;

    check-cast p1, Lcom/p1/mobile/putong/data/Data;

    invoke-static {v0, v1, v2, p0, p1}, Ll/fp60;->y(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Data;)V

    return-void
.end method
