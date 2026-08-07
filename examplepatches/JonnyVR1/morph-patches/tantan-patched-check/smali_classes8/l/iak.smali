.class public final synthetic Ll/iak;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Greeting;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iak;->a:Lcom/p1/mobile/putong/core/ui/greet/a;

    iput-object p2, p0, Ll/iak;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/iak;->c:Lcom/p1/mobile/putong/core/data/Greeting;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iak;->a:Lcom/p1/mobile/putong/core/ui/greet/a;

    iget-object v1, p0, Ll/iak;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/iak;->c:Lcom/p1/mobile/putong/core/data/Greeting;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->s0(Lcom/p1/mobile/putong/core/ui/greet/a;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
