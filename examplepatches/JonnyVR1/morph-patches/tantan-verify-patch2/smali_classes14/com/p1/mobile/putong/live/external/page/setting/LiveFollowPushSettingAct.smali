.class public Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/live/external/page/setting/b;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lv/VText;

.field public e:Landroidx/recyclerview/widget/RecyclerView;

.field public f:Lv/VRelative;

.field public g:Lv/VButton;

.field public h:Lcom/p1/mobile/putong/live/external/page/setting/b;

.field public final i:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/page/setting/a;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k:Z

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->d2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->a2(Landroid/os/Bundle;)V

    return-void
.end method

.method private a2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->r()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/b;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->h:Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/cyr;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->h:Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/b;->E2()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic d2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->h:Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/b;->F2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->A:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->c:Lv/navigationbar/VNavigationBar;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g:Lv/VButton;

    .line 25
    .line 26
    new-instance v1, Ll/ifs;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/ifs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    return-object p0
.end method

.method public Z1(Lcom/p1/mobile/putong/live/external/page/setting/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->h:Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 2
    .line 3
    return-void
.end method

.method public b2()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public c2()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/page/setting/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e2(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->f:Lv/VRelative;

    .line 25
    .line 26
    invoke-static {p1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g:Lv/VButton;

    .line 30
    .line 31
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-static {v2, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->f:Lv/VRelative;

    .line 39
    .line 40
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g:Lv/VButton;

    .line 44
    .line 45
    invoke-static {v1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iput-boolean v4, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k:Z

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 65
    .line 66
    new-instance v2, Lcom/p1/mobile/putong/live/external/page/setting/a;

    .line 67
    .line 68
    invoke-direct {v2, v1}, Lcom/p1/mobile/putong/live/external/page/setting/a;-><init>(Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->h:Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->K(Lcom/p1/mobile/putong/live/external/page/setting/b;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k2()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public g2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->f:Lv/VRelative;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g:Lv/VButton;

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public h2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->f:Lv/VRelative;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/setting/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->Z1(Lcom/p1/mobile/putong/live/external/page/setting/b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i2(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/external/page/setting/a;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->setPushEnabled(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 27
    .line 28
    new-instance v3, Lcom/p1/mobile/putong/live/external/page/setting/a$a;

    .line 29
    .line 30
    invoke-direct {v3, p1}, Lcom/p1/mobile/putong/live/external/page/setting/a$a;-><init>(Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v1, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k:Z

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k2()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->m:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/ldc0;->c1:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->c:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    sget p2, Ll/ldc0;->p0:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lv/VText;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->d:Lv/VText;

    .line 27
    .line 28
    sget p2, Ll/ldc0;->k1:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    .line 38
    sget p2, Ll/ldc0;->g0:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Lv/VRelative;

    .line 45
    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->f:Lv/VRelative;

    .line 47
    .line 48
    sget p2, Ll/ldc0;->y:I

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Lv/VButton;

    .line 55
    .line 56
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g:Lv/VButton;

    .line 57
    .line 58
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hfs;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hfs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->k:Z

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->g:Lv/VButton;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->y:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->z:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public l2(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/live/external/page/setting/a;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->anchorId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->setPushEnabled(Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushSettingAct;->i:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 39
    .line 40
    new-instance p1, Lcom/p1/mobile/putong/live/external/page/setting/a$a;

    .line 41
    .line 42
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/a$a;-><init>(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->P(Ll/d3q;Ll/we2;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_setting"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
