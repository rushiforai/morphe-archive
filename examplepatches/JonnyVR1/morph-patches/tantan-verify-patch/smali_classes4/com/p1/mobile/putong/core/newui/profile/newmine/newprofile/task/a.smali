.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qni0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VRecyclerView;

.field public c:Lv/VFrame;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

.field public g:Ll/qni0;

.field public h:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u4efb\u52a1\u4e2d\u5fc3"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->a:Lv/navigationbar/VNavigationBar;

    .line 16
    .line 17
    const-string v1, "#f7f7f7"

    .line 18
    .line 19
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gra;->z()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->a:Lv/navigationbar/VNavigationBar;

    .line 33
    .line 34
    sget v2, Ll/ibc0;->G1:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 42
    .line 43
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->h:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b:Lv/VRecyclerView;

    .line 49
    .line 50
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 53
    .line 54
    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 61
    .line 62
    new-instance v2, Landroid/graphics/drawable/shapes/RectShape;

    .line 63
    .line 64
    invoke-direct {v2}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-direct {v0, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 68
    .line 69
    .line 70
    sget v2, Ll/qa00;->j:I

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b:Lv/VRecyclerView;

    .line 87
    .line 88
    new-instance v2, Ll/goi0;

    .line 89
    .line 90
    invoke-direct {v2, v0}, Ll/goi0;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b:Lv/VRecyclerView;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->h:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->f()V

    .line 104
    .line 105
    .line 106
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->f:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rni0;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/qni0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->g:Ll/qni0;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/MyTabTask;",
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->d()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->h:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;->H(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->c:Lv/VFrame;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->d:Lv/VImage;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->d:Lv/VImage;

    .line 24
    .line 25
    sget v1, Ll/dbc0;->df:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e:Lv/VText;

    .line 31
    .line 32
    const-string v0, "\u6682\u65f6\u6ca1\u6709\u66f4\u591a\u4efb\u52a1"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->c:Lv/VFrame;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e:Lv/VText;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->d:Lv/VImage;

    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e:Lv/VText;

    .line 27
    .line 28
    const-string p1, "\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528"

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->c:Lv/VFrame;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->d:Lv/VImage;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->e:Lv/VText;

    .line 24
    .line 25
    const-string v0, "\u52a0\u8f7d\u4e2d..."

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qni0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->b(Ll/qni0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
