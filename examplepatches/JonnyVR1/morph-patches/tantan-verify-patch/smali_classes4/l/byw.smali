.class public Ll/byw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/byw$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ayw;",
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

.field public g:Landroid/view/View;

.field public h:Ll/byw$d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/byw;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method private c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/byw;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/byw;->f:Lcom/p1/mobile/android/app/Act;

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
    iget-object v0, p0, Ll/byw;->a:Lv/navigationbar/VNavigationBar;

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
    iget-object v0, p0, Ll/byw;->a:Lv/navigationbar/VNavigationBar;

    .line 22
    .line 23
    const-string v1, "\u6d88\u606f"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/byw;->a:Lv/navigationbar/VNavigationBar;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    new-array v2, v1, [Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/byw;->f:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v2, Ll/kec0;->N6:I

    .line 43
    .line 44
    iget-object v3, p0, Ll/byw;->a:Lv/navigationbar/VNavigationBar;

    .line 45
    .line 46
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/byw;->g:Landroid/view/View;

    .line 51
    .line 52
    iget-object v1, p0, Ll/byw;->a:Lv/navigationbar/VNavigationBar;

    .line 53
    .line 54
    filled-new-array {v0}, [Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/byw;->g:Landroid/view/View;

    .line 62
    .line 63
    new-instance v1, Ll/byw$c;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/byw$c;-><init>(Ll/byw;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/byw;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eyw;->b(Ll/byw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/byw;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/ayw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/byw;->c()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/byw$d;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/byw$d;-><init>(Ll/byw;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/byw;->h:Ll/byw$d;

    .line 10
    .line 11
    iget-object v0, p0, Ll/byw;->b:Lv/VList;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/byw;->b:Lv/VList;

    .line 17
    .line 18
    iget-object v0, p0, Ll/byw;->h:Ll/byw$d;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/byw;->b:Lv/VList;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setNestedScrollingEnabled(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/byw;->b:Lv/VList;

    .line 30
    .line 31
    new-instance v0, Ll/byw$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/byw$a;-><init>(Ll/byw;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/byw;->b:Lv/VList;

    .line 40
    .line 41
    new-instance v0, Ll/byw$b;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/byw$b;-><init>(Ll/byw;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/AdapterView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/util/List;)V
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
    iget-object v1, p0, Ll/byw;->c:Lv/VLinear;

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
    iget-object p1, p0, Ll/byw;->b:Lv/VList;

    .line 15
    .line 16
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/byw;->g:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/byw;->b:Lv/VList;

    .line 29
    .line 30
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/byw;->g:Landroid/view/View;

    .line 34
    .line 35
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/byw;->h:Ll/byw$d;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/byw$d;->s(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ayw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/byw;->b(Ll/ayw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/byw;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
