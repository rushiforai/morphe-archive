.class public final Lss1;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;

.field public b:I

.field public c:Z

.field public final d:Lole;


# direct methods
.method public constructor <init>(Ll08;IZLole;)V
    .registers 5

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p1, p0, Lss1;->a:Ljava/util/List;

    iput p2, p0, Lss1;->b:I

    iput-boolean p3, p0, Lss1;->c:Z

    iput-object p4, p0, Lss1;->d:Lole;

    return-void
.end method


# virtual methods
.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lss1;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 10

    check-cast p1, Lrs1;

    iget-object p0, p0, Lss1;->a:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqs1;

    iput-object p0, p1, Lrs1;->c:Lqs1;

    iget-object p2, p1, Lrs1;->d:Lss1;

    iget v0, p2, Lss1;->b:I

    iget v1, p0, Lqs1;->a:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_18

    move v0, v2

    goto :goto_19

    :cond_18
    move v0, v3

    :goto_19
    iget-boolean v1, p0, Lqs1;->c:Z

    if-eqz v1, :cond_23

    iget-boolean p2, p2, Lss1;->c:Z

    if-nez p2, :cond_23

    if-eqz v0, :cond_24

    :cond_23
    move v2, v3

    :cond_24
    iget-boolean p2, p0, Lqs1;->d:Z

    iget-object p1, p1, Lrs1;->b:Lot1;

    iget v1, p0, Lqs1;->b:I

    iget-object v4, p1, Lot1;->a:Lpt1;

    iget-object v5, v4, Lpt1;->e:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v5, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-wide v5, p0, Lqs1;->e:J

    iget-object p0, v4, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    if-eqz p2, :cond_3f

    move p2, v3

    goto :goto_40

    :cond_3f
    move p2, v1

    :goto_40
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object p2

    invoke-virtual {p2, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v4, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    if-nez v2, :cond_59

    move v3, v1

    :cond_59
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, v0}, Lot1;->setChecked(Z)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 3

    new-instance p2, Lot1;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lot1;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    new-instance p1, Lrs1;

    invoke-direct {p1, p0, p2}, Lrs1;-><init>(Lss1;Lot1;)V

    return-object p1
.end method
