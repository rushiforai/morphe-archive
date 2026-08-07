.class public final synthetic Ll/b56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic d:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b56;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

    iput-object p2, p0, Ll/b56;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iput-object p3, p0, Ll/b56;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p4, p0, Ll/b56;->d:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b56;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

    iget-object v1, p0, Ll/b56;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iget-object v2, p0, Ll/b56;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object p0, p0, Ll/b56;->d:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->c(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V

    return-void
.end method
