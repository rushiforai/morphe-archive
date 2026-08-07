.class public Ll/fh00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vg00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VList;

.field public d:Landroid/widget/LinearLayout;

.field public e:Ll/vg00;

.field public f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

.field public g:Landroid/view/MenuItem;

.field public h:Ll/qg00;

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/fh00;->i:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/fh00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fh00;->n()V

    return-void
.end method

.method public static synthetic b(Ll/fh00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fh00;->m(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fh00;->k()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gh00;->b(Ll/fh00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hh00;->b(Ll/fh00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Ll/vg60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fh00;->h:Ll/qg00;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qg00;->c:Ll/vg60;

    .line 4
    .line 5
    return-object p0
.end method

.method public f(Ll/vg00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fh00;->e:Ll/vg00;

    .line 2
    .line 3
    return-void
.end method

.method public i(Landroid/view/Menu;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/pfc0;->a:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    sget v0, Ll/hdc0;->M0:I

    .line 13
    .line 14
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/fh00;->g:Landroid/view/MenuItem;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/fh00;->g:Landroid/view/MenuItem;

    .line 27
    .line 28
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/dh00;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/dh00;-><init>(Ll/fh00;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-boolean p1, p0, Ll/fh00;->i:Z

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/fh00;->j(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vg00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fh00;->f(Ll/vg00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fh00;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fh00;->g:Landroid/view/MenuItem;

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
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/fh00;->g:Landroid/view/MenuItem;

    .line 11
    .line 12
    invoke-interface {p0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    xor-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final k()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

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
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    new-instance v0, Ll/mxg;

    .line 12
    .line 13
    iget-object v1, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/mxg;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->H3:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/mxg;->d(I)Ll/mxg;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/mxg;->g(I)Ll/mxg;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->r:I

    .line 31
    .line 32
    new-instance v2, Ll/eh00;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/eh00;-><init>(Ll/fh00;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Ll/mxg;->i(ILjava/lang/Runnable;)Ll/mxg;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/mxg;->show()V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public l(ZLl/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;)V"
        }
    .end annotation

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/fh00;->i:Z

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/fh00;->j(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fh00;->c:Lv/VList;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/fh00;->d:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    xor-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/fh00;->h:Ll/qg00;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/qg00;->t(Ll/vg60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic n()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fh00;->h:Ll/qg00;

    .line 4
    .line 5
    iget-object p0, p0, Ll/qg00;->c:Ll/vg60;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->P2(Ll/vg60;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->C3:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/qg00;

    .line 9
    .line 10
    iget-object v1, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/qg00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/fh00;->h:Ll/qg00;

    .line 16
    .line 17
    iget-object v0, p0, Ll/fh00;->f:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/fh00;->c:Lv/VList;

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ll/fh00;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/fh00;->c:Lv/VList;

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/fh00;->c:Lv/VList;

    .line 35
    .line 36
    iget-object v1, p0, Ll/fh00;->h:Ll/qg00;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/fh00;->c:Lv/VList;

    .line 42
    .line 43
    iget-object p0, p0, Ll/fh00;->h:Ll/qg00;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/widget/AbsListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
