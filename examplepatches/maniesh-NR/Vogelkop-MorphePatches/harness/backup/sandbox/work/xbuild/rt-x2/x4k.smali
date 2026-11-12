.class public final Lx4k;
.super Lgph;
.source "SourceFile"

# interfaces
.implements Le8n;


# instance fields
.field public final a:Lwt3;

.field public b:Low8;

.field public c:Z

.field public d:Z

.field public final synthetic e:Lc5k;


# direct methods
.method public constructor <init>(Lc5k;Lwt3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx4k;->e:Lc5k;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lx4k;->c:Z

    iput-object p2, p0, Lx4k;->a:Lwt3;

    iget-object p1, p1, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lx4k;->j()V

    return-void
.end method

.method public final j()V
    .registers 10

    iget-boolean v0, p0, Lx4k;->c:Z

    if-eqz v0, :cond_95

    iget-object v0, p0, Lx4k;->e:Lc5k;

    invoke-virtual {v0}, Lc5k;->b()Lxw8;

    move-result-object v1

    if-eqz v1, :cond_95

    iget-object v1, v1, Lxw8;->h:Low8;

    iget-boolean v2, p0, Lx4k;->d:Z

    if-eqz v2, :cond_95

    iget-object v0, v0, Lc5k;->k:Lnue;

    invoke-interface {v0}, Lnue;->getVisibility()Lize;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llue;

    invoke-virtual {v0}, Llue;->d()Z

    move-result v0

    if-eqz v0, :cond_95

    iget-object v0, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_2d
    const/4 v6, -0x1

    if-ge v5, v2, :cond_43

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    check-cast v7, Lja2;

    instance-of v8, v7, Lj82;

    if-nez v8, :cond_44

    instance-of v7, v7, Lmq;

    if-nez v7, :cond_44

    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    :cond_43
    move v4, v6

    :cond_44
    if-ne v4, v6, :cond_55

    iget-object v0, p0, Lx4k;->b:Low8;

    if-eq v0, v1, :cond_95

    if-eqz v0, :cond_4f

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    :cond_4f
    iput-object v1, p0, Lx4k;->b:Low8;

    invoke-virtual {v1, p0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void

    :cond_55
    iget-object v0, p0, Lx4k;->a:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwjh;

    iget-object v1, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v1, Lo59;

    if-eqz v1, :cond_7b

    iget-wide v4, v1, Lo59;->j:J

    const-wide/16 v6, -0x1

    cmp-long v2, v4, v6

    if-gtz v2, :cond_7b

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v2, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v2, Lo59;

    iget-wide v6, v2, Lo59;->b:J

    sub-long/2addr v4, v6

    iput-wide v4, v1, Lo59;->j:J

    invoke-virtual {v0}, Lwjh;->p()V

    :cond_7b
    iget-object v0, p0, Lx4k;->b:Low8;

    if-eqz v0, :cond_85

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lx4k;->b:Low8;

    :cond_85
    iget-boolean v0, p0, Lx4k;->c:Z

    if-eqz v0, :cond_95

    new-instance v0, Lmni;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    iput-boolean v3, p0, Lx4k;->c:Z

    :cond_95
    return-void
.end method

.method public final onPageScrollStateChanged(I)V
    .registers 2

    return-void
.end method

.method public final onPageScrolled(IFI)V
    .registers 4

    invoke-virtual {p0}, Lx4k;->j()V

    return-void
.end method

.method public final onPageSelected(I)V
    .registers 2

    invoke-virtual {p0}, Lx4k;->j()V

    return-void
.end method
