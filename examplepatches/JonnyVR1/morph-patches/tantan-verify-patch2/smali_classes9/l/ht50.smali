.class public final synthetic Ll/ht50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic b:[Z

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;[ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ht50;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p2, p0, Ll/ht50;->b:[Z

    iput-object p3, p0, Ll/ht50;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ht50;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object v1, p0, Ll/ht50;->b:[Z

    iget-object p0, p0, Ll/ht50;->c:Ll/x20;

    check-cast p1, Ll/ugy;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;[ZLl/x20;Ll/ugy;)V

    return-void
.end method
