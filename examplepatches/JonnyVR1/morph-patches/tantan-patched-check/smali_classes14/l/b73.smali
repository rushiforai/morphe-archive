.class public final synthetic Ll/b73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b73;->a:Ll/x20;

    iput-object p2, p0, Ll/b73;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b73;->a:Ll/x20;

    iget-object p0, p0, Ll/b73;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    check-cast p1, Ll/ugy;

    invoke-static {v0, p0, p1}, Ll/u73;->p(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ugy;)V

    return-void
.end method
