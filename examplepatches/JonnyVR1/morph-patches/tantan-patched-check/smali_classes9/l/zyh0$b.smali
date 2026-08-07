.class public Ll/zyh0$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zyh0;-><init>(Ll/wdf;Lcom/google/android/material/tabs/TabLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wdf;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

.field public final synthetic c:Lcom/google/android/material/tabs/TabLayout;

.field public final synthetic d:Ll/zyh0;


# direct methods
.method public constructor <init>(Ll/zyh0;Ll/wdf;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;Lcom/google/android/material/tabs/TabLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zyh0$b;->d:Ll/zyh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zyh0$b;->a:Ll/wdf;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zyh0$b;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 6
    .line 7
    iput-object p4, p0, Ll/zyh0$b;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 8
    .line 9
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/zyh0$b;->d:Ll/zyh0;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/zyh0;->c(Ll/zyh0;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, p0, Ll/zyh0$b;->a:Ll/wdf;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/wdf;->j()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p2, p0, Ll/zyh0$b;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iget-object p3, p0, Ll/zyh0$b;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 22
    .line 23
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    if-eqz p3, :cond_1

    .line 28
    .line 29
    iget-object p3, p0, Ll/zyh0$b;->d:Ll/zyh0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/zyh0$b;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 32
    .line 33
    invoke-static {p3, p1, p0, p2}, Ll/zyh0;->e(Ll/zyh0;Ljava/util/List;Lcom/google/android/material/tabs/TabLayout;I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object p2, p0, Ll/zyh0$b;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 38
    .line 39
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iget-object p3, p0, Ll/zyh0$b;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 44
    .line 45
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    if-eqz p3, :cond_2

    .line 50
    .line 51
    iget-object p3, p0, Ll/zyh0$b;->d:Ll/zyh0;

    .line 52
    .line 53
    iget-object p0, p0, Ll/zyh0$b;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 54
    .line 55
    invoke-static {p3, p1, p0, p2}, Ll/zyh0;->e(Ll/zyh0;Ljava/util/List;Lcom/google/android/material/tabs/TabLayout;I)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    return-void
.end method
