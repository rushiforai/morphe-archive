.class public Ll/zik;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zik$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/yik;",
        ">;",
        "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;"
    }
.end annotation


# instance fields
.field public a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

.field public b:Lv/VRecyclerView;

.field public final c:Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;

.field public d:Ll/yik;

.field public e:Ll/gik;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zik;->c:Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/zik;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zik;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    return-void
.end method

.method public static bridge synthetic b(Ll/zik;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zik;->b:Lv/VRecyclerView;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zik;->c:Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zik$a;->a(Ll/zik;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/yik;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zik;->d:Ll/yik;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupNotification;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zik;->e:Ll/gik;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/zik;->e:Ll/gik;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/gik;->H(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zik;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/data/GroupApply;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zik;->e:Ll/gik;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/zik;->e:Ll/gik;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/gik;->I(Lcom/p1/mobile/putong/core/data/GroupApply;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/yik;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zik;->d(Ll/yik;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zik;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zik;->d:Ll/yik;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yik;->C0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zik;->c:Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->b0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/gik;

    .line 9
    .line 10
    iget-object v1, p0, Ll/zik;->c:Lcom/p1/mobile/putong/core/newui/group/GroupNotificationAct;

    .line 11
    .line 12
    iget-object v2, p0, Ll/zik;->d:Ll/yik;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ll/gik;-><init>(Lcom/p1/mobile/android/app/Act;Ll/yik;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/zik;->e:Ll/gik;

    .line 18
    .line 19
    iget-object v1, p0, Ll/zik;->b:Lv/VRecyclerView;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/zik;->a:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
