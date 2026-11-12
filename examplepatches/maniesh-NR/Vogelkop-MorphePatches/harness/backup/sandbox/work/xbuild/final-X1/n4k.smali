.class public final Ln4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lknf;


# instance fields
.field public final a:Lc5k;

.field public final b:Lh5k;

.field public c:Z

.field public d:Z

.field public e:Landroid/os/Parcelable;

.field public final f:Z

.field public g:Lf1p;


# direct methods
.method public constructor <init>(Lc5k;ZLandroid/os/Parcelable;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln4k;->a:Lc5k;

    iput-object p3, p0, Ln4k;->e:Landroid/os/Parcelable;

    new-instance p3, Lh5k;

    iget-object v0, p1, Lc5k;->e:Lt8k;

    iget-object v0, v0, Lt8k;->c:Ls8k;

    sget-object v1, Ls8k;->a:Ls8k;

    if-eq v0, v1, :cond_14

    sget-object v0, Lyul;->e:Lyul;

    goto :goto_16

    :cond_14
    sget-object v0, Lyul;->d:Lyul;

    :goto_16
    iget-object p1, p1, Lc5k;->V:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llo3;

    iget-boolean p1, p1, Llo3;->a:Z

    if-eqz p1, :cond_25

    sget-object p1, Lp8l;->b:Lp8l;

    goto :goto_27

    :cond_25
    sget-object p1, Lp8l;->a:Lp8l;

    :goto_27
    sget-object v1, Lp8l;->b:Lp8l;

    if-ne p1, v1, :cond_33

    new-instance p1, Lq8l;

    sget-object v2, Ln8l;->a:Ln8l;

    invoke-direct {p1, v1, v2}, Lq8l;-><init>(Lp8l;Luyg;)V

    goto :goto_35

    :cond_33
    sget-object p1, Lq8l;->c:Lq8l;

    :goto_35
    const/4 v1, 0x0

    invoke-direct {p3, v0, p1, v1}, Lh5k;-><init>(Lyul;Lq8l;Z)V

    iput-object p3, p0, Ln4k;->b:Lh5k;

    iput-boolean p2, p0, Ln4k;->f:Z

    return-void
.end method


# virtual methods
.method public final B()Likc;
    .registers 1

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object p0, p0, Lo8k;->a:Lpde;

    return-object p0
.end method

.method public final D()Lq8l;
    .registers 1

    iget-object p0, p0, Ln4k;->b:Lh5k;

    iget-object p0, p0, Lh5k;->d:Ljava/lang/Object;

    check-cast p0, Lq8l;

    return-object p0
.end method

.method public final E()V
    .registers 3

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object v0, p0, Lc5k;->q:Lcv8;

    iget-object v1, v0, Lcv8;->m:Lnjm;

    invoke-virtual {v1}, Lnjm;->a()Z

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcv8;->E:Z

    iget-object p0, p0, Lc5k;->I:Luvl;

    if-eqz p0, :cond_12

    iput-boolean v1, p0, Luvl;->l:Z

    :cond_12
    return-void
.end method

.method public final F()V
    .registers 9

    const/4 v0, 0x1

    iput-boolean v0, p0, Ln4k;->d:Z

    iget-object v1, p0, Ln4k;->a:Lc5k;

    iget-object v2, v1, Lc5k;->g:Lpde;

    sget-object v3, Lng;->a:Lng;

    invoke-virtual {v2, v3}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v2, v1, Lc5k;->A:Lbx8;

    iput-boolean v0, v2, Lbx8;->s:Z

    iget-object v3, v2, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_17
    :goto_17
    if-ge v5, v4, :cond_33

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lzw8;

    iget-object v6, v6, Lzw8;->b:Lxw8;

    if-eqz v6, :cond_17

    const-class v7, Lxw8;

    invoke-virtual {v7, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_17

    iget-boolean v7, v2, Lbx8;->s:Z

    invoke-virtual {v6, v7}, Lxw8;->i(Z)V

    goto :goto_17

    :cond_33
    iget-object v2, v1, Lc5k;->q:Lcv8;

    iget-object v2, v2, Lcv8;->p:Lt5k;

    iget-object v2, v2, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    const-class v3, Le5k;

    invoke-static {v2, v3}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object v2

    invoke-virtual {v2}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_47
    move-object v3, v2

    check-cast v3, Lbmb;

    invoke-virtual {v3}, Lbmb;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5a

    invoke-virtual {v3}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le5k;

    invoke-interface {v3, v0}, Le5k;->p(Z)V

    goto :goto_47

    :cond_5a
    iget-boolean v0, p0, Ln4k;->c:Z

    if-eqz v0, :cond_62

    invoke-virtual {p0}, Ln4k;->g()V

    return-void

    :cond_62
    iget-object p0, p0, Ln4k;->e:Landroid/os/Parcelable;

    invoke-virtual {v1, p0}, Lc5k;->e(Landroid/os/Parcelable;)Landroid/os/Parcelable;

    return-void
.end method

.method public final a()V
    .registers 9

    iget-boolean v0, p0, Ln4k;->c:Z

    if-eqz v0, :cond_b

    iget-boolean v0, p0, Ln4k;->d:Z

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Ln4k;->f()V

    :cond_b
    iget-object v0, p0, Ln4k;->a:Lc5k;

    iget-object v1, v0, Lc5k;->P:Lb5k;

    invoke-virtual {v1}, Lb5k;->b()V

    iget-object v1, v0, Lc5k;->A:Lbx8;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lbx8;->s:Z

    iget-object v3, v1, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v2

    :cond_1e
    :goto_1e
    if-ge v5, v4, :cond_3a

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lzw8;

    iget-object v6, v6, Lzw8;->b:Lxw8;

    if-eqz v6, :cond_1e

    const-class v7, Lxw8;

    invoke-virtual {v7, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_1e

    iget-boolean v7, v1, Lbx8;->s:Z

    invoke-virtual {v6, v7}, Lxw8;->i(Z)V

    goto :goto_1e

    :cond_3a
    iget-object v1, v0, Lc5k;->q:Lcv8;

    iget-object v1, v1, Lcv8;->p:Lt5k;

    iget-object v1, v1, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    const-class v3, Le5k;

    invoke-static {v1, v3}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object v1

    invoke-virtual {v1}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4e
    move-object v3, v1

    check-cast v3, Lbmb;

    invoke-virtual {v3}, Lbmb;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_61

    invoke-virtual {v3}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le5k;

    invoke-interface {v3, v2}, Le5k;->p(Z)V

    goto :goto_4e

    :cond_61
    iget-object v0, v0, Lc5k;->g:Lpde;

    sget-object v1, Log;->a:Log;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iput-boolean v2, p0, Ln4k;->d:Z

    return-void
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final c(Landroid/os/Parcelable;Z)V
    .registers 15

    iget-object v0, p0, Ln4k;->a:Lc5k;

    iget-object v1, v0, Lo8k;->d:Landroid/os/Parcelable;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v1, p1, :cond_b3

    iput-object p1, v0, Lo8k;->d:Landroid/os/Parcelable;

    iget-object v1, v0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    iget-object v4, v0, Lc5k;->G:Laba;

    iget-object v5, v4, Laba;->n:Lk1g;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v5, v5, Lyaa;

    if-nez v5, :cond_19

    iput-boolean v2, v4, Laba;->l:Z

    :cond_19
    invoke-virtual {v4}, Laba;->d()V

    iput-boolean v2, v0, Lc5k;->Z:Z

    invoke-virtual {v0, p1}, Lc5k;->e(Landroid/os/Parcelable;)Landroid/os/Parcelable;

    move-result-object v4

    invoke-virtual {v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v5

    const/4 v6, 0x0

    if-eqz v4, :cond_2e

    invoke-virtual {v1, v4}, Landroidx/viewpager/widget/ViewPager;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto/16 :goto_9e

    :cond_2e
    new-instance v4, Landroidx/viewpager/widget/ViewPager$SavedState;

    sget-object v7, Landroid/view/View$BaseSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    invoke-direct {v4, v7}, Lg3;-><init>(Landroid/os/Parcelable;)V

    iget-object v7, v0, Lc5k;->X:Lru9;

    iget-object v8, v7, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v9, "startpage.feed_category_id"

    invoke-interface {v8, v9, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v7, v7, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v9, "startpage.feed_category_backend"

    const/4 v10, -0x1

    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    if-eqz v8, :cond_63

    iget-object v9, v0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    sget-object v11, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v9}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v9

    check-cast v9, Lcom/opera/android/OperaApplication;

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v9

    invoke-virtual {v9}, Lfue;->d()V

    iget-object v9, v9, Lfue;->a:Lcue;

    iget-byte v11, v9, Lcue;->a:B

    if-eq v11, v7, :cond_65

    move-object v8, v3

    goto :goto_65

    :cond_63
    sget-object v9, Lcue;->b:Lcue;

    :cond_65
    :goto_65
    const-string v7, "position"

    if-nez v8, :cond_7b

    invoke-static {v1}, Lcs5;->W(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_9b

    invoke-virtual {v1, v6}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v4, v8, v7}, Lmzg;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_9b

    :cond_7b
    iget-object v11, v0, Lc5k;->A:Lbx8;

    invoke-virtual {v11, v8}, Lbx8;->a(Ljava/lang/String;)I

    move-result v11

    if-ne v11, v10, :cond_90

    new-instance v7, Lnrl;

    new-instance v10, Lf1p;

    invoke-direct {v10, v9, v8}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v7, v10, v6}, Lnrl;-><init>(Ljava/lang/Object;Z)V

    iput-object v7, v0, Lc5k;->O:Lnrl;

    goto :goto_9b

    :cond_90
    invoke-virtual {v1, v11}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v4, v8, v7}, Lmzg;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    :cond_9b
    :goto_9b
    invoke-virtual {v1, v4}, Landroidx/viewpager/widget/ViewPager;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    :goto_9e
    invoke-virtual {v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v1

    if-ne v5, v1, :cond_b1

    iget-object v4, v0, Lc5k;->t:Lkue;

    invoke-virtual {v4, v1, v6}, Lkue;->b(IZ)V

    new-instance v1, Lir5;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-static {v1}, Lac8;->a(Ljava/lang/Object;)V

    :cond_b1
    iput-boolean v6, v0, Lc5k;->Z:Z

    :cond_b3
    if-eqz p2, :cond_b7

    iput-object v3, p0, Ln4k;->e:Landroid/os/Parcelable;

    :cond_b7
    if-nez p1, :cond_c0

    iget-object p1, p0, Ln4k;->g:Lf1p;

    if-eqz p1, :cond_c0

    invoke-virtual {v0, p1, v2, v2}, Lc5k;->g(Lf1p;ZZ)V

    :cond_c0
    if-eqz p2, :cond_c4

    iput-object v3, p0, Ln4k;->g:Lf1p;

    :cond_c4
    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Ln4k;->c:Z

    iget-boolean v0, p0, Ln4k;->d:Z

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Ln4k;->g()V

    :cond_a
    return-void
.end method

.method public final e()V
    .registers 2

    iget-boolean v0, p0, Ln4k;->d:Z

    if-eqz v0, :cond_b

    iget-boolean v0, p0, Ln4k;->c:Z

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Ln4k;->f()V

    :cond_b
    const/4 v0, 0x0

    iput-boolean v0, p0, Ln4k;->c:Z

    return-void
.end method

.method public final f()V
    .registers 8

    iget-object v0, p0, Ln4k;->a:Lc5k;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    iget-object v2, v0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lex8;

    invoke-direct {v3, v1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    invoke-virtual {v2}, Landroid/view/View;->getScrollY()I

    move-result v1

    iput v1, v3, Lex8;->a:I

    iput-object v3, v0, Lo8k;->d:Landroid/os/Parcelable;

    iput-object v3, p0, Ln4k;->e:Landroid/os/Parcelable;

    iget-object p0, v0, Lc5k;->A:Lbx8;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lbx8;->t:Z

    iget-object v2, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :cond_2b
    :goto_2b
    if-ge v4, v3, :cond_47

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lzw8;

    iget-object v5, v5, Lzw8;->b:Lxw8;

    if-eqz v5, :cond_2b

    const-class v6, Lxw8;

    invoke-virtual {v6, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2b

    iget-boolean v6, p0, Lbx8;->t:Z

    invoke-virtual {v5, v6}, Lxw8;->j(Z)V

    goto :goto_2b

    :cond_47
    iget-object p0, v0, Lc5k;->q:Lcv8;

    iget-object p0, p0, Lcv8;->p:Lt5k;

    new-instance v2, Lnv8;

    invoke-direct {v2, v1}, Lsjm;-><init>(Z)V

    invoke-virtual {p0, v2}, Lha2;->b(Lsjm;)V

    iget-object p0, v0, Lc5k;->L:Lx4k;

    iput-boolean v1, p0, Lx4k;->d:Z

    iget-object p0, p0, Lx4k;->a:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwjh;

    iget-object v2, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v2, Lo59;

    if-eqz v2, :cond_7f

    iget-wide v3, v2, Lo59;->k:J

    const-wide/16 v5, -0x1

    cmp-long v3, v3, v5

    if-gtz v3, :cond_7f

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-object v5, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast v5, Lo59;

    iget-wide v5, v5, Lo59;->b:J

    sub-long/2addr v3, v5

    iput-wide v3, v2, Lo59;->k:J

    sget-object v2, Lie0;->g:Lie0;

    invoke-virtual {p0, v2}, Lwjh;->y(Lie0;)V

    :cond_7f
    iget-object p0, v0, Lc5k;->x:Llv3;

    invoke-virtual {p0, v1}, Llv3;->a(Z)V

    iget-object p0, v0, Lc5k;->f:Lfwf;

    invoke-virtual {p0, v1}, Lfwf;->a(Z)V

    iget-object p0, v0, Lc5k;->G:Laba;

    invoke-virtual {p0}, Laba;->d()V

    const/4 p0, 0x0

    iget-object v0, v0, Lc5k;->K:Lh5k;

    iput-object p0, v0, Lh5k;->b:Ljava/lang/Object;

    return-void
.end method

.method public final g()V
    .registers 9

    iget-object v0, p0, Ln4k;->a:Lc5k;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lc5k;->K:Lh5k;

    iget-object v2, v1, Lh5k;->c:Ljava/lang/Object;

    check-cast v2, Lyul;

    iget-object v3, p0, Ln4k;->b:Lh5k;

    invoke-virtual {v3, v2}, Lh5k;->c(Lyul;)V

    iget-object v2, v1, Lh5k;->d:Ljava/lang/Object;

    check-cast v2, Lq8l;

    invoke-virtual {v3, v2}, Lh5k;->b(Lq8l;)V

    iput-object v3, v1, Lh5k;->b:Ljava/lang/Object;

    iget-object v1, p0, Ln4k;->e:Landroid/os/Parcelable;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Ln4k;->c(Landroid/os/Parcelable;Z)V

    iget-object p0, v0, Lc5k;->f:Lfwf;

    invoke-virtual {p0, v2}, Lfwf;->a(Z)V

    iget-object p0, v0, Lc5k;->A:Lbx8;

    iput-boolean v2, p0, Lbx8;->t:Z

    iget-object v1, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :cond_2f
    :goto_2f
    if-ge v4, v3, :cond_4b

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lzw8;

    iget-object v5, v5, Lzw8;->b:Lxw8;

    if-eqz v5, :cond_2f

    const-class v6, Lxw8;

    invoke-virtual {v6, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_2f

    iget-boolean v6, p0, Lbx8;->t:Z

    invoke-virtual {v5, v6}, Lxw8;->j(Z)V

    goto :goto_2f

    :cond_4b
    iget-object p0, v0, Lc5k;->u:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_66

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {v1, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/4 v4, 0x2

    const-wide/16 v5, 0x1

    invoke-virtual {v1, v4, v2, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_66
    iget-object p0, v0, Lc5k;->q:Lcv8;

    iget-object v1, p0, Lcv8;->p:Lt5k;

    new-instance v3, Lnv8;

    invoke-direct {v3, v2}, Lsjm;-><init>(Z)V

    invoke-virtual {v1, v3}, Lha2;->b(Lsjm;)V

    iget-object p0, p0, Lcv8;->f:Lipk;

    iput-boolean v2, p0, Lipk;->l:Z

    iget-object p0, p0, Lipk;->b:Ljs6;

    invoke-virtual {p0}, Ljs6;->a()V

    iget-object p0, v0, Lc5k;->L:Lx4k;

    iput-boolean v2, p0, Lx4k;->d:Z

    iget-object v1, p0, Lx4k;->a:Lwt3;

    invoke-virtual {v1}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwjh;

    iget-object v3, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v3, Lo59;

    if-eqz v3, :cond_a5

    iget-wide v4, v3, Lo59;->i:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-gtz v4, :cond_a5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v6, v1, Lwjh;->f:Ljava/lang/Object;

    check-cast v6, Lo59;

    iget-wide v6, v6, Lo59;->b:J

    sub-long/2addr v4, v6

    iput-wide v4, v3, Lo59;->i:J

    invoke-virtual {v1}, Lwjh;->p()V

    :cond_a5
    invoke-virtual {p0}, Lx4k;->j()V

    iget-object p0, v0, Lc5k;->x:Llv3;

    invoke-virtual {p0, v2}, Llv3;->a(Z)V

    iget-object p0, v0, Lc5k;->G:Laba;

    iget-object v0, p0, Laba;->n:Lk1g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, v0, Lyaa;

    if-nez v0, :cond_ba

    iput-boolean v2, p0, Laba;->l:Z

    :cond_ba
    invoke-virtual {p0}, Laba;->d()V

    return-void
.end method

.method public final getState()Landroid/os/Parcelable;
    .registers 4

    iget-boolean v0, p0, Ln4k;->c:Z

    if-eqz v0, :cond_26

    iget-boolean v0, p0, Ln4k;->d:Z

    if-eqz v0, :cond_26

    iget-object p0, p0, Ln4k;->a:Lc5k;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    iget-object v1, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lex8;

    invoke-direct {v2, v0}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    move-result v0

    iput v0, v2, Lex8;->a:I

    iput-object v2, p0, Lo8k;->d:Landroid/os/Parcelable;

    return-object v2

    :cond_26
    iget-object p0, p0, Ln4k;->e:Landroid/os/Parcelable;

    return-object p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-boolean p0, p0, Ln4k;->f:Z

    if-eqz p0, :cond_b

    const-string p0, "startpage"

    invoke-static {p0}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    const-string p0, "operaui://feed"

    return-object p0
.end method

.method public final getView()Lcom/opera/android/browser/OperaPageRootView;
    .registers 1

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object p0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object p0, p0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f1410aa

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final o()V
    .registers 1

    iget-object p0, p0, Ln4k;->a:Lc5k;

    invoke-virtual {p0}, Lc5k;->h()V

    return-void
.end method

.method public final q()V
    .registers 4

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object v0, p0, Lc5k;->P:Lb5k;

    invoke-virtual {v0}, Lb5k;->b()V

    invoke-virtual {p0}, Lc5k;->h()V

    iget-object v0, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    iget-object v0, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_24

    iget-object p0, p0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_24
    return-void
.end method

.method public final r()V
    .registers 6

    iget-boolean v0, p0, Ln4k;->c:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Ln4k;->d:Z

    if-nez v0, :cond_e

    :cond_9
    iget-object v0, p0, Ln4k;->e:Landroid/os/Parcelable;

    invoke-virtual {p0, v0, v1}, Ln4k;->c(Landroid/os/Parcelable;Z)V

    :cond_e
    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object v0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_23

    iget-object v0, p0, Lo8k;->a:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmnf;

    invoke-virtual {p0, v0}, Lc5k;->a(Lmnf;)V

    :cond_23
    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object v0

    if-eqz v0, :cond_2e

    iget-object v0, v0, Lxw8;->y:Ls9i;

    invoke-virtual {v0}, Ls9i;->T()V

    :cond_2e
    iget-object v0, p0, Lc5k;->q:Lcv8;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcv8;->E:Z

    iget-object v0, v0, Lcv8;->m:Lnjm;

    invoke-virtual {v0}, Lnjm;->a()Z

    iget-object p0, p0, Lc5k;->I:Luvl;

    if-eqz p0, :cond_94

    iget-object v0, p0, Luvl;->a:Lpt1;

    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-boolean v2, p0, Luvl;->l:Z

    invoke-virtual {p0, v1}, Luvl;->d(Z)V

    iget-object p0, p0, Luvl;->i:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-eqz v1, :cond_94

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_94

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    if-eqz v2, :cond_94

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v3, v4, :cond_6b

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v0, v1, :cond_94

    :cond_6b
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v4

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    add-int/2addr v4, v2

    invoke-virtual {p0, v0, v1, v3, v4}, Landroid/view/View;->layout(IIII)V

    :cond_94
    return-void
.end method

.method public final u()V
    .registers 2

    iget-object p0, p0, Ln4k;->a:Lc5k;

    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_13

    iget-object v0, p0, Lxw8;->j:Lf92;

    iget-object p0, p0, Lxw8;->l:Ljava/lang/Object;

    invoke-virtual {v0}, Lf92;->d()Ld53;

    move-result-object v0

    invoke-virtual {v0, p0}, Ld53;->m(Ljava/lang/Object;)V

    :cond_13
    return-void
.end method

.method public final v(Lw6j;)V
    .registers 3

    new-instance v0, Lrgh;

    invoke-direct {v0, p1, p0}, Lrgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Ln4k;->b:Lh5k;

    iput-object v0, p0, Lh5k;->b:Ljava/lang/Object;

    return-void
.end method

.method public final w()Z
    .registers 1

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object p0, p0, Lc5k;->J:Lv4k;

    iget-boolean p0, p0, Lv4k;->a:Z

    return p0
.end method

.method public final x()Lyul;
    .registers 1

    iget-object p0, p0, Ln4k;->b:Lh5k;

    iget-object p0, p0, Lh5k;->c:Ljava/lang/Object;

    check-cast p0, Lyul;

    return-object p0
.end method

.method public final y()V
    .registers 6

    iget-object p0, p0, Ln4k;->a:Lc5k;

    iget-object v0, p0, Lc5k;->q:Lcv8;

    iget-object v0, v0, Lcv8;->p:Lt5k;

    iget-object v1, v0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    const-class v2, Lzsh;

    invoke-static {v1, v2}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object v1

    invoke-virtual {v1}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_16
    move-object v3, v1

    check-cast v3, Lbmb;

    invoke-virtual {v3}, Lbmb;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-virtual {v3}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzsh;

    invoke-interface {v3}, Lzsh;->c()V

    goto :goto_16

    :cond_29
    iget-object v0, v0, Lha2;->d:Lf1p;

    iget-object v0, v0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-static {v0, v2}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object v0

    invoke-virtual {v0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_37
    move-object v1, v0

    check-cast v1, Lbmb;

    invoke-virtual {v1}, Lbmb;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-virtual {v1}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzsh;

    invoke-interface {v1}, Lzsh;->c()V

    goto :goto_37

    :cond_4a
    invoke-virtual {p0}, Lc5k;->b()Lxw8;

    move-result-object p0

    if-eqz p0, :cond_61

    iget-object v0, p0, Lxw8;->o:Lkue;

    iget-object v0, v0, Lkue;->c:Landroid/view/View;

    invoke-static {v0}, Lq9n;->x(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_5d

    const/4 v0, 0x2

    goto :goto_5e

    :cond_5d
    move v0, v1

    :goto_5e
    invoke-virtual {p0, v0, v1}, Lxw8;->e(IZ)V

    :cond_61
    return-void
.end method

.method public final z()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
