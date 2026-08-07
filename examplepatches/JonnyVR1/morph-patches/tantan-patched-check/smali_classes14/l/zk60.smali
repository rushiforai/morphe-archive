.class public final synthetic Ll/zk60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/PaymentApi;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/PaymentApi;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zk60;->a:Lcom/p1/mobile/putong/api/api/PaymentApi;

    iput-object p2, p0, Ll/zk60;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zk60;->a:Lcom/p1/mobile/putong/api/api/PaymentApi;

    iget-object p0, p0, Ll/zk60;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/ContractEnvelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->L(Lcom/p1/mobile/putong/api/api/PaymentApi;Ljava/lang/String;Lcom/p1/mobile/putong/data/ContractEnvelope;)Lcom/p1/mobile/putong/data/ContractEnvelope;

    move-result-object p0

    return-object p0
.end method
