.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/pcj<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VPullUpRecyclerView;

.field public z:Ll/g56;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->Q4(Ll/vg60;)V

    return-void
.end method

.method public static synthetic N4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic O4(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;)Ll/g56;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->z:Ll/g56;

    return-object p0
.end method

.method private synthetic Q4(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->z:Ll/g56;

    .line 2
    .line 3
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/mi2;->L(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public P4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u914d\u5bf9"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->P4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/f;->p3(Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->fo()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/h56;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/h56;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/i56;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/i56;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->A:Lv/VPullUpRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Ll/g56;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Ll/g56;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->z:Ll/g56;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->A:Lv/VPullUpRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance p1, Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {p1, p2}, Lv/VPullUpRecyclerView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->A:Lv/VPullUpRecyclerView;

    .line 11
    .line 12
    sget p2, Ll/qa00;->e:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, p2, v0, p2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->A:Lv/VPullUpRecyclerView;

    .line 19
    .line 20
    new-instance p2, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$a;

    .line 21
    .line 22
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/ConversationAddressBookMatchFrag;->A:Lv/VPullUpRecyclerView;

    .line 29
    .line 30
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_contacts_matches"

    .line 2
    .line 3
    return-object p0
.end method
