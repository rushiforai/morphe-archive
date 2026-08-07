.class public final synthetic Ll/jxm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nxm;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public synthetic constructor <init>(Ll/nxm;Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jxm;->a:Ll/nxm;

    iput-object p2, p0, Ll/jxm;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jxm;->a:Ll/nxm;

    iget-object p0, p0, Ll/jxm;->b:Lcom/p1/mobile/putong/core/data/ProductCategory;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/nxm;->e(Ll/nxm;Lcom/p1/mobile/putong/core/data/ProductCategory;Ll/pf60;)V

    return-void
.end method
