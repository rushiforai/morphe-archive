.class public final synthetic Ll/rq7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rq7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/rq7;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rq7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/rq7;->b:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->I4(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
