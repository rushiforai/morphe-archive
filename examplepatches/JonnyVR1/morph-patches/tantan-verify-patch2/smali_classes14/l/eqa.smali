.class public final synthetic Ll/eqa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreProduct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RequestPromotion;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/RequestPromotion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eqa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iput-object p2, p0, Ll/eqa;->b:Lcom/p1/mobile/putong/core/data/RequestPromotion;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eqa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iget-object p0, p0, Ll/eqa;->b:Lcom/p1/mobile/putong/core/data/RequestPromotion;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/RequestPromotion;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
