.class public Ll/xng;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/jn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wng;",
        ">;",
        "Ll/jn50;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VPullDownRefreshLayout;

.field public c:Lv/VRecyclerView;

.field public d:Lv/VLinear;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Ll/wng;

.field public h:Ll/sng;

.field public i:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/allgroup/FeedAllGroupFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/xng;->i:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xng;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/yng;->b(Ll/xng;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/yng;->c(Ll/xng;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/wng;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xng;->g:Ll/wng;

    .line 2
    .line 3
    return-void
.end method

.method public d(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xng;->b:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/xng;->b:Lv/VPullDownRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p1}, Lv/smart_refresh/SmartRefreshLayout;->l()Z

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/sng;

    .line 12
    .line 13
    iget-object v0, p0, Ll/xng;->i:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v1, p0, Ll/xng;->g:Ll/wng;

    .line 16
    .line 17
    iget v1, v1, Ll/wng;->a:I

    .line 18
    .line 19
    invoke-direct {p1, v0, v1}, Ll/sng;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/xng;->h:Ll/sng;

    .line 23
    .line 24
    iget-object p0, p0, Ll/xng;->c:Lv/VRecyclerView;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
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
            "Lcom/p1/mobile/putong/feed/data/Group;",
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
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ll/xng;->g:Ll/wng;

    .line 8
    .line 9
    iget p1, p1, Ll/wng;->a:I

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/xng;->d:Lv/VLinear;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/xng;->b:Lv/VPullDownRefreshLayout;

    .line 20
    .line 21
    const/16 v0, 0x8

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/xng;->f:Lv/VText;

    .line 27
    .line 28
    const-string p1, "\u5de6\u6ed1\u53d1\u73b0\u66f4\u591a\u5708\u5b50"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :cond_1
    iget-object p0, p0, Ll/xng;->h:Ll/sng;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/sng;->J(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xng;->b:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wng;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xng;->c(Ll/wng;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xng;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/xng;->g:Ll/wng;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wng;->m0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
