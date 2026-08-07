.class public final synthetic Ll/era;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreProduct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/era;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iput-object p2, p0, Ll/era;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/era;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iget-object p0, p0, Ll/era;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    check-cast p1, Lcom/p1/mobile/putong/data/GPContractEnvelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->r4(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/data/GPContractEnvelope;)V

    return-void
.end method
