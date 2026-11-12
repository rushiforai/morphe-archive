.class public final Ly4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ly4k;->a:B

    iput-object p1, p0, Ly4k;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(I)V
    .registers 2

    return-void
.end method

.method private final b(I)V
    .registers 2

    return-void
.end method

.method private final c(FII)V
    .registers 4

    return-void
.end method


# virtual methods
.method public final d(I)V
    .registers 3

    iget-object p0, p0, Ly4k;->b:Ljava/lang/Object;

    check-cast p0, Lc5k;

    iget-object p0, p0, Lc5k;->A:Lbx8;

    if-ltz p1, :cond_23

    iget-object v0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_23

    iget-object p0, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzw8;

    iget-object p0, p0, Lzw8;->b:Lxw8;

    if-eqz p0, :cond_23

    iget-object p0, p0, Lxw8;->h:Low8;

    iget-object p0, p0, Lha2;->c:Laan;

    invoke-virtual {p0}, Lcan;->d()V

    :cond_23
    return-void
.end method

.method public final onPageScrollStateChanged(I)V
    .registers 2

    iget-byte p0, p0, Ly4k;->a:B

    return-void
.end method

.method public final onPageScrolled(IFI)V
    .registers 4

    iget-byte p3, p0, Ly4k;->a:B

    packed-switch p3, :pswitch_data_2c

    return-void

    :pswitch_6
    add-int/lit8 p3, p1, -0x1

    invoke-virtual {p0, p3}, Ly4k;->d(I)V

    invoke-virtual {p0, p1}, Ly4k;->d(I)V

    add-int/lit8 p3, p1, 0x1

    invoke-virtual {p0, p3}, Ly4k;->d(I)V

    iget-object p0, p0, Ly4k;->b:Ljava/lang/Object;

    check-cast p0, Lc5k;

    iget-object p3, p0, Lc5k;->t:Lkue;

    iget-object p0, p0, Lc5k;->B:Lcom/opera/android/feed/FeedViewPager;

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_22

    neg-float p2, p2

    :cond_22
    iget-object p0, p3, Lkue;->b:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput p1, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->K0:I

    iput p2, p0, Lcom/opera/android/custom_views/FadingRecyclerView;->L0:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onPageSelected(I)V
    .registers 8

    iget-byte v0, p0, Ly4k;->a:B

    iget-object p0, p0, Ly4k;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_c2

    check-cast p0, Lifm;

    invoke-virtual {p0}, Lifm;->h()Landroidx/viewpager/widget/ViewPager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "page_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    :cond_24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lifm;->w:Ljava/lang/Integer;

    iget-object p0, p0, Lifm;->x:Lkfm;

    if-eqz p0, :cond_30

    iput p1, p0, Lkfm;->r:I

    :cond_30
    return-void

    :pswitch_31
    check-cast p0, Lc5k;

    iget-object v0, p0, Lc5k;->A:Lbx8;

    iget v1, v0, Lbx8;->u:I

    if-eq v1, p1, :cond_c1

    iget-object v1, v0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzw8;

    iget-object v1, v1, Lzw8;->b:Lxw8;

    if-eqz v1, :cond_77

    iget-object v1, v1, Lxw8;->b:Lbwf;

    invoke-virtual {v1}, Lbwf;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lo8k;->b:Lcom/opera/android/BrowserActivity;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v2

    invoke-virtual {v2}, Lfue;->d()V

    iget-object v2, v2, Lfue;->a:Lcue;

    iget-object v3, p0, Lc5k;->X:Lru9;

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v3

    iget-object v4, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const-string v5, "startpage.feed_category_id"

    invoke-interface {v4, v5, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    iget-byte v1, v2, Lcue;->a:B

    const-string v2, "startpage.feed_category_backend"

    invoke-interface {v4, v2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v3}, Lnv6;->w()V

    :cond_77
    iget v1, v0, Lbx8;->u:I

    iget-object v2, v0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    if-ge v1, v2, :cond_87

    iget v1, v0, Lbx8;->u:I

    invoke-virtual {v0, v1, v3}, Lbx8;->b(IZ)V

    :cond_87
    iput p1, v0, Lbx8;->u:I

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lbx8;->b(IZ)V

    iget-object v0, v0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_93
    :goto_93
    if-ge v3, v2, :cond_b1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lzw8;

    iget-object v4, v4, Lzw8;->b:Lxw8;

    if-eqz v4, :cond_93

    const-class v5, Lxw8;

    invoke-virtual {v5, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_93

    iget-object v4, v4, Lxw8;->h:Low8;

    iget-object v4, v4, Lha2;->c:Laan;

    invoke-virtual {v4}, Lcan;->d()V

    goto :goto_93

    :cond_b1
    iget-object v0, p0, Lc5k;->t:Lkue;

    iget-boolean p0, p0, Lc5k;->Z:Z

    xor-int/2addr p0, v1

    invoke-virtual {v0, p1, p0}, Lkue;->b(IZ)V

    new-instance p0, Lir5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    :cond_c1
    return-void

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_31
    .end packed-switch
.end method
