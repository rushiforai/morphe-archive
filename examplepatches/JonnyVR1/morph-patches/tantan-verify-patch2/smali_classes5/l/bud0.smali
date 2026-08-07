.class public Ll/bud0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ytd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VRecyclerView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VText;

.field public final f:Lcom/p1/mobile/putong/app/PutongAct;

.field public g:Ll/ytd0;

.field public h:Ll/zzk;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/bud0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bud0;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/bud0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bud0;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_intl_svip_introduction_skip"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/wtd0;->q()V

    .line 17
    .line 18
    .line 19
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 20
    .line 21
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "e_intl_svip_introduction_learn_more"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/wtd0;->e()Ll/wtd0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/wtd0;->q()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Fe(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cud0;->b(Ll/bud0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/ytd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bud0;->g:Ll/ytd0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ytd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bud0;->d(Ll/ytd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bud0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/bud0;->c:Lv/VRecyclerView;

    .line 13
    .line 14
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 15
    .line 16
    iget-object v3, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/keh0;

    .line 25
    .line 26
    iget-object v2, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    invoke-direct {v0, v2}, Ll/keh0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/zzk;

    .line 32
    .line 33
    invoke-direct {v2, v0}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 34
    .line 35
    .line 36
    iput-object v2, p0, Ll/bud0;->h:Ll/zzk;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    sget v3, Ll/pec0;->K1:I

    .line 47
    .line 48
    iget-object v4, p0, Ll/bud0;->c:Lv/VRecyclerView;

    .line 49
    .line 50
    invoke-virtual {v2, v3, v4, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lcom/p1/mobile/putong/core/ui/svip/guide/SvipIntlHeaderView;

    .line 55
    .line 56
    iget-object v2, p0, Ll/bud0;->h:Ll/zzk;

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    new-instance v1, Landroid/widget/LinearLayout;

    .line 62
    .line 63
    iget-object v2, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 64
    .line 65
    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 69
    .line 70
    iget-object v3, p0, Ll/bud0;->f:Lcom/p1/mobile/putong/app/PutongAct;

    .line 71
    .line 72
    const/high16 v4, 0x42200000    # 40.0f

    .line 73
    .line 74
    invoke-static {v3, v4}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    const/4 v4, -0x1

    .line 79
    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Ll/bud0;->h:Ll/zzk;

    .line 86
    .line 87
    invoke-virtual {v2, v1}, Ll/zzk;->F(Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/bud0;->c:Lv/VRecyclerView;

    .line 91
    .line 92
    iget-object v2, p0, Ll/bud0;->h:Ll/zzk;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ll/bud0;->d:Landroid/widget/TextView;

    .line 98
    .line 99
    new-instance v2, Ll/ztd0;

    .line 100
    .line 101
    invoke-direct {v2, p0}, Ll/ztd0;-><init>(Ll/bud0;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/bud0;->e:Lv/VText;

    .line 108
    .line 109
    new-instance v2, Ll/aud0;

    .line 110
    .line 111
    invoke-direct {v2, p0}, Ll/aud0;-><init>(Ll/bud0;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 118
    .line 119
    const/4 v1, 0x0

    .line 120
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v0, p0}, Ll/keh0;->G(Ljava/util/ArrayList;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method
