.class public Ll/hdg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/edg0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VProgressBar;

.field public d:Lv/VRecyclerView;

.field public e:Ll/edg0;

.field public final f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

.field public final g:Ll/c;

.field public h:Ll/a80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;Ll/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hdg0;->g:Ll/c;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/hdg0;Landroid/view/View;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hdg0;->f(Landroid/view/View;Lcom/p1/mobile/putong/data/Contract;)V

    return-void
.end method

.method public static synthetic b(Ll/hdg0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hdg0;->i(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hdg0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/idg0;->b(Ll/hdg0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/edg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hdg0;->e:Ll/edg0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hdg0;->h:Ll/a80;

    .line 2
    .line 3
    new-instance v1, Ll/fdg0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/fdg0;-><init>(Ll/hdg0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/a80;->J(Ll/z20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic f(Landroid/view/View;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget v0, Ll/adc0;->Oe:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_2

    .line 8
    .line 9
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const-string v0, "auto_renew_subscriptions_option_type"

    .line 16
    .line 17
    const-string v1, "e_auto_renew_subscriptions_option"

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/hdg0;->g:Ll/c;

    .line 22
    .line 23
    iget-object p2, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->pageId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v2, "subscribe"

    .line 30
    .line 31
    invoke-static {v0, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {p1, v1, p2, v0}, Ll/c;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/hdg0;->e:Ll/edg0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/edg0;->G0()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1, p2}, Ll/xzc0;->A(Lcom/p1/mobile/putong/data/Contract;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Ll/hdg0;->g:Ll/c;

    .line 59
    .line 60
    iget-object v2, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;->pageId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string v3, "cancel"

    .line 67
    .line 68
    invoke-static {v0, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    filled-new-array {v0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-interface {p1, v1, v2, v0}, Ll/c;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    iget-object p0, p0, Ll/hdg0;->e:Ll/edg0;

    .line 80
    .line 81
    invoke-virtual {p0, p2}, Ll/edg0;->H0(Lcom/p1/mobile/putong/data/Contract;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/edg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hdg0;->d(Ll/edg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hdg0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hdg0;->d:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hdg0;->c:Lv/VProgressBar;

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/hdg0;->h:Ll/a80;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/a80;->I(Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hdg0;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->oo:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/hdg0;->b:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/gdg0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/gdg0;-><init>(Ll/hdg0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/hdg0;->d:Lv/VRecyclerView;

    .line 19
    .line 20
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 21
    .line 22
    iget-object v2, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 23
    .line 24
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/a80;

    .line 31
    .line 32
    iget-object v1, p0, Ll/hdg0;->f:Lcom/p1/mobile/putong/core/ui/settings/subscriptions/SubscriptionsAct;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ll/a80;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/hdg0;->h:Ll/a80;

    .line 38
    .line 39
    iget-object p0, p0, Ll/hdg0;->d:Lv/VRecyclerView;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
