.class public Ll/taf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/byd0;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

.field public final d:Ll/ghf;

.field public final e:Landroid/view/View;

.field public f:Landroidx/recyclerview/widget/RecyclerView$t;

.field public g:Z

.field public h:Z

.field public final i:Landroid/content/Context;

.field public j:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;Ll/ghf;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "data_integrity_guide_show_time_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/taf;->a:Ll/byd0;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Ll/taf;->g:Z

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/taf;->h:Z

    .line 43
    .line 44
    iput-object p2, p0, Ll/taf;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 45
    .line 46
    iput-object p3, p0, Ll/taf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 47
    .line 48
    iput-object p4, p0, Ll/taf;->d:Ll/ghf;

    .line 49
    .line 50
    iput-object p5, p0, Ll/taf;->e:Landroid/view/View;

    .line 51
    .line 52
    iput-object p1, p0, Ll/taf;->i:Landroid/content/Context;

    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a(Ll/taf;Landroidx/recyclerview/widget/n;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/taf;->n(Landroidx/recyclerview/widget/n;)V

    return-void
.end method

.method public static synthetic b(Ll/taf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/taf;->o()V

    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic d(Ll/taf;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/taf;->e:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/taf;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/taf;->h:Z

    return p0
.end method

.method public static bridge synthetic f(Ll/taf;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/taf;->g:Z

    return p0
.end method

.method public static bridge synthetic g(Ll/taf;)Landroidx/recyclerview/widget/RecyclerView$t;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/taf;->f:Landroidx/recyclerview/widget/RecyclerView$t;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/taf;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/taf;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/taf;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/taf;->h:Z

    return-void
.end method

.method public static bridge synthetic j(Ll/taf;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/taf;->g:Z

    return-void
.end method

.method public static bridge synthetic k(Ll/taf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/taf;->o()V

    return-void
.end method


# virtual methods
.method public final l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->L()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/taf;->d:Ll/ghf;

    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ll/ghf;->K(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v0

    .line 18
    :goto_0
    if-nez v1, :cond_1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    iput-object p1, p0, Ll/taf;->j:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 22
    .line 23
    new-instance v0, Ll/taf$a;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/taf$a;-><init>(Ll/taf;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/taf;->f:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 29
    .line 30
    iget-object v2, p0, Ll/taf;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/taf$b;

    .line 36
    .line 37
    iget-object v2, p0, Ll/taf;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {v0, p0, v2, p1}, Ll/taf$b;-><init>(Ll/taf;Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$z;->setTargetPosition(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/taf;->a:Ll/byd0;

    .line 50
    .line 51
    invoke-static {}, Ll/pzi0;->o()J

    .line 52
    .line 53
    .line 54
    move-result-wide v1

    .line 55
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p1, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/taf;->e:Landroid/view/View;

    .line 63
    .line 64
    new-instance v1, Ll/qaf;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/qaf;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/taf;->i:Landroid/content/Context;

    .line 73
    .line 74
    new-instance v1, Ll/raf;

    .line 75
    .line 76
    invoke-direct {v1, p0, v0}, Ll/raf;-><init>(Ll/taf;Landroidx/recyclerview/widget/n;)V

    .line 77
    .line 78
    .line 79
    const-wide/16 v2, 0x12c

    .line 80
    .line 81
    invoke-static {p1, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x1

    .line 85
    return p0
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/taf;->j:Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;->J()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic n(Landroidx/recyclerview/widget/n;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/taf;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/taf;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpProfileEditLinearLayoutManager;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$z;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/taf;->e:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/taf;->e:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/taf;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/saf;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/saf;-><init>(Ll/taf;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v2, 0x3e8

    .line 19
    .line 20
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/taf;->a:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Ll/taf;->i:Landroid/content/Context;

    .line 21
    .line 22
    new-instance v1, Ll/paf;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/paf;-><init>(Ll/taf;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public r()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    move-object v2, v0

    .line 4
    move-object v3, v2

    .line 5
    move-object v4, v3

    .line 6
    move v5, v1

    .line 7
    :goto_0
    iget-object v6, p0, Ll/taf;->d:Ll/ghf;

    .line 8
    .line 9
    invoke-virtual {v6}, Ll/ghf;->C()I

    .line 10
    .line 11
    .line 12
    move-result v6

    .line 13
    if-ge v5, v6, :cond_4

    .line 14
    .line 15
    iget-object v6, p0, Ll/taf;->d:Ll/ghf;

    .line 16
    .line 17
    invoke-virtual {v6, v5}, Ll/ghf;->I(I)Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    instance-of v7, v6, Ll/rdf;

    .line 22
    .line 23
    if-eqz v7, :cond_0

    .line 24
    .line 25
    move-object v0, v6

    .line 26
    check-cast v0, Ll/rdf;

    .line 27
    .line 28
    :cond_0
    instance-of v7, v6, Ll/pdf;

    .line 29
    .line 30
    if-eqz v7, :cond_1

    .line 31
    .line 32
    move-object v2, v6

    .line 33
    check-cast v2, Ll/pdf;

    .line 34
    .line 35
    :cond_1
    instance-of v7, v6, Ll/xaf;

    .line 36
    .line 37
    if-eqz v7, :cond_2

    .line 38
    .line 39
    move-object v3, v6

    .line 40
    check-cast v3, Ll/xaf;

    .line 41
    .line 42
    :cond_2
    instance-of v7, v6, Ll/bff;

    .line 43
    .line 44
    if-eqz v7, :cond_3

    .line 45
    .line 46
    check-cast v6, Ll/bff;

    .line 47
    .line 48
    move-object v4, v6

    .line 49
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_4
    invoke-virtual {p0, v0}, Ll/taf;->l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_5
    invoke-virtual {p0, v2}, Ll/taf;->l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_6

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_6
    invoke-virtual {p0, v3}, Ll/taf;->l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_7

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_7
    invoke-virtual {p0, v4}, Ll/taf;->l(Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_8

    .line 78
    .line 79
    :goto_1
    return-void

    .line 80
    :cond_8
    iget-object p0, p0, Ll/taf;->e:Landroid/view/View;

    .line 81
    .line 82
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
