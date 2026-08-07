.class public final synthetic Ll/ni0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/qi0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Order;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/qi0;Lcom/p1/mobile/putong/data/Order;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ni0;->a:Ll/qi0;

    iput-object p2, p0, Ll/ni0;->b:Lcom/p1/mobile/putong/data/Order;

    iput-object p3, p0, Ll/ni0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ni0;->a:Ll/qi0;

    iget-object v1, p0, Ll/ni0;->b:Lcom/p1/mobile/putong/data/Order;

    iget-object p0, p0, Ll/ni0;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/qi0;->l(Ll/qi0;Lcom/p1/mobile/putong/data/Order;Ll/x20;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    move-result-object p0

    return-object p0
.end method
