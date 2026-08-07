.class public final synthetic Ll/d56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public final synthetic d:[Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/ChatGroup;[Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d56;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

    iput-object p2, p0, Ll/d56;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iput-object p3, p0, Ll/d56;->c:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iput-object p4, p0, Ll/d56;->d:[Ljava/lang/String;

    iput-object p5, p0, Ll/d56;->e:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/d56;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;

    iget-object v1, p0, Ll/d56;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iget-object v2, p0, Ll/d56;->c:Lcom/p1/mobile/putong/core/data/ChatGroup;

    iget-object v3, p0, Ll/d56;->d:[Ljava/lang/String;

    iget-object v4, p0, Ll/d56;->e:Lcom/p1/mobile/putong/core/data/Conversation;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;->b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupView;Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Lcom/p1/mobile/putong/core/data/ChatGroup;[Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method
