.class public final synthetic Ll/w7a;
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


# direct methods
.method public synthetic constructor <init>(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w7a;->a:Ll/lib0;

    iput-object p2, p0, Ll/w7a;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    iput-object p3, p0, Ll/w7a;->c:Lcom/p1/mobile/putong/data/PayMethod;

    iput-object p4, p0, Ll/w7a;->d:Ljava/lang/Boolean;

    iput-object p5, p0, Ll/w7a;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w7a;->a:Ll/lib0;

    iget-object v1, p0, Ll/w7a;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    iget-object v2, p0, Ll/w7a;->c:Lcom/p1/mobile/putong/data/PayMethod;

    iget-object v3, p0, Ll/w7a;->d:Ljava/lang/Boolean;

    iget-object p0, p0, Ll/w7a;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/pay/module/CorePayServiceImpl;->F(Ll/lib0;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method
