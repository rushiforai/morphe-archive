.class public final synthetic Ll/hl60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PaymentParam;

.field public final synthetic b:Lcom/p1/mobile/putong/data/PaymentParam;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PaymentParam;Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hl60;->a:Lcom/p1/mobile/putong/data/PaymentParam;

    iput-object p2, p0, Ll/hl60;->b:Lcom/p1/mobile/putong/data/PaymentParam;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hl60;->a:Lcom/p1/mobile/putong/data/PaymentParam;

    iget-object p0, p0, Ll/hl60;->b:Lcom/p1/mobile/putong/data/PaymentParam;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->H(Lcom/p1/mobile/putong/data/PaymentParam;Lcom/p1/mobile/putong/data/PaymentParam;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
