.class public Ll/chk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/chk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zgk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

.field public c:Ll/zgk;

.field public d:Ll/sgk;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/chk;->b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/chk;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/chk;->i(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b(Ll/chk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/chk;->f(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/chk;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/chk;->a:Lv/VRecyclerView;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/chk;->b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/chk$a;->a(Ll/chk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/zgk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/chk;->c:Ll/zgk;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/chk;->c:Ll/zgk;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zgk;->j0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/util/List;Ljava/util/List;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-interface {v0, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/chk;->d:Ll/sgk;

    .line 22
    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    new-instance p2, Ll/sgk;

    .line 26
    .line 27
    iget-object p3, p0, Ll/chk;->b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 28
    .line 29
    invoke-direct {p2, p3, p1, v0}, Ll/sgk;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/chk;->d:Ll/sgk;

    .line 33
    .line 34
    iget-object p0, p0, Ll/chk;->a:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {p2, v0}, Ll/sgk;->I(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/chk;->d:Ll/sgk;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zgk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/chk;->e(Ll/zgk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/chk;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/Menu;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/chk;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/chk;->e:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/chk;->b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/nfc0;->a:I

    .line 17
    .line 18
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 19
    .line 20
    .line 21
    sget v0, Ll/edc0;->i2:I

    .line 22
    .line 23
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/ahk;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/ahk;-><init>(Ll/chk;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Ll/chk;->e:Z

    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 29
    :goto_1
    iput-boolean v0, p0, Ll/chk;->f:Z

    .line 30
    .line 31
    iget-object p0, p0, Ll/chk;->b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->S2:I

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "%1$s(%2$s)"

    .line 50
    .line 51
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public l(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bhk;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/bhk;-><init>(Ll/chk;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p3, v0}, Ll/jek;->v(Lcom/p1/mobile/putong/core/data/ChatGroup;Ljava/util/List;Ll/jek$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/chk;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 4
    .line 5
    iget-object p0, p0, Ll/chk;->b:Lcom/p1/mobile/putong/core/ui/messages/group/GroupMembersAct;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x5

    .line 10
    invoke-direct {v1, p0, v4, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
