.class public final synthetic Ll/l58;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l58;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/l58;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l58;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/l58;->b:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->ra(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
