.class public Ll/jr20$d;
.super Landroidx/recyclerview/widget/k$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jr20;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Ll/jr20;


# direct methods
.method public constructor <init>(Ll/jr20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jr20$d;->d:Ll/jr20;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/k$e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$e0;->getItemViewType()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/jr20$d;->d:Ll/jr20;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jr20;->d(Ll/jr20;)Ll/xl80;

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/16 p1, 0xf

    .line 15
    .line 16
    invoke-static {p1, p0}, Landroidx/recyclerview/widget/k$e;->t(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-ge p1, p2, :cond_0

    .line 10
    .line 11
    move p3, p1

    .line 12
    :goto_0
    if-ge p3, p2, :cond_1

    .line 13
    .line 14
    add-int/lit8 v0, p3, 0x1

    .line 15
    .line 16
    iget-object v1, p0, Ll/jr20$d;->d:Ll/jr20;

    .line 17
    .line 18
    iget-object v1, v1, Ll/jr20;->o:Ll/uq20;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-ge v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Ll/jr20$d;->d:Ll/jr20;

    .line 31
    .line 32
    iget-object v1, v1, Ll/jr20;->o:Ll/uq20;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1, p3, v0}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 39
    .line 40
    .line 41
    move p3, v0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move p3, p1

    .line 44
    :goto_1
    if-le p3, p2, :cond_1

    .line 45
    .line 46
    if-lez p3, :cond_1

    .line 47
    .line 48
    iget-object v0, p0, Ll/jr20$d;->d:Ll/jr20;

    .line 49
    .line 50
    iget-object v0, v0, Ll/jr20;->o:Ll/uq20;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/uq20;->f0()Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    add-int/lit8 v1, p3, -0x1

    .line 57
    .line 58
    invoke-static {v0, p3, v1}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 p3, p3, -0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    iget-object p0, p0, Ll/jr20$d;->d:Ll/jr20;

    .line 65
    .line 66
    invoke-static {p0}, Ll/jr20;->d(Ll/jr20;)Ll/xl80;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 71
    .line 72
    .line 73
    const/4 p0, 0x1

    .line 74
    return p0
.end method
