.class public Ll/ipi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ipi0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dpi0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VList;

.field public c:Lv/VLinear;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/ipi0$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ipi0;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->u:Ll/pcj;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public static synthetic b(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemView;->t:Ll/x20;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/ipi0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ipi0;->i(Landroid/view/View;)V

    return-void
.end method

.method private f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ipi0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ipi0;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/gra;->z()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/ipi0;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    sget v1, Ll/dbc0;->gf:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/ipi0;->a:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    const-string v1, "\u8ba2\u9605\u5185\u5bb9"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ipi0;->a:Lv/navigationbar/VNavigationBar;

    .line 29
    .line 30
    new-instance v1, Ll/gpi0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/gpi0;-><init>(Ll/ipi0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ipi0;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ipi0;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jpi0;->b(Ll/ipi0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public e(Ll/dpi0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ipi0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ipi0;->f:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "e_back"

    .line 15
    .line 16
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dpi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ipi0;->e(Ll/dpi0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ipi0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/util/List;)V
    .locals 4
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
    iget-object v1, p0, Ll/ipi0;->c:Lv/VLinear;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ipi0;->b:Lv/VList;

    .line 15
    .line 16
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ipi0;->b:Lv/VList;

    .line 24
    .line 25
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ipi0;->g:Ll/ipi0$a;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/ipi0$a;->t(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ipi0;->f()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ipi0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ipi0$a;-><init>(Ll/ipi0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ipi0;->g:Ll/ipi0$a;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ipi0;->b:Lv/VList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ipi0;->b:Lv/VList;

    .line 17
    .line 18
    iget-object v1, p0, Ll/ipi0;->g:Ll/ipi0$a;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ipi0;->b:Lv/VList;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ipi0;->b:Lv/VList;

    .line 30
    .line 31
    new-instance v1, Ll/epi0;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/epi0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ipi0;->b:Lv/VList;

    .line 40
    .line 41
    new-instance v1, Ll/fpi0;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/fpi0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ipi0;->b:Lv/VList;

    .line 50
    .line 51
    iget-object p0, p0, Ll/ipi0;->g:Ll/ipi0$a;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Landroid/widget/AbsListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
