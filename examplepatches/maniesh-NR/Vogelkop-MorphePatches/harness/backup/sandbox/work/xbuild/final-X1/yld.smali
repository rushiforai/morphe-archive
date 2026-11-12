.class public final Lyld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llig;


# instance fields
.field public final synthetic a:Lzld;


# direct methods
.method public constructor <init>(Lzld;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyld;->a:Lzld;

    return-void
.end method


# virtual methods
.method public final e(J)V
    .registers 4

    iget-object p0, p0, Lyld;->a:Lzld;

    iget-object p0, p0, Lzld;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p1, 0x0

    :goto_5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    if-ge p1, p2, :cond_29

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    check-cast p2, Lcmd;

    if-eqz p2, :cond_26

    iget-object v0, p2, Lcmd;->c:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p2}, Lcmd;->X()V

    :cond_26
    add-int/lit8 p1, p1, 0x1

    goto :goto_5

    :cond_29
    return-void
.end method
