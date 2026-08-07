.class public final synthetic Ll/vo60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vo60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p2, p0, Ll/vo60;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vo60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object p0, p0, Ll/vo60;->b:Ljava/lang/Object;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/fp60;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;Ll/uxj0;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
