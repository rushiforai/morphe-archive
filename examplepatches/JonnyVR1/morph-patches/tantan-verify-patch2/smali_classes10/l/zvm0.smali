.class public Ll/zvm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wvm0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VFrame;

.field public e:Lv/VSwitchButton;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/view/View;

.field public h:Landroidx/recyclerview/widget/RecyclerView;

.field public i:Landroid/widget/LinearLayout;

.field public j:Ll/wvm0;

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/zvm0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/zvm0;->k:Landroid/view/View;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/zvm0;->r()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p1, Ll/bvm0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/bvm0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(Ll/zvm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zvm0;->j(Landroid/view/View;)V

    return-void
.end method

.method private e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zvm0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v2, p0, Ll/zvm0;->i:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/zvm0;->f:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    xor-int/2addr v0, v1

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zvm0;->j:Ll/wvm0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zvm0;->e:Lv/VSwitchButton;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/wvm0;->q4(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zvm0;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-direct {v1, v2, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/zvm0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 23
    .line 24
    iget-object v1, p0, Ll/zvm0;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/zvm0;->d:Lv/VFrame;

    .line 30
    .line 31
    new-instance v1, Ll/xvm0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/xvm0;-><init>(Ll/zvm0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Ll/zvm0;->e()V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zvm0;->j:Ll/wvm0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wvm0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/awm0;->b(Ll/zvm0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/wvm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zvm0;->j:Ll/wvm0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/bvm0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zvm0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/yvm0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/yvm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/d3q;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    check-cast p0, Ll/bvm0;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public i()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zvm0;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/zvm0;->C0()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v0, v1}, Ll/zvm0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/zvm0;->k:Landroid/view/View;

    .line 20
    .line 21
    return-object v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wvm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zvm0;->d(Ll/wvm0;)V

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

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/zvm0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/bvm0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/zvm0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/zvm0;->e()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public l(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zvm0;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zvm0;->j:Ll/wvm0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wvm0;->s4()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    xor-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/zvm0;->g:Landroid/view/View;

    .line 15
    .line 16
    iget-object v1, p0, Ll/zvm0;->j:Ll/wvm0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/wvm0;->s4()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    xor-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/zvm0;->b:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-static {p2}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    const-string p2, "#CCffffff"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const-string p2, "#ffffff"

    .line 39
    .line 40
    :goto_0
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/zvm0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 48
    .line 49
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0}, Ll/zvm0;->e()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zvm0;->e:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/zvm0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/bvm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/bvm0;->K(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/zvm0;->p(Ll/bvm0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public p(Ll/bvm0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zvm0;->l:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
