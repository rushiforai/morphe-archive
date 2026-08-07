.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$a;
.super Ll/o46;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$a;->c:Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/o46;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 8
    .line 9
    instance-of p1, p0, Ll/cj0;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    check-cast p0, Ll/cj0;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/cj0;->b()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public f(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0

    .line 1
    return-void
.end method
