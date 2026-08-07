.class public final synthetic Ll/wfq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wfq;->a:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wfq;->a:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemReference;->e(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
