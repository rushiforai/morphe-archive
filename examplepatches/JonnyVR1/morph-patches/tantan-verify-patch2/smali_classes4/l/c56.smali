.class public final synthetic Ll/c56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c56;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

    iput-object p2, p0, Ll/c56;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iput-object p3, p0, Ll/c56;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c56;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

    iget-object v1, p0, Ll/c56;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iget-object p0, p0, Ll/c56;->c:Lcom/p1/mobile/putong/core/data/Conversation;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
