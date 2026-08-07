.class public Lcom/p1/mobile/putong/core/newui/messages/b;
.super Ll/jic0;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;",
        "Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/core/newui/messages/b$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->d:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    const/4 v1, 0x5

    .line 11
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->e:Ljava/util/Set;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->c:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->f:I

    .line 19
    .line 20
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->g:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/b;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/kec0;->Xb:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->setOnSelectChangeListener(Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView$a;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Conversation;II)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;

    .line 2
    .line 3
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->e:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    invoke-virtual {p1, p3, p0, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ShareMessageToFriendListItemView;->Y(Lcom/p1/mobile/android/app/Act;Ll/jic0;Lcom/p1/mobile/putong/core/data/Conversation;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->d:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/core/newui/messages/b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->h:Lcom/p1/mobile/putong/core/newui/messages/b$a;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/b;->F(I)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->e:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->f:I

    .line 8
    .line 9
    if-lt v0, v1, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->e:Ljava/util/Set;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public w(Lcom/p1/mobile/putong/core/data/Conversation;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->e:Ljava/util/Set;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->h:Lcom/p1/mobile/putong/core/newui/messages/b$a;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->h:Lcom/p1/mobile/putong/core/newui/messages/b$a;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/b;->e:Ljava/util/Set;

    .line 27
    .line 28
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/b$a;->a(Ljava/util/Set;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method
