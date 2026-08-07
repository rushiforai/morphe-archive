.class public final synthetic Ll/v7a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/lib0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public final synthetic c:Lcom/p1/mobile/putong/data/PayMethod;

.field public final synthetic d:Ljava/lang/Boolean;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final synthetic f:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v7a;->a:Ll/lib0;

    iput-object p2, p0, Ll/v7a;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    iput-object p3, p0, Ll/v7a;->c:Lcom/p1/mobile/putong/data/PayMethod;

    iput-object p4, p0, Ll/v7a;->d:Ljava/lang/Boolean;

    iput-object p5, p0, Ll/v7a;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p6, p0, Ll/v7a;->f:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/v7a;->a:Ll/lib0;

    iget-object v1, p0, Ll/v7a;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    iget-object v2, p0, Ll/v7a;->c:Lcom/p1/mobile/putong/data/PayMethod;

    iget-object v3, p0, Ll/v7a;->d:Ljava/lang/Boolean;

    iget-object v4, p0, Ll/v7a;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iget-object v5, p0, Ll/v7a;->f:Ll/x20;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/pay/module/CorePayServiceImpl;->H(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;)V

    return-void
.end method
