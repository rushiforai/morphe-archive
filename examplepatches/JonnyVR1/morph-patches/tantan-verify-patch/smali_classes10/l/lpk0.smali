.class public Ll/lpk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ipk0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VFrame;

.field public d:Lv/VSwitch;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Lcom/p1/mobile/putong/live/base/view/EmptyView;

.field public g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public h:Ll/ipk0;

.field public i:Landroid/view/View;


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

.method public static synthetic a(Ll/lpk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lpk0;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p1, Ll/ook0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ook0;->a:Ljava/lang/String;

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

.method private e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lpk0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

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
    iget-object v2, p0, Ll/lpk0;->f:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 18
    .line 19
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/lpk0;->e:Landroidx/recyclerview/widget/RecyclerView;

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
    iget-object p1, p0, Ll/lpk0;->h:Ll/ipk0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lpk0;->d:Lv/VSwitch;

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
    invoke-virtual {p1, p0}, Ll/ipk0;->h4(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/lpk0;->e:Landroidx/recyclerview/widget/RecyclerView;

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
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x1

    .line 11
    invoke-direct {v1, v2, v4, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

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
    iput-object v0, p0, Ll/lpk0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 23
    .line 24
    iget-object v1, p0, Ll/lpk0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/lpk0;->c:Lv/VFrame;

    .line 30
    .line 31
    iget-object v1, p0, Ll/lpk0;->h:Ll/ipk0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/ipk0;->j4()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    xor-int/2addr v1, v4

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/lpk0;->a:Landroid/widget/TextView;

    .line 42
    .line 43
    iget-object v1, p0, Ll/lpk0;->h:Ll/ipk0;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/ipk0;->j4()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    xor-int/2addr v1, v4

    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/lpk0;->b:Landroid/widget/TextView;

    .line 54
    .line 55
    iget-object v1, p0, Ll/lpk0;->h:Ll/ipk0;

    .line 56
    .line 57
    invoke-virtual {v1}, Ll/ipk0;->j4()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    xor-int/2addr v1, v4

    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/lpk0;->c:Lv/VFrame;

    .line 66
    .line 67
    new-instance v1, Ll/jpk0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/jpk0;-><init>(Ll/lpk0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/lpk0;->f:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 76
    .line 77
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kf:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget v1, Ll/obc0;->U4:I

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 86
    .line 87
    .line 88
    invoke-direct {p0}, Ll/lpk0;->e()V

    .line 89
    .line 90
    .line 91
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

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/mpk0;->b(Ll/lpk0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/ipk0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lpk0;->h:Ll/ipk0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/ook0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lpk0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/kpk0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/kpk0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

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
    check-cast p0, Ll/ook0;

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
    iget-object v0, p0, Ll/lpk0;->i:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/lpk0;->h:Ll/ipk0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/lpk0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/lpk0;->i:Landroid/view/View;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/lpk0;->r()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/lpk0;->i:Landroid/view/View;

    .line 26
    .line 27
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ipk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lpk0;->d(Ll/ipk0;)V

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
    invoke-virtual {p0, p1}, Ll/lpk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/ook0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/lpk0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/lpk0;->e()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public l(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/lpk0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/lpk0;->e()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpk0;->d:Lv/VSwitch;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/lpk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/ook0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/ook0;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/lpk0;->p(Ll/ook0;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public p(Ll/ook0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpk0;->g:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
