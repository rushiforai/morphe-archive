.class public Ll/o24;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z74;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/TextView;

.field public d:Ll/z74;

.field public e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public f:Ll/rop0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/o24;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o24;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o24;->d:Ll/z74;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/z74;->s4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/o24;->d:Ll/z74;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/p24;->b(Ll/o24;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/z74;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o24;->d:Ll/z74;

    .line 2
    .line 3
    return-void
.end method

.method public d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/o24;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Ll/o24;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Ll/o24;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    .line 16
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/o24;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const/4 v5, 0x1

    .line 23
    const/4 v6, 0x0

    .line 24
    invoke-direct {v3, v4, v5, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/o24;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 36
    .line 37
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 41
    .line 42
    iget-object v2, p0, Ll/o24;->a:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/o24;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    new-instance v2, Ll/n24;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/n24;-><init>(Ll/o24;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/o24;->c:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ll/vwt;->T3()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->callSettingButtonText:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    new-instance v1, Ll/rop0;

    .line 73
    .line 74
    invoke-direct {v1}, Ll/rop0;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Ll/o24;->f:Ll/rop0;

    .line 78
    .line 79
    return-object v0
.end method

.method public i(Ll/qop0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z74;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o24;->c(Ll/z74;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Ll/d3q;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x1

    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v1, p0, Ll/o24;->f:Ll/rop0;

    .line 28
    .line 29
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 v0, 0x0

    .line 42
    :goto_0
    invoke-virtual {p0, v0}, Ll/o24;->l(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public k(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o24;->f:Ll/rop0;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/o24;->f:Ll/rop0;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/o24;->f:Ll/rop0;

    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/o24;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 p1, 0x0

    .line 41
    :goto_0
    invoke-virtual {p0, p1}, Ll/o24;->l(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o24;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
