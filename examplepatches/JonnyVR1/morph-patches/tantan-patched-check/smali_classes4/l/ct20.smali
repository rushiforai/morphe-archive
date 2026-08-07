.class public final synthetic Ll/ct20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ct20;->a:Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ct20;->a:Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;->j3(Lcom/p1/mobile/putong/core/newui/messages/NewConversationItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
