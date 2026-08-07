.class public final synthetic Ll/bp60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p2, p0, Ll/bp60;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bp60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object p0, p0, Ll/bp60;->b:Ljava/lang/Object;

    invoke-static {v0, p0}, Ll/fp60;->r(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    return-void
.end method
