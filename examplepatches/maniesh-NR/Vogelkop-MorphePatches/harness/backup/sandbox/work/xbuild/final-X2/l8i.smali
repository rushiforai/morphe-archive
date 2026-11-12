.class public final Ll8i;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lcom/opera/android/view/TouchIgnoringViewPager;

.field public final c:Luqe;

.field public final d:Lghf;

.field public final e:Lq65;

.field public final f:Ljava/util/ArrayList;

.field public g:Z


# direct methods
.method public constructor <init>(Lumi;Lcom/opera/android/view/TouchIgnoringViewPager;Luqe;)V
    .registers 6

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    iput-object p1, p0, Ll8i;->a:Lumi;

    iput-object p2, p0, Ll8i;->b:Lcom/opera/android/view/TouchIgnoringViewPager;

    iput-object p3, p0, Ll8i;->c:Luqe;

    new-instance p1, Lir5;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance p3, Lghf;

    sget-object v0, Lye1;->a:Landroid/view/animation/PathInterpolator;

    invoke-direct {p3, p2, v0}, Lghf;-><init>(Landroidx/viewpager/widget/ViewPager;Landroid/view/animation/PathInterpolator;)V

    iput-object p3, p0, Ll8i;->d:Lghf;

    new-instance p3, Lpjg;

    const/16 v0, 0x1a

    invoke-direct {p3, p0, v0}, Lpjg;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lq65;

    const/4 v1, 0x4

    invoke-direct {v0, p3, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ll8i;->e:Lq65;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Ll8i;->f:Ljava/util/ArrayList;

    const/4 p3, 0x5

    invoke-virtual {p2, p3}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p1}, Landroidx/viewpager/widget/ViewPager;->setPageTransformer(ZLf8n;)V

    new-instance p1, Lr93;

    const/4 p3, 0x2

    invoke-direct {p1, p0, p3}, Lr93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    new-instance p1, Lz61;

    const/16 p3, 0x13

    invoke-direct {p1, p0, p3}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-boolean v0, p0, Ll8i;->g:Z

    if-eqz v0, :cond_4e

    iget-object v0, p0, Ll8i;->b:Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_4e

    iget-object v1, p0, Ll8i;->e:Lq65;

    iget-object v2, v1, Ln1;->b:Ljava/lang/Object;

    check-cast v2, Loml;

    if-nez v2, :cond_4e

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-static {v0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v3

    iget-object v4, p0, Ll8i;->f:Ljava/util/ArrayList;

    const/4 v5, 0x1

    if-eqz v3, :cond_28

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    goto :goto_29

    :cond_28
    move v3, v5

    :goto_29
    invoke-static {v0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_31

    move v4, v5

    goto :goto_37

    :cond_31
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    :goto_37
    const/4 v6, -0x1

    if-eq v2, v6, :cond_3e

    if-eq v2, v4, :cond_3e

    add-int/2addr v2, v5

    goto :goto_3f

    :cond_3e
    move v2, v3

    :goto_3f
    const-wide/16 v4, 0x2

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object p0, p0, Ll8i;->a:Lumi;

    invoke-virtual {v1, p0, v4, v5, v6}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    if-ne v2, v3, :cond_4e

    const/4 p0, 0x0

    invoke-virtual {v0, v3, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_4e
    return-void
.end method

.method public final destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 4

    instance-of p0, p3, Lk8i;

    if-eqz p0, :cond_7

    check-cast p3, Lk8i;

    goto :goto_8

    :cond_7
    const/4 p3, 0x0

    :goto_8
    if-eqz p3, :cond_22

    invoke-virtual {p3}, Lk8i;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    if-eqz p0, :cond_22

    sget-object p2, Lyne;->b:Ldeg;

    invoke-virtual {p2, p0}, Ldeg;->c(Landroid/widget/ImageView;)V

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_22
    return-void
.end method

.method public final finishUpdate(Landroid/view/ViewGroup;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/viewpager/widget/PagerAdapter;->finishUpdate(Landroid/view/ViewGroup;)V

    invoke-virtual {p0}, Ll8i;->a()V

    return-void
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Ll8i;->f:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemPosition(Ljava/lang/Object;)I
    .registers 3

    instance-of v0, p1, Lk8i;

    if-eqz v0, :cond_d

    iget-object p0, p0, Ll8i;->f:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    const/4 p1, -0x1

    if-ne p0, p1, :cond_e

    :cond_d
    const/4 p0, -0x2

    :cond_e
    return p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Ll8i;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lk8i;

    iget-object v0, p0, Ll8i;->b:Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/opera/android/widget/RoundedImageView;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/opera/android/widget/RoundedImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const v2, 0x7f0408df

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0, v0}, Lcom/opera/android/widget/RoundedImageView;->f(II)V

    iget-object v0, p2, Lk8i;->b:Ljava/lang/String;

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v0}, La26;->d0(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_55

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070224

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    new-instance v3, Lga6;

    new-instance v4, Landroid/graphics/Point;

    invoke-direct {v4, v2, v2}, Landroid/graphics/Point;-><init>(II)V

    const/16 v2, 0xb

    invoke-direct {v3, v4, v2}, Lga6;-><init>(Ljava/lang/Object;B)V

    iget v2, v4, Landroid/graphics/Point;->x:I

    iget v4, v4, Landroid/graphics/Point;->y:I

    iget-object p0, p0, Ll8i;->c:Luqe;

    invoke-virtual {p0, v0, v2, v4}, Luqe;->m(Landroid/net/Uri;II)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Llld;

    const/16 v2, 0x15

    invoke-direct {v0, v1, v2}, Llld;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x1

    invoke-static {p0, v1, v3, v2, v0}, Lgu8;->h0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;ZLd94;)V

    :cond_55
    invoke-virtual {p2}, Lk8i;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object p2
.end method

.method public final isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 3

    instance-of p0, p2, Lk8i;

    if-eqz p0, :cond_1a

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p2, Lk8i;

    invoke-virtual {p2}, Lk8i;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method
