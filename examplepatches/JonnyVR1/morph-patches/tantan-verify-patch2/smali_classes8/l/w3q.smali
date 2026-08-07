.class public final synthetic Ll/w3q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w3q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w3q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemChatInterceptRight;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
