.class public final synthetic Ll/uoa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreProduct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uoa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iput-object p2, p0, Ll/uoa;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    iput-object p3, p0, Ll/uoa;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uoa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iget-object v1, p0, Ll/uoa;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    iget-object p0, p0, Ll/uoa;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->F3(Lcom/p1/mobile/putong/core/api/CoreProduct;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method
