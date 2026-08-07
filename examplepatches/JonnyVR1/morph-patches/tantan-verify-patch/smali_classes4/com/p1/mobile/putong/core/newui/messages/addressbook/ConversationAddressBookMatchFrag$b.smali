.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->O4(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;)Ll/g56;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/mi2;->H(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;->b:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->O4(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;)Ll/g56;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ll/mi2;->I(I)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method
