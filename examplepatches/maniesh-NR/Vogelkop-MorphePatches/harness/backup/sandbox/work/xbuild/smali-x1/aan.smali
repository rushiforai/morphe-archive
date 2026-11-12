.class public final Laan;
.super Lcan;
.source "SourceFile"


# instance fields
.field public final d:Lyc3;

.field public e:Lz61;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lcan;-><init>()V

    new-instance v0, Lyc3;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lyc3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Laan;->d:Lyc3;

    return-void
.end method


# virtual methods
.method public final e(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 5

    iget-object v0, p0, Laan;->d:Lyc3;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance v0, Lz61;

    new-instance v1, Lz9n;

    invoke-direct {v1, p0, p1}, Lz9n;-><init>(Laan;Landroidx/recyclerview/widget/RecyclerView;)V

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Laan;->e:Lz61;

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_23

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_23
    return-void
.end method

.method public final f(Landroidx/recyclerview/widget/i;)V
    .registers 9

    instance-of v0, p1, Ly9n;

    if-eqz v0, :cond_2e

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, p0, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_e
    const/4 v5, -0x1

    if-ge v4, v2, :cond_24

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    check-cast v6, Lban;

    iget-object v6, v6, Lban;->a:Landroid/view/View;

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_25

    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_24
    move v3, v5

    :cond_25
    if-ne v3, v5, :cond_2e

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p1, Ly9n;

    invoke-virtual {p0, v0, p1}, Lcan;->c(Landroid/view/View;Ly9n;)V

    :cond_2e
    return-void
.end method
