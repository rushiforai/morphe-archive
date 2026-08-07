.class public final synthetic Ll/z46;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z46;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iput-object p2, p0, Ll/z46;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z46;->a:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;

    iget-object p0, p0, Ll/z46;->b:Landroid/view/View;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;->O(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookGroupFrag$a;Landroid/view/View;)V

    return-void
.end method
