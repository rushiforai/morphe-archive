.class public final Lfr2;
.super Landroid/widget/ArrayAdapter;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/drawable/Drawable;

.field public final c:Ljava/util/ArrayList;

.field public final synthetic d:Lmr2;


# direct methods
.method public constructor <init>(Lmr2;Landroid/content/Context;)V
    .registers 4

    iput-object p1, p0, Lfr2;->d:Lmr2;

    const p1, 0x7f0d03b6

    invoke-direct {p0, p2, p1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const/high16 p1, 0x41800000    # 16.0f

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lfr2;->a:I

    const p1, 0x7f0804e6

    invoke-static {p1, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lfr2;->b:Landroid/graphics/drawable/Drawable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lfr2;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(I)Lgr2;
    .registers 2

    iget-object p0, p0, Lfr2;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgr2;

    return-object p0
.end method

.method public final areAllItemsEnabled()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b(Ljava/lang/String;)I
    .registers 6

    iget-object p0, p0, Lfr2;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_1c

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgr2;

    iget-object v3, v3, Lgr2;->a:Ljava/lang/String;

    invoke-static {v3, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    return v2

    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1c
    return v1
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Lfr2;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0, p1}, Lfr2;->a(I)Lgr2;

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

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-nez p2, :cond_12

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v2, 0x7f0d03b6

    invoke-virtual {p2, v2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_12
    move-object p3, p2

    check-cast p3, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lfr2;->a(I)Lgr2;

    move-result-object p1

    iget-object v2, p1, Lgr2;->a:Ljava/lang/String;

    const-string v3, "ADD_BUTTON"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_3c

    const v1, 0x7f150279

    invoke-static {p3, v1}, Lxf8;->r0(Landroid/widget/TextView;I)V

    iget-object v1, p0, Lfr2;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3, v1, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget p0, p0, Lfr2;->a:I

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    invoke-static {v0}, Lf03;->C(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_4f

    :cond_3c
    const p0, 0x7f1503d8

    invoke-static {p3, p0}, Lxf8;->r0(Landroid/widget/TextView;I)V

    invoke-virtual {p3, v3, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-static {v0}, Lf03;->D(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setAllCaps(Z)V

    :goto_4f
    iget-object p0, p1, Lgr2;->b:Ljava/lang/CharSequence;

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p2
.end method

.method public final isEnabled(I)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method
