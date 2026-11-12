.class public final Lsue;
.super Luue;
.source "SourceFile"

# interfaces
.implements Lya2;


# instance fields
.field public final p:Lrue;

.field public final q:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

.field public final r:Landroid/widget/TextView;

.field public final s:Landroid/widget/ImageView;

.field public final t:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;Luqe;Lvue;Lvue;Ldmg;Lrl3;Lp0c;)V
    .registers 14

    new-instance v0, Lr9i;

    const/16 v5, 0x16

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, p1, v0, p6, p7}, Luue;-><init>(Landroid/view/View;Lr9i;Lrl3;Lp0c;)V

    new-instance p2, Lrue;

    invoke-direct {p2, p0}, Lrue;-><init>(Lsue;)V

    iput-object p2, p0, Lsue;->p:Lrue;

    const p3, 0x7f0a045b

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    iput-object p3, p0, Lsue;->q:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {p3, p2}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    new-instance p2, Lr93;

    const/4 p4, 0x1

    invoke-direct {p2, p0, p4}, Lr93;-><init>(Ljava/lang/Object;B)V

    new-instance p5, Lr2c;

    invoke-direct {p5, p3, p2}, Lr2c;-><init>(Lcom/opera/android/custom_views/LayoutDirectionViewPager;Le8n;)V

    invoke-virtual {p3, p5}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    new-instance p2, Landroid/view/GestureDetector;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p5

    new-instance p6, Lv35;

    const/4 p7, 0x5

    invoke-direct {p6, p0, p7}, Lv35;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, p5, p6}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    new-instance p5, Lvfe;

    invoke-direct {p5, p2, p4}, Lvfe;-><init>(Landroid/view/GestureDetector;B)V

    invoke-virtual {p3, p5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const p2, 0x7f0a045d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lsue;->r:Landroid/widget/TextView;

    const p2, 0x7f0a045e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/tabs/TabLayout;

    const p4, 0x7f0a0460

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Landroid/widget/ImageView;

    iput-object p4, p0, Lsue;->s:Landroid/widget/ImageView;

    const p4, 0x7f0a0461

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lsue;->t:Landroid/widget/ImageView;

    const/4 p0, 0x0

    invoke-virtual {p2, p3, p0}, Lcom/google/android/material/tabs/TabLayout;->m(Landroidx/viewpager/widget/ViewPager;Z)V

    return-void
.end method

.method public static synthetic v0(Lsue;)V
    .registers 1

    invoke-super {p0}, Lgu8;->j0()V

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 4

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object v0

    check-cast v0, Lj82;

    invoke-virtual {v0}, Lja2;->d()Z

    move-result v1

    iget-object v2, p0, Lsue;->q:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    if-eqz v1, :cond_17

    iget-object p0, v0, Lja2;->a:Lu0g;

    const/4 v1, 0x0

    iput-object v1, v0, Lja2;->a:Lu0g;

    invoke-virtual {v2, p0}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    return-void

    :cond_17
    invoke-static {v2}, Lcs5;->W(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lsue;->p:Lrue;

    invoke-virtual {p0}, Lrue;->getCount()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    goto :goto_27

    :cond_26
    const/4 p0, 0x0

    :goto_27
    invoke-virtual {v2, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 3

    invoke-super {p0, p1, p2}, Lgu8;->V(Lja2;Z)V

    if-eqz p2, :cond_6

    return-void

    :cond_6
    iget-object p1, p0, Lsue;->p:Lrue;

    invoke-virtual {p1}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    invoke-virtual {p0}, Lsue;->R()V

    iget-object p1, p0, Lsue;->q:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {p1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result p1

    invoke-virtual {p0, p1}, Lsue;->x0(I)V

    return-void
.end method

.method public final Y()V
    .registers 3

    invoke-super {p0}, Lgu8;->Y()V

    invoke-virtual {p0}, Lsue;->t()V

    sget-object v0, Lyne;->b:Ldeg;

    iget-object v1, p0, Lsue;->s:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Ldeg;->c(Landroid/widget/ImageView;)V

    iget-object p0, p0, Lsue;->t:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Ldeg;->c(Landroid/widget/ImageView;)V

    return-void
.end method

.method public final e0()Loqe;
    .registers 1

    invoke-super {p0}, Luue;->m0()Lmsh;

    move-result-object p0

    check-cast p0, Ljre;

    return-object p0
.end method

.method public final f0()I
    .registers 1

    const p0, 0x7f0a045f

    return p0
.end method

.method public final j0()V
    .registers 1

    return-void
.end method

.method public final m0()Lmsh;
    .registers 1

    invoke-super {p0}, Luue;->m0()Lmsh;

    move-result-object p0

    check-cast p0, Ljre;

    return-object p0
.end method

.method public final t()V
    .registers 3

    new-instance v0, Lu0g;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lsue;->q:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lj82;

    iput-object v0, p0, Lja2;->a:Lu0g;

    return-void
.end method

.method public final w0()Ljre;
    .registers 1

    invoke-super {p0}, Luue;->m0()Lmsh;

    move-result-object p0

    check-cast p0, Ljre;

    return-object p0
.end method

.method public final x0(I)V
    .registers 4

    iget-object v0, p0, Lsue;->r:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    add-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p0, p0, Lsue;->p:Lrue;

    invoke-virtual {p0}, Lrue;->getCount()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f140756

    invoke-virtual {v1, p1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
