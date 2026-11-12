.class public final Lgvc;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Filterable;


# instance fields
.field public final a:Lbvc;

.field public b:Ljava/util/List;

.field public c:Ljava/util/List;


# direct methods
.method public constructor <init>(Lbvc;Ljava/util/ArrayList;)V
    .registers 4

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lgvc;->b:Ljava/util/List;

    iput-object p1, p0, Lgvc;->a:Lbvc;

    iput-object p2, p0, Lgvc;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final getFilter()Landroid/widget/Filter;
    .registers 2

    new-instance v0, Lc83;

    invoke-direct {v0, p0}, Lc83;-><init>(Lgvc;)V

    return-object v0
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lgvc;->c:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    check-cast p1, Lfvc;

    iget-object p0, p0, Lgvc;->c:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbre;

    iput-object p0, p1, Lfvc;->c:Lbre;

    iget-object p1, p1, Lfvc;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p0}, Lx77;->h(Lbre;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    const p2, 0x7f0d038a

    const/4 v0, 0x0

    invoke-static {p1, p2, p1, v0}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    new-instance p2, Lfvc;

    invoke-direct {p2, p1}, Lfvc;-><init>(Landroid/view/ViewGroup;)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Ljf7;

    const/16 v1, 0x12

    invoke-direct {v0, p0, p2, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2
.end method
