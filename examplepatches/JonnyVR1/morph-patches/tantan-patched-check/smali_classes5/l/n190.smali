.class public final synthetic Ll/n190;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/o190;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public synthetic constructor <init>(Ll/o190;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n190;->a:Ll/o190;

    iput-object p2, p0, Ll/n190;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p3, p0, Ll/n190;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n190;->a:Ll/o190;

    iget-object v1, p0, Ll/n190;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object p0, p0, Ll/n190;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, v1, p0}, Ll/o190;->a(Ll/o190;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method
