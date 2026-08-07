.class public Lcom/p1/mobile/putong/core/ui/messages/group/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/group/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ikk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Ll/ikk;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/group/a;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/group/b;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->f(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->i(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/group/b;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->a:Lv/VRecyclerView;

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->b:Ll/ikk;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->d:Lcom/p1/mobile/putong/core/ui/messages/group/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/group/a;->H()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ll/ikk;->I0(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->b:Ll/ikk;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ikk;->H0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/group/b$a;->a(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Ll/ikk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->b:Ll/ikk;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->n(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->b:Ll/ikk;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ikk;->I0(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ikk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->e(Ll/ikk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/nfc0;->a:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    sget v0, Ll/edc0;->i2:I

    .line 13
    .line 14
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Ll/edc0;->h5:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VText;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->e:Lv/VText;

    .line 31
    .line 32
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/jkk;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/jkk;-><init>(Lcom/p1/mobile/putong/core/ui/messages/group/b;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->n(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->d:Lcom/p1/mobile/putong/core/ui/messages/group/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/a;->J(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 16
    .line 17
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->S2:I

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 24
    .line 25
    add-int/lit8 v2, v2, -0x1

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    :goto_0
    sub-int/2addr v2, p1

    .line 38
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "%1$s(%2$s)"

    .line 47
    .line 48
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public m(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/dek;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->d:Lcom/p1/mobile/putong/core/ui/messages/group/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/a;->K(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->e:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 7
    .line 8
    if-gtz p1, :cond_1

    .line 9
    .line 10
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->W:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->Y:I

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->e:Lv/VText;

    .line 38
    .line 39
    if-lez p1, :cond_2

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    const/4 p1, 0x0

    .line 44
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/group/a;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberAct;

    .line 18
    .line 19
    new-instance v2, Ll/kkk;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ll/kkk;-><init>(Lcom/p1/mobile/putong/core/ui/messages/group/b;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/group/a;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/messages/group/a$a;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->d:Lcom/p1/mobile/putong/core/ui/messages/group/a;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/b;->a:Lv/VRecyclerView;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
