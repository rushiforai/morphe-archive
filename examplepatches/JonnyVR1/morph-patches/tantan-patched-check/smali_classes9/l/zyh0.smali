.class public Ll/zyh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:I


# direct methods
.method public constructor <init>(Ll/wdf;Lcom/google/android/material/tabs/TabLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/zyh0;->a:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/zyh0;->b:Z

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/zyh0;->c:Z

    .line 12
    .line 13
    iput v0, p0, Ll/zyh0;->d:I

    .line 14
    .line 15
    new-instance v0, Ll/zyh0$a;

    .line 16
    .line 17
    invoke-direct {v0, p0, p3}, Ll/zyh0$a;-><init>(Ll/zyh0;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, v0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/zyh0$b;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1, p4, p2}, Ll/zyh0$b;-><init>(Ll/zyh0;Ll/wdf;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;Lcom/google/android/material/tabs/TabLayout;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static bridge synthetic a(Ll/zyh0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zyh0;->b:Z

    return p0
.end method

.method public static bridge synthetic b(Ll/zyh0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zyh0;->d:I

    return-void
.end method

.method public static bridge synthetic c(Ll/zyh0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zyh0;->c:Z

    return-void
.end method

.method public static bridge synthetic d(Ll/zyh0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zyh0;->b:Z

    return-void
.end method

.method public static bridge synthetic e(Ll/zyh0;Ljava/util/List;Lcom/google/android/material/tabs/TabLayout;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zyh0;->g(Ljava/util/List;Lcom/google/android/material/tabs/TabLayout;I)V

    return-void
.end method

.method public static bridge synthetic f(Ll/zyh0;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zyh0;->i(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method


# virtual methods
.method public final g(Ljava/util/List;Lcom/google/android/material/tabs/TabLayout;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/android/material/tabs/TabLayout$Tab;",
            ">;",
            "Lcom/google/android/material/tabs/TabLayout;",
            "I)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/zyh0;->a:I

    .line 2
    .line 3
    if-eq v0, p3, :cond_1

    .line 4
    .line 5
    iput p3, p0, Ll/zyh0;->a:I

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/zyh0;->c:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/zyh0;->b:Z

    .line 14
    .line 15
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/zyh0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public final i(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, Ljava/lang/String;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    const-string p1, "tab_source"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_edit_profile_tab_new"

    .line 30
    .line 31
    const-string v0, "p_edit_profile_view"

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
