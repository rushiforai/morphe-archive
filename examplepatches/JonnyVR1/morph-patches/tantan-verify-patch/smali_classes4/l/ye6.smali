.class public final synthetic Ll/ye6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ye6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    iput-object p2, p0, Ll/ye6;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/ye6;->c:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ye6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;

    iget-object v1, p0, Ll/ye6;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v2, p0, Ll/ye6;->c:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->p0(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
