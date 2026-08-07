.class public final synthetic Ll/eap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eap;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eap;->a:Lcom/p1/mobile/putong/core/data/ProductCategory;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    invoke-static {p0, p1}, Ll/map;->i(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
