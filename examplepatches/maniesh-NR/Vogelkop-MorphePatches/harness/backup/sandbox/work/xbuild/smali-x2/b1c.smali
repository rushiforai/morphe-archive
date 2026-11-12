.class public final Lb1c;
.super Lygc;
.source "SourceFile"


# instance fields
.field public final b:Lvl9;

.field public c:Ljava/util/Set;

.field public d:Lszb;

.field public final synthetic e:Lf1c;


# direct methods
.method public constructor <init>(Lf1c;)V
    .registers 3

    iput-object p1, p0, Lb1c;->e:Lf1c;

    new-instance p1, Lcs;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Lcs;-><init>(B)V

    invoke-direct {p0, p1}, Lygc;-><init>(Lgyg;)V

    new-instance p1, Lvl9;

    const/16 v0, 0x8

    invoke-direct {p1, p0, v0}, Lvl9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lb1c;->b:Lvl9;

    sget-object p1, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    iput-object p1, p0, Lb1c;->c:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 9

    check-cast p1, Le1c;

    iget-object v0, p0, Lygc;->a:Lxd2;

    iget-object v0, v0, Lxd2;->f:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, La1c;

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {v0}, Ly83;->d(Landroid/view/View;)Ly83;

    move-result-object v0

    iget-object v1, v0, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    iget-object v2, v0, Ly83;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v3, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p2, La1c;->b:Ljava/lang/String;

    iget-boolean v5, p2, La1c;->c:Z

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, p2, La1c;->a:Li0c;

    iget v3, v3, Li0c;->b:I

    if-nez v3, :cond_2f

    const v3, 0x7f1412dd

    goto :goto_32

    :cond_2f
    const v3, 0x7f1412de

    :goto_32
    iget-object v4, v0, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Landroid/widget/TextView;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    if-eqz v5, :cond_4d

    new-instance v3, Ldv2;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v0, p2, v4}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_4e

    :cond_4d
    move-object v3, p1

    :goto_4e
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setEnabled(Z)V

    if-eqz v5, :cond_5d

    new-instance p1, Ljf7;

    const/16 v0, 0xd

    invoke-direct {p1, p0, p2, v0}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    :cond_5d
    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    new-instance p0, Le1c;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-static {p2, p1}, Ly83;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ly83;

    move-result-object p1

    iget-object p2, p1, Ly83;->g:Ljava/lang/Object;

    check-cast p2, Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p1, Ly83;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f080540

    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p2, p1, Ly83;->e:Ljava/lang/Object;

    check-cast p2, Landroid/widget/FrameLayout;

    new-instance v0, Lsma;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object p0
.end method
