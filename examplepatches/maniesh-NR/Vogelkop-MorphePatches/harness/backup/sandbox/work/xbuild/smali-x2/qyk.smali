.class public final Lqyk;
.super Lcom/opera/android/favorites/FavoriteGridLayoutManager;
.source "SourceFile"


# instance fields
.field public final synthetic m:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Lsyk;Lgw7;Lgw7;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 5

    iput-object p4, p0, Lqyk;->m:Landroidx/recyclerview/widget/RecyclerView;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p3, p1}, Lcom/opera/android/favorites/FavoriteGridLayoutManager;-><init>(Lesk;Lesk;Z)V

    return-void
.end method


# virtual methods
.method public final K(I)V
    .registers 3

    iget v0, p0, Landroidx/recyclerview/widget/CustomGridLayoutManager;->b:I

    if-eq p1, v0, :cond_9

    iget-object v0, p0, Lqyk;->m:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_9
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/CustomGridLayoutManager;->K(I)V

    return-void
.end method
