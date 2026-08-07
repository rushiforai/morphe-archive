.class public final synthetic Ll/oi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/qi0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Order;


# direct methods
.method public synthetic constructor <init>(Ll/qi0;Lcom/p1/mobile/putong/data/Order;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oi0;->a:Ll/qi0;

    iput-object p2, p0, Ll/oi0;->b:Lcom/p1/mobile/putong/data/Order;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oi0;->a:Ll/qi0;

    iget-object p0, p0, Ll/oi0;->b:Lcom/p1/mobile/putong/data/Order;

    invoke-static {v0, p0}, Ll/qi0;->f(Ll/qi0;Lcom/p1/mobile/putong/data/Order;)Lcom/p1/mobile/putong/api/api/PaymentApi$SignResultStatus;

    move-result-object p0

    return-object p0
.end method
