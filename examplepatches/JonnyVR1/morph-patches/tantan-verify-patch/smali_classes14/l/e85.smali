.class public Ll/e85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/citytop/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VFrame;

.field public c:Lv/VFrame;

.field public d:Lv/VLinear;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VProgressBar;

.field public h:Lv/VPullUpRecyclerView;

.field public i:Lcom/p1/mobile/putong/core/ui/citytop/a;

.field public j:Landroidx/recyclerview/widget/GridLayoutManager;

.field public k:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e85;->k:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e85;->k:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f85;->b(Ll/e85;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/citytop/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e85;->i:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    return-void
.end method

.method public c(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/e85;->c:Lv/VFrame;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/e85;->d:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/e85;->g:Lv/VProgressBar;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/e85;->h:Lv/VPullUpRecyclerView;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Ll/e85;->c:Lv/VFrame;

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/e85;->d:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/e85;->g:Lv/VProgressBar;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/e85;->h:Lv/VPullUpRecyclerView;

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/e85;->f:Lv/VText;

    .line 49
    .line 50
    const-string p1, "\u6682\u65e0\u65b0\u8bf7\u6c42"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/e85;->d:Lv/VLinear;

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/e85;->g:Lv/VProgressBar;

    .line 65
    .line 66
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/e85;->h:Lv/VPullUpRecyclerView;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/e85;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 12
    .line 13
    new-instance v1, Ll/e85$a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/e85$a;-><init>(Ll/e85;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/e85;->h:Lv/VPullUpRecyclerView;

    .line 22
    .line 23
    iget-object v1, p0, Ll/e85;->j:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/e85;->h:Lv/VPullUpRecyclerView;

    .line 29
    .line 30
    iget-object v1, p0, Ll/e85;->k:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 40
    .line 41
    iget-object v1, p0, Ll/e85;->i:Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->m0()Landroidx/recyclerview/widget/k$e;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/e85;->h:Lv/VPullUpRecyclerView;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/e85;->a:Lv/navigationbar/VNavigationBar;

    .line 56
    .line 57
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/e85;->a:Lv/navigationbar/VNavigationBar;

    .line 65
    .line 66
    sget v0, Ll/gbc0;->b:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/vg60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    :goto_0
    if-lez v1, :cond_2

    .line 11
    .line 12
    const/16 v2, 0x63

    .line 13
    .line 14
    if-le v1, v2, :cond_1

    .line 15
    .line 16
    const-string v2, "99+"

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :goto_1
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "\u57ce\u5e02\u5c01\u9762\u597d\u53cb\u7533\u8bf7\uff08%s\uff09"

    .line 28
    .line 29
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p0, v2}, Ll/e85;->f(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    const-string v2, "\u57ce\u5e02\u5c01\u9762\u597d\u53cb\u7533\u8bf7"

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ll/e85;->f(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :goto_2
    const/4 v2, 0x1

    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    invoke-virtual {p0, v2, v0}, Ll/e85;->c(ZZ)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iget-object v3, p0, Ll/e85;->k:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    iget-object v4, p1, Ll/vg60;->a:Ljava/util/List;

    .line 56
    .line 57
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 60
    .line 61
    invoke-virtual {v3, v4, p1}, Ll/m65;->V(Ljava/util/List;Lcom/p1/mobile/putong/data/Links;)V

    .line 62
    .line 63
    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_4
    move v2, v0

    .line 68
    :goto_3
    invoke-virtual {p0, v0, v2}, Ll/e85;->c(ZZ)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public f(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, "  "

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/e85;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/citytop/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e85;->b(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e85;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
