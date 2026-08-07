.class public final synthetic Ll/zd5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fe5;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public synthetic constructor <init>(Ll/fe5;Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zd5;->a:Ll/fe5;

    iput-object p2, p0, Ll/zd5;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zd5;->a:Ll/fe5;

    iget-object p0, p0, Ll/zd5;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/fe5;->d(Ll/fe5;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method
