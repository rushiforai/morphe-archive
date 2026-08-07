.class public final synthetic Ll/yk40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fl40;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Ll/fl40;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yk40;->a:Ll/fl40;

    iput-object p2, p0, Ll/yk40;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yk40;->a:Ll/fl40;

    iget-object p0, p0, Ll/yk40;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/fl40;->i(Ll/fl40;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Boolean;)V

    return-void
.end method
