.class public Ll/lky;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/pky;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lv/VRecyclerView;

.field public b:Ll/yiy;

.field public c:Ll/pky;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pky<",
            "Ll/oo2;",
            "Ll/lky;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lv/VRecyclerView;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lky;->a:Lv/VRecyclerView;

    .line 10
    .line 11
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/lky;->C0()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {p1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/lky$a;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/lky$a;-><init>(Ll/lky;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic a(Ll/lky;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lky;->e(ZLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lky;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/pky;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lky;->c:Ll/pky;

    .line 2
    .line 3
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lky;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Z)V
    .locals 3

    .line 1
    new-instance v0, Ll/yiy;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/kky;

    .line 8
    .line 9
    invoke-direct {v2, p0, p1}, Ll/kky;-><init>(Ll/lky;Z)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1, p1, v2}, Ll/yiy;-><init>(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/lky;->b:Ll/yiy;

    .line 16
    .line 17
    iget-object p1, p0, Ll/lky;->a:Lv/VRecyclerView;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/lky;->b:Ll/yiy;

    .line 23
    .line 24
    new-instance p1, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 25
    .line 26
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, p1, v0}, Ll/yiy;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lky;->c:Ll/pky;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, p1, p2}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {p0, p2}, Ll/kny;->c(Ll/i6t;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lky;->b:Ll/yiy;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/yiy;->G(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pky;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lky;->b(Ll/pky;)V

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
