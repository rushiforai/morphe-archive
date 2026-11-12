.class public final Los;
.super Lygc;
.source "SourceFile"

# interfaces
.implements Ld4a;


# static fields
.field public static final d:Lcs;


# instance fields
.field public final b:Lzs;

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcs;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    sput-object v0, Los;->d:Lcs;

    return-void
.end method

.method public constructor <init>(Lzs;Z)V
    .registers 4

    sget-object v0, Los;->d:Lcs;

    invoke-direct {p0, v0}, Lygc;-><init>(Lgyg;)V

    iput-object p1, p0, Los;->b:Lzs;

    iput-boolean p2, p0, Los;->c:Z

    return-void
.end method


# virtual methods
.method public final getItem(I)Le4a;
    .registers 2

    iget-object p0, p0, Lygc;->a:Lxd2;

    iget-object p0, p0, Lxd2;->f:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lts;

    return-object p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 6

    check-cast p1, Lws;

    iget-object v0, p0, Lygc;->a:Lxd2;

    iget-object v0, v0, Lxd2;->f:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lts;

    iput-object p2, p1, Lws;->d:Lts;

    iget-object v0, p1, Lws;->b:Lvs;

    iget-object v1, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setClipToOutline(Z)V

    iget-object v1, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v2, p2, Lts;->a:Lkq8;

    iget-object p2, p2, Lts;->a:Lkq8;

    iget v2, v2, Lkq8;->a:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-boolean p0, p0, Los;->c:Z

    if-eqz p0, :cond_2d

    const v2, 0x7f15026c

    goto :goto_30

    :cond_2d
    const v2, 0x7f15026d

    :goto_30
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextAppearance(I)V

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v2, 0x7f0409c1

    invoke-static {v2, p1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    iget-object p1, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz p0, :cond_54

    const/high16 p0, 0x42f00000    # 120.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    goto :goto_5e

    :cond_54
    const/high16 p0, 0x42c80000    # 100.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    :goto_5e
    new-instance p1, Ljo5;

    const/4 v1, 0x0

    invoke-direct {p1, p0, v1}, Ljo5;-><init>(II)V

    iput p0, p1, Ljo5;->P:I

    iget-object p0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    iget p1, p2, Lkq8;->c:I

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget p2, p2, Lkq8;->b:I

    invoke-static {p2, p1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 3

    new-instance p2, Lws;

    iget-object p0, p0, Los;->b:Lzs;

    invoke-direct {p2, p1, p0}, Lws;-><init>(Landroid/view/ViewGroup;Lzs;)V

    return-object p2
.end method
