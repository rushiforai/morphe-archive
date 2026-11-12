.class public final Lm56;
.super Landroid/widget/BaseAdapter;
.source "SourceFile"


# static fields
.field public static final e:Ljava/lang/Object;


# instance fields
.field public final a:Litd;

.field public b:I

.field public c:Z

.field public final d:Landroid/view/LayoutInflater;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lm56;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Litd;Landroid/view/LayoutInflater;)V
    .registers 4

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lm56;->b:I

    iput-object p2, p0, Lm56;->d:Landroid/view/LayoutInflater;

    iput-object p1, p0, Lm56;->a:Litd;

    invoke-virtual {p0}, Lm56;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object v0, p0, Lm56;->a:Litd;

    iget-object v1, v0, Litd;->w:Lptd;

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Litd;->i()V

    iget-object v0, v0, Litd;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_10
    if-ge v3, v2, :cond_20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lptd;

    if-ne v4, v1, :cond_1d

    iput v3, p0, Lm56;->b:I

    return-void

    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_20
    const/4 v0, -0x1

    iput v0, p0, Lm56;->b:I

    return-void
.end method

.method public final b(I)Lptd;
    .registers 3

    iget-object v0, p0, Lm56;->a:Litd;

    invoke-virtual {v0}, Litd;->l()Ljava/util/ArrayList;

    move-result-object v0

    iget p0, p0, Lm56;->b:I

    if-ltz p0, :cond_e

    if-lt p1, p0, :cond_e

    add-int/lit8 p1, p1, 0x1

    :cond_e
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lptd;

    return-object p0
.end method

.method public final c(Lptd;Landroid/view/View;)V
    .registers 6

    iget v0, p1, Lptd;->a:I

    invoke-virtual {p2, v0}, Landroid/view/View;->setId(I)V

    invoke-virtual {p1}, Lptd;->isVisible()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    move v0, v1

    goto :goto_10

    :cond_e
    const/16 v0, 0x8

    :goto_10
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Lptd;->isEnabled()Z

    move-result v0

    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v2, v0, Ljba;

    if-eqz v2, :cond_27

    check-cast v0, Ljba;

    invoke-virtual {v0, v1}, Ljba;->a(Z)V

    :cond_27
    instance-of v0, p2, Lrtd;

    if-eqz v0, :cond_37

    check-cast p2, Lrtd;

    iget-boolean p0, p0, Lm56;->c:Z

    if-eqz p0, :cond_34

    invoke-interface {p2}, Lrtd;->a()V

    :cond_34
    invoke-interface {p2, p1}, Lrtd;->c(Lptd;)V

    :cond_37
    return-void
.end method

.method public final getCount()I
    .registers 2

    iget-object v0, p0, Lm56;->a:Litd;

    invoke-virtual {v0}, Litd;->l()Ljava/util/ArrayList;

    move-result-object v0

    iget p0, p0, Lm56;->b:I

    if-gez p0, :cond_f

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :cond_f
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public final bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0, p1}, Lm56;->b(I)Lptd;

    move-result-object p0

    return-object p0
.end method

.method public final getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8

    invoke-virtual {p0, p1}, Lm56;->b(I)Lptd;

    move-result-object p1

    if-eqz p1, :cond_b

    invoke-interface {p1}, Lmsk;->z()Lff;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    const/4 v1, -0x2

    const/4 v2, -0x1

    if-eqz v0, :cond_2c

    invoke-virtual {v0, p1}, Lff;->d(Lptd;)Landroid/view/View;

    move-result-object p0

    instance-of p1, p3, Landroid/widget/FrameLayout;

    if-eqz p1, :cond_19

    return-object p0

    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    if-eqz p1, :cond_2b

    instance-of p1, p1, Landroid/widget/AbsListView$LayoutParams;

    if-nez p1, :cond_2b

    new-instance p1, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {p1, v2, v1}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2b
    return-object p0

    :cond_2c
    invoke-virtual {p1}, Lptd;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4d

    invoke-virtual {p0, p1, v0}, Lm56;->c(Lptd;Landroid/view/View;)V

    instance-of p0, p3, Landroid/widget/FrameLayout;

    if-eqz p0, :cond_3a

    return-object v0

    :cond_3a
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    if-eqz p0, :cond_4c

    instance-of p0, p0, Landroid/widget/AbsListView$LayoutParams;

    if-nez p0, :cond_4c

    new-instance p0, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {p0, v2, v1}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4c
    return-object v0

    :cond_4d
    sget-object v0, Lm56;->e:Ljava/lang/Object;

    const v1, 0x7f0a0a68

    if-eqz p2, :cond_5a

    invoke-virtual {p2, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v0, :cond_67

    :cond_5a
    const p2, 0x7f0d00e5

    const/4 v2, 0x0

    iget-object v3, p0, Lm56;->d:Landroid/view/LayoutInflater;

    invoke-virtual {v3, p2, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_67
    invoke-virtual {p0, p1, p2}, Lm56;->c(Lptd;Landroid/view/View;)V

    return-object p2
.end method

.method public final isEnabled(I)Z
    .registers 2

    invoke-virtual {p0, p1}, Lm56;->b(I)Lptd;

    move-result-object p0

    invoke-virtual {p0}, Lptd;->isEnabled()Z

    move-result p0

    return p0
.end method

.method public final notifyDataSetChanged()V
    .registers 1

    invoke-virtual {p0}, Lm56;->a()V

    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void
.end method
