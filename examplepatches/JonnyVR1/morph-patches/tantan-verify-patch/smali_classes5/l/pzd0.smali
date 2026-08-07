.class public final synthetic Ll/pzd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Greeting;

.field public final synthetic c:Ll/vzd0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Ll/vzd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pzd0;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/pzd0;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    iput-object p3, p0, Ll/pzd0;->c:Ll/vzd0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzd0;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v1, p0, Ll/pzd0;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    iget-object p0, p0, Ll/pzd0;->c:Ll/vzd0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0, p1}, Ll/vzd0;->y(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;Ll/vzd0;Lcom/p1/mobile/putong/core/data/Message;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
