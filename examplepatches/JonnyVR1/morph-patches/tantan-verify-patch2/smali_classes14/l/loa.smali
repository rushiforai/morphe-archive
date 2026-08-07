.class public final synthetic Ll/loa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreProduct;

.field public final synthetic b:[Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreProduct;[Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/loa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iput-object p2, p0, Ll/loa;->b:[Lcom/p1/mobile/putong/core/data/ProductCategory;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/loa;->a:Lcom/p1/mobile/putong/core/api/CoreProduct;

    iget-object p0, p0, Ll/loa;->b:[Lcom/p1/mobile/putong/core/data/ProductCategory;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->p4(Lcom/p1/mobile/putong/core/api/CoreProduct;[Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    return-void
.end method
