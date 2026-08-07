.class public final synthetic Ll/t3n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t3n;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    iput-object p2, p0, Ll/t3n;->b:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t3n;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    iget-object p0, p0, Ll/t3n;->b:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/u3n;->a(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
