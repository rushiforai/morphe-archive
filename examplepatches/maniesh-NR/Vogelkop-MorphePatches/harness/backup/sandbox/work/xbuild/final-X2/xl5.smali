.class public final Lxl5;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Lhxl;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final synthetic b:Lam5;


# direct methods
.method public constructor <init>(Lam5;)V
    .registers 2

    iput-object p1, p0, Lxl5;->b:Lam5;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lxl5;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final G()V
    .registers 3

    iget-object v0, p0, Lxl5;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p0, p0, Lxl5;->b:Lam5;

    iget-object p0, p0, Lam5;->s:Lbf9;

    invoke-virtual {p0}, Lbf9;->u()Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance p0, Lc9;

    const/16 v1, 0x9

    invoke-direct {p0, v1}, Lc9;-><init>(B)V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lxl5;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final getItemId(I)J
    .registers 3

    iget-object p0, p0, Lxl5;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne p1, v0, :cond_b

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_b
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfxl;

    iget-object p0, p0, Lfxl;->a:Lpwl;

    iget-object p0, p0, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    int-to-long p0, p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lxl5;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne p1, p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final i()V
    .registers 1

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 10

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result v0

    if-nez v0, :cond_75

    check-cast p1, Lyl5;

    iget-object p0, p0, Lxl5;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfxl;

    iget-object p2, p1, Lyl5;->d:Landroid/widget/TextView;

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p1, Lyl5;->b:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v2, p0, Lfxl;->a:Lpwl;

    iget-object v3, v2, Lpwl;->e:Ljava/lang/String;

    const-string v4, "mobile"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    const v3, 0x7f0805b4

    goto :goto_2d

    :cond_2a
    const v3, 0x7f080541

    :goto_2d
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v1, p1, Lyl5;->c:Landroid/widget/TextView;

    iget-object v3, v2, Lpwl;->c:Ljava/lang/String;

    iget-object v4, v2, Lpwl;->g:Ljava/util/Date;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p0, p0, Lfxl;->b:Z

    if-eqz p0, :cond_48

    const p0, 0x7f1407ac

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_64

    :cond_48
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result p0

    if-eqz p0, :cond_5d

    const p0, 0x7f140835

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_64

    :cond_5d
    invoke-static {v4}, Laik;->e(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_64
    iget-object p0, v2, Lpwl;->a:Ljava/lang/String;

    iput-object p0, p1, Lyl5;->g:Ljava/lang/String;

    iget-object p0, p1, Lyl5;->e:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p1, Lyl5;->f:Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_75
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 4

    if-nez p2, :cond_a

    new-instance p2, Lyl5;

    iget-object p0, p0, Lxl5;->b:Lam5;

    invoke-direct {p2, p0, p1}, Lyl5;-><init>(Lam5;Landroid/view/ViewGroup;)V

    return-object p2

    :cond_a
    new-instance p0, Lzl5;

    const p2, 0x7f0d00d2

    const/4 v0, 0x0

    invoke-static {p1, p2, p1, v0}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a0261

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Ln42;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Ln42;-><init>(B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p0
.end method

.method public final x(I)V
    .registers 2

    invoke-virtual {p0}, Lxl5;->G()V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final z()V
    .registers 1

    invoke-virtual {p0}, Lxl5;->G()V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method
