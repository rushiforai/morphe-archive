.class public Landroidx/viewpager/widget/ViewPager;
.super Landroid/view/ViewGroup;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/viewpager/widget/ViewPager$k;,
        Landroidx/viewpager/widget/ViewPager$LayoutParams;,
        Landroidx/viewpager/widget/ViewPager$j;,
        Landroidx/viewpager/widget/ViewPager$g;,
        Landroidx/viewpager/widget/ViewPager$SavedState;,
        Landroidx/viewpager/widget/ViewPager$e;,
        Landroidx/viewpager/widget/ViewPager$h;,
        Landroidx/viewpager/widget/ViewPager$i;,
        Landroidx/viewpager/widget/ViewPager$f;
    }
.end annotation


# static fields
.field public static final e0:[I

.field public static final f0:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroidx/viewpager/widget/ViewPager$f;",
            ">;"
        }
    .end annotation
.end field

.field public static final g0:Landroid/view/animation/Interpolator;

.field public static final h0:Landroidx/viewpager/widget/ViewPager$k;


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:F

.field public E:F

.field public F:F

.field public G:F

.field public H:I

.field public I:Landroid/view/VelocityTracker;

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:Z

.field public O:Landroid/widget/EdgeEffect;

.field public P:Landroid/widget/EdgeEffect;

.field public Q:Z

.field public R:Z

.field public S:I

.field public T:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager/widget/ViewPager$i;",
            ">;"
        }
    .end annotation
.end field

.field public U:Landroidx/viewpager/widget/ViewPager$i;

.field public V:Landroidx/viewpager/widget/ViewPager$i;

.field public W:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager/widget/ViewPager$h;",
            ">;"
        }
    .end annotation
.end field

.field public a:I

.field public a0:I

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/viewpager/widget/ViewPager$f;",
            ">;"
        }
    .end annotation
.end field

.field public b0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Landroidx/viewpager/widget/ViewPager$f;

.field public final c0:Ljava/lang/Runnable;

.field public final d:Landroid/graphics/Rect;

.field public d0:I

.field public e:Ld/x/a/a;

.field public f:I

.field public g:I

.field public i:Landroid/os/Parcelable;

.field public j:Ljava/lang/ClassLoader;

.field public k:Landroid/widget/Scroller;

.field public l:Z

.field public m:Landroidx/viewpager/widget/ViewPager$j;

.field public n:I

.field public o:Landroid/graphics/drawable/Drawable;

.field public p:I

.field public q:I

.field public r:F

.field public s:F

.field public t:I

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:I

.field public y:Z

.field public z:Z


# virtual methods
.method public a(II)Landroidx/viewpager/widget/ViewPager$f;
    .registers 12

    new-instance v0, Landroidx/viewpager/widget/ViewPager$f;

    invoke-direct {v0}, Landroidx/viewpager/widget/ViewPager$f;-><init>()V

    iput p1, v0, Landroidx/viewpager/widget/ViewPager$f;->b:I

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    check-cast v1, Ld/k/a/n;

    .line 1
    iget-object v2, v1, Ld/k/a/n;->e:Ld/k/a/o;

    if-nez v2, :cond_17

    iget-object v2, v1, Ld/k/a/n;->c:Ld/k/a/h;

    invoke-virtual {v2}, Ld/k/a/h;->a()Ld/k/a/o;

    move-result-object v2

    iput-object v2, v1, Ld/k/a/n;->e:Ld/k/a/o;

    :cond_17
    int-to-long v2, p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v4

    invoke-static {v4, v2, v3}, Ld/k/a/n;->a(IJ)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Ld/k/a/n;->c:Ld/k/a/h;

    invoke-virtual {v5, v4}, Ld/k/a/h;->a(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v4

    if-eqz v4, :cond_3f

    iget-object p1, v1, Ld/k/a/n;->e:Ld/k/a/o;

    instance-of v5, v1, Le/e/a/k3;

    if-eqz v5, :cond_3a

    instance-of v5, v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    if-eqz v5, :cond_3a

    check-cast v1, Le/e/a/k3;

    check-cast v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    iget-object v5, v1, Le/e/a/k3;->k:Le/e/a/l3/g;

    iput-object v5, v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->a0:Le/e/a/l3/g;

    :cond_3a
    invoke-virtual {p1, v4}, Ld/k/a/o;->a(Landroidx/fragment/app/Fragment;)Ld/k/a/o;

    goto/16 :goto_102

    :cond_3f
    move-object v4, v1

    check-cast v4, Le/e/a/k3;

    .line 2
    iget-object v5, v4, Le/e/a/k3;->j:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/k3$a;

    iget-object v6, v4, Le/e/a/k3;->g:Landroid/content/Context;

    if-nez v6, :cond_56

    new-instance p1, Landroidx/fragment/app/Fragment;

    invoke-direct {p1}, Landroidx/fragment/app/Fragment;-><init>()V

    move-object v4, p1

    goto/16 :goto_f1

    :cond_56
    iget-object v7, v5, Le/e/a/k3$a;->a:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    iget-object v5, v5, Le/e/a/k3$a;->b:Landroid/os/Bundle;

    invoke-static {v6, v7, v5}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/fragment/app/Fragment;

    move-result-object v5

    :try_start_62
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const-string v8, "com.sauzask.nicoid.NicoidVideoPlayerMenuFragment"

    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    if-ne v6, v8, :cond_7f

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 3
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->a0:Le/e/a/l3/g;

    goto/16 :goto_f0

    :cond_7f
    const-string v8, "com.sauzask.nicoid.NicoidVideoInfoFragment"

    .line 4
    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    if-ne v6, v8, :cond_99

    iput p1, v4, Le/e/a/k3;->o:I

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iput-object p1, v4, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object p1, v4, Le/e/a/k3;->l:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    iget-object v6, v4, Le/e/a/k3;->n:Landroid/view/View;

    iput-object v6, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Z:Landroid/view/View;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 5
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    goto :goto_f0

    :cond_99
    const-string p1, "com.sauzask.nicoid.NicoidVideoListFragment"

    .line 6
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_a9

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 7
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->v0:Le/e/a/l3/g;

    goto :goto_f0

    :cond_a9
    const-string p1, "com.sauzask.nicoid.NicoidUserVideoListFragment"

    .line 8
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_b9

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    iget-object v4, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 9
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->c0:Le/e/a/l3/g;

    goto :goto_f0

    :cond_b9
    const-string p1, "com.sauzask.nicoid.NicoidCommentListFragment"

    .line 10
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_d5

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;

    iput-object p1, v4, Le/e/a/k3;->m:Lcom/sauzask/nicoid/NicoidCommentListFragment;

    iget-object p1, v4, Le/e/a/k3;->m:Lcom/sauzask/nicoid/NicoidCommentListFragment;

    iget-object v6, v4, Le/e/a/k3;->k:Le/e/a/l3/g;

    .line 11
    iput-object v6, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->b0:Le/e/a/l3/g;

    .line 12
    iget-object v4, v4, Le/e/a/k3;->p:Le/e/a/v;

    .line 13
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->c0:Le/e/a/v;

    iget-object v4, v4, Le/e/a/v;->e:Le/e/a/g0;

    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidCommentListFragment;->d0:Le/e/a/g0;

    goto :goto_f0

    :cond_d5
    const-string p1, "com.sauzask.nicoid.NicoidNGListFragment"

    .line 14
    invoke-virtual {v7, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    if-ne v6, p1, :cond_f0

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidNGListFragment;

    move-object p1, v5

    check-cast p1, Lcom/sauzask/nicoid/NicoidNGListFragment;

    iget-object v4, v4, Le/e/a/k3;->p:Le/e/a/v;

    .line 15
    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidNGListFragment;->b0:Le/e/a/v;

    iget-object v4, v4, Le/e/a/v;->e:Le/e/a/g0;

    iput-object v4, p1, Lcom/sauzask/nicoid/NicoidNGListFragment;->c0:Le/e/a/g0;
    :try_end_eb
    .catch Ljava/lang/ClassNotFoundException; {:try_start_62 .. :try_end_eb} :catch_ec

    goto :goto_f0

    :catch_ec
    move-exception p1

    .line 16
    invoke-virtual {p1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_f0
    :goto_f0
    move-object v4, v5

    .line 17
    :goto_f1
    iget-object p1, v1, Ld/k/a/n;->e:Ld/k/a/o;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getId()I

    move-result v6

    invoke-static {v6, v2, v3}, Ld/k/a/n;->a(IJ)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v5, v4, v2}, Ld/k/a/o;->a(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Ld/k/a/o;

    :goto_102
    iget-object p1, v1, Ld/k/a/n;->f:Landroidx/fragment/app/Fragment;

    if-eq v4, p1, :cond_11a

    const/4 p1, 0x0

    invoke-virtual {v4, p1}, Landroidx/fragment/app/Fragment;->e(Z)V

    iget v2, v1, Ld/k/a/n;->d:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_117

    iget-object p1, v1, Ld/k/a/n;->e:Ld/k/a/o;

    sget-object v1, Ld/m/e$b;->d:Ld/m/e$b;

    invoke-virtual {p1, v4, v1}, Ld/k/a/o;->a(Landroidx/fragment/app/Fragment;Ld/m/e$b;)Ld/k/a/o;

    goto :goto_11a

    :cond_117
    invoke-virtual {v4, p1}, Landroidx/fragment/app/Fragment;->f(Z)V

    .line 18
    :cond_11a
    :goto_11a
    iput-object v4, v0, Landroidx/viewpager/widget/ViewPager$f;->a:Ljava/lang/Object;

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->e:Ld/x/a/a;

    invoke-virtual {p1}, Ld/x/a/a;->c()F

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, v0, Landroidx/viewpager/widget/ViewPager$f;->d:F

    if-ltz p2, :cond_136

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt p2, p1, :cond_130

    goto :goto_136

    :cond_130
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, p2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_13b

    :cond_136
    :goto_136
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_13b
    return-object v0
.end method
