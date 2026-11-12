.class public final Ld83;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Filterable;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/util/List;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/opera/android/undo/UndoBar;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ld83;->a:B

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p2, p0, Ld83;->b:Ljava/lang/Object;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p2}, Ln95;->q(Ljava/util/List;)V

    iput-object p2, p0, Ld83;->c:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Ld83;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/TreeSet;

    invoke-direct {p1}, Ljava/util/TreeSet;-><init>()V

    iput-object p1, p0, Ld83;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljh3;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ld83;->a:B

    .line 33
    iput-object p1, p0, Ld83;->f:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    return-void
.end method


# virtual methods
.method public final getFilter()Landroid/widget/Filter;
    .registers 3

    iget-byte v0, p0, Ld83;->a:B

    packed-switch v0, :pswitch_data_1c

    new-instance v0, Lc83;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lc83;-><init>(Landroidx/recyclerview/widget/d;B)V

    return-object v0

    :pswitch_c
    iget-object v0, p0, Ld83;->e:Ljava/lang/Object;

    check-cast v0, Lc83;

    if-nez v0, :cond_1a

    new-instance v0, Lc83;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lc83;-><init>(Landroidx/recyclerview/widget/d;B)V

    iput-object v0, p0, Ld83;->e:Ljava/lang/Object;

    :cond_1a
    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final getItemCount()I
    .registers 2

    iget-byte v0, p0, Ld83;->a:B

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Ld83;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_e
    iget-object p0, p0, Ld83;->c:Ljava/util/List;

    if-nez p0, :cond_14

    const/4 p0, 0x0

    goto :goto_18

    :cond_14
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    :goto_18
    return p0

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 6

    iget-byte v0, p0, Ld83;->a:B

    packed-switch v0, :pswitch_data_66

    check-cast p1, Lmdo;

    iget-object p0, p0, Ld83;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lldo;

    iget-object p2, p1, Lmdo;->b:Lq5g;

    iget-object v0, p2, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p0, Lldo;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p2, Lq5g;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v0, p0, Lldo;->d:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lldo;->a:Ljava/lang/String;

    iput-object p0, p1, Lmdo;->c:Ljava/lang/String;

    return-void

    :pswitch_2a
    check-cast p1, Le83;

    iget-object v0, p0, Ld83;->c:Ljava/util/List;

    if-eqz v0, :cond_64

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lw3g;

    iget-object v0, p0, Ld83;->f:Ljava/lang/Object;

    check-cast v0, Ljh3;

    iget-boolean v0, v0, Ljh3;->u:Z

    new-instance v1, Lnf;

    const/16 v2, 0xe

    invoke-direct {v1, p0, p2, v2}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p1, Le83;->b:Lw3g;

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p2, Lw3g;->c:Ljava/lang/String;

    new-instance v2, Lqxh;

    invoke-direct {v2, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    if-nez v0, :cond_5d

    iget-object p1, p2, Lw3g;->f:Ljava/lang/String;

    new-instance p2, Lqxh;

    invoke-direct {p2, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_5e

    :cond_5d
    const/4 p2, 0x0

    :goto_5e
    invoke-virtual {p0, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {p0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_64
    return-void

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_2a
    .end packed-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    iget-byte p0, p0, Ld83;->a:B

    const/4 p2, 0x0

    packed-switch p0, :pswitch_data_52

    const p0, 0x7f0d049f

    invoke-static {p1, p0, p1, p2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    const p1, 0x7f0a0cff

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p2, :cond_32

    const p1, 0x7f0a0d00

    invoke-static {p1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_32

    new-instance p1, Lq5g;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/16 v1, 0x12

    invoke-direct {p1, p0, p2, v0, v1}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lmdo;

    invoke-direct {p0, p1}, Lmdo;-><init>(Lq5g;)V

    goto :goto_44

    :cond_32
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_44
    return-object p0

    :pswitch_45
    new-instance p0, Le83;

    const v0, 0x7f0d008e

    invoke-static {p1, v0, p1, p2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object p0

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_45
    .end packed-switch
.end method
