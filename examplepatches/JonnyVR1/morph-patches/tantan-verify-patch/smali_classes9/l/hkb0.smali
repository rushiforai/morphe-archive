.class public final synthetic Ll/hkb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hkb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    iput-object p2, p0, Ll/hkb0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hkb0;->a:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    iget-object p0, p0, Ll/hkb0;->b:Ljava/util/List;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)V

    return-void
.end method
