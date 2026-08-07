.class public final synthetic Ll/b5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    iput-object p2, p0, Ll/b5q;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;

    iget-object p0, p0, Ll/b5q;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedStates;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method
